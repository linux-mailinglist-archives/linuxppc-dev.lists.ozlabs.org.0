Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B270F22D613
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:28:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDK3T61QVzDrZ1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W9KZJMFS; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjF5wWSzF1Nf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:05 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d1so5746270plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR2fCMdDK6TtUblVy4874iDDZ9AeWtrjrF1e3/xwj6Y=;
 b=W9KZJMFSbDy8zkqAJ/sJwM2OZyoPCTkS8BCDl7axAjIakR4mnc1A9O7EUWm1hg3ga2
 u3JlD1s+HQ+uTUm+wV7lsBU8/9IrKnCQ4tGqa66K3fRydN73lUch3UvSmNfDdUsrdsLY
 nmhHcIF+6QvNDf1Yp2zEiRGLD80f3n4W3/KhbZJv4y7NdWk2cdKCdLFueRkdHBdDs2JX
 dJsye7LlCIrb61SMjDYBKhN6grPVSTEA79aLAXJVMu76TqzErnQ6VUGcxyOl6otrK4uU
 /FbfTcEPHkPyO/kmxHAVeAa28GoEWzZjnDHoK7cdybSPyELz+Qkykjv/z2vDfnVyfF0k
 rmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR2fCMdDK6TtUblVy4874iDDZ9AeWtrjrF1e3/xwj6Y=;
 b=pHAOQrJmJR1OC/nluM98q+87lEdT3SckWfxnmU/7HN8SaX4mqJMlj6icTVoWYH6lTL
 YPLhI0w5/3sIb+Qu6vcAgyqUTdDe2MqKaLfrTr2T4irJX1uhjo/j87nugr7LPo91QY2m
 EnISLacjOJx3+RkJcNC5gmUjgAhocelxhjNOf9nHAjY5b1hPuXJSPoRK2qnvBdBm8ghf
 CVdejyAgrRWpqSMlyQPLuJVP9V1VPJFPzifIe+PO3NHXqFVYPPt/bOUQta4mkroIBEks
 QFjZThO2xfUxTzOYAvocKdg5l5csVqA2jRJxkISLGYMKVOc567GTKMUgNLyYF2GN3H97
 Po+w==
X-Gm-Message-State: AOAM531v79XMiP1hK/S5kNEKgttgRo63wej4Ue5On1hTS15ztejHnapw
 AIGEE4N3J5Tjw02f2rv1MpZ0CJ/EbQg=
X-Google-Smtp-Source: ABdhPJwt4guiMto3UQXRvbtW42D/haOa0xo3xiJh4owD23vrMwsHE1ZQq+0ucBBXmP7ZJGzIOluLzw==
X-Received: by 2002:a17:90a:d3cf:: with SMTP id
 d15mr8702304pjw.202.1595664783123; 
 Sat, 25 Jul 2020 01:13:03 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:02 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/14] powerpc/eeh: Pass eeh_dev to
 eeh_ops->{read|write}_config()
Date: Sat, 25 Jul 2020 18:12:26 +1000
Message-Id: <20200725081231.39076-9-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mechanical conversion of the eeh_ops interfaces to use eeh_dev to reference
a specific device rather than pci_dn. No functional changes.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no change
v3: no change
---
 arch/powerpc/include/asm/eeh.h               |  4 +-
 arch/powerpc/kernel/eeh.c                    | 22 +++++----
 arch/powerpc/kernel/eeh_pe.c                 | 47 +++++++++-----------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 43 ++++++++++--------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 16 ++++---
 5 files changed, 68 insertions(+), 64 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 73e6a73a3684..f8ef27f75c37 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -226,8 +226,8 @@ struct eeh_ops {
 	int (*configure_bridge)(struct eeh_pe *pe);
 	int (*err_inject)(struct eeh_pe *pe, int type, int func,
 			  unsigned long addr, unsigned long mask);
-	int (*read_config)(struct pci_dn *pdn, int where, int size, u32 *val);
-	int (*write_config)(struct pci_dn *pdn, int where, int size, u32 val);
+	int (*read_config)(struct eeh_dev *edev, int where, int size, u32 *val);
+	int (*write_config)(struct eeh_dev *edev, int where, int size, u32 val);
 	int (*next_error)(struct eeh_pe **pe);
 	int (*restore_config)(struct eeh_dev *edev);
 	int (*notify_resume)(struct eeh_dev *edev);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 1cef0f4bb2d5..1a12c8bdf61e 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -185,21 +185,21 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 		pdn->phb->global_number, pdn->busno,
 		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
 
-	eeh_ops->read_config(pdn, PCI_VENDOR_ID, 4, &cfg);
+	eeh_ops->read_config(edev, PCI_VENDOR_ID, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
 	pr_warn("EEH: PCI device/vendor: %08x\n", cfg);
 
-	eeh_ops->read_config(pdn, PCI_COMMAND, 4, &cfg);
+	eeh_ops->read_config(edev, PCI_COMMAND, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "cmd/stat:%x\n", cfg);
 	pr_warn("EEH: PCI cmd/status register: %08x\n", cfg);
 
 	/* Gather bridge-specific registers */
 	if (edev->mode & EEH_DEV_BRIDGE) {
-		eeh_ops->read_config(pdn, PCI_SEC_STATUS, 2, &cfg);
+		eeh_ops->read_config(edev, PCI_SEC_STATUS, 2, &cfg);
 		n += scnprintf(buf+n, len-n, "sec stat:%x\n", cfg);
 		pr_warn("EEH: Bridge secondary status: %04x\n", cfg);
 
-		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &cfg);
+		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &cfg);
 		n += scnprintf(buf+n, len-n, "brdg ctl:%x\n", cfg);
 		pr_warn("EEH: Bridge control: %04x\n", cfg);
 	}
@@ -207,11 +207,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 	/* Dump out the PCI-X command and status regs */
 	cap = edev->pcix_cap;
 	if (cap) {
-		eeh_ops->read_config(pdn, cap, 4, &cfg);
+		eeh_ops->read_config(edev, cap, 4, &cfg);
 		n += scnprintf(buf+n, len-n, "pcix-cmd:%x\n", cfg);
 		pr_warn("EEH: PCI-X cmd: %08x\n", cfg);
 
-		eeh_ops->read_config(pdn, cap+4, 4, &cfg);
+		eeh_ops->read_config(edev, cap+4, 4, &cfg);
 		n += scnprintf(buf+n, len-n, "pcix-stat:%x\n", cfg);
 		pr_warn("EEH: PCI-X status: %08x\n", cfg);
 	}
@@ -223,7 +223,7 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 		pr_warn("EEH: PCI-E capabilities and status follow:\n");
 
 		for (i=0; i<=8; i++) {
-			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
+			eeh_ops->read_config(edev, cap+4*i, 4, &cfg);
 			n += scnprintf(buf+n, len-n, "%02x:%x\n", 4*i, cfg);
 
 			if ((i % 4) == 0) {
@@ -250,7 +250,7 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 		pr_warn("EEH: PCI-E AER capability register set follows:\n");
 
 		for (i=0; i<=13; i++) {
-			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
+			eeh_ops->read_config(edev, cap+4*i, 4, &cfg);
 			n += scnprintf(buf+n, len-n, "%02x:%x\n", 4*i, cfg);
 
 			if ((i % 4) == 0) {
@@ -917,15 +917,13 @@ int eeh_pe_reset_full(struct eeh_pe *pe, bool include_passed)
  */
 void eeh_save_bars(struct eeh_dev *edev)
 {
-	struct pci_dn *pdn;
 	int i;
 
-	pdn = eeh_dev_to_pdn(edev);
-	if (!pdn)
+	if (!edev)
 		return;
 
 	for (i = 0; i < 16; i++)
-		eeh_ops->read_config(pdn, i * 4, 4, &edev->config_space[i]);
+		eeh_ops->read_config(edev, i * 4, 4, &edev->config_space[i]);
 
 	/*
 	 * For PCI bridges including root port, we need enable bus
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d71493f66917..f20fb0ee6aec 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -698,7 +698,6 @@ void eeh_pe_state_clear(struct eeh_pe *root, int state, bool include_passed)
  */
 static void eeh_bridge_check_link(struct eeh_dev *edev)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	int cap;
 	uint32_t val;
 	int timeout = 0;
@@ -714,32 +713,32 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 
 	/* Check slot status */
 	cap = edev->pcie_cap;
-	eeh_ops->read_config(pdn, cap + PCI_EXP_SLTSTA, 2, &val);
+	eeh_ops->read_config(edev, cap + PCI_EXP_SLTSTA, 2, &val);
 	if (!(val & PCI_EXP_SLTSTA_PDS)) {
 		eeh_edev_dbg(edev, "No card in the slot (0x%04x) !\n", val);
 		return;
 	}
 
 	/* Check power status if we have the capability */
-	eeh_ops->read_config(pdn, cap + PCI_EXP_SLTCAP, 2, &val);
+	eeh_ops->read_config(edev, cap + PCI_EXP_SLTCAP, 2, &val);
 	if (val & PCI_EXP_SLTCAP_PCP) {
-		eeh_ops->read_config(pdn, cap + PCI_EXP_SLTCTL, 2, &val);
+		eeh_ops->read_config(edev, cap + PCI_EXP_SLTCTL, 2, &val);
 		if (val & PCI_EXP_SLTCTL_PCC) {
 			eeh_edev_dbg(edev, "In power-off state, power it on ...\n");
 			val &= ~(PCI_EXP_SLTCTL_PCC | PCI_EXP_SLTCTL_PIC);
 			val |= (0x0100 & PCI_EXP_SLTCTL_PIC);
-			eeh_ops->write_config(pdn, cap + PCI_EXP_SLTCTL, 2, val);
+			eeh_ops->write_config(edev, cap + PCI_EXP_SLTCTL, 2, val);
 			msleep(2 * 1000);
 		}
 	}
 
 	/* Enable link */
-	eeh_ops->read_config(pdn, cap + PCI_EXP_LNKCTL, 2, &val);
+	eeh_ops->read_config(edev, cap + PCI_EXP_LNKCTL, 2, &val);
 	val &= ~PCI_EXP_LNKCTL_LD;
-	eeh_ops->write_config(pdn, cap + PCI_EXP_LNKCTL, 2, val);
+	eeh_ops->write_config(edev, cap + PCI_EXP_LNKCTL, 2, val);
 
 	/* Check link */
-	eeh_ops->read_config(pdn, cap + PCI_EXP_LNKCAP, 4, &val);
+	eeh_ops->read_config(edev, cap + PCI_EXP_LNKCAP, 4, &val);
 	if (!(val & PCI_EXP_LNKCAP_DLLLARC)) {
 		eeh_edev_dbg(edev, "No link reporting capability (0x%08x) \n", val);
 		msleep(1000);
@@ -752,7 +751,7 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 		msleep(20);
 		timeout += 20;
 
-		eeh_ops->read_config(pdn, cap + PCI_EXP_LNKSTA, 2, &val);
+		eeh_ops->read_config(edev, cap + PCI_EXP_LNKSTA, 2, &val);
 		if (val & PCI_EXP_LNKSTA_DLLLA)
 			break;
 	}
@@ -769,7 +768,6 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 
 static void eeh_restore_bridge_bars(struct eeh_dev *edev)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	int i;
 
 	/*
@@ -777,20 +775,20 @@ static void eeh_restore_bridge_bars(struct eeh_dev *edev)
 	 * Bus numbers and windows: 0x18 - 0x30
 	 */
 	for (i = 4; i < 13; i++)
-		eeh_ops->write_config(pdn, i*4, 4, edev->config_space[i]);
+		eeh_ops->write_config(edev, i*4, 4, edev->config_space[i]);
 	/* Rom: 0x38 */
-	eeh_ops->write_config(pdn, 14*4, 4, edev->config_space[14]);
+	eeh_ops->write_config(edev, 14*4, 4, edev->config_space[14]);
 
 	/* Cache line & Latency timer: 0xC 0xD */
-	eeh_ops->write_config(pdn, PCI_CACHE_LINE_SIZE, 1,
+	eeh_ops->write_config(edev, PCI_CACHE_LINE_SIZE, 1,
                 SAVED_BYTE(PCI_CACHE_LINE_SIZE));
-        eeh_ops->write_config(pdn, PCI_LATENCY_TIMER, 1,
-                SAVED_BYTE(PCI_LATENCY_TIMER));
+	eeh_ops->write_config(edev, PCI_LATENCY_TIMER, 1,
+		SAVED_BYTE(PCI_LATENCY_TIMER));
 	/* Max latency, min grant, interrupt ping and line: 0x3C */
-	eeh_ops->write_config(pdn, 15*4, 4, edev->config_space[15]);
+	eeh_ops->write_config(edev, 15*4, 4, edev->config_space[15]);
 
 	/* PCI Command: 0x4 */
-	eeh_ops->write_config(pdn, PCI_COMMAND, 4, edev->config_space[1] |
+	eeh_ops->write_config(edev, PCI_COMMAND, 4, edev->config_space[1] |
 			      PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 
 	/* Check the PCIe link is ready */
@@ -799,28 +797,27 @@ static void eeh_restore_bridge_bars(struct eeh_dev *edev)
 
 static void eeh_restore_device_bars(struct eeh_dev *edev)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	int i;
 	u32 cmd;
 
 	for (i = 4; i < 10; i++)
-		eeh_ops->write_config(pdn, i*4, 4, edev->config_space[i]);
+		eeh_ops->write_config(edev, i*4, 4, edev->config_space[i]);
 	/* 12 == Expansion ROM Address */
-	eeh_ops->write_config(pdn, 12*4, 4, edev->config_space[12]);
+	eeh_ops->write_config(edev, 12*4, 4, edev->config_space[12]);
 
-	eeh_ops->write_config(pdn, PCI_CACHE_LINE_SIZE, 1,
+	eeh_ops->write_config(edev, PCI_CACHE_LINE_SIZE, 1,
 		SAVED_BYTE(PCI_CACHE_LINE_SIZE));
-	eeh_ops->write_config(pdn, PCI_LATENCY_TIMER, 1,
+	eeh_ops->write_config(edev, PCI_LATENCY_TIMER, 1,
 		SAVED_BYTE(PCI_LATENCY_TIMER));
 
 	/* max latency, min grant, interrupt pin and line */
-	eeh_ops->write_config(pdn, 15*4, 4, edev->config_space[15]);
+	eeh_ops->write_config(edev, 15*4, 4, edev->config_space[15]);
 
 	/*
 	 * Restore PERR & SERR bits, some devices require it,
 	 * don't touch the other command bits
 	 */
-	eeh_ops->read_config(pdn, PCI_COMMAND, 4, &cmd);
+	eeh_ops->read_config(edev, PCI_COMMAND, 4, &cmd);
 	if (edev->config_space[1] & PCI_COMMAND_PARITY)
 		cmd |= PCI_COMMAND_PARITY;
 	else
@@ -829,7 +826,7 @@ static void eeh_restore_device_bars(struct eeh_dev *edev)
 		cmd |= PCI_COMMAND_SERR;
 	else
 		cmd &= ~PCI_COMMAND_SERR;
-	eeh_ops->write_config(pdn, PCI_COMMAND, 4, cmd);
+	eeh_ops->write_config(edev, PCI_COMMAND, 4, cmd);
 }
 
 /**
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index a41e67f674e6..c9f2f454d053 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -838,32 +838,32 @@ static int __pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
 	case EEH_RESET_HOT:
 		/* Don't report linkDown event */
 		if (aer) {
-			eeh_ops->read_config(pdn, aer + PCI_ERR_UNCOR_MASK,
+			eeh_ops->read_config(edev, aer + PCI_ERR_UNCOR_MASK,
 					     4, &ctrl);
 			ctrl |= PCI_ERR_UNC_SURPDN;
-			eeh_ops->write_config(pdn, aer + PCI_ERR_UNCOR_MASK,
+			eeh_ops->write_config(edev, aer + PCI_ERR_UNCOR_MASK,
 					      4, ctrl);
 		}
 
-		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &ctrl);
+		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &ctrl);
 		ctrl |= PCI_BRIDGE_CTL_BUS_RESET;
-		eeh_ops->write_config(pdn, PCI_BRIDGE_CONTROL, 2, ctrl);
+		eeh_ops->write_config(edev, PCI_BRIDGE_CONTROL, 2, ctrl);
 
 		msleep(EEH_PE_RST_HOLD_TIME);
 		break;
 	case EEH_RESET_DEACTIVATE:
-		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &ctrl);
+		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &ctrl);
 		ctrl &= ~PCI_BRIDGE_CTL_BUS_RESET;
-		eeh_ops->write_config(pdn, PCI_BRIDGE_CONTROL, 2, ctrl);
+		eeh_ops->write_config(edev, PCI_BRIDGE_CONTROL, 2, ctrl);
 
 		msleep(EEH_PE_RST_SETTLE_TIME);
 
 		/* Continue reporting linkDown event */
 		if (aer) {
-			eeh_ops->read_config(pdn, aer + PCI_ERR_UNCOR_MASK,
+			eeh_ops->read_config(edev, aer + PCI_ERR_UNCOR_MASK,
 					     4, &ctrl);
 			ctrl &= ~PCI_ERR_UNC_SURPDN;
-			eeh_ops->write_config(pdn, aer + PCI_ERR_UNCOR_MASK,
+			eeh_ops->write_config(edev, aer + PCI_ERR_UNCOR_MASK,
 					      4, ctrl);
 		}
 
@@ -932,11 +932,12 @@ void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
 static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
 				     int pos, u16 mask)
 {
+	struct eeh_dev *edev = pdn->edev;
 	int i, status = 0;
 
 	/* Wait for Transaction Pending bit to be cleared */
 	for (i = 0; i < 4; i++) {
-		eeh_ops->read_config(pdn, pos, 2, &status);
+		eeh_ops->read_config(edev, pos, 2, &status);
 		if (!(status & mask))
 			return;
 
@@ -957,7 +958,7 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
 	if (WARN_ON(!edev->pcie_cap))
 		return -ENOTTY;
 
-	eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCAP, 4, &reg);
+	eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCAP, 4, &reg);
 	if (!(reg & PCI_EXP_DEVCAP_FLR))
 		return -ENOTTY;
 
@@ -967,18 +968,18 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
 		pnv_eeh_wait_for_pending(pdn, "",
 					 edev->pcie_cap + PCI_EXP_DEVSTA,
 					 PCI_EXP_DEVSTA_TRPND);
-		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
+		eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
 				     4, &reg);
 		reg |= PCI_EXP_DEVCTL_BCR_FLR;
-		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
+		eeh_ops->write_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
 				      4, reg);
 		msleep(EEH_PE_RST_HOLD_TIME);
 		break;
 	case EEH_RESET_DEACTIVATE:
-		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
+		eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
 				     4, &reg);
 		reg &= ~PCI_EXP_DEVCTL_BCR_FLR;
-		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
+		eeh_ops->write_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
 				      4, reg);
 		msleep(EEH_PE_RST_SETTLE_TIME);
 		break;
@@ -995,7 +996,7 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
 	if (WARN_ON(!edev->af_cap))
 		return -ENOTTY;
 
-	eeh_ops->read_config(pdn, edev->af_cap + PCI_AF_CAP, 1, &cap);
+	eeh_ops->read_config(edev, edev->af_cap + PCI_AF_CAP, 1, &cap);
 	if (!(cap & PCI_AF_CAP_TP) || !(cap & PCI_AF_CAP_FLR))
 		return -ENOTTY;
 
@@ -1010,12 +1011,12 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
 		pnv_eeh_wait_for_pending(pdn, "AF",
 					 edev->af_cap + PCI_AF_CTRL,
 					 PCI_AF_STATUS_TP << 8);
-		eeh_ops->write_config(pdn, edev->af_cap + PCI_AF_CTRL,
+		eeh_ops->write_config(edev, edev->af_cap + PCI_AF_CTRL,
 				      1, PCI_AF_CTRL_FLR);
 		msleep(EEH_PE_RST_HOLD_TIME);
 		break;
 	case EEH_RESET_DEACTIVATE:
-		eeh_ops->write_config(pdn, edev->af_cap + PCI_AF_CTRL, 1, 0);
+		eeh_ops->write_config(edev, edev->af_cap + PCI_AF_CTRL, 1, 0);
 		msleep(EEH_PE_RST_SETTLE_TIME);
 		break;
 	}
@@ -1249,9 +1250,11 @@ static inline bool pnv_eeh_cfg_blocked(struct pci_dn *pdn)
 	return false;
 }
 
-static int pnv_eeh_read_config(struct pci_dn *pdn,
+static int pnv_eeh_read_config(struct eeh_dev *edev,
 			       int where, int size, u32 *val)
 {
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -1263,9 +1266,11 @@ static int pnv_eeh_read_config(struct pci_dn *pdn,
 	return pnv_pci_cfg_read(pdn, where, size, val);
 }
 
-static int pnv_eeh_write_config(struct pci_dn *pdn,
+static int pnv_eeh_write_config(struct eeh_dev *edev,
 				int where, int size, u32 val)
 {
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 426227ddee32..b981332db873 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -692,29 +692,33 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
 
 /**
  * pseries_eeh_read_config - Read PCI config space
- * @pdn: PCI device node
- * @where: PCI address
+ * @edev: EEH device handle
+ * @where: PCI config space offset
  * @size: size to read
  * @val: return value
  *
  * Read config space from the speicifed device
  */
-static int pseries_eeh_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
+static int pseries_eeh_read_config(struct eeh_dev *edev, int where, int size, u32 *val)
 {
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
 	return rtas_read_config(pdn, where, size, val);
 }
 
 /**
  * pseries_eeh_write_config - Write PCI config space
- * @pdn: PCI device node
- * @where: PCI address
+ * @edev: EEH device handle
+ * @where: PCI config space offset
  * @size: size to write
  * @val: value to be written
  *
  * Write config space to the specified device
  */
-static int pseries_eeh_write_config(struct pci_dn *pdn, int where, int size, u32 val)
+static int pseries_eeh_write_config(struct eeh_dev *edev, int where, int size, u32 val)
 {
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
 	return rtas_write_config(pdn, where, size, val);
 }
 
-- 
2.26.2

