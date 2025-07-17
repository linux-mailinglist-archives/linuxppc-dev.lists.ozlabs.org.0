Return-Path: <linuxppc-dev+bounces-10312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F47B097B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 01:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjpxn36Kvz3blc;
	Fri, 18 Jul 2025 09:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752794877;
	cv=none; b=T1Tl/YhJ6KeC3kVoM7g4rBkpkneRATfe7G1eQtXtK0Ry04W9BqBFhsEwFPIcvQya4Yl+COPn04vQCtRt6yoVReYnv/4hfT3vXG0sYHGmH3rHY70R2B6BGpnsQZ0smJmkIHDNIse2VMglRFnqFsLQTkGtezopE9k7rl4hAf9FHXOCZPXahdtTiwZYtQYVu1DFi9pKc40pa0Piv8pVhk3rC/wYXsO/oLj/zyzbj1XfMFEEWaW9FH53DswptnaKlvNr3VGy1VGEgfXbNL6JMCbD0J2zutedYsiXDvzaKTqcnQpRKBP51pP99/6sNyaUXtHMC9fgJjSA0uvz6F1DCxfyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752794877; c=relaxed/relaxed;
	bh=jD2GCqVfAzkzSf64DdS0kVT5eFdf2rcyBvLpbrqC3/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l6HhkfRNvJgUYdtY0PPl4auzJPnIoZYxZ3F1Di2I3refTK8j2Kba4XZUHAUt8SaAJ7FMR4rswa0lANG/mHNxuPpRppcsmbq5d+7Bej0aVaryO7VQYDlPlTPW6wtddkpwvcyJhDPr3HOzZBjDnVyT+9slpP7O8106Fcj+cjEMU3Qt6RmNlnpqfK7M0U21bZXO09QWGgcQAxxYla6HKX5PgpPQe6gFqMQi5l6MVBpYMQI2DaUfV03R8EtcANTa/jgLHqNCNwyr/YqodDzFTA5JhWZ5GfHC7+coDOrImuVa5ord3cosWi2IG43uSWLr+xek+UHeGSJFUEghikf41MMtSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fV2uaaF/; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fV2uaaF/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjpxm658pz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 09:27:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F7B7A579FA;
	Thu, 17 Jul 2025 23:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F58C4CEE3;
	Thu, 17 Jul 2025 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794873;
	bh=gUcGYfzCeZmmt4ywQvW8HSqnd9GF3VugZdhGeqSei0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fV2uaaF/rmEO416KIQxD5hyt4Fpd5Gs637LHx6NBRs3u/MLMNgzUOu+oi1uUwfnh3
	 zTlJg5y/DoOjQor8B7wM3pSYR8nL458QpLQBtFNzJ2PdZKpsQvpv6RBPMu4S4I2WwB
	 d56VzB7Uzs0k4wABIO/C3nX8MDwOWQp1rh59mm1NqwbGUtWn4C+hVZDkA2tbSOMbJR
	 TjfPQrGFevj8angJFrC2Tl9hh4ZN3yACVr1SGjJvlaeNe5IEfUSe+f06RgldmYPEDL
	 xrO0gMljRS6LpGm3yiT04Lv4WGx+PLHhWc3bBpC/Dt7iX1TyAgw+jh3Oy8W9swFInt
	 5lnmKj4/ydB7Q==
Date: Thu, 17 Jul 2025 18:27:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 0/6] PowerNV PCIe Hotplug Driver Fixes
Message-ID: <20250717232752.GA2662535@bhelgaas>
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
In-Reply-To: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 04:31:49PM -0500, Timothy Pearson wrote:
> Hello all,
> 
> This series includes several fixes for bugs in the PowerNV PCIe hotplug
> driver that were discovered in testing with a Microsemi Switchtec PM8533
> PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
> PCIe switches that don't correctly implement slot presence detection
> such as the aforementioned one. Without the workaround, the switch works
> and downstream devices can be hot-unplugged, but the devices never come
> back online after being plugged in again until the system is rebooted.
> Other hotplug drivers (like pciehp_hpc) use a similar workaround.
> 
> Also included are fixes for the EEH driver to make it hotplug safe,
> and a small patch to enable all three attention indicator states per
> the PCIe specification.
> 
> Thanks,
> 
> Shawn Anastasio (2):
>   PCI: pnv_php: Properly clean up allocated IRQs on unplug
>   PCI: pnv_php: Work around switches with broken presence detection
> 
> Timothy Pearson (4):
>   powerpc/eeh: Export eeh_unfreeze_pe()
>   powerpc/eeh: Make EEH driver device hotplug safe
>   PCI: pnv_php: Fix surprise plug detection and recovery
>   PCI: pnv_php: Enable third attention indicator state
> 
>  arch/powerpc/kernel/eeh.c         |   1 +
>  arch/powerpc/kernel/eeh_driver.c  |  48 ++++--
>  arch/powerpc/kernel/eeh_pe.c      |  10 +-
>  arch/powerpc/kernel/pci-hotplug.c |   3 +
>  drivers/pci/hotplug/pnv_php.c     | 244 +++++++++++++++++++++++++++---
>  5 files changed, 263 insertions(+), 43 deletions(-)

I'm OK with this from a PCI perspective, and I optimistically put it
on pci/hotplug.

I'm happy to merge via the PCI tree, but would need acks from the
powerpc folks for the arch/powerpc parts.

Alternatively it could be merged via powerpc with my ack on the
drivers/pci patches:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

If you do merge via powerpc, I made some comment formatting and commit
log tweaks that I would like reflected in the drivers/pci part.  These
are on
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=hotplug

Bjorn

