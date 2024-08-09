Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D194D153
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 15:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgPz43VqMz2yyJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 23:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgPyh3gzjz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 23:34:20 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9970092009C; Fri,  9 Aug 2024 15:34:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 92C6792009B;
	Fri,  9 Aug 2024 14:34:04 +0100 (BST)
Date: Fri, 9 Aug 2024 14:34:04 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240808020753.16282-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2408091356190.61955@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408071241160.61955@angie.orcam.me.uk> <20240808020753.16282-1-mattc@purestorage.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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

> > For the quirk to trigger, the link has to be down and there has to be the
> > LBMS Link Status bit set from link management events as per the PCIe spec
> > while the link was previously up, and then both of that while rescanning
> > the PCIe device in question, so there's a lot of conditions to meet.
> 
> If there is nothing clearing the bit then why is there any expectation that
> it wouldn't be set? We have 20/30/40 endpoints in a host that can be hot-removed,
> hot-added at any point in time in any combination & its often the case that
> the system uptime be hundreds of days. Eventually the bit will just become set
> as a result of time and scale.

 Well, in principle in a setup with reliable links the LBMS bit may never 
be set, e.g. this system of mine has been in 24/7 operation since the last 
reboot 410 days ago and for the devices that support Link Active reporting 
it shows:

LnkSta:Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt-
LnkSta:Speed 5GT/s, Width x8, TrErr- Train- SlotClk- DLActive+ BWMgmt+ ABWMgmt+
LnkSta:Speed 5GT/s, Width x1, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt+
LnkSta:Speed 5GT/s, Width x2, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt+
LnkSta:Speed 5GT/s, Width x1, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt+
LnkSta:Speed 8GT/s, Width x16, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt+
LnkSta:Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
LnkSta:Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
LnkSta:Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
LnkSta:Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
LnkSta:Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive+ BWMgmt- ABWMgmt-

so out of 11 devices 6 have the LBMS bit clear.  But then 5 have it set, 
perhaps worryingly, so of course you're right, that it will get set in the 
field, though it's not enough by itself for your problem to trigger.

 Then there is manual link retraining, which we do from time to time as 
well, which will set the bit too, which I overlooked.

 To cut the story short, it was an oversight of mine, especially as I 
don't really make any use myself of hot plug scenarios.

> > The reason for this is safety: it's better to have a link run at 2.5GT/s
> > than not at all, and from the nature of the issue there is no guarantee
> > that if you remove the speed clamp, then the link won't go back into the
> > infinite retraining loop that the workaround is supposed to break.
> 
> I guess I don't really understand why it wouldn't be safe for every device
> other than the ASMedia since they aren't the device that had the issue in the
> first place. The main problem in my mind is the system doesn't actually have to
> be retraining at all, it can occur the first time you replace a device or
> power cycle the device or the first time the device goes into DPC & comes back.
> If the quirk simply returned without doing anything when the ASMedia is not in the
> allow-list it would make me more at ease. I can also imagine some other implementations
> that would work well, but it doesn't seem correct that we could only give a single
> opportunity to a device before forcing it to live at Gen1. Perhaps it should be
> aware of the rate or a count or something...

 It's a complex matter.  For a starter please read the introduction at 
`pcie_failed_link_retrain'.

 When the problem triggers the link goes into an infinite link training 
loop, with the Link Training (LT) bit flipping on and off.  I've made a 
complementary workaround for U-Boot (since your bootstrap device can be 
downstream such a broken link), where a statistical probe is done for the 
LT bit flipping as discovered by polling the bit in a tight loop.  This is 
fine for a piece of firmware that has nothing better to do, but in an OS 
kernel we just can't do it.

 Also U-Boot does not remove the 2.5GT/s clamp because it does not have to 
set up the system in an optimal way, but just sufficiently to successfully 
boot.  An OS kernel can then adjust the configuration if it knows about 
the workaround, or leave it as it is.  In the latter case things will 
continue working across PCIe resets, because the TLS field is sticky.

 For Linux I went for just checking the DLLLA bit as it seems good enough 
for devices that support Link Active reporting.  And I admit that the 
workaround is quite aggressive, but this was a deliberate decision 
following the robustness principle: the end user may not be qualified 
enough to diagnose the problem and given its nature not even think it's 
something that can be made to work.  The downstream device does not show 
up in the PCIe hierarchy and just looks like it's broken.  It takes a lot 
of knowledge and experience to notice the LT bit flipping and even myself, 
quite a seasoned Linux kernel developer, only noticed it by chance.

 It was discussed to death with the original submission, the rationale is 
given in the introductory comment and I'd prefer that it stays as it is.  
The ASM2824 switch works just fine with other downstream devices and so 
does the PI7C9X2G304 switch with other upstream devices.  Both vendors 
refused to help narrow it down and declined to comment (a person from 
Diodes née Pericom replied, but they learnt it's about a PCIe switch they 
told me they were from another department and couldn't help), which would 
have helped (I now just recommend staying away from both manufacturers).  
Therefore my assumption is this can potentially trigger with any pair of 
devices.

 I have now posted a patch series to address this problem of yours and a 
previous issue reported by Ilpo.  See: 
<https://patchwork.kernel.org/project/linux-pci/list/?series=878216>, and 
I've included you in the list of direct recipients too.

 I will appreciate if you give it a try, and again, apologies for the 
trouble caused, but such things happen in engineering.

  Maciej
