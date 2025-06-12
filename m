Return-Path: <linuxppc-dev+bounces-9305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241DAD6E3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 12:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzpF5Yx4z308P;
	Thu, 12 Jun 2025 20:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749725445;
	cv=none; b=bdTfMygsoVKmu1zHVBVyfr+iOTBdfutK1fPOPkWwyeLVIbEiyjXbFtIwCZsaL6U43RxJIRSsk/b6QXFQsQz9UqIdWWTYcBjbTaVX2OL3Ulv9m3dibDcGc1mOHwbsA0JNBXEUIkrw+O+pdUaJunaBLBReImud/hniZwsrxNzpuLmkemd5mTB8Eu3GlVFhKntDagRjYJX17o085JQjTvTAe53a8LdDj7BRJahUhseySWNqXRDIsXMC/99T8hc/nfFmSlDyTEPP5wLHiw+57x9T9UqRxudcFmE/myi+jWv7SywlxnxTr893kIOCklULpUpSo8XraCZdJhoU8evbiVUO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749725445; c=relaxed/relaxed;
	bh=X3ARAdGIuXicXwS7hHaOK8mvLlCnsOObt0uh2Ffw4ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jluRia4cetwZPaelHjf3IuAmT6D/6yxYNsSy02OGcySRUi8VsjtHv2kc65ekn+XLiUgz3gnu+oSsE++LcaXgLYDAeLljJSvyv08dOOvjGPziAg3JMX/LFgayLWoCUPnymVoOySLf4hXDoJOg5Ao5FX4v880SfWSpueiIJk628uesRh6Gh/QCRe/Bh1GdskPwkDlgLXCSRIYWFXlquBbFXSBvWHWjLbF6Ekzyuj9BnHH0X3tFjpSn/TMVGz/+cSNb0kHDyWNVT0/OB+BwuM4af0by5VVa2GMfm3D8HDKmUID6iOWx4J71Kz6j1LdHNQw1IEEKVzEQWbbLtOb3EhUzJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzpF0fvZz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 20:50:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzYb73gyz9tHF;
	Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2wwbyyyP6lu; Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzYb6LqLz9tFS;
	Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D48D28B77B;
	Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QnMofMfdk0mU; Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 502998B769;
	Thu, 12 Jun 2025 12:39:47 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to user_access_begin/user_access_end()
Date: Thu, 12 Jun 2025 12:39:39 +0200
Message-ID: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749724779; l=8808; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=SQUtuRhE2BAVHn8Mafr9cwFS7bLSZxdCosfeA4mmwDg=; b=JuAnvGdXpCM7km35w05+tUvPA0w1w1jX1C5T0Ty88h3Q2iIkdcGF+rdmyTdi/k6rxrXDkZJBR C1Zu00NQkFTChNEZcJu80cDHnrGGebl28WMqrKj25RtnZM/hcJptrSk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With user access protection (Called SMAP on x86 or KUAP on powerpc)
each and every call to get_user() or put_user() performs heavy
operations to unlock and lock kernel access to userspace.

SNDRV_PCM_IOCTL_SYNC_PTR ioctl is a hot path that needs to be
optimised. To do that, perform user accesses by blocks using
user_access_begin/user_access_end() and unsafe_get_user()/
unsafe_put_user() and alike.

Before the patch the 9 calls to put_user() at the
end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
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
This is a lighter version of previous patch "[PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()" focussing on identified hot path.
Moved and nested the failure labels closer in order to increase readability

Link: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu/

 sound/core/pcm_compat.c | 40 +++++++++++++++++++++++++++-------------
 sound/core/pcm_native.c | 40 +++++++++++++++++++++++++++-------------
 2 files changed, 54 insertions(+), 26 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1da..348a72e6499e 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -418,10 +418,18 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	err = -EFAULT;
+	unsafe_get_user(sflags, &src->flags, Efault_rd);
+	unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
+	unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
+	err = 0;
+Efault_rd:
+	user_read_access_end();
+	if (err)
+		return err;
+
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
@@ -450,18 +458,24 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
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
+
+	if (!user_write_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	err = -EFAULT;
+	unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
+	unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
+	unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
+	unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
+	unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
+	err = 0;
+Efault_wr:
+	user_write_access_end();
 
-	return 0;
+	return err;
 }
 #endif /* CONFIG_X86_X32_ABI */
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ecb71bf1859d..b104faddb6e3 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3165,10 +3165,18 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	err = -EFAULT;
+	unsafe_get_user(sflags, &src->flags, Efault_rd);
+	unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
+	unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
+	err = 0;
+Efault_rd:
+	user_read_access_end();
+	if (err)
+		return err;
+
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
@@ -3200,18 +3208,24 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
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
+
+	if (!user_write_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	err = -EFAULT;
+	unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
+	unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
+	unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
+	unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
+	unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min, Efault_wr);
+	err = 0;
+Efault_wr:
+	user_write_access_end();
 
-	return 0;
+	return err;
 }
 #define __SNDRV_PCM_IOCTL_SYNC_PTR32 _IOWR('A', 0x23, struct snd_pcm_sync_ptr32)
 
-- 
2.47.0


