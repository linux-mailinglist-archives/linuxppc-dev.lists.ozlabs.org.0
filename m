Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3A9394EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 22:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSXQP4Sgyz3d95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 06:47:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 371 seconds by postgrey-1.37 at boromir; Tue, 23 Jul 2024 06:46:48 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSXQ03mlCz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 06:46:48 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3F9AC92009C; Mon, 22 Jul 2024 22:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 38AC992009B;
	Mon, 22 Jul 2024 21:40:29 +0100 (BST)
Date: Mon, 22 Jul 2024 21:40:29 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240722193407.23255-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2407222117300.51207@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2306111619570.64925@angie.orcam.me.uk> <20240722193407.23255-1-mattc@purestorage.com>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, Jim Wilson <wilson@tuliptree.org>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, saeedm@nvidia.com, pali@kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Ilpo for his previous involvement here]

On Mon, 22 Jul 2024, Matthew W Carlis wrote:

> Sorry to resurrect this one, but I was wondering why the
> PCI device ID in drivers/pci/quirks.c for the ASMedia ASM2824
> isn't checked before forcing the link down to Gen1... We have
> had to revert this patch during our kernel migration due to it
> interacting poorly with at least one older Gen3 PLX PCIe switch
> vendor/generation while using DPC. In another context we have
> found similar issues during system bringup without DPC while
> using a more legacy hot-plug model (BIOS defaults for us..).
> In both contexts our devices are stuck at Gen1 after physical
> hot-plug/insert, power-cycle.

 Sorry to hear about your problems.  However the workaround is supposed to 
only trigger if the link has already failed negotiation.  Could you please 
be more specific as to the actual scenario where it triggers?

 A scenario was mentioned earlier on, where a downstream device has been 
removed from a slot and left behind the LBMS bit set in the corresponding 
downstream port of the upstream device.  It then triggered the workaround 
where the port was rescanned with the slot still empty, which then left 
the link capped at 2.5GT/s for a device subsequently inserted.  Is it what 
happens for you?

 As I recall Ilpo has been working on changes that among others should 
make sure no stale LBMS bit has been left set, but I'm not sure what the 
state of affairs has been here.  Myself I've been too swamped in the 
recent months and consequently didn't look into any improvements in this 
area (and unrelated issues involving the system in question in my remote 
lab have further impeded me).

> Tried reading through the patch history/review but it was still
> a little bit unclear to me. Can we add the device ID check as a
> precondition to forcing link to Gen1?

 The main reason is it is believed that it is the downstream device 
causing the issue, and obviously you can't fetch its ID if you can't 
negotiate link so as to talk to it in the first place.

  Maciej
