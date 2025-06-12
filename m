Return-Path: <linuxppc-dev+bounces-9310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D89AD70C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 14:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ2Sg3Y00z2ynh;
	Thu, 12 Jun 2025 22:50:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749732643;
	cv=none; b=f/d8c4dBkElRIYFzvN8my1FLlE2Ug34GWps1tnLDuvXVEIVonTmUqKfVGHdSGujkd19N5Kvi00hBmjfV/k5pXAu31EUN9yQsj5EbDtsbZXVBvWtM+h5Ka6UbQUMGnuk8lkGhXmbQbW8+N49N102WqbkgpicY1luRJ3YZQmQGXnnIBHJngnpZYus/xoRGg9Ka1ZK45WuYezPrGVMl7wHMoE4M+wCGTp+F3mKrLft8pdXFw8QyiEVHyexrZVXXaixmDWa+gZZWpgaNzSOcrF9ygjwDclr4vhwNLh3LKdfo1ni9SOJShOkuhGcqxPjB6LKNzpv9kwGmLBCuGE6JNh5jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749732643; c=relaxed/relaxed;
	bh=CXsaGq6stMft7FEaGBtXK9+ZBo2A1YOxdVpbOCOl7s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZayqORkNfXSFODao5DFpIi/ztONFp3qZI4E6Bba2kq4JMVlR/aIbEu565OOHc1voQYHuGaGpLLPGwylCWvwLk4Ji95gNR3u9RPrR8596nn8RpEvPYm8FlolxwhbaNrsUu3KLjSTdo+kb1g8YrSnsioXpR4rPiImLVGHLMLRns/BdlX1Rmfk7EHLJB57wKzCt2gtdvVx3iQDlvObmcSsas4jPQK4/ylEZpq+tDGAzudAK2w376J15NyIxVAFctYcj1qQNrV/r3VAJcKSAXBILXbQtfMrpo7xh07Xf9P2fJ79ZrDWf4K4tPvY9I8nErzsbWXpY7mQhDPNjAQEU5Pb5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ2Sf0q9Lz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 22:50:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzq12tscz9ssb;
	Thu, 12 Jun 2025 12:51:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKH0dhrf7T0c; Thu, 12 Jun 2025 12:51:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzpz6djdz9sqT;
	Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF4588B77C;
	Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4kpEzQSLlOOY; Thu, 12 Jun 2025 12:51:23 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A5A48B77B;
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
Subject: [RFC PATCH 2/3] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Thu, 12 Jun 2025 12:51:04 +0200
Message-ID: <79b581119343a12e417d7fe7b296aa50c84900cc.1749724478.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749725466; l=5636; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xYjoZkQAKcyPgefx8DxnfSeFckhC8+R50VIqrPdjvnA=; b=Gsz2ytgV8MIRu4pz37qr9dueO52dEu0FqCLfzWwL7DzPqfm2MF2MtsxtS2MPzC/b/kOB3H6bg KLG9UwpfWQiA+MzIjdY8s8A2YIrmQLz5rZ6vyzpT98dq3CxStbu+mCo
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
 sound/core/pcm_native.c | 42 +++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 2ea31df0c46d..554352f546c9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3053,30 +3053,40 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 }
 
 #define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
-	int err = 0;								\
+	__label__ failed;							\
+	int err = -EFAULT;							\
 	typeof(*__ptr) __user *__src = (__ptr);					\
 										\
-	if (get_user(__f, &src->flags) ||					\
-	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
-		err = -EFAULT;							\
+	if (!user_read_access_begin(__src, sizeof(*__src)))			\
+		goto failed;							\
+	unsafe_get_user(__f, &__src->flags, failed);				\
+	unsafe_get_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_get_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	err = 0;								\
+failed:										\
+	user_read_access_end();							\
 	err;									\
 })
 
 #define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
-	int err = 0;								\
+	__label__ failed;							\
+	int err = -EFAULT;							\
 	typeof(*__ptr) __user *__src = (__ptr);					\
 										\
-	if (put_user(__s.state, &__src->s.status.state) ||			\
-	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
-	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||	\
-	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
-	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||\
-	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||\
-	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||\
-	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
-		err = -EFAULT;							\
+	if (!user_write_access_begin(__src, sizeof(*__src)))			\
+		goto failed;							\
+	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
+	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
+	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
+	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
+	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
+	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
+	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	err = 0;								\
+failed:										\
+	user_write_access_end();						\
 	err;									\
 })
 
-- 
2.47.0


