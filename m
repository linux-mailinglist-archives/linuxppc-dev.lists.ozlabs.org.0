Return-Path: <linuxppc-dev+bounces-9308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65917AD7014
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 14:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ1ny6RkYz2xQ6;
	Thu, 12 Jun 2025 22:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749730838;
	cv=none; b=Uubas35HT+FCyHOwD1Bb++5gBE3Ee1iNWj6R2XlT2L4G247IHH4YCDikrAfyHWxU7pzFaGt1RBaRPDpBJDsHsENIPtHFLEsn5ldwiU8Fga25de3QCElmm8vuwRYjFc0UY9MsUpST8LV6UnC13aM1XMIrYOrzpD97y7pKqdERj5IsPnIuAcAxu96dL1AsG9VZ2BVYXLSm1IaQV4K1RKkBxQQroIHAWHSNO1k6iROpDomaz10wHpspoDVzNS7Inkp+OfWdKFt8u4bdBA+GRAqK6WpQKokGiQ+9OgUVYJ9jogm03Ag2CQbKH9Jf/65BJyxYI+GHrs2HnruUkfdoSLJnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749730838; c=relaxed/relaxed;
	bh=y/ThQjkna37pkwdyUqbmilHKe0v5sWn9r7OXFt/9xmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijaG7IOIb60DBd/hD6tv4J79JuzJzBNEcOtOeDdLaFDYGDFf6MExDMpZa6RKJAIZXWo26J7rigEcsqXmJcxr17g3mJck2+D3Px/GQXia+o3lyomK8AW2z3gqlDTzCn75pW7ygiDOU4ZiTD3x/mc8bg6xmpCbGR40KuXjCgcwmkQqM/x+QQM5JaDN29HXfIsuGnnm8lSM/kmBBbvCcwoOeKbwy/XIbFgicThMxPPihbvmS+9hstTneRxv12+1mYcORJijIEstS36b/x4nLXMtaftkLSY3GnC9uTe+321koyxjrM0KlzXFRRA2o5pSBTQo3kzfegUlh717vNdARs8BPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ1ny18XTz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 22:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzq30QBmz9st0;
	Thu, 12 Jun 2025 12:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3wENeL0uxzI; Thu, 12 Jun 2025 12:51:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzq02dsNz9sqS;
	Thu, 12 Jun 2025 12:51:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 560198B77B;
	Thu, 12 Jun 2025 12:51:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dOKdbpxMWGQb; Thu, 12 Jun 2025 12:51:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D6C308B769;
	Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
Date: Thu, 12 Jun 2025 12:51:05 +0200
Message-ID: <79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749725467; l=5293; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/ygZKh3s5HqSb8qbAOhYwxhMlcVBJh5c74wEX/ta2i0=; b=PPocy+3Fk/wKMN2l5HyfagLgzOH6RLcqhueK0sOBWR8sNcTdEeGAGRwHyryfleZhgQoulimwG owgwT/WKy9ZDMzrZT0EUSWmYgmipDbq6z90rLtNAlBOujPoR+h1b6zd
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
are converted to user_access_begin/user_access_end(),
snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
followed by a copy_from_user(). And because copy_{to/from}_user() are
generic functions focussed on transfer of big data blocks to/from user,
snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
data.

So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
snd_pcm_sync_ptr() too.

In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
struct __snd_timespec.

snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
wouldn't be straigh-forward do to the workaround it provides.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 52 +++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 554352f546c9..31ddfdb0edfa 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3077,11 +3077,11 @@ failed:										\
 		goto failed;							\
 	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
 	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
-	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
-	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
+	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.tv_sec, failed);		\
+	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp.tv_nsec, failed);		\
 	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
-	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
-	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp.tv_sec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp.tv_nsec, failed);\
 	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
 	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
 	err = 0;								\
@@ -3094,45 +3094,43 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 			    struct snd_pcm_sync_ptr __user *_sync_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_pcm_sync_ptr sync_ptr;
 	volatile struct snd_pcm_mmap_status *status;
 	volatile struct snd_pcm_mmap_control *control;
+	u32 sflags;
+	struct snd_pcm_mmap_control scontrol;
+	struct snd_pcm_mmap_status sstatus;
 	int err;
 
-	memset(&sync_ptr, 0, sizeof(sync_ptr));
-	if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
+	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, _sync_ptr))
 		return -EFAULT;
-	if (copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control), sizeof(struct snd_pcm_mmap_control)))
-		return -EFAULT;	
 	status = runtime->status;
 	control = runtime->control;
-	if (sync_ptr.flags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
+	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
 			return err;
 	}
 	scoped_guard(pcm_stream_lock_irq, substream) {
-		if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL)) {
-			err = pcm_lib_apply_appl_ptr(substream,
-						     sync_ptr.c.control.appl_ptr);
+		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
+			err = pcm_lib_apply_appl_ptr(substream, scontrol.appl_ptr);
 			if (err < 0)
 				return err;
 		} else {
-			sync_ptr.c.control.appl_ptr = control->appl_ptr;
+			scontrol.appl_ptr = control->appl_ptr;
 		}
-		if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
-			control->avail_min = sync_ptr.c.control.avail_min;
+		if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
+			control->avail_min = scontrol.avail_min;
 		else
-			sync_ptr.c.control.avail_min = control->avail_min;
-		sync_ptr.s.status.state = status->state;
-		sync_ptr.s.status.hw_ptr = status->hw_ptr;
-		sync_ptr.s.status.tstamp = status->tstamp;
-		sync_ptr.s.status.suspended_state = status->suspended_state;
-		sync_ptr.s.status.audio_tstamp = status->audio_tstamp;
+			scontrol.avail_min = control->avail_min;
+		sstatus.state = status->state;
+		sstatus.hw_ptr = status->hw_ptr;
+		sstatus.tstamp = status->tstamp;
+		sstatus.suspended_state = status->suspended_state;
+		sstatus.audio_tstamp = status->audio_tstamp;
 	}
-	if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL))
+	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	if (copy_to_user(_sync_ptr, &sync_ptr, sizeof(sync_ptr)))
+	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, _sync_ptr))
 		return -EFAULT;
 	return 0;
 }
@@ -3141,11 +3139,9 @@ struct snd_pcm_mmap_status32 {
 	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
-	s32 tstamp_sec;
-	s32 tstamp_nsec;
+	struct __snd_timespec tstamp;
 	snd_pcm_state_t suspended_state;
-	s32 audio_tstamp_sec;
-	s32 audio_tstamp_nsec;
+	struct __snd_timespec audio_tstamp;
 } __packed;
 
 struct snd_pcm_mmap_control32 {
-- 
2.47.0


