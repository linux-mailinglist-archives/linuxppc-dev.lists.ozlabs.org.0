Return-Path: <linuxppc-dev+bounces-8690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAAABC9EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WHG2Wmvz30Ng;
	Tue, 20 May 2025 07:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690634;
	cv=none; b=IXV1ks+zGCShPGIMyJuSRL7mxQosoL8Hlliy8tCgLpGHBm9mJfR91g94aLrPCqwzCBYQdMeS2ZNyNFXyBxn2/dQ94R5JWrYNbAX3f363nKVtTWeBx3HoS+m58tz4NnoZvZke0wlVhIBhSmeCmRaPeW1Ey9CH0joNXObYIHP35r9QzfSpGDybjhCo8+0A6azjhPpAshBFcJV6rmxiEqbNglGbqTSR8aLz+cJ2DylQ9yUbuMKWQKJh06HsdEz4S7eGj+UUIBxEcZoTBIcETpEjuY1T/7i04yB7vB5Au7M6WXoJaxeDwLJMwYZyMUjOAi8CpeOTsKJLNfGHF94Zl9OU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690634; c=relaxed/relaxed;
	bh=BUBT1UPOXUogMJjDgFPxOoK0PEt3C6hZeODmCdQmvv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP/Q7sfTRuqsu9ln/mkuLCKW4s8Kr8WW6E5Ndtkwf7OQC2gQjRUN+SNy0LG2xMLLSH4KjtBdf0wSYBILIFtuoydRv6FNA0ZiGkvUP7RXeUv9HoTnmTyInFH/PuSHB4WgCiMXoANerhu8tZduZ6lkoiGndZqBsNXOomgclaYX499h2bB/e5QX/C4USLAOZyZV05XPowTag2nIWeUIvTmMMYTRRtg6smrLjtmkOPD7pTMu+PgbRsPBRQ24A7eT2G6DcHOE1aAGCD9+BKINnGmKPpEU2BNqz3kap35qLAIJmaZCk2T/lo9RYq1tgavq5E1w/Bll2BVvYlVO6eCE65v5/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ScPn6Vtm; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ScPn6Vtm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WHF4FDZz2yhV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6847629E9;
	Mon, 19 May 2025 21:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AF3C4CEE9;
	Mon, 19 May 2025 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690631;
	bh=gyTffYIyVHu/5mrxLUkN3VCblYgURBDMeOg8PlZXd/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScPn6VtmrlcZmG6H6TNWgNVU8DCGTrwM66otpxLKrHpcKbsCE+7wboo7W9kWvol33
	 2EapjOnvBzOmRr/pG88R7RSFeIEoAEzLU/hYuX8rmctpOOJZhFmLXP1CTlvPNYegn/
	 z8o5kWipr4a9rk0DDNDiqS8bFjdby5Nwi6d+kkYcusyQOwSSRFApixaO+XbcT6oPZ/
	 EYUg/8lwXJDCpRtK9tiWWVX2/BjSEkjM1PcXiKWslbC1EkX1F8f5mT/0TGUyupeK6i
	 SFsEerDrrkdVvnxiprY8WKAOWqVeOvo5ibVRq2TOmOC/J4R0Q7ZQz/m96DuDM1oPqO
	 J6FifV6+H30yg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
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
Subject: [PATCH v6 13/16] PCI/AER: Rename struct aer_stats to aer_report
Date: Mon, 19 May 2025 16:35:55 -0500
Message-ID: <20250519213603.1257897-14-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519213603.1257897-1-helgaas@kernel.org>
References: <20250519213603.1257897-1-helgaas@kernel.org>
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

From: Karolina Stolarek <karolina.stolarek@oracle.com>

Update name to reflect the broader definition of structs/variables that are
stored (e.g. ratelimits). This is a preparatory patch for adding rate limit
support.

Link: https://lore.kernel.org/r/20250321015806.954866-6-pandoh@google.com
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 50 +++++++++++++++++++++---------------------
 include/linux/pci.h    |  2 +-
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 06a7dda20846..da62032bf024 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -54,11 +54,11 @@ struct aer_rpc {
 	DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX);
 };
 
-/* AER stats for the device */
-struct aer_stats {
+/* AER report for the device */
+struct aer_report {
 
 	/*
-	 * Fields for all AER capable devices. They indicate the errors
+	 * Stats for all AER capable devices. They indicate the errors
 	 * "as seen by this device". Note that this may mean that if an
 	 * Endpoint is causing problems, the AER counters may increment
 	 * at its link partner (e.g. Root Port) because the errors will be
@@ -80,7 +80,7 @@ struct aer_stats {
 	u64 dev_total_nonfatal_errs;
 
 	/*
-	 * Fields for Root Ports & Root Complex Event Collectors only; these
+	 * Stats for Root Ports & Root Complex Event Collectors only; these
 	 * indicate the total number of ERR_COR, ERR_FATAL, and ERR_NONFATAL
 	 * messages received by the Root Port / Event Collector, INCLUDING the
 	 * ones that are generated internally (by the Root Port itself)
@@ -377,7 +377,7 @@ void pci_aer_init(struct pci_dev *dev)
 	if (!dev->aer_cap)
 		return;
 
-	dev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
+	dev->aer_report = kzalloc(sizeof(*dev->aer_report), GFP_KERNEL);
 
 	/*
 	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
@@ -398,8 +398,8 @@ void pci_aer_init(struct pci_dev *dev)
 
 void pci_aer_exit(struct pci_dev *dev)
 {
-	kfree(dev->aer_stats);
-	dev->aer_stats = NULL;
+	kfree(dev->aer_report);
+	dev->aer_report = NULL;
 }
 
 #define AER_AGENT_RECEIVER		0
@@ -537,10 +537,10 @@ static const char *aer_agent_string[] = {
 {									\
 	unsigned int i;							\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
-	u64 *stats = pdev->aer_stats->stats_array;			\
+	u64 *stats = pdev->aer_report->stats_array;			\
 	size_t len = 0;							\
 									\
-	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
+	for (i = 0; i < ARRAY_SIZE(pdev->aer_report->stats_array); i++) {\
 		if (strings_array[i])					\
 			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
 					     strings_array[i],		\
@@ -551,7 +551,7 @@ static const char *aer_agent_string[] = {
 					     i, stats[i]);		\
 	}								\
 	len += sysfs_emit_at(buf, len, "TOTAL_%s %llu\n", total_string,	\
-			     pdev->aer_stats->total_field);		\
+			     pdev->aer_report->total_field);		\
 	return len;							\
 }									\
 static DEVICE_ATTR_RO(name)
@@ -572,7 +572,7 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
 		     char *buf)						\
 {									\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
-	return sysfs_emit(buf, "%llu\n", pdev->aer_stats->field);	\
+	return sysfs_emit(buf, "%llu\n", pdev->aer_report->field);	\
 }									\
 static DEVICE_ATTR_RO(name)
 
@@ -599,7 +599,7 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (!pdev->aer_stats)
+	if (!pdev->aer_report)
 		return 0;
 
 	if ((a == &dev_attr_aer_rootport_total_err_cor.attr ||
@@ -623,28 +623,28 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	unsigned long status = info->status & ~info->mask;
 	int i, max = -1;
 	u64 *counter = NULL;
-	struct aer_stats *aer_stats = pdev->aer_stats;
+	struct aer_report *aer_report = pdev->aer_report;
 
 	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
 			info->severity, info->tlp_header_valid, &info->tlp);
 
-	if (!aer_stats)
+	if (!aer_report)
 		return;
 
 	switch (info->severity) {
 	case AER_CORRECTABLE:
-		aer_stats->dev_total_cor_errs++;
-		counter = &aer_stats->dev_cor_errs[0];
+		aer_report->dev_total_cor_errs++;
+		counter = &aer_report->dev_cor_errs[0];
 		max = AER_MAX_TYPEOF_COR_ERRS;
 		break;
 	case AER_NONFATAL:
-		aer_stats->dev_total_nonfatal_errs++;
-		counter = &aer_stats->dev_nonfatal_errs[0];
+		aer_report->dev_total_nonfatal_errs++;
+		counter = &aer_report->dev_nonfatal_errs[0];
 		max = AER_MAX_TYPEOF_UNCOR_ERRS;
 		break;
 	case AER_FATAL:
-		aer_stats->dev_total_fatal_errs++;
-		counter = &aer_stats->dev_fatal_errs[0];
+		aer_report->dev_total_fatal_errs++;
+		counter = &aer_report->dev_fatal_errs[0];
 		max = AER_MAX_TYPEOF_UNCOR_ERRS;
 		break;
 	}
@@ -656,19 +656,19 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 				 struct aer_err_source *e_src)
 {
-	struct aer_stats *aer_stats = pdev->aer_stats;
+	struct aer_report *aer_report = pdev->aer_report;
 
-	if (!aer_stats)
+	if (!aer_report)
 		return;
 
 	if (e_src->status & PCI_ERR_ROOT_COR_RCV)
-		aer_stats->rootport_total_cor_errs++;
+		aer_report->rootport_total_cor_errs++;
 
 	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
 		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
-			aer_stats->rootport_total_fatal_errs++;
+			aer_report->rootport_total_fatal_errs++;
 		else
-			aer_stats->rootport_total_nonfatal_errs++;
+			aer_report->rootport_total_nonfatal_errs++;
 	}
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96..4b11a90107cb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -346,7 +346,7 @@ struct pci_dev {
 	u8		hdr_type;	/* PCI header type (`multi' flag masked out) */
 #ifdef CONFIG_PCIEAER
 	u16		aer_cap;	/* AER capability offset */
-	struct aer_stats *aer_stats;	/* AER stats for this device */
+	struct aer_report *aer_report;	/* AER report for this device */
 #endif
 #ifdef CONFIG_PCIEPORTBUS
 	struct rcec_ea	*rcec_ea;	/* RCEC cached endpoint association */
-- 
2.43.0


