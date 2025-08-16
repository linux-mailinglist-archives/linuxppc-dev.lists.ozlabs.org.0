Return-Path: <linuxppc-dev+bounces-11069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A361FB28FB0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Aug 2025 19:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c451P22KBz2xQ4;
	Sun, 17 Aug 2025 03:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755363865;
	cv=none; b=ZWq5DrxUeK3J/t5CuBPk4ZE7xB8B6M49CAPlxsvXE7aQjRcGlAoWU7tbgalulkr612pSuRgrH56nnuoGYoKrYiQTNOTtRmf8iTTVdLY+QrcWy5VHSGPae2lLXdP+mys23Z1i2r6veCQfNUFEYx0yIdgBrlBa7y9FVZ/AnVL0wPLBt4wNe7e1+jO9xCKNwKk7NtuB2pfj8AJGGQT3svtoFg8KkDDlCWCCHD5gDl+QfGGlviijef1r3SzD9SMNDjvsc8UKMLTARxoBXwswzFSnrcnOBr64ypl7LwTYIM9QBMsdi/DQfhbTVBkp2O4IJiBfNvFyJXP44mYorN+rLZnffw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755363865; c=relaxed/relaxed;
	bh=a5iiUaG3yzqBazOOhbSc8BcO1MW4L1VVCUInIq8Mejw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lZ1QOBYkCuPUmIoxJEDV3lOz/rHldS3AwA/d51jn9rZgWfxmyeXsyrAWMoYEJcshXBfNE3NuhlkC+2VemgzgjwXzd98hRfiYR88RK3SCubXM/aEbkx3DEWCwn/XVYagzL99U+biriO43Z7vHAv6gJXkrR415knjfav4ZP05D9HFFByOqTaKZ5nymOAK3uUtp4TaH8y9ycn0H+Ndzxg/Oo9v0hBp9NjTDP5phYvU6Y1wjAfzZFOEVG86uoH8lHduzOv2IFe81GWewFG3pcNIN5/HWJSqx7x+UK3kuKU0w12jv4vm525NuvgxdtIkkPP0XnG9ke1s7v592pJJM2F/L4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LndG2yDG; dkim-atps=neutral; spf=pass (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LndG2yDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1815 seconds by postgrey-1.37 at boromir; Sun, 17 Aug 2025 03:04:22 AEST
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c451L4hD4z2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 03:04:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=a5
	iiUaG3yzqBazOOhbSc8BcO1MW4L1VVCUInIq8Mejw=; b=LndG2yDGVWUZgKf/E+
	IJYxXlVB9hfzmp5RjWIpjWrCoglZ63g/C26bgEordPGppJPEvm9Lc2kAIdha54xp
	ms/bbpps4oKREZYB/Epid2bvuKXs8VkBAxvdsizoJ+gXHVM2JiRe5UiOw3I/VPrW
	8uf1gQJSxycJMXdoUu/sKMaDY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3ORMpr6Bo6AZqCQ--.35081S2;
	Sun, 17 Aug 2025 00:17:45 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com
Cc: oohall@gmail.com,
	mani@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3] PCI/AER: Use pci_clear_and_set_config_dword() to simplify mask updates
Date: Sun, 17 Aug 2025 00:17:43 +0800
Message-Id: <20250816161743.340684-1-18255117159@163.com>
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
X-CM-TRANSID:_____wB3ORMpr6Bo6AZqCQ--.35081S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry8WF1kKrWfAw4rAFyrJFb_yoW5ur1fpr
	W3AFWfAr4UJF15urWUWaykAr15Aas2y3yfKr93Gwn5ZF4UuFZ7Jr9avw1UA345KFZxXw4f
	Jws5Ka18ZF4UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEKZXUUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:3980:6173:5059:2d2a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgero2igp0CpeAAAsL
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace manual read-modify-write sequences in multiple functions with
pci_clear_and_set_config_dword() helper to reduce code duplication.

Signed-off-by: Hans Zhang <18255117159@163.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changes for v3:
- Rebase to v6.17-rc1.
- The patch commit message were modified.
- Add Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Changes for v2:
- The patch commit message were modified.
- New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
---
 drivers/pci/pcie/aer.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d716..3d37e2b7e412 100644
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
@@ -1102,15 +1101,12 @@ static bool find_source_device(struct pci_dev *parent,
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
@@ -1556,23 +1552,19 @@ static irqreturn_t aer_irq(int irq, void *context)
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

base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
-- 
2.25.1


