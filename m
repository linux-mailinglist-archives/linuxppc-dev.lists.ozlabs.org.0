Return-Path: <linuxppc-dev+bounces-8885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B028AC17AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PVy15pwz2yr4;
	Fri, 23 May 2025 09:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956234;
	cv=none; b=Dy6+tCJ3EDyp9k1D476oo9I43+h9tTS50t7/YBIEpBK9u3grKfno73ahlF7F3ub/RxiAsP8YQe4aUGtHQnGwtl/GO9vZEcYblBWDzORgGkBfl6Mv84zsMZa3Tcd88hpQDW0XEdL76Co+I1g47rf0q8ZeiaYD94UR5nHObUiMrRoMXTUybV2900Jb2Kq+Nydh04AXYP4soZ4lpdXo+5uA0MloRYeBbL4DRw+aWrSig990l5QCdEGZfGEiZ+CljzB2QAqiSSUKCum3FqHmzlwzjr6egKBTqkTmziLTV2ze9YMMvhtbtuf0TIUae1fi5mJfWbeiY8+Gcwk9Fx2vicThSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956234; c=relaxed/relaxed;
	bh=Tn/VMKjNjYdeR5tWpLi4gYMCKwJf6awosIkWkgFHRJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMFYazKgx1ecsFaUnCyAB2qm/WNJgYzK66Jvg1KDqbSqrIzH+D1kxPJnmXxQrU8EYBlJvgcQT+N/P73dhpUDwRFH+D+Znhti45uhA2m0zxS/TiHBox4LBhFe+TpPVS86ZGku9nrfF/B6Ab1j/wx3NVai034Ik1/0D4tCz05EGR51QyA2a/a+ll1Komgl60+8cCJQe6TjeJP+CNWwCI/ALf2rfvVtZfmam/UW1gO7tW12rxy0xb93X3G2RBqfkDXjC0N4cDwBA3N8Ss3Qt1mBTdKkHb59lmfp9S2IcQ6aez4btPVcNjotqKZce7E3txZEH8H3Od+F8VtTKIHoU+bHlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T8cea/ZZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T8cea/ZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PVx3dByz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A03135C6BEC;
	Thu, 22 May 2025 23:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B521C4CEEB;
	Thu, 22 May 2025 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956231;
	bh=IyT4U5/iqZgzUKeFOOcx1oYJyd04a97M+SJOfXDWhxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8cea/ZZo+kZBPVQH3/QFcU0GOtPhlN7dG5M37kBSG5Ku/NVOq6WTsW6FxftLrst6
	 IF7hR/Iyh3eunltNFyVge8AcDp7YbEICE80Mq3gSTja31X3iGmrclhKsz/Cnrl86rO
	 dfd6EQtwRkSnxUHeU7YpjJb+TffKrgTiNmhZlmyLjUmWm/PDDYTX/hcm3U1lvK8Mnu
	 2E6lYtAGY+/xBOdW447+fabbwJluktHF3CtJT2Bj3Dia6PcLQWrY1ON3i6igjBYjxZ
	 uDU2OcmztDJ7zBGmIxkgL+0n87izDRbsC0eDeAqr0bL5qP/cEZsnaD/5/taNym5pRk
	 sK2qjzHt9cy1w==
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
Subject: [PATCH v8 04/20] PCI/AER: Consolidate Error Source ID logging in aer_isr_one_error_type()
Date: Thu, 22 May 2025 18:21:10 -0500
Message-ID: <20250522232339.1525671-5-helgaas@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
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
aer_isr_one_error_type().  Add a "found" parameter so we can add a note
when we didn't find any downstream devices with errors logged in their AER
Capability.

This changes the dmesg logging when we found no devices with errors logged:

  - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
  - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
  + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://patch.msgid.link/20250520215047.1350603-5-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 568229288ca3..fe6d323306a0 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
+static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
+				bool found)
 {
 	u8 bus = info->id >> 8;
 	u8 devfn = info->id & 0xff;
 
-	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
+	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
 		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn));
+		 PCI_FUNC(devfn), found ? "" : " (no details found");
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
+	aer_print_port_info(root, info, found);
+	if (found)
 		aer_process_err_devices(info);
 }
 
-- 
2.43.0


