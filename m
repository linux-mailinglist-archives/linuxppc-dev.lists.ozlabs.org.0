Return-Path: <linuxppc-dev+bounces-2730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DA9B6499
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 14:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdpPZ4Z12z2yh1;
	Thu, 31 Oct 2024 00:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730296130;
	cv=none; b=l3z9Y3kHeimN5ft74MyDnw350jbPnUxjAorWmkaOliU1GfVU9gVHruE4435/Rzsn+ZQNtHSIbrK660LvKcAWY0hs0VLvov2eOtl7Zd4mNqsrbkgXONU3hxRAaDXE+f4Mk9in3v236tGs01XkT+HQ5y1LfbQ/QI9kwELsRn8JYSn7JkKKjBNsZRemBFh4WMz1GYveWJtt1Lx4Vp6VoVzwOyUy767xTLstc8jX/JBMuEsBpFRa4ymmHROOgoj3XReVN04ZQvs5pza9DVA+Ru/x/nWUeAW7wm8DskRbQnkTctTsAFVqELqkvVhDIeUE95usFZquptcaDUh7jkhofgCk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730296130; c=relaxed/relaxed;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxP9LUxw5+jUgLDtPm99fRlT2jy3DYhnu4QBNqKePBtarQsllDspZBzzhzIcNFmkAP+Gb4tGH/Ht7FaAI+d7ctT0GycAzfP6X5mxJs//YGo53lRH8X+NoD10BZkXkAL//OzqgxmszlSJ+0zLtCjxlX5Vh5L7x8jSqeNXQi9VpBRuNssakyRZdrPTpf+XHYD4Bo9DW5TdelP9Xznu6yfTAi1u8llwoZGqMxRPgf7liqUGZfTCNp52CTMr7w9+wzsM8fn7R6wK3y3j0JFYzT44br6LFTfan2ChQx1r292mXBHbFQHwqkrzmD9mBx7KjBXVQNWXHlodBdaihqCEM/k1Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b85UkjG+; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=n6xdAIGd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b85UkjG+; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=n6xdAIGd; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b85UkjG+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=n6xdAIGd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b85UkjG+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=n6xdAIGd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdpPY0m6dz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 00:48:48 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A977221F21;
	Wed, 30 Oct 2024 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730296123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=b85UkjG+Fw9dOoARUdsSpml+OacZxumFjg49UWHcDnjcLeRJMtrKJbzUbIXB7SMib/t/7b
	7MGW9LacBsXIAWZtBX9wj8jaXImpcFB0eVpf1iirVAuzSe+jDkpHkNlC+JkIEU71W7d/wF
	SKXL243SdNksQ8GVsQYrRAhKWbKBjko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730296123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=n6xdAIGdff0vZvxsrUzs4lNayiLsrlaAhPWZ0MXBXz37G/JlcPhYlJjQSLpp6Wq3tMHCio
	B8vcCFHuEHZEsiAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730296123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=b85UkjG+Fw9dOoARUdsSpml+OacZxumFjg49UWHcDnjcLeRJMtrKJbzUbIXB7SMib/t/7b
	7MGW9LacBsXIAWZtBX9wj8jaXImpcFB0eVpf1iirVAuzSe+jDkpHkNlC+JkIEU71W7d/wF
	SKXL243SdNksQ8GVsQYrRAhKWbKBjko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730296123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=n6xdAIGdff0vZvxsrUzs4lNayiLsrlaAhPWZ0MXBXz37G/JlcPhYlJjQSLpp6Wq3tMHCio
	B8vcCFHuEHZEsiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35CDD13AD9;
	Wed, 30 Oct 2024 13:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yCb1Czs5ImcJeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Oct 2024 13:48:43 +0000
Date: Wed, 30 Oct 2024 14:49:46 +0100
Message-ID: <87sesdya2t.wl-tiwai@suse.de>
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
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
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

Applied to for-next branch now.


thanks,

Takashi

