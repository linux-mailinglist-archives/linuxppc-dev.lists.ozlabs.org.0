Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907E94A6BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 13:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf6yT0d0Jz3dH4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf6y4715Qz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 21:14:19 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D4EE292009C; Wed,  7 Aug 2024 13:14:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CEB8492009B;
	Wed,  7 Aug 2024 12:14:13 +0100 (BST)
Date: Wed, 7 Aug 2024 12:14:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240807084348.12304-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2408070956520.61955@angie.orcam.me.uk>
References: <20240806193622.GA74589@bhelgaas> <20240807084348.12304-1-mattc@purestorage.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, helgaas@kernel.org, kuba@kernel.org, pabeni@redhat.com, Jim Wilson <wilson@tuliptree.org>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, pali@kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2024, Matthew W Carlis wrote:

> > it does seem like this series made wASMedia ASM2824 work better but
> > caused regressions elsewhere, so maybe we just need to accept that
> > ASM2824 is slightly broken and doesn't work as well as it should.
> 
> One of my colleagues challenged me to provide a more concrete example
> where the change will cause problems. One such configuration would be not
> implementing the Power Controller Control in the Slot Capabilities Register.
> Then, Powering off the slot via out-of-band interfaces would result in the
> kernel forcing the DSP to Gen1 100% of the time as far as I can tell. 
> The aspect of this force to Gen1 that is the most concerning to my team is
> that it isn't cleaned up even if we replaced the EP with some other EP.

 Why does that happen?

 For the quirk to trigger, the link has to be down and there has to be the 
LBMS Link Status bit set from link management events as per the PCIe spec 
while the link was previously up, and then both of that while rescanning 
the PCIe device in question, so there's a lot of conditions to meet.  Is 
it the case that in your setup there is no device at this point, but one 
gets plugged in later?

 One aspect to mention here is that when taking a device offline the LBMS 
Link Status bit really ought to be cleared by Linux in the corresponding 
downstream port of the parent device.  As I recall Ilpo was working on a 
broader link bandwidth management subsystem for Linux, which would do that 
among others.  He asked me to make experiments with my problematic machine 
to see if this would interfere, but unrelated issues with DRAM controller 
(now fixed by reducing the DDR clock rate) have prevented me from doing 
that.  I'll see if I can get back to that soon.

> I was curious about the PCIe devices mentioned in the commit because I
> look at crazy malfunctioning devices too often so I pasted the following:
> "Delock Riser Card PCI Expres 41433" into Google. 
> I'm not really a physical layer guy, but is it possible that the reported
> issue be due to signal integrity? I'm not sure if sending PCIe over a USB
> cable is "reliable".

 Well, it's a transmission line and as long as bandwidth and latency 
requirements are met it's as good as any.  My understanding has been one 
of the objectives of PCIe over conventional PCI was to make external links 
such as to expansion boxes easier to implement.

 Please note that it is a purpose-made cable too, rather than just an 
off-the-shelf USB cable.  Then I have solutions deployed with PCIe routed 
over DVI cables too.

 I doubt it could be a signal integrity issue, because once the link has 
negotiated the highest speed possible (Gen2) via this complicated dance it 
works with no issues for months.  I'm not sure what the highest uptime for 
the system in question exactly was, but it was in the range of half a 
year, and I have a network interface downstream which I regularly use for 
heavy NFS traffic in GNU tool chain regression verification, so any issue 
would have shown up pretty quickly.

 Given how switching between speed rates works with PCIe (by establishing 
a link at 2.5GT/s first and then exchanging rates available as data before 
choosing the highest supported by both endpoints) I suspect that it is a 
protocol issue: either or both devices have got it slightly wrong, which 
breaks it when they're combined together.  Otherwise why would retraining 
to 5GT/s by hand work while it doesn't if to be done by hardware itself?  
There is not much if any difference here between both scenarios really.

> I've never worked with an ASMedia switch and don't have a reliable way to
> reproduce anything like the interaction between the two device at hand. As
> much as I hate to make the request my thinking is that the patch should be
> reverted until there is a solution that doesn't leave the link forced to
> Gen1 forever for every EP thereafter.

 I'm working on such a change this week.

 It's just that my primary objectives for this maintenance visit at my lab 
were to fix a pair of broken PSUs (which I have now done) and upgrade the 
firmware of a console manager device to fix an issue with a remote serial 
BREAK feature affecting Magic SysRq (also completed), plus I have a day 
job too that is unrelated.

 I also bought a PCIe to dual M.2 M-Key option card with the ASM2824 
switch onboard to have a different setup to evaluate and determine if this 
issue is specific to the RISC-V board or not.  Unfortunately the ASM2824 
does not bring the downstream ports up if the card is placed in a slot 
that does not supply Vaux (which is a conforming arrangement according to 
the PCIe spec), apparently due to a quirk in the ASM2824 switch according 
to the option card manufacturer, and there is no software workaround 
possible.

 So I won't be able to use this alternative arrangement until I have 
modified the option card, which I won't be able to do before October the 
earliest.  

 I just can't help with that there is so many broken hardware designs out 
there and I have to strive to navigate through and do my job regardless.

  Maciej
