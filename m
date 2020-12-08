Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A832D34D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 22:08:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrCTL6PGczDqgb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 08:08:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c7AcH56T; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrCQg4nFzzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 08:06:19 +1100 (AEDT)
Date: Tue, 8 Dec 2020 15:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607461575;
 bh=fSoNQRcc0LZ9Vd4mfNnsBvZ5tqGU/FOK1XZtvccEZA0=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=c7AcH56Thqe+4NCEmqVgXEzAwWClmNtrpb8HtX8PCFxHBUz8Fs68Cj+dMGuehEUvc
 19RjHSE/mjUAt9FlbAu7gSUO0l6+zLTWnm1oiVWlK13pSCawfo2A9v5u7Gp9YKQdP5
 Cii+EnPfpluaZhUhZSGOVp63ldAhb0L2IfPzbDPUL7gbtYEr76QGCbuqnWnToi0la6
 vQvXAGU1s3VYsHFMq6LK6AzvArf88/G4IZYY7o6iXlHhvKskJBykRi7Dze0jVTCeWF
 6zncRzClJoP3Ofzut9MEVgANCxGWCl41bJjUQMHjcNabScCR+A4+8LCnl9bqALN0hM
 aiCUVLDOpIjqA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <20201208210613.GA2420289@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201208154150.20978-1-michael@walle.cc>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, Qian Cai <qcai@redhat.com>, rjui@broadcom.com,
 f.fainelli@gmail.com, linux-rpi-kernel@lists.infradead.org,
 Jonathan.Cameron@huawei.com, bhelgaas@google.com, jonathan.derrick@intel.com,
 sbranden@broadcom.com, wangzhou1@hisilicon.com, rrichter@marvell.com,
 linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Qian]

On Tue, Dec 08, 2020 at 04:41:50PM +0100, Michael Walle wrote:
> Hi Lorenzo, Krzysztof,
> 
> >On Sun, 29 Nov 2020 23:07:38 +0000, Krzysztof Wilczyński wrote:
> >> Unify ECAM-related constants into a single set of standard constants
> >> defining memory address shift values for the byte-level address that can
> >> be used when accessing the PCI Express Configuration Space, and then
> >> move native PCI Express controller drivers to use newly introduced
> >> definitions retiring any driver-specific ones.
> >> 
> >> The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
> >> PCI Express specification (see PCI Express Base Specification, Revision
> >> 5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
> >> implement it the same way.
> >> 
> >> [...]
> >
> >Applied to pci/ecam, thanks!
> >
> >[1/5] PCI: Unify ECAM constants in native PCI Express drivers
> >      https://git.kernel.org/lpieralisi/pci/c/f3c07cf692
> >[2/5] PCI: thunder-pem: Add constant for custom ".bus_shift" initialiser
> >      https://git.kernel.org/lpieralisi/pci/c/3c38579263
> >[3/5] PCI: iproc: Convert to use the new ECAM constants
> >      https://git.kernel.org/lpieralisi/pci/c/333ec9d3cc
> >[4/5] PCI: vmd: Update type of the __iomem pointers
> >      https://git.kernel.org/lpieralisi/pci/c/89094c12ea
> >[5/5] PCI: xgene: Removed unused ".bus_shift" initialisers from pci-xgene.c
> >      https://git.kernel.org/lpieralisi/pci/c/3dc62532a5
> 
> Patch 1/5 breaks LS1028A boards:

I temporarily dropped this series while we figure out what went wrong
here.

Bjorn
