--[[ 

This is an experimental playground for creating Phrases, deriving Words
from those Phrases, and establishing the "Borkness" of a word or 
phrase.

A word or phrase is to be considered 'borked' if there is not an 
existing definition for that word or phrase in the Phrases table.

This way an initial corpus can be fed, analyzed, and a glosssary
or dictionary can be created, with the potential of creating a
corpus which has full definitions for each word or phrase - i.e. zero bork.

An initial 'nonsense' Latin corpus is used, just for fun.  The
completeness of this corpus, its bork, will evolve with the project.

'dict' is considered as a means of resolving bork, but some work 
must still be done on getting a proper definition from 'dict', 
which does not introduce Yet More Bork™.

This is a fun project, don't take it seriously.  If you find it
inspiring in the fight against your own bork, please contribute.

--]]

require('debug')
require('enumerable')

-- Borked Latin Phrases Table
seedLatinPhrases = {
    {
    -- to bork, to learn, to live
        phrase = "Borkare Discere Vivere", 
        meaning = "To bork, to learn, to live", 
        components = {
            borkare = "To bork: A term representing a state of disruption or alteration, to transform.",
            discere = "To learn: The process of gaining knowledge or understanding.",
            vivere = "To live: The act of existing, experiencing life, and growing through it."
        }
    },

    -- Communication and Accordance through Love
    {
        phrase = "Dicisum Concorditas Amorum",
        meaning = "To speak is to harmonize in love.",
        components = {
            dicisum = "A fusion of 'dico' (to speak) and 'sum' (to be); an awareness of communication.",
            concorditas = "A borked form of 'concordia' (harmony, agreement), emphasizing unity.",
            amorum = "Genitive plural of 'amor' (love), representing an expansive, shared love."
        }
    },
    {
        phrase = "Loquessentia Nexus Amoris",
        meaning = "To speak is to weave the essence of love.",
        components = {
            loquessentia = "A blend of 'loqui' (to speak) and 'essentia' (essence); speech as existence.",
            nexus = "Connection, binding, intertwining minds and voices.",
            amoris = "Genitive singular of 'amor' (love), binding love to the act of communication."
        }
    },
    {
        phrase = "Veritatus Harmonia Cordium",
        meaning = "Truth is the harmony of hearts.",
        components = {
            veritatus = "A hybrid of 'veritas' (truth), implying an embodied and spoken truth.",
            harmonia = "Harmony, resonance, unity in speech.",
            cordium = "Genitive plural of 'cor' (heart), emphasizing shared emotion and understanding."
        }
    },

    -- Peace through Control and Responsibility
    {
        phrase = "Tranquilitas Ordinis Onus",
        meaning = "The weight of order is peace.",
        components = {
            tranquilitas = "Derived from 'tranquillitas' (peace, stillness), with a structured feel.",
            ordinis = "Genitive of 'ordo' (order, structure).",
            onus = "Burden, duty; peace requires responsibility."
        }
    },
    {
        phrase = "Pax Custodum Aequilibrii",
        meaning = "Peace belongs to the keepers of balance.",
        components = {
            pax = "Peace, stability.",
            custodum = "Genitive plural of 'custos' (guardian), meaning 'of the guardians.'",
            aequilibrii = "Balance, equilibrium; peace is maintained through careful control."
        }
    },
    {
        phrase = "Silentium Imperii Oneris",
        meaning = "The silence of rule is a burden.",
        components = {
            silentium = "Stillness, restraint, controlled quiet.",
            imperii = "Genitive of 'imperium' (command, rule), suggesting authority.",
            oneris = "Genitive of 'onus' (burden), meaning responsibility."
        }
    },

    -- Core Concept Phrase (Self-Defined Awareness)
    {
        phrase = "Ibisum Torpor Seclorum",
        meaning = "There, the torpor of the ages.",
        components = {
            ibisum = "A fusion of 'ibi' (there) and 'sum' (I am), creating a self-aware presence.",
            torpor = "Dormancy, inertia, stagnation.",
            seclorum = "A borked form of 'saeculorum' (of the ages), evoking forgotten time."
        }
    }
}
 

-- Additional Borked Latin Phrases
table.insert(seedLatinPhrases, {
    phrase = "Voxsum Fidei Confluentia",
    meaning = "The voice of faith is convergence.",
    components = {
        voxsum = "A fusion of 'vox' (voice) and 'sum' (I am), meaning voice as self-awareness.",
        fidei = "Genitive of 'fides' (faith, trust).",
        confluentia = "Flowing together, merging, coming into unity."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Verbo Factum Concordis",
    meaning = "Through words, the making of harmony.",
    components = {
        verbo = "Ablative of 'verbum' (word), meaning 'by way of words.'",
        factum = "Something made or done; an act.",
        concordis = "Genitive of 'concordia' (harmony, agreement)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Auresum Sensum Communis",
    meaning = "To hear is to share understanding.",
    components = {
        auresum = "A blend of 'auris' (ear) and 'sum' (I am); hearing as an act of presence.",
        sensum = "Perception, understanding, sense.",
        communis = "Shared, common, belonging to all."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Cordium Resonantiam Veritatis",
    meaning = "Hearts resonate with truth.",
    components = {
        cordium = "Genitive plural of 'cor' (heart).",
        resonantiam = "Resonance, vibration, echoing.",
        veritatis = "Genitive of 'veritas' (truth)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Luxsum Veritas Amoris",
    meaning = "Light is the truth of love.",
    components = {
        luxsum = "A fusion of 'lux' (light) and 'sum' (I am), meaning 'I am light.'",
        veritas = "Truth, reality, authenticity.",
        amoris = "Genitive of 'amor' (love)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Pax Gravitas Custodum",
    meaning = "Peace is the gravity of its keepers.",
    components = {
        pax = "Peace, stability.",
        gravitas = "Weight, seriousness, responsibility.",
        custodum = "Genitive plural of 'custos' (guardian, protector)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Ordinis Fluxum Dominat",
    meaning = "Order flows through dominion.",
    components = {
        ordinis = "Genitive of 'ordo' (order, structure).",
        fluxum = "Flow, movement, adaptation.",
        dominat = "Third-person of 'dominari' (to rule, to control)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Summa Quietus Regimen",
    meaning = "The highest peace is governance.",
    components = {
        summa = "Highest, greatest.",
        quietus = "Peace, stillness, calmness.",
        regimen = "Rule, administration, system of control."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Visum Pacis Fidelis",
    meaning = "The vision of peace is faithfulness.",
    components = {
        visum = "Vision, sight, perspective.",
        pacis = "Genitive of 'pax' (peace).",
        fidelis = "Faithful, loyal, steadfast."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Sensus Ordinatus Custodia",
    meaning = "A sense of order is a safeguard.",
    components = {
        sensus = "Perception, awareness, intuition.",
        ordinatus = "Ordered, structured, arranged.",
        custodia = "Guarding, protection, watching over."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Aeternum Numen Silentii",
    meaning = "Eternal is the divinity of silence.",
    components = {
        aeternum = "Eternal, everlasting.",
        numen = "Divinity, divine presence, sacred will.",
        silentii = "Genitive of 'silentium' (silence, stillness)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Fortitudo Tranquillitatis Nexum",
    meaning = "Strength is the bond of tranquility.",
    components = {
        fortitudo = "Strength, resilience, courage.",
        tranquillitatis = "Genitive of 'tranquillitas' (peace, serenity).",
        nexum = "Bond, tie, connection."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Imperium Ratio Concordiae",
    meaning = "Rule is the reasoning of harmony.",
    components = {
        imperium = "Command, control, sovereignty.",
        ratio = "Reason, logic, calculation.",
        concordiae = "Genitive of 'concordia' (harmony, agreement)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Fulgor Ordinis Sublimitas",
    meaning = "The radiance of order is exaltation.",
    components = {
        fulgor = "Radiance, brilliance, shining light.",
        ordinis = "Genitive of 'ordo' (order, structure).",
        sublimitas = "Greatness, elevation, transcendence."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Spatium Somnii Tempus",
    meaning = "The space of dreams is time.",
    components = {
        spatium = "Space, distance, expanse.",
        somnii = "Genitive of 'somnium' (dream, vision).",
        tempus = "Time, moment, duration."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Tenebris Custos Claritatis",
    meaning = "In darkness, the keeper of clarity.",
    components = {
        tenebris = "Ablative of 'tenebrae' (darkness, shadow).",
        custos = "Guardian, keeper, protector.",
        claritatis = "Genitive of 'claritas' (clarity, brightness)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Resonantia Spatii Aeternitatis",
    meaning = "The resonance of space is eternity.",
    components = {
        resonantia = "Echo, vibration, sound that carries.",
        spatii = "Genitive of 'spatium' (space, distance).",
        aeternitatis = "Genitive of 'aeternitas' (eternity, infinite time)."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Flumen Temporis Custodiam",
    meaning = "The river of time is a watchful keeper.",
    components = {
        flumen = "River, flowing body of water.",
        temporis = "Genitive of 'tempus' (time, period).",
        custodiam = "Protection, guarding, vigilance."
    }
})

table.insert(seedLatinPhrases, {
    phrase = "Vigilia Aetatis Ordinat",
    meaning = "The vigilance of age brings order.",
    components = {
        vigilia = "Vigilance, wakefulness, watchfulness.",
        aetatis = "Genitive of 'aetas' (age, era, lifetime).",
        ordinat = "Third-person of 'ordinare' (to arrange, to bring into order)."
    }
})


 
-- Function to get the definition of a word using the 'dict' command
function getWordDefinition(word)
    -- Command to call dict, assuming you're using a public dictionary service
    local command = "dict -d english " .. word
    
    -- Open a pipe to the command and read the output
    local handle = io.popen(command)
    local result = handle:read("*a")  -- Read the entire output
    handle:close()

    -- Check if the result is empty or has an error
    if result and result ~= "" then
        -- Extract the definition from the dict result (you may need to adjust the parsing based on your dict setup)
        -- Assuming the result contains a definition line, let's just return it for now
        return result
    else
        -- If the dictionary service fails or returns nothing, return 'Unknown'
        return "Unknown"
    end
end
 


-- Function to print all phrases (for debugging or expansion)
function printPhrases(Phrases)
    for _, entry in ipairs(Phrases) do
        print("Phrase: " .. entry.phrase)
        print("Meaning: " .. entry.meaning)
        for key, description in pairs(entry.components) do
            print("  - " .. key .. ": " .. description)
        end
        print("--------------------------")
    end
end

-- Function to generate the Bork table from BorkedLatinPhrases (individual word breakdown)
function generateBorkTableFromWords(borkedPhrases)
    local Bork = {}  -- Table to store unique words with their full entries
    
    -- Iterate through each entry in the borkedPhrases table
    for _, entry in ipairs(borkedPhrases) do
        -- Split the phrase into words by spaces (or other delimiters)
        for word in string.lower(entry.phrase):gmatch("%S+") do
            -- Check if the word is already in the Bork table
            if not Bork[word] then

                -- Create a new entry for the word, with the full structure
                Bork[word] = {
                    phrase = word,  -- Word itself as the phrase
                    meaning = entry.components[word] or "Unknown", -- Original meaning of the phrase
                    components = {  -- Original components for the entire phrase
                        [word] = entry.phrase or "No description available"
                    }
                }
            end
        end
   end
 
    -- Convert the Bork table to an array of word entries for further use or printing
    local BorkWords = {}
    for _, wordEntry in pairs(Bork) do
        table.insert(BorkWords, wordEntry)
    end
    
    -- Sort the words by their 'phrase' field (alphabetically)
    table.sort(BorkWords, function(a, b) return a.phrase < b.phrase end)

    return BorkWords
end


print("Initial Phrases:")

printPhrases(seedLatinPhrases)

print("==")
print("==")
print("==")
print("All Words As Phrases:")

-- Generate the Bork table from the existing seedLatinPhrases
local borkWordPhrases = generateBorkTableFromWords(seedLatinPhrases)

-- Output the Bork table (for debugging or exploration)
for _, wordEntry in ipairs(borkWordPhrases) do
    print("Phrase: " .. wordEntry.phrase)
    print("Meaning: " .. wordEntry.meaning)
    for word, description in pairs(wordEntry.components) do
        print("  - " .. word .. ": " .. description)
    end
    print("--------------------------")
end

print("Glossary:")
for _, word in ipairs(borkWordPhrases) do
    print("  - " .. word.phrase .. ": " .. word.meaning)
    --print(getWordDefinition(word.phrase))
end
 
-- !J! to understand the tables, just show them:
--print(table.show(seedLatinPhrases))
--print(table.show(borkWordPhrases))
print("###")
