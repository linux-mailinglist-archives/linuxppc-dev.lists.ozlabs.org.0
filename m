Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91661418EB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 07:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHs1c34Cpz2yNM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 15:40:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=diT6Gng5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NleN4unV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=diT6Gng5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NleN4unV; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHs0k6slVz2xth
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 15:40:06 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2C4B2580BC7;
 Mon, 27 Sep 2021 01:40:02 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=ak1/NyNHcL+y89gvyMRS1SkX9a8U
 UV2UncuVzD4o65U=; b=diT6Gng5AR5WB6gQReTE6zaaYmRzH7nxmiLpKVWe1q1z
 E37yJJnMLNKLxhIU/1n3lW2p0uba4K5VSAe4J1UBG7dFoVRpwGbSMQGBtVMXzsRG
 BNKUsr3ZjRRaBuSZfm5ZFq4FmN96YS+EmXAerY2Mo5Ih6yqx2BjhLklaaHxtK7sK
 OuOvakC3Z5JSAN4K5OSKCNXBKNhnk99uRBC+ZWnJuEt3D621j0fKzN0YxeHg/OJP
 VV8ncWeMKovAJF17uVAT3miGyPp135vr2BIAYg50BpHNnD4j5c6u2XXK6dCpcejG
 vG9VyrupeYOfPZIdlomy1KHi0IZ9La6kZ8NOcvRT+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ak1/Ny
 NHcL+y89gvyMRS1SkX9a8UUV2UncuVzD4o65U=; b=NleN4unVajTeBeEiak931q
 iqRGvaXFdxAUMpgNeqQR+buTPw1HKWzfcgKTbnWWcTFWP5O+z4QcAzXB2csa1MKx
 lAmFAyH7pffzQsdXUVlBGwd99yVio6vQA2fQZqU4jEZmLeIOMRayctKaocyIp34t
 5MV8SVzWMmOdv4eXBbwpEAPud2qp8SGy2PNpVFFL1/EMEkWJ3VmdCRiSogfxQmdp
 CpwuORA5pNkyGT6uQQDt5gtAQ0IrhZ+cva5xe1GVk9HuK9FKT98/FfkPvw8WF6Jr
 S96sug6xMiK9dDajX1nyshkhpv6IWALpxZqMH6i4AxB6V0M0cY0/5rt5nr58mZ4w
 ==
X-ME-Sender: <xms:L1lRYReMadmShvwxJ7Yp1n5SQr2S6rmJMLuxf5TOgZdNDLSaZXn0Lw>
 <xme:L1lRYfNr98SE5ZZz1cmmrjyeiVA090I-l56QJdaApXB-OWSPhIZUBtRMgA_kvhwtM
 sLd8yNsct83jSCph2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:L1lRYaiguV0BscYi_hIzrHWwI4YouVy_3RpEZfHsNKjOVpKFwd2rZQ>
 <xmx:L1lRYa_DI75kAK1JgESQWyfeHcG6zDoHDCcTscUm3VFRjoUPoU3chQ>
 <xmx:L1lRYdtPoXp-hnu0gyOmumQr-OWqFpazq-eqyNoIkWxQDEjzwT9wxg>
 <xmx:MllRYW-jA2G63ae78zi9DHtJ_FjL6HEXcvBOXjGSSeG1WVGpOWel0g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7811E51C0060; Mon, 27 Sep 2021 01:39:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
In-Reply-To: <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
Date: Mon, 27 Sep 2021 07:39:39 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Christian Zigotzky" <chzigotzky@xenosoft.de>
Subject: Re: Add Apple M1 support to PASemi i2c driver
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

Thanks already for volunteering to test this!

On Sun, Sep 26, 2021, at 22:27, Christian Zigotzky wrote:
> Hi Sven,
>
> I can't apply your patch 5 (i2c: pasemi: Split pci driver to its own 
> file). [1]

That's strange because it should apply cleanly. I'll double check
after to work today to see if I messed up while sending this.

>
> Error message:
>
> patching file b/drivers/i2c/busses/i2c-pasemi-core.c (renamed from 
> a/drivers/i2c/busses/i2c-pasemi.c)
> Hunk #3 FAILED at 344.
> 1 out of 3 hunks FAILED -- saving rejects to file 
> b/drivers/i2c/busses/i2c-pasemi-core.c.rej
> patching file b/drivers/i2c/busses/i2c-pasemi-core.h
> patching file b/drivers/i2c/busses/i2c-pasemi-pci.c
>
> Please post one patch with all your modifications.
>

Sure, will do that later as well!


Best,


Sven
