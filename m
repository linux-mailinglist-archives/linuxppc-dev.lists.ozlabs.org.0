Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47F46C5F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7t8S4F29z3c8w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 08:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e153nty8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e153nty8; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7t6W4ctPz3f25
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 08:02:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0ED39B81E85;
 Tue,  7 Dec 2021 21:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF0FC341C1;
 Tue,  7 Dec 2021 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910959;
 bh=xQoYzuJZBtazlb9l9/rEZFpq4l8ZITO51ml+vNgPc6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=e153nty81BUAPS50lzOeG3i/XMpm26Pk8TGxhpDoheH+aGOAhJjiCObFncc/cOH46
 OXARkgcqJJlGa0F/Bsl/N/Hr8iyx5YBElDJEc4KBNNajc4emj6cdjk7cQoxzm32rM6
 wS8QDvcYSbelmRSilLFSFpzwM4nEMGo1OciLG1fy1ib0RAXNhpEhAgwC7XOVLwtEMg
 hUh+UVjgpZDPJcdCSkYndl3E5r7GBkkzKgk8s3NaLe/CmCRfbyieQFOca/oFRIERXj
 HKyqHP6oyciLgO6YSOX23lsQkoLBX7Z1J+QJANGpc3FC3xvrJLcihkCi836KsOw4gQ
 4SgZq/E6VBAOQ==
Date: Tue, 7 Dec 2021 15:02:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation
 fail to the legacy code
Message-ID: <20211207210238.GA77554@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210225.101336873@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:28:00PM +0100, Thomas Gleixner wrote:
> The irqdomain code already returns the information. Move the loop to the
> legacy code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/legacy.c |   20 +++++++++++++++++++-
>  drivers/pci/msi/msi.c    |   19 +------------------
>  2 files changed, 20 insertions(+), 19 deletions(-)
> 
> --- a/drivers/pci/msi/legacy.c
> +++ b/drivers/pci/msi/legacy.c
> @@ -50,9 +50,27 @@ void __weak arch_teardown_msi_irqs(struc
>  	}
>  }
>  
> +static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
> +{
> +	struct msi_desc *entry;
> +	int avail = 0;
> +
> +	if (type != PCI_CAP_ID_MSIX || ret >= 0)
> +		return ret;
> +
> +	/* Scan the MSI descriptors for successfully allocated ones. */
> +	for_each_pci_msi_entry(entry, dev) {
> +		if (entry->irq != 0)
> +			avail++;
> +	}
> +	return avail ? avail : ret;
> +}
> +
>  int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  {
> -	return arch_setup_msi_irqs(dev, nvec, type);
> +	int ret = arch_setup_msi_irqs(dev, nvec, type);
> +
> +	return pci_msi_setup_check_result(dev, type, ret);
>  }
>  
>  void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -609,7 +609,7 @@ static int msix_capability_init(struct p
>  
>  	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
>  	if (ret)
> -		goto out_avail;
> +		goto out_free;
>  
>  	/* Check if all MSI entries honor device restrictions */
>  	ret = msi_verify_entries(dev);
> @@ -634,23 +634,6 @@ static int msix_capability_init(struct p
>  	pcibios_free_irq(dev);
>  	return 0;
>  
> -out_avail:
> -	if (ret < 0) {
> -		/*
> -		 * If we had some success, report the number of IRQs
> -		 * we succeeded in setting up.
> -		 */
> -		struct msi_desc *entry;
> -		int avail = 0;
> -
> -		for_each_pci_msi_entry(entry, dev) {
> -			if (entry->irq != 0)
> -				avail++;
> -		}
> -		if (avail != 0)
> -			ret = avail;
> -	}
> -
>  out_free:
>  	free_msi_irqs(dev);
>  
> 
