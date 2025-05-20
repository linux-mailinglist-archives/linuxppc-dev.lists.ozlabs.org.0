Return-Path: <linuxppc-dev+bounces-8786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B74ABE665
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xz1ZJlz3c2q;
	Wed, 21 May 2025 07:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777875;
	cv=none; b=SmHeJQWOShORvLTk4GSKBWD3tup0AeP+IMyPhKsnAJPvNaXnV7o0Pa4C6QNMbynezlX9weosGMRqAuhq5tCmk9nl7w0O1LdCiuWFTsVeL1asOkuG2uauAxTczNoTs507gjtwPuOGbcyDf6G7f/bqHj6brWuekqz3FkU5CUScomA7z88cyut3QTswU8QzvL7rZJtwDaW2DWAxHH1Oiu4z3/SizWEmwXTlLX2tKCLEUgINKANFVAnKo3u7a/hvhyMZvpJsDtiSavAaG8GLxqobC0qDXbpLuTmZyiNK5Fk3L/G84vH9Vpc4iJFgxK0xUHy9ruZdLROLLNPiQE5ch5t1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777875; c=relaxed/relaxed;
	bh=+OI0ybHkR9L5eODyEvrW1+4MhEsn63dz9YHBIpYQRGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfbYJTLU0BctE+IFixvIXN0h6rS3ZCjkcyuGtX/3a6PtBW8Qe51TE5oM+Maotp6zPba2YNFP7Su0t32AmQqMcXCjgkXCVMDCy23fjQYia6+cLWmPI6NgzxXLItOnz3kiXOBmjyTKLW+7NitVcGG7Rw0UBrVlb/EctjvPbpY8AFdGRJZeiv0+5ICB0q95zX5EIZAhUkC+GJZDNnR1e3oqRcd2xuPQfCqYSNO/DIbnJ4hvWG9V439LWL/rWmjSmfaMp3vC3GEeZgISMWEtaWcjAh7e3PMKrHiceo4aHDAW/PUCSPY8wFRW7bY2Wfg/uEwyA6WMwcnr08PcArAsRYqeGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4ZW88H4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4ZW88H4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xy3MQvz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFBEF5C5ACF;
	Tue, 20 May 2025 21:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E06C4CEED;
	Tue, 20 May 2025 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777871;
	bh=TV22lSmYNsCCExGd1j0mHjuH4gWfFSn4U6wx2afxjL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4ZW88H4hxS326i1EeQIiK+H1Q+gArBBUrNWoPqbJZCa7HS3VJAat4rC4SB9BrI97
	 bpfxxDrVlLkV+juTBtt4xJLy6x3pcVZ07+ZQeAJXekdYFc7n5f4AqAqY6/NKF1d6x5
	 +Iv/LhgJcot8ng2Srn3XfmRj01V5uBS+49c+v18E2Ylf+lF1O0zCEC2APyRCgm8kah
	 KoCTWwtGFLR/mF65v0udZlw1FAZG5TqXKWE2EHktSbL3btLVsCXxRQqdddretuEgQk
	 Svx/0R2VTisy72B+o9bBlfKRmfeSOaRzCS2HDIS0QoW0S8WNgiSn3AIoA1c+3xXhDc
	 Kfq2CNJtmPkng==
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
Subject: [PATCH v7 13/17] PCI/AER: Make all pci_print_aer() log levels depend on error type
Date: Tue, 20 May 2025 16:50:30 -0500
Message-ID: <20250520215047.1350603-14-helgaas@kernel.org>
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Karolina Stolarek <karolina.stolarek@oracle.com>

Some existing logs in pci_print_aer() log with error severity by default.
Convert them to depend on error type (consistent with rest of AER logging).

Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f5e9961d2c63..4cdcf0ebd86d 100644
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


