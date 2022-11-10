Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CD624C5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Z7X1MD8z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 08:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJwMckJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJwMckJy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Z6S6LSNz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 08:02:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14F1361E56;
	Thu, 10 Nov 2022 21:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFFAC433C1;
	Thu, 10 Nov 2022 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668114157;
	bh=dFjwsB2x4Vktj11UP1nFbKy1JuZUspP3pjwcHIsSSnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iJwMckJy0uCcByLR5dTqb/sLhh/p4neWekIYZaZ3yeonbwH09ch8EqoG8ecGOC/gh
	 LxSdAJBLbKmEE3CXGDI3A7Vc6BCxXLJ/bsFq5hQJgqS/nai15IhiKGetEeKH4+vpT2
	 j9Ld+7uAe0Uz9IipZQ/88pm8pLqURo9XzvxQWuunebeReJqpcbJfuCN8BWniAwIWF9
	 a+ZwQoYjb1mS5vRmT3xSXjeYdGWxfBo/pZQHhYRV38fM2nHaPFfGhzmt8f50haLCEQ
	 7sSMDQr3yt4Z74/HTNY4ceRxsq+32kGBXwaNszYjSX1Y2pvyiMxqjjRM7Gykh+Y6zM
	 XSZjD4/Y6CHGA==
Date: Thu, 10 Nov 2022 15:02:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 0/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Message-ID: <20221110210235.GA671572@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott Branden <sbra
 nden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 10:39:49AM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
> 
> v2: https://lore.kernel.org/r/20221025185147.665365-1-helgaas@kernel.org/
> v1: https://lore.kernel.org/r/20221019195452.37606-1-helgaas@kernel.org/
> 
> Changes from v2 to v3:
>   - Include <linux/irqdomain.h> explicitly in xgene-msi, which doesn't need
>     <linux/of_irq.h> itself, but relied on it to include
>     <linux/irqdomain.h>.  On x86, this was covered up by the fact that
>     <linux/msi.h> includes <asm/msi.h>, which includes <asm/irqdomain.h>,
>     which includes <linux/irqdomain.h>.  But on parisc, <asm/msi.h> is
>     actually asm-generic/msi.h, which does *not* include
>     <linux/irqdomain.h>
>   - Pick up tags from Conor Dooley and Thomas Petazzoni
> 
> Changes from v1 to v2:
>   - Include <linux/irqdomain.h> explicitly in altera-msi and microchip,
>     which don't need <linux/of_irq.h> itself, but relied on it to include
>     <linux/irqdomain.h>
>   - Include <linux/irqdomain.h> explicitly in mvebu, which needs both it
>     and <linux/of_irq.h>
> 
> Bjorn Helgaas (5):
>   PCI: altera-msi: Include <linux/irqdomain.h> explicitly
>   PCI: microchip: Include <linux/irqdomain.h> explicitly
>   PCI: mvebu: Include <linux/irqdomain.h> explicitly
>   PCI: xgene-msi: Include <linux/irqdomain.h> explicitly
>   PCI: Remove unnecessary <linux/of_irq.h> includes
> 
>  drivers/pci/controller/cadence/pci-j721e.c   | 1 -
>  drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
>  drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
>  drivers/pci/controller/pci-mvebu.c           | 1 +
>  drivers/pci/controller/pci-v3-semi.c         | 1 -
>  drivers/pci/controller/pci-xgene-msi.c       | 2 +-
>  drivers/pci/controller/pci-xgene.c           | 1 -
>  drivers/pci/controller/pcie-altera-msi.c     | 2 +-
>  drivers/pci/controller/pcie-iproc-platform.c | 1 -
>  drivers/pci/controller/pcie-iproc.c          | 1 -
>  drivers/pci/controller/pcie-microchip-host.c | 2 +-
>  drivers/pci/controller/pcie-rockchip-host.c  | 1 -
>  drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
>  15 files changed, 4 insertions(+), 14 deletions(-)

I put these on a pci/kbuild branch that I propose to merge in after
everything else.  Lorenzo, let me know if you prefer another approach.

Bjorn
