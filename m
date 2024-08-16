Return-Path: <linuxppc-dev+bounces-139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB609553CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:38:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlz2L2V5Pz2xl6;
	Sat, 17 Aug 2024 09:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlk7y4hXxz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 23:57:16 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C985492009D; Fri, 16 Aug 2024 15:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C3A4792009C;
	Fri, 16 Aug 2024 14:57:09 +0100 (BST)
Date: Fri, 16 Aug 2024 14:57:09 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>
cc: alex.williamson@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, david.abdurachmanov@gmail.com, 
    edumazet@google.com, helgaas@kernel.org, kuba@kernel.org, leon@kernel.org, 
    linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
    linux-rdma@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lukas@wunner.de, 
    mahesh@linux.ibm.com, mika.westerberg@linux.intel.com, 
    netdev@vger.kernel.org, npiggin@gmail.com, oohall@gmail.com, 
    pabeni@redhat.com, pali@kernel.org, saeedm@nvidia.com, sr@denx.de, 
    Jim Wilson <wilson@tuliptree.org>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240815194059.28798-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2408160312180.59022@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408091356190.61955@angie.orcam.me.uk> <20240815194059.28798-1-mattc@purestorage.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Aug 2024, Matthew W Carlis wrote:

> > Well, in principle in a setup with reliable links the LBMS bit may never 
> > be set, e.g. this system of mine has been in 24/7 operation since the last 
> > reboot 410 days ago and for the devices that support Link Active reporting 
> > it shows:
> > ...
> > so out of 11 devices 6 have the LBMS bit clear.  But then 5 have it set, 
> > perhaps worryingly, so of course you're right, that it will get set in the 
> > field, though it's not enough by itself for your problem to trigger.
> 
> The way I look at it is that its essentially a probability distribution with time,
> but I try to avoid learning too much about the physical layer because I would find
> myself debugging more hardware issues lol. I also don't think LBMS/LABS being set
> by itself is very interesting without knowing the rate at which it is being set.

 Agreed.  Ilpo's upcoming bandwidth controller will hopefully give us such 
data.

> FWIW I have seen some devices in the past going into recovery state many times a
> second & still never downtrain, but at the same time they were setting the
> LBMS/LABS bits which maybe not quite spec compliant.
> 
> I would like to help test these changes, but I would like to avoid having to test
> each mentioned change individually. Does anyone have any preferences in how I batch
> the patches for testing? Would it be ok if I just pulled them all together on one go?

 Certainly fine with me, especially as 3/4 and 4/4 aren't really related 
to your failure scenario, and then you need 1/4 and 2/4 both at a time to 
address both aspects of the issue you have reported.

  Maciej

