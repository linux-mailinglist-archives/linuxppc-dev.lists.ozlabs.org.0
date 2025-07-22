Return-Path: <linuxppc-dev+bounces-10363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C48B0E512
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 22:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmq7y3B41z2yhb;
	Wed, 23 Jul 2025 06:47:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753217230;
	cv=none; b=B46hp3p61mqIVImzfC1WWQfvnmXjWlui/EOTDp5VZ63ZesB+d6ErIEB1naLk+MYdeex80tz6iNkLeRJOzhMv3PY9SifUJYEyF327Yz98jS/X4G6WiifobhP/hSecgdiqYf+3CM4N0CY9Iuo46fwM/C04seT9w+DbEiL5ghhjWQN8N30QLsiqSVdOb65G7rYZ/P8c0bkbE6bGQTw5hlrrqM4M8llzc5GyRA2QmVXeB5wHQ+hWRuuQHOJFfrsw9ZQsMQNsP8r9rdxli+Kf7goEtV+ZOVtNCmwiNLqQ095l/PyhX+UALLj94l+Sj9qk/2D7UJfqCfloLR2yM7YKnmW0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753217230; c=relaxed/relaxed;
	bh=iu6+kH10SE0HlwJiugoAKUg8HcdkEnhLm/TQ4agqgyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Cv1rPZMhfdoYb0KjGulcIOF3BLpY3Woxw5izs5wAoMDdepsuQkH/0jL8YKkfvIWGm+WlOXoOL9Q1rX2t+YzqBhdb0QGFfg0X9VhEWUiiTP1r/tYq+S4pIcXI4aRttkp/wKKrHtmpexVA+uvdOCAMiNvor+KaiFGwwXoNDU1tpYcinF71NNY/kLjqD92ZDH9hTf/LPlZ5wVj8mlNGq8dGVX3iIvW0crfpLPVyIvNYyx42nCrrl64xcq+LjbdUNoXGCPezOrmc1oBER7Bvkj5iXT6WSyRi9rUJebg8wJ7iDHPGBn4/zvkggHf7Aq9dksKwo1ka+OWj8b96ch9gGaGlXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aO6hZyB7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aO6hZyB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmq7x1kG7z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 06:47:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08556A56408;
	Tue, 22 Jul 2025 20:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88561C4CEEB;
	Tue, 22 Jul 2025 20:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217225;
	bh=/sxFwYUyBdxHVgbNyek2wBg4Uk82NRyFiZxIzDBnIs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aO6hZyB7vN81Un5hba7wW6Ql7I5ci2Z6++fnxK1N+B6uWOg2jTwNX1Uau7rZiYT5e
	 AOcAgtWIFwH7Nz7plV0qxsFzT9sOlR4vz4FaTVau6e1tcQhlZgVhsEYur1Ddxb+2Up
	 i0uRqXQuq1y15hjJ7pQ+4offCfJ6eK6OlyzR/DZUiWo8J7wg9hheEgm24Fvt04kTFu
	 PoAVyzmb6Z4Ue4KyFxdq1k++Fo6uJE4HtCM1XFxyQCWhRClM2tMgz1jJyaSZFAWw32
	 mzbgFKQFD7LWON8AQD9BqQg+KisPWLzKmseMc4c8E+743oZjhhTP8RmpEU/MMmhORD
	 KezzqnP4+4FDg==
Date: Tue, 22 Jul 2025 15:47:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v3 0/6] PowerNV PCIe Hotplug Driver Fixes
Message-ID: <20250722204704.GA2815491@bhelgaas>
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
In-Reply-To: <20250717232752.GA2662535@bhelgaas>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[-> to: Madhavan, Michael, Mahesh; seeking acks]

On Thu, Jul 17, 2025 at 06:27:52PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 15, 2025 at 04:31:49PM -0500, Timothy Pearson wrote:
> > Hello all,
> > 
> > This series includes several fixes for bugs in the PowerNV PCIe hotplug
> > driver that were discovered in testing with a Microsemi Switchtec PM8533
> > PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
> > PCIe switches that don't correctly implement slot presence detection
> > such as the aforementioned one. Without the workaround, the switch works
> > and downstream devices can be hot-unplugged, but the devices never come
> > back online after being plugged in again until the system is rebooted.
> > Other hotplug drivers (like pciehp_hpc) use a similar workaround.
> > 
> > Also included are fixes for the EEH driver to make it hotplug safe,
> > and a small patch to enable all three attention indicator states per
> > the PCIe specification.
> > 
> > Thanks,
> > 
> > Shawn Anastasio (2):
> >   PCI: pnv_php: Properly clean up allocated IRQs on unplug
> >   PCI: pnv_php: Work around switches with broken presence detection
> > 
> > Timothy Pearson (4):
> >   powerpc/eeh: Export eeh_unfreeze_pe()
> >   powerpc/eeh: Make EEH driver device hotplug safe
> >   PCI: pnv_php: Fix surprise plug detection and recovery
> >   PCI: pnv_php: Enable third attention indicator state
> > 
> >  arch/powerpc/kernel/eeh.c         |   1 +
> >  arch/powerpc/kernel/eeh_driver.c  |  48 ++++--
> >  arch/powerpc/kernel/eeh_pe.c      |  10 +-
> >  arch/powerpc/kernel/pci-hotplug.c |   3 +
> >  drivers/pci/hotplug/pnv_php.c     | 244 +++++++++++++++++++++++++++---
> >  5 files changed, 263 insertions(+), 43 deletions(-)
> 
> I'm OK with this from a PCI perspective, and I optimistically put it
> on pci/hotplug.
> 
> I'm happy to merge via the PCI tree, but would need acks from the
> powerpc folks for the arch/powerpc parts.
> 
> Alternatively it could be merged via powerpc with my ack on the
> drivers/pci patches:
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> If you do merge via powerpc, I made some comment formatting and commit
> log tweaks that I would like reflected in the drivers/pci part.  These
> are on
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=hotplug

Powerpc folks: let me know how you want to handle this.  I haven't
included it in pci/next yet because I don't have acks for the
arch/powerpc parts.

Bjorn

