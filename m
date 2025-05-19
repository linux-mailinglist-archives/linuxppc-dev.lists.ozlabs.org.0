Return-Path: <linuxppc-dev+bounces-8689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE1ABC9EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WHD39cPz2yqg;
	Tue, 20 May 2025 07:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690632;
	cv=none; b=BvshrmglB0YK5Cqwq7E9dHvI865fdpYN7BaZ5UpbYVUgwdUmUq6KGswAcY7PDNW3c+JkvF5tYEzTCsJjk919oKp84YKAgr3Ft91nKEglhPQvsnQu3BcDf6vcufA0FEwnl8blmA691TwaN2bdo4PGiH5rQ4bqr9/L5yc6WodrdL9QQ5tVil7xTBUUKZRrt4o/1t57Tal7+hkh0b7QUGXzyhV1TM5sPhPj420MiUVjrqH5dbMinbp5ztOG2UCF7WLcN8obUdH2v2ltIU5cM8DvCtptnv+yEgzoh5mELtfrlxzPntOqxTM1jmHe5uI/4dr5P7Vab6AhCsqbdxrwMwAwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690632; c=relaxed/relaxed;
	bh=g/SA4SQ1OE8z7XIQ/3G1qTTsPY0GjAzcB+KmjUPnO8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSDQg8ON92NTof+r3ZBDtnnHuV6Zqgi6BKnw6J0RrfT21HPczLUcfxlkS7nQIY0DVlWUC8kjV+3VTQ2mcEpte33HCfkxVbeWG9Q7Ra1/5m2fCS4mfJJhAx8744z1S285i3t63k1vSU7Njm82TRhXio9HMCm4ZEzKvI6bArLComl+F+4Llo2VAWRfezYV1dlnRYhs1KrALlBZZwGiEWqIeXgga+AcpwX+HBXcXqMYu8teBl30gw+m/rXLbNw5GOfV79zKg2oQJz/Z1ychCRU21Ru/5z7ayg/4YMFwFbrge4JKRDy9+TsmvR1vqikiR3lfdqAyjyqxbsSwKJrG9ooD9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i3gP4m9a; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i3gP4m9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WHC5k6Mz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F01A8629E7;
	Mon, 19 May 2025 21:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8109EC4CEE4;
	Mon, 19 May 2025 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690629;
	bh=wOlbd/AhG2UEes21QN0n7WyeptntoS/yWob+FRL5Zr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3gP4m9aPW2NsVE0xy/MHN/v0To6ljSLAxEBCwGF4MfF5EU8G3soT+MZBuMT1XmkQ
	 gPwl0jolukEG+ok4nCEziW/vgY6CUiu46p9Mb3n6tv8An5fzPgk69f8gUZ2bKJ7ZtE
	 BonoNkfpV/Q8FpsCbecgLiOvewlHuPnS+FLXq72RiyvMFfQ8G9g4he+YUmib8GNeRW
	 rUd2GXGM/IcI5tGX3LVmFcpjw57h6qRMye5WD4/f/BQmPdkvXcj3umMqdT7JeEAeu3
	 qpeAnioifLP4Kiysktj1aIPLtIk+dyaRW+LryYsqJFtCdhXF+g2/hu9Yj2qy+lExzj
	 URhun88hwlWjw==
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
Subject: [PATCH v6 12/16] PCI/AER: Make all pci_print_aer() log levels depend on error type
Date: Mon, 19 May 2025 16:35:54 -0500
Message-ID: <20250519213603.1257897-13-helgaas@kernel.org>
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

Some existing logs in pci_print_aer() log with error severity by default.
Convert them to depend on error type (consistent with rest of AER logging).

Link: https://lore.kernel.org/r/20250321015806.954866-3-pandoh@google.com
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 73b03a195b14..06a7dda20846 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -788,15 +788,21 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	layer = AER_GET_LAYER_ERROR(aer_severity, status);
 	agent = AER_GET_AGENT(aer_severity, status);
 
-	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+	aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
+		   status, mask);
 	__aer_print_error(dev, &info);
-	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
-		aer_error_layer[layer], aer_agent_string[agent]);
+	aer_printk(info.level, dev, "aer_layer=%s, aer_agent=%s\n",
+		   aer_error_layer[layer], aer_agent_string[agent]);
 
 	if (aer_severity != AER_CORRECTABLE)
-		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
-			aer->uncor_severity);
+		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
+			   aer->uncor_severity);
 
+	/*
+	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
+	 * tlp_header_valid is set, and info.level is always KERN_ERR in
+	 * that case.
+	 */
 	if (tlp_header_valid)
 		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
 }
-- 
2.43.0


