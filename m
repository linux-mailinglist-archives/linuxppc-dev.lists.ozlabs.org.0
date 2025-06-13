Return-Path: <linuxppc-dev+bounces-9338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F1AD87CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 11:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJYxz2ln5z30HB;
	Fri, 13 Jun 2025 19:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749806967;
	cv=none; b=DUC6muBGywFpj1I9yVV+sFJvZ11qp+/A5lECelSrevSYbpgLVl4FzR2gXkHQSdIcajQ2z2yxThR8pwpr24xjbIcC29KdVe0wceSM0Wr+34sv8CF3rOHFgujTy3yDES1togidFAyyt2xhB/On18W2Tub5h9JHm9v3x3hrqG0fmMCwIpBZu3qwg5TuLau52Hod2KDHO7ZgPh+s213X388fVF6Kb5Puib76kjFOrJ6NAQvSsysmeZqcxOqM3HAYtWntPVmvrjzTPZUXw09qSC5+5VzucSXNQCmxb6bA7lEPq+SIn84xWdZeMXa3ifSyR6qrm9vzB+q4fxtuXlYldXLoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749806967; c=relaxed/relaxed;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iiUQaMZLdDF2RrM43a25jHUywt2VYbIqjoXdpgHuZEsvufUVp57hCDLVpP/APdlJ6AXFrqIxtDUpXdcJVd+mpp1NooYECY8CJLUF/QMW6MCH0QIV10M4wQixj6/hKIxMKWoEZ4iPjpyGLipPhLg6LVVIKFvnuvsBZNHcxtj6yiVGkbOxxYy3MJaCWEQ+t4g+i82qFma1vBLtrWWvjdqJljQbHhaSxyVKggSzZ/tBUip+GdR0tMwup/p7DFXDZTAl1X5Bcd3iiCIFQbuOi29vXqxofudCEqlV2+LXjFY9l8XmnYEBObBRiAa11drrHQlm073aTzM3YZPfhe8tDmVtyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XHHurhqz; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yklLGTdN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XHHurhqz; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yklLGTdN; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XHHurhqz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yklLGTdN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XHHurhqz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yklLGTdN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJYxy17t3z30GV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 19:29:25 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9311F7F7;
	Fri, 13 Jun 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=XHHurhqzQ7lHaxDJMcutUKIg/R/gLJcWMndGnSXfm3w9lF0Kh11U3VyRnW8kPdyw34Sv9h
	K6QSUfc4ODnwptBFyXqK2gLWnaK08u6wMLqktiWpQSGEJ0DUklE/rdoXn82HJSfq1+KGB2
	IFLo9BBcCh+gT6fxohNqV1+msbuE4Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=yklLGTdNEzPOLGMCIFlLpbe509WfQuwTWxUr3TEiaiaPPNRfq4a5oa1YRUo2Brzv+xHSMV
	nXJfYUuNGZgjalBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=XHHurhqzQ7lHaxDJMcutUKIg/R/gLJcWMndGnSXfm3w9lF0Kh11U3VyRnW8kPdyw34Sv9h
	K6QSUfc4ODnwptBFyXqK2gLWnaK08u6wMLqktiWpQSGEJ0DUklE/rdoXn82HJSfq1+KGB2
	IFLo9BBcCh+gT6fxohNqV1+msbuE4Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72rtZU9GPUCX6PrpkBBfovdIHSFV6jLcLA2KhXYzn7A=;
	b=yklLGTdNEzPOLGMCIFlLpbe509WfQuwTWxUr3TEiaiaPPNRfq4a5oa1YRUo2Brzv+xHSMV
	nXJfYUuNGZgjalBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5B76137FE;
	Fri, 13 Jun 2025 09:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rTHMNnLvS2hZOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 09:29:22 +0000
Date: Fri, 13 Jun 2025 11:29:22 +0200
Message-ID: <878qlwrnv1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
In-Reply-To: <79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
	<79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -7.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 12 Jun 2025 12:51:05 +0200,
Christophe Leroy wrote:
> 
> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
> are converted to user_access_begin/user_access_end(),
> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
> followed by a copy_from_user(). And because copy_{to/from}_user() are
> generic functions focussed on transfer of big data blocks to/from user,
> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
> data.
> 
> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
> snd_pcm_sync_ptr() too.
> 
> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
> struct __snd_timespec.
> 
> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
> wouldn't be straigh-forward do to the workaround it provides.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Through a quick glance, all patches look almost fine, but one favor to
ask: this patch contains the convert from s32/s32 pair to struct
__snd_timespec.  It should be factored out to a prerequisite patch
instead of burying in a big change.

I'm asking it because this timepsec definition is very confusing (and
complex) due to historical reasons, and it should be handled with a
special care.
IIUC, struct __snd_timespec is always s32/s32 for the kernel code, so
the conversion must be fine.  This needs to be commented in the
commit.


Thanks!

Takashi

