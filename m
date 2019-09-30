Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B6C23C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 16:57:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hlrN759hzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 00:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46hlp063qtzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 00:55:50 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76F028;
 Mon, 30 Sep 2019 07:55:46 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36E9A3F706;
 Mon, 30 Sep 2019 07:55:46 -0700 (PDT)
Date: Mon, 30 Sep 2019 15:55:44 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v4 10/11] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Message-ID: <20190930145544.GB42880@e119886-lin.cambridge.arm.com>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-11-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924021849.3185-11-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 devicetree@vger.kernel.org, jingoohan1@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 gustavo.pimentel@synopsys.com, leoyang.li@nxp.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 10:18:48AM +0800, Xiaowei Bao wrote:
> Add PCIe EP node for ls1088a to support EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
> v2:
>  - Remove the pf-offset proparty.
> v3:
>  - No change.
> v4:
>  - No change.
>  
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index c676d07..da246ab 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -483,6 +483,17 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3400000 {
> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03400000 0x0 0x00100000
> +			       0x20 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <24>;
> +			num-ob-windows = <128>;
> +			max-functions = /bits/ 8 <2>;
> +			status = "disabled";
> +		};
> +
>  		pcie@3500000 {
>  			compatible = "fsl,ls1088a-pcie";
>  			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
> @@ -508,6 +519,16 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3500000 {
> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03500000 0x0 0x00100000
> +			       0x28 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <6>;
> +			num-ob-windows = <8>;
> +			status = "disabled";
> +		};
> +
>  		pcie@3600000 {
>  			compatible = "fsl,ls1088a-pcie";
>  			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
> @@ -533,6 +554,16 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3600000 {
> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03600000 0x0 0x00100000
> +			       0x30 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <6>;
> +			num-ob-windows = <8>;
> +			status = "disabled";
> +		};
> +
>  		smmu: iommu@5000000 {
>  			compatible = "arm,mmu-500";
>  			reg = <0 0x5000000 0 0x800000>;
> -- 
> 2.9.5
> 
