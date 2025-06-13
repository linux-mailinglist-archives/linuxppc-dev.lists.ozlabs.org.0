Return-Path: <linuxppc-dev+bounces-9360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D477AD93AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 19:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJmPd4fLfz2yb9;
	Sat, 14 Jun 2025 03:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749835237;
	cv=none; b=B7K+ss+Dw0lvZ4XNdQL6LBkNDePW1f2ES8u7ds2a1HzC8dQUH7ZQ9shXZnQsZMeAJqikjTL5U2c4MxUiNm0vJU7X/HVDV6XPID0Kv1eXemj9ZbR+qQZJnO51oXkw0hA6EC3DJi7YEqnbXbZ2MHnoBo181iNbf7vZoctWt9k9v+kjEhK4AxMD+nMkcYaJWpKL3qop/qRSFZi94H8Tx8gLZzqSVzBRi6CDh+/LyK6Hi1UlgaDXhWyjTL8wNTH2VIYcuI/iVuGSjPTdmWDPNq+elMuey33QBlc9outct2rCaHcZGnWXIoGYyd1PRpdD7k/0GS0SGRyUBuFLFLdER8EsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749835237; c=relaxed/relaxed;
	bh=BQ0W50GZGXpqMOOvqhp6hCj4HUMu7b0ehrG2Cg3391o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmH8xZKWzxNQ/81ctnXYs03V/R6ManmlT7KdMy0DUDTOgE1KU0jsk1M/iEfURf0+3FFzx/3hvwmuQh/Abb07rY99dUlj7IiZdpVFunqAe7/jG9MJjoFqEn030orOcPhoLJYN7T1o+6YCYNjWT7SJk2Xp3pmR+puMvM/8mRO3+aaSUHqiAqrCLqV5aHjLt7S1WUsHasClp0InQ+t3Rsqv7BVYXQDug2/eOwivd5sSnXW+AUNirNMRPqWhy8cykCdLWTnxMRjD3eIo0Kk6fh3YBR1AD6h+ZMgmB7oqC5Uo7nGHlCx1hfJdbPn65WYjrKrV3NSNvW9zaQ0y94tbiVaYuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJmPc6gVhz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 03:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJk6Q27zXz9ssb;
	Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EousmuU7QcO6; Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJk6P2lTwz9sqT;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 59E238B77C;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id saUuz8-oaz9r; Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E268C8B77B;
	Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/4] ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
Date: Fri, 13 Jun 2025 17:37:08 +0200
Message-ID: <1ae442f2df889ad5cc90297ad38503cd1e6cf457.1749828169.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749829028; l=5427; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Td6hiZXhhqoBLfs3QmUNs9jotqLzTXOjBxWUYpRWpLs=; b=YZdzXs8CDghpeoQcKRKxw5QdexUFYtYZ4bx5NKG8myA4PcnEt7kTvmbmE0vbEZHkJRFotrPrU jm7JOEuEJEfBIBy8U7U9fyfGshxNXMo4UjyUz0bPiWdLMuDd4Z9ccJr
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
index ecb71bf1859d..20326aa377b0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3052,6 +3052,34 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 	return snd_pcm_delay(substream, NULL);
 }
 
+#define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
+	int __err = 0;								\
+	typeof(*(__ptr)) __user *__src = (__ptr);					\
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
+	typeof(*(__ptr)) __user *__src = (__ptr);					\
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


