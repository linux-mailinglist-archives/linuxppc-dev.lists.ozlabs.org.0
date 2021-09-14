Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC940B84C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 21:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8DHg57knz2yJT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 05:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uEsayntV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uEsayntV; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8DH35f7Pz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 05:41:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C1AB610CE;
 Tue, 14 Sep 2021 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631648461;
 bh=baphM1piCC4FQbHOOAlCGasKXJ2VO8dPR0S2rdQl73Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uEsayntVSbGMThYuwz5EWNI9w58RbWvnLNLegJILzXScm9/SXS83sLEJClPypfuK1
 NpnlZRSQIS4jjIGMpdedw4L/n178xqDYld1jV7Jckh7wTb8LVStfLXYUR3GxnVzXLV
 cj77pCNRMdLA966OG0aqD+kESfiowpk8HOqFV05QQuqyOIA3PWyVO8iJF8txql/vOc
 kowII0gv5gsEqOAF3bOeNMhU/u9N91sN3pU9opoeeAM2OiBYJxFPEvF6moLn65CVRm
 exNeCEbewWHw8Ms6ZwdFHSZm1Y0PJKzgddN4VEjRP1mJFGggsfd6wThwFcTqzmC6OK
 lFIuOheqNzFkg==
Date: Tue, 14 Sep 2021 14:40:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] pci: Rename pcibios_add_device to match
Message-ID: <20210914194059.GA1448850@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913152709.48013-1-oohall@gmail.com>
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
Cc: linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Borislav Petkov <bp@alien8.de>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 01:27:08AM +1000, Oliver O'Halloran wrote:
> The general convention for pcibios_* hooks is that they're named after
> the corresponding pci_* function they provide a hook for. The exception
> is pcibios_add_device() which provides a hook for pci_device_add(). This
> has been irritating me for years so rename it.
> 
> Also, remove the export of the microblaze version. The only caller
> must be compiled as a built-in so there's no reason for the export.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

I fixed up the subject so it matches previous history and applied to
pci/enumeration for v5.16, thanks!

Stuff like this really annoys me, too.

> ---
>  arch/microblaze/pci/pci-common.c           | 3 +--
>  arch/powerpc/kernel/pci-common.c           | 2 +-
>  arch/powerpc/platforms/powernv/pci-sriov.c | 2 +-
>  arch/s390/pci/pci.c                        | 2 +-
>  arch/sparc/kernel/pci.c                    | 2 +-
>  arch/x86/pci/common.c                      | 2 +-
>  drivers/pci/pci.c                          | 4 ++--
>  drivers/pci/probe.c                        | 4 ++--
>  include/linux/pci.h                        | 2 +-
>  9 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
> index 557585f1be41..622a4867f9e9 100644
> --- a/arch/microblaze/pci/pci-common.c
> +++ b/arch/microblaze/pci/pci-common.c
> @@ -587,13 +587,12 @@ static void pcibios_fixup_resources(struct pci_dev *dev)
>  }
>  DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pcibios_fixup_resources);
>  
> -int pcibios_add_device(struct pci_dev *dev)
> +int pcibios_device_add(struct pci_dev *dev)
>  {
>  	dev->irq = of_irq_parse_and_map_pci(dev, 0, 0);
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(pcibios_add_device);
>  
>  /*
>   * Reparent resource children of pr that conflict with res
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index c3573430919d..6749905932f4 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -1059,7 +1059,7 @@ void pcibios_bus_add_device(struct pci_dev *dev)
>  		ppc_md.pcibios_bus_add_device(dev);
>  }
>  
> -int pcibios_add_device(struct pci_dev *dev)
> +int pcibios_device_add(struct pci_dev *dev)
>  {
>  	struct irq_domain *d;
>  
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 28aac933a439..486c2937b159 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -54,7 +54,7 @@
>   * to "new_size", calculated above. Implementing this is a convoluted process
>   * which requires several hooks in the PCI core:
>   *
> - * 1. In pcibios_add_device() we call pnv_pci_ioda_fixup_iov().
> + * 1. In pcibios_device_add() we call pnv_pci_ioda_fixup_iov().
>   *
>   *    At this point the device has been probed and the device's BARs are sized,
>   *    but no resource allocations have been done. The SR-IOV BARs are sized
> diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
> index e7e6788d75a8..ded3321b7208 100644
> --- a/arch/s390/pci/pci.c
> +++ b/arch/s390/pci/pci.c
> @@ -561,7 +561,7 @@ static void zpci_cleanup_bus_resources(struct zpci_dev *zdev)
>  	zdev->has_resources = 0;
>  }
>  
> -int pcibios_add_device(struct pci_dev *pdev)
> +int pcibios_device_add(struct pci_dev *pdev)
>  {
>  	struct zpci_dev *zdev = to_zpci(pdev);
>  	struct resource *res;
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index 9c2b720bfd20..31b0c1983286 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -1010,7 +1010,7 @@ void pcibios_set_master(struct pci_dev *dev)
>  }
>  
>  #ifdef CONFIG_PCI_IOV
> -int pcibios_add_device(struct pci_dev *dev)
> +int pcibios_device_add(struct pci_dev *dev)
>  {
>  	struct pci_dev *pdev;
>  
> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
> index 3507f456fcd0..9e1e6b8d8876 100644
> --- a/arch/x86/pci/common.c
> +++ b/arch/x86/pci/common.c
> @@ -632,7 +632,7 @@ static void set_dev_domain_options(struct pci_dev *pdev)
>  		pdev->hotplug_user_indicators = 1;
>  }
>  
> -int pcibios_add_device(struct pci_dev *dev)
> +int pcibios_device_add(struct pci_dev *dev)
>  {
>  	struct pci_setup_rom *rom;
>  	struct irq_domain *msidom;
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ce2ab62b64cf..c63598c1cdd8 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2091,14 +2091,14 @@ void pcim_pin_device(struct pci_dev *pdev)
>  EXPORT_SYMBOL(pcim_pin_device);
>  
>  /*
> - * pcibios_add_device - provide arch specific hooks when adding device dev
> + * pcibios_device_add - provide arch specific hooks when adding device dev
>   * @dev: the PCI device being added
>   *
>   * Permits the platform to provide architecture specific functionality when
>   * devices are added. This is the default implementation. Architecture
>   * implementations can override this.
>   */
> -int __weak pcibios_add_device(struct pci_dev *dev)
> +int __weak pcibios_device_add(struct pci_dev *dev)
>  {
>  	return 0;
>  }
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index d9fc02a71baa..2ba43b6adf31 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2450,7 +2450,7 @@ static struct irq_domain *pci_dev_msi_domain(struct pci_dev *dev)
>  	struct irq_domain *d;
>  
>  	/*
> -	 * If a domain has been set through the pcibios_add_device()
> +	 * If a domain has been set through the pcibios_device_add()
>  	 * callback, then this is the one (platform code knows best).
>  	 */
>  	d = dev_get_msi_domain(&dev->dev);
> @@ -2518,7 +2518,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  	list_add_tail(&dev->bus_list, &bus->devices);
>  	up_write(&pci_bus_sem);
>  
> -	ret = pcibios_add_device(dev);
> +	ret = pcibios_device_add(dev);
>  	WARN_ON(ret < 0);
>  
>  	/* Set up MSI IRQ domain */
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index cd8aa6fce204..7e0ce3a4d5a1 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2126,7 +2126,7 @@ void pcibios_disable_device(struct pci_dev *dev);
>  void pcibios_set_master(struct pci_dev *dev);
>  int pcibios_set_pcie_reset_state(struct pci_dev *dev,
>  				 enum pcie_reset_state state);
> -int pcibios_add_device(struct pci_dev *dev);
> +int pcibios_device_add(struct pci_dev *dev);
>  void pcibios_release_device(struct pci_dev *dev);
>  #ifdef CONFIG_PCI
>  void pcibios_penalize_isa_irq(int irq, int active);
> -- 
> 2.31.1
> 
