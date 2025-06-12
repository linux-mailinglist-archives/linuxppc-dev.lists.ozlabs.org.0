Return-Path: <linuxppc-dev+bounces-9319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F7AD75B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 17:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5nj1My5z2xQ6;
	Fri, 13 Jun 2025 01:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749741641;
	cv=none; b=G0Jn4LEVvI3lzxOtOsNFBr34+6ZCEug1JDBv5dD3D/8GhuHNBkj5S05ldEOHTj280XdQZuODgLT8qH3P24wudGe3jo4bG24dV2uLv8g0C5CFHIJ1CYwTORZQ6nsqz0wmdlLsZPmWNEgQoljiDLbCIUNCLzqCWGcF5DvP3moD/kkF3RdbQTj6XFf3dOgyPFRqT4bQF4HwDN7R+Kh+FGWjHgcnsA11cKgk4i4614ew2q9OJ7BiwXvM2zDGhqwawi8MaIiZNzBM+TYBxkZ3ye+RLSysiPaX5MMyvQKDlp1JPAbg16MtoKU7M1SEp2tLHpNIb2UrD1ELYi2+cektWERCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749741641; c=relaxed/relaxed;
	bh=mfQOXMcsdeprfGKdD3/FM1nrw/ii99+wE7S6gjd9gUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QG7Ii8EokJsv6f/9idIncvOv+ma2awMUh3Q3jzTetQ31SVTpBExY+xkzrvmFAy5AZBP67AsbGTomp6AME8CdUZU8SlQN5HVhlNjP5PsnZMW/k07fgsJtfUigf7kK/x3VwSeeUpz6ym8yzmK3S1JK3G9UFWWvvRvjLD2eaWEgJsCb+AX9G4ZMLOPCXczE7kkL/xgSBbONlQb7edBLAVn25Kd9ZpLNEkZ9uBIj4jcBHxoqZ/AjjN2RtGcC5tJ7I1oIUj/tiiJICaUbYTZdEHSjN4yzEImm+YnMgvOeL7B+fK+ejbe/E603x8iDtwxmVDZxxHENGGnDLESIXB8CbbDyMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5nh3pC6z2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 01:20:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzq03Hthz9sr6;
	Thu, 12 Jun 2025 12:51:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dg_5twlGnpsf; Thu, 12 Jun 2025 12:51:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzpz3RrHz9sl0;
	Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7086E8B77C;
	Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4-fZd9TrsfPF; Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF89C8B769;
	Thu, 12 Jun 2025 12:51:22 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH 1/3] ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
Date: Thu, 12 Jun 2025 12:51:03 +0200
Message-ID: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749725466; l=5409; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GaXqXVwUsIU7UmgzAQOYhKFu77e6O4GnESGiJfK2u1U=; b=Az5YNZGtIsW8hWr4mYdHUuE5EbICMzIRwgIZofwFLoY4ITCzBcf0WtmwTHGpbGX++KKsHcuQl av4/RBGeo17ArQeJ8pv12kH2P+eXa0Uvf8Ph5O+kQX3VVsmb3uw0n0C
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
index ecb71bf1859d..2ea31df0c46d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3052,6 +3052,34 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 	return snd_pcm_delay(substream, NULL);
 }
 
+#define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
+	int err = 0;								\
+	typeof(*__ptr) __user *__src = (__ptr);					\
+										\
+	if (get_user(__f, &src->flags) ||					\
+	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
+		err = -EFAULT;							\
+	err;									\
+})
+
+#define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
+	int err = 0;								\
+	typeof(*__ptr) __user *__src = (__ptr);					\
+										\
+	if (put_user(__s.state, &__src->s.status.state) ||			\
+	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
+	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||	\
+	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
+	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||\
+	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||\
+	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||\
+	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
+		err = -EFAULT;							\
+	err;									\
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


