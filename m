Return-Path: <linuxppc-dev+bounces-13660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C3C282E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 17:34:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czNjb0VZ7z2yrX;
	Sun,  2 Nov 2025 03:34:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762014882;
	cv=none; b=OVn/RYwuTejN1kMXXUpT2JSZyEstZE3GO2bchSzWhB+UGtAt3KZzcHrQXC8bLRz3YQJ9wRmq3y43RL5KnK+iioTpxnjjgNe4tm/A5QCoNT/2dhMJVwVpzvqB1/tiQ+0TrA02BjjJTUeZkEymJz1Q1bQTqFBz1w9SB/cqcz083ehS7pM9eqGdHL1gjNqoyuXYfF796tzs0pRj19wxnSKZfi9slOhV56hQn3NjrDmPaoOuPB8DJgLy2wGGNVub/7+TVsXx/t+38dhmmhP3uRdjKXx2Xme9NktRRxpuGr0hPjeIGGyx6YdRmUlztIn506L+IpEnwCMEpgfMPSoxVLH31A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762014882; c=relaxed/relaxed;
	bh=rTeDMOibmlghpQVXp52MOWLYZFEzyWAti7xjOoZt1/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dC8UnKwQV5PV9oe+eT9d3iO6Khg6+1gkcK7aXSSd7q8dn+uzM4myP+advU4RhP+fpClCoNx6sZ2XM6wKEmHLl4F2jBzQ95AxSOZFeLeheIn16QXqWK9OBnWdRQwSIP9MLUIpfzpHwyfOJgm3Up9NnnoKUX7vNVyAi6Yi4VOgLtgY7d+u8K4xQyBtd3wBFDLnwfDnHCart5QSLAE4UpNJ+ZHlqJz6UElXV4BZJysuPbLmvFKeta3K+xJa9+cbvqegjwfWYr/iMEwsMy42x4Ddeo9f4fiQNMMUeTlxqG1M3eeX3Hjgbddos6YsgRI1WPgNIRvfnUPZVPXxf6F3qdSUug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LXJ0jJPg; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LXJ0jJPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 627 seconds by postgrey-1.37 at boromir; Sun, 02 Nov 2025 03:34:39 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czNjW6XFBz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 03:34:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rT
	eDMOibmlghpQVXp52MOWLYZFEzyWAti7xjOoZt1/I=; b=LXJ0jJPgsEbN8jsn3g
	j7upqizSVegB/eDdNnZhbBIspuKLiGJThtOBLiXg7L6BWlV6VqKrjDLBc+PTLVAk
	jVirPP6XtUUMTAi6phZ1nGhBIHfcseWp0vjw0Avu5deeySv8l1tDysOit+kQO+F0
	OBlwNtc9NvBnoAojmi2mKMtrU=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHBDkQNAZpNmGwAw--.59274S4;
	Sun, 02 Nov 2025 00:23:47 +0800 (CST)
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
Subject: [RESEND PATCH v4 2/2] PCI/AER: Use pci_clear/set_config_dword to simplify code
Date: Sun,  2 Nov 2025 00:22:19 +0800
Message-Id: <20251101162219.12016-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101162219.12016-1-18255117159@163.com>
References: <20251101162219.12016-1-18255117159@163.com>
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
X-CM-TRANSID:_____wCHBDkQNAZpNmGwAw--.59274S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyDAFy7AF15tw1kJr4ruFg_yoW5Xw1UpF
	W3AFWfAr4UJF15ZrWDWaykJwn5AF97t34fKr93Kwn5XF48uFZrJ3sav34UJ345KFZ5X34r
	Jws5Ka1rZF4UJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE2YLgUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:3c54:eb11:a795:c9c9]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiFQj4o2kGMU41FwABs1
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
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


