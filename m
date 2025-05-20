Return-Path: <linuxppc-dev+bounces-8785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0329ABE663
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xw2Hhjz3btm;
	Wed, 21 May 2025 07:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777872;
	cv=none; b=fKy3gAFmua1EXNQqjyirUQdurO8l08ZmHD5veHd+RYLiOx56OadIvgDY5sqNnAhPG0K1cUXhk8y7ys6QT0GQ+l6r7Q4hxLkjZ3i9l2aJ/xcwtjWB4q+4NI0Fbt2boQRDmECmH2XnIg0/yKdnL9L5ZcLh89TY44bhummBtpQ9IxyZvAhmKMNgnHQfWKjHOg/QzE03O/y/9woL82pP7En5u5WevjMids+XgjV7bd5h+dVmv8sW2YkC624JOQ9BSjD6EjhJ4bXM72yQ3NeaK7sJHewKyZ1kDR+n70l4sUbvXtq+T1K1hD3NqvT5GPTv8XizH+bK171vsDswC+ZbsV1dZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777872; c=relaxed/relaxed;
	bh=mktW0UapS3Xy8LObQTEYU5aDRipXWY+j/uMtxBkjSqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8m6VwtWdvaYJ8Sq7OwHV3FVhTPcqQKfvuQ/MeXbjV1yMSOyzGYNPHAqnNwQnMBRtC2KQh8wnvTYHZX4cjTojebWZTtR28z2BXhz5gqCA9JWgFPU7uSoBBibqBopMfHPS01GbTi8EVzI29sMdxkjHL2V4lJNkji3fjOm4Tpeob1/G6ujnHBWuMjXKF1eB0rygQ3uALK4ZWt6fa45wgsNVEQZxqZAILZuydJQRkZjbAQ62Zj/JEkiFVLKGycbaoa6/Dem1CL1d5ldTB9RUjz21eNyxEePgV2AgbeZAmFp4KwwhsHpHNKoB03R7hw2FPjn+H8KDB0w2/vBnI32gs+WdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDX/ceat; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDX/ceat;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xv55XZz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3582749D3A;
	Tue, 20 May 2025 21:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FB6C4CEE9;
	Tue, 20 May 2025 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777870;
	bh=VOB2b3yR/XL94yR1QcwLj8iKG5CHPulVDQ+iGoEI/Z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDX/ceatoNqgHR/APyaEExsPyXJdaazXM5ZfE80V69b+ae77sOEFukiizxBhBVpb3
	 wtFDfHnkruZ/tSi8jtQIN1SpEjYPJaQ2JdYb7o4XbBJ1F+xlh513Yy70HnY4U8BCML
	 dETE8LzFkaMJ0dYwlMR7PrkIDbn5SYmcyqqDYaRfINLHFESJ8K1xONgYhH4OxsF7wD
	 /YFr9QUCnYE7X2d+/L2x6PRS0I4B/t9uqzfLlilkaKuRmIQfSRdKngngDnWwOm4r/M
	 JPD8Wo2mw7GrynoyzT+WBi57xr5DMB6JdEAP+aA2jL21qspNEHhWKTlKq3Swp8urPt
	 uV4m7pv5NXDTQ==
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
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v7 12/17] PCI/AER: Check log level once and remember it
Date: Tue, 20 May 2025 16:50:29 -0500
Message-ID: <20250520215047.1350603-13-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520215047.1350603-1-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
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
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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
index ec63825a808e..f5e9961d2c63 100644
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
 
@@ -1307,6 +1304,7 @@ static void aer_isr_one_error(struct pci_dev *root,
 		struct aer_err_info e_info = {
 			.id = ERR_COR_ID(e_src->id),
 			.severity = AER_CORRECTABLE,
+			.level = KERN_WARNING,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
@@ -1319,6 +1317,7 @@ static void aer_isr_one_error(struct pci_dev *root,
 		struct aer_err_info e_info = {
 			.id = ERR_UNCOR_ID(e_src->id),
 			.severity = fatal ? AER_FATAL : AER_NONFATAL,
+			.level = KERN_ERR,
 			.multi_error_valid = multi ? 1 : 0,
 		};
 
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 9d85f1b3b761..6c98fabdba57 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -252,6 +252,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 	else
 		info->severity = AER_NONFATAL;
 
+	info->level = KERN_ERR;
 	return 1;
 }
 
-- 
2.43.0


