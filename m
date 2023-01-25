Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448367C128
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2LDB2Nkfz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:49:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gDWtAfWb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gDWtAfWb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2LCH0fFLz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:48:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05FA7616A8;
	Wed, 25 Jan 2023 23:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6B3C433D2;
	Wed, 25 Jan 2023 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674690535;
	bh=XEe8zkYl5BVybaU3QY5R7IM0pyPQXzr1kJej+KUlLj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDWtAfWb3BXcxxlGNhh9AdTAPGhupaDp/wf6H+M9VheIaTriDe0fg+q4s6R3byKQN
	 BaJPXnM1w/51P50L0Bo+2Gv3SAm52g51NVPi2L2yn3MrDd+FoXmOdngr0/idJUCKQ2
	 yZTTcIS4iRErb4dVBNSwuhQrqGa6YgTvYyzwm6YV6j5vOhjwzmHLENdxd8occSHlt7
	 MHtgsIQkjvBLlE5snAAko0z7clXa3T42JcCyYuZxGKVutzoh7sUSC5nLh1qVKAJWmi
	 V7vZp4GjNy/fKzgR1VwodgzkTRQCe/+hy29bcjJjDayaqzrwStKk72GOoVVln6/24a
	 2jUTkEPIe0v9w==
Date: Thu, 26 Jan 2023 07:48:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 08/10] arm64: dts: ls1088a: Add serdes bindings
Message-ID: <20230125234845.GE20713@T480>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-9-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230000139.2846763-9-sean.anderson@seco.com>
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

On Thu, Dec 29, 2022 at 07:01:37PM -0500, Sean Anderson wrote:
> This adds bindings for the SerDes devices. They are disabled by default
> to prevent any breakage on existing boards.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Convert to new bindings
> 
> Changes in v3:
> - New
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 260d045dbd9a..ecf9d830e36f 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -238,6 +238,24 @@ reset: syscon@1e60000 {
>  			reg = <0x0 0x1e60000 0x0 0x10000>;
>  		};
>  
> +		serdes1: serdes@1ea0000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#clock-cells = <1>;
> +			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
> +			reg = <0x0 0x1ea0000 0x0 0x2000>;

Can we start the properties with compatible (and reg) like most of other
device nodes?

Shawn

> +			status = "disabled";
> +		};
> +
> +		serdes2: serdes@1eb0000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#clock-cells = <1>;
> +			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
> +			reg = <0x0 0x1eb0000 0x0 0x2000>;
> +			status = "disabled";
> +		};
> +
>  		isc: syscon@1f70000 {
>  			compatible = "fsl,ls1088a-isc", "syscon";
>  			reg = <0x0 0x1f70000 0x0 0x10000>;
> -- 
> 2.35.1.1320.gc452695387.dirty
> 
