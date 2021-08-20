Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2F3F3682
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrxNz5qplz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:38:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b+V/huH+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b+V/huH+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrxNL6qYJz3bP2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:37:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4337E6103D;
 Fri, 20 Aug 2021 22:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629499055;
 bh=C8jz8Bv63e052+kWi1tzbvXuwOtkfdMKISfabY64RtY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=b+V/huH+0jWmkArd1seL+iNhzD4ysWWQ9Wp/b/XT8hv9QdhQKCZ4bklEbuTsUFi6O
 ks8z/ZU6B5ZbtwKg1Pk0SRK/snSRADjJtCUYz588rdL4wTl+tjugOyOP/WF8U9BpEi
 Iag150ytRBI+hnBASCbQ9A05qAT/m1FRUuaT+ImfLuPbcCh29+KzAoVUHNo0IHJmmH
 PTwq6dqIJ43jEshblvbRRHLWilgXizjdHRFe2Hz3zKj3EFuLKMvoEU0zTiWjPnuIyE
 HIV72x5kKh8h5/2DnyC7Owuv67FvMArXkeqw9Z9CoZgCxmloyPrilEsyqZHWXvDh/x
 Et+I9bFTtIohQ==
Date: Fri, 20 Aug 2021 17:37:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v3] PCI: Move pci_dev_is/assign_added() to pci.h
Message-ID: <20210820223734.GA3366782@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720150145.640727-1-schnelle@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 20, 2021 at 05:01:45PM +0200, Niklas Schnelle wrote:
> The helper function pci_dev_is_added() from drivers/pci/pci.h is used in
> PCI arch code of both s390 and powerpc leading to awkward relative
> includes. Move it to the global include/linux/pci.h and get rid of these
> includes just for that one function.

I agree the includes are awkward.

But the arch code *using* pci_dev_is_added() seems awkward, too.

AFAICS, in powerpc, pci_dev_is_added() is only used by
pnv_pci_ioda_fixup_iov() and pseries_pci_fixup_iov_resources().  Those
are only called from pcibios_add_device(), which is only called from
pci_device_add().

Is it even possible for pci_dev_is_added() to be true in that path?

s390 uses pci_dev_is_added() in recover_store(), but I don't know what
that is (looks like a sysfs file, but it's not documented) or why s390
is the only arch that does this.

Maybe we should make powerpc and s390 less special?

> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Since v1 (and bad v2):
> - Fixed accidental removal of PCI_DPC_RECOVERED, PCI_DPC_RECOVERING
>   defines and also move these to include/linux/pci.h
> 
>  arch/powerpc/platforms/powernv/pci-sriov.c |  3 ---
>  arch/powerpc/platforms/pseries/setup.c     |  1 -
>  arch/s390/pci/pci_sysfs.c                  |  2 --
>  drivers/pci/hotplug/acpiphp_glue.c         |  1 -
>  drivers/pci/pci.h                          | 15 ---------------
>  include/linux/pci.h                        | 15 +++++++++++++++
>  6 files changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 28aac933a439..2e0ca5451e85 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -9,9 +9,6 @@
>  
>  #include "pci.h"
>  
> -/* for pci_dev_is_added() */
> -#include "../../../../drivers/pci/pci.h"
> -
>  /*
>   * The majority of the complexity in supporting SR-IOV on PowerNV comes from
>   * the need to put the MMIO space for each VF into a separate PE. Internally
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 631a0d57b6cd..17585ec9f955 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -74,7 +74,6 @@
>  #include <asm/hvconsole.h>
>  
>  #include "pseries.h"
> -#include "../../../../drivers/pci/pci.h"
>  
>  DEFINE_STATIC_KEY_FALSE(shared_processor);
>  EXPORT_SYMBOL_GPL(shared_processor);
> diff --git a/arch/s390/pci/pci_sysfs.c b/arch/s390/pci/pci_sysfs.c
> index 6e2450c2b9c1..8dbe54ef8f8e 100644
> --- a/arch/s390/pci/pci_sysfs.c
> +++ b/arch/s390/pci/pci_sysfs.c
> @@ -13,8 +13,6 @@
>  #include <linux/stat.h>
>  #include <linux/pci.h>
>  
> -#include "../../../drivers/pci/pci.h"
> -
>  #include <asm/sclp.h>
>  
>  #define zpci_attr(name, fmt, member)					\
> diff --git a/drivers/pci/hotplug/acpiphp_glue.c b/drivers/pci/hotplug/acpiphp_glue.c
> index f031302ad401..4cb963f88183 100644
> --- a/drivers/pci/hotplug/acpiphp_glue.c
> +++ b/drivers/pci/hotplug/acpiphp_glue.c
> @@ -38,7 +38,6 @@
>  #include <linux/slab.h>
>  #include <linux/acpi.h>
>  
> -#include "../pci.h"
>  #include "acpiphp.h"
>  
>  static LIST_HEAD(bridge_list);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 93dcdd431072..a159cd0f6f05 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -383,21 +383,6 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
>  	return dev->error_state == pci_channel_io_perm_failure;
>  }
>  
> -/* pci_dev priv_flags */
> -#define PCI_DEV_ADDED 0
> -#define PCI_DPC_RECOVERED 1
> -#define PCI_DPC_RECOVERING 2
> -
> -static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
> -{
> -	assign_bit(PCI_DEV_ADDED, &dev->priv_flags, added);
> -}
> -
> -static inline bool pci_dev_is_added(const struct pci_dev *dev)
> -{
> -	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
> -}
> -
>  #ifdef CONFIG_PCIEAER
>  #include <linux/aer.h>
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 540b377ca8f6..ea0e23dbc8ec 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -507,6 +507,21 @@ struct pci_dev {
>  	unsigned long	priv_flags;	/* Private flags for the PCI driver */
>  };
>  
> +/* pci_dev priv_flags */
> +#define PCI_DEV_ADDED 0
> +#define PCI_DPC_RECOVERED 1
> +#define PCI_DPC_RECOVERING 2
> +
> +static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
> +{
> +	assign_bit(PCI_DEV_ADDED, &dev->priv_flags, added);
> +}
> +
> +static inline bool pci_dev_is_added(const struct pci_dev *dev)
> +{
> +	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
> +}
> +
>  static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
>  {
>  #ifdef CONFIG_PCI_IOV
> -- 
> 2.25.1
> 
