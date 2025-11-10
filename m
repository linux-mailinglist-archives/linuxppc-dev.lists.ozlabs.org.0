Return-Path: <linuxppc-dev+bounces-14017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35626C498F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 23:29:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d549C3J9lz2yvB;
	Tue, 11 Nov 2025 09:29:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762813791;
	cv=none; b=LLV8b8xgLK2iY4C/v2NJfAdnO+ys3q9kXJR5cDsA78u9LVCKYbw1unPxkv10J8pDXM6/Sl1Jxy6jy2H2s0M9B/zTHQVLiOWWd7d3lRqXfCBQ5C+DbgF8JwlMJYwwlRD7TCXE/T+lxduG0UUnjaTNWRf8+220uRKtEW8oDFRtVQg7tGDswKOVyl+7Hj3sHc2txWm4ca1SrB49mO8OrVgG8CvivYiZUMvynFtnkBNoAQbPnZw5nSqEgktaBivUy1QtzNtCgbd3AspsJeJfpK/J2SlS1FtQPkfhM3J03AfcREFwT6xVqcJuhx/9wRYdg9ox+aKqAYJVhHBLShaP8PWwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762813791; c=relaxed/relaxed;
	bh=Jm0vMdYlCL/ewUjUPkF1P8+QteSFggrjj7SihvrtqlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsUnZk1HpZzbWJZPPJckcX2Iq90sBfrbVNbg8zRcNSEPRsHgeKmxaVVxMXL38iJRGt1PZA74yValgKkZBYS/MYZoR9yuST+1FGKflNqtpD2QkY0o7jUFX3nGuV/X16ChqzTOp5dzYZTjxohQRQefpbGtByl3O8HiRIbRLvAJQTn+XAqukKYB1ZZFSsxI0eQXUaDOP64VxvCM12qNKbHFvxsYIJWUhw8DASMpLXFKtqRPC8DhnEUWQOkNsuLyLBkx0bFtmjKYBjmP2bN6dM6k8/vE05klYrLwgbu9CHfu5lNBsIhtstdiUhnW7Nq9pbTbwh0lCxOwc+A1+fTCK7pDWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pSH/qDu3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pSH/qDu3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d549B4Bxwz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 09:29:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 789A4601EB;
	Mon, 10 Nov 2025 22:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E40FC19423;
	Mon, 10 Nov 2025 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762813788;
	bh=WqBmW56nEto4UkhSZTHwBsWNvqFedV083kEiNxjS+bU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pSH/qDu3I+WPGt8EIT8/xSvN4JCrzgGTbMVQKq5Rw6TTf1XxdV+laSUjFMCrZDLwO
	 iMuR+S1OXSZOUTHtZ4huQD42ZzR+0ct3iKWsIUPtwgd6Afblq+2pFWPo86I2g+ghGT
	 htoo4KtejYV+UthOuk0uWENhzgFnlkwD+w4pvDAKcx7K7yZD9cIVX+iFZ9WSb983ON
	 gvxu2G5MnUHvzTo+RhXuMns64NMvHukjneoMDXmqaN6X4qagON3Tu2AXA8VxM6m8ZR
	 ++8hkZwDOHDaNk1mvDW2StaTbVnkGXF8leKwg0sYvweG2RW6Z/Lc1oIzyrllPg5Oqm
	 pGbe7LF9aj3eA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>,
	Al <al@datazap.net>,
	Roland <rol7and@gmx.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 1/4] PCI/ASPM: Cache L0s/L1 Supported so advertised link states can be overridden
Date: Mon, 10 Nov 2025 16:22:25 -0600
Message-ID: <20251110222929.2140564-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110222929.2140564-1-helgaas@kernel.org>
References: <20251110222929.2140564-1-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Defective devices sometimes advertise support for ASPM L0s or L1 states
even if they don't work correctly.

Cache the L0s Supported and L1 Supported bits early in enumeration so
HEADER quirks can override the ASPM states advertised in Link Capabilities
before pcie_aspm_cap_init() enables ASPM.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aspm.c | 12 ++++--------
 drivers/pci/probe.c     |  7 +++++++
 include/linux/pci.h     |  2 ++
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 7cc8281e7011..15d50c089070 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -830,7 +830,6 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
 static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
-	u32 parent_lnkcap, child_lnkcap;
 	u16 parent_lnkctl, child_lnkctl;
 	struct pci_bus *linkbus = parent->subordinate;
 
@@ -845,9 +844,8 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * If ASPM not supported, don't mess with the clocks and link,
 	 * bail out now.
 	 */
-	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
-	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
-	if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
+	if (!(parent->aspm_l0s_support && child->aspm_l0s_support) &&
+	    !(parent->aspm_l1_support && child->aspm_l1_support))
 		return;
 
 	/* Configure common clock before checking latencies */
@@ -859,8 +857,6 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * read-only Link Capabilities may change depending on common clock
 	 * configuration (PCIe r5.0, sec 7.5.3.6).
 	 */
-	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
-	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
 	pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 
@@ -880,7 +876,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * given link unless components on both sides of the link each
 	 * support L0s.
 	 */
-	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
+	if (parent->aspm_l0s_support && child->aspm_l0s_support)
 		link->aspm_support |= PCIE_LINK_STATE_L0S;
 
 	if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
@@ -889,7 +885,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		link->aspm_enabled |= PCIE_LINK_STATE_L0S_DW;
 
 	/* Setup L1 state */
-	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
+	if (parent->aspm_l1_support && child->aspm_l1_support)
 		link->aspm_support |= PCIE_LINK_STATE_L1;
 
 	if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c83e75a0ec12..de72ceaea285 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1663,6 +1663,13 @@ void set_pcie_port_type(struct pci_dev *pdev)
 	if (reg32 & PCI_EXP_LNKCAP_DLLLARC)
 		pdev->link_active_reporting = 1;
 
+#ifdef CONFIG_PCIEASPM
+	if (reg32 & PCI_EXP_LNKCAP_ASPM_L0S)
+		pdev->aspm_l0s_support = 1;
+	if (reg32 & PCI_EXP_LNKCAP_ASPM_L1)
+		pdev->aspm_l1_support = 1;
+#endif
+
 	parent = pci_upstream_bridge(pdev);
 	if (!parent)
 		return;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e..bf97d49c23cf 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -412,6 +412,8 @@ struct pci_dev {
 	u16		l1ss;		/* L1SS Capability pointer */
 #ifdef CONFIG_PCIEASPM
 	struct pcie_link_state	*link_state;	/* ASPM link state */
+	unsigned int	aspm_l0s_support:1;	/* ASPM L0s support */
+	unsigned int	aspm_l1_support:1;	/* ASPM L1 support */
 	unsigned int	ltr_path:1;	/* Latency Tolerance Reporting
 					   supported from root to here */
 #endif
-- 
2.43.0


