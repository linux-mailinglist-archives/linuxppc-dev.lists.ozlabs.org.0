Return-Path: <linuxppc-dev+bounces-8679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D4ABC9D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WGx2hJPz2yqk;
	Tue, 20 May 2025 07:36:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690617;
	cv=none; b=li0n3RdhnjgFsstyJMTaOxMWse8uU4yFtZwuqzh6Z+olvNOMRZzg3eEi0AyYB0RbmuS2FMcU5DTUXOh3jHcsK/RKmZx+CGhLDtgI3xfI3Mnpw+Q9jl7eLmIJa5/YGt+0Zs+k/kRpBvL4zjR1BdWR8EA67CE3H+WZv0TpOJlI16T9h8NOs5yttf3Wdh86Crh1oh+PNeUZHUE6EZ2100NtWRcXtvcsTe+b/3RQa4Nrtup2J89IUSQJrTeD5ZbjenwctEGiXOAquIUlufX5wo5jKUYEyi7uJbeqWRypIaWLQH2X0ImV8r5UhvniXj5gcHPUf4Z6/zo0pQY3Ux5g7zm23g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690617; c=relaxed/relaxed;
	bh=ax5H9YQSoziHNgWbc5WsCDjIQ3jAnk8sP1e1KToJyOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iViilOtjMnJ9WhHDKYLu0Jr6Yhuo9E6EJuNtOaRfOTu1XUDpA0263CaVJDtTIXMFm9BwfbXS8A7m5w0CNH2uSus+as+VihXvh/CvN349gBEl5Vsh7IBI0d4U9dEz3hk3GV+vXVI7jweY/rQ1+8v02YGDJEYCSfIAAyFuCIzlv0wFNwPuRpV12DyvKn3Prw1alkJRjGEWIH+T5JTtC04SrF7y03j8SrDPMOe976cmr2E/cfZ8/Cfo3n9DNZmCDvQa6Hby1AJLWgC67YacY2tZZS7sb+L3a6rp23t5Q0VSxfWm9a4bave+0HHWQon++NY2ZXXtauTsTkhCdUXhBqgHPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bDLiRZen; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bDLiRZen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WGw43pFz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:36:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A7CFA435CA;
	Mon, 19 May 2025 21:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9287BC4CEEB;
	Mon, 19 May 2025 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690613;
	bh=+bqxRBjhgwSoTFiDYStp5ueMmN82QsImzLSTRRiEMWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDLiRZenfvqKwifJYzTamJzuhJ1agNDwCXkYwMZEMv2Srorta8c1cGqCf0yxstMFW
	 X/TWtWIbwXunZP7Pj3foV7nPc5bOv90eWWp4RczOrIFyjVpd99A3aHh7LN5rxF4Oo+
	 eD+/GRgmt81Pw4Bs2c26xYu7/4lSa3a9ZWwsux/sUfl8rQYmAqdLmG/DUm9gydcDSG
	 I3qBsBg5xSIfPQhAOimqMY4/Dg+Wmmxlg62iPYSY3R4C3nCSQSgvvcYZD7lLQV4WV2
	 VMVZ7m3TdA98NXehGK1m6mke9uxfmGe9mrcSOd22y4Ytwy1s8+F8z9Z5NM2n604iq5
	 y59RovsT1PPGg==
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
Subject: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
Date: Mon, 19 May 2025 16:35:44 -0500
Message-ID: <20250519213603.1257897-3-helgaas@kernel.org>
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

From: Bjorn Helgaas <bhelgaas@google.com>

DPC Error Source ID is only valid when the DPC Trigger Reason indicates
that DPC was triggered due to reception of an ERR_NONFATAL or ERR_FATAL
Message (PCIe r6.0, sec 7.9.14.5).

When DPC was triggered by ERR_NONFATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE)
or ERR_FATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) from a downstream device,
log the Error Source ID (decoded into domain/bus/device/function).  Don't
print the source otherwise, since it's not valid.

For DPC trigger due to reception of ERR_NONFATAL or ERR_FATAL, the dmesg
logging changes:

  - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
  - pci 0000:00:01.0: DPC: ERR_FATAL detected
  + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0

and when DPC triggered for other reasons, where DPC Error Source ID is
undefined, e.g., unmasked uncorrectable error:

  - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
  - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
  + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected

Previously the "containment event" message was at KERN_INFO and the
"%s detected" message was at KERN_WARNING.  Now the single message is at
KERN_WARNING.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/dpc.c | 45 ++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index fe7719238456..315bf2bfd570 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -261,25 +261,36 @@ void dpc_process_error(struct pci_dev *pdev)
 	struct aer_err_info info = { 0 };
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
-	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
-
-	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
-		 status, source);
 
 	reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
-	ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
-	pci_warn(pdev, "%s detected\n",
-		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR) ?
-		 "unmasked uncorrectable error" :
-		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE) ?
-		 "ERR_NONFATAL" :
-		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
-		 "ERR_FATAL" :
-		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
-		 "RP PIO error" :
-		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
-		 "software trigger" :
-		 "reserved error");
+
+	switch (reason) {
+	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR:
+		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
+			 status);
+		break;
+	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
+	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
+		pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID,
+				     &source);
+		pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
+			 status,
+			 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
+				"ERR_FATAL" : "ERR_NONFATAL",
+			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
+			 PCI_SLOT(source), PCI_FUNC(source));
+		return;
+	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
+		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
+		pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
+			 status,
+			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
+			 "RP PIO error" :
+			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
+			 "software trigger" :
+			 "reserved error");
+		break;
+	}
 
 	/* show RP PIO error detail information */
 	if (pdev->dpc_rp_extensions &&
-- 
2.43.0


