Return-Path: <linuxppc-dev+bounces-17892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCFMA0e2rmkSHwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:00:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6B238540
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:00:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTwYZ4FSWz3bnm;
	Mon, 09 Mar 2026 23:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773057602;
	cv=none; b=lcOgp3kgVvDwYdUiIsf4L8iffgBw0R5LcFzAE6dYV+ARVUa6g6D2skEttsP2j0EW70FwVVqTF3w0wVROu781hUASh0OXlyvWO48ZnOeWLj29CnHUlqj28+iMGrMJ23ezGTZ+829lcjo5OxVqKIMdbFqEItF0JTAJNVPD1OF012HPRm3VUH6Bh70Z6MyztNYn+tll4CqrwTDto6ljrWnARjYDsL9E116iBKV7cylt3uywBxZgbHK3e0TRn0fa2z2PyOEnCZ5I5VCFHv4+lyBf0VbLXux2yVrEhOuJ7WBnU8PeJOClreqWsI4YZjuldJUvxuuDqJpQ/RuDHsIJ80KruA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773057602; c=relaxed/relaxed;
	bh=Y2XKH/glVvKIHxkYZx605ZSWZPl5fwhHS9csfxByePA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xe/6nE3Ba16oXeHLie3U0gXZHhXp1KPnn/AXf+5QS19zNaPHGI0qgmTs0fmzqm9uZLNyD02+UDHYh5k5dp1Qy+xltddao4Lo31on1U3DHClP3BSl0OqafL5ifFtMYGPpYybGzgLke2y982wFoFsZnERqVx8taLXxCPoxnbxNsUK1XHacHUfRQNbpQN+as4xQCH84TwGgGicnZdSY2bd+qXuEJDkv5zv2JWZ6CdnxtogNRISn5yENcU5k1PWG3POjjhZxCcepYtIgO066KljWPZaR1Dps+BJHszX852PSIhVX/w+z4bTBtnghaEg8tttKqlJjjuzrPEMiku/lvz50Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qZYEnqzK; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iqg9jVsT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qZYEnqzK; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iqg9jVsT; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qZYEnqzK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iqg9jVsT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qZYEnqzK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iqg9jVsT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTwYX51GJz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 23:00:00 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72E635BDE4;
	Mon,  9 Mar 2026 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773057596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2XKH/glVvKIHxkYZx605ZSWZPl5fwhHS9csfxByePA=;
	b=qZYEnqzK1ikbR4BBvUHdBv6bvyU7unV1bvQVy1rkjjWBoyibGQGLKF0ThiTVEJYbSpxlfA
	QtdToMFPyvsISRgEJsm3Acdfhd6t98dwveMR4Hm5aRSE08pH2IpAZFuTOT9U2el/8g0hp4
	SCp8Kxu4wGRp+XLhRV12tw39Ro7J8ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773057596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2XKH/glVvKIHxkYZx605ZSWZPl5fwhHS9csfxByePA=;
	b=iqg9jVsTGgYSE3XjbD39+BsLT+VLoJYPcMqfLmN+wW6odLoUsiFSrpWuPIr1BxsKQy55we
	4BWoayVgXwkdC0Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773057596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2XKH/glVvKIHxkYZx605ZSWZPl5fwhHS9csfxByePA=;
	b=qZYEnqzK1ikbR4BBvUHdBv6bvyU7unV1bvQVy1rkjjWBoyibGQGLKF0ThiTVEJYbSpxlfA
	QtdToMFPyvsISRgEJsm3Acdfhd6t98dwveMR4Hm5aRSE08pH2IpAZFuTOT9U2el/8g0hp4
	SCp8Kxu4wGRp+XLhRV12tw39Ro7J8ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773057596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2XKH/glVvKIHxkYZx605ZSWZPl5fwhHS9csfxByePA=;
	b=iqg9jVsTGgYSE3XjbD39+BsLT+VLoJYPcMqfLmN+wW6odLoUsiFSrpWuPIr1BxsKQy55we
	4BWoayVgXwkdC0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B0E33EEB0;
	Mon,  9 Mar 2026 11:59:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8bgzCTy2rmkFHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 11:59:56 +0000
Date: Mon, 09 Mar 2026 12:59:55 +0100
Message-ID: <87zf4hmcw4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: Handle empty codec list in i2sbus_pcm_prepare()
In-Reply-To: <20260309114159.765304-3-thorsten.blum@linux.dev>
References: <20260309114159.765304-3-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D4D6B238540
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17892-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:johannes@sipsolutions.net,m:perex@perex.cz,m:tiwai@suse.com,m:kees@kernel.org,m:stable@vger.kernel.org,m:tiwai@suse.de,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tiwai@suse.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026 12:41:59 +0100,
Thorsten Blum wrote:
> 
> Replace two list_for_each_entry() loops with list_first_entry_or_null()
> in i2sbus_pcm_prepare().

Hmm, I guess both can be simply list_first_entry(), as the codec list
in this code path is guaranteed to be non-empty (it's called after
i2sbus_pcm_open() which has the check of the valid codecs).

> Handle an empty codec list explicitly by returning -ENODEV, which avoids
> using uninitialized 'bi.sysclock_factor' in the 32-bit code path.

Which 32bit code path are you referring to...?


thanks,

Takashi

