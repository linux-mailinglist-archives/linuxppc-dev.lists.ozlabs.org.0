Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C76733ADE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:29:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqbxAH6I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjW425RwNz3bxB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:29:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqbxAH6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjW360pdYz30fG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:29:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89A6C612AB;
	Fri, 16 Jun 2023 20:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D28CC433C0;
	Fri, 16 Jun 2023 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686947343;
	bh=gvd+AZX4jPfWnZ3uCqLoz9KHdUprTUE9ZWgZSJAJEeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pqbxAH6IMfvevBErMdfzPcFXUr9ietWlKM3lyqdp4aPvp6tq4RWgXVgk+W5QTwneX
	 lqr8Dib4Y8DezbaOcYxo0DAOlWTIFJv6+2epCmW/a/pXxl7GIoo45bpvrHqxNWY53J
	 irIJLGlmwP9G/lkjjdpMAzDaKemBNRb++f+W4xpE+FGy3vln+rtp53lFK7iO60oGuG
	 PLBOLpxnn+poJcE7cIz1Kwt/+CAGwSUrl+zPFN5wE6rq9xRqIPxFXb868VtHKy62dD
	 81lYxVYRzhAJz93dz9AVo1z+WxEFFm0KWEL6f4dS94AkiCBFGeEYU4ltvUEFfjcgVM
	 7MQ6QjOsNzgiQ==
Date: Fri, 16 Jun 2023 15:29:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v9 00/14] pci: Work around ASMedia ASM2824 PCIe link
 training failures
Message-ID: <20230616202900.GA1540115@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2306160431470.64925@angie.orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Oliver O'Halloran <oohall@gmail.com>, Stefan Roese <sr@denx.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jim Wilson <wilson@tuliptree.org>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>, netdev@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 01:27:52PM +0100, Maciej W. Rozycki wrote:
> On Thu, 15 Jun 2023, Bjorn Helgaas wrote:

>  As per my earlier remark:
> 
> > I think making a system halfway-fixed would make little sense, but with
> > the actual fix actually made last as you suggested I think this can be
> > split off, because it'll make no functional change by itself.
> 
> I am not perfectly happy with your rearrangement to fold the !PCI_QUIRKS 
> stub into the change carrying the actual workaround and then have the 
> reset path update with a follow-up change only, but I won't fight over it.  
> It's only one tree revision that will be in this halfway-fixed state and 
> I'll trust your judgement here.

Thanks for raising this.  Here's my thought process:

  12 PCI: Provide stub failed link recovery for device probing and hot plug
  13 PCI: Add failed link recovery for device reset events
  14 PCI: Work around PCIe link training failures

Patch 12 [1] adds calls to pcie_failed_link_retrain(), which does
nothing and returns false.  Functionally, it's a no-op, but the
structure is important later.

Patch 13 [2] claims to request failed link recovery after resets, but
actually doesn't do anything yet because pcie_failed_link_retrain() is
still a no-op, so this was a bit confusing.

Patch 14 [3] implements pcie_failed_link_retrain(), so the recovery
mentioned in 12 and 13 actually happens.  But this patch doesn't add
the call to pcie_failed_link_retrain(), so it's a little bit hard to
connect the dots.

I agree that as I rearranged it, the workaround doesn't apply in all
cases simultaneously.  Maybe not ideal, but maybe not terrible either.
Looking at it again, maybe it would have made more sense to move the
pcie_wait_for_link_delay() change to the last patch along with the
pci_dev_wait() change.  I dunno.

Bjorn

[1] 12 https://lore.kernel.org/r/alpine.DEB.2.21.2306111619570.64925@angie.orcam.me.uk
[2] 13 https://lore.kernel.org/r/alpine.DEB.2.21.2306111631050.64925@angie.orcam.me.uk
[3] 14 https://lore.kernel.org/r/alpine.DEB.2.21.2305310038540.59226@angie.orcam.me.uk
