Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96E733133
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 14:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjJNT4yVFz3bn6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:28:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjJMz5tksz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 22:27:57 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1B84492009C; Fri, 16 Jun 2023 14:27:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 13F8F92009B;
	Fri, 16 Jun 2023 13:27:53 +0100 (BST)
Date: Fri, 16 Jun 2023 13:27:52 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v9 00/14] pci: Work around ASMedia ASM2824 PCIe link
 training failures
In-Reply-To: <20230615183754.GA1483387@bhelgaas>
Message-ID: <alpine.DEB.2.21.2306160431470.64925@angie.orcam.me.uk>
References: <20230615183754.GA1483387@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Oliver O'Halloran <oohall@gmail.com>, Stefan Roese <sr@denx.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jim Wilson <wilson@tuliptree.org>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>, netdev@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Jun 2023, Bjorn Helgaas wrote:

> >  If doing it this way, which I actually like, I think it would be a little 
> > bit better performance- and style-wise if this was written as:
> > 
> > 	if (pci_is_pcie(dev)) {
> > 		bridge = pci_upstream_bridge(dev);
> > 		retrain = !!bridge;
> > 	}
> > 
> > (or "retrain = bridge != NULL" if you prefer this style), and then we 
> > don't have to repeatedly check two variables iff (pcie && !bridge) in the 
> > loop below:
> 
> Done, thanks, I do like that better.  I did:
> 
>   bridge = pci_upstream_bridge(dev);
>   if (bridge)
>     retrain = true;
> 
> because it seems like it flows more naturally when reading.

 Perfect, and good timing too, as I have just started checking your tree 
as your message arrived.  I ran my usual tests with and w/o PCI_QUIRKS 
enabled and results were as expected.  As before I didn't check hot plug 
and reset paths as these features are awkward with the HiFive Unmatched 
system involved.

 I have skimmed over the changes as committed to pci/enumeration and found 
nothing suspicious.  I have verified that the tree builds as at each of 
them with my configuration.

 As per my earlier remark:

> I think making a system halfway-fixed would make little sense, but with
> the actual fix actually made last as you suggested I think this can be
> split off, because it'll make no functional change by itself.

I am not perfectly happy with your rearrangement to fold the !PCI_QUIRKS 
stub into the change carrying the actual workaround and then have the 
reset path update with a follow-up change only, but I won't fight over it.  
It's only one tree revision that will be in this halfway-fixed state and 
I'll trust your judgement here.

 Let me know if anything pops up related to these changes anytime and I'll 
be happy to look into it.  The system involved is nearing two years since 
its deployment already, but hopefully it has many years to go yet and will 
continue being ready to verify things.  It's not that there's lots of real 
RISC-V hardware available, let alone with PCI/e connectivity.

 Thank you for staying with me and reviewing this patch series through all 
the iterations.

  Maciej
