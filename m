Return-Path: <linuxppc-dev+bounces-9357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A9AD92F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 18:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJlXg6z15z2yfx;
	Sat, 14 Jun 2025 02:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749832899;
	cv=none; b=hAK4GtRAfz8wkRpEyNWiXcNEHeLJgzUjA+0nEa/SVgwIzzRA+sSCTfKvM2PvDsUEhMItSSucyNIzq9h91cJTDcZegFeQ/fuJ1Xc2xwphP5O/XYozFvxFRvKF/97WDGgj1DHUp3EZR5ydR9hilK4g/8oACJ9JolRwjqTtZ6TeDnNt5N177lFMbo3DhUJDSIcJB6VqZY2Ojlebtvccf3aa+M5Uh/ZppRIaPMfvDe7rUTqpayELLdcIncAcmOkQkkssiGPUmqzsIB/Kmbf2kJuWbAd2XIAwGj+bQryGf6dFEetPNNeFlU0fmok3o7htE6x6mPQOk0QpFWvB6XoiWphPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749832899; c=relaxed/relaxed;
	bh=Mo82IvcWnmj4RAy6VTY1cjPfQ13DoBzXMSGK35icpbo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akj03CEJN251+grCc6HkTrMjsxAgvu2HN1rG6wC+0fhY/sGPuYCuPzn8Yu9zQrUO8DoYXrvd7vUwXL0zdry4F9Xs0Qr8Vq11FwZBVmR2D0AXOdW9gwZ76BCUPg5Lsp+gWxrHDGKUoOrmtAlLlTKBPd4PFAIptHt7w/nJ8UaGoWjSAtqK6fV2+mjlYeHBlHizZxLe0eR2ntR/oFclQsLTajnYMWIDqjv/FAXzVMOUjnMcWD7gQe6FwKWEU66ib0mU2b9TXug1Vv3peHWig4seP6II2CYAgcgdwPQ2H52TwEMev+BkzfJLDMSYusB9+g2h9KFtng4g/gxx7hCC7odR+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdxs390a; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fEcQ17fM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdxs390a; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fEcQ17fM; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdxs390a;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fEcQ17fM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rdxs390a;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fEcQ17fM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJlXf2rfgz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 02:41:38 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEE761F7EC;
	Fri, 13 Jun 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749832894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo82IvcWnmj4RAy6VTY1cjPfQ13DoBzXMSGK35icpbo=;
	b=rdxs390a2e0T3oCRfg6Ed7mQkeR0008oY+cPYKWNxvIsxCvNG5PJKnGR0uL0bwgGJKOdz1
	UXduQmeV19l4PDAZYoKVjhqpb0S1drzd5BqnLkHpMs4ZomiElsjoQtANlJvL9y85EQ5ve8
	PAHxYmBavpVyk07/xcNVtu335QpoiUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749832894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo82IvcWnmj4RAy6VTY1cjPfQ13DoBzXMSGK35icpbo=;
	b=fEcQ17fMHVhsKDHCpEDBDyvAcayTOyGkJZS0oWRQnf5Byfb4WXGsP/FnkVE2w6H6V2tFjN
	bf+PosL0SgvxBmCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749832894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo82IvcWnmj4RAy6VTY1cjPfQ13DoBzXMSGK35icpbo=;
	b=rdxs390a2e0T3oCRfg6Ed7mQkeR0008oY+cPYKWNxvIsxCvNG5PJKnGR0uL0bwgGJKOdz1
	UXduQmeV19l4PDAZYoKVjhqpb0S1drzd5BqnLkHpMs4ZomiElsjoQtANlJvL9y85EQ5ve8
	PAHxYmBavpVyk07/xcNVtu335QpoiUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749832894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo82IvcWnmj4RAy6VTY1cjPfQ13DoBzXMSGK35icpbo=;
	b=fEcQ17fMHVhsKDHCpEDBDyvAcayTOyGkJZS0oWRQnf5Byfb4WXGsP/FnkVE2w6H6V2tFjN
	bf+PosL0SgvxBmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 711F813782;
	Fri, 13 Jun 2025 16:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zUAIGr5UTGhiPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 16:41:34 +0000
Date: Fri, 13 Jun 2025 18:41:34 +0200
Message-ID: <87msabr3up.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
In-Reply-To: <abb97ecdf9af8a9a63b03e59ff7ac338f6ce83f4.1749828169.git.christophe.leroy@csgroup.eu>
References: <cover.1749828169.git.christophe.leroy@csgroup.eu>
	<abb97ecdf9af8a9a63b03e59ff7ac338f6ce83f4.1749828169.git.christophe.leroy@csgroup.eu>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 13 Jun 2025 17:37:09 +0200,
Christophe Leroy wrote:
> 
> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> each and every call to get_user() or put_user() performs heavy
> operations to unlock and lock kernel access to userspace.
> 
> SNDRV_PCM_IOCTL_SYNC_PTR is a hot path which is called really often
> and needs to run as fast as possible.
> 
> To improve performance, perform user accesses by blocks using
> user_access_begin/user_access_end() and unsafe_get_user()/
> unsafe_put_user().
> 
> Before the patch the 9 calls to put_user() at the end of
> snd_pcm_ioctl_sync_ptr_compat() imply the following set of
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

Hm, with this patch, I got a compile warning:

sound/core/snd-pcm.o: warning: objtool: .altinstr_replacement+0x12: redundant UACCESS disable

It's with gcc-13.3.1.


Takashi

> ---
>  sound/core/pcm_native.c | 42 +++++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 20326aa377b0..fd69eea935b2 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3053,30 +3053,40 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
>  }
>  
>  #define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
> -	int __err = 0;								\
> +	__label__ failed;							\
> +	int __err = -EFAULT;							\
>  	typeof(*(__ptr)) __user *__src = (__ptr);					\
>  										\
> -	if (get_user(__f, &src->flags) ||					\
> -	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
> -	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
> -		__err = -EFAULT;						\
> +	if (!user_read_access_begin(__src, sizeof(*__src)))			\
> +		goto failed;							\
> +	unsafe_get_user(__f, &__src->flags, failed);				\
> +	unsafe_get_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
> +	unsafe_get_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
> +	__err = 0;								\
> +failed:										\
> +	user_read_access_end();							\
>  	__err;									\
>  })
>  
>  #define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
> -	int __err = 0;								\
> +	__label__ failed;							\
> +	int __err = -EFAULT;							\
>  	typeof(*(__ptr)) __user *__src = (__ptr);					\
>  										\
> -	if (put_user(__s.state, &__src->s.status.state) ||			\
> -	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
> -	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
> -	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
> -	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
> -	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
> -	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
> -	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
> -	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
> -		__err = -EFAULT;						\
> +	if (!user_write_access_begin(__src, sizeof(*__src)))			\
> +		goto failed;							\
> +	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
> +	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
> +	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
> +	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
> +	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
> +	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
> +	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
> +	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
> +	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
> +	__err = 0;								\
> +failed:										\
> +	user_write_access_end();						\
>  	__err;									\
>  })
>  
> -- 
> 2.47.0
> 

