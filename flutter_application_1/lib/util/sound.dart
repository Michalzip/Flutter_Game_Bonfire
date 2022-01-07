import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flutter/foundation.dart';

class Audio{

static void backgroundMusicPlay() {
FlameAudio.bgm.initialize();
FlameAudio.bgm.play("bg_music2.mp3",volume:5);
}


static void backgroundMusicStop()  {
FlameAudio.bgm.stop();
}

static void playerDead(){
FlameAudio.audioCache.play("deathPlayerSound.ogg");
}

static void meleAtackPlayer(){
FlameAudio.audioCache.play("meleAtackPlayer.wav",volume:6);
}


static void hitEnemy(){
FlameAudio.audioCache.play("swordM.wav",volume:5);
}

static void interactionWithNpc(){
FlameAudio.audioCache.play("sound_interaction.wav",volume:5);
}
static void deathEnemySound(){
FlameAudio.audioCache.play("monsterDead.wav",volume:5);
}



}