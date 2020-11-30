Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3E2C8AC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:22:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClBrZ2gNPzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 04:22:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TGw3iJHv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClBpS4cYRzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 04:21:04 +1100 (AEDT)
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E7372074A;
 Mon, 30 Nov 2020 17:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606756859;
 bh=CbyJZAykpCyvjLTpCkzzfJ9pt8bGnYt3xwR2qqUfoI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TGw3iJHvgbb+g7diOKMOugr/nuC73+5xTFsD9rPkDlD83W1yHAv7Z9v4H3q8I+h2c
 xfiTLITVOpwfI8mn+Ad8xB8BJQI4zSsYIJBr4W2mHE1j1LovJTR5pfq9Lf1A6rY2iM
 aagN+CcdLl1BicBBB0tVOwQNrEZ9ea5LezYWYgRc=
Date: Mon, 30 Nov 2020 11:20:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v6 4/5] PCI: vmd: Update type of the __iomem pointers
Message-ID: <20201130172058.GA1088391@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f4ddc2f0524b4b80c8a0bfa2df57fe@AcuMS.aculab.com>
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
Cc: 'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 09:06:56AM +0000, David Laight wrote:
> From: Krzysztof Wilczynski
> > Sent: 29 November 2020 23:08
> > 
> > Use "void __iomem" instead "char __iomem" pointer type when working with
> > the accessor functions (with names like readb() or writel(), etc.) to
> > better match a given accessor function signature where commonly the
> > address pointing to an I/O memory region would be a "void __iomem"
> > pointer.
> 
> ISTM that is heading in the wrong direction.
> 
> I think (form the variable names etc) that these are pointers
> to specific registers.
> 
> So what you ought to have is a type for that register block.
> Typically this is actually a structure - to give some type
> checking that the offsets are being used with the correct
> base address.

In this case, "cfgbar" is not really a pointer to a register; it's the
address of memory-mapped config space.  The VMD hardware turns
accesses to that space into PCI config transactions on its secondary
side.  xgene_pcie_get_cfg_base() and brcm_pcie_map_conf() are similar
situations and use "void *".

Bjorn
