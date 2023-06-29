Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B0742782
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:33:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=LcvTxzhq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fyh1ajjE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsKD50Jd0z3bVP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 23:33:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=LcvTxzhq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fyh1ajjE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsKCD0PYNz30fZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 23:33:12 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id B1FAF2B00152;
	Thu, 29 Jun 2023 09:33:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 09:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688045588; x=1688052788; bh=fz
	Ep5wc1N4xfnU7pMFQwstMWnCUW1KpffY9nt8n1q0E=; b=LcvTxzhqR3NoPlUVvK
	OSmh2HXq0TKY72TPC0mGFyZL0KXvjsqnUtwwDauvmZMJLb5NJHO5zC7uiIPaXimT
	gzsidicsFWLRov6t4tFnhjdpszLK6hNyyqPfbDn62gWWs0Kof8U6fw258RVzajax
	TvEI9fr4nmLUhZ9eWf5cl+Gznh5JCGNWo9vfb9WqVUcXA4M4zI8VmRSOc4Rpqa2j
	5ha9dObpeYiBRXh4uBF8Bo02V+0ZfPpN2oP/dF7iFMYdXyANDgvRcnqLaw0UQ7TO
	r1HYR4swvYxxa9cMKtxPWwjmkzaxBCii0Km30Ly6pgOJfleJm4wepJ/1GiUa/suS
	Y7xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688045588; x=1688052788; bh=fzEp5wc1N4xfn
	U7pMFQwstMWnCUW1KpffY9nt8n1q0E=; b=fyh1ajjE7le9b8SLHXPaGdLDEYcOx
	QNrQVUJ3xaaQqLGBpnORFKOR91qIZo0pC/rbPTctQCecVgWTu8aWuxe/ayiMwhSL
	eDIob7sa1BmbCpUowwbQwkuGz16jQSanIvdHA2EF8BgyO4NL3hh0u77vR4TeuGFE
	rEtOhAHeEVwheX+0G+0z5POYm6ret69YXQ+gaXS7thrMG3c0vVj9IaYGsJsEflu+
	T4OjKxK0ew2/nKXrZblbKAcre4LFmDxtHNMO5w/ZzKHZCdES6wCDDurx5azbCNGj
	6s0XP9I64f1KhHJXsIN9/c95TfKYzHJGQZmAuCAxQNaTiAIrzIxu8sIYA==
X-ME-Sender: <xms:E4idZMV1TZ_T3L1OGgGxaQRXCeYkusfJugarzOR0X6ER7zo3j4U1ig>
    <xme:E4idZAk_XBsf0yPJLS4HpxcfDS_SBW2sZXTpRIz4s9V7CixPu3dvFPi20dtIgIIa2
    EHaTmwg_vHZ_84GcAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FIidZAZFlWj2vEUzG_yB4LQnW0oUG11rZN2F6kzw5SfbSjBKBBEZoA>
    <xmx:FIidZLUz_b3eHtwof1uextcVJM0xyoPgF2i-WcMz6_OXQ7y-P6HUTw>
    <xmx:FIidZGlmYz7ER4kw5lF5QmjaRS8oj89uk5aCJueQwjKRM0mTbynAxA>
    <xmx:FIidZMqKRdv8aLoKEdCQCimSiWgxSqTvj2Xx6DnlK7ipqUPmlhTCgMzDnO4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DA5E4B60086; Thu, 29 Jun 2023 09:33:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <4d711508-c299-49f2-8691-e75d68f2485e@app.fastmail.com>
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
Date: Thu, 29 Jun 2023 15:31:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Subject: Re: [PATCH 00/12] arch,fbdev: Move screen_info into arch/
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
> The variables screen_info and edid_info provide information about
> the system's screen, and possibly EDID data of the connected display.
> Both are defined and set by architecture code. But both variables are
> declared in non-arch header files. Dependencies are at bease loosely
> tracked. To resolve this, move the global state screen_info and its
> companion edid_info into arch/. Only declare them on architectures
> that define them. List dependencies on the variables in the Kconfig
> files. Also clean up the callers.
>
> Patch 1 to 4 resolve a number of unnecessary include statements of
> <linux/screen_info.h>. The header should only be included in source
> files that access struct screen_info.
>
> Patches 5 to 7 move the declaration of screen_info and edid_info to
> <asm-generic/screen_info.h>. Architectures that provide either set
> a Kconfig token to enable them.
>
> Patches 8 to 9 make users of screen_info depend on the architecture's
> feature.
>
> Finally, patches 10 to 12 rework fbdev's handling of firmware EDID
> data to make use of existing helpers and the refactored edid_info.
>
> Tested on x86-64. Built for a variety of platforms.

This all looks like a nice cleanup!

> Future directions: with the patchset in place, it will become possible
> to provide screen_info and edid_info only if there are users. Some
> architectures do this by testing for CONFIG_VT, CONFIG_DUMMY_CONSOLE,
> etc. A more uniform approach would be nice. We should also attempt
> to minimize access to the global screen_info as much as possible. To
> do so, some drivers, such as efifb and vesafb, would require an update.
> The firmware's EDID data could possibly made available outside of fbdev.
> For example, the simpledrm and ofdrm drivers could provide such data
> to userspace compositors.

I suspect that most architectures that provide a screen_info only
have this in order to compile the framebuffer drivers, and provide
hardcoded data that does not even reflect any real hardware.

We can probably reduce the number of architectures that do this
a lot, especially if we get EFI out of the picture.

      Arnd
