Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90846C590
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:00:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7t3Y73Q8z3dm2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 08:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6v2l2up;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m6v2l2up; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7t1Q48Fkz3cFg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:58:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FF13B81E92;
 Tue,  7 Dec 2021 20:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4B6C341C3;
 Tue,  7 Dec 2021 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910692;
 bh=mKk8CFP6CJrrE5nazjOj8lJlCLeQEHsGLEd20u/74iY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=m6v2l2upjdgPf9w2JTHnTqJo1IQhsUtXrf8F9Vikgt6+Z8JqCK5xTJ6F2LKLBJXQk
 f1feWsiex81V9M40VjQRY77dpHbpD+YmBN2/r2JsoxH2g2LiC+DUIcON3qHLEuh8Gz
 NS6nDZmsa9Hrr+xtsG+VdRDrQGZcy670xHqNHikhH4k3q1XX1eLrZK8iiGqA/IMnEQ
 FGWo8oJA6eAk1Fsb1P04L/6yLfhUvAWrjKF8GwSnqFoyeEQDmyRKL99yFYxSQnHXA8
 H6M+S6xb4uWxb4Amw+dIX3H7cHFGQYQknXpKDLlndF8FSRGQgNUUZsQJZtz3LOqh0f
 LsDHp544cDXEg==
Date: Tue, 7 Dec 2021 14:58:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent
 part
Message-ID: <20211207205810.GA76983@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.710137730@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 11:27:49PM +0100, Thomas Gleixner wrote:
> These functions are required even when CONFIG_PCI_MSI is not set. Move them
> to their own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/Makefile     |    3 ++-
>  drivers/pci/msi/msi.c        |   39 ---------------------------------------
>  drivers/pci/msi/pcidev_msi.c |   43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 40 deletions(-)
> 
> --- a/drivers/pci/msi/Makefile
> +++ b/drivers/pci/msi/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Makefile for the PCI/MSI
> -obj-$(CONFIG_PCI)		+= msi.o
> +obj-$(CONFIG_PCI)		+= pcidev_msi.o
> +obj-$(CONFIG_PCI_MSI)		+= msi.o
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,8 +18,6 @@
>  
>  #include "../pci.h"
>  
> -#ifdef CONFIG_PCI_MSI
> -
>  static int pci_msi_enable = 1;
>  int pci_msi_ignore_mask;
>  
> @@ -1493,40 +1491,3 @@ bool pci_dev_has_special_msi_domain(stru
>  }
>  
>  #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> -#endif /* CONFIG_PCI_MSI */
> -
> -void pci_msi_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	/*
> -	 * Disable the MSI hardware to avoid screaming interrupts
> -	 * during boot.  This is the power on reset default so
> -	 * usually this should be a noop.
> -	 */
> -	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> -	if (!dev->msi_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSI_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> -				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> -
> -	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -		dev->no_64bit_msi = 1;
> -}
> -
> -void pci_msix_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> -	if (!dev->msix_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> -				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> -}
> --- /dev/null
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MSI[X} related functions which are available unconditionally.
> + */
> +#include "../pci.h"
> +
> +/*
> + * Disable the MSI[X] hardware to avoid screaming interrupts during boot.
> + * This is the power on reset default so usually this should be a noop.
> + */
> +
> +void pci_msi_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> +	if (!dev->msi_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSI_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> +				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> +	}
> +
> +	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> +		dev->no_64bit_msi = 1;
> +}
> +
> +void pci_msix_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> +	if (!dev->msix_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSIX_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> +				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> +	}
> +}
> 
