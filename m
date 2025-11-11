Return-Path: <linuxppc-dev+bounces-14109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEFC4F333
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 18:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Y3Q0Xp6z2yvP;
	Wed, 12 Nov 2025 04:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762881089;
	cv=none; b=Nziag2CafkyFUJzy4x3+RRXmQ1HVzoWTwVbUKA7H7lkVhMvvh2gYKk49KpCi8xSc9QEBeRnYJl9mDoysWhdBnONOToATB+uxDLFCjZxRygyYBkys9L6HWL8+i+Evpso44XsOWDGWqRJ4kcbtXwUmmpVaaKPOsksLhh4l+g17GMBK+6yL/NW4Zo8jZFwDZX533PNQr82uT8f2EeBy0PTlmtbGXZLTIbB75UjQ6VMv/uNxOgccvu5cUxOAU39iA/R74Ovfe4GKh5auaLG1/fnoPKarHeSZ13wVuYKyvNuvyCZXumjYVbkCWl4esQKILrnbkria/g/w6koq/V7T2Kp0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762881089; c=relaxed/relaxed;
	bh=v69xbAQFNaKXgVLG4nfPvI54aYiZnggETMJHigWWYHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dEfMlqeTvuSK7hdttGt4q0bsJrwk0YIhnTu1MhkNjnjthahAsn7RHdeb4+UwaCkKB3jvK0qQA0B0E2wPsyK4TOnxpKldRSq9Ay0A0F0ROjYAuE4VQS0XOhoQQ2s5YB99PlTrnKcCVQDedmQIFBMh4qfU9nOuZ6rjtzSRca3PGRjpGPnHwGsuywoON9EAnZw2qc3Tkc9Ld02xEXAjKSJsCG7+/1CjEWOYRlm+VHLNHPcI7EyWEdev6WEH5of2w85RfAHlRzEl/CKI/r98UdwiYQrpc/pWK3oK2Y43aNtfOIQLKafF6aKAXdIyqb3A2GrWB3F/g6TmJhIEaNiuhsz+4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VMrrB04H; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VMrrB04H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Y3P05Kpz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 04:11:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A99AC40556;
	Tue, 11 Nov 2025 17:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4CDC4CEF5;
	Tue, 11 Nov 2025 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762881086;
	bh=hcx3kqxeym77bbJLLtwlcnxx3jS2uIEgaTgsEvo3Xus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VMrrB04HC6Rbdk8JBTtD67Kap0a4hAl3f71LUuqQHq9oNd9HQM/ghjkXs2HHhoAoV
	 NspHrhdvzdikKHLg03zzpy1TNfOiKnwYElpfYbkprM77UPcL4XzLld+1oFpEF8bMXG
	 wamXHjUTaMHFzLv1BjBQfvE2D230bwdPaP8PDXHQVLpUk8e7yaEbVwFQMqJL1NTP70
	 l/TAtGPfwYb3j0TUUfd1BkC+dieQc91z9maVC+QHyAjnmYS5xaSo+c8FYumLgWbsbJ
	 S6dgV/VMceHXgQ5wG/q+hgYBdzZqXu7t7fhzjtg7vPhkQ43erzX6t3XMnTjbwaVVFy
	 oWgTD+js+ojiQ==
Date: Tue, 11 Nov 2025 11:11:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 0/4] PCI/ASPM: Allow quirks to avoid L0s and L1
Message-ID: <20251111171125.GA2190513@bhelgaas>
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
In-Reply-To: <20251110222929.2140564-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 04:22:24PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
> L0s, L1, and (if advertised) L1 PM Substates.
> 
> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> (v6.18-rc3) backed off and omitted Clock PM and L1 Substates because we
> don't have good infrastructure to discover CLKREQ# support, and L1
> Substates may require device-specific configuration.
> 
> L0s and L1 are generically discoverable and should not require
> device-specific support, but some devices advertise them even though they
> don't work correctly.  This series is a way to add quirks avoid L0s and L1
> in this case.
> 
> 
> Bjorn Helgaas (4):
>   PCI/ASPM: Cache L0s/L1 Supported so advertised link states can be
>     overridden
>   PCI/ASPM: Add pcie_aspm_remove_cap() to override advertised link
>     states
>   PCI/ASPM: Convert quirks to override advertised link states
>   PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
> 
>  drivers/pci/pci.h       |  2 ++
>  drivers/pci/pcie/aspm.c | 25 +++++++++++++++++--------
>  drivers/pci/probe.c     |  7 +++++++
>  drivers/pci/quirks.c    | 38 +++++++++++++++++++-------------------
>  include/linux/pci.h     |  2 ++
>  5 files changed, 47 insertions(+), 27 deletions(-)

Applied to pci/for-linus, hoping for v6.18.  Thanks Shawn and Lukas
for testing and reviewing.  Any other comments and testing would be
very welcome.

I think we'll need to add a similar quirk for Christian's X1000
(https://lore.kernel.org/r/a41d2ca1-fcd9-c416-b111-a958e92e94bf@xenosoft.de),
but I don't know the device ID for it yet.

> -- 
> 
> v1: https://lore.kernel.org/r/20251106183643.1963801-1-helgaas@kernel.org
> 
> Changes between v1 and v2:
> - Cache just the two bits for L0s and L1 support, not the entire Link
>   Capabilities (Lukas)
> - Add pcie_aspm_remove_cap() to override the ASPM Support bits in Link
>   Capabilities (Lukas)
> - Convert existing quirks to use pcie_aspm_remove_cap() instead of
>   pci_disable_link_state(), and from FINAL to HEADER (Mani)

