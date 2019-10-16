Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 173EED9883
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 19:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tfTp38LNzDqRZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 04:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="RXsXrlLH"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tfRp6TcFzDr2m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 04:29:26 +1100 (AEDT)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11C3F2064B;
 Wed, 16 Oct 2019 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571246963;
 bh=BEpB3EZXTTbBVHMZTuth4NJifvFzukmeM5QhNOdo5O8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=RXsXrlLHIT6c2YxY3aRTF3agjspzd2zA6EvbXspnsMyNWhY6qr+Mlnxz/ITGQF7JB
 +WFkFg2u0vGjdcPMekt73bcWe3e3yUyValMWH2ZOW5Fb0pejyG6sawlvaZGGZRM0ve
 sxfTXrVbGvaSc6yuhyOdF3QO/ikKKDqlKhzkr1pw=
Date: Wed, 16 Oct 2019 12:29:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Subject: Re: [PATCH v5 03/23] PCI: hotplug: Add a flag for the movable BARs
 feature
Message-ID: <20191016172921.GA42365@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c6c630-fbfb-175c-2a1a-c9a1f732498a@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux@yadro.com, Lukas Wunner <lukas@wunner.de>,
 Oliver O'Halloran <oohall@gmail.com>, Rajat Jain <rajatja@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 16, 2019 at 06:50:30PM +0300, Sergey Miroshnichenko wrote:
> On 10/16/19 1:14 AM, Bjorn Helgaas wrote:
> > On Mon, Sep 30, 2019 at 03:59:25PM +0300, Sergey Miroshnichenko wrote:
> > > On 9/28/19 1:02 AM, Bjorn Helgaas wrote:

> > > > It's possible that a hot-add will trigger this attempt to move things
> > > > around, and it's possible that we won't find space for the new device
> > > > even if we move things around.  But are we certain that every device
> > > > that worked *before* the hot-add will still work *afterwards*?
> > > > 
> > > > Much of the assignment was probably done by the BIOS using different
> > > > algorithms than Linux has, so I think there's some chance that the
> > > > BIOS did a better job and if we lose that BIOS assignment, we might
> > > > not be able to recreate it.
> > > 
> > > If a hardware has some special constraints on BAR assignment that the
> > > kernel is not aware of yet, the movable BARs may break things after a
> > > hotplug event. So the feature must be disabled there (manually) until
> > > the kernel get support for that special needs.
> > 
> > I'm not talking about special constraints on BAR assignment.  (I'm not
> > sure what those constraints would be -- AFAIK the constraints for a
> > spec-compliant device are all discoverable via the BAR size and type
> > (or the Enhanced Allocation capability)).
> > 
> > What I'm concerned about is the case where we boot with a working
> > assignment, we hot-add a device, we move things around to try to
> > accommodate the new device, and not only do we fail to find resources
> > for the new device, we also fail to find a working assignment for the
> > devices that were present at boot.  We've moved things around from
> > what BIOS did, and since we use a different algorithm than the BIOS,
> > there's no guarantee that we'll be able to find the assignment BIOS
> > did.
> 
> If BAR assignment fails with a hot-added device, these patches will
> disable BARs for this device and retry, falling back to the situation
> where number of BARs and their size are the same as they were before
> the hotplug event.
> 
> If all the BARs are immovable - they will just remain on their
> positions. Nothing to break here I guess.
> 
> If almost all the BARs are immovable and there is one movable BAR,
> after releasing the bridge windows there will be a free gap - right
> where this movable BAR was. These patches are keeping the size of
> released BARs, not requesting the size from the devices again - so the
> device can't ask for a larger BAR. The space reserving is disabled by
> this patchset, so the kernel will request the same size for the bridge
> window containing this movable BAR. So there always will be a gap for
> this BAR - in the same location it was before.
> 
> Based on these considerations I assume that the kernel is always able
> to arrange BARs from scratch if a BIOS was able to make it before.
> 
> But! There is an implicit speculation that there will be the same
> amount of BARs after the fallback (which is equivalent to a PCI rescan
> triggered on unchanged topology). And two week ago I've found that
> this is not always true!
> 
> I was testing on a "new" x86_64 PC, where BIOS doesn't reserve a space
> for SR-IOV BARs (of a network adapter). On the boot, the kernel wasn't
> arranging BARs itself - it took values written by the BIOS. And the
> bridge window was "jammed" between immovable BARs, so it can't expand.
> BARs of this device are also immovable, so the bridge window can't be
> moved away. During the PCI rescan, the kernel tried to allocate both
> "regular" and SR-IOV BARs - and failed. Even without changes in the
> PCI topology.
> 
> So in the next version of this series there will be one more patch,
> that allows the kernel to ignore BIOS's setting for the "safe" (non-IO
> and non-VGA) BARs, so these BARs will be arranged kernel-way - and
> also those forgotten by the BIOS.

This still seems a little scary, so I'll probably ask about it again :)

> After modifying the code as you advised, it became possible to mark
> only some BARs of the device as immovable. So the code is less ugly
> now, and it also works for drivers/video/fbdev/efifb.c , which uses
> the BAR in a weird way (dev->driver is NULL, but not the res->child):
> 
>   static bool pci_dev_movable(struct pci_dev *dev,
>                               bool res_has_children)
>   {
>     if (!pci_can_move_bars)
>       return false;
> 
>     if (dev->driver && dev->driver->rescan_prepare)
>       return true;
> 
>     if (!dev->driver && !res_has_children)
>       return true;
> 
>     return false;
>   }
> 
>   bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res)
>   {
>     if (res->flags & IORESOURCE_PCI_FIXED)
>       return false;
> 
>     #ifdef CONFIG_X86
>     /* Workaround for the legacy VGA memory 0xa0000-0xbffff */
>     if (res->start == 0xa0000)

Nit here; "res->start" is the CPU address, but what you need to check
is the PCI bus address, e.g., something from pcibios_resource_to_bus().
And this is not x86-specific.  0xa0000 is magic on PCI no matter what
the processor architecture.

>       return false;
>     #endif
> 
>     return pci_dev_movable(dev, res->child);
>   }
