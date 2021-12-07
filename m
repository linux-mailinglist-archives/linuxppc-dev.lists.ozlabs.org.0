Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82446C5E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:02:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7t6M22wSz3cFg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 08:02:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uu5zBvm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uu5zBvm5; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7t556rgYz3cnl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 08:01:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98CDFB81E87;
 Tue,  7 Dec 2021 21:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBF1C341C6;
 Tue,  7 Dec 2021 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910887;
 bh=KswCIrDmmz+hcDnAj7scewOtghNKAUSvlR/YL46B2y4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uu5zBvm54PthoHMlAqMnKRp9In+QOttow33Sbz7fEJ6O739+SKVMNcj0eNux2Q1Fm
 ClUIhicQb0fbu7dNnC5RUJc8cgV1kAUjfZKalR6pgWyzBP5HyLTWLSqil36RtKbcDM
 nqVi0ewcV8haHkpihS2wEZ6W406lbkA9hAmoJYBBNhdiTOCAQEDa24Jm2l0Hw6e3ko
 tU0U/GoEd9YCrvWvapKu9DPDHWTw8UAwhom8fGjgSe6puuiXErpmMgBAhsH2nykktX
 lzB/yMVW0IXZVQGumZ7IMNW/rs3/0hjKex87BhLox/oRgleVnT9TL1qDc5II4Yygcs
 8zJbA1ld5WgZg==
Date: Tue, 7 Dec 2021 15:01:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
Message-ID: <20211207210125.GA77339@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.925241961@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
> It's only required for PCI/MSI. So no point in having it in every struct
> device.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: New patch
> ---
>  drivers/base/core.c    |    1 -
>  drivers/pci/msi/msi.c  |    2 +-
>  drivers/pci/probe.c    |    4 +++-
>  include/linux/device.h |    2 --
>  include/linux/pci.h    |    1 +
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
>  	device_pm_init(dev);
>  	set_dev_node(dev, NUMA_NO_NODE);
>  #ifdef CONFIG_GENERIC_MSI_IRQ
> -	raw_spin_lock_init(&dev->msi_lock);
>  	INIT_LIST_HEAD(&dev->msi_list);
>  #endif
>  	INIT_LIST_HEAD(&dev->links.consumers);
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
>  
>  static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
>  {
> -	raw_spinlock_t *lock = &desc->dev->msi_lock;
> +	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
>  	unsigned long flags;
>  
>  	if (!desc->pci.msi_attrib.can_mask)
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2311,7 +2311,9 @@ struct pci_dev *pci_alloc_dev(struct pci
>  	INIT_LIST_HEAD(&dev->bus_list);
>  	dev->dev.type = &pci_dev_type;
>  	dev->bus = pci_bus_get(bus);
> -
> +#ifdef CONFIG_PCI_MSI
> +	raw_spin_lock_init(&dev->msi_lock);
> +#endif
>  	return dev;
>  }
>  EXPORT_SYMBOL(pci_alloc_dev);
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -407,7 +407,6 @@ struct dev_links_info {
>   * @em_pd:	device's energy model performance domain
>   * @pins:	For device pin management.
>   *		See Documentation/driver-api/pin-control.rst for details.
> - * @msi_lock:	Lock to protect MSI mask cache and mask register
>   * @msi_list:	Hosts MSI descriptors
>   * @msi_domain: The generic MSI domain this device is using.
>   * @numa_node:	NUMA node this device is close to.
> @@ -508,7 +507,6 @@ struct device {
>  	struct dev_pin_info	*pins;
>  #endif
>  #ifdef CONFIG_GENERIC_MSI_IRQ
> -	raw_spinlock_t		msi_lock;
>  	struct list_head	msi_list;
>  #endif
>  #ifdef CONFIG_DMA_OPS
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -474,6 +474,7 @@ struct pci_dev {
>  #endif
>  #ifdef CONFIG_PCI_MSI
>  	void __iomem	*msix_base;
> +	raw_spinlock_t	msi_lock;
>  	const struct attribute_group **msi_irq_groups;
>  #endif
>  	struct pci_vpd	vpd;
> 
