Return-Path: <linuxppc-dev+bounces-14019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018FC49902
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 23:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d549G2D4vz3080;
	Tue, 11 Nov 2025 09:29:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762813794;
	cv=none; b=PoGHrw04AuFGy6hODR9nCwmhlgAfdPOcamgQaRTkqVbnN1s8bifAPtB7yrRVs4LKTezxZSW0YKBtsXxFAzxegFD0Y17TKMFrhc+ICaSGxj000K+IzyyoUTj1ehtSItxxSBmlmv3k9YJqCfCbY2Znq41MeRnmj3BWpwUUwUAL08cbDWg9dBEHC3Xm46kqXDCFm4j08jzMZZ2JwmR7UfAYx4tkiJv9/y6PmecTZvNcXCW++sEdKmoz3CbSUr5O4gWGBpz6y80xOL9dEmsiWLRllrdhkIBNJL55l/UM/hWlF1OfmwXf+ZXP2ByxFRySH4kO81DrQwJEjg6XnDYj/NUVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762813794; c=relaxed/relaxed;
	bh=h/HndspfrjZ1JT7cyiylGjThQU9lA6glSkfirH6Nx2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ft/9ETil0Eko1ZXDXYiT/g5a8TB6onbgQYwD+j6Ifg/IHtsJYr/U0LX0fJcz0nKLYL5kdopiWgEN+9avWkl6Aw0SRYriCyTHZiQ/VxSmkujbuib+g/JO2KIs+HLk6eJRgJvWbHRPFo1dRV9pwgh8pYOXSvxzEuONu382GC+MfiES6g4+G6/HU6qB0QtiHPM+EcFkghOuOfHxRURYU/sMT0akokoWUwDKDXmB4K1dnIbB634ks7OU1KQ044vQ/yu8qaDlEOU/AxAsg5cHqbdW7OnOCPSPJQFRiBqyHJnskp2IGadZDv4rBXyV3dwSeRAfyHaPtwVKFCla+OjAY4bEhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNFz9FBi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNFz9FBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d549F47TWz3060
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 09:29:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93150601F5;
	Mon, 10 Nov 2025 22:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B33C19424;
	Mon, 10 Nov 2025 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762813791;
	bh=Gx7BkbwEI9+5WMZh15d9ZFjuWteQ62dZWggKcssX+Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lNFz9FBih/mYXpq/gsNbwuNA74zWvSFiptmRL1aT9H7fmgR+AFRr7VHDJna3cTTsK
	 C8vz+5GBsnr5erRIT+t8B+7s4T2X2jIFbtPetV87/Fs3XvgQNZkRHWaQ8nRnk26Gp4
	 7NgoTQ1DUIU/NZJwo9yXv1T0/FMjvQBjE5FEFd07v0U3l7Hy0ht8tYrS4d0FHCowU+
	 /3L6Mxev64P4A8k6nA/3ZQlXjp5LgVQHFhgSZNszuypiiPwRM6rLZ4O/MJpCPcdeNA
	 KJse0nccDJGUwCAkx5wdnFC6FPX3yVsTlqW1x9+7csvBnZ1bGWByyL0Ef9bFHt+q0s
	 ThKIm+vwz3Xdg==
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
Subject: [PATCH v2 3/4] PCI/ASPM: Convert quirks to override advertised link states
Date: Mon, 10 Nov 2025 16:22:27 -0600
Message-ID: <20251110222929.2140564-4-helgaas@kernel.org>
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

Existing quirks to disable ASPM L0s and L1 use pci_disable_link_state(),
which disables ASPM states and prevents their use in the future.  But since
they are FINAL quirks, they happen after ASPM has already been enabled.
Here's a typical call path:

  pci_host_probe
    pci_scan_root_bus_bridge
      pci_scan_child_bus
        pci_scan_slot
          pci_scan_single_device
            pci_device_add
              pci_fixup_device(pci_fixup_header)  # HEADER quirks
          pcie_aspm_init_link_state
            pcie_config_aspm_path
              pcie_config_aspm_link
                pcie_config_aspm_dev              # ASPM may be enabled
    pci_bus_add_devices
      pci_bus_add_devices
        pci_fixup_device(pci_fixup_final)         # FINAL quirks
          quirk_disable_aspm_l0s
            pci_disable_link_state(dev, PCIE_LINK_STATE_L0S)

Sometimes enabling ASPM can make the link non-functional, so if we know
ASPM is broken on a device, we shouldn't enable it at all, even
temporarily.

Convert the existing quirks to use pcie_aspm_remove_cap() instead, which
overrides the ASPM Support advertised in PCIe Link Capabilities, and make
them HEADER quirks so they run before pcie_aspm_init_link_state() has a
chance to enable ASPM.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..922c77c627a1 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2494,28 +2494,27 @@ DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
  */
 static void quirk_disable_aspm_l0s(struct pci_dev *dev)
 {
-	pci_info(dev, "Disabling L0s\n");
-	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
+	pcie_aspm_remove_cap(dev, PCI_EXP_LNKCAP_ASPM_L0S);
 }
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10a7, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10a9, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10b6, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10c6, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10c7, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10c8, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10d6, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10db, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10dd, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10e1, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10ec, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10f1, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x10f4, quirk_disable_aspm_l0s);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1508, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10a7, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10a9, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10b6, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10c6, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10c7, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10c8, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10d6, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10db, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10dd, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10e1, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10ec, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10f1, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x10f4, quirk_disable_aspm_l0s);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1508, quirk_disable_aspm_l0s);
 
 static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
 {
-	pci_info(dev, "Disabling ASPM L0s/L1\n");
-	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
+	pcie_aspm_remove_cap(dev,
+			     PCI_EXP_LNKCAP_ASPM_L0S | PCI_EXP_LNKCAP_ASPM_L1);
 }
 
 /*
@@ -2523,7 +2522,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  * upstream PCIe root port when ASPM is enabled. At least L0s mode is affected;
  * disable both L0s and L1 for now to be safe.
  */
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
-- 
2.43.0


