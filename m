Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58E67C126
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:47:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2L9l0qL6z3fBK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:47:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gL/8dw7t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gL/8dw7t;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2L8r09gwz2y7W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:46:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0AD15B8198A;
	Wed, 25 Jan 2023 23:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF1CC433D2;
	Wed, 25 Jan 2023 23:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674690407;
	bh=yfSf5cHaKDbkpSmzL2FwktD546v/proNkErqGpnBwX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL/8dw7t9/5nlOI0qo8M/8qUMBFXm33FHJiTxcfGLEFRZwCGw56YyTLCeK9KVKSv0
	 i2n22rnVZiKD279pwuacPeGD20K7pQlnKPLcmkzGVEEiKi6gG3vUsE7RGLy1yOJhAp
	 uhrlcozh2c9W8UzWu14PejAnUVdUvEdVnG4yrWkWi5pBtPKThI7M6r6uxa5Sv71AKe
	 C5aGLDVLrvlcBEK7eO8j3QFrR7RJPvZ8OwLaG5DfFyvRXZdvvlZzHL9b3lCAWyzKh9
	 tQnAThQ/udbX7dGM92LDTogHrIYtw1merWDPmNjx1haWaRcLtDukBT0jtAH1uDR3wq
	 MncRpgPWAMgGQ==
Date: Thu, 26 Jan 2023 07:46:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 06/10] arm64: dts: ls1046a: Add serdes bindings
Message-ID: <20230125234638.GD20713@T480>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-7-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230000139.2846763-7-sean.anderson@seco.com>
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

On Thu, Dec 29, 2022 at 07:01:35PM -0500, Sean Anderson wrote:
> This adds bindings for the SerDes devices. They are disabled by default

s/bindings/descriptions?

The term "bindings" generally means the schema/doc in
Documentation/devicetree/bindings/.

Shawn

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
> - Describe modes in device tree
> 
> Changes in v2:
> - Use one phy cell for SerDes1, since no lanes can be grouped
> - Disable SerDes by default to prevent breaking boards inadvertently.
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index a01e3cfec77f..12adccd5caae 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -424,6 +424,24 @@ sfp: efuse@1e80000 {
>  			clock-names = "sfp";
>  		};
>  
> +		serdes1: serdes@1ea0000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#clock-cells = <1>;
> +			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
> +			reg = <0x0 0x1ea0000 0x0 0x2000>;
> +			status = "disabled";
> +		};
> +
> +		serdes2: serdes@1eb0000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#clock-cells = <1>;
> +			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
> +			reg = <0x0 0x1eb0000 0x0 0x2000>;
> +			status = "disabled";
> +		};
> +
>  		dcfg: dcfg@1ee0000 {
>  			compatible = "fsl,ls1046a-dcfg", "syscon";
>  			reg = <0x0 0x1ee0000 0x0 0x1000>;
> -- 
> 2.35.1.1320.gc452695387.dirty
> 
