Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AE60621D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 15:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtTR347yjz3dsJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 00:46:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJGp3AgH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJGp3AgH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtTQ85F4Zz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 00:45:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4040CB82750;
	Thu, 20 Oct 2022 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AC2C433C1;
	Thu, 20 Oct 2022 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666273549;
	bh=gEzBsG2afAcJArkvwrtS1d1ZrUezVmRH4opGNtVPXAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VJGp3AgHy1aLrltfoH3ZUIY2vPiG8odz2T6+x6jMCxcJgZCwTqS9qB3icoBC8o4E8
	 E1gfpoW8H0h3qQq/0/EZYuKYCvQC8HL2tkyrpL4XwUeqKy9JVjs4nQoNI/bL0fqMMC
	 fht4bNrhgVpd8SagpFnXZ9RE9junpC95FZ9mZIXzSFLwxrvemWT4v9YJzydgYmRwr9
	 Dq/0vR7MpzhoHTTfYTeffDWxoum67vJnPgSuWd0+edba3zhaABe6sytQ7LWcvC1QV0
	 OeDSrpxLauYQmP8C3WM0IafIX95qvt1v+oz6aA+EnOZHYUsc8+crMpW+Mx2cnmWOWH
	 H+9jYGQE6tu6w==
Date: Thu, 20 Oct 2022 08:45:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020134547.GA94120@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1D2ubkwXqwx9LWD@wendy>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, Mingkai Hu <mingkai.hu@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org, Scott Branden 
 <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Pali, heads-up for trivial addition of <linux/irqdomain.h> to
pci-mvebu.c]

On Thu, Oct 20, 2022 at 08:20:25AM +0100, Conor Dooley wrote:
> On Thu, Oct 20, 2022 at 03:08:50PM +0800, kernel test robot wrote:
> > Hi Bjorn,
> > 
> > I love your patch! Yet something to improve:
> > 
> > >> drivers/pci/controller/pcie-microchip-host.c:473:31: error: incomplete definition of type 'struct irq_domain'
> >            struct mc_pcie *port = domain->host_data;
> 
> That's what I get for only visually inspecting the patch before Acking
> it.. Un-ack I suppose.

No problem!

I think what happened is the pcie-microchip-host.c uses
irq_domain_add_linear() so it needs <linux/irqdomain.h>, but it
currently gets it via <linux/of_irq.h>, which it doesn't otherwise
need.

I added a preparatory patch to include <linux/irqdomain.h> explicitly,
but I haven't been able to cross-build either riscv or ia64 to verify
this fix.  I'll wait a few days and post an updated series for the
0-day bot to test.

Same situation for pcie-altera-msi.c.

pci-mvebu.c also relies on getting <linux/irqdomain.h> via
<linux/of_irq.h>, but it actually depends on of_irq.h, so I'll just
add an irqdomain.h include there.

Bjorn

