Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230A7B0948
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 17:49:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rZliG/1x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwgzK3W0Xz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:49:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rZliG/1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe59::627; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwgxC6WCSz3cPJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 01:47:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaNIo4oswOWK31JKK/DK6ItSSYS18TJlQmsLMfe8kwDouYONpE/tTITIFrOpqDfxFI5uh0q0uwASRAuGJHBfZoPTD8wNBhUwFVe24MSU1Z3sqzyttTxxlTt81ghLxUIh9QsmVsy0717495W70qEn9thRPWEYV/YCCZ7/rVhzr/TMulesQksksh8oPUsTJuCVlrOMkaVx4DMY67PhgfaCHsFioNaNH75Zxvj9wb+MGwCttZ1oKC3Eeu4MbOE5BjRFdkuwW2b1fuYJ82dqPIKvnJAeSRCdj4OxDRKDqCCjn0wY3yMeI983Z8Ka0Bm+zz0TWDVF7fcEWVIuzVFHWpGxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6b2qUQhdM9XNtxycGmYUHZiUTXbgj5Xh4R1Nf/Jxn4=;
 b=As2EaP1jM6zGdYtACOrcUUDDjo6DWVg46uKFFkwo0UPONUzEOMVsijGSlwwsrWNJqMmAxabiHR7a/sEsrvzlesWBfsvp6DTowT1RpLf3UILbiXkLd9dRMvxxzvIzXuPJN008XsVm17cXRdee+vb2UZXPqS2ABxZuvB+2l6gE8+y55IdZ+l9LBdjtXXdu19eOrs1Etw7GR3yAwJBl8FqmtT/mn7YFTVBvq9W4YdDwUb7vonrB5eqREy8stg85ax+TdzWsbuRtrw2bjHoceEQ6fQ7v0KPmMxblbpMj0X9sctXVTSU9DpycoDb2NImVS81QdwrkAJbgNkrHGHvZkT/yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6b2qUQhdM9XNtxycGmYUHZiUTXbgj5Xh4R1Nf/Jxn4=;
 b=rZliG/1xh3tlAngCPKOKXpCzlhofU8bJIJm0GYsLlHHIfuiPwdiAj7TvV4zZTv2wxGnsNBkkTgvP6hdDs29rsow/K7K9r6wErPts9vfPyMb8ipXR+B9R76wEkQevyU3i0xu4PSTyZkKt/FZi3wmTFa+9N18m3U0wHp9l6GX0dPQ=
Received: from BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::15)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 27 Sep
 2023 15:47:36 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::1) by BLAP220CA0010.outlook.office365.com
 (2603:10b6:208:32c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 15:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 15:47:35 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 10:47:31 -0500
From: Robert Richter <rrichter@amd.com>
To: Alison Schofield <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Ben Widawsky
	<bwidawsk@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v11 17/20] PCI/AER: Forward RCH downstream port-detected errors to the CXL.mem dev handler
Date: Wed, 27 Sep 2023 17:43:36 +0200
Message-ID: <20230927154339.1600738-18-rrichter@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230927154339.1600738-1-rrichter@amd.com>
References: <20230927154339.1600738-1-rrichter@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|PH7PR12MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: d79f213b-323b-4246-613f-08dbbf71121b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cWhggodrRHIohstJs9q63/ZIbt1bwWj5MTFtFz/ojZHJyGpxDay6gOgD3oqYrhn51yQs77v72yM5wptK5NfKt6EFGYg5y/d+hZUS3iq5NwFO4x6DukyfgOFmGk4w9GG7h0XGUeA2l6GBQUwAuvvN/61vvUlGxvZD1XiyqhPuJwl610r13anIjwvBt6/N4pCRCHry7hJh/HIH2UJ2PMkhrSTrl2E3Ourz9GKfcZVGFIy0T/dRquc4d14eW+BKMvf/5G6CBRPC0hN76YRkxY9xBfiAiQYIq2Eqt980drlkdkllzRIhEFvWkRlOAFHfRhqpmj8k+IuIfTGjFZ7s+DAamWGm+iUHRcVZGwvxjKSqJFBw/5AEr+JUCUlRwi43h4184k0fY1tF5OVTPScoXdmvBnQSXZpHqV5Phq+vLYyQBsmkn6xAP8kfTehlv9QlJv5UL6L8cXhOQfER4VEkeFOgyD/OS4qht5TaDNyFLhrhKB/B380H4jDCL5zdePFds6EZa9kuXqdOoWJUMyH9WQNtDvJTeVAcEi8/p2aDDn6ZaDfY3Rrrr6M6eJrCkmEsLvTm4+6wG95p5hnvSxrTCOafvxoU2Bbx7EFdLz4WdfWqCwUJbbMnG4O0xw0cnzbsY3q3TUecn8HLRWn9DVJCxefh+ZWQUc+C2Y2W0NoJ7/IpwRTF9K72+kYHWZuIG7PE3BBRFbaiYmU/EUSFS/IKYemgwaSeUR9RpTNdeAGGFLN37EJUn3RWOQQAGewJv3CUYhKAzJyaW36GsKrbUtXUVGNsDg==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(966005)(40480700001)(110136005)(70586007)(70206006)(41300700001)(54906003)(478600001)(316002)(5660300002)(82740400003)(2616005)(8936002)(356005)(81166007)(26005)(16526019)(36860700001)(36756003)(2906002)(426003)(336012)(4326008)(8676002)(47076005)(1076003)(7416002)(40460700003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:47:35.8738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d79f213b-323b-4246-613f-08dbbf71121b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Dave Jiang <dave.jiang@intel.com>, Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In Restricted CXL Device (RCD) mode a CXL device is exposed as an
RCiEP, but CXL downstream and upstream ports are not enumerated and
not visible in the PCIe hierarchy. [1] Protocol and link errors from
these non-enumerated ports are signaled as internal AER errors, either
Uncorrectable Internal Error (UIE) or Corrected Internal Errors (CIE)
via an RCEC.

Restricted CXL host (RCH) downstream port-detected errors have the
Requester ID of the RCEC set in the RCEC's AER Error Source ID
register. A CXL handler must then inspect the error status in various
CXL registers residing in the dport's component register space (CXL
RAS capability) or the dport's RCRB (PCIe AER extended
capability). [2]

Errors showing up in the RCEC's error handler must be handled and
connected to the CXL subsystem. Implement this by forwarding the error
to all CXL devices below the RCEC. Since the entire CXL device is
controlled only using PCIe Configuration Space of device 0, function
0, only pass it there [3]. The error handling is limited to currently
supported devices with the Memory Device class code set (CXL Type 3
Device, PCI_CLASS_MEMORY_CXL, 502h), handle downstream port errors in
the device's cxl_pci driver. Support for other CXL Device Types
(e.g. a CXL.cache Device) can be added later.

To handle downstream port errors in addition to errors directed to the
CXL endpoint device, a handler must also inspect the CXL RAS and PCIe
AER capabilities of the CXL downstream port the device is connected
to.

Since CXL downstream port errors are signaled using internal errors,
the handler requires those errors to be unmasked. This is subject of a
follow-on patch.

The reason for choosing this implementation is that the AER service
driver claims the RCEC device, but does not allow it to register a
custom specific handler to support CXL. Connecting the RCEC hard-wired
with a CXL handler does not work, as the CXL subsystem might not be
present all the time. The alternative to add an implementation to the
portdrv to allow the registration of a custom RCEC error handler isn't
worth doing it as CXL would be its only user. Instead, just check for
an CXL RCEC and pass it down to the connected CXL device's error
handler. With this approach the code can entirely be implemented in
the PCIe AER driver and is independent of the CXL subsystem. The CXL
driver only provides the handler.

[1] CXL 3.0 spec: 9.11.8 CXL Devices Attached to an RCH
[2] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
[3] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices

Co-developed-by: Terry Bowman <terry.bowman@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/pci/pcie/Kconfig |  9 ++++
 drivers/pci/pcie/aer.c   | 96 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
index 228652a59f27..8999fcebde6a 100644
--- a/drivers/pci/pcie/Kconfig
+++ b/drivers/pci/pcie/Kconfig
@@ -49,6 +49,15 @@ config PCIEAER_INJECT
 	  gotten from:
 	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
 
+config PCIEAER_CXL
+	bool "PCI Express CXL RAS support"
+	default y
+	depends on PCIEAER && CXL_PCI
+	help
+	  Enables CXL error handling.
+
+	  If unsure, say Y.
+
 #
 # PCI Express ECRC
 #
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 6593fe3fc555..9f420733996b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -934,14 +934,100 @@ static bool find_source_device(struct pci_dev *parent,
 	return true;
 }
 
+#ifdef CONFIG_PCIEAER_CXL
+
+static bool is_cxl_mem_dev(struct pci_dev *dev)
+{
+	/*
+	 * The capability, status, and control fields in Device 0,
+	 * Function 0 DVSEC control the CXL functionality of the
+	 * entire device (CXL 3.0, 8.1.3).
+	 */
+	if (dev->devfn != PCI_DEVFN(0, 0))
+		return false;
+
+	/*
+	 * CXL Memory Devices must have the 502h class code set (CXL
+	 * 3.0, 8.1.12.1).
+	 */
+	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
+		return false;
+
+	return true;
+}
+
+static bool cxl_error_is_native(struct pci_dev *dev)
+{
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+
+	if (pcie_ports_native)
+		return true;
+
+	return host->native_aer && host->native_cxl_error;
+}
+
+static bool is_internal_error(struct aer_err_info *info)
+{
+	if (info->severity == AER_CORRECTABLE)
+		return info->status & PCI_ERR_COR_INTERNAL;
+
+	return info->status & PCI_ERR_UNC_INTN;
+}
+
+static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
+{
+	struct aer_err_info *info = (struct aer_err_info *)data;
+	const struct pci_error_handlers *err_handler;
+
+	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
+		return 0;
+
+	/* protect dev->driver */
+	device_lock(&dev->dev);
+
+	err_handler = dev->driver ? dev->driver->err_handler : NULL;
+	if (!err_handler)
+		goto out;
+
+	if (info->severity == AER_CORRECTABLE) {
+		if (err_handler->cor_error_detected)
+			err_handler->cor_error_detected(dev);
+	} else if (err_handler->error_detected) {
+		if (info->severity == AER_NONFATAL)
+			err_handler->error_detected(dev, pci_channel_io_normal);
+		else if (info->severity == AER_FATAL)
+			err_handler->error_detected(dev, pci_channel_io_frozen);
+	}
+out:
+	device_unlock(&dev->dev);
+	return 0;
+}
+
+static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
+{
+	/*
+	 * Internal errors of an RCEC indicate an AER error in an
+	 * RCH's downstream port. Check and handle them in the CXL.mem
+	 * device driver.
+	 */
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
+	    is_internal_error(info))
+		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);
+}
+
+#else
+static inline void cxl_rch_handle_error(struct pci_dev *dev,
+					struct aer_err_info *info) { }
+#endif
+
 /**
- * handle_error_source - handle logging error into an event log
+ * pci_aer_handle_error - handle logging error into an event log
  * @dev: pointer to pci_dev data structure of error source device
  * @info: comprehensive error information
  *
  * Invoked when an error being detected by Root Port.
  */
-static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
+static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int aer = dev->aer_cap;
 
@@ -965,6 +1051,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
 	else if (info->severity == AER_FATAL)
 		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
+}
+
+static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
+{
+	cxl_rch_handle_error(dev, info);
+	pci_aer_handle_error(dev, info);
 	pci_dev_put(dev);
 }
 
-- 
2.30.2

