Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4665A40C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Dec 2022 13:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NkhYT3Lb1z3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Dec 2022 23:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZd/kwpi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZd/kwpi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NkhXR1VD7z2yNg;
	Sat, 31 Dec 2022 23:39:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16A7860B2C;
	Sat, 31 Dec 2022 12:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508BAC433EF;
	Sat, 31 Dec 2022 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672490370;
	bh=mx2OEoQ00vSqiKzsxyaDjTk2k5bw+w3jkZu1Lmf8ACQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZd/kwpiFOUBGTlIS1G+av5YM+JBWzkzYMw1zXnui/S1DYIWTClPGCtpPzvKN1AUX
	 TGD6ImyDKeWDB2WWV5FKv8Qqbx7n0kHffWXsoe1cd/7EbKkUEwVU3m4YjQjvM/FeWQ
	 b306W4LzUY+McesE10aA1roaaCW8GDbmyEnMjIdrwxhaRSK9YIMbCv/w4plzI3l2py
	 2XI0GvQWJ8jAXLIbF1qW7Qguo7gW7yiVjfs5xPVUYpPWrrCASjF+MlVDLLLcNYKjHe
	 QSN4t5FS8u0QVMjTUe7mVZfOH2JzJflhYmCg07R89Mb55rsSKoYnTaF0xo/MGg0Xur
	 H683DuATLPC4A==
Date: Sat, 31 Dec 2022 20:39:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 03/11] ARM: dts: imx: Fix pca9547 i2c-mux node name
Message-ID: <20221231123916.GT6112@T480>
References: <cover.1669999298.git.geert+renesas@glider.be>
 <fb231affc38b4d122c8ce733ea23f6da5c14f812.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb231affc38b4d122c8ce733ea23f6da5c14f812.1669999298.git.geert+renesas@glider.be>
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

On Fri, Dec 02, 2022 at 05:49:18PM +0100, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm/boot/dts/imx53-ppd.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arch/arm/boot/dts/imx53-ppd.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> 
> Fix this by renaming the PCA9547 node to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!
