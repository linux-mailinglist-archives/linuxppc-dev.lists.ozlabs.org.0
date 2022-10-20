Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72C606243
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 15:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtTbs308Vz3drf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 00:54:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Yrde0ODV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Yrde0ODV;
	dkim-atps=neutral
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtTZt6BJGz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 00:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666274006; x=1697810006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CezaQ6FZiRtuuhnBRuO3KdKRT5p4X9KJSGf6RIFTEQg=;
  b=Yrde0ODVUgkwq32IAhOK5oqCIeUGW33UChobfmoJqMCr92t8ogGP2h2N
   1iZFIJJs0wfqLqGyvchs9dLJFkG+5+5XgC0d1hg02dFn4thEoUgAptQ/H
   TyYjlrlDgjcND1zB65gPcBBw+bPuRDH552woX7t6EGMWWclrC4JFpCXh6
   2hLJIEOB7RR0MCQh41zvmC1zME1uQsJEOGZ1tHCz47FjYyw0HDSLwXF7i
   yNE2EgJJs4t7Siu1ogTgnbYZv29Lko08w21v2OnG5A+RoX39Rv47APtrL
   B+3Uf4PBj//o9QLeifqTJAuXSGlSxxKwrdF3MZBY623+4BiiCgnc0j6CJ
   A==;
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="183149311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Oct 2022 06:53:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 20 Oct 2022 06:53:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:53:04 -0700
Date: Thu, 20 Oct 2022 14:52:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <Y1FSsFKKJDzzrf8C@wendy>
References: <Y1D2ubkwXqwx9LWD@wendy>
 <20221020134547.GA94120@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221020134547.GA94120@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon
 Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, Mingkai Hu <mingkai.hu@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 08:45:47AM -0500, Bjorn Helgaas wrote:
> [+cc Pali, heads-up for trivial addition of <linux/irqdomain.h> to
> pci-mvebu.c]
> 
> On Thu, Oct 20, 2022 at 08:20:25AM +0100, Conor Dooley wrote:
> > On Thu, Oct 20, 2022 at 03:08:50PM +0800, kernel test robot wrote:
> > > Hi Bjorn,
> > > 
> > > I love your patch! Yet something to improve:
> > > 
> > > >> drivers/pci/controller/pcie-microchip-host.c:473:31: error: incomplete definition of type 'struct irq_domain'
> > >            struct mc_pcie *port = domain->host_data;
> > 
> > That's what I get for only visually inspecting the patch before Acking
> > it.. Un-ack I suppose.
> 
> No problem!
> 
> I think what happened is the pcie-microchip-host.c uses
> irq_domain_add_linear() so it needs <linux/irqdomain.h>, but it
> currently gets it via <linux/of_irq.h>, which it doesn't otherwise
> need.
> 
> I added a preparatory patch to include <linux/irqdomain.h> explicitly,
> but I haven't been able to cross-build either riscv or ia64 to verify
> this fix.  I'll wait a few days and post an updated series for the
> 0-day bot to test.

I saw you saying you couldn't find the config from LKP, FWIW a build
using riscv defconfig w/ CONFIG_PCIE_MICROCHIP_HOST=y fails for me
in the same way as lkp reports.
Otherwise, dump the patch in response to this and I'll give it a shot
later if you like?

HTH,
Conor.

> 
> Same situation for pcie-altera-msi.c.
> 
> pci-mvebu.c also relies on getting <linux/irqdomain.h> via
> <linux/of_irq.h>, but it actually depends on of_irq.h, so I'll just
> add an irqdomain.h include there.
> 
> Bjorn
> 
