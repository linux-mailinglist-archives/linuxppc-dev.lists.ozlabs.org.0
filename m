Return-Path: <linuxppc-dev+bounces-8777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBBABE654
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xh0S6Xz3brD;
	Wed, 21 May 2025 07:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777860;
	cv=none; b=CO3xvFkfe4bpeqt3WEH0NYZdjTWWdU2bIvhnSRBVxyeMX7ZwGbJkPcD2OIOteHGAwAMDVXd+rHU9MaIP3FQxtcXbGJeg9XDLSUbNEAjROXs79n1EMT3wWn4VcG7BIkA8FZ1FSQGxjzRqqimdzfFVvVPdM4zqaTRjjyZgQHyCxFFXiAHq02ojr34njpIPHF3v3lnHqD/jgClzCAm5d3oSsvIj3bYlpPfSs7lIVYOPihOXNXau0IFqJ0+1YF4Ade/FiyKpCcvG7OqGJzwK4NK31xUpsyr5AgjavvTXGVmKJE5Nxi2dEXexX8+LD4tdSx0RYV9hD66CJOJnfeG9sZWD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777860; c=relaxed/relaxed;
	bh=ZULr9/KKlXkUeczKNWyQbFOtkmsdrTDBGhHpsvovp5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVBQxp6OlJrbtM51N+tH7FjwfgQ+Vnllrl7UPJFpPyNk5ABBMz2m/j6dpScdNU5ORTISAezNEl/P0vr32pAQ2esThltyYu3ptVjizT7IBiwDk/Z9SoinqY4jI8D7TX2cLigN+V4S2afy16EweB6OTvMej4jxwi0VE2eyayzLr2evMrJbZv/FjeFvmWnjxd7ednWsDrPkk8FTUIFtQPH5iVs112yGozeCAlYcFQbH7bdnUj44OI9zNiISplEvMrOssQX8NJC1DC63/wKZoIgDjF8sLO+WteJj997EarTioJIVey0GYsppazLJzyYs6KEcjfsW5RPOCjp9OIjUH9AcHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH0tiDUO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH0tiDUO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xg2ZQFz3bpt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:50:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BC5C62A11;
	Tue, 20 May 2025 21:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E74C4CEE9;
	Tue, 20 May 2025 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777857;
	bh=KkXK+KIswYmf8YaOOqkzgFfbA3LUGmIctu6WeSPxqmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eH0tiDUOrDcsXQpewlMH7cUV24aeTrVaKrG8fTciB/DAKgCioH8pwgMEgbxidBsqt
	 7fNcvNO+4XO1BM6gH8eBMPL2n0fXUhCxFys9vGH2dyYcFDdi3SYH2UgD13M0nomUD5
	 5IHp7t3QqQhe2bRdNE5TS7furM9BCRMe31tl5g3U5FkCf1+yMVIf3FUQOiWSPqgOBZ
	 9olD+ONOuw2C0JBR8vb/yQCi31dUVsniwtzs2Gur/A7fjGo/G6X/IGP46mu+L8SHgn
	 bABCaQRo51JgpWc1dqdn8w9dRGxj9x56HNqux7IABI4lq+94dZ87vJhXgfMW6SfX2X
	 QH4HC9019jkWg==
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
Subject: [PATCH v7 04/17] PCI/AER: Consolidate Error Source ID logging in aer_isr_one_error_type()
Date: Tue, 20 May 2025 16:50:21 -0500
Message-ID: <20250520215047.1350603-5-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Previously we decoded the AER Error Source ID in aer_isr_one_error_type(),
then again in find_source_device() if we didn't find any devices with
errors logged in their AER Capabilities.

Consolidate this so we only decode and log the Error Source ID once in
aer_isr_one_error_type().  Add a "details" parameter so we can add a note
when we didn't find any downstream devices with errors logged in their AER
Capability.

This changes the dmesg logging when we found no devices with errors logged:

  - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
  - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
  + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 568229288ca3..488a6408c7a8 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
+static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
+				const char *details)
 {
 	u8 bus = info->id >> 8;
 	u8 devfn = info->id & 0xff;
 
-	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
+	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
 		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn));
+		 PCI_FUNC(devfn), details);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -926,15 +927,8 @@ static bool find_source_device(struct pci_dev *parent,
 	else
 		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
 
-	if (!e_info->error_dev_num) {
-		u8 bus = e_info->id >> 8;
-		u8 devfn = e_info->id & 0xff;
-
-		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
-			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
-			 PCI_FUNC(devfn));
+	if (!e_info->error_dev_num)
 		return false;
-	}
 	return true;
 }
 
@@ -1281,9 +1275,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 static void aer_isr_one_error_type(struct pci_dev *root,
 				   struct aer_err_info *info)
 {
-	aer_print_port_info(root, info);
+	bool found;
 
-	if (find_source_device(root, info))
+	found = find_source_device(root, info);
+	aer_print_port_info(root, info, found ? "" : " (no details found");
+	if (found)
 		aer_process_err_devices(info);
 }
 
-- 
2.43.0


