Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88F6A2C1E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 23:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPMSK71XMz3chj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 09:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=exp0ZuoU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HFqnYYAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=exp0ZuoU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HFqnYYAj;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPMRJ28qzz3bZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 09:50:18 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CBE1C320083A;
	Sat, 25 Feb 2023 17:50:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 25 Feb 2023 17:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677365411; x=1677451811; bh=tmxpZ7oIgK
	0TkAA9mjGcktKtrG+/a/hmjd0+HlX7fns=; b=exp0ZuoUry1Z1xOcGmReG4Gh8e
	1diYJsYq5S0cgIj66iWD5l/dB46ape5/Ky/avIIJxjnlxeUe9RVAEFg6RdCUhv4w
	rFPTRTRSunjs885Oli2CN3GfaBUp7vYTu7GL7j98wq++uP9qbfIzQKiZZVjHp6wz
	rF6gaKVz78qMKqjzC8JadMpPNjvPafUXlbDcqnA//NCOGToHBw6YwI35WPfeDtXm
	VGBcSZVJeUJvaDAjH5QC+rtaAvK65eX/+OLWwjBzdSXYB3CeOVNhJhZM9OvkwsiZ
	lmg6lki3m4hZhTO9U65bLAdxEoY0rN1HhqFYulffgV68fH/3jKQOrTd6raoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677365411; x=1677451811; bh=tmxpZ7oIgK0TkAA9mjGcktKtrG+/
	a/hmjd0+HlX7fns=; b=HFqnYYAj/KraZSl94+vUbTCJrXSRzteSOO0Tj4V9Uji/
	VkCjK3lmja2GILOehTAXbSji0huN29JUmlDhhtG4KE0EqLIX7l3GVlq1pGFrWnkf
	g4fJ8tJA2CqEKdd5a6vvDp2fjFZ0kmJgQxXqAs3SwBqXK3IaPOi2QBFb1khuF6ZT
	NtZopYtz96QsiHZdYEonLRes5HLDWhQYLc/Xv7EQ7fvpkh0Pkpci/XzR9ABjccB+
	ydmEdE3U//u9hXndDczn2Gidlk0XKfGphtnRrGaKqpXkCwbZPWfyx7fPr0JzA0JL
	SZ6snyyq6zhBxOTgP4MrUxXwVy9oIs9ZeqJpixTmZQ==
X-ME-Sender: <xms:opD6YxpAa4s24ghx2m6p8fZvwd47zqEBioltUo9o50Ezsf-YSWcgqQ>
    <xme:opD6YzrDL6Q2IisqAHvydgv0I8rsuTfzrrcerLFu7DVC-YQ1BBJPTx4JBVyyBED91
    8nIM7MxxJK7tGjyisA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekjecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeetffen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggv
X-ME-Proxy: <xmx:opD6Y-OTlA5OwhO4MTo2qP-Z5sOZEictDdVzC6nLcBrMaUHDTXtlgA>
    <xmx:opD6Y85VSCYd9vegIC7w-neMcgGgDVJSbmYncYOCBS3EloHCP2NPZQ>
    <xmx:opD6Yw5hD0QIKWoPGrDBZqCVQ1h_OFw_zVVYDXCZf7MuTbXK7iDHMQ>
    <xmx:o5D6Y-kJ2JaQkAVmU-AW7Iy1QiHZ-2aAMas7TFeuNAsZfbxmWBP09g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AFC3FB60086; Sat, 25 Feb 2023 17:50:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <381dca28-726d-4118-81e1-9a9da4e87425@app.fastmail.com>
In-Reply-To: <Y/o8bQz5CuRhdD8B@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
Date: Sat, 25 Feb 2023 23:49:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Paul Gortmaker" <paul.gortmaker@windriver.com>,
 "Leo Li" <leoyang.li@nxp.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
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
Cc: Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 25, 2023, at 17:50, Paul Gortmaker wrote:
> [RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On 
> 24/02/2023 (Fri 21:16) Leo Li wrote:
>
> Thanks for confirming with your marketing team that they "do not
> recommend any new design with these SoCs" -- it also confirms the
> information I read on the web pages for the platforms.
>
> As those of us immersed in this world all know from the 101 basics of
> Product Life Cycle lessons, it doesn't matter if it is a phone or a
> set-top-box/PVR or whatever else kind of non-PC consumer device --
> kernel uprevs never happen in that product space.
>
> So with the best interests of the mainline kernel in mind, I think we
> are good to proceed with this for summer 2023.  And of course as I've
> said many times before - the kernel is in git, so really you can't
> delete anything anyway - it remains in history forever.

Thanks for working on this, this is a good step towards removing
the known unused code. One aspect I'd add from doing similar cleanups
on arm32 is that I would prioritize removing evaluation platforms
for SoCs that have no other supported boards, and then
garbage-collecting the device drivers that become unused.

I'm not sure where the RDB boards fit in that, in particular if
an unmodified kernel would work on a machine that is derived from
the reference platform, or if it really only works on the machine
itself. On most arm platforms, we moved to having only per-soc
"compatible" strings, but on Freescale ppc32 it appears that
the kernel always matches a board specific string and requires
patches in order to support anything else.

       Arnd
