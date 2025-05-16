Return-Path: <linuxppc-dev+bounces-8609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5AABA10D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzY6r5Fm3z2yLT;
	Sat, 17 May 2025 02:53:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414388;
	cv=none; b=OMDUlimZNO6sTc2QCtPUVd57n7GWb9JHekyLEhsJdHGr5MaJA9fO66ACrYuJoOJcNCCk4P9QnMTzIZ1SOLrdIIUNCylE7TCYo3IpQ4BAcUq1HYXZbF2rsvIWuqoSt5gnzeSN7ViqPC1AJGTJNfMaCC0uYsbcG7l9sHX0X/hOkqmo7R9ih7ul4ioFcoKj+SUOJRrCOHjNBKmKgDD+R9qgNESuzUhsFq4wLqFbZo8T/ZgkxHbMPx8nrBVBouMm3BV7BPwKOIVaMMgm5ABqB13+I72r83q2Upe+bsgDoqXMxDVz/9Fhmo8V497Cy3MpH/Ktf9Xkl3IQBb7JkVYg3O3vWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414388; c=relaxed/relaxed;
	bh=W8Wyc0oz1RiDi99p1fQyjPjdTuXAIjZu9RzRSofe2HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XyYqYggtPT/aH2A3r0zNNqWafLET9jl79lMG+36KEPykv8V+sqsAiOe3R4w4f2L+U0yftn0NlSi426iSNaO42DPAFqfz/a7QD9FYrBXzYmzbanynuTj7Kn42+XqGTRSU3010VF+VURtfWrmN8+FkVNYZqwinNYMFzcgzLy22lsAbR28a9TSjJREzyLaeAMHr4mn4BxsmCeqdFeD01HLb1kQcRWfVe8j6sf3SnT2DGRvOOogNrW+laMsuQx+w/g2wu/WoyJJ0os+FuFvNfGRP6y4VToNv1slINqQbSChUH+aV7yO4Ghvq7A6M2m7JxU7Rjox0ET+B8fzgZ+OD89zKQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=P32eJtuW; dkim-atps=neutral; spf=pass (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=P32eJtuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzY6p3BPFz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:53:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W8
	Wyc0oz1RiDi99p1fQyjPjdTuXAIjZu9RzRSofe2HA=; b=P32eJtuW6/Bp95XoZs
	IcHtRPN9qh77aDMds9OrXYMKKewOwUCRYtNzFvkxREWbBQ+mxlmJeUo7y4yDNWyY
	S/NonKKTjar+aksUkUVMKuxVMsz7mL5jl+xkdT1wkPwmizOk6FLqWDm+ICdsh0xn
	nCrX0Xs6HDoHoUmmS+Ja1Fhlg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDn1+RLbSdo12CoBw--.59952S3;
	Sat, 17 May 2025 00:52:28 +0800 (CST)
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
Subject: [PATCH 1/2] PCI/MSI: Use bool for MSI enable state tracking
Date: Sat, 17 May 2025 00:52:22 +0800
Message-Id: <20250516165223.125083-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516165223.125083-1-18255117159@163.com>
References: <20250516165223.125083-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDn1+RLbSdo12CoBw--.59952S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWry7tw13trWkAF1DCw43Awb_yoW5CFy8pF
	WvvF1rAr48Gay8Gr43Aw4UZ3W3XFs8Xa4xKrW8G345Z3W2ya4ktFn5tFy7W3WSqrWkuF13
	Arn0yF4UGay5AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0hFxUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWx5Po2gnaWRfUAAAsk
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hans Zhang <hans.zhang@cixtech.com>

Convert pci_msi_enable and pci_msi_enabled() to use bool type for clarity.
No functional changes, only code cleanup.

Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
---
 drivers/pci/msi/api.c | 2 +-
 drivers/pci/msi/msi.c | 4 ++--
 drivers/pci/msi/msi.h | 2 +-
 include/linux/pci.h   | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 17ec6332cb1d..bf7ae69c142b 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -401,7 +401,7 @@ EXPORT_SYMBOL_GPL(pci_restore_msi_state);
  * Return: true if MSI has not been globally disabled through ACPI FADT,
  * PCI bridge quirks, or the "pci=nomsi" kernel command-line option.
  */
-int pci_msi_enabled(void)
+bool pci_msi_enabled(void)
 {
 	return pci_msi_enable;
 }
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 8b8848788618..82e2d13ce816 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -15,7 +15,7 @@
 #include "../pci.h"
 #include "msi.h"
 
-int pci_msi_enable = 1;
+bool pci_msi_enable = true;
 
 /**
  * pci_msi_supported - check whether MSI may be enabled on a device
@@ -928,5 +928,5 @@ EXPORT_SYMBOL(msi_desc_to_pci_dev);
 
 void pci_no_msi(void)
 {
-	pci_msi_enable = 0;
+	pci_msi_enable = false;
 }
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index ee53cf079f4e..fc70b601e942 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -87,7 +87,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 void msix_prepare_msi_desc(struct pci_dev *dev, struct msi_desc *desc);
 
 /* Subsystem variables */
-extern int pci_msi_enable;
+extern bool pci_msi_enable;
 
 /* MSI internal functions invoked from the public APIs */
 void pci_msi_shutdown(struct pci_dev *dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 51e2bd6405cd..b231cbc67a35 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1671,7 +1671,7 @@ void pci_disable_msi(struct pci_dev *dev);
 int pci_msix_vec_count(struct pci_dev *dev);
 void pci_disable_msix(struct pci_dev *dev);
 void pci_restore_msi_state(struct pci_dev *dev);
-int pci_msi_enabled(void);
+bool pci_msi_enabled(void);
 int pci_enable_msi(struct pci_dev *dev);
 int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
 			  int minvec, int maxvec);
@@ -1704,7 +1704,7 @@ static inline void pci_disable_msi(struct pci_dev *dev) { }
 static inline int pci_msix_vec_count(struct pci_dev *dev) { return -ENOSYS; }
 static inline void pci_disable_msix(struct pci_dev *dev) { }
 static inline void pci_restore_msi_state(struct pci_dev *dev) { }
-static inline int pci_msi_enabled(void) { return 0; }
+static inline bool pci_msi_enabled(void) { return false; }
 static inline int pci_enable_msi(struct pci_dev *dev)
 { return -ENOSYS; }
 static inline int pci_enable_msix_range(struct pci_dev *dev,
-- 
2.25.1


