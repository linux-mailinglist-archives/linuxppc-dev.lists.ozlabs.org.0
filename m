Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0899246AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 19:51:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fp8a4ALq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD9SL5KVdz3cYR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 03:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fp8a4ALq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pratyush@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD4gl2Z34z3fnh;
	Wed,  3 Jul 2024 00:15:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3735661D50;
	Tue,  2 Jul 2024 14:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16EC116B1;
	Tue,  2 Jul 2024 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719929727;
	bh=Yj29D4k1LcVn7Ks20rGXW4rvIpFaMTU+k2U6e4btBIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fp8a4ALqKzJzQAFeAuZkwqCTvJuj0YtIUipMdlDd1rdkIFeKnzJXvTU3ZN0hz7K3I
	 gdGUBWehue5RqVC5hGNOUvvuyOunqynlN5KMwgWGLsZkZ1bjI6ci4xj01PXjke6cF8
	 p/8NbVcc0wZLJ+yL0JRUzNF2LdURmYzmHW6CDju7ahJGwtuuwL4Mzn+Aj/Z1wcz5bH
	 oWLRk0GLRph+pRoW5289upyRK2T1BiUlNsysIDE7Lh88Pb71ZAoYouEyj8x2rrNUUH
	 b1aKcrmm/8bQuL0VWowbIbLBntgCeNZ+kZbpWxKHVFdpLswkkGR7QKvlhrlM+MW3hn
	 NrIInqs3S0POA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
In-Reply-To: <20240702-congenial-vigilant-boar-aeae44@houat> (Maxime Ripard's
	message of "Tue, 2 Jul 2024 15:56:52 +0200")
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
Date: Tue, 02 Jul 2024 16:15:20 +0200
Message-ID: <mafs0ed8byj5z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 03 Jul 2024 03:49:43 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02 2024, Maxime Ripard wrote:

> On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
>> On Mon, Jul 01 2024, Tudor Ambarus wrote:
>> 
>> > On 7/1/24 2:53 PM, Marco Felsch wrote:
>> >> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
>> >> as single device isn't always sufficient. There may be partitions which
>> >> require different access permissions. Also write access always need to
>> >> to verify the offset.
>> >> 
>> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
>> >> EEPROMs are memory-technology devices and the framework already supports
>> >
>> > I was under the impression that MTD devices are tightly coupled by erase
>> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?
>> 
>> I was curious as well so I did some digging.
>> 
[...]
>> 
>> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
>> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
>> drivers under a single interface. I am not sure what came of it though,
>> since I can't find any patches that followed up with the proposal.
>
> That discussion led to drivers/nvmem after I started to work on
> some early prototype, and Srinivas took over that work.

So would you say it is better for EEPROM drivers to use nvmem instead of
moving under MTD?

-- 
Regards,
Pratyush Yadav
