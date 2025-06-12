Return-Path: <linuxppc-dev+bounces-9306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2CAD6E83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 13:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ04K35RNz2xQ6;
	Thu, 12 Jun 2025 21:02:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749726177;
	cv=none; b=AzWMb+I/tSZ1G+jjfFav8tJ9HsMAjQ8YBWvhcvgRbx6z4B98r9pwOXbclRyTRNVuEQD3MSC3DMKU/6SrYlzCGFl+04kbxvOLke+vYnYB4CutY7R5feVnqFxAzHwTxchzFfohCn2S8nslQu98OORswY/I8wg7tdHI5C4i7ROLAD8F6uXxxvid10ZVllmhGivjSHmT6Hov7w7vtDN5Lju/WtxQrqNLtWd6GOj2LmHWRl2u0AoDqcValvM0coKYrJ4oxDWu5kFG5vAxxFifRe9lYPUG7xH7V9BA8SREM+HENnnLEfYdiicqPAuIsDBoMaRhYANDCLIevtS7Ubw6iMH/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749726177; c=relaxed/relaxed;
	bh=NbGE138DyVVFIdUuu5vglAed828BnbFjFKylmnn1ac8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQvlXqRhj5X6NmmIwH7G5xpyrYJmhkrCtClqJGe4pviInmXluZ+Z8zWiVYpaABxjejf1MO5SUy4RZccCDh2RjvBCjDfGvJzSZIZo4Rg43QnyDSua0+7a70h14FWM3pqLttjEcJNYwYd72haTei5RKl3qTruq36k0F+qFh1iVhmpBHT03vvHJW0b+irWhDechZI0sC5YxHUuQcNxHenft943ie+VuSq+2gjtU09vBTmAoMo9IQ3xSOMaTW6+whBSNxha4A/uZS9yoJFF8jMg5fnhu18xy76UOiYnS6HY3tYBOw8EDbGYBsiwYFgy7Yngc8gGChLz+gc6AHJSK/YNW3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ04J2ZnNz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 21:02:56 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 32E8E1F78E;
	Thu, 12 Jun 2025 11:02:53 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB75A139E2;
	Thu, 12 Jun 2025 11:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jQJAONyzSmi4XAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Jun 2025 11:02:52 +0000
Date: Thu, 12 Jun 2025 13:02:52 +0200
Message-ID: <87wm9hte77.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to user_access_begin/user_access_end()
In-Reply-To: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
References: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 32E8E1F78E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 12 Jun 2025 12:39:39 +0200,
Christophe Leroy wrote:
> 
> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> each and every call to get_user() or put_user() performs heavy
> operations to unlock and lock kernel access to userspace.
> 
> SNDRV_PCM_IOCTL_SYNC_PTR ioctl is a hot path that needs to be
> optimised. To do that, perform user accesses by blocks using
> user_access_begin/user_access_end() and unsafe_get_user()/
> unsafe_put_user() and alike.
> 
> Before the patch the 9 calls to put_user() at the
> end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
> instructions about 9 times (access_ok - enable user - write - disable
> user):
>     0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
>     0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
>     0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
>     0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
>     0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
>     0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
>     1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
>     0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
>     0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
>     0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
> ...
> 
> A perf profile shows that in total the 9 put_user() represent 36% of
> the time spent in snd_pcm_ioctl() and about 80 instructions.
> 
> With this patch everything is done in 13 instructions and represent
> only 15% of the time spent in snd_pcm_ioctl():
> 
>     0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
>     0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
>     0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
>     0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
>     0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
>     4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
>     0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
>     0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
>     0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
>     5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
>     0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
>     0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
>     0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
> 
> Note that here the access_ok() in user_write_access_begin() is skipped
> because the exact same verification has already been performed at the
> beginning of the fonction with the call to user_read_access_begin().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> This is a lighter version of previous patch "[PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()" focussing on identified hot path.
> Moved and nested the failure labels closer in order to increase readability

Thanks for the revised patch!

Although it's now much lighter, I still believe that we can reduce
get_user() / put_user() calls significantly by adjusting the struct
usage.

Could you check whether the patch below can improve?
(Zero-ing of sstatus can be an overhead here, but there are some
holes, and these need to be initialized before copying back...)


Takashi

--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -410,8 +410,8 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	volatile struct snd_pcm_mmap_status *status;
 	volatile struct snd_pcm_mmap_control *control;
 	u32 sflags;
-	struct snd_pcm_mmap_control scontrol;
-	struct snd_pcm_mmap_status sstatus;
+	struct snd_pcm_mmap_control_x32 scontrol;
+	struct snd_pcm_mmap_status_x32 sstatus = {};
 	snd_pcm_uframes_t boundary;
 	int err;
 
@@ -419,8 +419,7 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	    copy_from_user(&scontrol, &src->c.control))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -444,21 +443,16 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 			scontrol.avail_min = control->avail_min;
 		sstatus.state = status->state;
 		sstatus.hw_ptr = status->hw_ptr % boundary;
-		sstatus.tstamp = status->tstamp;
+		sstatus.tstamp_sec = status->tstamp.tv_sec;
+		sstatus.tstamp_nsec = status->tstamp.tv_nsec;
 		sstatus.suspended_state = status->suspended_state;
-		sstatus.audio_tstamp = status->audio_tstamp;
+		sstatus.audio_tstamp_sec = status->audio_tstamp.tv_sec;
+		sstatus.audio_tstamp_nsec = status->audio_tstamp.tv_nsec;
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
+	if (copy_to_user(&src->s.status, &sstatus, sizeof(sstatus)) ||
+	    copy_to_user(&src->c.control, &scontrol, sizeof(scontrol)))
 		return -EFAULT;
 
 	return 0;
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3157,8 +3157,8 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	volatile struct snd_pcm_mmap_status *status;
 	volatile struct snd_pcm_mmap_control *control;
 	u32 sflags;
-	struct snd_pcm_mmap_control scontrol;
-	struct snd_pcm_mmap_status sstatus;
+	struct snd_pcm_mmap_control32 scontrol;
+	struct snd_pcm_mmap_status32 sstatus = {};
 	snd_pcm_uframes_t boundary;
 	int err;
 
@@ -3166,8 +3166,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	    copy_from_user(&scontrol, &src->c.control, sizeof(scontrol)))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -3194,21 +3193,16 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 			scontrol.avail_min = control->avail_min;
 		sstatus.state = status->state;
 		sstatus.hw_ptr = status->hw_ptr % boundary;
-		sstatus.tstamp = status->tstamp;
+		sstatus.tstamp_sec = status->tstamp.tv_sec;
+		sstatus.tstamp_nsec = status->tstamp.tv_nsec;
 		sstatus.suspended_state = status->suspended_state;
-		sstatus.audio_tstamp = status->audio_tstamp;
+		sstatus.audio_tstamp_sec = status->audio_tstamp.tv_sec;
+		sstatus.audio_tstamp_nsec = status->audio_tstamp.tv_nsec;
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
+	if (copy_to_user(&src->s.status, &sstatus, sizeof(sstatus)) ||
+	    copy_to_user(&src->c.control, &scontrol, sizeof(scontrol)))
 		return -EFAULT;
 
 	return 0;


