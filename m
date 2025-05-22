Return-Path: <linuxppc-dev+bounces-8894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8BAC17C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PWD0YjFz3cGY;
	Fri, 23 May 2025 09:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956248;
	cv=none; b=oYhZ2ERpBYgQEXmFuNG4YIlULQ3ho5L93saZUrphk5zSjJa6ibOX8lx9mardDwMjtv5RoRFM4MaQPrurwSXO1Lp3fxK7s51+F/yN3XBOa2jyeUSzOTC4WvAm34USfNR+60jp77CmwhNoARup3WPrSiX65tt/1vNoeo/CcKCQj3co1Uok/IAfyKyD5yFEZ698KCKhoYOA/mgXBYJ26RGfUFhjKjcOKWolVzC9huRQ9Jba/oGjJZhOoqzC0oYw23yzmItBY9gGqfQ5JsjVBv7tfCmwSuBb2wdfAMyn7Ev4eSuQr844c1lLfwYqjhO1K2RWLBipv17NP8Aqt8O/yEjMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956248; c=relaxed/relaxed;
	bh=O1tEkq1il/kN1LDVfYCMn9eWAawDNIJpq4jXwQtCz3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QepNa/ak1CVxSkd+fpRmO7d6Qal8HkQs3elZd/KthglJqVdyhcM2hN3/leF2X6XCeCEUlJjyemQzb9qfYf+uU3r5N0OjlmyhN/qPFozxLX5i3hx/s03QbPaV4B1wmoivsnBVbiGHohA0+zdsgqTGVJ1LOKij0IhYN12Wdwz1g2qxBT0+5ORVWNbzbtK99Vk6j0kT18yZ0ODHQkmRt1jVfbzL+5wcykKGA9G4hKZct2rwn+kUo0nzLfxL0qLMAlBGSQNy0n/Les2ww1E2zznRwKGMB9wrSLhg19Ks1Kk2mE4CtMT48IH3D13RMhtkYBTSGXQ4TAinPiKSmoncSULqqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LrdVwkLv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LrdVwkLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PWC2NYTz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:24:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87F7162A5D;
	Thu, 22 May 2025 23:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B38C4CEE4;
	Thu, 22 May 2025 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956245;
	bh=k8jIGcmmJTsTorkecrSYGUokEgm0UmcwpovGAJ2cVHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrdVwkLvYhii/xN9pOwZjCNATgKkqRdCqFLtsUv16mwkDqRif34AdMaRz5XVbI/sj
	 GRPZnNUcIID4wGX7gOXMfBcvnnsLZLTLiansFM6UErVL+sv1Y/2AGCZNr0Gz9EqTp4
	 hKZ8jjrzKuwulgz3kYPXvH+vPXqmAAljxckOcYkmXpjoOlA1goEN+3UWjykL0AZJ6e
	 tS1Lax4V8KnwedNBSgDh5fOpgMayXDzGQNJ+T4/9I1coAOgDxkTY6Vv0lgFNOm0UG2
	 iHWSeUjaf92KrmmHoNOjD/oV6QiovkalrRvBQNK6UHu1C6eduERdVyek+362kTERzr
	 9ErhC4Rlvlc4A==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v8 13/20] PCI/ERR: Add printk level to pcie_print_tlp_log()
Date: Thu, 22 May 2025 18:21:19 -0500
Message-ID: <20250522232339.1525671-14-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522232339.1525671-1-helgaas@kernel.org>
References: <20250522232339.1525671-1-helgaas@kernel.org>
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

aer_print_error() produces output at a printk level (KERN_ERR/KERN_WARNING/
etc) that depends on the kind of error, and it calls pcie_print_tlp_log(),
which previously always produced output at KERN_ERR.

Add a "level" parameter so aer_print_error() can control the level of the
pcie_print_tlp_log() output to match.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h      | 3 ++-
 drivers/pci/pcie/aer.c | 5 +++--
 drivers/pci/pcie/dpc.c | 2 +-
 drivers/pci/pcie/tlp.c | 6 ++++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 705f9ef58acc..1a9bfc708757 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -613,7 +613,8 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx);
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f80c78846a14..f0936759ba8b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -734,7 +734,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	__aer_print_error(dev, info);
 
 	if (info->tlp_header_valid)
-		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -797,7 +797,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 			aer->uncor_severity);
 
 	if (tlp_header_valid)
-		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &aer->header_log, info.level,
+				   dev_fmt("  "));
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 6c98fabdba57..7ae1590ea1da 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -222,7 +222,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 			  dpc_tlp_log_len(pdev),
 			  pdev->subordinate->flit_mode,
 			  &tlp_log);
-	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
+	pcie_print_tlp_log(pdev, &tlp_log, KERN_ERR, dev_fmt(""));
 
 	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
 		goto clear_status;
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 890d5391d7f5..71f8fc9ea2ed 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -98,12 +98,14 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
  * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
  * @dev: PCIe device
  * @log: TLP Log structure
+ * @level: Printk log level
  * @pfx: String prefix
  *
  * Prints TLP Header and Prefix Log information held by @log.
  */
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx)
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx)
 {
 	/* EE_PREFIX_STR fits the extended DW space needed for the Flit mode */
 	char buf[11 * PCIE_STD_MAX_TLP_HEADERLOG + 1];
@@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
 		}
 	}
 
-	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
+	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
 		log->flit ? " (Flit)" : "", buf);
 }
-- 
2.43.0


