Return-Path: <linuxppc-dev+bounces-9374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C1AD9D70
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 16:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKJMV4tqrz308P;
	Sun, 15 Jun 2025 00:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749910838;
	cv=none; b=gv4ZSvzxsaIQYC/374wn6MzRrXDeB3WmJ8Sr4L6HoKTIxyl37a7YqDksEaWBDZXJOk5n90eZrV8T01wfCa50KQYkpQQQYGc2SYbE4qKPMysgToPbL/Ji2pRbKaZs8JHtdyBw2oz5UPEtcEbdMTISYzXAokN5YFKCQBAItP8W9VlScBCiotgDTzeFStsFifO4r3Ei8skFIXw123trLywf2i2r78wuUGkqLfqT2UeRxHE2sDNaPISbj3UXgh3lnIDo8MuD15eCVbJTz5vVCdVJxzCx/HIDDnchmje5WuaFsuSr4cqOhDylyoOKFDKM+M+OB+el5D7LUYaUXCQaEHvJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749910838; c=relaxed/relaxed;
	bh=HdWyx8goLR45Ww4pWrcgFHEZEIr0UDYTqyXn/UbKGr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9+3S+L4wBrOkkpc3Qt8U89O7BoDXeOcV4ELD5RD8RWix+ELk13q9R6u6bKgpXZtHaGcwV8jUklYGXD70UTVnpysRi0M9iilWajq3RLkvSwAUztfTETCbR+L6tcTVJIua+y/fQPHXaJL8eix1P3WKrtEM2KcFbh0Si1boptDZziONxBCMYKP4pvvD9Jt6lLnDvXwSVvZDO20iLSRCgY7A+aKYe7m+O0aK7m1EQx4qFc3F8qnQomn0mfrpnovwCZ6trt6BcfnnwLU6Sdu6FvaCspYTduF0dmoeyBczlXi3X8SnEZXza42sNW63MQWshlHh0MJ9AVSV2GW8/IKhY6+WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKJMT5BX8z2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 00:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cv5hzLz9st4;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L409-xjRegJR; Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cv4yr6z9st0;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A5CF68B77D;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2HnLZ9cTI1KL; Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE5F8B77B;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 1/4] ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
Date: Sat, 14 Jun 2025 08:43:14 +0200
Message-ID: <f8b77932bb9ce96148ae5c3953e7ee44fa2359f8.1749883041.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883393; l=5425; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5vrwlCVOy4jeGa33bcqO+2rR3nBMx3HvtoPGJ2RWsVU=; b=rwQl9AMrqvh5oH5kZMNKZrKoFsFn3IJbM+1z73rWcyEdrgr7WLHnyshXLGTwKvv3nkI5vm4Ps cMag2oQb0xcBHxFROdgngbmJgC0fIEgl3FGMciwNyxRA4XCPT7uDsLH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In an effort of optimising SNDRV_PCM_IOCTL_SYNC_PTR ioctl which
is a hot path, lets first refactor the copy from and to user
with macros.

This is done with macros and not static inline fonctions because
types differs between the different versions of snd_pcm_sync_ptr()
like functions.

First step is to refactor only snd_pcm_ioctl_sync_ptr_compat() and
snd_pcm_ioctl_sync_ptr_x32() as it would be a performance
regression for snd_pcm_sync_ptr() and snd_pcm_ioctl_sync_ptr_buggy()
for now. They may be refactored after next patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_compat.c | 14 ++------------
 sound/core/pcm_native.c | 42 +++++++++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1da..17540020ac2f 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -418,9 +418,7 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -450,15 +448,7 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	}
 	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	if (put_user(sstatus.state, &src->s.status.state) ||
-	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
-	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
-	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
-	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
-	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    put_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
 		return -EFAULT;
 
 	return 0;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ecb71bf1859d..1f8f6d95b18c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3052,6 +3052,34 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 	return snd_pcm_delay(substream, NULL);
 }
 
+#define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
+	int __err = 0;								\
+	typeof(*(__ptr)) __user *__src = (__ptr);				\
+										\
+	if (get_user(__f, &src->flags) ||					\
+	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
+		__err = -EFAULT;						\
+	__err;									\
+})
+
+#define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
+	int __err = 0;								\
+	typeof(*(__ptr)) __user *__src = (__ptr);				\
+										\
+	if (put_user(__s.state, &__src->s.status.state) ||			\
+	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
+	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
+	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
+	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
+	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
+	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
+	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
+		__err = -EFAULT;						\
+	__err;									\
+})
+
 static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 			    struct snd_pcm_sync_ptr __user *_sync_ptr)
 {
@@ -3165,9 +3193,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -3200,15 +3226,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	}
 	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	if (put_user(sstatus.state, &src->s.status.state) ||
-	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
-	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
-	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
-	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
-	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    put_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
 		return -EFAULT;
 
 	return 0;
-- 
2.47.0


