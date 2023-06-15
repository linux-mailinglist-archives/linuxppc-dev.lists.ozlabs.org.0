Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C32F732152
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:07:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BODNwPZa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhvxy2MPWz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 07:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BODNwPZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhvtb2vd2z3bXf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 07:04:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCDB96233D;
	Thu, 15 Jun 2023 18:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB540C433C0;
	Thu, 15 Jun 2023 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686854276;
	bh=GrZU4Bzfm1Xqzo5EgU4CnnNwyScGSBZsQwfpSFcUTy4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BODNwPZatG3b2JqhSWG5D/9wG7DxCwcU0n+OVYJJsEK8PJtcktivpxxL/Ml2BRlgr
	 AsmVfkubwqS1mWQi6oj5pwJFFfffaG2LN8l4gjYmn8D3F6/64Vz2nmwAfm/xpcWrKz
	 AI+zE2z1Ze9jLJ8o1OkjbkXOCTr7nu4ALkWKZBTRBuxvU2XmCxtJtSdU3CYXREzKcr
	 usrwH7iDCLZiPtl7TnZKHoKfA7qMDvSSyhqA6EjiV1ayFEvty4vb2Amh7S/WzbZ+vD
	 UJBUnhU2ZYt1DFC1JnGNmAdFb8cNNG9wr+5Tin6sZhpKNdwR3ocy9vj/ANs6CxYGL+
	 BeCL+54TSTW9Q==
Date: Thu, 15 Jun 2023 13:37:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v9 00/14] pci: Work around ASMedia ASM2824 PCIe link
 training failures
Message-ID: <20230615183754.GA1483387@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2306150124010.64925@angie.orcam.me.uk>
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

On Thu, Jun 15, 2023 at 01:41:10AM +0100, Maciej W. Rozycki wrote:
> On Wed, 14 Jun 2023, Bjorn Helgaas wrote:
> 
> > >  This is v9 of the change to work around a PCIe link training phenomenon 
> > > where a pair of devices both capable of operating at a link speed above 
> > > 2.5GT/s seems unable to negotiate the link speed and continues training 
> > > indefinitely with the Link Training bit switching on and off repeatedly 
> > > and the data link layer never reaching the active state.
> > > 
> > >  With several requests addressed and a few extra issues spotted this
> > > version has now grown to 14 patches.  It has been verified for device 
> > > enumeration with and without PCI_QUIRKS enabled, using the same piece of 
> > > RISC-V hardware as previously.  Hot plug or reset events have not been 
> > > verified, as this is difficult if at all feasible with hardware in 
> > > question.

> >  static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
> >  {
> > -	bool retrain = true;
> >  	int delay = 1;
> > +	bool retrain = false;
> > +	struct pci_dev *bridge;
> > +
> > +	if (pci_is_pcie(dev)) {
> > +		retrain = true;
> > +		bridge = pci_upstream_bridge(dev);
> > +	}
> 
>  If doing it this way, which I actually like, I think it would be a little 
> bit better performance- and style-wise if this was written as:
> 
> 	if (pci_is_pcie(dev)) {
> 		bridge = pci_upstream_bridge(dev);
> 		retrain = !!bridge;
> 	}
> 
> (or "retrain = bridge != NULL" if you prefer this style), and then we 
> don't have to repeatedly check two variables iff (pcie && !bridge) in the 
> loop below:

Done, thanks, I do like that better.  I did:

  bridge = pci_upstream_bridge(dev);
  if (bridge)
    retrain = true;

because it seems like it flows more naturally when reading.

Bjorn
