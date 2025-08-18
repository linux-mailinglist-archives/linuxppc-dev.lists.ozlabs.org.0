Return-Path: <linuxppc-dev+bounces-11096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCA3B2ADE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 18:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Hrj2Y6Yz3ccr;
	Tue, 19 Aug 2025 02:16:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755533765;
	cv=none; b=RWwALeYODh8j02hQNU6uBYGVNU4InIE40Xkb2cClm3ugwLddxus2q/3G0FkSSNJAyE/NY3zHtyZPSHtLVVOJhny1rf/IHRgzHkqbNW0yK4cDB0G+qXt8DvLSnnVhLYqA8ooH2wrfuRxscR9rf1j4VNofh3ZnjA7RjtI7DHHP76BD/icIpz6ultUyd+vBW/6CCTcQGjZm6zJAEC5Zf070dGNanHe4xE/XUwzqBbusbQny4YUypJXq9XjZBDU+9xkQrTJ9D4tA88vApvY2HE+Cbn62EmPI9qvhOpSoDHdBN17jVDM6pz93shxkq8t5nFH9Gj1KuJ+6Cyn3D70LRJximA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755533765; c=relaxed/relaxed;
	bh=rTeDMOibmlghpQVXp52MOWLYZFEzyWAti7xjOoZt1/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LCF+tpvfx5d8T9hYWzGgt+e70W5vV7U48mubKGNEcEF6zHJGX/jdjI9OcGEls6EU55fvScNh97RxJzK/71q+KQBTDC8yCIixkduVZLkym0l3h2hAiT5avz8MG52TdT20ln7LPgLN8tnkfcfTjzwGXPzqsM6S3RvO5BLKWQtdHF5yt4HdRj3ddj5FRksSJsuIDdLbMu7vh7lqGF737Nu+SVh3MzE7TL+0vhs6VyNkPKTHtovkyUTDPOOFqYcHTCLJllB2gLpLJ18ZusekFmG6elYybzWYZ3XXO8Z2lxy41w1C8/xaw2wMpJ+/O1iDZGYN0qqdSkwnyVVstw5gaDdjdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jDtBKNAB; dkim-atps=neutral; spf=pass (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jDtBKNAB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Hrh1ygCz3ccF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 02:16:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rT
	eDMOibmlghpQVXp52MOWLYZFEzyWAti7xjOoZt1/I=; b=jDtBKNABYOT2msFHPw
	lAeE7k2YHDSLf9JKXVrFbFAs+/q93OTWQZBvRB0FncP1gH3xEstZ83IFK/KlcXUQ
	SeQKB61xvu08Xl3NPjHnyiprRrKOtDOPwTtKEfCtFcMAbNsLqs5CaMglWihuCBtv
	5W7p5G8kPzVsPLaq+iV5I6UpI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3b8FtUaNopYAWCw--.8667S4;
	Tue, 19 Aug 2025 00:14:42 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com
Cc: oohall@gmail.com,
	mani@kernel.org,
	lukas@wunner.de,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 2/2] PCI/AER: Use pci_clear/set_config_dword to simplify code
Date: Tue, 19 Aug 2025 00:14:31 +0800
Message-Id: <20250818161431.372590-3-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818161431.372590-1-18255117159@163.com>
References: <20250818161431.372590-1-18255117159@163.com>
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
X-CM-TRANSID:_____wD3b8FtUaNopYAWCw--.8667S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyDAFy7AF15tw1kJr4ruFg_yoW5Xw1UpF
	W3AFWfAr4UJF15ZrWDWaykJwn5AF97t34fKr93Kwn5XF48uFZrJ3sav34UJ345KFZ5X34r
	Jws5Ka1rZF4UJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNAp0kUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:3980:6173:5059:2d2a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwSto2ijSoPLJQABsk
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace manual read-modify-write sequences in multiple functions with
pci_clear/set_config_dword helper to reduce code duplication.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pcie/aer.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d716..468d4a726a20 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -176,14 +176,12 @@ static int enable_ecrc_checking(struct pci_dev *dev)
 static int disable_ecrc_checking(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
-	u32 reg32;
 
 	if (!aer)
 		return -ENODEV;
 
-	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
-	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
-	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
+	pci_clear_config_dword(dev, aer + PCI_ERR_CAP,
+			       PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
 
 	return 0;
 }
@@ -1102,15 +1100,12 @@ static bool find_source_device(struct pci_dev *parent,
 static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
-	u32 mask;
 
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
-	mask &= ~PCI_ERR_UNC_INTN;
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
+	pci_clear_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
+			       PCI_ERR_UNC_INTN);
 
-	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
-	mask &= ~PCI_ERR_COR_INTERNAL;
-	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
+	pci_clear_config_dword(dev, aer + PCI_ERR_COR_MASK,
+			       PCI_ERR_COR_INTERNAL);
 }
 
 static bool is_cxl_mem_dev(struct pci_dev *dev)
@@ -1556,23 +1551,19 @@ static irqreturn_t aer_irq(int irq, void *context)
 static void aer_enable_irq(struct pci_dev *pdev)
 {
 	int aer = pdev->aer_cap;
-	u32 reg32;
 
 	/* Enable Root Port's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	pci_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
+			     ROOT_PORT_INTR_ON_MESG_MASK);
 }
 
 static void aer_disable_irq(struct pci_dev *pdev)
 {
 	int aer = pdev->aer_cap;
-	u32 reg32;
 
 	/* Disable Root Port's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	pci_clear_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
+			       ROOT_PORT_INTR_ON_MESG_MASK);
 }
 
 /**
-- 
2.25.1


