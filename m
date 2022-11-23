Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE631635498
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:10:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHFhG3Xvcz3dvX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 20:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RyeD1XMc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OcMnfzyI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RyeD1XMc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OcMnfzyI;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHFgD6pGWz3cGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:09:11 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DAE9A5C01CA;
	Wed, 23 Nov 2022 04:09:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 23 Nov 2022 04:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669194547; x=1669280947; bh=xTbvnTor0y
	2z6py9bJZ/CyzeYDZ3IglF6k6GbnfGf90=; b=RyeD1XMcC11R/wWlR6Kw9Z/s+B
	yYNFDO2itauhDGN7djvzeRxog/bHS97xeesDA2MPUs+womvGyaPvlJMJuIxqM7Y8
	Lk8pPbjUQntRRynAT1Lb830UtJCGOAs5v8Jg5doYNS+7oY9+2pwfZcyZzmHuC8Cs
	UeBEVlHgba9uAMuGjNLCwaXX/Q3JAUYeIzmvqV83v5IFtqGNhuolfrs/VIzT9rXx
	ibzdTZxCPUdWJA6H6ZNfT9NoznHNH2A2K88+6l/8hc8MI7OB251xnEBHpRG/4MCV
	VJd2sj2gVxS7MWRF+ARA/8ujXfzfevS5YdxTaIO/VdM3l1MYp2BlqxCJpItQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669194547; x=1669280947; bh=xTbvnTor0y2z6py9bJZ/CyzeYDZ3
	IglF6k6GbnfGf90=; b=OcMnfzyI6uIlpUfmFl567RrMUW788ReIXHlcU8Rx1pdL
	hNdLwjkaUtvOAWqj9C26zWXdJ+jeSG+xrg6m2uX13LR7sktE66kK1xb0YzYM407V
	eWW3Y4ZZdDlqVRNKI1b9FcrWH6wnEytjCucQJtcgVwRkP+NtSR9GIuknkpsT0462
	RQoSnzPan9TcssZH1L9jrRR08To4FOlm/LWUzTe/AJkRxAxs3bjhwd74KegQQa7c
	yWXyRHTDz6vDU7Eb1fUrlg13doZ1ovRS4i+AMGmj3ieoHU0Pd6+ncSz2KvNAgNfs
	NnaV6bJN+VOtd/Oi8X8ON9UhDlAlq/UYfYv7gcwS8A==
X-ME-Sender: <xms:MuN9Y_mrc4w5lK3MzR6I6lKzl3rq6tBlFgMpSevG2yOLX0kx33xMqA>
    <xme:MuN9Yy0LRHmN3sYSvCglTcL53YjwQnIfotJdiy6UWOuohjtnqljb4Jt1MxaLije3U
    9MZSpBhZpfiawxw2S4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedtgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepleetgfekhfetvdfhjeffvdfffedtleejjefhjeffieeuvdetieeffeehleeu
    jeffnecuffhomhgrihhnpehrvghlrdhrohenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:M-N9Y1qI3w4VbqUDkq2JfzV4EtLKbfFZxle35PZ_KKdObiMZtZgejA>
    <xmx:M-N9Y3lWiS1U-xmgGkTjByyEHPF3sRdLW4oaBrttJ8acsPx9eel75w>
    <xmx:M-N9Y91L-qhlWAPhOPLXO7Ic5wQpggycvjz3f_IOTDX_O80iO8-Vvw>
    <xmx:M-N9Y6m6KjWmT2vfKsQfnFN_YnkKkx1jr2SR8UrWUkFTK4W2RRWq4Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E5024B60086; Wed, 23 Nov 2022 04:09:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <4b10b87d-f255-4839-8700-858d98ffb801@app.fastmail.com>
In-Reply-To: <20221123031605.16680-1-rdunlap@infradead.org>
References: <20221123031605.16680-1-rdunlap@infradead.org>
Date: Wed, 23 Nov 2022 10:08:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 23, 2022, at 04:16, Randy Dunlap wrote:
> Fix build when CONFIG_FB_OF=y and CONFIG_DRM_OFDRM=m.
> When the latter symbol is =m, kconfig downgrades (limits) the 'select's
> under FB_OF to modular (=m). This causes undefined symbol references:
>
> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): 
> undefined reference to `cfb_fillrect'
> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): 
> undefined reference to `cfb_copyarea'
> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): 
> undefined reference to `cfb_imageblit'
>
> Fix this by allowing FB_OF any time that DRM_OFDRM != y so that the
> selected FB_CFB_* symbols will become =y instead of =m.
>
> In tristate logic (for DRM_OFDRM), this changes the dependency from
>     !DRM_OFDRM	== 2 - 1 == 1 => modular only (or disabled)
> to (boolean)
>     DRM_OFDRM != y == y, allowing the 'select's to cause the
> FB_CFB_* symbols to =y instead of =m.
>

Is it actually a useful configuration to have OFDRM=m and
FB_OF=y though? I would expect in that case that the OFDRM
driver never binds to a device because it's already owned
by FB_OF.

> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -455,7 +455,7 @@ config FB_ATARI
>  config FB_OF
>  	bool "Open Firmware frame buffer device support"
>  	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> -	depends on !DRM_OFDRM
> +	depends on DRM_OFDRM != y
>  	select APERTURE_HELPERS

I would instead make this 'depends on DRM_OFDRM=n', which
completely eliminates configs that have both driver enabled.

A nicer change would be to make FB_OF a tristate symbol,
which makes it possible to load one of the two modules if
both are enabled =m, while only allowing one of them to
be =y if the other is completely disabled. It looks like
offb was originally written to be usable as a loadable module,
but Kconfig has prevented this since at least the start of
the git history.

     Arnd
