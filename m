Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 023897CAEAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:13:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ddHMmPgP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Mbb69Bkz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:13:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ddHMmPgP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MZd2snWz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:12:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44ED61044;
	Mon, 16 Oct 2023 16:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21664C433CC;
	Mon, 16 Oct 2023 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697472740;
	bh=UOk9dtIEA+SLfxItNT20g2iHH2uvRS1QFVWkFm9awB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddHMmPgPAUtIgmqdMMJEsjIwdwQRoIXq7wSAFAgW5yk11YzFGUD+Oes7KS1+c5cEp
	 wTdwPgo1q34tsG61ez6FbaHoV1M8/SKTMCYEJJfpwHq2SR9nho3sfNdGC4WrPGTFpo
	 8GTW9ZkTdCJMlYkpeTgESIISHx6okF/KEdxOgaEn7Z4YwuhVPNcidx5lf93YV44oj7
	 DtIzOdCVN8Y1kBWt3NsFk2GnL7uJdWfmlCPRB2nyxCLVQB6WjHs+uxwctVVZthcrTL
	 i35aEm5+e9kh59nrPbuHEMA5ACMlnCfjY2TBa6k9jqElF+IM/x4p6V4PwcrrBrbLlX
	 ic7lNkRj27LqA==
Date: Mon, 16 Oct 2023 18:12:13 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZS1g3V8PWUMBFrgn@lpieralisi>
References: <ZS1Mhe9JOsY2JJER@lizhi-Precision-Tower-5810>
 <20231016152211.GA1209639@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016152211.GA1209639@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Frank Li <Frank.li@nxp.com>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 10:22:11AM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 16, 2023 at 10:45:25AM -0400, Frank Li wrote:
> > On Tue, Oct 10, 2023 at 06:02:36PM +0200, Lorenzo Pieralisi wrote:
> > > On Tue, Oct 10, 2023 at 10:20:12AM -0400, Frank Li wrote:
> 
> > > > Ping
> > > 
> > > Read and follow please (and then ping us):
> > > https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com
> > 
> > Could you please help point which specic one was not follow aboved guide?
> > Then I can update my code. I think that's efficial communication method. I
> > think I have read it serial times. But not sure which one violate the
> > guide?
> > 
> > @Bjorn Helgaas. How do you think so? 
> 
> Since Lorenzo didn't point out anything specific in the patch itself,
> I think he was probably referring to the subject line and this advice:
> 
>   - Follow the existing convention, i.e., run "git log --oneline
>     <file>" and make yours match in format, capitalization, and
>     sentence structure.  For example, native host bridge driver patch
>     titles look like this:
> 
>       PCI: altera: Fix platform_get_irq() error handling
>       PCI: vmd: Remove IRQ affinity so we can allocate more IRQs
>       PCI: mediatek: Add MSI support for MT2712 and MT7622
>       PCI: rockchip: Remove IRQ domain if probe fails
> 
> In this case, your subject line was:
> 
>   PCI: layerscape: add suspend/resume for ls1021a
> 
> The advice was to run this:
> 
>   $ git log --oneline drivers/pci/controller/dwc/pci-layerscape.c
>   83c088148c8e PCI: Use PCI_HEADER_TYPE_* instead of literals
>   9fda4d09905d PCI: layerscape: Add power management support for ls1028a
>   277004d7a4a3 PCI: Remove unnecessary <linux/of_irq.h> includes
>   60b3c27fb9b9 PCI: dwc: Rename struct pcie_port to dw_pcie_rp
>   d23f0c11aca2 PCI: layerscape: Change to use the DWC common link-up check function
>   7007b745a508 PCI: layerscape: Convert to builtin_platform_driver()
>   60f5b73fa0f2 PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
>   b9ac0f9dc8ea PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
>   f78f02638af5 PCI: dwc: Rework MSI initialization
> 
> Note that these summaries are all complete sentences that start with a
> capital letter:
> 
>   Use PCI_HEADER_TYPE_* instead of literals
>   Add power management support for ls1028a
>   Remove unnecessary <linux/of_irq.h> includes
>   ...
> 
> So yours could be this:
> 
>   PCI: layerscape: Add suspend/resume for ls1021a
>                    ^
> 
> This is trivial, obviously.  But the uppercase/lowercase distinction
> carries information, and it's an unnecessary distraction to notice
> that "oh, this is different from the rest; is the difference
> important or should I ignore it?"
> 
> Obviously Lorenzo *could* edit all your subject lines on your behalf,
> but it makes everybody's life easier if people look at the existing
> code and follow the style when making changes.
> 
> E.g., write subject lines that are similar in style to previous ones,
> name local variables similarly to other functions, use line lengths
> consistent with the rest of the file, etc.  After applying a change,
> the file should look like a coherent whole; we should not be able to
> tell that this hunk was added later by somebody else.  This all helps
> make the code (and the git history) more readable and maintainable.

Thank you very much Bjorn. Frank, now please resend your patches and
make sure that you follow these guidelines, they must be clear by now.

Lorenzo
