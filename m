Return-Path: <linuxppc-dev+bounces-14188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91938C5F831
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 23:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7Ws53882z2yvv;
	Sat, 15 Nov 2025 09:24:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763159065;
	cv=none; b=mS5AvKqu+gfHAToaNEkM/an3XYDe/vujaYZiuqjfNiR32WZE749dTaCoLTEQXhLYLsufQt6P4O6F12+hd2Df+dps+qcr8Sb7LikPUEp6gOd1lCWiZksYo+rcFbYfFH+4F8rS5VeBs/y1kj3QHrYPhXM2h1zvXpxbUds8NzBXfPOVMLUxtpQY7waLZy9x7I5jCP/wqwey3ku+9J/a5zbao8wCRBg/p6/XTodHHgMGK5T3poV+wQP1gdqResFYDpK5OHx9AfZm5C22356aDJGtb0J7XA0pcLyGMZ4+SbdOPmEgc58EugZkdW2ZM/wcWzrawRd07nWua9eD39TI6i57/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763159065; c=relaxed/relaxed;
	bh=6HLzMKhLf/71IdRji0VhUNy7UTjGMvg/tnVmZbrZ7JE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kuebhy5cekr9f7M/gpPlZ6hjv+S2zKE0k7xgd6mDM9DVIGsSyZm1uvnPxotgHI6zPKdFBkgr9EjPvMGhzu02wzsDCXJ8gtXu7psCGa+oURcXqCO9TPMoOX8T7LIFXzkqaSMm4da6ZyLm4w39ORPzwrzSqghb8o3P1C1h+iOfmX559Tfe0In6yx5jewPwj9jyjI7s26GTE1RVKeHJNYd14GsEs5mpA/K1x/IzlyUwsw+cbIiFk1SKg5B2XBqTJGifMrG8G3COM6vMdXfmuclA7drae5vW/LxuWFIMyJ7z8Z3tkaXOQiMJKJiTVjwi/VLOnZoFR/LDJ6mABQQjusZvhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tzu9VR/J; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tzu9VR/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7Ws42sWsz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 09:24:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A18B6018A;
	Fri, 14 Nov 2025 22:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E56C113D0;
	Fri, 14 Nov 2025 22:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763159061;
	bh=dUqodLSKCAYIu613ODfUm/kd4gnasWRgxOi7RoF5HOk=;
	h=Date:From:To:Cc:Subject:From;
	b=tzu9VR/JlF6ZzzoKi/lAwlMm58ketqyW8eOvvCWldJ4cHM5UTGGM5PsDJfCovjT9J
	 e4MedY7OZZIvLZj5WICDN72d5NNH84E0FGLs9VxpdBcMBkFS+QEkPRRby5nBPywrxb
	 wDooTL31dM1EfT47Izy06Q7afRH88qUUGj3r45MK060X1kZd5SfakwDzdHg1vVy/0C
	 p6IZDhuap0Fa7pJiASx1Yf4pDa794VO3oqCTA0js3ODQk4Z9J2FOvbtdFfnktfFt00
	 5WTspPdPcZfAm4kjtEZ1jqrZDLBWbXtiSxCasj1yfY5IJARJVf4BRIShcVbnzQ4DsJ
	 xkGsEWFbOWzxg==
Date: Fri, 14 Nov 2025 16:24:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Lukas Wunner <lukas@wunner.de>, hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org,
	mad skateman <madskateman@gmail.com>
Subject: [GIT PULL] PCI fixes for v6.18
Message-ID: <20251114222420.GA2346148@bhelgaas>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-5

for you to fetch changes up to 921b3f59b7b00cd7067ab775b0e0ca4eca436c2f:

  PCI/ASPM: Avoid L0s and L1 on Hi1105 [19e5:1105] Wi-Fi (2025-11-13 06:17:23 -0600)

----------------------------------------------------------------

- Cache the ASPM L0s/L1 Supported bits early so quirks can override them if
  necessary (Bjorn Helgaas)

- Add quirks for PA Semi and Freescale Root Ports and a HiSilicon Wi-Fi
  device that are reported to have broken L0s and L1 (Shawn Lin, Bjorn
  Helgaas)

----------------------------------------------------------------
Bjorn Helgaas (5):
      PCI/ASPM: Cache L0s/L1 Supported so advertised link states can be overridden
      PCI/ASPM: Add pcie_aspm_remove_cap() to override advertised link states
      PCI/ASPM: Convert quirks to override advertised link states
      PCI/ASPM: Avoid L0s and L1 on Freescale [1957:0451] Root Ports
      PCI/ASPM: Avoid L0s and L1 on PA Semi [1959:a002] Root Ports

Shawn Lin (1):
      PCI/ASPM: Avoid L0s and L1 on Hi1105 [19e5:1105] Wi-Fi

 drivers/pci/pci.h       |  2 ++
 drivers/pci/pcie/aspm.c | 25 +++++++++++++++++--------
 drivers/pci/probe.c     |  7 +++++++
 drivers/pci/quirks.c    | 40 +++++++++++++++++++++-------------------
 include/linux/pci.h     |  2 ++
 5 files changed, 49 insertions(+), 27 deletions(-)

