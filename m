Return-Path: <linuxppc-dev+bounces-9187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7FAD0E42
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 17:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF2kk5pz5z2yN1;
	Sun,  8 Jun 2025 01:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749311550;
	cv=none; b=ihIgvR7YstXjnIiOBv+Hlg2epfXEhfLrAW+WDWX+BEFQBuZym+bn0yPxmgNZUCWct+snHFNuYm72hGqs+2kSRFPFLYPWVHnUCeOwVBsUd7u75mDxyQDTUvkluQmpyu7ndjvbyFXxvgktJWwNbXWuB0DWz1tboAkKDK8YhFOZoiiONW3cTfMOGibHw4s2nfQ23IMLr9v2g6CFsTSlJ+jRdEGPUTr083QPKr+BziDmIyySbFF9UwUStz6wZHcIkNk109p/g+xQTIWV/P0QLmzKgbs6K3+vwqn7ydNGIWWjS6za0hLhleKt+mhp/CzzBnyfLanioq6gBxFp9K1cxnRG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749311550; c=relaxed/relaxed;
	bh=UKDa40I0u1fLgDBEqwi9HdVUgYBePD5D6X2Frp4VUjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iuOs8wmiDeMKrsXD7saXC3Y9xwJSTaVIR6vcntFzItAhzNNBGxvMpIGGqNFEHrmHxZun5+hyE7jWDc1nH/dq1rhxU8E+3zFHs6nXe8L3s3gyEyDJ5vzrwWPNROpTLOMjTbpK7mQl90VE+isVBO9yk28HefFTszrVCbFrRwKloYO9igik7MAaXsLlB4v7SUCKMziNCGkj6u8rOfJl9P3GQAfQFl7qoP17MKom3vO2Df1H2dcZrR1xS05UHHOgNkYe1ulIfUVWp1qPhRcw4Vw2ZiTfmmmk67IXTkSzuzPCRXwNvAMJUYHHsZZaiPISEqrpVNXS3VZIWRFnO39YcmbSlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GhXVN+L7; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GhXVN+L7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF2kd1RPwz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 01:52:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UK
	Da40I0u1fLgDBEqwi9HdVUgYBePD5D6X2Frp4VUjc=; b=GhXVN+L7/RTx1R9Z60
	yyriw21vGGe4kF9td2SU3KTuR3r97iwbUVXHCmeBzpam9B5ChUnHk3rKdMMBjrF0
	eyKxfDATDtbC30bVWLWKDwZTt96TQ0756D+Er37SOIPllQqfB9xJ5kzgcAFuYF4H
	XNswf7L/m8R3RB5N5HVUz0brQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBXM_kjYERoFeepHA--.4808S2;
	Sat, 07 Jun 2025 23:52:03 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com
Cc: oohall@gmail.com,
	manivannan.sadhasivam@linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2] PCI/AER: Use pci_clear_and_set_config_dword() to simplify mask updates
Date: Sat,  7 Jun 2025 23:51:59 +0800
Message-Id: <20250607155159.805679-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wBXM_kjYERoFeepHA--.4808S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4fXF1Uuw13Cr1rZr4DCFg_yoW5CFyrpr
	W3AFWfArWUJF15urWDWaykJr1rAas7t3ySgryfKwn5XF4UuFZrJr9avw1UJ345KFZ3Xw4f
	Jws5Ka1ruF4UJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKYLkZUUUUU=
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhVlo2hEXNpMQQAAsO
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace manual read-modify-write sequences in multiple functions with
pci_clear_and_set_config_dword() to ensure atomic operations and reduce
code duplication. 

Signed-off-by: Hans Zhang <18255117159@163.com>
---
Changes for v2:
- The patch commit message were modified.
- New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
---
 drivers/pci/pcie/aer.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 70ac66188367..86cbd204a73f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -176,14 +176,13 @@ static int enable_ecrc_checking(struct pci_dev *dev)
 static int disable_ecrc_checking(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
-	u32 reg32;
 
 	if (!aer)
 		return -ENODEV;
 
-	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
-	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
-	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
+	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_CAP,
+				       PCI_ERR_CAP_ECRC_GENE |
+				       PCI_ERR_CAP_ECRC_CHKE, 0);
 
 	return 0;
 }
@@ -1101,15 +1100,12 @@ static bool find_source_device(struct pci_dev *parent,
 static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
-	u32 mask;
 
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
-	mask &= ~PCI_ERR_UNC_INTN;
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
+	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
+				       PCI_ERR_UNC_INTN, 0);
 
-	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
-	mask &= ~PCI_ERR_COR_INTERNAL;
-	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
+	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
+				       PCI_ERR_COR_INTERNAL, 0);
 }
 
 static bool is_cxl_mem_dev(struct pci_dev *dev)
@@ -1555,23 +1551,19 @@ static irqreturn_t aer_irq(int irq, void *context)
 static void aer_enable_irq(struct pci_dev *pdev)
 {
 	int aer = pdev->aer_cap;
-	u32 reg32;
 
 	/* Enable Root Port's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
+				       0, ROOT_PORT_INTR_ON_MESG_MASK);
 }
 
 static void aer_disable_irq(struct pci_dev *pdev)
 {
 	int aer = pdev->aer_cap;
-	u32 reg32;
 
 	/* Disable Root Port's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
+				       ROOT_PORT_INTR_ON_MESG_MASK, 0);
 }
 
 /**

base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.25.1


