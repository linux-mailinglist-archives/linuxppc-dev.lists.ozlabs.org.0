Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B826E850294
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 05:59:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uP/nY3bJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWz6R5k1sz3cND
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 15:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uP/nY3bJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWtP30HKKz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 12:27:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A2676225D;
	Sat, 10 Feb 2024 01:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8D5C433C7;
	Sat, 10 Feb 2024 01:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707528418;
	bh=ZbSoZXx/9HDBf8DsNqbS8trxVTS30KxSnV3BsPNQp3k=;
	h=From:To:Cc:Subject:Date:From;
	b=uP/nY3bJB+/VTamjus0HHPCwu+bMefQIk78SOUwKphz3+gWiLnNZ4DakrWJNSDx2O
	 VTaU1OxpBh4Fd/KtZ/2pjL1q+TKDtJUf8zOpHrKnjwejf9chfYQoZVkUAXZhKzAIfu
	 SDsy166t5sAGJfNCF1XfXPzm5tVktGrse6iCTgqRp5bo3wt8aQePan4sr1nAzLc/uc
	 edCfP+fu0w8DPgThvXuOXR80kthoHTXbhU40CJP3tCwQNP/qI51uex6hw93abDldML
	 HebBcWwW1alYdWU39xT8wSx8JXVAASlK1C5I7HzfBtF8ISK3R54aY/5uWJ0lpqRKAd
	 onWTuotlmiQIQ==
From: Niklas Cassel <cassel@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 0/2] PCI endpoint BAR hardware description cleanup
Date: Sat, 10 Feb 2024 02:26:24 +0100
Message-ID: <20240210012634.600301-1-cassel@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Feb 2024 15:59:08 +1100
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
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The series is based on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=endpoint


Hello all,

This series cleans up the hardware description for PCI endpoint BARs.

The problems with the existing hardware description:
-The documentation is lackluster.
-Some of the names are confusingly similar, e.g. fixed_64bit and
 fixed_size, even though these are for completely unrelated things.
-The way that the BARs are defined in the endpoint controller drivers
 is messy, because the left hand side is not a BAR, so you can mark a
 BAR as e.g. both fixed size and reserved.

This series tries to address all the problems above.

Personally, I think that the code is more readable, both the endpoint
controller drivers, but also pci-epc-core.c.

(Oh, and as you can probably guess, I will be sending out a patch series
that adds BAR_RESIZABLE to enum pci_epc_bar_type in the coming week(s).)


Kind regards,
Niklas


Niklas Cassel (2):
  PCI: endpoint: Clean up hardware description for BARs
  PCI: endpoint: Drop only_64bit on reserved BARs

 drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
 drivers/pci/controller/dwc/pci-keystone.c     | 12 +++---
 .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
 drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    | 10 +++--
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 ++++++--
 drivers/pci/controller/pcie-rcar-ep.c         | 14 ++++---
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++--
 drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
 drivers/pci/endpoint/pci-epc-core.c           | 25 +++++-------
 drivers/pci/endpoint/pci-epf-core.c           | 15 ++++----
 include/linux/pci-epc.h                       | 38 ++++++++++++++++---
 14 files changed, 105 insertions(+), 58 deletions(-)

-- 
2.43.0

