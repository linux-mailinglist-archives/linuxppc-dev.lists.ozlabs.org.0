Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1C44E5CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 12:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrH7r0W4Hz3cCs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 22:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HrH7N32k5z2xCc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 22:54:23 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1ACBnjBf016776;
 Fri, 12 Nov 2021 05:49:45 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1ACBnfPp016770;
 Fri, 12 Nov 2021 05:49:41 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 12 Nov 2021 05:49:41 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Message-ID: <20211112114941.GK614@gate.crashing.org>
References: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <20211110184106.GA1251058@bhelgaas> <87sfw3969l.wl-maz@kernel.org>
 <8cc64c3b-b0c0-fb41-9836-2e5e6a4459d1@xenosoft.de>
 <87r1bn88rt.wl-maz@kernel.org>
 <f40294c6-a088-af53-eeea-4dfbd255c5c9@xenosoft.de>
 <87pmr7803l.wl-maz@kernel.org>
 <CAOesGMgHfsFKWOXNOMghO3Xqj2y8M5XA8GjVV5ciOT0A4b+wdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMgHfsFKWOXNOMghO3Xqj2y8M5XA8GjVV5ciOT0A4b+wdg@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Jens Axboe <axboe@kernel.dk>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 mad skateman <madskateman@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 kw@linux.com, Marc Zyngier <maz@kernel.org>, damien.lemoal@opensource.wdc.com,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Darren Stevens <darren@stevens-zone.net>, Bjorn Helgaas <helgaas@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, robert@swiecki.net,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 11, 2021 at 02:21:46PM -0800, Olof Johansson wrote:
> On Thu, Nov 11, 2021 at 2:20 AM Marc Zyngier <maz@kernel.org> wrote:
> > Am I right in understanding that the upstream kernel does not support
> > the machine out of the box, and that you actually have to apply out of
> > tree patches to make it work? That these patches have to do with the
> > IRQ routing?
> 
> To my knowledge that has never been needed -- that the base platform
> support is all there.
> 
> This is an old platform, and just like with the power macs, the
> devicetree is indeed supplied from firmware, and as such not easily
> patchable like with ARM platforms.
> 
> Last time this was an issue (to my memory) was when they enabled
> automatic little endian switching in the boot path, that caused some
> issues with a (bad) phandle pointer that had gone undiscovered for 10+
> years.
> 
> > If so, I wonder why upstream should revert a patch to work on a system
> > that isn't supported upstream the first place. I will still try and
> > come up with a solution for you. But asking for the revert of a patch
> > on these grounds is not, IMHO, acceptable. Also, please provide these
> > patches on the list so that I can help you to some extend (and I mean
> > *on the list*, not on a random forum that collects my information).
> 
> Early fixups of DT is the way to go here, if needed -- we do it on
> some other platforms. That can happen in-kernel, and keep the new
> functionality. For that we'd need to figure out what's actually wrong
> with the DT as such right now.

Yup.  The scheme we have now (copy all info from OF, and then take over
everything at once) is not ideal at all, but treating OF systems just
like "bare" systems has advantages as well, including making it easier
to fix up the device tree if it has problems.  This is much superior to
changing all consumers (drivers etc.) to deal with the broken device
trees, so we should do it much more often :-)


Segher
