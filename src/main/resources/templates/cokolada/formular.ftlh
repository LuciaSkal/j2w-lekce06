[#ftl]
[#import "/spring.ftl" as spring]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Obchůdek pro mlsné jazýčky: čokoláda</title>
    <link rel="stylesheet" href="/style.css"/>
</head>
<body>
<div class="container">
    <form class="kosik" action="/cokolada" method="post">
        <h1>Objednávka čokolády</h1>
        <label for="zbozi" class="radek">Zboží:</label>
        [@spring.formSingleSelect path="form.zbozi" options={
        "": "",
        "1": "Bila",
        "2": "Mlecna",
        "3": "Horka",
        "4": "Chilli"
        } /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="jmeno" class="radek">Jméno a příjmení:</label>
        [@spring.formInput path="form.jmeno" /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="email" class="radek">E-mail:</label>
        [@spring.formInput path="form.email" fieldType="email" /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="radek">
            [@spring.formCheckbox path="form.obchodniPodminky" /]
            <label for="obchodniPodminky">Souhlasím s obchodními podmínkami</label>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="radek controls">
            <button type="submit">Objednat</button>
        </div>
        <!--
        Formulář bude obsahovat:
        * výběr z druhů čokolády, např.: mléčná, bíla, hořká (select)
        * Jméno a příjmení (input)
        * e-mail – volitelný údaj (input)
        * souhlas s obchodními podmínkami (check box)
        -->
    </form>
</div>
</body>
</html>
