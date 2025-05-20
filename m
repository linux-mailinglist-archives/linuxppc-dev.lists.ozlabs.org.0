Return-Path: <linuxppc-dev+bounces-8784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF072ABE65F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xv2h3dz3c1Q;
	Wed, 21 May 2025 07:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777871;
	cv=none; b=mrr6cZwq4NOtqCjmeJQJevn+ONBm5m+mklQUMrCCJfmVhwGwinGRy9G9FFnrwxvXmRSStbcVhqw4/3pfNto/hXecjFpcOGkzJjieczgHAisr8aAR2wGXoSUtxtyZkMH3bIgxAI2I1ooeJhkeshk++WWLOnQnXznSFtAve81E9iUBg20XbASyxEhWvLdHeZ9R8Ikzp6YLshOkLeC3pYZMR3peoNm+Vr+vbPtnCvUVGizInNZeNlrXnHrKoohUXOHt2Og6VJLKKxaHA0n4l/YmNC42OyycLOFeO7ChKoXzeNOFPFjXrv335Doq/AGGsH0Sf1+5Q5IfGywm9/m/CMK45A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777871; c=relaxed/relaxed;
	bh=iQvox3JjYHdNUCFnzqCk04NkpVDluD+lWcCrIh9uE3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WI8SU/lC3QOIuVlGHqx2JvfOHOmcooWiU4Fwp/dmV++ienCmcc2RneUj+WSK9Jb/811AVx3Yj9Y4cstY4QXBhsUPuaCfTfH2/Wj+9y1W/MP4Xx5KTEwP5dU02ypmvOF9EoQcRNp7oZmpbcgG4Si+6jTNRUr31/ZenvcS18mI0gcY+8CPo8dep7Ke5c5ob2Qj3tgrJV2N8cgTCIBVazEXQBmN+BSNCbxCo+5JWQYLGxfnNZ/G5n+UzoR45AlHNuS17eIRqHqirtW+4ltczilsxw+PxxRKrGc2zBYf5F/QUkyWv9HDByFb2y1hVnTCXpAr3j8ZWw9zRsbsaqbTblAOLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qpnd0IGU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qpnd0IGU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xt4Hkhz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6E3B62A34;
	Tue, 20 May 2025 21:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E5DC4CEE9;
	Tue, 20 May 2025 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777868;
	bh=2OyCh2zUVaDfVgIXc71EE7QnrDSytlrlZxpFNHO6w9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qpnd0IGU0KMkco4HTOY3N/7EYmlfVwBg4a1niEasrtDNC5+vzTtzk/3sjV3I2QrJ4
	 dg69+MSp8x/24chJFwChm/O3zXYkJX4cOqFfD1Zlc/AImzU1vPYAxzeMpq1Fk5EYck
	 /bRfPamTA5M/jhLIzPNJiIddgAMNioxsS+j/3YWx/YumktjSKs31tziZ1JAgPviAvx
	 n+494QNjS2CwH4XARNWBgM5bfhL8l8YvesEIdyefVWXCgD1lMc5mU/8AwXlpMg8GvN
	 4WTfIdOoQumdA/BjxkmAjcaegry2ccYQSC4jZ9so8AHDbEqeacAW4tnKIGmru6G9ke
	 SHSTC783pUOEg==
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
Subject: [PATCH v7 11/17] PCI/AER: Combine trace_aer_event() with statistics updates
Date: Tue, 20 May 2025 16:50:28 -0500
Message-ID: <20250520215047.1350603-12-helgaas@kernel.org>
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

From: Bjorn Helgaas <bhelgaas@google.com>

As with the AER statistics, we always want to emit trace events, even if
the actual dmesg logging is rate limited.

Call trace_aer_event() directly from pci_dev_aer_stats_incr(), where we
update the statistics.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 53b7559564a9..ec63825a808e 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -625,6 +625,9 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	u64 *counter = NULL;
 	struct aer_stats *aer_stats = pdev->aer_stats;
 
+	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
+			info->severity, info->tlp_header_valid, &info->tlp);
+
 	if (!aer_stats)
 		return;
 
@@ -741,9 +744,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
 		pci_err(dev, "  Error of this Agent is reported first\n");
-
-	trace_aer_event(dev_name(&dev->dev), (info->status & ~info->mask),
-			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -782,6 +782,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 
 	info.status = status;
 	info.mask = mask;
+	info.tlp_header_valid = tlp_header_valid;
+	if (tlp_header_valid)
+		info.tlp = aer->header_log;
 
 	pci_dev_aer_stats_incr(dev, &info);
 
@@ -799,9 +802,6 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 
 	if (tlp_header_valid)
 		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
-
-	trace_aer_event(pci_name(dev), (status & ~mask),
-			aer_severity, tlp_header_valid, &aer->header_log);
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 
-- 
2.43.0


