Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5AD8369
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 00:16:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t8sv2v6DzDr6t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 09:16:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="EhEOnFJ/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t8qw6JYnzDr5l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 09:15:08 +1100 (AEDT)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D81C2064B;
 Tue, 15 Oct 2019 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571177706;
 bh=afEURU9H7AUIwMeUzdu2Wm2/2X1q+EF8F1gELcUMlxQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EhEOnFJ/ywPmJY8ZlW+FMdW9RTHzpz//OmB/dl5hZod+v50WUNdcFVGIuLKpQ1LkO
 wcBPGWFoc6TJ/Huz5pMTcKCL+740mp6HbucMyDLU4T4gJNsOIaQO8KhzyoyX34oisg
 uMmgOr8igB7F+TcJeH7dlA8e3GQ6wehxPTMqoo8Q=
Date: Tue, 15 Oct 2019 17:14:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Subject: Re: [PATCH v5 03/23] PCI: hotplug: Add a flag for the movable BARs
 feature
Message-ID: <20191015221449.GA181069@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92cf42bf-5044-329d-f1be-53b48801865f@yadro.com>
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

On Mon, Sep 30, 2019 at 03:59:25PM +0300, Sergey Miroshnichenko wrote:
> Hello Bjorn,
> 
> On 9/28/19 1:02 AM, Bjorn Helgaas wrote:
> > On Fri, Aug 16, 2019 at 07:50:41PM +0300, Sergey Miroshnichenko wrote:
> > > When hot-adding a device, the bridge may have windows not big enough (or
> > > fragmented too much) for newly requested BARs to fit in. And expanding
> > > these bridge windows may be impossible because blocked by "neighboring"
> > > BARs and bridge windows.
> > > 
> > > Still, it may be possible to allocate a memory region for new BARs with the
> > > following procedure:
> > > 
> > > 1) notify all the drivers which support movable BARs to pause and release
> > >     the BARs; the rest of the drivers are guaranteed that their devices will
> > >     not get BARs moved;
> > > 
> > > 2) release all the bridge windows except of root bridges;
> > > 
> > > 3) try to recalculate new bridge windows that will fit all the BAR types:
> > >     - fixed;
> > >     - immovable;
> > >     - movable;
> > >     - newly requested by hot-added devices;
> > > 
> > > 4) if the previous step fails, disable BARs for one of the hot-added
> > >     devices and retry from step 3;
> > > 
> > > 5) notify the drivers, so they remap BARs and resume.
> > 
> > You don't do the actual recalculation in *this* patch, but since you
> > mention the procedure here, are we confident that we never make things
> > worse?
> > 
> > It's possible that a hot-add will trigger this attempt to move things
> > around, and it's possible that we won't find space for the new device
> > even if we move things around.  But are we certain that every device
> > that worked *before* the hot-add will still work *afterwards*?
> > 
> > Much of the assignment was probably done by the BIOS using different
> > algorithms than Linux has, so I think there's some chance that the
> > BIOS did a better job and if we lose that BIOS assignment, we might
> > not be able to recreate it.
> 
> If a hardware has some special constraints on BAR assignment that the
> kernel is not aware of yet, the movable BARs may break things after a
> hotplug event. So the feature must be disabled there (manually) until
> the kernel get support for that special needs.

I'm not talking about special constraints on BAR assignment.  (I'm not
sure what those constraints would be -- AFAIK the constraints for a
spec-compliant device are all discoverable via the BAR size and type
(or the Enhanced Allocation capability)).

What I'm concerned about is the case where we boot with a working
assignment, we hot-add a device, we move things around to try to
accommodate the new device, and not only do we fail to find resources
for the new device, we also fail to find a working assignment for the
devices that were present at boot.  We've moved things around from
what BIOS did, and since we use a different algorithm than the BIOS,
there's no guarantee that we'll be able to find the assignment BIOS
did.

> > I'm not sure why the PCI_CLASS_DISPLAY_VGA special case is there; can
> > you add a comment about why that's needed?  Obviously we can't move
> > the 0xa0000 legacy frame buffer because I think devices are allowed to
> > claim that region even if no BAR describes it.  But I would think
> > *other* BARs of VGA devices could be movable.
> 
> Sure, I'll add a comment to the code.
> 
> The issue that we are avoiding by that is the "nomodeset" command line
> argument, which prevents a video driver from being bound, so the BARs
> are seems to be used, but can't be moved, otherwise machines just hang
> after hotplug events. That was the only special ugly case we've
> spotted during testing. I'll check if it will be enough just to work
> around the 0xa0000.

"nomodeset" is not really documented and is a funny way to say "don't
bind video drivers that know about it", but OK.  Thanks for checking
on the other BARs.

> > > +bool pci_movable_bars_enabled(void);
> > 
> > I would really like it if this were simply
> > 
> >    extern bool pci_no_movable_bars;
> > 
> > in drivers/pci/pci.h.  It would default to false since it's
> > uninitialized, and "pci=no_movable_bars" would set it to true.
> 
> I have a premonition of platforms that will not support the feature.
> Wouldn't be better to put this variable-flag to include/linux/pci.h ,
> so code in arch/* can set it, so they could work by default, without
> the command line argument?

In general I don't see why a platform wouldn't support this since
there really isn't anything platform-specific here.  But if a platform
does need to disable it, having arch code set this flag sounds
reasonable.  We shouldn't make it globally visible until we actually
need that, though.

> > We have similar "=off" and "=force" parameters for ASPM and other
> > things, and it makes the code really hard to analyze.

The "=off" and "=force" things are the biggest things I'd like to
avoid.

Bjorn
