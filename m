Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDB92D3CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 16:07:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b1QSu0yR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l/UJxZbD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK06R26fgz3dKG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 00:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b1QSu0yR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l/UJxZbD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.137; helo=flow2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow2-smtp.messagingengine.com (flow2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK05h1b3Hz3cb7;
	Thu, 11 Jul 2024 00:06:31 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id B9B1820041E;
	Wed, 10 Jul 2024 10:06:28 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 10:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1720620388;
	 x=1720627588; bh=FPzIeyUoxgy/zsvmREOhCT66sbHOjXoV3rwrfvjo/oM=; b=
	b1QSu0yRwxmUk4T9e11CNmCLrSiiiDvCTM+p6gNGgF4NyrNSLVIOHkUZBUOxpgxl
	d9vXjGnvw1RIRFEnGbndv/NcsmA2GLHmGzS5rJQPxTUIVRHIc5YsWzN3YlDlG8/w
	vwY2PFDGlan7ERoJa/sElHU/md+4c0p5HPfL6l9s8ZmMuKw48t/vLeQtyNT7xGQA
	08JzF7ADIoyXkY9zBh7hy27GqOe5iBkl5T6KQBAg4I7sSnV3Bx0wxfh4IffSCDrD
	EIVAL8hHH2Si9T8S7nGauN4LncCjezn9OQ+3j17vNfQLsEMR2BpYb0oenTLEqeam
	BkMUq/IWBWnOKLgWug2rTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720620388; x=
	1720627588; bh=FPzIeyUoxgy/zsvmREOhCT66sbHOjXoV3rwrfvjo/oM=; b=l
	/UJxZbDwRbte/g2yuSkS7yviFUoG8LxQcRmLaiOWFtKAn6XFD9z5i8BhgFiwj0y8
	29JjOMIc2w4FtrW9IR6h2qT2CtX2uPI+r/FHtrpLoTkSoPbJe3J1cehcgwZANS3t
	XYMJKq7TPb5u/bjrOem4WITUkAc4LfU2b5bDaz8AwaT3QByZ35D8ZMjHSS1yi35y
	36/dyXCkN+nwX8HvtBeT3ddkLpikQS8EZ4XXcTy6LBfF5l17hW9zP7dZMzOmMwhD
	XVJREG2So1zHmWfmY5D9lvTGvCqcKkIECCEfL0l0Epvm0v8FzfUmUtTmU/hw+Ez6
	qJJNz78tvzr+wlzfmgwog==
X-ME-Sender: <xms:YZWOZnV51EQeUhqFAlZ7tF76IbGPDn0AZ7wRftLLqANLQ8M0Tit2-g>
    <xme:YZWOZvnwaOkIlW8JDpVJ4uVPdX-o79KWjlklZpPYf1atbq30ICIdwRgOUhrJ5p-D2
    Q0py9B8mmaXogLqMVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YZWOZjaoGrXUw2M4_1y1ixokbMZsjZ3j3fcIkHhdLxC9KxWjE7s4BQ>
    <xmx:YZWOZiWPJTo6_33m1wPp7E5VWb0uw6xuIw-rKVLCCKI-iKqUbc-UEw>
    <xmx:YZWOZhn1-MjLOZ3xu0SsbEEBMly36iOA_myUgrsipjQv0pKFdaMeCQ>
    <xmx:YZWOZvdtJ2DdefwHMUz8i_IkZzQem-fWQbBtb87UMDnBEk3or4GmNA>
    <xmx:ZJWOZilNKpqeyxqgV0ZboZyCiXV66jXIKgbBPX_yaK6wioTafD0Okj0c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 213BBB6008F; Wed, 10 Jul 2024 10:06:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <64662665-929e-4d95-a9ac-c8f66bd83168@app.fastmail.com>
In-Reply-To:  <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
References:  <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
 <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
 <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Date: Wed, 10 Jul 2024 16:06:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jon Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2024, at 14:59, Bartosz Golaszewski wrote:
> On Wed, Jul 10, 2024 at 2:49=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
>> > The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of=
 the
>> > new Kconfig symbol to select the I2C EEPROM driver support.
>> >
>> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>> > ---
>> >  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
>> >  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
>> >  arch/arm/configs/at91_dt_defconfig     | 2 +-
>> >  arch/arm/configs/axm55xx_defconfig     | 2 +-
>> >  arch/arm/configs/davinci_all_defconfig | 2 +-
>> >  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
>> >  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
>> >  arch/arm/configs/ixp4xx_defconfig      | 2 +-
>> >  arch/arm/configs/keystone_defconfig    | 2 +-
>> >  arch/arm/configs/lpc18xx_defconfig     | 2 +-
>>
>> Applied to soc/defconfig, thanks
>
> No! Why? This is still being discussed and it's not clear it will even
> make it upstream.

Ok, dropped again, thanks for catching this.

     Arnd
