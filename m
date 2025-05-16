Return-Path: <linuxppc-dev+bounces-8614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623FABA14F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBn5NhYz30Jc;
	Sat, 17 May 2025 02:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414593;
	cv=none; b=RGwZkrNClSzIwwo+OB5Gb9KrnDfGSRofE4clE640QcQAUfCl+hUl0JDYHveOA0rAEU2x/vahsXDZZZaRrNopgcQoMfMenrFkmXlflblB9eVfrVWc+Gv+EgZPpB7vmVYbEey67P0PKtGwCY+NZfDRifmC1dg3IhIMNUpOcTI9UlUiePUG8gv6DhBvqrtP8OcJnkWMzNCMGoxYsV5Ivt5/5ktoGkUnXxURYzf0HgT8Hiw1SLxFY3Jpobr0F2sQy7csVCbuNj77dDVt3bVig4F6OxLUXN3NRtShu1ng6nBeV3K+eP6SpDHOhgu/gK8T+cje7wDiNP8JaC68Y9sNuyP7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414593; c=relaxed/relaxed;
	bh=CtnFyydU4fr89wS3U8rjM2P3apj75aODrTPV9Nlg/9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fF6GW6uCuV8dW7RwGOcnp6BXnX9E+bVKv4bAZyH4OKLePWrsSFnm9VIsboxXmJVjsulsbStv1sTuzSzWYZfc3QszB2Yj9DkLUlLjTH05/TbNIWbKq63yK7GbMKYWC4tTiXUu36/ZruQsN1L73EfrTM4OlZCTr3gd/LKelXK7D0EIo4BfsPNn74cBGvYxxdetmzUEEP1l7Rycb2vCavSURIFN/V4cw/nLazBEEC66zhlESEX7X6u8FrgY4rrRzU2Arn5AVzHUpu7H0+q0C54stm1pLYSE3y7RPPRrW/wKZxNibImmiW3Y7BhO5yMJ7OZOm49Oi8JtYqK8KGv/vhmwgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=paU10sG4; dkim-atps=neutral; spf=pass (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=paU10sG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBm3Wr5z30HB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:56:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ct
	nFyydU4fr89wS3U8rjM2P3apj75aODrTPV9Nlg/9Q=; b=paU10sG4czve6u6TW9
	Www1Izjma48yhpYZWV9CNfchPXUSpiDjZvbkroqrtE8hhV9OorB95yW+2PenX1aW
	LG764BB3rg5xTqRPIetuVVl4qmusY0yWP1lhlzlsfnjLw7eXT5mxblqCnLLoFaK9
	lfr/pvUHZ1fjlqEBPLoeLkuds=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3lOX6bSdoVElgBw--.64634S5;
	Sat, 17 May 2025 00:55:24 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	tglx@linutronix.de,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	mahesh@linux.ibm.com
Cc: oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Hans Zhang <hans.zhang@cixtech.com>
Subject: [PATCH 3/4] PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
Date: Sat, 17 May 2025 00:55:17 +0800
Message-Id: <20250516165518.125495-4-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>
References: <20250516165518.125495-1-18255117159@163.com>
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
X-CM-TRANSID:_____wB3lOX6bSdoVElgBw--.64634S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1xCw1UCr4fAr1UZr48tFb_yoW8ZF43pF
	Z5J34rAr4rGF9YgFWkZ3W8Za4rZ3s7t34rJFWkG395uFnxAa45J3s3AFyUXFn7XrWDuF1a
	yFy5tr13WF4rAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmc_fUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwlPo2gnaDaNVQAAsj
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hans Zhang <hans.zhang@cixtech.com>

Add pci_aer_panic_enabled() to check if aer_panic is enabled system-wide.
Export the function for use in error recovery logic.

Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/aer.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 8ddfc1677eeb..f92928dadc6a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -959,6 +959,7 @@ static inline void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge
 #ifdef CONFIG_PCIEAER
 void pci_no_aer(void);
 void pci_aer_panic(void);
+bool pci_aer_panic_enabled(void);
 void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
@@ -970,6 +971,7 @@ void pci_restore_aer_state(struct pci_dev *dev);
 #else
 static inline void pci_no_aer(void) { }
 static inline void pci_aer_panic(void) { }
+static inline bool pci_aer_panic_enabled(void) { return false; }
 static inline void pci_aer_init(struct pci_dev *d) { }
 static inline void pci_aer_exit(struct pci_dev *d) { }
 static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index fa51fb8a5fe7..4fd7db90b77c 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -125,6 +125,18 @@ void pci_aer_panic(void)
 	pcie_aer_panic = true;
 }
 
+/**
+ * pci_aer_panic_enabled() - Are AER panic enabled system-wide?
+ *
+ * Return: true if AER panic has not been globally disabled through ACPI FADT,
+ * PCI bridge quirks, or the "pci=aer_panic" kernel command-line option.
+ */
+bool pci_aer_panic_enabled(void)
+{
+	return pcie_aer_panic;
+}
+EXPORT_SYMBOL(pci_aer_panic_enabled);
+
 bool pci_aer_available(void)
 {
 	return !pcie_aer_disable && pci_msi_enabled();
-- 
2.25.1


