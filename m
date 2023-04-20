Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6C6E942D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 14:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2Gyq43scz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 22:23:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UXWrJ2EE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Hf7YZCJ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=UXWrJ2EE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Hf7YZCJ1;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Gxt3NSkz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 22:22:25 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D55065C01A9;
	Thu, 20 Apr 2023 08:22:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 20 Apr 2023 08:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681993339; x=1682079739; bh=sZ
	ONUP6h+SJJnBCxfgbuzzXtSUZFZ3CJUwyCTkmq7Xg=; b=UXWrJ2EEvSiy24KMbi
	fOpjxO35+cBmgDE7F6QvpjvJAcc23bJlf2c6pqZRu5zeqK/HhqTkzQ+AbklUI5r1
	vV4RktufQbcODh2x1HBkLgxMMrQGKIKQAw8/PMXttqcziirs1IJenx5RmmTFrAMl
	/8Y45X2c1rk1vHeLI0bgaxK/bHqFaL6fTf6EA6BNC1vlPOcyrNaRpdCfYl4AUcLb
	uXhKGvOFaUZyhA57UzjmEoBCxxyncuaERsVmjWAbCYJjm6hDOaWQjNb2cK3Nnk6a
	pZIAguRdayXwLnrrMIf8uZasj/QpiZ0pMq2GgHa8ap55jaPF4G0DAXX1tX/z7wO2
	QKXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681993339; x=1682079739; bh=sZONUP6h+SJJn
	BCxfgbuzzXtSUZFZ3CJUwyCTkmq7Xg=; b=Hf7YZCJ1hzUf+3hn6Y3OxxyMZgL8i
	PN/hgEMQ5V0XaWicdiNtSvmHWbgNanzjnZ+YZ5arE5hBWFFYPyGfSVFckEA3wa0U
	y7U6nsAR5/qkpd6sZFRm1CIy1ubMvDFjqQWsbA3AJVbBpB8Y0EFIrTJtH1UAhhMB
	kOMfeDIlbqXzEzGjZxVd8/xuJ9X13FEjEHB8dj84RQ6GL+IY5Zfd6O1oRgAnNYRX
	uSA/bjY0JIjxLpWqg4Pk13mLPaK5OX0NXk3YfsaGKetfAhBTeEY8fTxgQucu17rt
	xejm00Egbcf/Ymh/+Jj1/ngFyhUpbyU0E9FoLcz3HBDBbJPRmWWaiyYHQ==
X-ME-Sender: <xms:ey5BZI7NI8R3UM7swGYU65cfll0oLLl7jJkR3kQPgqZSjCKfqgDT4g>
    <xme:ey5BZJ41ypjuCPWmB-_ULfXWacdRdJfku9BgPPhlIC7U76U5Lu0Cu77YjPm9YEh4E
    dd-9LrkRSzT6-bHDqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ey5BZHcgTSP7afLL2Ly7HJa4kgBCh5FOot5NhfcpWOpNEaavFDFsJA>
    <xmx:ey5BZNIombeMEXIsHXza8yedFKUPJgDUrLZp30tcja3zOvsg158BXA>
    <xmx:ey5BZMLRvsDvBxiF3PAoHk_uIaZscCP7T6FX8JZoVJ5JqBzfN2LA0g>
    <xmx:ey5BZKwd9vOyIog2uaUSb4za4BGatTv8tQEB_Re3wJ6lH5JCurK72g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 06C07B60086; Thu, 20 Apr 2023 08:22:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <747af785-963b-45e5-9d7b-d361951ea3fc@app.fastmail.com>
In-Reply-To:  <CA+G9fYsdMioe4+DEgeh38aTeaY3YaN_s_c0GFjPHhuPWfxyetA@mail.gmail.com>
References:  <CA+G9fYsdMioe4+DEgeh38aTeaY3YaN_s_c0GFjPHhuPWfxyetA@mail.gmail.com>
Date: Thu, 20 Apr 2023 14:21:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-next <linux-next@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>
Subject: Re: next: powerpc: gpio_mdio.c:(.text+0x13c): undefined reference to
 `__of_mdiobus_register'
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
Cc: Rob Herring <robh@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 20, 2023, at 12:57, Naresh Kamboju wrote:
> Following build failures noticed on Linux next-20230419 for powerpc.
>
> Regressions found on powerpc:
>  - build/gcc-8-defconfig
>  - build/clang-16-defconfig
>  - build/gcc-12-defconfig
>  - build/clang-nightly-defconfig
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log:
> --------
> powerpc64le-linux-gnu-ld: arch/powerpc/platforms/pasemi/gpio_mdio.o:
> in function `gpio_mdio_probe':
> gpio_mdio.c:(.text+0x13c): undefined reference to `__of_mdiobus_register'
> powerpc64le-linux-gnu-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
> phy_device.c:(.text+0x56ac): undefined reference to
> `devm_led_classdev_register_ext'
> powerpc64le-linux-gnu-ld: drivers/net/ethernet/pasemi/pasemi_mac.o: in
> function `pasemi_mac_open':
> pasemi_mac.c:(.text+0x19ac): undefined reference to `of_phy_connect'
> make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1

Same bug as the other one:

https://lore.kernel.org/all/20230420084624.3005701-1-arnd@kernel.org/

      Arnd
