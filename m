Return-Path: <linuxppc-dev+bounces-9222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E6AD1C0E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 13:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG89c3ZNwz2xlL;
	Mon,  9 Jun 2025 21:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749466868;
	cv=none; b=XMhKSHwkers23CRi2Z2LUMzlAZfRwWy7KGVW2GBQoUPRS4RJ+qj1n4omAPK1PVQ0YSZogTHaMGa3KW2Bgas/3kTcnFs5J0BqZkWsFFIblw5UoQg/xGwCOnVzZ0YisYq/UBk0fRO/uUz/xMd7XpFM1k9bFI2J+bY7AwC5jGo0jLHgBx0VaN9DA7UissfNsq3d9bTqo/vK6HiXqczv0a89sYzM+pGLzxmc7+ctTiXiOlJ1o1hVJ7As0MuE1SXpQF6ohZJxPXEM1B+NoTffqHgwVkyMNIYz74DrmkRbeLbBJjMmd8y8ShbGLNzVLPlpnAO0BArU9XkfS0TdA8xol6WUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749466868; c=relaxed/relaxed;
	bh=AYDkissmsxsA6CZ2/OeDcVyhcRKbhFLuEAjl5FIP/C4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKU+0xviPRHCxmVLdOU1zE25QEq287w6V6H1kPrE40lIChFRd/yUy26XKVXpqSz4JdYrkrOWcZGz3PdLe+vkxkCtCOozrVOKO/JlAO+g6Oi0mA22QNsqzMUWNkQsonwLR1A71pZxNoO0oHz4Yx1lq+71vU2IITQlyKp+fLJI4SAkBBHyolnGbRR09ninZ7i7e2bu+s9Kdmx/gb2iOlPsEpMiuJrjcPNAjyJnCRyjUQ2ITLX1p6L3Vl0WMb/G7E9X/tHGoWu866muKmrhHs42OJLoVVxW0Qr1mHm4418W6aXm9BQh7disVLfZ7S4ffui6TFuNkkou6zLsZlTnVuOujw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GgAQO5Gd; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RaUrq8tV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GgAQO5Gd; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RaUrq8tV; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GgAQO5Gd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RaUrq8tV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GgAQO5Gd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RaUrq8tV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bG89W4Xg2z2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 21:01:03 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 867DC1F443;
	Mon,  9 Jun 2025 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749466860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYDkissmsxsA6CZ2/OeDcVyhcRKbhFLuEAjl5FIP/C4=;
	b=GgAQO5GddygkhIYveM6lNCArjjp734Wcs5dP1KYd4BQpFd6dSur5NCnJeg4FG11IZKW+89
	segwXyPdglI1cCwzQzEVBCI5q4IdafGmjyIwfwY9kWEs8IuHCMNNieaq1uunWtiUwDdJLu
	GToNpjkqp9kCHunIBchT5qHCXCbCBpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749466860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYDkissmsxsA6CZ2/OeDcVyhcRKbhFLuEAjl5FIP/C4=;
	b=RaUrq8tVarcHGkyzfrDfRtWMcIqJKoEs2FwkoTA87VIXWERbocthvYqqw7KITAKjnjXNKI
	cHB97qUoci3xLKDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749466860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYDkissmsxsA6CZ2/OeDcVyhcRKbhFLuEAjl5FIP/C4=;
	b=GgAQO5GddygkhIYveM6lNCArjjp734Wcs5dP1KYd4BQpFd6dSur5NCnJeg4FG11IZKW+89
	segwXyPdglI1cCwzQzEVBCI5q4IdafGmjyIwfwY9kWEs8IuHCMNNieaq1uunWtiUwDdJLu
	GToNpjkqp9kCHunIBchT5qHCXCbCBpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749466860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYDkissmsxsA6CZ2/OeDcVyhcRKbhFLuEAjl5FIP/C4=;
	b=RaUrq8tVarcHGkyzfrDfRtWMcIqJKoEs2FwkoTA87VIXWERbocthvYqqw7KITAKjnjXNKI
	cHB97qUoci3xLKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42B18137FE;
	Mon,  9 Jun 2025 11:01:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ne9+Duy+RmgmNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 11:01:00 +0000
Date: Mon, 09 Jun 2025 13:00:59 +0200
Message-ID: <87frg96uxg.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()
In-Reply-To: <6fbbb13e-aedd-47ad-a58b-cc00e9ea138c@csgroup.eu>
References: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
	<87zfeh72sz.wl-tiwai@suse.de>
	<6fbbb13e-aedd-47ad-a58b-cc00e9ea138c@csgroup.eu>
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
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 09 Jun 2025 12:02:00 +0200,
Christophe Leroy wrote:
> 
> 
> 
> Le 09/06/2025 à 10:10, Takashi Iwai a écrit :
> > On Mon, 09 Jun 2025 10:00:38 +0200,
> > Christophe Leroy wrote:
> >> 
> >> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> >> each and every call to get_user() or put_user() performs heavy
> >> operations to unlock and lock kernel access to userspace.
> >> 
> >> To avoid that, perform user accesses by blocks using
> >> user_access_begin/user_access_end() and unsafe_get_user()/
> >> unsafe_put_user() and alike.
> >> 
> >> As an exemple, before the patch the 9 calls to put_user() at the
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
> >> A couple more can be converted as well but require
> >> unsafe_copy_from_user() which is not defined on x86 and arm64, so
> >> those are left aside for the time being and will be handled in a
> >> separate patch.
> >> 
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >> v2: Split out the two hunks using copy_from_user() as unsafe_copy_from_user() is not implemented on x86 and arm64 yet.
> > 
> > Thanks for the patch.
> > 
> > The idea looks interesting, but the implementations with
> > unsafe_get_user() leads to very ugly goto lines, and that's too bad;
> > it makes the code flow much more difficult to follow.
> > 
> > I guess that, in most cases this patch tries to cover, we just use
> > another temporary variable for compat struct, copy fields locally,
> > then run copy_to_user() in a shot instead.
> 
> Thanks for looking.
> 
> I'll give it a try but I think going through a local intermediate will
> be less performant than direct copy with unsafe_get/put_user().

Yes, but the code readability is often more important than minor
optimizations unless it's in a hot path.


thanks,

Takashi

