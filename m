Return-Path: <linuxppc-dev+bounces-8682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F134ABC9DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WH16N46z2yrV;
	Tue, 20 May 2025 07:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690621;
	cv=none; b=X+n+xZFvyKd6ofvHQAGwYeQ6sLXqjKWO3OXZBX3gpIySMfyXxKyJ/wy2Sp1wOaSoTa8UaJpREQY/4MpnnR8x9YEF1p7muWhfbWtt3Gjh3Fiyi9CShrLHsnAo/XKS3HjjvrT3WAgjz8KRHm09APcIUYMQjFBPAalUMOuuL/yRXHSrwOwDdUR7xyO71Bi2u2IDE5k82HDYe4phx+d/Z7fqCxik5dfVHkCElLC/MEY12qeBccN2tL2YN3clYa+ssdl8P9Gn8ByyJ+sWQeRGuQfmDfMFbJCcC4PUp4iQyVtLUwUDNYPG9Rka71yFXGYQGq9rq5ZkkCVqHHuDddB5hbP7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690621; c=relaxed/relaxed;
	bh=H5R9jAuG+gFkx4xyNCjDjkepmNItfSXUn31T3YwE2KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKySuRgkAtCc7ChEswXloDn0wM1rWy/Y1/c2Kmkeb4Ba+Jxb4ud4KQFwYa02DOmGT0usx86VkOWWYqsuH/sDjPr4Ow6Q12Ld7Ff77VUWpyohGkDhzij1QpXHeJws7nYc2kLrMuRysB8/HJWML9LIx0CGVwmr1z7Os3M/O3Y6D6kNB6yey6bzmYFH0LVpvssNT1HAxyLeUapa/RliByKOuGVs6S3666GhkAO2Ka0Cmzbfgnt9F6VFzVMxSt5shEQEVw/eO1ZLzuDIllu5HAtwvLQ3Q1+BW6Boih/OWA12y52I9kuKKHSlDQTF8BNPR3CkJTn5IZiHOri3soMpjUXBgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e0u+lzw8; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e0u+lzw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WH10fZDz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E93A5A4870C;
	Mon, 19 May 2025 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D435C4CEE9;
	Mon, 19 May 2025 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690618;
	bh=A1yGfiEGjU/jCFLLlMoihWTgBNPiIjwSNSe9WDii04I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0u+lzw8mDvA9gp+eW5zaUTMK0Yi1JFv7zXkVhXfkvjhywdPzm3i6FkxnY/W5BMhf
	 o9js162JL5kbYNpLaZ2Z4NpqGKhJGWDLa4Mk26f0Zd7JGJrz+ttfR2UP7q+z1zvs86
	 3mskUEo8sBxYpq0Tli0DkBX6WDmGDRwpMGkBE7y62gkAzroOgWt4FmhTC7iV8mvpL0
	 zSHTVwK/lC3UnYDlIqFtfbaymQcBWk4CkQrm3he+H3bnRisxkBZ+ue5iW0Kj5XXvlR
	 kGLvwaULc7n4egAQd9sxJ5ejSLW3czHNk71051pve/VlFo6Gulg7eFYyE7kyrSm18F
	 R7bHyL54YolvA==
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
Subject: [PATCH v6 05/16] PCI/AER: Rename aer_print_port_info() to aer_print_source()
Date: Mon, 19 May 2025 16:35:47 -0500
Message-ID: <20250519213603.1257897-6-helgaas@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jon Pan-Doh <pandoh@google.com>

Rename aer_print_port_info() to aer_print_source() to be more descriptive.
This logs the Error Source ID logged by a Root Port or Root Complex Event
Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message.

[bhelgaas: aer_print_rp_info() -> aer_print_source()]
Link: https://lore.kernel.org/r/20250321015806.954866-5-pandoh@google.com
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index dc8a50e0a2b7..eb42d50b2def 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -733,8 +733,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
-				const char *details)
+static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
+			     const char *details)
 {
 	u16 source = info->id;
 
@@ -932,7 +932,7 @@ static bool find_source_device(struct pci_dev *parent,
 	 * RCEC that received an ERR_* Message.
 	 */
 	if (!e_info->error_dev_num) {
-		aer_print_port_info(parent, e_info, " (no details found)");
+		aer_print_source(parent, e_info, " (no details found)");
 		return false;
 	}
 	return true;
@@ -1299,7 +1299,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 			e_info.multi_error_valid = 0;
 
 		if (find_source_device(pdev, &e_info)) {
-			aer_print_port_info(pdev, &e_info, "");
+			aer_print_source(pdev, &e_info, "");
 			aer_process_err_devices(&e_info);
 		}
 	}
@@ -1318,7 +1318,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 			e_info.multi_error_valid = 0;
 
 		if (find_source_device(pdev, &e_info)) {
-			aer_print_port_info(pdev, &e_info, "");
+			aer_print_source(pdev, &e_info, "");
 			aer_process_err_devices(&e_info);
 		}
 	}
-- 
2.43.0


