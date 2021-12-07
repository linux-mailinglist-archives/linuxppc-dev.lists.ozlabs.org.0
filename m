Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FF46C5ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7t730hC7z3f4X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 08:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n8AstkO1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n8AstkO1; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7t5j2b3pz3dvy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 08:02:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9098B81E8E;
 Tue,  7 Dec 2021 21:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EABC341C6;
 Tue,  7 Dec 2021 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910917;
 bh=Xx5Xlrv9sa2u5A/Kpn/Dg/C1KiusFx7+1t0Q3ZaD6H0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n8AstkO1bzz/peccJoNv+OV8w4azVbrZfSQZ+C6VrByvWmPCcuA2UoeLK7KF47R8L
 vZst3jSGZu4YUxnifcSqUb1O35ur9epBYuG/DP/WQ/icPCZjzW/3TXclIKDXlqCJoX
 tc18Sbi36Aj0D6NsekqSM+82EIrp06HXxtNuS66W7DP7eTGFxuQRp9F7qgu1/oS6Nh
 EiQZ2fSjwcXjKQPTB0uzie9HLe4wME36g/iRUJWHldf2e/7IFERXGSfGEslP0xR4VZ
 V4I9BEz7rWwPqwC+sNYmCoDe+CD/nvsXq9LjxicUETpYVVdLu043m0E8HlLj60v+3X
 HUdygMtqlpOxw==
Date: Tue, 7 Dec 2021 15:01:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
Message-ID: <20211207210156.GA77414@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.980989243@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:27:57PM +0100, Thomas Gleixner wrote:
> No users outside of that file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |    5 +++--
>  include/linux/msi.h         |    2 --
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -79,8 +79,9 @@ static inline bool pci_msi_desc_is_multi
>   *  1 if Multi MSI is requested, but the domain does not support it
>   *  -ENOTSUPP otherwise
>   */
> -int pci_msi_domain_check_cap(struct irq_domain *domain,
> -			     struct msi_domain_info *info, struct device *dev)
> +static int pci_msi_domain_check_cap(struct irq_domain *domain,
> +				    struct msi_domain_info *info,
> +				    struct device *dev)
>  {
>  	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -439,8 +439,6 @@ void *platform_msi_get_host_data(struct
>  struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent);
> -int pci_msi_domain_check_cap(struct irq_domain *domain,
> -			     struct msi_domain_info *info, struct device *dev);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
>  bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
> 
