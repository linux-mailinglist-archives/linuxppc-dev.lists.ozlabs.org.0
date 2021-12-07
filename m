Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE046C503
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:55:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7syh5dGVz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:55:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dvUfGzkA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dvUfGzkA; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7sxl2b6bz3cBr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:55:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D73F3B81E7F;
 Tue,  7 Dec 2021 20:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28BC341CA;
 Tue,  7 Dec 2021 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910503;
 bh=Fa6UchSERsdNVXky6PNS2vCw8nCpV4RsTu7TPsjmB4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=dvUfGzkAJKzccQlv0HtPexRzXLWw3+BexhSfcjdhY9OELj9M9shyPr2oxlHYgishh
 t4D2z7Bdr+ncSq9kKTlJ1eWwQvEyIE70QCOcHPfTkykUuEbmkImTsvOBxAh+YrDT2N
 e2tXRjJ7AyPRQqOviSDYGDRtTGTym9+e84h6CsKaxpAqC8y47ShWjPbJ5Wc+6tQEDN
 O+w8x6jcjhb24uXwmpRRwPhRkrIfIv7GvPutd6orOK9sOuf81nkdYTyVSsRwR7X0hy
 UTGVn2mumg3zTPmrl6DdJIgD9FUL38mTDmd4Yy4CHa5XbrINFDsrU5l0x2T6JYzzJO
 QyWBUWsq4OuoA==
Date: Tue, 7 Dec 2021 14:55:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 07/23] PCI/MSI: Remove msi_desc_to_pci_sysdata()
Message-ID: <20211207205502.GA76553@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.210768199@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:27:34PM +0100, Thomas Gleixner wrote:
> Last user is gone long ago.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi.c   |    8 --------
>  include/linux/msi.h |    5 -----
>  2 files changed, 13 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1267,14 +1267,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
>  }
>  EXPORT_SYMBOL(msi_desc_to_pci_dev);
>  
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
> -
> -	return dev->bus->sysdata;
> -}
> -EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdata);
> -
>  #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
>  /**
>   * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -218,13 +218,8 @@ static inline void msi_desc_set_iommu_co
>  	for_each_msi_entry((desc), &(pdev)->dev)
>  
>  struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
> -void *msi_desc_to_pci_sysdata(struct msi_desc *desc);
>  void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
>  #else /* CONFIG_PCI_MSI */
> -static inline void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
> -{
> -	return NULL;
> -}
>  static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
>  {
>  }
> 
