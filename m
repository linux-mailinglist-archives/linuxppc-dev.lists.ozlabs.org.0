Return-Path: <linuxppc-dev+bounces-8688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2745ABC9E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WHC4ydlz30M0;
	Tue, 20 May 2025 07:37:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690631;
	cv=none; b=SvquodCknFCwEuTF4yt+ow0gQDXqq9txldTKtdlf1ycywhZT392F3IRVc27TMzQym/vEU4WVbcr2KAdk6rqojfxarqv3ozNmoWYtzZy2vo/NCqIX+WTlIC1XtTfi8df+2HxCe0UxfuQV/LXCzAE0gsj5cjeZ0IqApeqFSBbKt0ayQ6MumKFvtZO07sr9IG9siYYnlvE+jv5wgMX3T16WNK6SbjAH0B2JNA15LJJHWhJH754pmnDYiBF19gyS23Dh5tKPPE9j3QfY2I1lHHtEwxKyPhNqWUGatDRX+6c2i9msaburDPhEu2QWKNzdKGj2igjdzBKmseP6CKIFLOTryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690631; c=relaxed/relaxed;
	bh=ki54CuSXStVFvo++TeZBDU46PItz7oi3VWBisZ9ycuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZyIOyJ7c7Hr/kB+St71QeobRDANjnQz67vuZZ6wG/HyZ/y4kfOhu/s2Fz+oPORdZ+4xOD+LEtv0vafBEjGaAfvzDk1peXAIgXudgUhZtHu65W8PRmYasZJE1zrpAoEPsKqnD5kCRGDcqSjrEEoqiOnBAGQIIHnGUylB/vxGXaW2OREAwpgDZpBCdN0UkL+YvSFqum2yloy8EmBquj8ksBBMYz+5O0zs1xIDPC1BqUDvvmQlpH8B4FVu6jj9PUImx3+Yp2V8STLV28Mn6f0MocVgYjLGdVd5qA+WDlvtSsWTpCPSHoPuimww6sSyD4qtVPuLkQlVnWKOWSmdoGw+MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VwkJyDWm; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VwkJyDWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WHB5fC4z2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FFBE629E3;
	Mon, 19 May 2025 21:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CB8C4CEE4;
	Mon, 19 May 2025 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690628;
	bh=0fgRb7smdbJxtWhXJfFNuU3g4uIG5BjvmPrF/6j6wsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VwkJyDWmVXRv6RpivqQ72Uim6E032744c1wHkxMcbh6KKd7y52KCcVF9wBOMgrFh/
	 xViYGysieiKy/ajE4DERSli4ABxri9lJVuiEHwlZfu2SCI3U1vJj2v4hBC++yQD2uz
	 pUp5oB/EECi2miKsALvnvhmu7vYrPVyDcePX/+bIk9mEMUvpCYiy6hSyKKG9UF4HWA
	 fXI9ZrsjvlQAr/8aH63sBsGZu92ngd5DF2PtCSNY+21WCmisfP3jDpylnd3RYMiqhg
	 dxuiOeT3uH8UBCLP2XDnfbe9gLJAB+tq4y+NaLxYTuYK3YN16OXzYL7syC9qFLQ/u8
	 /L+YvRDIMZ7UA==
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
Subject: [PATCH v6 11/16] PCI/AER: Check log level once and remember it
Date: Mon, 19 May 2025 16:35:53 -0500
Message-ID: <20250519213603.1257897-12-helgaas@kernel.org>
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

When reporting an AER error, we check its type multiple times to determine
the log level for each message. Do this check only in the top-level
functions (aer_isr_one_error(), pci_print_aer()) and save the level in
struct aer_err_info.

[bhelgaas: save log level in struct aer_err_info instead of passing it
as a parameter]
Link: https://lore.kernel.org/r/20250321015806.954866-2-pandoh@google.com
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h      |  1 +
 drivers/pci/pcie/aer.c | 21 ++++++++++-----------
 drivers/pci/pcie/dpc.c |  1 +
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62..705f9ef58acc 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -588,6 +588,7 @@ static inline bool pci_dev_test_and_set_removed(struct pci_dev *dev)
 struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
+	const char *level;		/* printk level */
 
 	unsigned int id:16;
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 4683a99c7568..73b03a195b14 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -672,21 +672,18 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 	}
 }
 
-static void __aer_print_error(struct pci_dev *dev,
-			      struct aer_err_info *info)
+static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
-	const char *level, *errmsg;
+	const char *level = info->level;
+	const char *errmsg;
 	int i;
 
-	if (info->severity == AER_CORRECTABLE) {
+	if (info->severity == AER_CORRECTABLE)
 		strings = aer_correctable_error_string;
-		level = KERN_WARNING;
-	} else {
+	else
 		strings = aer_uncorrectable_error_string;
-		level = KERN_ERR;
-	}
 
 	for_each_set_bit(i, &status, 32) {
 		errmsg = strings[i];
@@ -714,7 +711,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
 	int id = pci_dev_id(dev);
-	const char *level;
+	const char *level = info->level;
 
 	pci_dev_aer_stats_incr(dev, info);
 
@@ -727,8 +724,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
-
 	aer_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
 		   aer_error_severity_string[info->severity],
 		   aer_error_layer[layer], aer_agent_string[agent]);
@@ -774,9 +769,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	if (aer_severity == AER_CORRECTABLE) {
 		status = aer->cor_status;
 		mask = aer->cor_mask;
+		info.level = KERN_WARNING;
 	} else {
 		status = aer->uncor_status;
 		mask = aer->uncor_mask;
+		info.level = KERN_ERR;
 		tlp_header_valid = status & AER_LOG_TLP_MASKS;
 	}
 
@@ -1297,6 +1294,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 		struct aer_err_info e_info = {
 			.id = ERR_COR_ID(e_src->id),
 			.severity = AER_CORRECTABLE,
+			.level = KERN_WARNING,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
@@ -1312,6 +1310,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 		struct aer_err_info e_info = {
 			.id = ERR_UNCOR_ID(e_src->id),
 			.severity = fatal ? AER_FATAL : AER_NONFATAL,
+			.level = KERN_ERR,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 315bf2bfd570..34af0ea45c0d 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -252,6 +252,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 	else
 		info->severity = AER_NONFATAL;
 
+	info->level = KERN_WARNING;
 	return 1;
 }
 
-- 
2.43.0


