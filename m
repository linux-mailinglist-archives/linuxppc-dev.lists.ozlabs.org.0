Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDDF62C3A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:13:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Q15yztz3cMp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:13:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gzytv9kU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gzytv9kU;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7P356hzz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:12:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1AC99CE1AC0;
	Wed, 16 Nov 2022 16:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE15C433D6;
	Wed, 16 Nov 2022 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615152;
	bh=Rn7Nc50AVK6jlLilbRU6MRtj/cHhn4muJZ1MUHKGRNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gzytv9kUPtIFc2VD37vJKqFE0Z5NBCcilC7k5DWiTRzbwbWlMqc33Xmmfwkf/w1Ne
	 74+QlztgNh3bUDFeFcykqC4IrrUTmyCYvM0vlY0r9aKDbwjSE8b7wDnBkFPeN3r1cm
	 Ks8VNflM4mbam7ZCJthbj0UqtQvxmrPNWoDpoNA9JCSyQSpvKuJ512kl24cwbMdzLL
	 Y3bypPWt2SuZ+EgnrvX44mGPt/0iU5AD+FBM2mu/ycg+fxGBUDUotk81RUReTRAIc8
	 mqLRwxTD4ejmEPsA5QS0vy2yseYCInj7fkpwUP60CESpc+gLnaKb01MIOTDxhuDGdx
	 5ioUQRkErS3Xw==
Date: Wed, 16 Nov 2022 10:12:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 15/39] PCI/MSI: Get rid of PCI_MSI_IRQ_DOMAIN
Message-ID: <20221116161230.GA1113864@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.467556921@linutronix.de>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:38PM +0100, Thomas Gleixner wrote:
> What a zoo:
> 
>      PCI_MSI
> 	select GENERIC_MSI_IRQ
> 
>      PCI_MSI_IRQ_DOMAIN
>      	def_bool y
> 	depends on PCI_MSI
> 	select GENERIC_MSI_IRQ_DOMAIN
> 
> Ergo PCI_MSI enables PCI_MSI_IRQ_DOMAIN which in turn selects
> GENERIC_MSI_IRQ_DOMAIN. So all the dependencies on PCI_MSI_IRQ_DOMAIN are
> just an indirection to PCI_MSI.
> 
> Match the reality and just admit that PCI_MSI requires
> GENERIC_MSI_IRQ_DOMAIN.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Just FYI, this will conflict with my work-in-progress to add more
COMPILE_TEST coverage:
  https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?id=72b5e7c401a1

No *actual* conflicts, just textually next door, so should be sipmle
to resolve.  Worst case I can postpone my patch until the next cycle.

> ---
>  arch/um/drivers/Kconfig                 |    1 
>  arch/um/include/asm/pci.h               |    2 -
>  arch/x86/Kconfig                        |    1 
>  arch/x86/include/asm/pci.h              |    4 +-
>  drivers/pci/Kconfig                     |    8 +----
>  drivers/pci/controller/Kconfig          |   30 +++++++++-----------
>  drivers/pci/controller/dwc/Kconfig      |   48 ++++++++++++++++----------------
>  drivers/pci/controller/mobiveil/Kconfig |    6 ++--
>  drivers/pci/msi/Makefile                |    2 -
>  drivers/pci/probe.c                     |    2 -
>  include/linux/msi.h                     |   32 ++++++---------------
>  11 files changed, 56 insertions(+), 80 deletions(-)
> 
> --- a/arch/um/drivers/Kconfig
> +++ b/arch/um/drivers/Kconfig
> @@ -381,7 +381,6 @@ config UML_PCI_OVER_VIRTIO
>  	select UML_IOMEM_EMULATION
>  	select UML_DMA_EMULATION
>  	select PCI_MSI
> -	select PCI_MSI_IRQ_DOMAIN
>  	select PCI_LOCKLESS_CONFIG
>  
>  config UML_PCI_OVER_VIRTIO_DEVICE_ID
> --- a/arch/um/include/asm/pci.h
> +++ b/arch/um/include/asm/pci.h
> @@ -7,7 +7,7 @@
>  /* Generic PCI */
>  #include <asm-generic/pci.h>
>  
> -#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> +#ifdef CONFIG_PCI_MSI
>  /*
>   * This is a bit of an annoying hack, and it assumes we only have
>   * the virt-pci (if anything). Which is true, but still.
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1109,7 +1109,6 @@ config X86_LOCAL_APIC
>  	def_bool y
>  	depends on X86_64 || SMP || X86_32_NON_STANDARD || X86_UP_APIC || PCI_MSI
>  	select IRQ_DOMAIN_HIERARCHY
> -	select PCI_MSI_IRQ_DOMAIN if PCI_MSI
>  
>  config X86_IO_APIC
>  	def_bool y
> --- a/arch/x86/include/asm/pci.h
> +++ b/arch/x86/include/asm/pci.h
> @@ -21,7 +21,7 @@ struct pci_sysdata {
>  #ifdef CONFIG_X86_64
>  	void		*iommu;		/* IOMMU private data */
>  #endif
> -#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> +#ifdef CONFIG_PCI_MSI
>  	void		*fwnode;	/* IRQ domain for MSI assignment */
>  #endif
>  #if IS_ENABLED(CONFIG_VMD)
> @@ -52,7 +52,7 @@ static inline int pci_proc_domain(struct
>  }
>  #endif
>  
> -#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> +#ifdef CONFIG_PCI_MSI
>  static inline void *_pci_root_bus_fwnode(struct pci_bus *bus)
>  {
>  	return to_pci_sysdata(bus)->fwnode;
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -38,6 +38,7 @@ source "drivers/pci/pcie/Kconfig"
>  
>  config PCI_MSI
>  	bool "Message Signaled Interrupts (MSI and MSI-X)"
> +	select GENERIC_MSI_IRQ_DOMAIN
>  	select GENERIC_MSI_IRQ
>  	help
>  	   This allows device drivers to enable MSI (Message Signaled
> @@ -51,11 +52,6 @@ config PCI_MSI
>  
>  	   If you don't know what to do here, say Y.
>  
> -config PCI_MSI_IRQ_DOMAIN
> -	def_bool y
> -	depends on PCI_MSI
> -	select GENERIC_MSI_IRQ_DOMAIN
> -
>  config PCI_MSI_ARCH_FALLBACKS
>  	bool
>  
> @@ -192,7 +188,7 @@ config PCI_LABEL
>  
>  config PCI_HYPERV
>  	tristate "Hyper-V PCI Frontend"
> -	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI && PCI_MSI_IRQ_DOMAIN && SYSFS
> +	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI && SYSFS
>  	select PCI_HYPERV_INTERFACE
>  	help
>  	  The PCI device frontend driver allows the kernel to import arbitrary
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -19,7 +19,7 @@ config PCI_AARDVARK
>  	tristate "Aardvark PCIe controller"
>  	depends on (ARCH_MVEBU && ARM64) || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCI_BRIDGE_EMUL
>  	help
>  	 Add support for Aardvark 64bit PCIe Host Controller. This
> @@ -29,7 +29,7 @@ config PCI_AARDVARK
>  config PCIE_XILINX_NWL
>  	bool "NWL PCIe Core"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	 Say 'Y' here if you want kernel support for Xilinx
>  	 NWL PCIe controller. The controller can act as Root Port
> @@ -53,7 +53,7 @@ config PCI_IXP4XX
>  config PCI_TEGRA
>  	bool "NVIDIA Tegra PCIe controller"
>  	depends on ARCH_TEGRA || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Say Y here if you want support for the PCIe host controller found
>  	  on NVIDIA Tegra SoCs.
> @@ -70,7 +70,7 @@ config PCI_RCAR_GEN2
>  config PCIE_RCAR_HOST
>  	bool "Renesas R-Car PCIe host controller"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Say Y here if you want PCIe controller support on R-Car SoCs in host
>  	  mode.
> @@ -99,7 +99,7 @@ config PCI_HOST_GENERIC
>  config PCIE_XILINX
>  	bool "Xilinx AXI PCIe host bridge support"
>  	depends on OF || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Say 'Y' here if you want kernel to support the Xilinx AXI PCIe
>  	  Host Bridge driver.
> @@ -124,7 +124,7 @@ config PCI_XGENE
>  config PCI_XGENE_MSI
>  	bool "X-Gene v1 PCIe MSI feature"
>  	depends on PCI_XGENE
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	default y
>  	help
>  	  Say Y here if you want PCIe MSI support for the APM X-Gene v1 SoC.
> @@ -170,7 +170,7 @@ config PCIE_IPROC_BCMA
>  config PCIE_IPROC_MSI
>  	bool "Broadcom iProc PCIe MSI support"
>  	depends on PCIE_IPROC_PLATFORM || PCIE_IPROC_BCMA
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	default ARCH_BCM_IPROC
>  	help
>  	  Say Y here if you want to enable MSI support for Broadcom's iProc
> @@ -186,7 +186,7 @@ config PCIE_ALTERA
>  config PCIE_ALTERA_MSI
>  	tristate "Altera PCIe MSI feature"
>  	depends on PCIE_ALTERA
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Say Y here if you want PCIe MSI support for the Altera FPGA.
>  	  This MSI driver supports Altera MSI to GIC controller IP.
> @@ -215,7 +215,7 @@ config PCIE_ROCKCHIP_HOST
>  	tristate "Rockchip PCIe host controller"
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select MFD_SYSCON
>  	select PCIE_ROCKCHIP
>  	help
> @@ -239,7 +239,7 @@ config PCIE_MEDIATEK
>  	tristate "MediaTek PCIe controller"
>  	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Say Y here if you want to enable PCIe controller support on
>  	  MediaTek SoCs.
> @@ -247,7 +247,7 @@ config PCIE_MEDIATEK
>  config PCIE_MEDIATEK_GEN3
>  	tristate "MediaTek Gen3 PCIe controller"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	help
>  	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
>  	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
> @@ -277,7 +277,7 @@ config PCIE_BRCMSTB
>  	depends on ARCH_BRCMSTB || ARCH_BCM2835 || ARCH_BCMBCA || \
>  		   BMIPS_GENERIC || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	default ARCH_BRCMSTB || BMIPS_GENERIC
>  	help
>  	  Say Y here to enable PCIe host controller support for
> @@ -285,7 +285,7 @@ config PCIE_BRCMSTB
>  
>  config PCI_HYPERV_INTERFACE
>  	tristate "Hyper-V PCI Interface"
> -	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI && PCI_MSI_IRQ_DOMAIN
> +	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI && PCI_MSI
>  	help
>  	  The Hyper-V PCI Interface is a helper driver allows other drivers to
>  	  have a common interface with the Hyper-V PCI frontend driver.
> @@ -303,8 +303,6 @@ config PCI_LOONGSON
>  config PCIE_MICROCHIP_HOST
>  	bool "Microchip AXI PCIe host bridge support"
>  	depends on PCI_MSI && OF
> -	select PCI_MSI_IRQ_DOMAIN
> -	select GENERIC_MSI_IRQ_DOMAIN
>  	select PCI_HOST_COMMON
>  	help
>  	  Say Y here if you want kernel to support the Microchip AXI PCIe
> @@ -326,7 +324,7 @@ config PCIE_APPLE
>  	tristate "Apple PCIe controller"
>  	depends on ARCH_APPLE || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCI_HOST_COMMON
>  	help
>  	  Say Y here if you want to enable PCIe controller support on Apple
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -21,7 +21,7 @@ config PCI_DRA7XX_HOST
>  	tristate "TI DRA7xx PCIe controller Host Mode"
>  	depends on SOC_DRA7XX || COMPILE_TEST
>  	depends on OF && HAS_IOMEM && TI_PIPE3
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCI_DRA7XX
>  	default y if SOC_DRA7XX
> @@ -53,7 +53,7 @@ config PCIE_DW_PLAT
>  
>  config PCIE_DW_PLAT_HOST
>  	bool "Platform bus based DesignWare PCIe Controller - Host mode"
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCIE_DW_PLAT
>  	help
> @@ -67,7 +67,7 @@ config PCIE_DW_PLAT_HOST
>  
>  config PCIE_DW_PLAT_EP
>  	bool "Platform bus based DesignWare PCIe Controller - Endpoint mode"
> -	depends on PCI && PCI_MSI_IRQ_DOMAIN
> +	depends on PCI && PCI_MSI
>  	depends on PCI_ENDPOINT
>  	select PCIE_DW_EP
>  	select PCIE_DW_PLAT
> @@ -83,7 +83,7 @@ config PCIE_DW_PLAT_EP
>  config PCI_EXYNOS
>  	tristate "Samsung Exynos PCIe controller"
>  	depends on ARCH_EXYNOS || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Enables support for the PCIe controller in the Samsung Exynos SoCs
> @@ -94,13 +94,13 @@ config PCI_EXYNOS
>  config PCI_IMX6
>  	bool "Freescale i.MX6/7/8 PCIe controller"
>  	depends on ARCH_MXC || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  
>  config PCIE_SPEAR13XX
>  	bool "STMicroelectronics SPEAr PCIe controller"
>  	depends on ARCH_SPEAR13XX || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want PCIe support on SPEAr13XX SoCs.
> @@ -111,7 +111,7 @@ config PCI_KEYSTONE
>  config PCI_KEYSTONE_HOST
>  	bool "PCI Keystone Host Mode"
>  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCI_KEYSTONE
>  	help
> @@ -135,7 +135,7 @@ config PCI_KEYSTONE_EP
>  config PCI_LAYERSCAPE
>  	bool "Freescale Layerscape PCIe controller - Host mode"
>  	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select MFD_SYSCON
>  	help
> @@ -160,7 +160,7 @@ config PCI_LAYERSCAPE_EP
>  config PCI_HISI
>  	depends on OF && (ARM64 || COMPILE_TEST)
>  	bool "HiSilicon Hip05 and Hip06 SoCs PCIe controllers"
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCI_HOST_COMMON
>  	help
> @@ -170,7 +170,7 @@ config PCI_HISI
>  config PCIE_QCOM
>  	bool "Qualcomm PCIe controller"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select CRC8
>  	help
> @@ -191,7 +191,7 @@ config PCIE_QCOM_EP
>  config PCIE_ARMADA_8K
>  	bool "Marvell Armada-8K PCIe controller"
>  	depends on ARCH_MVEBU || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want to enable PCIe controller support on
> @@ -205,7 +205,7 @@ config PCIE_ARTPEC6
>  config PCIE_ARTPEC6_HOST
>  	bool "Axis ARTPEC-6 PCIe controller Host Mode"
>  	depends on MACH_ARTPEC6 || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCIE_ARTPEC6
>  	help
> @@ -226,7 +226,7 @@ config PCIE_ROCKCHIP_DW_HOST
>  	bool "Rockchip DesignWare PCIe controller"
>  	select PCIE_DW
>  	select PCIE_DW_HOST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on OF
>  	help
> @@ -236,7 +236,7 @@ config PCIE_ROCKCHIP_DW_HOST
>  config PCIE_INTEL_GW
>  	bool "Intel Gateway PCIe host controller support"
>  	depends on OF && (X86 || COMPILE_TEST)
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say 'Y' here to enable PCIe Host controller support on Intel
> @@ -250,7 +250,7 @@ config PCIE_KEEMBAY
>  config PCIE_KEEMBAY_HOST
>  	bool "Intel Keem Bay PCIe controller - Host mode"
>  	depends on ARCH_KEEMBAY || COMPILE_TEST
> -	depends on PCI && PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCIE_KEEMBAY
>  	help
> @@ -262,7 +262,7 @@ config PCIE_KEEMBAY_HOST
>  config PCIE_KEEMBAY_EP
>  	bool "Intel Keem Bay PCIe controller - Endpoint mode"
>  	depends on ARCH_KEEMBAY || COMPILE_TEST
> -	depends on PCI && PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	depends on PCI_ENDPOINT
>  	select PCIE_DW_EP
>  	select PCIE_KEEMBAY
> @@ -275,7 +275,7 @@ config PCIE_KEEMBAY_EP
>  config PCIE_KIRIN
>  	depends on OF && (ARM64 || COMPILE_TEST)
>  	tristate "HiSilicon Kirin series SoCs PCIe controllers"
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want PCIe controller support
> @@ -284,7 +284,7 @@ config PCIE_KIRIN
>  config PCIE_HISI_STB
>  	bool "HiSilicon STB SoCs PCIe controllers"
>  	depends on ARCH_HISI || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want PCIe controller support on HiSilicon STB SoCs
> @@ -292,7 +292,7 @@ config PCIE_HISI_STB
>  config PCI_MESON
>  	tristate "MESON PCIe controller"
>  	default m if ARCH_MESON
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want to enable PCI controller support on Amlogic
> @@ -306,7 +306,7 @@ config PCIE_TEGRA194
>  config PCIE_TEGRA194_HOST
>  	tristate "NVIDIA Tegra194 (and later) PCIe controller - Host Mode"
>  	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PHY_TEGRA194_P2U
>  	select PCIE_TEGRA194
> @@ -336,7 +336,7 @@ config PCIE_TEGRA194_EP
>  config PCIE_VISCONTI_HOST
>  	bool "Toshiba Visconti PCIe controllers"
>  	depends on ARCH_VISCONTI || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want PCIe controller support on Toshiba Visconti SoC.
> @@ -346,7 +346,7 @@ config PCIE_UNIPHIER
>  	bool "Socionext UniPhier PCIe host controllers"
>  	depends on ARCH_UNIPHIER || COMPILE_TEST
>  	depends on OF && HAS_IOMEM
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want PCIe host controller support on UniPhier SoCs.
> @@ -365,7 +365,7 @@ config PCIE_UNIPHIER_EP
>  config PCIE_AL
>  	bool "Amazon Annapurna Labs PCIe controller"
>  	depends on OF && (ARM64 || COMPILE_TEST)
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_DW_HOST
>  	select PCI_ECAM
>  	help
> @@ -377,7 +377,7 @@ config PCIE_AL
>  
>  config PCIE_FU740
>  	bool "SiFive FU740 PCIe host controller"
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	depends on SOC_SIFIVE || COMPILE_TEST
>  	select PCIE_DW_HOST
>  	help
> --- a/drivers/pci/controller/mobiveil/Kconfig
> +++ b/drivers/pci/controller/mobiveil/Kconfig
> @@ -8,14 +8,14 @@ config PCIE_MOBIVEIL
>  
>  config PCIE_MOBIVEIL_HOST
>  	bool
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_MOBIVEIL
>  
>  config PCIE_MOBIVEIL_PLAT
>  	bool "Mobiveil AXI PCIe controller"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>  	depends on OF
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_MOBIVEIL_HOST
>  	help
>  	  Say Y here if you want to enable support for the Mobiveil AXI PCIe
> @@ -25,7 +25,7 @@ config PCIE_MOBIVEIL_PLAT
>  config PCIE_LAYERSCAPE_GEN4
>  	bool "Freescale Layerscape PCIe Gen4 controller"
>  	depends on ARCH_LAYERSCAPE || COMPILE_TEST
> -	depends on PCI_MSI_IRQ_DOMAIN
> +	depends on PCI_MSI
>  	select PCIE_MOBIVEIL_HOST
>  	help
>  	  Say Y here if you want PCIe Gen4 controller support on
> --- a/drivers/pci/msi/Makefile
> +++ b/drivers/pci/msi/Makefile
> @@ -3,5 +3,5 @@
>  # Makefile for the PCI/MSI
>  obj-$(CONFIG_PCI)			+= pcidev_msi.o
>  obj-$(CONFIG_PCI_MSI)			+= msi.o
> -obj-$(CONFIG_PCI_MSI_IRQ_DOMAIN)	+= irqdomain.o
> +obj-$(CONFIG_PCI_MSI)			+= irqdomain.o
>  obj-$(CONFIG_PCI_MSI_ARCH_FALLBACKS)	+= legacy.o
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -842,7 +842,6 @@ static struct irq_domain *pci_host_bridg
>  	if (!d)
>  		d = pci_host_bridge_acpi_msi_domain(bus);
>  
> -#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
>  	/*
>  	 * If no IRQ domain was found via the OF tree, try looking it up
>  	 * directly through the fwnode_handle.
> @@ -854,7 +853,6 @@ static struct irq_domain *pci_host_bridg
>  			d = irq_find_matching_fwnode(fwnode,
>  						     DOMAIN_BUS_PCI_MSI);
>  	}
> -#endif
>  
>  	return d;
>  }
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -238,15 +238,6 @@ static inline void msi_desc_set_iommu_co
>  }
>  #endif
>  
> -#ifdef CONFIG_PCI_MSI
> -struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
> -void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
> -#else /* CONFIG_PCI_MSI */
> -static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
> -{
> -}
> -#endif /* CONFIG_PCI_MSI */
> -
>  int msi_add_msi_desc(struct device *dev, struct msi_desc *init_desc);
>  void msi_free_msi_descs_range(struct device *dev, unsigned int first_index, unsigned int last_index);
>  
> @@ -259,12 +250,6 @@ static inline void msi_free_msi_descs(st
>  	msi_free_msi_descs_range(dev, 0, MSI_MAX_INDEX);
>  }
>  
> -void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
> -void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
> -
> -void pci_msi_mask_irq(struct irq_data *data);
> -void pci_msi_unmask_irq(struct irq_data *data);
> -
>  /*
>   * The arch hooks to setup up msi irqs. Default functions are implemented
>   * as weak symbols so that they /can/ be overriden by architecture specific
> @@ -466,20 +451,21 @@ int platform_msi_device_domain_alloc(str
>  void platform_msi_device_domain_free(struct irq_domain *domain, unsigned int virq,
>  				     unsigned int nvec);
>  void *platform_msi_get_host_data(struct irq_domain *domain);
> -#endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
>  
> -#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> +/* PCI specific interfaces */
> +struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
> +void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
> +void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
> +void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
> +void pci_msi_mask_irq(struct irq_data *data);
> +void pci_msi_unmask_irq(struct irq_data *data);
>  struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
>  bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
> -#else
> -static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
> -{
> -	return NULL;
> -}
> -#endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> +
> +#endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
>  
>  #endif /* LINUX_MSI_H */
> 
