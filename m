Return-Path: <linuxppc-dev+bounces-13295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E685C07E83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 21:29:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctXyY1g4lz30N8;
	Sat, 25 Oct 2025 06:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761334149;
	cv=none; b=Yb6CBI+3yVme+w/8ZXmTiZfAbN6QVMgBBnEzghoMDD/mz3fjDu2mQbzOKZJCG4AFBDCwA+BgmTXuJWlrrhvwjULi/93AgTmR0Q5rv4Vy6rQHbYD+r9yD5NAybDHwfFO/ZjQk3H/9M4XGJ/Yh6YAgAFqH4AUsDQuDt64HspxklPLjFbNzbPhlmpUcJu8w2bFHSYjX1jJgvh8pg3boaj0lg2gdsXTS4rUMGef5SQ3oJZGQCKaF0Zfuvw5yCy5Q4KTEcMiDYsRHKHAjNt97PtJvTPnoaL5LCWuYs9+plGcsqRPQ/vXQLrcY2RpwOdRJ0BhbZaUClChfMO7ZqnGHZ3JZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761334149; c=relaxed/relaxed;
	bh=Ggn924Jo/a6Uw5L8/KmtY5GySzQfHwM27dKTjuJUgLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0x4iVZJPQXAVZn1IdaY3rUM+ZCg3XA8VLCFct1Cg0aBAm0Ue51BiQAGAk+8zTw5yASUwuZrepypb2P/4PAmxz5QgzFLfq7T5PnkAjt9rP8ls463svat9WbGaEyOveeNXm/3GDt0Z/XuZLjA0Mza+QgrKE1cMAOd8wnD25ZinTKCQMtFh7CaDPih84C0UjQDTomGPrTTEYc8gvdMxGzFXVRmqj63HeMFiFl8K+Ye1SueQ294bzK7g+whjVCR4UrB6gOtBDf+Mgxk2KskfDfMyZimiNb6lXQ2zOWtwpqUJlAKvWsJpI4BpcZAHvs6cxp8KAIR38aYFX07I+de2ARIfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpjzvzA1; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpjzvzA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctXyW62RHz2yk0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 06:29:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCC6A438BD;
	Fri, 24 Oct 2025 19:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919E5C4CEF1;
	Fri, 24 Oct 2025 19:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761334144;
	bh=N5IIqjmOeWmLOz2zHVxqEA+WLcaesU5e/utvVwXoDkA=;
	h=Date:From:To:Cc:Subject:From;
	b=jpjzvzA1haU4EZKYPT016IUISm/tXebW5eU1fIiWnCJpsXoXf1t6Q7nAERG06TFYw
	 2g7TYeXPbCeNxibyuMz1D18FSfzzQilOj2bHhL6ixjwhHqExW4YMWp1kLp9L0RGxCj
	 W5ux/6aSa7HWxGQvM06f3Fv8hA5oOnSoPE8cSq9cCH62RwrWSsSrRVpL3XVVFHY3nz
	 zjZR5SbdW3WYzyAdVdytz1atd1iXpEr38IO7x7R/KgTIEmsidbDZFvQKK+xv8PDbYf
	 bkTo2jj1VHWhpXiDVHGQ7C69rCFGL/QzKvKL1btgFoiS3h1BBQflOm+Mao1p3231nq
	 b8qNc1Jo7v+5A==
Date: Fri, 24 Oct 2025 14:29:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Ron Economos <re@w6rz.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Hovold <johan@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org
Subject: [GIT PULL] PCI fixes for v6.18
Message-ID: <20251024192903.GA1360890@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-3

for you to fetch changes up to df5192d9bb0e38bf831fb93e8026e346aa017ca8:

  PCI/ASPM: Enable only L0s and L1 for devicetree platforms (2025-10-23 20:08:14 -0500)

----------------------------------------------------------------

- Add DWC custom pci_ops for the root bus instead of overwriting the DBI
  base address, which broke drivers that rely on the DBI address for iATU
  programming; fixes an FU740 probe regression (Krishna Chaitanya Chundru)

- Revert qcom ECAM enablement, which is rendered unnecessary by the DWC
  custom pci_ops (Krishna Chaitanya Chundru)

- Fix longstanding MIPS Malta resource registration issues to avoid
  exposing them when the next commit fixes the boot failure (Maciej W.
  Rozycki)

- Use pcibios_align_resource() on MIPS Malta to fix boot failure caused by
  using the generic pci_enable_resources() (Ilpo Järvinen)

- Enable only ASPM L0s and L1, not L1 PM Substates, for devicetree
  platforms because we lack information required to configure L1 Substates;
  fixes regressions on powerpc and rockchip.  A qcom regression (L1
  Substates no longer enabled) remains and will be addressed next (Bjorn
  Helgaas)

----------------------------------------------------------------
Bjorn Helgaas (1):
      PCI/ASPM: Enable only L0s and L1 for devicetree platforms

Ilpo Järvinen (1):
      MIPS: Malta: Use pcibios_align_resource() to block io range

Krishna Chaitanya Chundru (2):
      PCI: dwc: Use custom pci_ops for root bus DBI vs ECAM config access
      Revert "PCI: qcom: Prepare for the DWC ECAM enablement"

Maciej W. Rozycki (2):
      MIPS: Malta: Fix keyboard resource preventing i8042 driver from registering
      MIPS: Malta: Fix PCI southbridge legacy resource reservations

 arch/mips/mti-malta/malta-setup.c                 |  4 +-
 arch/mips/pci/pci-malta.c                         |  3 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 28 ++++++++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 68 -----------------------
 drivers/pci/pcie/aspm.c                           | 34 +++---------
 5 files changed, 36 insertions(+), 101 deletions(-)

