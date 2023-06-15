Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAC730C50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 02:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhNlX2qpzz3bZ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 10:41:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhNl20Cq3z303R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 10:41:15 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1222292009D; Thu, 15 Jun 2023 02:41:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0AE5092009C;
	Thu, 15 Jun 2023 01:41:11 +0100 (BST)
Date: Thu, 15 Jun 2023 01:41:10 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v9 00/14] pci: Work around ASMedia ASM2824 PCIe link
 training failures
In-Reply-To: <20230614231203.GA1451606@bhelgaas>
Message-ID: <alpine.DEB.2.21.2306150124010.64925@angie.orcam.me.uk>
References: <20230614231203.GA1451606@bhelgaas>
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

On Wed, 14 Jun 2023, Bjorn Helgaas wrote:

> >  This is v9 of the change to work around a PCIe link training phenomenon 
> > where a pair of devices both capable of operating at a link speed above 
> > 2.5GT/s seems unable to negotiate the link speed and continues training 
> > indefinitely with the Link Training bit switching on and off repeatedly 
> > and the data link layer never reaching the active state.
> > 
> >  With several requests addressed and a few extra issues spotted this
> > version has now grown to 14 patches.  It has been verified for device 
> > enumeration with and without PCI_QUIRKS enabled, using the same piece of 
> > RISC-V hardware as previously.  Hot plug or reset events have not been 
> > verified, as this is difficult if at all feasible with hardware in 
> > question.
> > 
> >  Last iteration: 
> > <https://lore.kernel.org/r/alpine.DEB.2.21.2304060100160.13659@angie.orcam.me.uk/>, 
> > and my input to it:
> > <https://lore.kernel.org/r/alpine.DEB.2.21.2306080224280.36323@angie.orcam.me.uk/>.
> 
> Thanks, I applied these to pci/enumeration for v6.5.

 Great, thanks!

> I tweaked a few things, so double-check to be sure I didn't break
> something:
> 
>   - Moved dev->link_active_reporting init to set_pcie_port_type()
>     because it does other PCIe-related stuff.
> 
>   - Reordered to keep all the link_active_reporting things together.
> 
>   - Reordered to clean up & factor pcie_retrain_link() before exposing
>     it to the rest of the PCI core.
> 
>   - Moved pcie_retrain_link() a little earlier to keep it next to
>     pcie_wait_for_link_status().
> 
>   - Squashed the stubs into the actual quirk so we don't have the
>     intermediate state where we call the stubs but they never do
>     anything (let me know if there's a reason we need your order).
> 
>   - Inline pcie_parent_link_retrain(), which seemed like it didn't add
>     enough to be worthwhile.

 Ack, I'll double-check and report back.  A minor nit I've spotted below:

>  static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
>  {
> -	bool retrain = true;
>  	int delay = 1;
> +	bool retrain = false;
> +	struct pci_dev *bridge;
> +
> +	if (pci_is_pcie(dev)) {
> +		retrain = true;
> +		bridge = pci_upstream_bridge(dev);
> +	}

 If doing it this way, which I actually like, I think it would be a little 
bit better performance- and style-wise if this was written as:

	if (pci_is_pcie(dev)) {
		bridge = pci_upstream_bridge(dev);
		retrain = !!bridge;
	}

(or "retrain = bridge != NULL" if you prefer this style), and then we 
don't have to repeatedly check two variables iff (pcie && !bridge) in the 
loop below:

> @@ -1201,9 +1190,9 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
>  		}
>  
>  		if (delay > PCI_RESET_WAIT) {
> -			if (retrain) {
> +			if (retrain && bridge) {

-- i.e. code can stay then as:

			if (retrain) {

here.  I hope you find this observation rather obvious, so will you amend 
your tree, or shall I send an incremental update?

 Otherwise I don't find anything suspicious with the interdiff itself 
(thanks for posting it, that's really useful indeed!), but as I say I'll 
yet double-check how things look and work with your tree.  Hopefully 
tomorrow (Thu), as I have other stuff yet to complete tonight.

  Maciej
