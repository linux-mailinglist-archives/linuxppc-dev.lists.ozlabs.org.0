Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6E62C46A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7nG0q72z3f4P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/gXMOOL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/gXMOOL;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7jL4Yzpz3fHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:26:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3B8F1CE1BE8;
	Wed, 16 Nov 2022 16:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265B5C433C1;
	Wed, 16 Nov 2022 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616003;
	bh=7dRd1C8mTpkHuyLg0ecBxDafE9jSuXIZwtzca2R9S/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=P/gXMOOLklt9M+/GHi301BiUiczOapf+dKNFSW0BH0y6HzMrvFRsEYXJ3m7hzsZ02
	 p0V5RHlJXYKcmkbTH3tOXnD2TLz0nWE0aNDSFSs/Vaoz/QlJe0ECihGDxI5KJA/qto
	 3p3kqcvmrg+kARLZ0ruMZDLaBcw6HBEF+j97tmJFM1Tcyr+ftJwAW/7KKGmprqh5ZQ
	 Q0YoUj1JLkwL1qISJE6Dqc3wUiMgrEKZhOCNtikFK9e/BwPTo+tIVIwjXN7fYRTEl1
	 Z14lyP1muI4If7OVQsFCb7svIs9e8QTRj/MIUObE/rRuPFPEhsAww39nvt6/pBXUhz
	 QeQXvU08px9kA==
Date: Wed, 16 Nov 2022 10:26:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 29/39] PCI/MSI: Move pci_msi_enabled() to api.c
Message-ID: <20221116162641.GA1115904@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.271447896@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:01PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_msi_enabled() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/api.c | 12 ++++++++++++
>  drivers/pci/msi/msi.c | 14 +-------------
>  drivers/pci/msi/msi.h |  3 +++
>  3 files changed, 16 insertions(+), 13 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 473df7ba0584..ee9ed5ccd94d 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -307,3 +307,15 @@ void pci_free_irq_vectors(struct pci_dev *dev)
>  	pci_disable_msi(dev);
>  }
>  EXPORT_SYMBOL(pci_free_irq_vectors);
> +
> +/**
> + * pci_msi_enabled() - Are MSI(-X) interrupts enabled system-wide?
> + *
> + * Return: true if MSI has not been globally disabled through ACPI FADT,
> + * PCI bridge quirks, or the "pci=nomsi" kernel command-line option.
> + */
> +int pci_msi_enabled(void)
> +{
> +	return pci_msi_enable;
> +}
> +EXPORT_SYMBOL(pci_msi_enabled);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index d78646d1c116..59c33bc7fe81 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -13,7 +13,7 @@
>  #include "../pci.h"
>  #include "msi.h"
>  
> -static int pci_msi_enable = 1;
> +int pci_msi_enable = 1;
>  int pci_msi_ignore_mask;
>  
>  void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
> @@ -864,15 +864,3 @@ void pci_no_msi(void)
>  {
>  	pci_msi_enable = 0;
>  }
> -
> -/**
> - * pci_msi_enabled - is MSI enabled?
> - *
> - * Returns true if MSI has not been disabled by the command-line option
> - * pci=nomsi.
> - **/
> -int pci_msi_enabled(void)
> -{
> -	return pci_msi_enable;
> -}
> -EXPORT_SYMBOL(pci_msi_enabled);
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index 77e2587f7e4f..f3f4ede53171 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -84,6 +84,9 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
>  	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
>  }
>  
> +/* Subsystem variables */
> +extern int pci_msi_enable;
> +
>  /* MSI internal functions invoked from the public APIs */
>  void pci_msi_shutdown(struct pci_dev *dev);
>  void pci_msix_shutdown(struct pci_dev *dev);
> 
