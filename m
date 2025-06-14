Return-Path: <linuxppc-dev+bounces-9370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F19AD9C14
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 12:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKC2g5j45z30KY;
	Sat, 14 Jun 2025 20:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749896443;
	cv=none; b=NW59dCyZbuMyuCkAieOMlB/M9X9ZCWT6G+GessNdUrFNkp3/R+JXynqcJzWc2uljSrs7CNAoT7Io02Qryvf2iT6XBnWiiVitwpf386+vDS18P1T/K1yzsD+AOdzXJvYhY7Y9lfWkwjhAHj0FEHIOo1YPjXgJilUfPmfdlfFvUM2dZPyVtKLfIoSU2r5yeX3VHyPmvOL7H+q4PSbjE3XWspVCzNsTb+qBQbMjJtveRCJZ0bawPfG5r5Y6+ZiG5UfdCW25aGOpQf4uqRfdqEDUs0WqOarpweFtKF2+qMZ2oJ90QnQy0DqAoXb6e8lpQBl4JQt8u+vnZBVqwyo8CuZXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749896443; c=relaxed/relaxed;
	bh=FQZCWwiYLsOEVvN6R8nLspUVtYxbh4pEn+qxWVorEvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwplnuoeQXw94AePzPohv595/qwFBP5ZtlMpNVxoHvJmi/3WDUB9gNaQico9JGIH7YXm+pW+buga9TXME7owFX1R8Wy+FmcGkdF066lgz/bFYTFPTMENBKgHNFwKYKGL6WwcP61gdnqTS1knhKANejiO7GD0EnrNhkanahtlqaau1owJsoSy/sP02NwboJgKYGcXCg/XIrHWv16cmNDMR1ADLjjXIy4c2s6cowpuhZWxZsIHmBPubPeUV1oLu+FNlw3ZwN6/i4tG58nKrIXSYxPoxdIptcJGWgScNQ4M9ZkyAnr6YJFnDj5Z0kzcBotRm24vxPK7UkTnRP2Wt1wHyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKC2g2DDzz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 20:20:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cy21Trz9syj;
	Sat, 14 Jun 2025 08:43:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7-nfL4VEBL3; Sat, 14 Jun 2025 08:43:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cw6f1Lz9syQ;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF9808B77C;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id IRFdjwNIQ8pl; Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 74BCB8B77B;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 4/4] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
Date: Sat, 14 Jun 2025 08:43:17 +0200
Message-ID: <6ce6bc4da498ea7ea2be5f279b374370b1613b13.1749883041.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1749883041.git.christophe.leroy@csgroup.eu>
References: <cover.1749883041.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883394; l=3615; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jgfZugwghp2JlIjkP+brwrtVHOqmSVyXqYoNE696IOg=; b=BrHy+Chki7RelxAKtji7NaCi7jwbSjSvpGKGmfSim8KyqAAv7OIf2MPyP/hkx4k7Se9m7a3CD z4DXP83zRYVDpUed2aN7gwZfe63dBK9DNNOyybLBgi3u5uqotuftqqU
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
index b7339c9ebb1f..1eab940fa2e5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3096,45 +3096,43 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
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


