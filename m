Return-Path: <linuxppc-dev+bounces-9220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45360AD19B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 10:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG4cP4GwQz2xgX;
	Mon,  9 Jun 2025 18:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749457237;
	cv=none; b=ZI4Pvd92rxWHnABP51g+ESMKb0SX1ULTaI6d4wjDpnu0NsrD/a7RwXhR/dIsuhDForRsfVceeKlcW07R93bD4qxuBs/ZSb+Dn8rgi3dtg3O1bt1o/+byU1gbWfD1CXyn/ZPFCPEhhD9CZIET9P1yYjstcHlSAJFLAyZR2e40B3faKwDvIQvrhcP/4+AahQD5/aEuG7vXRODEKs8ZZI1C0bFkC4BGqIBA03dF5jNhZXrOTbcsHZwMooAqY5mdGX0mtovbPkKK/KjlY8q9VzECNjubc/Uf8JbdvWXD44CbsQ9xBjlYNRUPP1r5JW5QpQM33eVnI2q8w8C58/clYmC59w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749457237; c=relaxed/relaxed;
	bh=DXBDenMvoMRC77o+X17+/mDsVl4Gr40Xr1GAZOdbuuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogMcZ8589eIE86JTJTUaLoSc8PHuhLdWUi9pGrzuwhAmimzmqbmXS6Mtb3k+EZayPbJOA/KVHU/SI8gUBQ0WkXwjXLHdZNYgWuuTyJuvZEu3hDo/d/zs3dMMcm8gbMbPPl+FYeggiGmTO2EaUEyYHr5jWPt6F8JTTOmLQpJoyYfwDG7QrXW0zXdweU+WtMmDwfYtCUYqZvaPi6CdQf0fymvjpXTNoNV0uUw8OpJ+i5ewKzkDRNysio2iui1XjWKmOJ3Sz2VbUqht5pbYFdcFG8j1jwWmZet5cB+pYCnjR/19mmlStm89wRzvnFPVrzyJeMgIkiyCHz6JGQJo6U5JHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG4cN2z5lz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 18:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bG49m2XTSz9sTD;
	Mon,  9 Jun 2025 10:01:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duFFcjUl0mqp; Mon,  9 Jun 2025 10:01:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bG49X32NBz9sgR;
	Mon,  9 Jun 2025 10:00:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 627648B764;
	Mon,  9 Jun 2025 10:00:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id h2MAe25aPO47; Mon,  9 Jun 2025 10:00:48 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC1918B763;
	Mon,  9 Jun 2025 10:00:47 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()
Date: Mon,  9 Jun 2025 10:00:38 +0200
Message-ID: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749456041; l=19835; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=TFPjgCRFcitzvjcVPI/PeX7ojiF2ZcZ1W6IfsPWZeXQ=; b=84120c+2BWyf8HLmHe5ZmMvmLoXL1YbXH0WsCpkpsorQlGrsIgstt1bOCEJQeHyOgF/hRul0y rp7DYPG2TLHAcn+fnYWzBe3u7yUcMyBOhnMS7Ko4pWyFbzvj8A5MKG6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With user access protection (Called SMAP on x86 or KUAP on powerpc)
each and every call to get_user() or put_user() performs heavy
operations to unlock and lock kernel access to userspace.

To avoid that, perform user accesses by blocks using
user_access_begin/user_access_end() and unsafe_get_user()/
unsafe_put_user() and alike.

As an exemple, before the patch the 9 calls to put_user() at the
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

A couple more can be converted as well but require
unsafe_copy_from_user() which is not defined on x86 and arm64, so
those are left aside for the time being and will be handled in a
separate patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Split out the two hunks using copy_from_user() as unsafe_copy_from_user() is not implemented on x86 and arm64 yet.
---
 sound/core/pcm.c        |  24 +++++--
 sound/core/pcm_compat.c | 148 +++++++++++++++++++++++++++++-----------
 sound/core/pcm_lib.c    |  35 ++++++----
 sound/core/pcm_native.c |  66 +++++++++++++-----
 4 files changed, 196 insertions(+), 77 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 283aac441fa0..b5821d2506b6 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -107,15 +107,17 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 			struct snd_pcm_substream *substream;
 
 			info = (struct snd_pcm_info __user *)arg;
-			if (get_user(device, &info->device))
-				return -EFAULT;
-			if (get_user(stream, &info->stream))
+
+			if (!user_read_access_begin(info, sizeof(*info)))
 				return -EFAULT;
+			unsafe_get_user(device, &info->device, Efault);
+			unsafe_get_user(stream, &info->stream, Efault);
 			if (stream < 0 || stream > 1)
-				return -EINVAL;
+				goto Einval;
 			stream = array_index_nospec(stream, 2);
-			if (get_user(subdevice, &info->subdevice))
-				return -EFAULT;
+			unsafe_get_user(subdevice, &info->subdevice, Efault);
+			user_read_access_end();
+
 			guard(mutex)(&register_mutex);
 			pcm = snd_pcm_get(card, device);
 			if (pcm == NULL)
@@ -145,6 +147,16 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 		}
 	}
 	return -ENOIOCTLCMD;
+
+Einval:
+	user_read_access_end();
+
+	return -EINVAL;
+
+Efault:
+	user_read_access_end();
+
+	return -EFAULT;
 }
 
 #define FORMAT(v) [SNDRV_PCM_FORMAT_##v] = #v
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1da..bc3b293cec6a 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -91,18 +91,22 @@ static int snd_pcm_ioctl_sw_params_compat(struct snd_pcm_substream *substream,
 	int err;
 
 	memset(&params, 0, sizeof(params));
-	if (get_user(params.tstamp_mode, &src->tstamp_mode) ||
-	    get_user(params.period_step, &src->period_step) ||
-	    get_user(params.sleep_min, &src->sleep_min) ||
-	    get_user(params.avail_min, &src->avail_min) ||
-	    get_user(params.xfer_align, &src->xfer_align) ||
-	    get_user(params.start_threshold, &src->start_threshold) ||
-	    get_user(params.stop_threshold, &src->stop_threshold) ||
-	    get_user(params.silence_threshold, &src->silence_threshold) ||
-	    get_user(params.silence_size, &src->silence_size) ||
-	    get_user(params.tstamp_type, &src->tstamp_type) ||
-	    get_user(params.proto, &src->proto))
+
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	unsafe_get_user(params.tstamp_mode, &src->tstamp_mode, Efault);
+	unsafe_get_user(params.period_step, &src->period_step, Efault);
+	unsafe_get_user(params.sleep_min, &src->sleep_min, Efault);
+	unsafe_get_user(params.avail_min, &src->avail_min, Efault);
+	unsafe_get_user(params.xfer_align, &src->xfer_align, Efault);
+	unsafe_get_user(params.start_threshold, &src->start_threshold, Efault);
+	unsafe_get_user(params.stop_threshold, &src->stop_threshold, Efault);
+	unsafe_get_user(params.silence_threshold, &src->silence_threshold, Efault);
+	unsafe_get_user(params.silence_size, &src->silence_size, Efault);
+	unsafe_get_user(params.tstamp_type, &src->tstamp_type, Efault);
+	unsafe_get_user(params.proto, &src->proto, Efault);
+	user_read_access_end();
+
 	/*
 	 * Check silent_size parameter.  Since we have 64bit boundary,
 	 * silence_size must be compared with the 32bit boundary.
@@ -116,6 +120,11 @@ static int snd_pcm_ioctl_sw_params_compat(struct snd_pcm_substream *substream,
 	if (boundary && put_user(boundary, &src->boundary))
 		return -EFAULT;
 	return err;
+
+Efault:
+	user_read_access_end();
+
+	return -EFAULT;
 }
 
 struct snd_pcm_channel_info32 {
@@ -131,20 +140,37 @@ static int snd_pcm_ioctl_channel_info_compat(struct snd_pcm_substream *substream
 	struct snd_pcm_channel_info info;
 	int err;
 
-	if (get_user(info.channel, &src->channel) ||
-	    get_user(info.offset, &src->offset) ||
-	    get_user(info.first, &src->first) ||
-	    get_user(info.step, &src->step))
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	unsafe_get_user(info.channel, &src->channel, Efault_rd);
+	unsafe_get_user(info.offset, &src->offset, Efault_rd);
+	unsafe_get_user(info.first, &src->first, Efault_rd);
+	unsafe_get_user(info.step, &src->step, Efault_rd);
+	user_read_access_end();
+
 	err = snd_pcm_channel_info(substream, &info);
 	if (err < 0)
 		return err;
-	if (put_user(info.channel, &src->channel) ||
-	    put_user(info.offset, &src->offset) ||
-	    put_user(info.first, &src->first) ||
-	    put_user(info.step, &src->step))
+
+	if (!user_write_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	unsafe_put_user(info.channel, &src->channel, Efault_wr);
+	unsafe_put_user(info.offset, &src->offset, Efault_wr);
+	unsafe_put_user(info.first, &src->first, Efault_wr);
+	unsafe_put_user(info.step, &src->step, Efault_wr);
+	user_write_access_end();
+
 	return err;
+
+Efault_rd:
+	user_read_access_end();
+
+	return -EFAULT;
+
+Efault_wr:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 
 #ifdef CONFIG_X86_X32_ABI
@@ -261,9 +287,12 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 	}
 	if (err < 0)
 		return err;
-	if (copy_to_user(data32, data, sizeof(*data32)) ||
-	    put_user(data->fifo_size, &data32->fifo_size))
+
+	if (!user_write_access_begin(data32, sizeof(*data32)))
 		return -EFAULT;
+	unsafe_copy_to_user(data32, data, sizeof(*data32), Efault);
+	unsafe_put_user(data->fifo_size, &data32->fifo_size, Efault);
+	user_write_access_end();
 
 	if (! refine) {
 		unsigned int new_boundary = recalculate_boundary(runtime);
@@ -271,6 +300,11 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 			runtime->boundary = new_boundary;
 	}
 	return err;
+
+Efault:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 
 
@@ -296,9 +330,11 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
-	if (get_user(buf, &data32->buf) ||
-	    get_user(frames, &data32->frames))
+	if (!user_read_access_begin(data32, sizeof(*data32)))
 		return -EFAULT;
+	unsafe_get_user(buf, &data32->buf, Efault);
+	unsafe_get_user(frames, &data32->frames, Efault);
+	user_read_access_end();
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		err = snd_pcm_lib_write(substream, compat_ptr(buf), frames);
@@ -310,6 +346,11 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 	if (put_user(err, &data32->result))
 		return -EFAULT;
 	return 0;
+
+Efault:
+	user_read_access_end();
+
+	return -EFAULT;
 }
 
 
@@ -345,20 +386,28 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	ch = substream->runtime->channels;
 	if (ch > 128)
 		return -EINVAL;
-	if (get_user(buf, &data32->bufs) ||
-	    get_user(frames, &data32->frames))
+
+	if (!user_read_access_begin(data32, sizeof(*data32)))
 		return -EFAULT;
+	unsafe_get_user(buf, &data32->bufs, Efault);
+	unsafe_get_user(frames, &data32->frames, Efault);
+	user_read_access_end();
+
 	bufptr = compat_ptr(buf);
 	bufs = kmalloc_array(ch, sizeof(void __user *), GFP_KERNEL);
 	if (bufs == NULL)
 		return -ENOMEM;
+
+	if (!user_read_access_begin(bufptr, sizeof(*bufptr) * ch))
+		return -EFAULT;
 	for (i = 0; i < ch; i++) {
 		u32 ptr;
-		if (get_user(ptr, bufptr))
-			return -EFAULT;
+		unsafe_get_user(ptr, bufptr, Efault);
 		bufs[i] = compat_ptr(ptr);
 		bufptr++;
 	}
+	user_read_access_end();
+
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		err = snd_pcm_lib_writev(substream, bufs, frames);
 	else
@@ -368,6 +417,11 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 			return -EFAULT;
 	}
 	return err;
+
+Efault:
+	user_read_access_end();
+
+	return -EFAULT;
 }
 
 #ifdef CONFIG_X86_X32_ABI
@@ -418,10 +472,13 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	unsafe_get_user(sflags, &src->flags, Efault_rd);
+	unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
+	unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
+	user_read_access_end();
+
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
@@ -450,18 +507,31 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
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
+	unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
+	unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
+	unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
+	unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
+	unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
+	user_write_access_end();
 
 	return 0;
+
+Efault_rd:
+	user_read_access_end();
+
+	return -EFAULT;
+
+Efault_wr:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 #endif /* CONFIG_X86_X32_ABI */
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6eaa950504cf..3b9ba078594e 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2464,7 +2464,7 @@ const struct snd_pcm_chmap_elem snd_pcm_alt_chmaps[] = {
 };
 EXPORT_SYMBOL_GPL(snd_pcm_alt_chmaps);
 
-static bool valid_chmap_channels(const struct snd_pcm_chmap *info, int ch)
+static __always_inline bool valid_chmap_channels(const struct snd_pcm_chmap *info, int ch)
 {
 	if (ch > info->max_channels)
 		return false;
@@ -2530,8 +2530,9 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 		return -EINVAL;
 	if (size < 8)
 		return -ENOMEM;
-	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
+	if (!user_write_access_begin(tlv, size))
 		return -EFAULT;
+	unsafe_put_user(SNDRV_CTL_TLVT_CONTAINER, tlv, Efault);
 	size -= 8;
 	dst = tlv + 2;
 	for (map = info->chmap; map->channels; map++) {
@@ -2539,26 +2540,32 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 		if (!valid_chmap_channels(info, map->channels))
 			continue;
 		if (size < 8)
-			return -ENOMEM;
-		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
-		    put_user(chs_bytes, dst + 1))
-			return -EFAULT;
+			goto Enomem;
+		unsafe_put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst, Efault);
+		unsafe_put_user(chs_bytes, dst + 1, Efault);
 		dst += 2;
 		size -= 8;
 		count += 8;
 		if (size < chs_bytes)
-			return -ENOMEM;
+			goto Enomem;
 		size -= chs_bytes;
 		count += chs_bytes;
-		for (c = 0; c < map->channels; c++) {
-			if (put_user(map->map[c], dst))
-				return -EFAULT;
-			dst++;
-		}
+		for (c = 0; c < map->channels; c++)
+			unsafe_put_user(map->map[c], dst++, Efault);
 	}
-	if (put_user(count, tlv + 1))
-		return -EFAULT;
+	unsafe_put_user(count, tlv + 1, Efault);
+	user_write_access_end();
 	return 0;
+
+Enomem:
+	user_write_access_end();
+
+	return -ENOMEM;
+
+Efault:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 
 static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ecb71bf1859d..33eb27e62776 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3165,10 +3165,13 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (!user_read_access_begin(src, sizeof(*src)))
 		return -EFAULT;
+	unsafe_get_user(sflags, &src->flags, Efault_rd);
+	unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
+	unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
+	user_read_access_end();
+
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
@@ -3200,18 +3203,31 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
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
+	unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
+	unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
+	unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
+	unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
+	unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
+	unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min, Efault_wr);
+	user_write_access_end();
 
 	return 0;
+
+Efault_rd:
+	user_read_access_end();
+
+	return -EFAULT;
+
+Efault_wr:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 #define __SNDRV_PCM_IOCTL_SYNC_PTR32 _IOWR('A', 0x23, struct snd_pcm_sync_ptr32)
 
@@ -3285,14 +3301,21 @@ static int snd_pcm_rewind_ioctl(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t frames;
 	snd_pcm_sframes_t result;
 
-	if (get_user(frames, _frames))
-		return -EFAULT;
-	if (put_user(0, _frames))
+	if (!user_access_begin(_frames, sizeof(*_frames)))
 		return -EFAULT;
+	unsafe_get_user(frames, _frames, Efault);
+	unsafe_put_user(0, _frames, Efault);
+	user_access_end();
+
 	result = snd_pcm_rewind(substream, frames);
 	if (put_user(result, _frames))
 		return -EFAULT;
 	return result < 0 ? result : 0;
+
+Efault:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 
 static int snd_pcm_forward_ioctl(struct snd_pcm_substream *substream,
@@ -3301,14 +3324,21 @@ static int snd_pcm_forward_ioctl(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t frames;
 	snd_pcm_sframes_t result;
 
-	if (get_user(frames, _frames))
-		return -EFAULT;
-	if (put_user(0, _frames))
+	if (!user_access_begin(_frames, sizeof(*_frames)))
 		return -EFAULT;
+	unsafe_get_user(frames, _frames, Efault);
+	unsafe_put_user(0, _frames, Efault);
+	user_access_end();
+
 	result = snd_pcm_forward(substream, frames);
 	if (put_user(result, _frames))
 		return -EFAULT;
 	return result < 0 ? result : 0;
+
+Efault:
+	user_write_access_end();
+
+	return -EFAULT;
 }
 
 static int snd_pcm_common_ioctl(struct file *file,
-- 
2.47.0


