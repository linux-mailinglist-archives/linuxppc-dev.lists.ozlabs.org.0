Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5769C46C529
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7szl1kxsz3cYH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZuIbLGLf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZuIbLGLf; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7sz7028nz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:56:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A22C4B81E7E;
 Tue,  7 Dec 2021 20:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B8EC341C1;
 Tue,  7 Dec 2021 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910575;
 bh=qLik4JFtyxqmSptBayqaCn1r8IHM9yMTUp4uNVorfnk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZuIbLGLfYV/nvLepPIU/oJgGVLR/cUv4fN1TB9jN6qxiqhzWiZXhZIRCqViFXsXX2
 BupHwnNmoV668bTXaUoUD++cCPB+blzebEwefTUII/C/6Vy7O3vnv9NoEGA/Ji6Owv
 oPt6EPc+oZmfGxvR4m833Yz/aYsVS5bGsuqgu5ZEDfAHynE853rfjGlPDeDpFGEt3Z
 R8MZc2PJgawqhxAfrRf/p8uWcDY0ETOixepI3ae+2tW6W36bm3938Zs5e4gyXwU3uL
 Xg3/BGlYj1tkxDl4i0Ek1cNEw8YRkCMuc4qXgDYFJwb6ISeYQABlWAEk0RIe7vI2Hq
 f6aHj3PLOAFog==
Date: Tue, 7 Dec 2021 14:56:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 08/23] PCI/sysfs: Use pci_irq_vector()
Message-ID: <20211207205613.GA76623@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.265589103@linutronix.de>
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

On Mon, Dec 06, 2021 at 11:27:36PM +0100, Thomas Gleixner wrote:
> instead of fiddling with msi descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

s/msi/MSI/ above if you have a chance.  Nice cleanup, thanks!

> ---
>  drivers/pci/pci-sysfs.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -62,11 +62,8 @@ static ssize_t irq_show(struct device *d
>  	 * For MSI, show the first MSI IRQ; for all other cases including
>  	 * MSI-X, show the legacy INTx IRQ.
>  	 */
> -	if (pdev->msi_enabled) {
> -		struct msi_desc *desc = first_pci_msi_entry(pdev);
> -
> -		return sysfs_emit(buf, "%u\n", desc->irq);
> -	}
> +	if (pdev->msi_enabled)
> +		return sysfs_emit(buf, "%u\n", pci_irq_vector(pdev, 0));
>  #endif
>  
>  	return sysfs_emit(buf, "%u\n", pdev->irq);
> 
