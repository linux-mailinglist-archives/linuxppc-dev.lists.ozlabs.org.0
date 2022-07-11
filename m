Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4E570D70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhdz95zHqz3chM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:36:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pjlkaOk7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pjlkaOk7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhdyV4SXQz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:36:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A374B81205;
	Mon, 11 Jul 2022 22:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E016BC3411C;
	Mon, 11 Jul 2022 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657578957;
	bh=7G6pKX09/F97v2cQQOGAgqFzqkQnDmYMUvTgW5etn68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pjlkaOk7gXsJfMHGs2uR127IsIiny3oS5RupRJ+cnoJubzAyUNhCn5ktZYt+bkkLP
	 ZbDtX8n7xLsb/Br8Mv1I2wz4XulKqiAEcblcVYQnZpDR2Bp6Maf71Fs6eMaIOIztNp
	 Ex51UBpuF1hijYOOwxJXM1cqULQdAFk+/v7KxUmgZQ183V7UkdKwISf2LEig3t/bcP
	 vocLQjmt1VTrQXzg5usCbUQTFHRWOqs7iMETGyzXyCnTzT7wZlsgL51BKRD+3E167Y
	 oD3SYrSVN9/Lz5z2xJj2RNHPyrHh9LS84MX3Q5NixXad+uW+5T5NxNQJIxJyI0r+6o
	 /k9ndLEaU+MOQ==
Date: Mon, 11 Jul 2022 17:35:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 1/5] powerpc/pci: Hide pci_device_from_OF_node() for
 non-powermac code
Message-ID: <20220711223555.GA702011@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706104308.5390-2-pali@kernel.org>
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
Cc: Nick Child <nick.child@ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 12:43:04PM +0200, Pali Rohár wrote:
> Function pci_device_from_OF_node() is used only in powermac code.
> So hide it from all other platforms as it is unsed.

s/unsed/unused/ (same typo in 3/5 patch)

These are for the powerpc folks, so I'm just kibbitzing here.

> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  arch/powerpc/include/asm/pci-bridge.h | 2 ++
>  arch/powerpc/kernel/pci_32.c          | 2 ++
>  arch/powerpc/kernel/pci_64.c          | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index c85f901227c9..98156932a1f5 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -170,8 +170,10 @@ static inline struct pci_controller *pci_bus_to_host(const struct pci_bus *bus)
>  	return bus->sysdata;
>  }
>  
> +#ifdef CONFIG_PPC_PMAC
>  extern int pci_device_from_OF_node(struct device_node *node,
>  				   u8 *bus, u8 *devfn);
> +#endif
>  #ifndef CONFIG_PPC64
>  
>  extern void pci_create_OF_bus_map(void);
> diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> index 5a174936c9a0..c3b91fb62a71 100644
> --- a/arch/powerpc/kernel/pci_32.c
> +++ b/arch/powerpc/kernel/pci_32.c
> @@ -154,6 +154,7 @@ pcibios_make_OF_bus_map(void)
>  }
>  
>  
> +#ifdef CONFIG_PPC_PMAC
>  /*
>   * Returns the PCI device matching a given OF node
>   */
> @@ -193,6 +194,7 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>  	return -ENODEV;
>  }
>  EXPORT_SYMBOL(pci_device_from_OF_node);
> +#endif
>  
>  /* We create the "pci-OF-bus-map" property now so it appears in the
>   * /proc device tree
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index 19b03ddf5631..0c7cfb9fab04 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -286,6 +286,7 @@ int pcibus_to_node(struct pci_bus *bus)
>  EXPORT_SYMBOL(pcibus_to_node);
>  #endif
>  
> +#ifdef CONFIG_PPC_PMAC
>  int pci_device_from_OF_node(struct device_node *np, u8 *bus, u8 *devfn)
>  {
>  	if (!PCI_DN(np))
> @@ -294,3 +295,4 @@ int pci_device_from_OF_node(struct device_node *np, u8 *bus, u8 *devfn)
>  	*devfn = PCI_DN(np)->devfn;
>  	return 0;
>  }
> +#endif
> -- 
> 2.20.1
> 
