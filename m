Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A021265A420
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Dec 2022 13:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NkhbZ39rXz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Dec 2022 23:42:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8Wrnvm1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8Wrnvm1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NkhYh19Fhz3bcN;
	Sat, 31 Dec 2022 23:40:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86ACF60B3B;
	Sat, 31 Dec 2022 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6599C433D2;
	Sat, 31 Dec 2022 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672490436;
	bh=1uolKVPyJ3cT1aENN4cDRp3M7MVup3Q86tGSFzUAcHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8Wrnvm1B3zN/g4PxnjqQYu+ZoGKXuJBk2wxYku6y3Ayqc1Dbd9HVNmbmMD4DmLCQ
	 NeW2G12TYpyA4fBzU9ySJnPevtLZFTmg5kX+R+fNabvw9wZt+IX5fw8d01Trv99Vf6
	 3Gf9td60NIhZMVV/jwSYaK5xU3Y1k2FPzFzgAYemUWJrdqpLysWCJGGPmbOszLWRXe
	 y/Z0PzDqjMhFgJTudu4fxESEvi5c4wz72wIyq3ksSuH+GrPlopPI7RUemSsaVvqPxy
	 At2NaKvLMMlLLnIC1a3/G0Wth/K0APXQIIPu8QLgkwBVZ5/a054SU8WjRpGoCxqkMi
	 STjxzWPT+l1RA==
Date: Sat, 31 Dec 2022 20:40:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 07/11] arm64: dts: freescale: Fix pca954x i2c-mux node
 names
Message-ID: <20221231124025.GV6112@T480>
References: <cover.1669999298.git.geert+renesas@glider.be>
 <3755a821121c472c9a9fd26a735c87ebb79484a5.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3755a821121c472c9a9fd26a735c87ebb79484a5.1669999298.git.geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Andrew Jeffery <andrew@aj.id.au>, Stefan Agner <stefan@agner.ch>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, Benjamin Fair <benjaminfair@google.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Nancy Yuen <yuenn@google.com>, Joel Stanley <joel@jms.id.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, 
 linux-mips@vger.kernel.org, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 02, 2022 at 05:49:22PM +0100, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pca9547@77: $nodename:0: 'pca9547@77' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pca9547@77: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@4' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!
