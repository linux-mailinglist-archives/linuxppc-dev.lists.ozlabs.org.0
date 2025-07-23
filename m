Return-Path: <linuxppc-dev+bounces-10379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C789EB0F16C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 13:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnBxK3WC0z3bh0;
	Wed, 23 Jul 2025 21:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753270757;
	cv=none; b=bc7YrHiYMzC7iTTXZirJ4PSTsPn9gwL3GlfHUV6FK6CI5oeYpYmxZOKVgOoJqK8wjjNBuQ1fqYxaaDMcBxtKGiH73ehaikVZNDzn0XgYthiG5yBwd97TBF1+257Ido4hKkDnfg3HwEc50ACqez+DHriRCvDoFLRQ96l+8SBgXq927GbrnEZxuQ6b74/c9kKRV8BLE/evk3+MENNxuBejLHvZM9lQa67pqbwXjqeZwYTeOh+P4kLlA3O8MHUrij7lbAfJ/mVqdYBFbgFPGxCVWv70rxeGryQLLbEgo1G7KEkxzdznNjUm5KC0pPJrh6Ey92DTnVoNo0uuhVAdmmZ4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753270757; c=relaxed/relaxed;
	bh=aglmI+CDRVcMvbOX9jZgzAS7Mi3U/UrHcIFcAhsXjUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Qh/Qs1+dSerNTZWiK4wQ56/MerTT1S+gdM6uk5FycbvB11vkY2yxF0nlgC01AOBHvPk2dyRZ7eoO7WvwCV1DoggyjaBQ3PcUEUYjIaw8szSYV1ZR92I+LkR0bYZHEHa/NKoDsAXmrCICxUkK+NmTiCiN+7Wa2EvIGsOet2MmvhwIq481bU1UrlWxw7wYa6FFXaKNlc0N2Vb5p6jEMYjt34oB0gSx08LtrDzh61NRqPvt2/UpFvKu09PMg7/nXMub0hdfiDj7/myunFnBo3g1K1Idki149XoSD/0SMsVsCQ1Ze727v1fZms//7WAK7IryzV/I37D45Wlapu4lSLqJLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uSSjdR7k; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uSSjdR7k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnBxJ4R9nz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 21:39:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68B9A6000A;
	Wed, 23 Jul 2025 11:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD506C4CEE7;
	Wed, 23 Jul 2025 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753270754;
	bh=m8FyO70WVcGbmv2de5R4u32YsJtbHj03aCoX4C4Jg/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uSSjdR7kJvBQ88qLPTtylG1pXPiir85MEGShW3/iE9k1mkMJuSiULLVwfPvIIiXIO
	 UGCmjn0WEmcO1hcC8YF7rLkrKv+CK7iLaPwGOJjy8kuvssWOSDpLZD559XfI+Numd2
	 XIYxK7Uos6m8Z7+aoE/HX9he0vFTqrSCond7wuClqsQ1aajh1QzgQScvXnvrcDcJJj
	 yot5nuHNwyLKOrEWZAie1EjPYnD8fw9yAokUorA28zg9bNtGH+MFnrQTsWiEqmglqi
	 LNy6+MMDYG3a4wXFJ9dsN0zx2c767gZsUMM4wksXI1oSDdK0412+30ofinU7B7vLkM
	 ae3QBidKz4DqA==
Date: Wed, 23 Jul 2025 06:39:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v3 0/6] PowerNV PCIe Hotplug Driver Fixes
Message-ID: <20250723113912.GA2880767@bhelgaas>
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
In-Reply-To: <97289b39-ca4b-47ac-af81-c5223932ff63@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 04:30:18PM +0530, Madhavan Srinivasan wrote:
> 
> 
> On 7/23/25 2:17 AM, Bjorn Helgaas wrote:
> > On Thu, Jul 17, 2025 at 06:27:52PM -0500, Bjorn Helgaas wrote:
> >> On Tue, Jul 15, 2025 at 04:31:49PM -0500, Timothy Pearson wrote:
> >>> Hello all,
> >>>
> >>> This series includes several fixes for bugs in the PowerNV PCIe hotplug
> >>> driver that were discovered in testing with a Microsemi Switchtec PM8533
> >>> PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
> >>> PCIe switches that don't correctly implement slot presence detection
> >>> such as the aforementioned one. Without the workaround, the switch works
> >>> and downstream devices can be hot-unplugged, but the devices never come
> >>> back online after being plugged in again until the system is rebooted.
> >>> Other hotplug drivers (like pciehp_hpc) use a similar workaround.
> >>>
> >>> Also included are fixes for the EEH driver to make it hotplug safe,
> >>> and a small patch to enable all three attention indicator states per
> >>> the PCIe specification.
> >>>
> >>> Thanks,
> >>>
> >>> Shawn Anastasio (2):
> >>>   PCI: pnv_php: Properly clean up allocated IRQs on unplug
> >>>   PCI: pnv_php: Work around switches with broken presence detection
> >>>
> >>> Timothy Pearson (4):
> >>>   powerpc/eeh: Export eeh_unfreeze_pe()
> >>>   powerpc/eeh: Make EEH driver device hotplug safe
> >>>   PCI: pnv_php: Fix surprise plug detection and recovery
> >>>   PCI: pnv_php: Enable third attention indicator state
> >>>
> >>>  arch/powerpc/kernel/eeh.c         |   1 +
> >>>  arch/powerpc/kernel/eeh_driver.c  |  48 ++++--
> >>>  arch/powerpc/kernel/eeh_pe.c      |  10 +-
> >>>  arch/powerpc/kernel/pci-hotplug.c |   3 +
> >>>  drivers/pci/hotplug/pnv_php.c     | 244 +++++++++++++++++++++++++++---
> >>>  5 files changed, 263 insertions(+), 43 deletions(-)
> >>
> >> I'm OK with this from a PCI perspective, and I optimistically put it
> >> on pci/hotplug.
> >>
> >> I'm happy to merge via the PCI tree, but would need acks from the
> >> powerpc folks for the arch/powerpc parts.
> >>
> >> Alternatively it could be merged via powerpc with my ack on the
> >> drivers/pci patches:
> >>
> >> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> >>
> >> If you do merge via powerpc, I made some comment formatting and commit
> >> log tweaks that I would like reflected in the drivers/pci part.  These
> >> are on
> >> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=hotplug
> > 
> > Powerpc folks: let me know how you want to handle this.  I haven't
> > included it in pci/next yet because I don't have acks for the
> > arch/powerpc parts.
> 
> Patchset looks fine to be. 
> 
> I am fine to take it via my tree since I already have your Acked-by.

OK, I'll assume this will be merged via your tree.  Please cherry-pick 
the drivers/pci patches from my tree to preserve my tweaks.  I moved
them from pci/hotplug to pci/hotplug-pnv_php:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=hotplug-pnv_php

