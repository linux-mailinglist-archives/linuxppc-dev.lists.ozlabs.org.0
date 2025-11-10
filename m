Return-Path: <linuxppc-dev+bounces-14018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731CC498FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 23:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d549D613tz2yxk;
	Tue, 11 Nov 2025 09:29:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762813792;
	cv=none; b=kDC7BFI1IoG7ZHNIUDlYUIp84SPEb6VOB73KDub/frumuO1ri2WZ4Cwg/KdGbwg98kVqR05598O8+FIMAQkkRl4HldASe+JoV75YeWYbRjiKu2ZPk5A/TNAnzdlssLe4x1/reYt+iRzMu018YzJSLsQshA9hUfTL76FQq/20c7RDYwn3DwoYtmqOiDrvCO6IQ7Z8nvN03NpjcsgYloADL3ah++HCLCBoHGTUkh3J31SHiogHqcChVRKJ3HfrnRbLGZcX632XDis5yvTXd4FOCj8Ts9brbZdsHAbdh9SBEE7icWkLxw4zRFTJ6KXSaYzLfVcTHHOArPs1f8oEI+ZAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762813792; c=relaxed/relaxed;
	bh=iJZbrDIJOwLTkLDsbW2QWRwWImNPCzM2xk93RC1SlDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrI4dH4804yMxr5ZcGLiSlSD/QC5GIdyI1P2+mx9xBcoLfrkq9MbzQbh/6sitzOJwTwp/1xUAFRwo2+SMxhWHljSCmc3WE3LRAo0wzsGRoDlO+O/bgf2fja4w0qOX1I4KPmNOlTfiYlPbAwzsGbYX/Jt4FvZ8u4x/TwhYYsqrZAQJ8KMLsPO32eOClovwm3HPQYm6HW2tBYpfzAcsmfu3BW4jVp0c2HaL5O36GP0hPBUxJVRxP4GGZybVB0sdHjbgdJ4I87URjVVTXqF6T3yAdLcjAX/znM5rJbv5AE1uxqG/MEiJilV9kMnkruY/fXYb7fuHNh791sF8C3abP+oTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MbHnf06D; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MbHnf06D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d549C6wn8z2yvS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 09:29:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 086B2601FA;
	Mon, 10 Nov 2025 22:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BD4C2BCB6;
	Mon, 10 Nov 2025 22:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762813789;
	bh=+PAn5KKDm+HKMhr0isGB8WG7OccvwXkrZSq0tSNltXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbHnf06DgWCpt3ix50Qh1sy0gaR5wckkgQxhCzMd6X5MdlMwdrONp7pJ1dOIVKddv
	 an9pkrOArjTcMEhCNrVehpAYb0PfEEQyAWO3Weo4ZmvDr45qOfDHfp8YHgMVq/HYni
	 HW/I/iYQbqNBHZ84spFvk7XCc7Xgfz50fp9M7UWf9OrkonzZs4KRuJetzcBMY8WHP0
	 8dBNsTdn+kLOcP2dYv8+z67xQJmVUNRGAyscWpWP4sB9Y4oA8VX8qRRgAvc0F1t3Ox
	 gjpKxshKstOcMbsQwt4I2Cjp6iW3HkuQ4kCYqwfebRcCcLAWLCBfnotL3ZjItnLAk3
	 FTAbN66U/xxmA==
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
Subject: [PATCH v2 2/4] PCI/ASPM: Add pcie_aspm_remove_cap() to override advertised link states
Date: Mon, 10 Nov 2025 16:22:26 -0600
Message-ID: <20251110222929.2140564-3-helgaas@kernel.org>
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

Add pcie_aspm_remove_cap().  A quirk can use this to prevent use of ASPM
L0s or L1 link states, even if the device advertised support for them.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h       |  2 ++
 drivers/pci/pcie/aspm.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4492b809094b..36f8c0985430 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -958,6 +958,7 @@ void pci_save_aspm_l1ss_state(struct pci_dev *dev);
 void pci_restore_aspm_l1ss_state(struct pci_dev *dev);
 
 #ifdef CONFIG_PCIEASPM
+void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap);
 void pcie_aspm_init_link_state(struct pci_dev *pdev);
 void pcie_aspm_exit_link_state(struct pci_dev *pdev);
 void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
@@ -965,6 +966,7 @@ void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
 void pci_configure_ltr(struct pci_dev *pdev);
 void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
 #else
+static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
 static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
 static inline void pcie_aspm_exit_link_state(struct pci_dev *pdev) { }
 static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked) { }
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 15d50c089070..bc3cb8bc7018 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1542,6 +1542,19 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 }
 EXPORT_SYMBOL(pci_enable_link_state_locked);
 
+void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
+{
+	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
+		pdev->aspm_l0s_support = 0;
+	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
+		pdev->aspm_l1_support = 0;
+
+	pci_info(pdev, "ASPM:%s%s removed from Link Capabilities to avoid device defect\n",
+		 lnkcap & PCI_EXP_LNKCAP_ASPM_L0S ? " L0s" : "",
+		 lnkcap & PCI_EXP_LNKCAP_ASPM_L1 ? " L1" : "");
+
+}
+
 static int pcie_aspm_set_policy(const char *val,
 				const struct kernel_param *kp)
 {
-- 
2.43.0


