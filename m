Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDE742867
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 16:30:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=2EcylAr+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qcZu2F7J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsLTQ6pBsz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 00:30:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=2EcylAr+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qcZu2F7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsLST5tlQz305g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 00:29:45 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 9B6A02B000A4;
	Thu, 29 Jun 2023 10:29:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 10:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688048978; x=1688056178; bh=nG
	nJsyAJyrvJkwnkSe1+RvyafOFNiNiqyHMsPO1u6Xk=; b=2EcylAr+2IQK5P7b6p
	/vjLbGIHf8i+8rzMt8chAuFq+c5T2nXA6rNsTNzOdtksQ6e0sAw9/eRHtOar+WHl
	hAsaWivSScicHRc+IOwIVIkXzMKCHS/A9Ffztx8GB0RJptxk+yUbu3OXBw/f3KTQ
	oPUWqOApNqupZeOxA1+KamV7Y1R9j5wdLjjMttKjfSUmTUPTzRkr/PbCf7BFCJf4
	mDKkwIwEguDSpZs+nb5nQ5ZSuOg9qrQBVpn/A0WtJOxqM4NA4/h3SXbcRbNONYzA
	I5y/p+xe7tbFRUhSHoYPvHtNe3/fi0gTCERIIZJ9/fLQnFzpbVcymrZbyXkaYBBK
	ODIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688048978; x=1688056178; bh=nGnJsyAJyrvJk
	wnkSe1+RvyafOFNiNiqyHMsPO1u6Xk=; b=qcZu2F7J3I03fwrcSPg8dsLuhFIrS
	ucycm657dud2E6uYWskFVqcIfgSe/dBt8fFB6+XQTy/fANN6a1BuztN45oTSanNT
	XxVMQih8LW415rbF6tRZPCXSpwn+ekET+YIRIH1036pYAwUd1Fb1ijQRv3N+j2GN
	AxU6byz7HLauD8dLGeOrAT3BJrYb8oPjklQK9FEAS/EPJOPUSZb+pzy/zrsduOA2
	IVQQiY6wMEEkf+oC5juPiNw0sDEEHj+C7FUzhU16m7yof5koi7/AUsQnx7vi7hIE
	YvfD9R33aPOCag5rTXjki4uvznKy226FqetZdturkKSXU4rXB99QQtsyg==
X-ME-Sender: <xms:UZWdZPQFtBYsPdlXlUSdNixOakdgSk0rQ0sJEW2WMk3NI57JBkFXZA>
    <xme:UZWdZAzd5cSzTnb4-3WR64AVGeqojUQ8_r8RCWCNfeGwQuSKyph38WHIvHfKtGQ9D
    iuBERCaWpz0v8yUOfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:UZWdZE0-6IC7fBNDeGBvpnGm2Zr-dhEGRLTF93khPbJEJ5EkVp6Jfw>
    <xmx:UZWdZPAguwQt8yn2qe__L5Yzs-USfTNjeEYazXWLDNvlZmzvvwKQYg>
    <xmx:UZWdZIhqyNx_om12J_mIvSUHmK-q2dXchnc5mILhG3AL8P9Et1GMBA>
    <xmx:UpWdZB0EDG72hkx-t3BFD4YV93ZdrsN0Q1V64IlAbDxvxvOYULKpsP-j2j8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C13A1B60089; Thu, 29 Jun 2023 10:29:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <0783a7ec-b779-4033-9877-f6eacc65c575@app.fastmail.com>
In-Reply-To: <4d711508-c299-49f2-8691-e75d68f2485e@app.fastmail.com>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <4d711508-c299-49f2-8691-e75d68f2485e@app.fastmail.com>
Date: Thu, 29 Jun 2023 16:29:17 +0200
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

On Thu, Jun 29, 2023, at 15:31, Arnd Bergmann wrote:
> On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
>>
>> Future directions: with the patchset in place, it will become possible
>> to provide screen_info and edid_info only if there are users. Some
>> architectures do this by testing for CONFIG_VT, CONFIG_DUMMY_CONSOLE,
>> etc. A more uniform approach would be nice. We should also attempt
>> to minimize access to the global screen_info as much as possible. To
>> do so, some drivers, such as efifb and vesafb, would require an update.
>> The firmware's EDID data could possibly made available outside of fbdev.
>> For example, the simpledrm and ofdrm drivers could provide such data
>> to userspace compositors.
>
> I suspect that most architectures that provide a screen_info only
> have this in order to compile the framebuffer drivers, and provide
> hardcoded data that does not even reflect any real hardware.
>
> We can probably reduce the number of architectures that do this
> a lot, especially if we get EFI out of the picture.

I tried to have another look at who uses what, and here are
some observations:

- EFIFB and hyperv are the only ones that are relevant on modern
  systmes, and they are only used on systems using EFI, so they
  could use a separate data structure that is defined as part of
  drivers/firmware/efi. This would likely mean we don't have to
  define a separate screen_info for arm64, loongarch, ia64 and
  riscv, and could separate the legacy vgacon/vesafb stuff on
  arm32 from the efi side.

- FB_SIS can likely be marked 'depends on X86' like FB_INTEL,
  it seems to depend on x86 BOOT_VESA_SUPPORT.

- FB_VGA16 is currently support on powerpc and enabled on
  one defconfig (pasemi), which I'm fairly sure is a mistake,
  so this could be made x86 specific as well.

- VGA_CONSOLE has a complicated Kconfig dependency list that
  lists platforms without VGA support but I think this is better
  expressed with a positive list. It looks like csky, hexagon,
  nios2 and xtensa should be excluded here and not provide
  screen_info.

- arm and mips only need to provide screen_info on machines
  with VGA_CONSOLE. On Arm we have a dependency on
  footbridge/integrator/netwinder, while on mips the
  dependency can be added to the platforms that fill
  the info (mips, malta, sibyte, sni).

- DUMMY_CONSOLE only uses screen_info on arm, and this should
  likely be limited to the three obsolete machines that
  support VGACON. Almost all Arm machines use DT these days
  and won't ever fill the screen info dynamically.

      Arnd
