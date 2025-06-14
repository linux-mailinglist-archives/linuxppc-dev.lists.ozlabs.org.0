Return-Path: <linuxppc-dev+bounces-9369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F3AD9C13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 12:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKC2b3xk6z2xS2;
	Sat, 14 Jun 2025 20:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749896439;
	cv=none; b=lJaf0lhoCaMwf4AHbuj6A8eJtCzOjDmHGDLViI4tNyyRvNuA9D1lUl19gXYZtfrVhJQhPKVeL3XnpPFROa6A7Mt1qXr/B335HQfMsVRFoHHy33ZpPiK74NZp8tv1BGLiCY0aiTnFqnvTqjjH1+uFwXfDHnT1iLF2/tlR1TiUuEiFzfSus3NIIaqltKsN3fz9Iep/gv5pcKUXTbUzPCZX490d1yslKEvMcvUc2mhyNT0+oy1HSA9RS5gNfddZ9ERECdIR6Y25sFLLIHKsZOU7utonATBh0Di/7jC5JnzgWKxJrhSVkHQ9HvzV5V0M5P9e5IPZVgcAsgGvLezgw6/x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749896439; c=relaxed/relaxed;
	bh=DbjzmD/cJEuORGBCJVhALWqbvzhbaGFa//7JQTRjKtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAjzGNJLuUybZslqncZVGfAc7F0cBLmiXqRux+uCPatoWWNlAZ0jp9pzlub3ZsFp69LAtUxi2UUeDjRyMz4NKCnPS1FXW/KbFWkf9NPH6VXMCVpvBPP81t6rYvUcF/nV6kePu7mbrkWj24Y4aUg228COtMAjtIHQu/tLC8TU8/D7RkD0+A6UutUhhJ6P0zWPzAPK7HltoCGAs3P0BWRvRkbII4heEmmm1Toehec3qKtC46ZFy2V6chUeOS5WYUcR8eXP89aiMlDkefbDf+LHvk+Hwcl9QD/1mRWMbI6PxMpSWN9E6QoRNiUdg2HgHgDyy/bvpL3X4bUWdq/QFgkKFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKC2Z5PcXz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 20:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cw1Krmz9swJ;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2dHx2Qexyif; Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cw0dHyz9sv8;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 115D18B77D;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EQJpklzh3xNX; Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A1198B77C;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 2/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Sat, 14 Jun 2025 08:43:15 +0200
Message-ID: <eccd047f2dfeb550129a1d60035e2233c4401d0c.1749883041.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883394; l=5748; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y/kN7AHu0ztdE4V/wDe2tzWqBJMOAaU7CIWYK7DkX7o=; b=pRAXSC+yAW3CkHcY/K2ThDMLODoldV3IMLvVRH3SQ4RQRIX816uDsMCq9mbDWlil21VwolnQ7 CJb9Ha9TCYpANSPVCtVsMF720vVqehwz1RIlMAzUW9PBVY7/6qXGnha
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With user access protection (Called SMAP on x86 or KUAP on powerpc)
each and every call to get_user() or put_user() performs heavy
operations to unlock and lock kernel access to userspace.

SNDRV_PCM_IOCTL_SYNC_PTR is a hot path which is called really often
and needs to run as fast as possible.

To improve performance, perform user accesses by blocks using
user_access_begin/user_access_end() and unsafe_get_user()/
unsafe_put_user().

Before the patch the 9 calls to put_user() at the end of
snd_pcm_ioctl_sync_ptr_compat() imply the following set of
instructions about 9 times (access_ok - enable user - write - disable
user):
    0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
    0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
    0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
    0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
    0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
    0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
    1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
    0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
    0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
    0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
...

A perf profile shows that in total the 9 put_user() represent 36% of
the time spent in snd_pcm_ioctl() and about 80 instructions.

With this patch everything is done in 13 instructions and represent
only 15% of the time spent in snd_pcm_ioctl():

    0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
    0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
    0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
    0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
    0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
    4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
    0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
    0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
    0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
    5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
    0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
    0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
    0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9

Note that here the access_ok() in user_write_access_begin() is skipped
because the exact same verification has already been performed at the
beginning of the fonction with the call to user_read_access_begin().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 44 ++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 1f8f6d95b18c..5eb59fdb3cb2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3053,30 +3053,42 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 }
 
 #define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
-	int __err = 0;								\
+	__label__ failed, failed_begin;						\
+	int __err = -EFAULT;							\
 	typeof(*(__ptr)) __user *__src = (__ptr);				\
 										\
-	if (get_user(__f, &src->flags) ||					\
-	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
-		__err = -EFAULT;						\
+	if (!user_read_access_begin(__src, sizeof(*__src)))			\
+		goto failed_begin;						\
+	unsafe_get_user(__f, &__src->flags, failed);				\
+	unsafe_get_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_get_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	__err = 0;								\
+failed:										\
+	user_read_access_end();							\
+failed_begin:									\
 	__err;									\
 })
 
 #define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
-	int __err = 0;								\
+	__label__ failed, failed_begin;						\
+	int __err = -EFAULT;							\
 	typeof(*(__ptr)) __user *__src = (__ptr);				\
 										\
-	if (put_user(__s.state, &__src->s.status.state) ||			\
-	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
-	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
-	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
-	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
-	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
-	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
-	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
-		__err = -EFAULT;						\
+	if (!user_write_access_begin(__src, sizeof(*__src)))			\
+		goto failed_begin;						\
+	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
+	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
+	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
+	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
+	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
+	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
+	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	__err = 0;								\
+failed:										\
+	user_write_access_end();						\
+failed_begin:									\
 	__err;									\
 })
 
-- 
2.47.0


