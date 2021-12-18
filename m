Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA8479C43
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 20:05:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGb0c4Q4Dz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 06:05:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UMWo6BEB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UMWo6BEB; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGZzv4713z2xCx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 06:05:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D7DCB80781;
 Sat, 18 Dec 2021 19:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B24C36AE1;
 Sat, 18 Dec 2021 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639854309;
 bh=I6eVKACPJvnI+llvjluP6wdaS6TfkgpPNWmOCTJo2Tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UMWo6BEBXL2vg9tHjb81KQokUbnD5ds+HV7ckML33awGfTpej3ik5Kh3h6cfpyyqb
 iFD4s+bZZ21aukh38a1Cdxv3Q680qbPDCrFRz4IUjxJcGtElf80NOxI08WBU35o5KO
 DNmZrv9Ka1wwC0RRN+bNzFNGCbR++Trade1JV0IXvYj4pEQ88pbWel1kl4y4dka9Vy
 v30sM76UJThM+xQ2PiEuVOz+Jtb0pMSsUUbW+ySVU2WJmK0RZD3dGbXyS/PYo1GOwF
 IJYYSA0Plrin3iwRee9bWx/w6bJtImnOGvLxXhdQqwr2xAa+xaDpfppDhnDsxbFplJ
 vGcX7+wVGtViQ==
Date: Sat, 18 Dec 2021 12:04:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <Yb4w2wVvIwN7qaNy@archlinux-ax161>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161> <87v8zm9pmd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8zm9pmd.ffs@tglx>
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 18, 2021 at 11:25:14AM +0100, Thomas Gleixner wrote:
> On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
> > On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> > I just bisected a boot failure on my AMD test desktop to this patch as
> > commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
> > -next. It looks like there is a problem with the NVMe drive after this
> > change according to the logs. Given that the hard drive is not getting
> > mounted for journald to write logs to, I am not really sure how to get
> > them from the machine so I have at least taken a picture of what I see
> > on my screen; open to ideas on that front!
> 
> Bah. Fix below.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> Thanks,
> 
>         tglx
> ---
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 71802410e2ab..9b4910befeda 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1100,7 +1100,7 @@ EXPORT_SYMBOL(pci_irq_vector);
>   */
>  const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  {
> -	int irq = pci_irq_vector(dev, nr);
> +	int idx, irq = pci_irq_vector(dev, nr);
>  	struct msi_desc *desc;
>  
>  	if (WARN_ON_ONCE(irq <= 0))
> @@ -1113,7 +1113,10 @@ const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  
>  	if (WARN_ON_ONCE(!desc->affinity))
>  		return NULL;
> -	return &desc->affinity[nr].mask;
> +
> +	/* MSI has a mask array in the descriptor. */
> +	idx = dev->msi_enabled ? nr : 0;
> +	return &desc->affinity[idx].mask;
>  }
>  EXPORT_SYMBOL(pci_irq_get_affinity);
>  
> 
