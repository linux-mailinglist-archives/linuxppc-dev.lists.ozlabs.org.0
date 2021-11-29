Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DA5461201
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 11:22:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2hHQ5ZzKz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 21:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J2hGx3fz9z2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 21:21:58 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mrdmz-0004dt-00; Mon, 29 Nov 2021 11:21:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 5E79DC2F89; Mon, 29 Nov 2021 11:21:16 +0100 (CET)
Date: Mon, 29 Nov 2021 11:21:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 09/22] MIPS: Octeon: Use arch_setup_msi_irq()
Message-ID: <20211129102116.GA6158@alpha.franken.de>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.618089023@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126223824.618089023@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 27, 2021 at 02:18:48AM +0100, Thomas Gleixner wrote:
> The core code provides the same loop code except for the MSI-X reject. Move
> that to arch_setup_msi_irq() and remove the duplicated code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
>  1 file changed, 3 insertions(+), 29 deletions(-)
> 
> --- a/arch/mips/pci/msi-octeon.c
> +++ b/arch/mips/pci/msi-octeon.c
> @@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	u64 search_mask;
>  	int index;
>  
> +	if (desc->pci.msi_attrib.is_msix)
> +		return -EINVAL;
> +
>  	/*
>  	 * Read the MSI config to figure out how many IRQs this device
>  	 * wants.  Most devices only want 1, which will give
> @@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
>  	return 0;
>  }
>  
> -int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> -{
> -	struct msi_desc *entry;
> -	int ret;
> -
> -	/*
> -	 * MSI-X is not supported.
> -	 */
> -	if (type == PCI_CAP_ID_MSIX)
> -		return -EINVAL;
> -
> -	/*
> -	 * If an architecture wants to support multiple MSI, it needs to
> -	 * override arch_setup_msi_irqs()
> -	 */
> -	if (type == PCI_CAP_ID_MSI && nvec > 1)
> -		return 1;
> -
> -	for_each_pci_msi_entry(entry, dev) {
> -		ret = arch_setup_msi_irq(dev, entry);
> -		if (ret < 0)
> -			return ret;
> -		if (ret > 0)
> -			return -ENOSPC;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * Called when a device no longer needs its MSI interrupts. All
>   * MSI interrupts for the device are freed.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
