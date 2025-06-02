Return-Path: <linuxppc-dev+bounces-9085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71062ACBCA1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 23:13:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB65p5tFcz2yPd;
	Tue,  3 Jun 2025 07:13:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748898830;
	cv=none; b=HZJNhX4VC61fr8P9YwRPWJehDHM7kZyJoqn1t70Ynhr+maI8IT6pWLoWtaaLwmcbKdUVkp2PykCc1w2bkyHC2ZZDXqVBzn/99wVHpvt1ArLRkuiYKl53i7/NaYoy528D/UlPkbf0oZ1ELwt50jQe2Axnie5N5Zx5jxUPwhXorBTzIVkZyWb3miNropZodpaAu6v2CHX9jaMctlHx0C4e+PNSBEjJVwUC8bzw0GauxDVaU1MrZKix4Oxv5mnl+U4PQdTFv9XfeuU94M6Dt7k2mIVMgJaJws0suyNhf7YzpYYUiNOQ/yOqBEgrOLfQvKPpqdqFCOA3IKGi4MdfNqpp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748898830; c=relaxed/relaxed;
	bh=ylW5pd2rNSERfK/w7aOq8aBRFE3+e0lGe7my8Nim8+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KxCdwqa71ivlomgPlWyH7Gvv8o/l/xWlnLefUy5UsawFJyXDgd1HYU3qt88oBTOVk7KDflTPerNBqcXsQtwy9F8FnCCCUAQmTjybuq8/hLM7jTw6vY193tPv8uLnyASdVmzoSPyOiwgZdNXPoLj0EdcSKlUVyUIO25IsSBuV7Mx8v9Nsk44bqPtETnkvcdWNdWCe3bzw0cFKZiH1THKa8sLQQfHqTHc0+TidZKhHM/noP8yP9ZOtVNoswIGrMvQIHuV7eCvDCpapCCDodKUQe55VctLe0UD5Wwonsi6dw0sLCsuhVtUBU4spOfmeYvZ1onJ5/9zE4CadU0jigTVy+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m4m/SaHE; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m4m/SaHE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bB65n5HH2z2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 07:13:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8E105C63A4;
	Mon,  2 Jun 2025 21:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39042C4CEEB;
	Mon,  2 Jun 2025 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748898826;
	bh=8USxg6SA8nGz3BAkEuYuS+4+eTJ3BHPZ/Z14aMgD5Vo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m4m/SaHE8iFG6uTm85JTtjtTJIE+XALUYhiJDLcsNKo6erXpfFaE2eoftIUOtZb2i
	 2kGm4VUL7Ua/7F6a5U5aUqNink/ou4zhQ4Or1Zu7AYGVnh/ZWeSI0pyfMn30WRcQ31
	 EE7y5jSxfu0sLgGiQqM9pTqNQCecm9dKrsuKXEXhC3Td41Cj2aNiNv4pF6GrK5lFa1
	 EfDIsfRClEIUokRxgztxTyzmeHqtr5VVVhoTie87u7ngMqCcxERT0Ht1Aso+2l0gf8
	 q5ypX9vO9UXttxSnq3oiYxYVfj8lsLtaHE1ephK+mkINFt6bB+xtQFBwk5k3E3s4sO
	 ZFsT1JqbxJN6A==
Date: Mon, 2 Jun 2025 16:13:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250602211344.GA444082@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > > > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > > > cannot be done in a generic way as link recovery procedure is specific to
> > > > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > > > called by the host bridge drivers when the link goes down.
> > > > > 
> > > > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > > > execution of the AER Fatal error handling code. Since the link down
> > > > > recovery is pretty much the same as AER Fatal error handling,
> > > > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > > > callback will be triggered for the bridge and the downstream devices. Then,
> > > > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > > indicating successful link recovery.
> > > > 
> > > > Link down is an event for a single Root Port.  Why would we iterate
> > > > through all the Root Ports if the link went down for one of them?
> > > 
> > > Because on the reference platform (Qcom), link down notification is
> > > not per-port, but per controller. So that's why we are iterating
> > > through all ports.  The callback is supposed to identify the ports
> > > that triggered the link down event and recover them.
> > 
> > Maybe I'm missing something.  Which callback identifies the port(s)
> > that triggered the link down event?
> 
> I was referring to the host_bridge::reset_root_port() callback that resets the
> root ports.
> 
> >  I see that
> > pci_host_handle_link_down() is called by
> > rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
> > but I don't see the logic that identifies a particular Root Port.
> > 
> > Per-controller notification of per-port events is a controller
> > deficiency, not something inherent to PCIe.  I don't think we should
> > build common infrastructure that resets all the Root Ports just
> > because one of them had an issue.
> 
> Hmm, fair enough.
> 
> > I think pci_host_handle_link_down() should take a Root Port, not a
> > host bridge, and the controller driver should figure out which port
> > needs to be recovered, or the controller driver can have its own loop
> > to recover all of them if it can't figure out which one needs it.
> 
> This should also work. Feel free to drop the relevant commits for
> v6.16, I can resubmit them (including dw-rockchip after -rc1).

OK, I kept "PCI: host-common: Make the driver as a common library for
host controller drivers" (renamed to "PCI: host-common: Convert to
library for host controller drivers") on pci/controller/dw-rockchip
for v6.16 and deferred the rest until later.

