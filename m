Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C253C25B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 19:11:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hppR3n2NzDqLc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 03:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="j559wTc5"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hpmf0Sp0zDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 03:09:53 +1000 (AEST)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 338B92168B;
 Mon, 30 Sep 2019 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569863390;
 bh=GtCtYYJj0VILK3yJLsyPIs1GLYKZuc6tDSMcqvj4HBw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=j559wTc57uYUcg5PdQPxPOZ3WAiaJjf2l2EHBB9MH6SfgXIX1bpSsokXD5XHlVX+9
 7QCNW8UNV3XVCEy7SLBU5fLYHavG9wNHqJTrMMLdx8PR8x0cnzN9BwxqKgyyUVAAIq
 z6N0l2LIMltPhhxuOM4CtfOeZQW3Am9YAEEy9rhk=
Date: Mon, 30 Sep 2019 12:09:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 1/3] powernv/iov: Ensure the pdn for VFs always contains
 a valid PE number
Message-ID: <20190930170948.GA154567@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930020848.25767-2-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: aik@ozlabs.ru, shawn@anastas.io, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 30, 2019 at 12:08:46PM +1000, Oliver O'Halloran wrote:

This is all powerpc, so I assume Michael will handle this.  Just
random things I noticed; ignore if they don't make sense:

> On PowerNV we use the pcibios_sriov_enable() hook to do two things:
> 
> 1. Create a pci_dn structure for each of the VFs, and
> 2. Configure the PHB's internal BARs that map MMIO ranges to PEs
>    so that each VF has it's own PE. Note that the PE also determines

s/it's/its/

>    the IOMMU table the HW uses for the device.
> 
> Currently we do not set the pe_number field of the pci_dn immediately after
> assigning the PE number for the VF that it represents. Instead, we do that
> in a fixup (see pnv_pci_dma_dev_setup) which is run inside the
> pcibios_add_device() hook which is run prior to adding the device to the
> bus.
> 
> On PowerNV we add the device to it's IOMMU group using a bus notifier and

s/it's/its/

> in order for this to work the PE number needs to be known when the bus
> notifier is run. This works today since the PE number is set in the fixup
> which runs before adding the device to the bus. However, if we want to move
> the fixup to a later stage this will break.
> 
> We can fix this by setting the pdn->pe_number inside of
> pcibios_sriov_enable(). There's no good to avoid this since we already have

s/no good/no good reason/ ?

Not quite sure what "this" refers to ... "no good reason to avoid
setting pdn->pe_number in pcibios_sriov_enable()"?  The double
negative makes it a little hard to parse.

> all the required information at that point, so... do that. Moving this
> earlier does cause two problems:
> 
> 1. We trip the WARN_ON() in the fixup code, and
> 2. The EEH core will clear pdn->pe_number while recovering VFs.
> 
> The only justification for either of these is a comment in eeh_rmv_device()
> suggesting that pdn->pe_number *must* be set to IODA_INVALID_PE in order
> for the VF to be scanned. However, this comment appears to have no basis in
> reality so just delete it.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> Can't get rid of the fixup entirely since we need it to set the
> ioda_pe->pdev back-pointer. I'll look at killing that another time.
> ---
>  arch/powerpc/kernel/eeh_driver.c          |  6 ------
>  arch/powerpc/platforms/powernv/pci-ioda.c | 19 +++++++++++++++----
>  arch/powerpc/platforms/powernv/pci.c      |  4 ----
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index d9279d0..7955fba 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -541,12 +541,6 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
>  
>  		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
>  		edev->pdev = NULL;
> -
> -		/*
> -		 * We have to set the VF PE number to invalid one, which is
> -		 * required to plug the VF successfully.
> -		 */
> -		pdn->pe_number = IODA_INVALID_PE;
>  #endif
>  		if (rmv_data)
>  			list_add(&edev->rmv_entry, &rmv_data->removed_vf_list);
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 5e3172d..70508b3 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1558,6 +1558,10 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  	/* Reserve PE for each VF */
>  	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
> +		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
> +		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
> +		struct pci_dn *vf_pdn;
> +
>  		if (pdn->m64_single_mode)
>  			pe_num = pdn->pe_num_map[vf_index];
>  		else
> @@ -1570,13 +1574,11 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		pe->pbus = NULL;
>  		pe->parent_dev = pdev;
>  		pe->mve_number = -1;
> -		pe->rid = (pci_iov_virtfn_bus(pdev, vf_index) << 8) |
> -			   pci_iov_virtfn_devfn(pdev, vf_index);
> +		pe->rid = (vf_bus << 8) | vf_devfn;
>  
>  		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",

Not related to *this* patch, but this looks like maybe it's supposed
to match the pci_name(), e.g., "%04x:%02x:%02x.%d" from
pci_setup_device()?  If so, the "%04d:%02d:%02d" here will be
confusing since the decimal & hex won't always match.

>  			hose->global_number, pdev->bus->number,

Consider pci_domain_nr(bus) instead of hose->global_number?  It would
be nice if you had the pci_dev * for each VF so you could just use
pci_name(vf) instead of all this domain/bus/PCI_SLOT/FUNC.

> -			PCI_SLOT(pci_iov_virtfn_devfn(pdev, vf_index)),
> -			PCI_FUNC(pci_iov_virtfn_devfn(pdev, vf_index)), pe_num);
> +			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
>  
>  		if (pnv_ioda_configure_pe(phb, pe)) {
>  			/* XXX What do we do here ? */
> @@ -1590,6 +1592,15 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		list_add_tail(&pe->list, &phb->ioda.pe_list);
>  		mutex_unlock(&phb->ioda.pe_list_mutex);
>  
> +		/* associate this pe to it's pdn */
> +		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
> +			if (vf_pdn->busno == vf_bus &&
> +			    vf_pdn->devfn == vf_devfn) {
> +				vf_pdn->pe_number = pe_num;
> +				break;
> +			}
> +		}
> +
>  		pnv_pci_ioda2_setup_dma_pe(phb, pe);
>  #ifdef CONFIG_IOMMU_API
>  		iommu_register_group(&pe->table_group,
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 2825d00..b7761e2 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -816,16 +816,12 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  	struct pnv_phb *phb = hose->private_data;
>  #ifdef CONFIG_PCI_IOV
>  	struct pnv_ioda_pe *pe;
> -	struct pci_dn *pdn;
>  
>  	/* Fix the VF pdn PE number */
>  	if (pdev->is_virtfn) {
> -		pdn = pci_get_pdn(pdev);
> -		WARN_ON(pdn->pe_number != IODA_INVALID_PE);
>  		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
>  			if (pe->rid == ((pdev->bus->number << 8) |
>  			    (pdev->devfn & 0xff))) {
> -				pdn->pe_number = pe->pe_number;
>  				pe->pdev = pdev;
>  				break;
>  			}
> -- 
> 2.9.5
> 
