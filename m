Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F35700E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 19:54:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YrHr3WNJzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 03:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LZnYzW45"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YrFT5wrSzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 03:51:57 +1000 (AEST)
Received: from localhost (c-67-164-175-55.hsd1.co.comcast.net [67.164.175.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B046B216FD;
 Wed, 26 Jun 2019 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561571514;
 bh=Sca4Z3OaKtXYUI/5YyPbiGGtd0DSIOE2gztWP1tFwRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZnYzW45b3DGtb+CSPIw9lW7eg1jZASAqQPgdDRKfJ/J8WWC8+6IG/TKWE9KqQEdV
 1qvhJ3wa+JEDaYDwsmK2m9ViNBpE+a6nXrW7LmK++vw19GHOw3SzLOY98opv9FCoEH
 8lOrIL5bqyp5EksDA0XqzgVxiLhcPXvGcyMNLcNo=
Date: Wed, 26 Jun 2019 12:51:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCHv2 2/2] PCI: layerscape: EP and RC drivers are compiled
 separately
Message-ID: <20190626175153.GC103694@google.com>
References: <20190626111139.32878-1-xiaowei.bao@nxp.com>
 <20190626111139.32878-2-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626111139.32878-2-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 arnd@arndb.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 kstewart@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 minghuan.Lian@nxp.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pombredanne@nexb.com, leoyang.li@nxp.com,
 shawnguo@kernel.org, shawn.lin@rock-chips.com, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If you post another revision for any reason, please change the subject
so it's worded as a command and mentions the new config options, e.g.,

  PCI: layerscape: Add CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately

On Wed, Jun 26, 2019 at 07:11:39PM +0800, Xiaowei Bao wrote:
> Compile the EP and RC drivers separately with different configuration
> options, this looks clearer.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - No change.
> 
>  drivers/pci/controller/dwc/Kconfig  |   20 ++++++++++++++++++--
>  drivers/pci/controller/dwc/Makefile |    3 ++-
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index a6ce1ee..a41ccf5 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -131,13 +131,29 @@ config PCI_KEYSTONE_EP
>  	  DesignWare core functions to implement the driver.
>  
>  config PCI_LAYERSCAPE
> -	bool "Freescale Layerscape PCIe controller"
> +	bool "Freescale Layerscape PCIe controller - Host mode"
>  	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	select MFD_SYSCON
>  	select PCIE_DW_HOST
>  	help
> -	  Say Y here if you want PCIe controller support on Layerscape SoCs.
> +	  Say Y here if you want to enable PCIe controller support on Layerscape
> +	  SoCs to work in Host mode.
> +	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
> +	  determines which PCIe controller works in EP mode and which PCIe
> +	  controller works in RC mode.
> +
> +config PCI_LAYERSCAPE_EP
> +	bool "Freescale Layerscape PCIe controller - Endpoint mode"
> +	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
> +	depends on PCI_ENDPOINT
> +	select PCIE_DW_EP
> +	help
> +	  Say Y here if you want to enable PCIe controller support on Layerscape
> +	  SoCs to work in Endpoint mode.
> +	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
> +	  determines which PCIe controller works in EP mode and which PCIe
> +	  controller works in RC mode.
>  
>  config PCI_HISI
>  	depends on OF && (ARM64 || COMPILE_TEST)
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index b085dfd..824fde7 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -8,7 +8,8 @@ obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
>  obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
>  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
>  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
> -obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o pci-layerscape-ep.o
> +obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
> +obj-$(CONFIG_PCI_LAYERSCAPE_EP) += pci-layerscape-ep.o
>  obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
>  obj-$(CONFIG_PCIE_ARMADA_8K) += pcie-armada8k.o
>  obj-$(CONFIG_PCIE_ARTPEC6) += pcie-artpec6.o
> -- 
> 1.7.1
> 
