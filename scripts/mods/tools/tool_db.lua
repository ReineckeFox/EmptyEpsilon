db_erase = function()
    science_dbs = {
        queryScienceDatabase("Factions"),
        queryScienceDatabase("Natural"),
        queryScienceDatabase("Ships"),
        queryScienceDatabase("Stations"),
        queryScienceDatabase("Technologies"),
        queryScienceDatabase("Weapons"),
    }
    for _, db in pairs(science_dbs) do
        db:destroy()
    end
end

db_status_report = ScienceDatabase():setName(_('Lagebericht'))
info = db_status_report:addEntry(_('Kalter Krieg'))
info:addKeyValue("Kategorie", "Wert")
info:addKeyValue("Andere Kategorie", "Anderer Wert")
info:setLongDescription(_([[Die Rivalität zwischen der Marsregierung und Terra wuchs im Laufe der Zeit stetig an. Spätestens mit der Unabhängigkeit der ehemals Mars und Terra kontrollierten Asteroidengürtelarbeiter, die sich jetzt Miner nannten, begann ein Wettrüsten um die Kontrolle über die Miner wiederzuerlangen.

Da aber sowohl Mars als auch Terra eine Kontrolle der Miner durch den jeweils anderen nicht zulassen konnte und wollte, gab es hier ein kompliziertes Gleichgewicht aus Abhängigkeit von den Ressourcen und dem Versuch der Machtübernahme über die Miner.]]))
info:setImage("db_pics/mars_landscape_dry_wet.png") -- die Bilddatei wurde manuel hinzugefügt. Im Hauptordner ist neben dem scripts Ordner ein resources Ordner. Dort habe ich der übersicht halber einen Ordner für die Datenbank hinzugeüg und dort das Bild reingeworfen.

db_planets = ScienceDatabase():setName(_('Sonnensystem'))
info = db_planets:addEntry(_('Planeten'))
planeten = info:addEntry(_('01.Terra'))
planeten:addKeyValue("Regierungsform", "Föderale Demokratie")
planeten:setLongDescription(_([[Nach Jahrtausenden des Krieges und der Missgunst unter den Bewohnern der Erde hatte der Aufbruch in den Weltraum und die Besiedlung eines anderen Planeten einen unerwarteten Nebeneffekt. Plötzlich gab es da nicht mehr die Europäer, die Amerikaner und die Asiaten, sondern die von der Erde und die vom Mars! Mit der Emanzipation der Marskolonie zu einem eigenständig lebensfähigen Bereich im SolSystem und damit Verbunden dem Aufkeimen der ersten Anzeichen einer Rivalität, zwischen diesen zwei von Menschen bewohnten Bereiche des Solsystems, reifte die Erkenntnis unter den Erdenbewohnern, dass die Erde geeint auftreten muss, um sich gegen die technisch voranstürmenden Marsbewohner zu behaupten. Auch wenn die alteingesessenen Regierungen den Reifeprozess in den Bevölkerungen der alten Staatensysteme, aufgrund von drohenden Machtverlust, verhindern oder zumindest verlangsamen wollten, konnten Sie letztlich nur zur Kenntnis nehmen, dass die Erde nur vereint bestehen kann. So wurde aus fast 200 nationalen Staaten ein Terra! Eine Weltenregierung mit einem föderalen System von Bereichen auf ihrem Planeten, der Erde.

Das Streben nach dem Weltraum hat die Ressourcen der Erde in einigen wichtigen Bereichen stark minimiert. Um den Anschluss an den Mars nicht zu verlieren wurde das Asteroidenmining von der Terranischen Regierung vorangetrieben. Mit den wichtigen Ressourcen die im Asteroidengürtel, der gleichzeitig die Grenze zwischen dem inneren Solsystems und den Weiten Entfernungen zwischen den äußeren Planeten darstellte, konnte Terra eine Flotte von Raumschiffen etablieren, die zwar nicht die Technische Raffinesse der Marsschiffe aufwies, aber dafür mit einer Zahlenmäßigen Überlegenheit aufwarten konnte.

Die Rivalität zwischen der Marsregierung und Terra wuchs im Laufe der Zeit stetig an. Spätestens mit der Unabhängigkeit der ehemals Mars und Terra kontrollierten Asteroidengürtelarbeiter, die sich jetzt Miner nannten,  begann ein Wettrüsten um die Kontrolle über die Miner wiederzuerlangen. Da aber sowohl Mars als auch Terra eine Kontrolle der Miner durch den jeweils anderen nicht zulassen konnte und wollte, gab es hier ein kompliziertes Gleichgewicht aus Abhängigkeit von den Ressourcen und dem Versuch der Machtübernahme über die Miner. Bei diesem Wettrüsten kommt der Terranischen Regierung mit ihren fast 10 Milliarden Erdenbewohnern ein fast unerschöpflicher Nachschub an Weltraumfahrern zugute. Eine quantitativ hohe Zahl an Raumschiffen ist das Ergebnis.

Beim Thema Forschung hat sich Terra auf das Reengeeniering von Mars Technologie konzentriert.

Im Laufe der Kolonialisierung des Mars wurden natürlich die klügsten und innovativsten Menschen zum Mars geschickt. Dies führte dazu, dass Terra im Bereich der Hochtechnologie und Grundlagenforschung gegenüber dem Mars deutlich an Boden verloren hat. Auch wenn die Gerüchte von Spionage und Sabotage durch Mars auf Terra immer wieder aufkochten, war es doch letztendlich der Wissensverlust (der sogenannte Braindrain) durch die Koloniealisierung des Mars, der dafür sorgte das die Erde den Anschluss an die technologischen Entwicklungen auf dem Mars verlor.

Die föderalen Gebiete (ehemals Staaten) wählen eine Vertretung. Aus den Vertretungen eines Kontinentes werden die Mitglieder der Generalvertretung gewählt. Diese repräsentieren einen Kontinent. Die Generalvertretungen wählen die Mitglieder der terranischen Regierung. Die Regierung wird geführt vom Senat. Dieser setzt sich aus je einem Mitglied jedes Kontinentes zusammen. Der Vorsitz wechselt jährlich. ]]))

planeten = info:addEntry(_('02.Mars'))
planeten:addKeyValue("Regierungsform", "Senat")
planeten:setLongDescription(_([[Der Beginn der Kolonialisierung war wie ein Rausch! Die klügsten und innovativsten Köpfe der Erde machten sich endlich auf den Weg einen neuen Planeten zu erobern. Neueste Materialien, neueste Verfahren und die neuesten Technologien waren nötig, um der Menschheit auf dem Mars ein dauerhaftes Zuhause zu bieten. Mit weit verzweigten Tunnelsystemen tief im Marsinneren und riesigen Geodätischen Kuppeln wurde das Leben auf dem Mars immer angenehmer und bald waren die Bewohner des Mars in der Lage sich von der Lebensader zur Erde zu befreien und mit eigenen Ressourcen und aus eigener Kraft überleben zu können.

Mit der Abnabelung von der Mutter Erde kam die Emanzipation als eignes Volk. Die Bewohner des Mars bildeten eine eigene Marsregierung die fortan die Interessen des Mars gegenüber der gleichzeitig gebildeten Terraregierung vertrat. Die Regierung des Mars war zusammengesetzt aus Technokraten und hatte neben dem Hauptziel, das Überleben der Bewohner des Mars sicherzustellen, vor allem den technologischen Fortschritt im Blick. Ohne die Altlasten der Erdenbewohner und mit den klügsten Köpfen der Menschheit ausgestattet gelang es Mars Technologien und Werkstoffe zu entwickeln, die seinen Vorsprung gegenüber der Erde massiv ausbaute.

Mit dem technologischen Vorsprung aber trat auch eine gewisse zunehmende Überheblichkeit der Marsbewohner gegenüber den anderen Menschen im Solsystem zutage. Fast schon an Rassismus gegenüber nicht Marsianern grenzende Ansichten wurden salonfähig und fanden Einzug in die Kommunikation mit Terra und der neugegründeten Fraktion der Miner, oder der "Genossen", wie man sie auf dem Mars durchaus herabwürdigend nannte.

Der Mars hatte, obwohl technologisch den anderen Fraktionen haushoch überlegen, immer das Problem der geringen Anzahl seiner Einwohner. So war es nur natürlich, das die Flotte des Mars aus wenigen, dafür aber umso potenteren Schiffen bestand. Mit einer geringen Crew und der Zuhilfenahme von weit entwickelter KI entstanden Raumschiffe mit gewaltiger Feuerkraft und Schilden, die zu den Stärksten zählen, was das Solsystem zu bieten hat. Ein Schlachtschiff der Marsflotte kann es leicht mit einem ganzen Schwarm von Schiffen der terranischen Flotte aufnehmen.

Der Nachteil der großen Schiffe war natürlich der enorme Ressourcenverbrauch bei seiner Herstellung und beim Betrieb dieser Giganten. Dabei wird auch immer hoher Wert auf die Bequemlichkeit und den Schutz der Crewmitglieder gelegt, denn der Verlust eines Schiffes wiegt bei Weitem nicht so schwer wie der Verlust einer Crew!

Der Mars betreibt aktive Abwerbeversuche bei Ingenieuren und Wissenschaftlern von Terra und den Minern. Mars steht im Verdacht durch Spionage und Sabotage vor allem die technologische Entwicklung von Terra aktiv zu stören. ]]))


--mission_data = ScienceDatabase():setName(_('Mission data'))
--item = mission_data:addEntry(_('Kessler Syndrome'))
--ScienceDatabase:setLongDescription(string text)
--ScienceDatabase:setImage(string path)
--ScienceDatabase:addKeyValue(string key, string value)
--addGMMessage(mission_data:getEntryByName('Kessler Syndrome'):getName())
--for k,v in pairs(science_db:getEntries()) do
    --addGMMessage(v:getName())
    --v:destroy()
    --addGMMessage(k,v)
--end