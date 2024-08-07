Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871294A72E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 13:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf7kv37N4z3dT1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf7kV3Qxsz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 21:49:22 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 60AD292009C; Wed,  7 Aug 2024 13:49:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5A9F492009B;
	Wed,  7 Aug 2024 12:49:09 +0100 (BST)
Date: Wed, 7 Aug 2024 12:49:09 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240806000659.30859-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2408071241160.61955@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2306201040200.14084@angie.orcam.me.uk> <20240806000659.30859-1-mattc@purestorage.com>
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

On Mon, 5 Aug 2024, Matthew W Carlis wrote:

> The most common place where we see our systems getting stuck at Gen1 is with
> device power cycling. If a device is powered on and then off quickly then the
> link will of course fail to train & the consequence here is that the port is
> forced to Gen1 forever. Does anybody know why the patch will only remove the
> forced Gen1 speed from the ASMedia device?

 I know, as the author of the change.

 The reason for this is safety: it's better to have a link run at 2.5GT/s 
than not at all, and from the nature of the issue there is no guarantee 
that if you remove the speed clamp, then the link won't go back into the 
infinite retraining loop that the workaround is supposed to break.

 I was only able to verify that the speed clamp is safe to lift with this 
particular device, but if you hit the actual issue with any other device 
and find that it is safe to remove the clamp as well, then you're welcome 
to add it to the list too.

  Maciej
