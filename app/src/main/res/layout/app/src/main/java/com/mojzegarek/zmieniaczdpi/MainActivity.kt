package com.mojzegarek.zmieniaczdpi // Upewnij się, że to Twoja nazwa pakietu!

import android.os.Bundle
import android.provider.Settings
import android.widget.Button
import android.widget.Toast
import androidx.fragment.app.FragmentActivity

class MainActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button220 = findViewById<Button>(R.id.btn_220)
        val button300 = findViewById<Button>(R.id.btn_300)
        val buttonReset = findViewById<Button>(R.id.btn_reset)

        button220.setOnClickListener { setDensity("220") }
        button300.setOnClickListener { setDensity("300") }
        buttonReset.setOnClickListener { setDensity("reset") }
    }

    private fun setDensity(density: String) {
        try {
            Settings.Global.putString(contentResolver, "display_density_forced", density)
            Toast.makeText(this, "Zmieniono DPI!", Toast.LENGTH_SHORT).show()
            
        } catch (e: SecurityException) {
            e.printStackTrace()
            Toast.makeText(this, "Błąd! Nadaj uprawnienia przez ADB.", Toast.LENGTH_LONG).show()
        }
    }
}
