Return-Path: <linuxppc-dev+bounces-13898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC959C3D153
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 19:37:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2WBH2ztCz3bs7;
	Fri,  7 Nov 2025 05:36:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762454215;
	cv=none; b=flmr4Z70QMsiSg4hk1LVAw9l3SQis9M86gu4cU0S1IGPcUTzqsBb+mDgYMd0UFH2rqWpp5+3UC5SxJJ2XTILgyyqrEm/7WQziH/PnCgP+9Zvh8zCuCmzwhXraO+diMf+oyPMffLClRDH1RO3HhzJIDKU0R6lsfRLPdtgoznLWTybUeEO9DjV8Qe/C1z+ZlW2qnXD238aNZEzy2uF4ujmlpSnEAj9prjTmkfJ2lfMxQ2wiADSqRNXza9x1OVxRYYmchlddYi933m8qzalSHUtT5f3auK2kcrXuK6XXR9sJK/0I0Yvua9OZSytUnCt43//8ph6A7urQTv8wuHD17/Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762454215; c=relaxed/relaxed;
	bh=t1giM3IfzNSByR50gLF9r2QTGBe29er7AZhld5vGiC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3YGA7fJt3pveGv23X2Yaaj2TOcK18FVj7YhnzRI2vP32KVDAn3Gr/fkvsiknKqY/I3Gqk66g2UwBEJJEUJugDTGwKxxUjeRHe1PhCwmDZpW0LDzZeq7tlyyrE6PJSVgVdVuY/oDDdTQQCW2lzmQshCP5U8DPyMc9la0HmvkyxSFcqJ/oNZ+psY/RbtDl4hFOmHv9iW1ZGnfs5KXclZGpgEGfekWRlzPXOXgz2Oji93XkGUvEdE2ItqLmWfn0zXKjzVXZiVDqfw0OmhAZpG/jbwZLwrd0RUJpFGXo5q043qA3cf3A6ELKHueBS2RXPpu8dE4Le4GNA1MRDHma/6YiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlLRgdsP; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlLRgdsP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2WBG3ckVz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 05:36:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 555E5618F6;
	Thu,  6 Nov 2025 18:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1DDC16AAE;
	Thu,  6 Nov 2025 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762454212;
	bh=2Cc8x0MTOrIRU3jKRRfaZH/Bk7l6V/9O0wns+z+sth8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hlLRgdsPtYwxbIpiQT6oNQY3K5ClZN/VZzDOfOl2peGFQcX7jS45JoVwLl2qlez29
	 vSQXevpveS+evrnr4g8JQOsij8NWAHJUTiMVmHiM794y8pCyFvuR/yZiKfHugjMEms
	 xSCRUu9Wfs+uYi3Zg+Gdg66qHB1Alf5gozRxr6umLGZJdJPjx/vQ59QENSYD9BIsEw
	 sIvbUeQqLOsvwK6sH+QCERUX5ytsonL6TOQK0FpyIpIfMKJNvONUHhxqFkY/v1P5Ep
	 j6UpIgC6gPbjjP33kY2C1aIY5/RcOMUN7lyI/BJViM+Hr/N8BjCODTyHBE9wLze1Xn
	 pLcTMvxpg3GBA==
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
Subject: [PATCH 1/2] PCI/ASPM: Cache Link Capabilities so quirks can override them
Date: Thu,  6 Nov 2025 12:36:38 -0600
Message-ID: <20251106183643.1963801-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106183643.1963801-1-helgaas@kernel.org>
References: <20251106183643.1963801-1-helgaas@kernel.org>
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

Cache the PCIe Link Capabilities register in struct pci_dev so quirks can
remove features to avoid hardware defects.  The idea is:

  - set_pcie_port_type() reads PCIe Link Capabilities and caches it in
    dev->lnkcap

  - HEADER quirks can update the cached dev->lnkcap to remove advertised
    features that don't work correctly

  - pcie_aspm_cap_init() relies on dev->lnkcap and ignores any features not
    advertised there

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++---------------------
 drivers/pci/probe.c     |  5 ++---
 include/linux/pci.h     |  1 +
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 7cc8281e7011..07536891f1f6 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -391,15 +391,13 @@ static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
 static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	int capable = 1, enabled = 1;
-	u32 reg32;
 	u16 reg16;
 	struct pci_dev *child;
 	struct pci_bus *linkbus = link->pdev->subordinate;
 
 	/* All functions should have the same cap and state, take the worst */
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
-		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &reg32);
-		if (!(reg32 & PCI_EXP_LNKCAP_CLKPM)) {
+		if (!(child->lnkcap & PCI_EXP_LNKCAP_CLKPM)) {
 			capable = 0;
 			enabled = 0;
 			break;
@@ -581,7 +579,7 @@ static void encode_l12_threshold(u32 threshold_us, u32 *scale, u32 *value)
 
 static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 {
-	u32 latency, encoding, lnkcap_up, lnkcap_dw;
+	u32 latency, encoding;
 	u32 l1_switch_latency = 0, latency_up_l0s;
 	u32 latency_up_l1, latency_dw_l0s, latency_dw_l1;
 	u32 acceptable_l0s, acceptable_l1;
@@ -606,14 +604,10 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		struct pci_dev *dev = pci_function_0(link->pdev->subordinate);
 
 		/* Read direction exit latencies */
-		pcie_capability_read_dword(link->pdev, PCI_EXP_LNKCAP,
-					   &lnkcap_up);
-		pcie_capability_read_dword(dev, PCI_EXP_LNKCAP,
-					   &lnkcap_dw);
-		latency_up_l0s = calc_l0s_latency(lnkcap_up);
-		latency_up_l1 = calc_l1_latency(lnkcap_up);
-		latency_dw_l0s = calc_l0s_latency(lnkcap_dw);
-		latency_dw_l1 = calc_l1_latency(lnkcap_dw);
+		latency_up_l0s = calc_l0s_latency(link->pdev->lnkcap);
+		latency_up_l1 = calc_l1_latency(link->pdev->lnkcap);
+		latency_dw_l0s = calc_l0s_latency(dev->lnkcap);
+		latency_dw_l1 = calc_l1_latency(dev->lnkcap);
 
 		/* Check upstream direction L0s latency */
 		if ((link->aspm_capable & PCIE_LINK_STATE_L0S_UP) &&
@@ -830,7 +824,7 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
 static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
-	u32 parent_lnkcap, child_lnkcap;
+	u32 lnkcap;
 	u16 parent_lnkctl, child_lnkctl;
 	struct pci_bus *linkbus = parent->subordinate;
 
@@ -845,9 +839,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * If ASPM not supported, don't mess with the clocks and link,
 	 * bail out now.
 	 */
-	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
-	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
-	if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
+	if (!(parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPMS))
 		return;
 
 	/* Configure common clock before checking latencies */
@@ -857,10 +849,18 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * Re-read upstream/downstream components' register state after
 	 * clock configuration.  L0s & L1 exit latencies in the otherwise
 	 * read-only Link Capabilities may change depending on common clock
-	 * configuration (PCIe r5.0, sec 7.5.3.6).
+	 * configuration (PCIe r5.0, sec 7.5.3.6).  Update only the exit
+	 * latencies in the cached dev->lnkcap because quirks may have
+	 * removed broken features advertised by the device.
 	 */
-	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
-	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
+	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &lnkcap);
+	parent->lnkcap &= ~(PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
+	parent->lnkcap |= lnkcap & (PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
+
+	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &lnkcap);
+	child->lnkcap &= ~(PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
+	child->lnkcap |= lnkcap & (PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
+
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
 	pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 
@@ -880,7 +880,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * given link unless components on both sides of the link each
 	 * support L0s.
 	 */
-	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
+	if (parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
 		link->aspm_support |= PCIE_LINK_STATE_L0S;
 
 	if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
@@ -889,7 +889,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		link->aspm_enabled |= PCIE_LINK_STATE_L0S_DW;
 
 	/* Setup L1 state */
-	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
+	if (parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
 		link->aspm_support |= PCIE_LINK_STATE_L1;
 
 	if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c83e75a0ec12..db4635b1ec47 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1640,7 +1640,6 @@ void set_pcie_port_type(struct pci_dev *pdev)
 {
 	int pos;
 	u16 reg16;
-	u32 reg32;
 	int type;
 	struct pci_dev *parent;
 
@@ -1659,8 +1658,8 @@ void set_pcie_port_type(struct pci_dev *pdev)
 	pci_read_config_dword(pdev, pos + PCI_EXP_DEVCAP, &pdev->devcap);
 	pdev->pcie_mpss = FIELD_GET(PCI_EXP_DEVCAP_PAYLOAD, pdev->devcap);
 
-	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &reg32);
-	if (reg32 & PCI_EXP_LNKCAP_DLLLARC)
+	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &pdev->lnkcap);
+	if (pdev->lnkcap & PCI_EXP_LNKCAP_DLLLARC)
 		pdev->link_active_reporting = 1;
 
 	parent = pci_upstream_bridge(pdev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e..ec4133ae9cae 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -361,6 +361,7 @@ struct pci_dev {
 	struct pci_dev  *rcec;          /* Associated RCEC device */
 #endif
 	u32		devcap;		/* PCIe Device Capabilities */
+	u32		lnkcap;		/* PCIe Link Capabilities */
 	u16		rebar_cap;	/* Resizable BAR capability offset */
 	u8		pcie_cap;	/* PCIe capability offset */
 	u8		msi_cap;	/* MSI capability offset */
-- 
2.43.0


