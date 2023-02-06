Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E043968C9C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9hJt53jGz3ch5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:49:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tNKUGBl1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tNKUGBl1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9hHy4bkBz3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 09:48:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9410DB8162F;
	Mon,  6 Feb 2023 22:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3526C433EF;
	Mon,  6 Feb 2023 22:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675723706;
	bh=t5SKljt2sWy6BT6dILdWfv/hZkn80YA6xFS31ly3C70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNKUGBl1m1QPnRTY5kbM/VoPPGtSs7EaR2z/f2j5X7UP8WIw7AtQ/o60A/y+MJfiY
	 1QXosHhmqRgJxkF58+mLnLz+khyMM6tpexDftD1ue27T2wo2lH70XwmG6IX9q+RMtI
	 Hq/qOlQgiviM6bea6FsKqb7qfcUjw6ysWcMFRKFHl9zP1+f2jxwCLETb1LWrl1EK1+
	 51lhgoRg9YdYkRNbOIA6a9dQ2klU3FlM5A3QsQsZF6Eq3cZ/E+rH5hEDGI1LNoezWU
	 eovJ/whMs0s3C/rmBAPFu0XfTD9zZGd4csjo3j00XONwJSTD4AmPrq9GH0ZsysyBjR
	 Po8yqPJs6FHOg==
Received: by pali.im (Postfix)
	id 68B73875; Mon,  6 Feb 2023 23:48:23 +0100 (CET)
Date: Mon, 6 Feb 2023 23:48:23 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/pci: Add option for using pci_to_OF_bus_map
Message-ID: <20230206224823.uq3zdwa4yaalqd2m@pali>
References: <20230206113902.1857123-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230206113902.1857123-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 06 February 2023 22:39:02 Michael Ellerman wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> The "pci-OF-bus-map" property was declared deprecated in 2006 [1] and to
> the best of everyone's knowledge is not used by anything anymore [2].
> 
> The creation of the property was disabled on powermac (arch/powerpc) in
> 2005 by commit 35499c0195e4 ("powerpc: Merge in 64-bit powermac
> support."). But it is still created by default on CHRP.
> 
> On powermac the actual map (pci_to_OF_bus_map) is still used by default,
> even though the device tree property is not created.
> 
> Add an option to enable/disable use of the pci_to_OF_bus_map, and
> creation of the property (on CHRP).
> 
> Disabling the option allows enabling CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> which allows "normal" bus numbering and more than 256 buses, like 64-bit
> and other architectures.
> 
> Mark the new option as default n, the intention is that the option and
> the code will be removed in a future release.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/1148016268.13249.14.camel@localhost.localdomain/
> [2]: https://lore.kernel.org/all/575f239205e8635add81c9f902b7d9db7beb83ea.camel@kernel.crashing.org/
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> [mpe: Reword commit & help text, shrink option name, rework to fix build errors]

Thank you for this!

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Kconfig                  | 13 ++++++++++++-
>  arch/powerpc/include/asm/pci-bridge.h |  4 +++-
>  arch/powerpc/kernel/pci_32.c          | 17 ++++++++++++-----
>  3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fad25aa602c8..7dcb011cebf2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -388,9 +388,20 @@ config PPC_DCR
>  	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
>  	default y
>  
> +config PPC_PCI_OF_BUS_MAP
> +	bool "Use pci_to_OF_bus_map (deprecated)"
> +	depends on PPC32
> +	depends on PPC_PMAC || PPC_CHRP
> +	help
> +	  This option uses pci_to_OF_bus_map to map OF nodes to PCI devices, which
> +	  restricts the system to only having 256 PCI buses. On CHRP it also causes
> +	  the "pci-OF-bus-map" property to be created in the device tree.
> +
> +	  If unsure, say "N".
> +
>  config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
>  	depends on PPC32
> -	depends on !PPC_PMAC && !PPC_CHRP
> +	depends on !PPC_PCI_OF_BUS_MAP
>  	bool "Assign PCI bus numbers from zero individually for each PCI domain"
>  	default y
>  	help
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index e18c95f4e1d4..71c1d26f2400 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -176,8 +176,10 @@ extern int pci_device_from_OF_node(struct device_node *node,
>  #endif
>  #ifndef CONFIG_PPC64
>  
> -#ifdef CONFIG_PPC_CHRP
> +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP
>  extern void pci_create_OF_bus_map(void);
> +#else
> +static inline void pci_create_OF_bus_map(void) {}
>  #endif
>  
>  #else	/* CONFIG_PPC64 */
> diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> index 855b59892c5c..ce0c8623e563 100644
> --- a/arch/powerpc/kernel/pci_32.c
> +++ b/arch/powerpc/kernel/pci_32.c
> @@ -62,7 +62,7 @@ fixup_cpc710_pci64(struct pci_dev* dev)
>  }
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_IBM,	PCI_DEVICE_ID_IBM_CPC710_PCI64,	fixup_cpc710_pci64);
>  
> -#if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP
>  
>  static u8* pci_to_OF_bus_map;
>  static int pci_bus_count;
> @@ -152,6 +152,7 @@ pcibios_make_OF_bus_map(void)
>  	}
>  #endif
>  }
> +#endif // CONFIG_PPC_PCI_OF_BUS_MAP
>  
>  
>  #ifdef CONFIG_PPC_PMAC
> @@ -160,7 +161,9 @@ pcibios_make_OF_bus_map(void)
>   */
>  int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>  {
> +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP
>  	struct pci_dev *dev = NULL;
> +#endif
>  	const __be32 *reg;
>  	int size;
>  
> @@ -175,6 +178,9 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>  	*bus = (be32_to_cpup(&reg[0]) >> 16) & 0xff;
>  	*devfn = (be32_to_cpup(&reg[0]) >> 8) & 0xff;
>  
> +#ifndef CONFIG_PPC_PCI_OF_BUS_MAP
> +	return 0;
> +#else
>  	/* Ok, here we need some tweak. If we have already renumbered
>  	 * all busses, we can't rely on the OF bus number any more.
>  	 * the pci_to_OF_bus_map is not enough as several PCI busses
> @@ -192,11 +198,12 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>  		}
>  
>  	return -ENODEV;
> +#endif // CONFIG_PPC_PCI_OF_BUS_MAP
>  }
>  EXPORT_SYMBOL(pci_device_from_OF_node);
>  #endif
>  
> -#ifdef CONFIG_PPC_CHRP
> +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP
>  /* We create the "pci-OF-bus-map" property now so it appears in the
>   * /proc device tree
>   */
> @@ -221,9 +228,7 @@ pci_create_OF_bus_map(void)
>  		of_node_put(dn);
>  	}
>  }
> -#endif
> -
> -#endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP) */
> +#endif // CONFIG_PPC_PCI_OF_BUS_MAP
>  
>  void pcibios_setup_phb_io_space(struct pci_controller *hose)
>  {
> @@ -273,6 +278,7 @@ static int __init pcibios_init(void)
>  	}
>  
>  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP
>  	pci_bus_count = next_busno;
>  
>  	/* OpenFirmware based machines need a map of OF bus
> @@ -281,6 +287,7 @@ static int __init pcibios_init(void)
>  	 */
>  	if (pci_assign_all_buses)
>  		pcibios_make_OF_bus_map();
> +#endif
>  #endif
>  
>  	/* Call common code to handle resource allocation */
> -- 
> 2.39.1
> 
