Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D669E34D4D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 18:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Htt6kn6z30BN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 03:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m5YPxrdb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m5YPxrdb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8HtR2GTzz2yxC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 03:22:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D99061581;
 Mon, 29 Mar 2021 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617034971;
 bh=sEk2HJwYjHc7eM831DXgun9hSuVSjSurXUtsODTt+NI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=m5YPxrdb1bV/2p9TJTyU65h+abMH3ql9Y/x2H2iZm+A7xceaYjq1x2cu0z8/hT1H2
 lHjQPoMX44uH2WHYmgGto2a1DX+VHv+4WtmIQhADgv3+BxQ6wsvxgA/ie4LkyP9goW
 Y2fhtk9n0HFugAioBhqRpRxV0vErXAS06lrxVOMLx6vQagTAlLid7XX3aS5wTEmX/T
 hp6UvnNnrlXOTL3H3EqALnvvWKzR4ZjuY118SupzfQ5PDWzoiGnTwoRyw+Uj6SHeA0
 4qGkek28GH9kgpnivMu2ul7ctooUv1WER+umh6YRzQNwCLG+1CJM7DodqJnhfPCTKr
 6RaYI4uKQaCIw==
Date: Mon, 29 Mar 2021 11:22:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] PCI: Try to find two continuous regions for child resource
Message-ID: <20210329162250.GA1167957@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329084804.257526-1-kai.heng.feng@canonical.com>
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
Cc: Qian Cai <cai@lca.pw>, Michal Simek <monstr@monstr.eu>,
 Chen Zhou <chenzhou10@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, bhelgaas@google.com,
 Oliver O'Halloran <oohall@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 04:47:59PM +0800, Kai-Heng Feng wrote:
> Built-in grahpics on HP EliteDesk 805 G6 doesn't work because graphics
> can't get the BAR it needs:
> [    0.611504] pci_bus 0000:00: root bus resource [mem 0x10020200000-0x100303fffff window]
> [    0.611505] pci_bus 0000:00: root bus resource [mem 0x10030400000-0x100401fffff window]
> ...
> [    0.638083] pci 0000:00:08.1:   bridge window [mem 0xd2000000-0xd23fffff]
> [    0.638086] pci 0000:00:08.1:   bridge window [mem 0x10030000000-0x100401fffff 64bit pref]
> [    0.962086] pci 0000:00:08.1: can't claim BAR 15 [mem 0x10030000000-0x100401fffff 64bit pref]: no compatible bridge window
> [    0.962086] pci 0000:00:08.1: [mem 0x10030000000-0x100401fffff 64bit pref] clipped to [mem 0x10030000000-0x100303fffff 64bit pref]
> [    0.962086] pci 0000:00:08.1:   bridge window [mem 0x10030000000-0x100303fffff 64bit pref]
> [    0.962086] pci 0000:07:00.0: can't claim BAR 0 [mem 0x10030000000-0x1003fffffff 64bit pref]: no compatible bridge window
> [    0.962086] pci 0000:07:00.0: can't claim BAR 2 [mem 0x10040000000-0x100401fffff 64bit pref]: no compatible bridge window
>
> However, the root bus has two continuous regions that can contain the
> child resource requested.
>
> So try to find another parent region if two regions are continuous and
> can contain child resource. This change makes the grahpics works on the
> system in question.

The BIOS description of PCI0 is interesting:

  pci_bus 0000:00: root bus resource [mem 0x10000000000-0x100201fffff window]
  pci_bus 0000:00: root bus resource [mem 0x10020200000-0x100303fffff window]
  pci_bus 0000:00: root bus resource [mem 0x10030400000-0x100401fffff window]

So the PCI0 _CRS apparently gave us:

  [mem 0x10000000000-0x100201fffff] size 0x20200000 (512MB + 2MB)
  [mem 0x10020200000-0x100303fffff] size 0x10200000 (256MB + 2MB)
  [mem 0x10030400000-0x100401fffff] size 0x0fe00000 (254MB)

These are all contiguous, so we'd have no problem if we coalesced them
into a single window:

  [mem 0x10000000000-0x100401fffff window] size 0x40200000 (1GB + 2MB)

I think we currently keep these root bus resources separate because if
we ever support _SRS for host bridges, the argument we give to _SRS
must be exactly the same format as what we got from _CRS (see ACPI
v6.3, sec 6.2.16, and pnpacpi_set_resources()).

pnpacpi_encode_resources() is currently very simple-minded and copies
each device resource back into a single _SRS entry.  But (1) we don't
support _SRS for host bridges, and (2) if we ever do, we can make
pnpacpi_encode_resources() smarter so it breaks things back up.

So I think we should try to fix this by coalescing these adjacent
resources from _CRS so we end up with a single root bus resource that
covers all contiguous regions.

Typos, etc:
  - No need for the timestamps; they're not relevant to the problem.
  - s/grahpics/graphics/ (two occurrences above)
  - s/continuous/contiguous/ (three occurrences above)

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=212013
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  arch/microblaze/pci/pci-common.c |  4 +--
>  arch/powerpc/kernel/pci-common.c |  8 ++---
>  arch/sparc/kernel/pci.c          |  4 +--
>  drivers/pci/pci.c                | 60 +++++++++++++++++++++++++++-----
>  drivers/pci/setup-res.c          | 21 +++++++----
>  drivers/pcmcia/rsrc_nonstatic.c  |  4 +--
>  include/linux/pci.h              |  6 ++--
>  7 files changed, 80 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
> index 557585f1be41..8e65832fb510 100644
> --- a/arch/microblaze/pci/pci-common.c
> +++ b/arch/microblaze/pci/pci-common.c
> @@ -669,7 +669,7 @@ static void pcibios_allocate_bus_resources(struct pci_bus *bus)
>  {
>  	struct pci_bus *b;
>  	int i;
> -	struct resource *res, *pr;
> +	struct resource *res, *pr = NULL;
>  
>  	pr_debug("PCI: Allocating bus resources for %04x:%02x...\n",
>  		 pci_domain_nr(bus), bus->number);
> @@ -688,7 +688,7 @@ static void pcibios_allocate_bus_resources(struct pci_bus *bus)
>  			 * and as such ensure proper re-allocation
>  			 * later.
>  			 */
> -			pr = pci_find_parent_resource(bus->self, res);
> +			pci_find_parent_resource(bus->self, res, &pr, NULL);
>  			if (pr == res) {
>  				/* this happens when the generic PCI
>  				 * code (wrongly) decides that this
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index 001e90cd8948..f865354b746d 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -1196,7 +1196,7 @@ static void pcibios_allocate_bus_resources(struct pci_bus *bus)
>  {
>  	struct pci_bus *b;
>  	int i;
> -	struct resource *res, *pr;
> +	struct resource *res, *pr = NULL;
>  
>  	pr_debug("PCI: Allocating bus resources for %04x:%02x...\n",
>  		 pci_domain_nr(bus), bus->number);
> @@ -1213,7 +1213,7 @@ static void pcibios_allocate_bus_resources(struct pci_bus *bus)
>  			pr = (res->flags & IORESOURCE_IO) ?
>  				&ioport_resource : &iomem_resource;
>  		else {
> -			pr = pci_find_parent_resource(bus->self, res);
> +			pci_find_parent_resource(bus->self, res, &pr, NULL);
>  			if (pr == res) {
>  				/* this happens when the generic PCI
>  				 * code (wrongly) decides that this
> @@ -1265,12 +1265,12 @@ static void pcibios_allocate_bus_resources(struct pci_bus *bus)
>  
>  static inline void alloc_resource(struct pci_dev *dev, int idx)
>  {
> -	struct resource *pr, *r = &dev->resource[idx];
> +	struct resource *pr = NULL, *r = &dev->resource[idx];
>  
>  	pr_debug("PCI: Allocating %s: Resource %d: %pR\n",
>  		 pci_name(dev), idx, r);
>  
> -	pr = pci_find_parent_resource(dev, r);
> +	pci_find_parent_resource(dev, r, &pr, NULL);
>  	if (!pr || (pr->flags & IORESOURCE_UNSET) ||
>  	    request_resource(pr, r) < 0) {
>  		printk(KERN_WARNING "PCI: Cannot allocate resource region %d"
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index 9c2b720bfd20..b4006798e4e1 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -621,7 +621,7 @@ static void pci_bus_register_of_sysfs(struct pci_bus *bus)
>  static void pci_claim_legacy_resources(struct pci_dev *dev)
>  {
>  	struct pci_bus_region region;
> -	struct resource *p, *root, *conflict;
> +	struct resource *p, *root = NULL, *conflict;
>  
>  	if ((dev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>  		return;
> @@ -637,7 +637,7 @@ static void pci_claim_legacy_resources(struct pci_dev *dev)
>  	region.end = region.start + 0x1ffffUL;
>  	pcibios_bus_to_resource(dev->bus, p, &region);
>  
> -	root = pci_find_parent_resource(dev, p);
> +	pci_find_parent_resource(dev, p, &root, NULL);
>  	if (!root) {
>  		pci_info(dev, "can't claim VGA legacy %pR: no compatible bridge window\n", p);
>  		goto err;
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 16a17215f633..abbcd2dcdc02 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -693,20 +693,25 @@ u8 pci_find_ht_capability(struct pci_dev *dev, int ht_cap)
>  EXPORT_SYMBOL_GPL(pci_find_ht_capability);
>  
>  /**
> - * pci_find_parent_resource - return resource region of parent bus of given
> + * pci_find_parent_resource - find resource region of parent bus of given
>   *			      region
>   * @dev: PCI device structure contains resources to be searched
>   * @res: child resource record for which parent is sought
> + * @first: the first region that contains the child resource
> + * @second: the second region that combines with the first region to fully
> + * contains the child resource
>   *
>   * For given resource region of given device, return the resource region of
>   * parent bus the given region is contained in.
>   */
> -struct resource *pci_find_parent_resource(const struct pci_dev *dev,
> -					  struct resource *res)
> +void pci_find_parent_resource(const struct pci_dev *dev,
> +					  struct resource *res,
> +					  struct resource **first,
> +					  struct resource **second)
>  {
>  	const struct pci_bus *bus = dev->bus;
>  	struct resource *r;
> -	int i;
> +	int i, overlaps = 0;
>  
>  	pci_bus_for_each_resource(bus, r, i) {
>  		if (!r)
> @@ -718,8 +723,10 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
>  			 * not, the allocator made a mistake.
>  			 */
>  			if (r->flags & IORESOURCE_PREFETCH &&
> -			    !(res->flags & IORESOURCE_PREFETCH))
> -				return NULL;
> +			    !(res->flags & IORESOURCE_PREFETCH)) {
> +				*first = NULL;
> +				return;
> +			}
>  
>  			/*
>  			 * If we're below a transparent bridge, there may
> @@ -729,10 +736,47 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
>  			 * on pci_bus_for_each_resource() giving us those
>  			 * first.
>  			 */
> -			return r;
> +			*first = r;
> +			return;
>  		}
>  	}
> -	return NULL;
> +
> +	if (!second)
> +		return;
> +
> +	pci_bus_for_each_resource(bus, r, i) {
> +		if (!r)
> +			continue;
> +		if (resource_overlaps(r, res)) {
> +			if (r->flags & IORESOURCE_PREFETCH &&
> +			    !(res->flags & IORESOURCE_PREFETCH))
> +				continue;
> +
> +			if (!overlaps++)
> +				*first = r;
> +			else {
> +				*second = r;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (overlaps != 2)
> +		goto out;
> +
> +	if ((*first)->start > (*second)->start)
> +		swap(*first, *second);
> +
> +	if ((*first)->end + 1 != (*second)->start)
> +		goto out;
> +
> +	if ((*first)->start <= res->start && (*second)->end >= res->end)
> +		return;
> +out:
> +
> +	*first = NULL;
> +	*second = NULL;
> +	return;
>  }
>  EXPORT_SYMBOL(pci_find_parent_resource);
>  
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index 7f1acb3918d0..e39615321d81 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -131,7 +131,7 @@ void pci_update_resource(struct pci_dev *dev, int resno)
>  int pci_claim_resource(struct pci_dev *dev, int resource)
>  {
>  	struct resource *res = &dev->resource[resource];
> -	struct resource *root, *conflict;
> +	struct resource *first = NULL, *second = NULL, *conflict;
>  
>  	if (res->flags & IORESOURCE_UNSET) {
>  		pci_info(dev, "can't claim BAR %d %pR: no address assigned\n",
> @@ -147,21 +147,28 @@ int pci_claim_resource(struct pci_dev *dev, int resource)
>  	if (res->flags & IORESOURCE_ROM_SHADOW)
>  		return 0;
>  
> -	root = pci_find_parent_resource(dev, res);
> -	if (!root) {
> +	pci_find_parent_resource(dev, res, &first, &second);
> +	if (!first) {
>  		pci_info(dev, "can't claim BAR %d %pR: no compatible bridge window\n",
>  			 resource, res);
>  		res->flags |= IORESOURCE_UNSET;
>  		return -EINVAL;
>  	}
>  
> -	conflict = request_resource_conflict(root, res);
> +	if (second)
> +		first->end = second->end;
> +
> +	conflict = request_resource_conflict(first, res);
>  	if (conflict) {
> +		if (second)
> +			first->end = second->start - 1;
> +
>  		pci_info(dev, "can't claim BAR %d %pR: address conflict with %s %pR\n",
>  			 resource, res, conflict->name, conflict);
>  		res->flags |= IORESOURCE_UNSET;
>  		return -EBUSY;
> -	}
> +	} else if (second)
> +		second->start = second->end = 0;
>  
>  	return 0;
>  }
> @@ -195,7 +202,7 @@ resource_size_t __weak pcibios_retrieve_fw_addr(struct pci_dev *dev, int idx)
>  static int pci_revert_fw_address(struct resource *res, struct pci_dev *dev,
>  		int resno, resource_size_t size)
>  {
> -	struct resource *root, *conflict;
> +	struct resource *root = NULL, *conflict;
>  	resource_size_t fw_addr, start, end;
>  
>  	fw_addr = pcibios_retrieve_fw_addr(dev, resno);
> @@ -208,7 +215,7 @@ static int pci_revert_fw_address(struct resource *res, struct pci_dev *dev,
>  	res->end = res->start + size - 1;
>  	res->flags &= ~IORESOURCE_UNSET;
>  
> -	root = pci_find_parent_resource(dev, res);
> +	pci_find_parent_resource(dev, res, &root, NULL);
>  	if (!root) {
>  		if (res->flags & IORESOURCE_IO)
>  			root = &ioport_resource;
> diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
> index 3b05760e69d6..2fba42d7486e 100644
> --- a/drivers/pcmcia/rsrc_nonstatic.c
> +++ b/drivers/pcmcia/rsrc_nonstatic.c
> @@ -73,7 +73,7 @@ static struct resource *
>  claim_region(struct pcmcia_socket *s, resource_size_t base,
>  		resource_size_t size, int type, char *name)
>  {
> -	struct resource *res, *parent;
> +	struct resource *res, *parent = NULL;
>  
>  	parent = type & IORESOURCE_MEM ? &iomem_resource : &ioport_resource;
>  	res = pcmcia_make_resource(base, size, type | IORESOURCE_BUSY, name);
> @@ -81,7 +81,7 @@ claim_region(struct pcmcia_socket *s, resource_size_t base,
>  	if (res) {
>  #ifdef CONFIG_PCI
>  		if (s && s->cb_dev)
> -			parent = pci_find_parent_resource(s->cb_dev, res);
> +			pci_find_parent_resource(s->cb_dev, res, &parent, NULL);
>  #endif
>  		if (!parent || request_resource(parent, res)) {
>  			kfree(res);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..dd1455be5247 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1049,8 +1049,10 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus);
>  unsigned int pci_scan_child_bus(struct pci_bus *bus);
>  void pci_bus_add_device(struct pci_dev *dev);
>  void pci_read_bridge_bases(struct pci_bus *child);
> -struct resource *pci_find_parent_resource(const struct pci_dev *dev,
> -					  struct resource *res);
> +void pci_find_parent_resource(const struct pci_dev *dev,
> +					  struct resource *res,
> +					  struct resource **first,
> +					  struct resource **second);
>  u8 pci_swizzle_interrupt_pin(const struct pci_dev *dev, u8 pin);
>  int pci_get_interrupt_pin(struct pci_dev *dev, struct pci_dev **bridge);
>  u8 pci_common_swizzle(struct pci_dev *dev, u8 *pinp);
> -- 
> 2.30.2
> 
