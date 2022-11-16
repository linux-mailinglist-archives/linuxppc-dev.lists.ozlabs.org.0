Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7D62C473
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:31:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7pF5FyTz3fDH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:31:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a+yzJd2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a+yzJd2C;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7jq1dWjz3fJ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:27:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B619CB81DED;
	Wed, 16 Nov 2022 16:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05698C43144;
	Wed, 16 Nov 2022 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616027;
	bh=HjlrE3qPS6/S+YHpKCAMnsJE4Mb7DH9bPKzcgSrHjf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=a+yzJd2CNITMQpCmphnjYBlYPf3TcNFtxM3gMRzXahRo3NLEq/N2MFr9RLxFunkwM
	 donzPkOGwl1yBERAJPNIP1cG1zIuD92CtPfauE+mRRWZxm6hm2oxJnBbcuZaGQ0zP5
	 1OYwJxr4AnIMoy3YQgFfEoYQuP0hK9CPaPCelDFPvzHUs7HnKO/s7Y1Rb0NzDmCnBc
	 91w6kIBi1FQPE4WnYjxobgHPjJpLEQCi/COd3H/vZw1Cd3r/dP92IuL/eh6QBbzcpc
	 kk/M2/Kz8j5k83VUsThOguMMDS4KukqRClsb6boI6wwW0vMDP71jRNjc4BkzrT7Ads
	 JId6fNTbXeILQ==
Date: Wed, 16 Nov 2022 10:27:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 30/39] PCI/MSI: Move pci_msi_restore_state() to api.c
Message-ID: <20221116162705.GA1115960@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.331584998@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:03PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
>     
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
>     
> Move pci_msi_enabled() and add kernel-doc for the function.
>     
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index ee9ed5ccd94d..8d1cf6db9bd7 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -308,6 +308,21 @@ void pci_free_irq_vectors(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL(pci_free_irq_vectors);
>  
> +/**
> + * pci_restore_msi_state() - Restore cached MSI(-X) state on device
> + * @dev: the PCI device to operate on
> + *
> + * Write the Linux-cached MSI(-X) state back on device. This is
> + * typically useful upon system resume, or after an error-recovery PCI
> + * adapter reset.
> + */
> +void pci_restore_msi_state(struct pci_dev *dev)
> +{
> +	__pci_restore_msi_state(dev);
> +	__pci_restore_msix_state(dev);
> +}
> +EXPORT_SYMBOL_GPL(pci_restore_msi_state);
> +
>  /**
>   * pci_msi_enabled() - Are MSI(-X) interrupts enabled system-wide?
>   *
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 59c33bc7fe81..a5d168c823ff 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -199,7 +199,7 @@ bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
>  	return true;
>  }
>  
> -static void __pci_restore_msi_state(struct pci_dev *dev)
> +void __pci_restore_msi_state(struct pci_dev *dev)
>  {
>  	struct msi_desc *entry;
>  	u16 control;
> @@ -231,7 +231,7 @@ static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
>  	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
>  }
>  
> -static void __pci_restore_msix_state(struct pci_dev *dev)
> +void __pci_restore_msix_state(struct pci_dev *dev)
>  {
>  	struct msi_desc *entry;
>  	bool write_msg;
> @@ -257,13 +257,6 @@ static void __pci_restore_msix_state(struct pci_dev *dev)
>  	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
>  }
>  
> -void pci_restore_msi_state(struct pci_dev *dev)
> -{
> -	__pci_restore_msi_state(dev);
> -	__pci_restore_msix_state(dev);
> -}
> -EXPORT_SYMBOL_GPL(pci_restore_msi_state);
> -
>  static void pcim_msi_release(void *pcidev)
>  {
>  	struct pci_dev *dev = pcidev;
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index f3f4ede53171..8170ef2c5ad0 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -94,6 +94,8 @@ void pci_free_msi_irqs(struct pci_dev *dev);
>  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
>  int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
>  			    int maxvec,  struct irq_affinity *affd, int flags);
> +void __pci_restore_msi_state(struct pci_dev *dev);
> +void __pci_restore_msix_state(struct pci_dev *dev);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */
>  
> 
