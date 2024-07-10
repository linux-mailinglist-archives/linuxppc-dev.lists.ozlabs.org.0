Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9292D1F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 14:50:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=teTIciYZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=azzoWZRU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJyQ65JWGz3fRP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 22:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=teTIciYZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=azzoWZRU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.136; helo=flow1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJyPL2jdPz3dVw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 22:49:57 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id E33CC20042D;
	Wed, 10 Jul 2024 08:49:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 08:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm
	/JtEgtuTD5TSV9xTAWODaAOo5fjhNJeMk=; b=teTIciYZjvnAmtCaBvfsvRNjup
	wfCqM8oj1NVTM4jQ8jo5sskqJd9CXNwzX82No3oPh2ILjs4uutrlschv4dsLphU3
	DoHiZabk+5RNoNoz0INCQm1A/q0azsdpIKZ40BSY9zzvhrlrJsyAZoIB+AdhjZSM
	pglEr9LbbW0omvvUOv9xqemh9id/jhlr5i0OZnHACguZQxkJK5xIIlZPHl7qxIZi
	W18h/fh2fJqcEc9Qy9KDPKHfa/hVK9NfMC964RoDdIGpXNYZKvQ3LTPV8BpbXyRq
	/YSFUKn6ydo2t/RPLCAoY+yDhYs54/3qhWLzotGyYi2xcf1uXo+GhSqGYN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm/JtEgtuTD5TSV9xTAW
	ODaAOo5fjhNJeMk=; b=azzoWZRU5IySoav5jThTxI4/AKjfG7wh/UAeG5Y0yp/7
	pSjbpcVBoFNXfnK1AoPP/qA9CqwrRF8Dry0A37SxJCpk4Z5ullPkhy+gC2T5PlNW
	qtHzAzk/b8G5f3Tag6CJRkj0grWKT3j9AAJUB+sBlye1xyej0B+45sVmj7pFPIT0
	0C8phEMHJHLEtbkJkAqgb4SfK8Mg1xM0BHjBi1UepOwgPEnmdulrH+N+Got5FU1k
	1RVQ/Fe3Nc6RoIgAiYJC5LjOoh+Fk0b7Imsv7vkFNEtN+B28lrOP2iHu73sBprCP
	xkZ00fMz0ava03lyq9Jugs0eBmn8yWi7qreY8Gmasw==
X-ME-Sender: <xms:b4OOZh0Add5PpRvK-JwSRnx3M8MLRjt6lQVSLPf8bA1FKB4pYvBGow>
    <xme:b4OOZoE2nV6HZMpoyEVk3eDfC7dus2QqobaL3YCy7l8HFtBHVk97Nwkt_A9WozDEc
    C4EVANiB042rUeaNJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b4OOZh5zNJxlOfPHh0-H8WYSyelbHHrXbP1YSq7BCS2SyJWdegrqqQ>
    <xmx:b4OOZu1jTQpah1fyyddzLy-SSEDaDFK_TWeDgISB8kW5bliLViVMcg>
    <xmx:b4OOZkE-est_ti1vs2CHielhfk6js_rK4NVMMPgNmJ_Fck8MCdzLbg>
    <xmx:b4OOZv-Dzbnlfj9JbL0x2Cl3B8vEn5obOKRlDMYB5cv0l5MtlBW17Q>
    <xmx:coOOZviKtDwt5hZt1uJ3U9a5Mli5qRUVB721KXhKKAyxK8Y3E3_QlGxR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5425B60089; Wed, 10 Jul 2024 08:49:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To:  <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
References:  <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
Date: Wed, 10 Jul 2024 14:48:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Felsch" <m.felsch@pengutronix.de>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Russell King" <linux@armlinux.org.uk>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> new Kconfig symbol to select the I2C EEPROM driver support.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
>  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
>  arch/arm/configs/at91_dt_defconfig     | 2 +-
>  arch/arm/configs/axm55xx_defconfig     | 2 +-
>  arch/arm/configs/davinci_all_defconfig | 2 +-
>  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
>  arch/arm/configs/ixp4xx_defconfig      | 2 +-
>  arch/arm/configs/keystone_defconfig    | 2 +-
>  arch/arm/configs/lpc18xx_defconfig     | 2 +-

Applied to soc/defconfig, thanks

   Arnd
