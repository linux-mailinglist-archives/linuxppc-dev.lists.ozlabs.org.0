Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A004162C4B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7xb3Dqhz3fKf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=na2MPsiT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=na2MPsiT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7sh61mKz3fGm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:34:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E97BB61ED4;
	Wed, 16 Nov 2022 16:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159DEC433D7;
	Wed, 16 Nov 2022 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616438;
	bh=x+FQ4/MpGL9yLk16x2UT0Pz93Rr0XvkLBBEeUOH3wwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=na2MPsiTrPucVz6/AhoUlhZeTmGqycasH1P82SNGFQNhjaGt+xqwimYaedMuGWr07
	 2vVMdMIUAkNkaA2KbtCN3DafY+lDDruZ1hK+YMRgFiteoc/v/9E8rxnFYhb+bThW5B
	 OhkGPjZn6wsMl2BxiehR4o1/MCH743xNbmSkFgk0zr88fQ8eztT1AE5FeTTwy8RS/A
	 h2KW9o3kcLhgwthLMqQx+TEdpMfwFxyxYAHGA0mhKCZPV6Arl4k14cQfLBm4vaTQeN
	 vV55xEuBQq8fWilZFv5cmXL0uBwl1VVertyG4mjU/pWInxq7c10i1MJ+z6C27LefDK
	 d67lCxWIC5Fbg==
Date: Wed, 16 Nov 2022 10:33:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 36/39] PCI/MSI: Validate MSIX contiguous restriction early
Message-ID: <20221116163356.GA1116458@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.691357406@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:12PM +0100, Thomas Gleixner wrote:
> With interrupt domains the sanity check for MSI-X vector validation can be
> done _before_ any allocation happens. The sanity check only applies to the
> allocation functions which have an 'entries' array argument. The entries
> array is filled by the caller with the requested MSI-X indicies. Some drivers
> have gaps in the index space which is not supported on all architectures.
> 
> The PCI/MSI irqdomain has a 'feature' bit to enforce this validation late
> during the allocation phase.
> 
> Just do it right away before doing any other work along with the other
> sanity checks on that array.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

s/indicies/indices/ (commit log)
s/irqdomain/irq domain/?  IIRC previous logs used "irq domain"
s/MSIX/MSI-X/ (subject line)

> ---
>  drivers/pci/msi/msi.c |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -725,13 +725,17 @@ static int msix_capability_init(struct p
>  	return ret;
>  }
>  
> -static bool pci_msix_validate_entries(struct msix_entry *entries, int nvec, int hwsize)
> +static bool pci_msix_validate_entries(struct pci_dev *dev, struct msix_entry *entries,
> +				      int nvec, int hwsize)
>  {
> +	bool nogap;
>  	int i, j;
>  
>  	if (!entries)
>  		return true;
>  
> +	nogap = pci_msi_domain_supports(dev, MSI_FLAG_MSIX_CONTIGUOUS, DENY_LEGACY);
> +
>  	for (i = 0; i < nvec; i++) {
>  		/* Entry within hardware limit? */
>  		if (entries[i].entry >= hwsize)
> @@ -742,6 +746,9 @@ static bool pci_msix_validate_entries(st
>  			if (entries[i].entry == entries[j].entry)
>  				return false;
>  		}
> +		/* Check for unsupported gaps */
> +		if (nogap && entries[i].entry != i)
> +			return false;
>  	}
>  	return true;
>  }
> @@ -773,7 +780,7 @@ int __pci_enable_msix_range(struct pci_d
>  	if (hwsize < 0)
>  		return hwsize;
>  
> -	if (!pci_msix_validate_entries(entries, nvec, hwsize))
> +	if (!pci_msix_validate_entries(dev, entries, nvec, hwsize))
>  		return -EINVAL;
>  
>  	/* PCI_IRQ_VIRTUAL is a horrible hack! */
> 
