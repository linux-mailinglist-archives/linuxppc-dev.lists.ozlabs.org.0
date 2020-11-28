Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E02C7097
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 19:36:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck0Zl1dzHzF0tX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 05:36:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1jrPlXwe; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck0Y45c2gzF0X5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 05:35:20 +1100 (AEDT)
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F6C7246B3;
 Sat, 28 Nov 2020 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606588517;
 bh=krTdbHrGkcM5b4jd6jHl8Tj811g2BH+q5E0PPQ5iuP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1jrPlXwe9ILXjItuxz9/t8GxK/MQWxNWJOUaEYGpQxD/dpPAvMyX7cm238YUlf00x
 fHRZCbCx0lc5oMXtSJwlHxgRyLQ/pw3uzuTM/N5JKgpY4OaW4UK2qgOYpegf41sOes
 cUU2tZ7iHNR/qc/5tVYNCHGtRQlEtP0Dti16ubIY=
Date: Sat, 28 Nov 2020 12:35:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v5] PCI: Unify ECAM constants in native PCI Express drivers
Message-ID: <20201128183516.GA897329@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201127104626.3979165-1-kw@linux.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 27, 2020 at 10:46:26AM +0000, Krzysztof Wilczyński wrote:
> Unify ECAM-related constants into a single set of standard constants
> defining memory address shift values for the byte-level address that can
> be used when accessing the PCI Express Configuration Space, and then
> move native PCI Express controller drivers to use newly introduced
> definitions retiring any driver-specific ones.
> 
> The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
> PCI Express specification (see PCI Express Base Specification, Revision
> 5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
> implement it the same way.  Most of the native PCI Express controller
> drivers define their ECAM-related constants, many of these could be
> shared, or use open-coded values when setting the .bus_shift field of
> the struct pci_ecam_ops.
> 
> All of the newly added constants should remove ambiguity and reduce the
> number of open-coded values, and also correlate more strongly with the
> descriptions in the aforementioned specification (see Table 7-1
> "Enhanced Configuration Address Mapping", p. 677).
> 
> There is no change to functionality.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Krzysztof Wilczyński <kw@linux.com>

Beautiful.  This should probably go via Lorenzo's tree, so he may have
comments, too.  Could apply this as-is; I had a few trivial notes
below.

It's ironic that we don't use PCIE_ECAM_OFFSET in drivers/pci/ecam.c.
We could do something like this, which would also let us drop
.bus_shift completely in all the conforming implementations.  It also
closes the hole that we didn't limit "where" to 4K for
pci_ecam_map_bus() users.

  if (per_bus_mapping) {
    base = cfg->winp[busn];
    busn = 0;
  } else {
    base = cfg->win;
  }

  if (cfg->ops->bus_shift) {
    u32 bus_offset = (busn & 0xff) << cfg->ops->bus_shift;
    u32 devfn_offset = (devfn & 0xff) << (cfg->ops->bus_shift - 8);

    where &= 0xfff;

    return base + (bus_offset | devfn_offset | where);
  }

  return base + PCIE_ECAM_OFFSET(busn, devfn, where);

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

>  static void __iomem *ppc4xx_pciex_get_config_base(struct ppc4xx_pciex_port *port,
>  						  struct pci_bus *bus,
> -						  unsigned int devfn)
> +						  unsigned int devfn,
> +						  int offset)

The interface change (to add "offset") could be a preparatory patch by
itself.

But I'm actually not sure it's worth even touching this file.  This is
the only place outside drivers/pci that includes linux/pci-ecam.h.  I
think I might rather put PCIE_ECAM_OFFSET() and related things in
drivers/pci/pci.h and keep it all inside drivers/pci.

>  static const struct pci_ecam_ops pci_thunder_pem_ops = {
> -	.bus_shift	= 24,
> +	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
>  	.init		= thunder_pem_platform_init,
>  	.pci_ops	= {
>  		.map_bus	= pci_ecam_map_bus,

This could be split to its own patch, no big deal either way.

>  const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
> -	.bus_shift	= 16,
>  	.init		= xgene_v2_pcie_ecam_init,
>  	.pci_ops	= {
>  		.map_bus	= xgene_pcie_map_bus,

Thanks for mentioning this change in the cover letter.  It could also
be split off to a preparatory patch, since it's not related to
PCIE_ECAM_OFFSET(), which is the main point of this patch.

>  static void __iomem *iproc_pcie_map_ep_cfg_reg(struct iproc_pcie *pcie,
>  					       unsigned int busno,
> -					       unsigned int slot,
> -					       unsigned int fn,
> +					       unsigned int devfn,

This interface change *could* be a separate preparatory patch, too,
but I'm starting to feel even more OCD than usual :)

> @@ -94,7 +95,7 @@ struct vmd_dev {
>  	struct pci_dev		*dev;
>  
>  	spinlock_t		cfg_lock;
> -	char __iomem		*cfgbar;
> +	void __iomem		*cfgbar;

This type change might be worth pushing to a separate patch since the
casting issues are not completely trivial.
