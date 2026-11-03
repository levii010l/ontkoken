document.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.btn');
    const recipeForm = document.getElementById('recipe-form');
    const formMessage = document.getElementById('form-message');
    const recipeList = document.getElementById('recipe-list');

    buttons.forEach((button) => {
        button.addEventListener('click', () => {
            const currentText = button.textContent.trim();
            if (currentText.includes('Bekijk') || currentText.includes('Ontdek')) {
                button.classList.add('pulse');
                setTimeout(() => button.classList.remove('pulse'), 400);
            }
        });
    });

    function renderRecipes(items) {
        if (!recipeList) return;

        if (!items || items.length === 0) {
            recipeList.innerHTML = '<p class="empty-state">Nog geen recepten opgeslagen. Deel jouw eerste recept hierboven.</p>';
            return;
        }

        recipeList.innerHTML = items.map((recipe) => {
            const image = recipe.afbeelding_url || 'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=80';
            const description = recipe.beschrijving || 'Heerlijk recept om zelf te proberen.';
            const prepTime = recipe.bereidingstijd || 30;
            const servings = recipe.porties || 2;

            return `
                <article class="card">
                    <div class="card-image" style="background-image: url('${image}'); background-size: cover; background-position: center;"></div>
                    <div class="card-body">
                        <span class="tag">Zelf gedeeld</span>
                        <h3>${recipe.naam}</h3>
                        <p>${description}</p>
                        <div class="card-footer">
                            <span>${prepTime} min</span>
                            <span>${servings} pers.</span>
                        </div>
                    </div>
                </article>
            `;
        }).join('');
    }

    async function loadRecipes() {
        try {
            const response = await fetch('api/recipes.php');
            const data = await response.json();

            if (!response.ok || !data.success) {
                renderRecipes([]);
                return;
            }

            renderRecipes(data.items || []);
        } catch (error) {
            renderRecipes([]);
        }
    }

    if (recipeForm) {
        recipeForm.addEventListener('submit', async (event) => {
            event.preventDefault();
            const formData = new FormData(recipeForm);

            formMessage.textContent = 'Opslaan...';
            formMessage.className = 'form-message';

            try {
                const response = await fetch('save_recipe.php', {
                    method: 'POST',
                    body: new URLSearchParams(formData).toString(),
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                    }
                });

                const result = await response.json();

                if (!response.ok || !result.success) {
                    formMessage.textContent = result.message || 'Opslaan is mislukt.';
                    formMessage.classList.add('error');
                    return;
                }

                formMessage.textContent = result.message;
                formMessage.classList.add('success');
                recipeForm.reset();
                await loadRecipes();
            } catch (error) {
                formMessage.textContent = 'Er ging iets mis bij het opslaan.';
                formMessage.classList.add('error');
            }
        });
    }

    loadRecipes();
});
