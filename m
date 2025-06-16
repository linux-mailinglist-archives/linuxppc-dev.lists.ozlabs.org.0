Return-Path: <linuxppc-dev+bounces-9391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A7ADA82F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 08:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLKlj5yQjz2xfB;
	Mon, 16 Jun 2025 16:26:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750055201;
	cv=none; b=PI4N4NV6FwHoyFlx9+IJNQYUHIbG+V9oSA5WVZVm9wPyC35XRdQ1LpsGtSi1Yy3hrOvtKSvKz0rhwoBPEPRFGQgY4/ksk51vdQ0AzUNJxzWp74GA0RBNYAln4UoNCzNNk72dRzwqolhMscpY3JrM9sNYU556yLUvzFRtMqBcHzyL6CulO50jc325Ka0pIbUO0UA68Dc/DXkEudwmk0VnV6Rxq/cYgWFnZTkwG2VMR6zbooPaDuzQWVPUPOfyY2bkGS2Fl/9hA41+ljSQF9TRlFOwa0u0OizdRmrtHLkUOIQzsipAah8L3rsqaNuJSjmGVDYg1tk70t8Ri23l8zZZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750055201; c=relaxed/relaxed;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iut6t9UUErK1LMqqLAd3C/hEB5I7J1PD7fSuzafbMxl5HrgBk1gZ+Ke7A83gSULlcSo4orSDX77SXXZBON9yCW5Jv1GXq48UYiaUef7Z8sds+lbKqeVwF33hmBWzuSxdfdYal9TkQ8uL1og599xaZx+C5PTaScD6162xcFDQhPuqv1kn3iQjzZuKPLtQZYilfa/Z2QW+DKNG1X8EppTDe9BNwxzk2R4DzCnB0Ra00pPU7+SFXAcODZt7VWewP80PYRBTau2XAmNZ2vksqBXW2THCRGch4FRQWPO+kDrMyT7TNb2PJ5kOUhEBiyjyA2+YpEXThPESup96xzdFeJiatQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HC+49SZX; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hu6tLGIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rcifyaT3; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P8Ndl+ub; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HC+49SZX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hu6tLGIk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rcifyaT3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P8Ndl+ub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLKlh1Btcz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 16:26:39 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A40981F38F;
	Mon, 16 Jun 2025 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=HC+49SZXn2eD695SFgZF2P7Aux/mSC+0uzAmjd/djhwhqXr3BTEY4CVHyjfH7ypZNXGymt
	YiAn84/Xz1QPikKo+3RghEjFMYb2gQUP1eBkCxq9Q5XXvU4iIMO9YBTe96SlAgXE6c2gVm
	nWr7AYwQEBR+ky5MsPhvHZrrXViitFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=hu6tLGIk7Eck1KrXI3uz6k5aFBKNymvqTgWgGGYWwXoxLwIZoOyHxbbxQtSqnUeocBYdzc
	NRiU1Sckv49KDcAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=rcifyaT3tOUGB0al4+wj+Nmq0HJ+azO6Q+ClMVf118YnKDVs8/SCJjL29VWRpD8SmwFiW1
	5+WDhDWziYOkFF3mAn1ejB2E+CB09BxsbhUEZGpb7Qlx/yOkGTwdOi34RQefoj5d9jMPkG
	pxKL0MveSLfaqoLjFEn/Owbs7woBX8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM8BnJnwLihHgKpZh1N/pfWX8smWwKIHYxEZVvlFanY=;
	b=P8Ndl+ubhZhzsVH7w3ddyXA7bVC1Q1Dk9e6CHSyl2jsLl2+NT3YQFfFuUvtCvrnyPDlSLJ
	gdNQf+VtPmTs4jCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E705139E2;
	Mon, 16 Jun 2025 06:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WA2IGRi5T2jzEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 06:26:32 +0000
Date: Mon, 16 Jun 2025 08:26:32 +0200
Message-ID: <87o6uop5gn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec64 in struct snd_pcm_mmap_status_x32
In-Reply-To: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
References: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
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
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Score: -7.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 16 Jun 2025 07:12:23 +0200,
Christophe Leroy wrote:
> 
> To match struct __snd_pcm_mmap_status and enable reuse of
> snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() by
> snd_pcm_sync_ptr() replace tstamp_sec and tstamp_nsec fields by
> a struct __snd_timespec64 in struct snd_pcm_mmap_status_x32.
> Do the same with audio_tstamp_sec and audio_tstamp_nsec.
> 
> This is possible because struct snd_pcm_mmap_status_x32 is packed
> and __SND_STRUCT_TIME64 is always defined for kernel which means
> struct __snd_timespec64 is always defined as struct __kernel_timespec
> which is:
> 
> 	struct __kernel_timespec {
> 		long long tv_sec;
> 		long long tv_nsec;
> 	};
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32")
> Closes: https://lore.kernel.org/all/20250616130126.08729b84@canb.auug.org.au/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Might be squashed with a0f3992ee86e if you happen to rebase sound tree.

Since your patches are the last ones, I rebased now exceptionally.


thanks,

Takashi

