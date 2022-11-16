Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B329862C482
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7sP4QkMz3f8k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:33:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sZcXqH8U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sZcXqH8U;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7m26V9hz3fG1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:29:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B321B61ED9;
	Wed, 16 Nov 2022 16:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47C0C433C1;
	Wed, 16 Nov 2022 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616144;
	bh=hVb5cZ9h4Awq2TaSKDMFPSYVKSJauXtseNAwJdFPQTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sZcXqH8UiU/elt5GvwYbh2B+DZGPqk1sud0NS7fEI0eViqdPkVb+879ylMHAugf+B
	 C5+QqPsKMsYDb6sR3DqEvugc1GG0twBVU1LTdpOKNNj/1J9dVphQvJOfzV2YxAaxYN
	 dQvudz5Ej3gJABS4RmWFtmjghcLuI05vzt/R+jXC02fkci8X6jJcU1+nEj5oJbYlES
	 +ukBtYxfgEsupsfwAFOwMNk9cWfWug3zG3QVZj3upG1hZfG44cNyFrrUcOeFYusaKI
	 0zn0M3hyw1qDW/8FNj5lPRuyhS+0s/xbtMPrx3kG+7dLBqto5DiNz8bsGZ3CMuiTou
	 A71jz0OhBH/Ww==
Date: Wed, 16 Nov 2022 10:29:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 33/39] PCI/MSI: Sanitize MSI-X checks
Message-ID: <20221116162902.GA1116195@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.516946468@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:07PM +0100, Thomas Gleixner wrote:
> There is no point in doing the same sanity checks over and over in a loop
> during MSI-X enablement. Put them in front of the loop and return early
> when they fail.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/msi.c |   67 +++++++++++++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 33 deletions(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -721,47 +721,31 @@ static int msix_capability_init(struct p
>  	return ret;
>  }
>  
> -static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
> -			     int nvec, struct irq_affinity *affd, int flags)
> +static bool pci_msix_validate_entries(struct msix_entry *entries, int nvec, int hwsize)
>  {
> -	int nr_entries;
>  	int i, j;
>  
> -	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
> -		return -EINVAL;
> +	if (!entries)
> +		return true;
>  
> -	nr_entries = pci_msix_vec_count(dev);
> -	if (nr_entries < 0)
> -		return nr_entries;
> -	if (nvec > nr_entries && !(flags & PCI_IRQ_VIRTUAL))
> -		return nr_entries;
> -
> -	if (entries) {
> -		/* Check for any invalid entries */
> -		for (i = 0; i < nvec; i++) {
> -			if (entries[i].entry >= nr_entries)
> -				return -EINVAL;		/* invalid entry */
> -			for (j = i + 1; j < nvec; j++) {
> -				if (entries[i].entry == entries[j].entry)
> -					return -EINVAL;	/* duplicate entry */
> -			}
> +	for (i = 0; i < nvec; i++) {
> +		/* Entry within hardware limit? */
> +		if (entries[i].entry >= hwsize)
> +			return false;
> +
> +		/* Check for duplicate entries */
> +		for (j = i + 1; j < nvec; j++) {
> +			if (entries[i].entry == entries[j].entry)
> +				return false;
>  		}
>  	}
> -
> -	/* Check whether driver already requested for MSI IRQ */
> -	if (dev->msi_enabled) {
> -		pci_info(dev, "can't enable MSI-X (MSI IRQ already assigned)\n");
> -		return -EINVAL;
> -	}
> -	return msix_capability_init(dev, entries, nvec, affd);
> +	return true;
>  }
>  
> -int __pci_enable_msix_range(struct pci_dev *dev,
> -			    struct msix_entry *entries, int minvec,
> -			    int maxvec, struct irq_affinity *affd,
> -			    int flags)
> +int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
> +			    int maxvec, struct irq_affinity *affd, int flags)
>  {
> -	int rc, nvec = maxvec;
> +	int hwsize, rc, nvec = maxvec;
>  
>  	if (maxvec < minvec)
>  		return -ERANGE;
> @@ -774,6 +758,23 @@ int __pci_enable_msix_range(struct pci_d
>  	if (WARN_ON_ONCE(dev->msix_enabled))
>  		return -EINVAL;
>  
> +	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	hwsize = pci_msix_vec_count(dev);
> +	if (hwsize < 0)
> +		return hwsize;
> +
> +	if (!pci_msix_validate_entries(entries, nvec, hwsize))
> +		return -EINVAL;
> +
> +	/* PCI_IRQ_VIRTUAL is a horrible hack! */
> +	if (nvec > hwsize && !(flags & PCI_IRQ_VIRTUAL))
> +		nvec = hwsize;
> +
> +	if (nvec < minvec)
> +		return -ENOSPC;
> +
>  	rc = pci_setup_msi_context(dev);
>  	if (rc)
>  		return rc;
> @@ -785,7 +786,7 @@ int __pci_enable_msix_range(struct pci_d
>  				return -ENOSPC;
>  		}
>  
> -		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
> +		rc = msix_capability_init(dev, entries, nvec, affd);
>  		if (rc == 0)
>  			return nvec;
>  
> 
