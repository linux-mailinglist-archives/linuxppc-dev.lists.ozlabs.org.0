Return-Path: <linuxppc-dev+bounces-2678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567719B4537
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 10:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd47x23Mnz2yVM;
	Tue, 29 Oct 2024 20:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730192669;
	cv=none; b=afjZpyL9RL37dg7kU0SpL136ff2lWJKLGJ1+95sNvLBv0SoqgK0rRBwtqgRJO98rq23v1wm/HG1Ktn2srU0k79+6VIjEdofdKX4b5RYE94N5Fi1J1UXVTtzAKP7Qqovc50Ov+Y/SYCKqN4dYyf5QwMlJFRzU9IF798g9IvTfJcKnVmO6rTrtipXY+jrQLtnDwOIX6atso1r6Yhej3RKmSatdji6fsdSEMweYDFeE+NZVmFJusQL+msJn+PlOG+3PGCbql1XWVRHz6WrQ/qBeXzaz3YcqvWWjB3BWbE3RxYQWUoW7SiwhcaUAaWEbbm6wQvjaGFvWQLz4Mxv8FXrzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730192669; c=relaxed/relaxed;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/tVGkyAVe4qlXAsdYOrW0fAnQi3eLigoYxOfaoorPuMrQ9f0y1RNJV1CMITBiYzEp1MMwzYGXKH9BT9dFReQ15OIE/z8saAvEI4WQzLMfGe3dVknJUzyUZ+RwjPO8cdBw02by4CQg4tz+o6blmGI7rk38HHL6/seAqrEJpErw4AfO62j/LacXsEkjgPgPqcpm5Um/syz9RBPRn6jkQ1e0um71JhA7xJIgTuGyBjV0LDY3YgkJizJ94yxVimiF9NSxB8/vwghd7c0VWeqkGmBNyAWFOSz7BK6EZ6siEv+p8rru/RAX3BCZGeWuGMGI3uD6QwS/ej/JLq+Uf0Fmj6NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o7QAkV3O; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ip+QCFtc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o7QAkV3O; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ip+QCFtc; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o7QAkV3O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ip+QCFtc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o7QAkV3O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ip+QCFtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd47v5mjDz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 20:04:27 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DB1B21F9D;
	Tue, 29 Oct 2024 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE9BA136A5;
	Tue, 29 Oct 2024 09:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id htNSMRGlIGf3FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Oct 2024 09:04:17 +0000
Date: Tue, 29 Oct 2024 10:05:21 +0100
Message-ID: <8734kf2sa6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
In-Reply-To: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zonque.org,gmail.com,free.fr,microchip.com,bootlin.com,tuxon.dev,nvidia.com,ellerman.id.au,csgroup.eu,kernel.org,linux.ibm.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -5.80
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 29 Oct 2024 08:37:47 +0100,
Uwe Kleine-König wrote:
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below sound to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of sound. sound/soc was already converted
> separately, so isn't mixed in here. While I usually prefer to do one
> logical change per patch, this seems to be overengineering here as the
> individual changes are really trivial and shouldn't be much in the way
> for stable backports. But I'll happily split the patch if you prefer it
> split.

It's fine to do this in a single shot.

I suppose this can be applied for 6.13, not necessarily to be merged
for 6.12-rc?


thanks,

Takashi

