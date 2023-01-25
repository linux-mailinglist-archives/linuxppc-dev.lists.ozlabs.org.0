Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CEC67C11B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2L6P6mvjz3fJV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:44:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFuvMgcE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFuvMgcE;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2L5S2QQYz2ypb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:43:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73C66B81C57;
	Wed, 25 Jan 2023 23:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C27C433EF;
	Wed, 25 Jan 2023 23:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674690229;
	bh=b2921ajz+XWP6WktKYBRKnR5y14nUKZxmUT6/Xr+08A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFuvMgcElUctJc/xpKYEY04hCq62CAjTt8VASzn+ZeWm0VSxnyRqK8Nc05EWzbGo3
	 8g33K8AulPNZIJ4MSqMv4tKxL8gomboMtSPT0kEtQtJeLFqFjkr2QgaYcxSmE4jEU0
	 q2BMGeGluN64YY2FAQHf6RrKTRwvJ7rBZlpftC8xW05sQEkzpgVAkZy/3+80DRHLaP
	 PCtLgZCIieFW6PONIEanl1sVee4aad2sy2Pn7ZMggi0Oi89nCSbnsJ91Dj6mZj/h60
	 0q/EhsTQhzPsaDEfdG1icYW4tg6UtTpqT4PUWcGAGVisQBYzUnWjmKBooMsf3EaEBd
	 AbtFjGy9Hv6PA==
Date: Thu, 26 Jan 2023 07:43:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Message-ID: <20230125234335.GC20713@T480>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230000139.2846763-8-sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 29, 2022 at 07:01:36PM -0500, Sean Anderson wrote:
> This adds appropriate bindings for the macs which use the SerDes. The
> 156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
> actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
> no driver for this device (and as far as I know all you can do with the
> 100MHz clocks is gate them), so I have chosen to model it as a single
> fixed clock.
> 
> Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
> This means that Lane A (what the driver thinks is lane 0) uses pins
> SD1_TX3_P/N.
> 
> Because this will break ethernet if the serdes is not enabled, enable
> the serdes driver by default on Layerscape.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> This depends on [1].
> 
> [1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/
> 
> Changes in v9:
> - Fix name of phy mode node
> - phy-type -> fsl,phy
> 
> Changes in v8:
> - Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
>   This should help remind readers that the numbering corresponds to the
>   physical layout of the registers, and not the lane (pin) number.
> 
> Changes in v6:
> - XGI.9 -> XFI.9
> 
> Changes in v4:
> - Convert to new bindings
> 
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>  drivers/phy/freescale/Kconfig                 |   1 +

The phy driver Kconfig change shouldn't be part of this patch.

>  2 files changed, 113 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> index 7025aad8ae89..534f19855b47 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> @@ -10,6 +10,8 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/phy/phy.h>
> +
>  #include "fsl-ls1046a.dtsi"
>  
>  / {
> @@ -26,8 +28,110 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	clocks {

Drop this container node.

Shawn

> +		clk_100mhz: clock-100mhz {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <100000000>;
> +		};
> +
> +		clk_156mhz: clock-156mhz {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <156250000>;
> +		};
> +	};
>  };
>  
> +&serdes1 {
> +	clocks = <&clk_100mhz>, <&clk_156mhz>;
> +	clock-names = "ref0", "ref1";
> +	status = "okay";
> +
> +	/*
> +	 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane numbers and pin
> +	 * numbers are _reversed_. In addition, the PCCR documentation is
> +	 * _inconsistent_ in its usage of these terms!
> +	 *
> +	 * PCCR "Lane 0" refers to...
> +	 * ==== =====================
> +	 *    0 Lane A
> +	 *    2 Lane A
> +	 *    8 Lane A
> +	 *    9 Lane A
> +	 *    B Lane D!
> +	 */
> +	serdes1_A: phy@0 {
> +		#phy-cells = <0>;
> +		reg = <0>;
> +
> +		/* SGMII.6 */
> +		sgmii-0 {
> +			fsl,pccr = <0x8>;
> +			fsl,index = <0>;
> +			fsl,cfg = <0x1>;
> +			fsl,type = <PHY_TYPE_SGMII>;
> +		};
> +	};
> +
> +	serdes1_B: phy@1 {
> +		#phy-cells = <0>;
> +		reg = <1>;
> +
> +		/* SGMII.5 */
> +		sgmii-1 {
> +			fsl,pccr = <0x8>;
> +			fsl,index = <1>;
> +			fsl,cfg = <0x1>;
> +			fsl,type = <PHY_TYPE_2500BASEX>;
> +		};
> +	};
> +
> +	serdes1_C: phy@2 {
> +		#phy-cells = <0>;
> +		reg = <2>;
> +
> +		/* SGMII.10 */
> +		sgmii-2 {
> +			fsl,pccr = <0x8>;
> +			fsl,index = <2>;
> +			fsl,cfg = <0x1>;
> +			fsl,type = <PHY_TYPE_2500BASEX>;
> +		};
> +
> +		/* XFI.10 */
> +		xfi-0 {
> +			fsl,pccr = <0xb>;
> +			fsl,index = <0>;
> +			fsl,cfg = <0x2>;
> +			fsl,type = <PHY_TYPE_10GBASER>;
> +		};
> +	};
> +
> +	serdes1_D: phy@3 {
> +		#phy-cells = <0>;
> +		reg = <3>;
> +
> +		/* SGMII.9 */
> +		sgmii-3 {
> +			fsl,pccr = <0x8>;
> +			fsl,index = <3>;
> +			fsl,cfg = <0x1>;
> +			fsl,type = <PHY_TYPE_2500BASEX>;
> +		};
> +
> +		/* XFI.9 */
> +		xfi-1 {
> +			fsl,pccr = <0xb>;
> +			fsl,index = <1>;
> +			fsl,cfg = <0x1>;
> +			fsl,type = <PHY_TYPE_10GBASER>;
> +		};
> +	};
> +};
> +
> +
>  &duart0 {
>  	status = "okay";
>  };
> @@ -140,21 +244,29 @@ ethernet@e6000 {
>  	ethernet@e8000 {
>  		phy-handle = <&sgmii_phy1>;
>  		phy-connection-type = "sgmii";
> +		phys = <&serdes1_B>;
> +		phy-names = "serdes";
>  	};
>  
>  	ethernet@ea000 {
>  		phy-handle = <&sgmii_phy2>;
>  		phy-connection-type = "sgmii";
> +		phys = <&serdes1_A>;
> +		phy-names = "serdes";
>  	};
>  
>  	ethernet@f0000 { /* 10GEC1 */
>  		phy-handle = <&aqr106_phy>;
>  		phy-connection-type = "xgmii";
> +		phys = <&serdes1_D>;
> +		phy-names = "serdes";
>  	};
>  
>  	ethernet@f2000 { /* 10GEC2 */
>  		fixed-link = <0 1 1000 0 0>;
>  		phy-connection-type = "xgmii";
> +		phys = <&serdes1_C>;
> +		phy-names = "serdes";
>  	};
>  
>  	mdio@fc000 {
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index 6bebe00f5889..b396162dc859 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -54,6 +54,7 @@ config PHY_FSL_LYNX_10G
>  	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
>  	select GENERIC_PHY
>  	select REGMAP_MMIO
> +	default y if ARCH_LAYERSCAPE
>  	help
>  	  This adds support for the Lynx "SerDes" devices found on various QorIQ
>  	  SoCs. There may be up to four SerDes devices on each SoC, and each
> -- 
> 2.35.1.1320.gc452695387.dirty
> 
