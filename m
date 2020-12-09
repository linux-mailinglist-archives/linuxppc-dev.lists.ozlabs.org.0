Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB12D4D45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 23:07:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrrlG49HyzDqvL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 09:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ke+i/bOP; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrrhZ45QMzDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 09:05:34 +1100 (AEDT)
Date: Wed, 9 Dec 2020 16:05:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607551532;
 bh=NRmjl76QtNuV/wif/5gsS8SlkBI3WP3SYGnwAzcAoIk=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=ke+i/bOPO8oqw4snKSRZqWgA+X70pBTq3TlLU6+f/sBwRMDnK3UQVuxBAlbz+5JuG
 HbsmkIgSr2l223J1gFfhDBWIQt198XfTfVvZ6h7Rs+UeyTu70cWLUFU0BrxvgM9rLB
 NS6CnGtlISHesQmPZ1CicrW8sCDa75BpNlClKad00vgXbdeNDE+Biz+Pd+AHMRKqri
 wZRFqVv3t7igKtAUoiYiLgsG0Z45HNSQgVeX4M/ia18c28B75TzLVFuIgeVEBDvwDx
 wrMbUSHfnlPhp0Fj6zIVeapwE/2HW4eZHz3/Fa6LOC85UB/rD6X+eleGUFnNKeSP67
 6XwImIuzTnqmg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <20201209220530.GA2551354@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209214359.gt4wisqh65oscd4i@skbuf>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, Michael Walle <michael@walle.cc>,
 rrichter@marvell.com, linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 11:43:59PM +0200, Vladimir Oltean wrote:
> On Wed, Dec 09, 2020 at 03:34:49PM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 09, 2020 at 11:20:17PM +0200, Vladimir Oltean wrote:
> > > On Wed, Dec 09, 2020 at 02:59:13PM -0600, Bjorn Helgaas wrote:
> > > > Yep, that's the theory.  Thanks for testing it!
> > >
> > > Testing what? I'm not following.
> >
> > You posted a patch that you said fixed the bug for you.  The fix is
> > exactly the theory we've been discussing, so you have already verified
> > that the theory is correct.
> >
> > I'm sure Krzysztof will update his patch, and we'll get this tidied up
> > in -next again.
> 
> If you were discussing this already, I missed it. I was copied to this
> thread out of the blue two emails ago. I also looked at the full thread
> on patchwork, I don't see anything being said about the culprit being
> the size of the config space mapping.

Oh, sorry, this was an IRC discussion on #linux-pci (OFTC):

  10:51 AM <bjorn_> so the fault is on the first read for 00:00.1.  forget my noise about extracting the device/func from the *virtual* address.  the *physical* address is supposed to be aligned so you can do that, but not the virtual address
  10:55 AM <bjorn_> kwilczynski: oh, i think i see it: pci_ecam_create() does "bsz = 1 << ops->bus_shift", but we removed .bus_shift for this case
  10:55 AM <bjorn_> needs to default to 20 if it's not specified
  10:56 AM <bjorn_> result is that we only map one page of the ECAM space, so we fault when we access the second page (which is where 00:00.1 starts)

Anyway, thanks very much again for fixing this and confirming the fix!

Bjorn
