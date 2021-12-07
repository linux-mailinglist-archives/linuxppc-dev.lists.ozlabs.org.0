Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5446C502
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7sxz6Qmmz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:55:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nsS3jKJ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nsS3jKJ7; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7sxP0Hv5z2ypZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:54:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0A5AB81858;
 Tue,  7 Dec 2021 20:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E222C341C3;
 Tue,  7 Dec 2021 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910483;
 bh=2TCFm6oMcOo2j9kU57EKGsnY8fkR6JvmY5FAYrIs66g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nsS3jKJ7qQGHDYJB47kov7AVBhzyG091DRuFfOsLF+34ALijihn9KZtlp+GJ6IKE8
 kwldgAGONyoShIXShWCqK6l38EuYcxpvxsfxzUOfye0qv3FNym4mEgnKFN3S4deZJn
 MK94vwclzEowmaVdB2cGhf7Z0a7/o3/oMmVUhVyJY2de/L6mR980HgZkZTFIElzJ/+
 epdz+yWDLvAPCET9jF0AcFlWO/tiWh+A6jWW8FLHS0WZbyvHO0pmCIW6QBNlbIsCJM
 H+HIHHhPv17Z3oQSzspeU71bWUAG5BFut+e0szyhVsCnMRESKTLgg/mxRT13eAuaiM
 cbQlCTOqnZvyg==
Date: Tue, 7 Dec 2021 14:54:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 06/23] PCI/MSI: Make pci_msi_domain_write_msg() static
Message-ID: <20211207205441.GA76497@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.157070464@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:27:33PM +0100, Thomas Gleixner wrote:
> There is no point to have this function public as it is set by the PCI core
> anyway when a PCI/MSI irqdomain is created.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# PCI

> ---
>  drivers/irqchip/irq-gic-v2m.c            |    1 -
>  drivers/irqchip/irq-gic-v3-its-pci-msi.c |    1 -
>  drivers/irqchip/irq-gic-v3-mbi.c         |    1 -
>  drivers/pci/msi.c                        |    2 +-
>  include/linux/msi.h                      |    1 -
>  5 files changed, 1 insertion(+), 5 deletions(-)
> 
> --- a/drivers/irqchip/irq-gic-v2m.c
> +++ b/drivers/irqchip/irq-gic-v2m.c
> @@ -88,7 +88,6 @@ static struct irq_chip gicv2m_msi_irq_ch
>  	.irq_mask		= gicv2m_mask_msi_irq,
>  	.irq_unmask		= gicv2m_unmask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static struct msi_domain_info gicv2m_msi_domain_info = {
> --- a/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> +++ b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> @@ -28,7 +28,6 @@ static struct irq_chip its_msi_irq_chip
>  	.irq_unmask		= its_unmask_msi_irq,
>  	.irq_mask		= its_mask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static int its_pci_msi_vec_count(struct pci_dev *pdev, void *data)
> --- a/drivers/irqchip/irq-gic-v3-mbi.c
> +++ b/drivers/irqchip/irq-gic-v3-mbi.c
> @@ -171,7 +171,6 @@ static struct irq_chip mbi_msi_irq_chip
>  	.irq_unmask		= mbi_unmask_msi_irq,
>  	.irq_eoi		= irq_chip_eoi_parent,
>  	.irq_compose_msi_msg	= mbi_compose_msi_msg,
> -	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  };
>  
>  static struct msi_domain_info mbi_msi_domain_info = {
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1281,7 +1281,7 @@ EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdat
>   * @irq_data:	Pointer to interrupt data of the MSI interrupt
>   * @msg:	Pointer to the message
>   */
> -void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
> +static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
>  {
>  	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -455,7 +455,6 @@ void *platform_msi_get_host_data(struct
>  #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
>  
>  #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
> -void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
>  struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent);
> 
