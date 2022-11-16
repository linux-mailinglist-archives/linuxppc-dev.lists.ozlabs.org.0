Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C762C4BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7yb2fsJz3fZq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:38:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stK5Sq+X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stK5Sq+X;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7t60Tx4z3dvf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:34:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5BF261EA1;
	Wed, 16 Nov 2022 16:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE45C433C1;
	Wed, 16 Nov 2022 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616459;
	bh=uKdi6p36V3LxvyJcPehYkuLKJyY4N3pQgjmLWMWFgaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=stK5Sq+XYQnGDmF0ajQ0dsc8W0wzIBD35x1fFSV0rFbwn3x6rOntrYG8t7nCRryTB
	 oSmX9yd3we8Imo2kf09h7MUSTamtcY+snYZRFnzJ9pMkmTIhShomfvA4C1+o5R5a18
	 Ant1oFcyahAFgVtaRECkY8b98GkZBG9Z7sVCPbvPcWaCr7Sw2bqk7BRb+jmb/lcYwW
	 YuHmF8va9UIWfhEuWlYUJkaNsInbBuvpXfptMMan4tfRgz3URO2U3cy/KQotTcm6fp
	 GkIg2q9DWmlDdAhWOALLHl3v9gbl/fIhngvLE4nWGxS/4DiqtV8/PjAFOyu0XJ+mnl
	 QGQMuVkTDlXZA==
Date: Wed, 16 Nov 2022 10:34:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 37/39] PCI/MSI: Remove redundant msi_check() callback
Message-ID: <20221116163417.GA1116723@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.749446904@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:14PM +0100, Thomas Gleixner wrote:
> All these sanity checks are now done _before_ any allocation work
> happens. No point in doing it twice.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |   48 --------------------------------------------
>  1 file changed, 48 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -64,51 +64,6 @@ static irq_hw_number_t pci_msi_domain_ca
>  		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
>  }
>  
> -static inline bool pci_msi_desc_is_multi_msi(struct msi_desc *desc)
> -{
> -	return !desc->pci.msi_attrib.is_msix && desc->nvec_used > 1;
> -}
> -
> -/**
> - * pci_msi_domain_check_cap - Verify that @domain supports the capabilities
> - *			      for @dev
> - * @domain:	The interrupt domain to check
> - * @info:	The domain info for verification
> - * @dev:	The device to check
> - *
> - * Returns:
> - *  0 if the functionality is supported
> - *  1 if Multi MSI is requested, but the domain does not support it
> - *  -ENOTSUPP otherwise
> - */
> -static int pci_msi_domain_check_cap(struct irq_domain *domain,
> -				    struct msi_domain_info *info,
> -				    struct device *dev)
> -{
> -	struct msi_desc *desc = msi_first_desc(dev, MSI_DESC_ALL);
> -
> -	/* Special handling to support __pci_enable_msi_range() */
> -	if (pci_msi_desc_is_multi_msi(desc) &&
> -	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
> -		return 1;
> -
> -	if (desc->pci.msi_attrib.is_msix) {
> -		if (!(info->flags & MSI_FLAG_PCI_MSIX))
> -			return -ENOTSUPP;
> -
> -		if (info->flags & MSI_FLAG_MSIX_CONTIGUOUS) {
> -			unsigned int idx = 0;
> -
> -			/* Check for gaps in the entry indices */
> -			msi_for_each_desc(desc, dev, MSI_DESC_ALL) {
> -				if (desc->msi_index != idx++)
> -					return -ENOTSUPP;
> -			}
> -		}
> -	}
> -	return 0;
> -}
> -
>  static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc)
>  {
> @@ -118,7 +73,6 @@ static void pci_msi_domain_set_desc(msi_
>  
>  static struct msi_domain_ops pci_msi_domain_ops_default = {
>  	.set_desc	= pci_msi_domain_set_desc,
> -	.msi_check	= pci_msi_domain_check_cap,
>  };
>  
>  static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
> @@ -130,8 +84,6 @@ static void pci_msi_domain_update_dom_op
>  	} else {
>  		if (ops->set_desc == NULL)
>  			ops->set_desc = pci_msi_domain_set_desc;
> -		if (ops->msi_check == NULL)
> -			ops->msi_check = pci_msi_domain_check_cap;
>  	}
>  }
>  
> 
