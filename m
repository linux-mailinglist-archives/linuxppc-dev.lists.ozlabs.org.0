Return-Path: <linuxppc-dev+bounces-9337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB5AD877C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 11:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJYdl3gPVz30NP;
	Fri, 13 Jun 2025 19:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749806123;
	cv=none; b=WHfJbDhz1GTzOiJEt9YVPKaphqcyzug09zYQigUgZpGXe/u/iScS6Dvo6DxiOTxpsi/+beEsTcE73TiQwYEPm7Yhys/0oCtJVSyGr2FflQAacryMpTWny1x7+l5nPrGGYZThi2TjMkMQDq1C4sr4DI4/qNWJ0F18yaZJAcgKiwELL7gp1c/3H8A0V5WdoBz3bXmxvyw+8msCswto66totkObxid0TqBj0X5XmGjbsMAgXm3VPbuV+XG+myezIi1zsvDUzIAlU5lAyDBiBNH5O3sgsssjunuxW6QjbObn/T9qnvgfz+iI7HHfFdYOeO4iTVmxgKG4VFIh6Hg+xR0QpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749806123; c=relaxed/relaxed;
	bh=1gFr2ORNyOcDAn99XmFpex/Nd1tdtjGNWZMMFbxDzKo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeYIcLbX8w5NxIBeqRJKWGNblzqrEDuqi9ZyInNp7kLrH4YVEe9IND/3jfpTQZcKKlUYqn83EHn0M88MGVDXy5z07Tl/DnVDwOfU17JlZgeVGNi4epNAbpYDgjfLVRhhNsQkrZB9aVVfimCwoonAKs0aJxhajVOplCAw3PCDYDtjwheDaL7J9xbFa86uSCYpMp/85rRScYoxZv5TU/JSOSsjIIYfEj6ye69DP2J90rd9n/IQjGWNBc9SlpPi/NmgwTUuLU53lCDm1j+HigWTU0Ol7eRUBrtbz3KUJrDB/EG2WtfNkSfSsRaOExRoGtLfaVv3kg81IZlMRKB1er5BaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jsZ3jErx; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5kQgcHbS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lQ+Eg3e9; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VrYZpozi; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jsZ3jErx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5kQgcHbS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lQ+Eg3e9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VrYZpozi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJYdj21Rzz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 19:15:21 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D48C621185;
	Fri, 13 Jun 2025 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gFr2ORNyOcDAn99XmFpex/Nd1tdtjGNWZMMFbxDzKo=;
	b=jsZ3jErxWF+qQWtcV9dOuBZQgt7fImbZbQxpL/A4BxJifkLZs2UoY+sQPm48+jT87QDXbX
	6LKhfBsh/Odcl1VEQUIx204jt4NG+/Azl5YxG4s0nK2XQaLFl1LD3IiT9TSquvj93cX0y6
	r1PB05X92tK54YRn+oAR6m+7prPK1d4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gFr2ORNyOcDAn99XmFpex/Nd1tdtjGNWZMMFbxDzKo=;
	b=5kQgcHbSBcNxCKw+j/6cpYnddVl9r9xKZz2KgaiuSoQMS/7dPoYAnWIlW4sNpVjZcOMblT
	xyhUy5PJIk38+xAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749806112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gFr2ORNyOcDAn99XmFpex/Nd1tdtjGNWZMMFbxDzKo=;
	b=lQ+Eg3e92o4z8o9eKaqOQCt1MbWg5ToGpgotVEh+9vXZYcNCicIVmuEmia7kWVHHBqsd1s
	7w90+JFfwo9NY4cHj6lMf5TKqK73puDOqWs1E2N07jMeds4CnrpdGvMrBsYZ72ZLmZFNN+
	+960iFlJCy+7iwS9n3820d54wI8H6oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749806112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1gFr2ORNyOcDAn99XmFpex/Nd1tdtjGNWZMMFbxDzKo=;
	b=VrYZpoziUd4gHOj94fvOhe8usaRNWM+cBfpEzILHVy9dpUOdJWqQHdELrkf8S57QGpAXds
	lmyo9IgHVIX37WDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96429137FE;
	Fri, 13 Jun 2025 09:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cSWRIyDsS2ikNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 09:15:12 +0000
Date: Fri, 13 Jun 2025 11:15:12 +0200
Message-ID: <87a56croin.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to user_access_begin/user_access_end()
In-Reply-To: <fa8c0bca-a127-410e-9b13-3fa5ea7d8110@csgroup.eu>
References: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
	<87wm9hte77.wl-tiwai@suse.de>
	<fa8c0bca-a127-410e-9b13-3fa5ea7d8110@csgroup.eu>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 13 Jun 2025 07:24:46 +0200,
Christophe Leroy wrote:
> 
> 
> 
> Le 12/06/2025 à 13:02, Takashi Iwai a écrit :
> > On Thu, 12 Jun 2025 12:39:39 +0200,
> > Christophe Leroy wrote:
> >> 
> >> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> >> each and every call to get_user() or put_user() performs heavy
> >> operations to unlock and lock kernel access to userspace.
> >> 
> >> SNDRV_PCM_IOCTL_SYNC_PTR ioctl is a hot path that needs to be
> >> optimised. To do that, perform user accesses by blocks using
> >> user_access_begin/user_access_end() and unsafe_get_user()/
> >> unsafe_put_user() and alike.
> >> 
> >> Before the patch the 9 calls to put_user() at the
> >> end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
> >> instructions about 9 times (access_ok - enable user - write - disable
> >> user):
> >>      0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
> >>      0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
> >>      0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
> >>      0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
> >>      0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
> >>      0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
> >>      1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
> >>      0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
> >>      0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
> >>      0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
> >> ...
> >> 
> >> A perf profile shows that in total the 9 put_user() represent 36% of
> >> the time spent in snd_pcm_ioctl() and about 80 instructions.
> >> 
> >> With this patch everything is done in 13 instructions and represent
> >> only 15% of the time spent in snd_pcm_ioctl():
> >> 
> >>      0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
> >>      0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
> >>      0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
> >>      0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
> >>      0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
> >>      4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
> >>      0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
> >>      0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
> >>      0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
> >>      5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
> >>      0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
> >>      0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
> >>      0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
> >> 
> >> Note that here the access_ok() in user_write_access_begin() is skipped
> >> because the exact same verification has already been performed at the
> >> beginning of the fonction with the call to user_read_access_begin().
> >> 
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >> This is a lighter version of previous patch "[PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()" focussing on identified hot path.
> >> Moved and nested the failure labels closer in order to increase readability
> > 
> > Thanks for the revised patch!
> > 
> > Although it's now much lighter, I still believe that we can reduce
> > get_user() / put_user() calls significantly by adjusting the struct
> > usage.
> > 
> > Could you check whether the patch below can improve?
> > (Zero-ing of sstatus can be an overhead here, but there are some
> > holes, and these need to be initialized before copying back...)
> > 
> 
> Thanks for the proposed patch. Unfortunately it doesn't improve the
> situation. The problem with copy_from_user() and copy_to_user() is
> that they perform quite bad on small regions. And for the from_user
> side we still get two user access enable/disable instead 3 and for the
> to_user side we still get two as well (Allthough we had 7
> previously). Those 4 user access enable/disable still have a cost.
> 
> Nowadays the tendency is really to go for the unsafe_put/get_user
> style, see some significant exemples below. And as mentioned in those
> commits, behind the performance improvement it also lead to much
> cleaner code generation.
> - 38ebcf5096a8 ("scm: optimize put_cmsg()")
> - 9f79b78ef744 ("Convert filldir[64]() from __put_user() to
> unsafe_put_user()")
> - ef0ba0553829 ("poll: fix performance regression due to out-of-line
> __put_user()")
> 
> Commit 38ebcf5096a8 is explicit about copy_to_user() being bad for
> small regions.
> 
> Here below is some comparison between the three way of doing
> snd_pcm_ioctl_sync_ptr_compat(), output is from 'perf top':
> 
> Initially I got the following. That 12%+ is the reason why I started
> investigating.
> 
>     14.20%  test_perf           [.] engine_main
> ==> 12.86%  [kernel]            [k] snd_pcm_ioctl
>     11.91%  [kernel]            [k] finish_task_switch.isra.0
>      4.15%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
>      4.07%  libc.so.6           [.] __ioctl_time64
>      3.58%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
>      3.37%  [kernel]            [k] sys_ioctl
>      2.96%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
>      2.73%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
>      2.58%  [kernel]            [k] system_call_exception
>      1.93%  libasound.so.2.0.0  [.] sync_ptr1
>      1.85%  libasound.so.2.0.0  [.] snd_pcm_unlock
>      1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
>      1.83%  libasound.so.2.0.0  [.] bad_pcm_state
>      1.68%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
>      1.67%  libasound.so.2.0.0  [.] snd_pcm_avail_update
> 
> With _your_ patch I get the following. copy_from_user() calls
> _copy_from_user() and copy_to_user() calls _copy_to_user(). Both then
> call __copy_tofrom_user(). In total it is 16.4% so it is worse than
> before.
> 
>     14.47%  test_perf           [.] engine_main
>     12.00%  [kernel]            [k] finish_task_switch.isra.0
> ==>  8.37%  [kernel]            [k] snd_pcm_ioctl
>      5.44%  libc.so.6           [.] __ioctl_time64
>      5.03%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
> ==>  4.86%  [kernel]            [k] __copy_tofrom_user
>      4.62%  [kernel]            [k] sys_ioctl
>      3.22%  [kernel]            [k] system_call_exception
>      2.42%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
>      2.31%  [kernel]            [k] fdget
>      2.23%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
>      2.19%  [kernel]            [k] syscall_exit_prepare
>      1.92%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
>      1.86%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
>      1.68%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
> ==>  1.67%  [kernel]            [k] _copy_from_user
>      1.66%  libasound.so.2.0.0  [.] bad_pcm_state
> ==>  1.53%  [kernel]            [k] _copy_to_user
>      1.40%  libasound.so.2.0.0  [.] sync_ptr1
> 
> With my patch I get the following:
> 
>     17.46%  test_perf           [.] engine_main
>      9.14%  [kernel]            [k] finish_task_switch.isra.0
> ==>  4.92%  [kernel]            [k] snd_pcm_ioctl
>      3.99%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
>      3.71%  libc.so.6           [.] __ioctl_time64
>      3.61%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
>      2.72%  libasound.so.2.0.0  [.] sync_ptr1
>      2.65%  [kernel]            [k] system_call_exception
>      2.46%  [kernel]            [k] sys_ioctl
>      2.43%  [kernel]            [k] __rseq_handle_notify_resume
>      2.34%  [kernel]            [k] do_epoll_wait
>      2.30%  libasound.so.2.0.0  [.] __snd_pcm_mmap_commit
>      2.14%  libasound.so.2.0.0  [.] __snd_pcm_avail
>      2.04%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
>      1.89%  libasound.so.2.0.0  [.] snd_pcm_lock
>      1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
>      1.76%  libasound.so.2.0.0  [.] __snd_pcm_avail_update
>      1.61%  libasound.so.2.0.0  [.] bad_pcm_state
>      1.60%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
>      1.49%  libasound.so.2.0.0  [.] query_status_data

Thanks for the detailed analysis!  Then unsafe_*_user() seems to be
the way to go.  I'll check your latest patches.


Takashi

