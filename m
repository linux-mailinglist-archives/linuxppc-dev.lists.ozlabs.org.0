Return-Path: <linuxppc-dev+bounces-9362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A509DAD954C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 21:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJq4653Xjz308P;
	Sat, 14 Jun 2025 05:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749842438;
	cv=none; b=HBDezl445h1gRS5XcA8onXtDVIBHRgFbCVNufyRO6yMPX2XK8czQQkt+tvSvRDJ7//n8GwxIg2Y7Q6XNanq7MUZSrFupj0BmoJsr6Y9q8A2s9Xc/wHgEb69bFKQSHNGtfCE2Cvqz3FzZzz9sz9RFDrfUm5x+EeyzV36a3fcPrVmP/nPT3I9HsVT8Npi0GUxI74K/4qGH0pjHN4nOQgUswe/ix+HhDP5yrJVr06uvTxrii7MQNpPpYwVTFiI8i7kgGY/sL3NBiKzcsKAbCDw8l50CjMhuL3ltHMraYCohzuWMETf1PU6cPWbRT1L4CD+Uv2RA7h8HhYB+IaqTG1p8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749842438; c=relaxed/relaxed;
	bh=5T8Z4pe/dzWJPjpFZUREDwV64RdV7vf+k2elXhY4buk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkvUJKi9k5+u2xDuIunmk6VuCueHPa9NFoIbczflGd/cgb5kEzODvD1NBAhzz4BodLAdmZAripnyNHJ5FOVfqD/f9c+GsFwvWOA3tl98l6Utr8NLdVOE+G/mBNmqXgGl9ukb472NFxPxShYPVI2ecuqRB7+sCwRCSohdBTxdjsT7ZVkfkoYE5s1YDzMfxYmSG34hmKan6ATTX4zQU1V9DMm/S4QIQagoTRZYqDVR3nAjgxEbYcPei4leSU9lMmSbsNGvOD8mVSRU8sVmbHeVQaYQKYO5umKRxDc2SM5mPZ4+k0+9VJEK4TJoQ4sb9/R1RSEBkQs6DlVVB/ZyUyKPiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJq45642Zz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 05:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJk6V0jCdz9swJ;
	Fri, 13 Jun 2025 17:37:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWHcplSs7NHT; Fri, 13 Jun 2025 17:37:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJk6Q4gjTz9st0;
	Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BDA48B769;
	Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Rb6hNhlGZvAw; Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 31AC48B77C;
	Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 4/4] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
Date: Fri, 13 Jun 2025 17:37:11 +0200
Message-ID: <0aff11ade645339ed659f9b97da4e0a535041db3.1749828169.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1749828169.git.christophe.leroy@csgroup.eu>
References: <cover.1749828169.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749829028; l=3615; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VBm68IbYDQlcJwzAKKX7XTkORSsL7QzafbqZ2PWnfeo=; b=ATJzTdt+6UCojlfTymIkOnWF5cTZ9voZv/8igg5qs1ggdznb+SngDRntbXrFW+XzvYR3si2fa JHv/2MQqFYoB2hfSkibeG3oGzi18h3H/QI+dcVKMnZqxORX56ney2Eh
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

snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
wouldn't be straigh-forward due to the workaround it provides.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5ba2fbc0f0f7..b7880ca01cd9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
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
-- 
2.47.0


