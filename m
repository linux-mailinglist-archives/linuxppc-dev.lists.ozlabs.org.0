Return-Path: <linuxppc-dev+bounces-11547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C0B3DB5B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 09:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFgs826Cyz2xWQ;
	Mon,  1 Sep 2025 17:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756712732;
	cv=none; b=YPJspivN+ux6o2XV5HHM9kl0nLb/pMIkwkM0VqS+pdm2c/mV2UjAyxQGuT1PXAr48voRO3hnJmX6EY4+bnu7g3S/Eax8ELn1K85vXsi0avifSem1umB5idzkCxScB7yhWkENSPVrLfBSsVmmeaI2t3LdDuQdlxGUJuk9H1EhHXMJ8gkxoOach6nEqkk5UGLQlAK3NToi1eZ1CBor5jy/CFyBCoQJaDdboXAbxveSYyXw/fxf6OqY75KBfoyHW9ulkFE9pxJQgw8MBInj3tm9LCVoaqQ22T0A3aBYfo+RBssogeMiSW5XWqDIvzEWgQSBDmlYC5+163Cq5Y83BgGT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756712732; c=relaxed/relaxed;
	bh=ixXRTsSb891L+XZn49cnH1RGaSX7ycD3FtKzv7tqzYQ=;
	h=Message-Id:From:Date:Subject:To:Cc; b=EEctelkQ5kQZyenQbeBpWelg482BDohgDwXlH61pxNEBksNqLag35o4+c64qgX+b8P0rjcmM05aNwFAfupu7yxBDr3xGEwGHjt3V/pTpmOPA06kgrAONDE4/xb8GL3NunVP/dniC7oIsNERGTSOM/eKj+vR8xzJBdvvBbPZlv09BL/QJHw+ks9PsL7bza2UhFXRSmV84UzO2C9M3H2c2rDnp+uhjTlIWM6oFxmAvnqdc/WrEHYK1e8bgCtdfhpG0PirOoHhcnxhYGpE8igmptJ9E90HjOpWrKa+MMxPrM0PyZWu44Qw/8T/l3/usr0YsJPbS0X2sdi1An8MDwdIjcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFgs640Ggz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 17:45:28 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 434312C0131F;
	Mon,  1 Sep 2025 09:45:22 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2E4BD4F1F6C; Mon,  1 Sep 2025 09:45:22 +0200 (CEST)
Message-Id: <5f707caf1260bd8f15012bb032f7da9a9b898aba.1756712066.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 1 Sep 2025 09:44:52 +0200
Subject: [PATCH] PCI/AER: Print TLP Log for errors introduced since PCIe r1.1
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

When reporting an error, the AER driver prints the TLP Header / Prefix Log
only for errors enumerated in the AER_LOG_TLP_MASKS macro.

The macro was never amended since its introduction in 2006 with commit
6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver").
At the time, PCIe r1.1 was the latest spec revision.

Amend the macro with errors defined since then to avoid omitting the TLP
Header / Prefix Log for newer errors.

The order of the errors in AER_LOG_TLP_MASKS follows PCIe r1.1 sec 6.2.7
rather than 7.10.2, because only the former documents for which errors a
TLP Header / Prefix is logged.  Retain this order.  The section number is
still 6.2.7 in today's PCIe r7.0.

For Completion Timeouts, the TLP Header / Prefix is only logged if the
Completion Timeout Prefix / Header Log Capable bit is set in the AER
Capabilities and Control register.  Introduce a tlp_header_logged() helper
to check whether the TLP Header / Prefix Log is populated and use it in
the two places which currently match against AER_LOG_TLP_MASKS directly.

For Uncorrectable Internal Errors, logging of the TLP Header / Prefix is
optional per PCIe r7.0 sec 6.2.7.  If needed, drivers could indicate
through a flag whether devices are capable and tlp_header_logged() could
then check that flag.

pcitools introduced macros for newer errors with commit 144b0911cc0b
("ls-ecaps: extend decode support for more fields for AER CE and UE
status"):
  https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/commit/?id=144b0911cc0b

Unfortunately some of those macros are overly long:
  PCI_ERR_UNC_POISONED_TLP_EGRESS
  PCI_ERR_UNC_DMWR_REQ_EGRESS_BLOCKED
  PCI_ERR_UNC_IDE_CHECK
  PCI_ERR_UNC_MISR_IDE_TLP
  PCI_ERR_UNC_PCRC_CHECK
  PCI_ERR_UNC_TLP_XLAT_EGRESS_BLOCKED

This seems unsuitable for <linux/pci_regs.h>, so shorten to:
  PCI_ERR_UNC_POISON_BLK
  PCI_ERR_UNC_DMWR_BLK
  PCI_ERR_UNC_IDE_CHECK
  PCI_ERR_UNC_MISR_IDE
  PCI_ERR_UNC_PCRC_CHECK
  PCI_ERR_UNC_XLAT_BLK

Note that some of the existing macros in <linux/pci_regs.h> do not match
exactly with pcitools (e.g. PCI_ERR_UNC_SDES versus PCI_ERR_UNC_SURPDN),
so it does not seem mandatory for them to be identical.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/pci/pcie/aer.c        | 30 +++++++++++++++++++++++++++---
 include/uapi/linux/pci_regs.h |  8 ++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 15ed541..62c74b5 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -96,11 +96,21 @@ struct aer_info {
 };
 
 #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
+					PCI_ERR_UNC_POISON_BLK |	\
 					PCI_ERR_UNC_ECRC|		\
 					PCI_ERR_UNC_UNSUP|		\
 					PCI_ERR_UNC_COMP_ABORT|		\
 					PCI_ERR_UNC_UNX_COMP|		\
-					PCI_ERR_UNC_MALF_TLP)
+					PCI_ERR_UNC_ACSV |		\
+					PCI_ERR_UNC_MCBTLP |		\
+					PCI_ERR_UNC_ATOMEG |		\
+					PCI_ERR_UNC_DMWR_BLK |		\
+					PCI_ERR_UNC_XLAT_BLK |		\
+					PCI_ERR_UNC_TLPPRE |		\
+					PCI_ERR_UNC_MALF_TLP |		\
+					PCI_ERR_UNC_IDE_CHECK |		\
+					PCI_ERR_UNC_MISR_IDE |		\
+					PCI_ERR_UNC_PCRC_CHECK)
 
 #define SYSTEM_ERROR_INTR_ON_MESG_MASK	(PCI_EXP_RTCTL_SECEE|	\
 					PCI_EXP_RTCTL_SENFEE|	\
@@ -796,6 +806,20 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 	}
 }
 
+static bool tlp_header_logged(u32 status, u32 capctl)
+{
+	/* Errors for which a header is always logged (PCIe r7.0 sec 6.2.7) */
+	if (status & AER_LOG_TLP_MASKS)
+		return true;
+
+	/* Completion Timeout header is only logged on capable devices */
+	if (status & PCI_ERR_UNC_COMP_TIME &&
+	    capctl & PCI_ERR_CAP_COMP_TIME_LOG)
+		return true;
+
+	return false;
+}
+
 static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	const char **strings;
@@ -910,7 +934,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		status = aer->uncor_status;
 		mask = aer->uncor_mask;
 		info.level = KERN_ERR;
-		tlp_header_valid = status & AER_LOG_TLP_MASKS;
+		tlp_header_valid = tlp_header_logged(status, aer->cap_control);
 	}
 
 	info.status = status;
@@ -1401,7 +1425,7 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
 		info->first_error = PCI_ERR_CAP_FEP(aercc);
 
-		if (info->status & AER_LOG_TLP_MASKS) {
+		if (tlp_header_logged(info->status, aercc)) {
 			info->tlp_header_valid = 1;
 			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
 					  aer + PCI_ERR_PREFIX_LOG,
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index f5b1774..d2e1bbb 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -776,6 +776,13 @@
 #define  PCI_ERR_UNC_MCBTLP	0x00800000	/* MC blocked TLP */
 #define  PCI_ERR_UNC_ATOMEG	0x01000000	/* Atomic egress blocked */
 #define  PCI_ERR_UNC_TLPPRE	0x02000000	/* TLP prefix blocked */
+#define  PCI_ERR_UNC_POISON_BLK	0x04000000	/* Poisoned TLP Egress Blocked */
+#define  PCI_ERR_UNC_DMWR_BLK	0x08000000	/* DMWr Request Egress Blocked */
+#define  PCI_ERR_UNC_IDE_CHECK	0x10000000	/* IDE Check Failed */
+#define  PCI_ERR_UNC_MISR_IDE	0x20000000	/* Misrouted IDE TLP */
+#define  PCI_ERR_UNC_PCRC_CHECK	0x40000000	/* PCRC Check Failed */
+#define  PCI_ERR_UNC_XLAT_BLK	0x80000000	/* TLP Translation Egress Blocked */
+
 #define PCI_ERR_UNCOR_MASK	0x08	/* Uncorrectable Error Mask */
 	/* Same bits as above */
 #define PCI_ERR_UNCOR_SEVER	0x0c	/* Uncorrectable Error Severity */
@@ -798,6 +805,7 @@
 #define  PCI_ERR_CAP_ECRC_CHKC		0x00000080 /* ECRC Check Capable */
 #define  PCI_ERR_CAP_ECRC_CHKE		0x00000100 /* ECRC Check Enable */
 #define  PCI_ERR_CAP_PREFIX_LOG_PRESENT	0x00000800 /* TLP Prefix Log Present */
+#define  PCI_ERR_CAP_COMP_TIME_LOG	0x00001000 /* Completion Timeout Prefix/Header Log Capable */
 #define  PCI_ERR_CAP_TLP_LOG_FLIT	0x00040000 /* TLP was logged in Flit Mode */
 #define  PCI_ERR_CAP_TLP_LOG_SIZE	0x00f80000 /* Logged TLP Size (only in Flit mode) */
 #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
-- 
2.50.1


