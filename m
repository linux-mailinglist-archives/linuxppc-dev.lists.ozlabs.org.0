Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1A70E98F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 01:28:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQr8z2XH6z3f6X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 09:28:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OKQpCeMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::617; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OKQpCeMg;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQr831yVsz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 09:27:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdOUD/Rsjhjmj/RTos1JPl/blYc7dY0HnBE9AdpabscgF2AynEgRrQp9dv1B6smcqnNPkDfCzgqb2kr9F0mKmZAR8agE7+sBG9qtPuq4N1xraX0BsJGm8YJ20DZEEGHEJx9LAivxGDCdpSzVPExTjwsvgQgIWgOAMFkIyIZsSMhFPNK3i77OT02/roffR86rTjkv2se9bkZdTlAKPEh/yNihPThlmj8sevWMM7eox7rcDaBKouSup9clxhwLu79nSwzIEqHoeC2CfjH824eCPF5ofC3YaCvpis0FRaXYCG2mFVgadNK5aYFcWJx53Fiw/XJAkagVZrz8MwktEZ3J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxbkcOVfHB2LztSBZUUwpyQrS2VM9I0+YxE7oslWjy0=;
 b=fPCXUbhfqrDp51EaswNhe5K+xocbm/kd+vz9uSPS+bb7dC7huCjNyevujrTlpCj56A0O/erncf72HKZXOEoSBVqXNJ0HkW1Hr8fdbJUdBeXXkIS5kBRgdxobbpIZhbugOdrIkwgHKcHnJC7CTZSpvEaMsk5tjfm59dzJHUdbCM4MiMKvnW26PjDNFuc29Lg5nvMEmqsylsT42v5HeyZ9lWA+JgQbsnpn6QDZopIbTqXI5uOCo5N7s8uT0DY0pOCgA9cOzPTfvL4ZqSJIvYxPUfjHbpJIFxjIvmIdneDziBU4PYngGZXsE1KDbBxAXhyJYY6qVT8bvyNABbKA98Om6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxbkcOVfHB2LztSBZUUwpyQrS2VM9I0+YxE7oslWjy0=;
 b=OKQpCeMgNxhsXHoLXho8CHVCx0M1AS+Q5ROQHhtw8sYcBrdO0ccQw7+G+hn9XoZLa6E6XLLu3Ha8TiJCFbep2M3f5eSMmDhtsPUOkRg/3/7PX6q12dVfLjuCmroSvqWZaiMZYz02E54IrCVwgmC7SdOnoWfT3Qba8LJ4Dmyz4PA=
Received: from MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37) by
 SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 23:27:03 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::b3) by MW2PR16CA0024.outlook.office365.com
 (2603:10b6:907::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14 via Frontend
 Transport; Tue, 23 May 2023 23:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.29 via Frontend Transport; Tue, 23 May 2023 23:27:02 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 23 May
 2023 18:27:01 -0500
From: Terry Bowman <terry.bowman@amd.com>
To: <alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <bwidawsk@kernel.org>, <dan.j.williams@intel.com>,
	<dave.jiang@intel.com>, <Jonathan.Cameron@huawei.com>,
	<linux-cxl@vger.kernel.org>
Subject: [PATCH v4 22/23] PCI/AER: Forward RCH downstream port-detected errors to the CXL.mem dev handler
Date: Tue, 23 May 2023 18:22:13 -0500
Message-ID: <20230523232214.55282-23-terry.bowman@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523232214.55282-1-terry.bowman@amd.com>
References: <20230523232214.55282-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: c759278c-070e-45db-3222-08db5be536d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QlWryOlJuCe/PQwmpwJqhqVUjUgCiAFbeioG2iG0JXunjy4yDosz48MrRp5cENcZjgeVXRPvdGenh0Z0SqNeUR1z+8Pi3EFrnLrjQ19e4k12b7b1Y6oh5tfCkHt9FhVrQTt7VGbE1njkhwTLls99cYD0BWVVtl+TgrI6xKTzCmMWrIjE5VEa4AgFYwYeJo8zr4sZoo86hIedFzkeWE/IM/p6RBJLBNRNlOTsw6y2RPsjWyv2ybbAcJ+6q+r1Yxrv75omZP7yRIQDVtF4CPKpxQBe/Sd2gumNnONykbbk5AHItUmQAF4a4Q/8cnFBCLMBATlCLgf5ATMNz9aJf0HqoEO+wNvOUEPEaFCx4vkqfRsrl3IjWkfHYZ6hZnXXGmMycxhjkw67KJ0jSk1ie05p7g9BVzMbOMnMaRuER7ZBTBocFLh19fTWxz/9e1IkUq/DtKUmX7fZeGWNCiISm6bAWU3PTrE+nijdM8U4tPD/tFfnDe0kuyL25Rk4u+u0O4eJtdfccG8fVC9OhQrAtRu8T7lBaHyaVt8AFOvg4w2juaOD6uzaQ+t+D54QGLTfYulFxCKaUV0m/A5peztzk4n1l3BvBSYp2l2ZnuXmnL6cnajJX0xxoVUfhHWNA+O1c76g/99mwz65x8EfYmlVUJQPqVx3jVkj438jnyfRJuKxpt0jinjbVX9Ru5Nqu6eIAyOuw8/mMlOq3pvvJ5Q35nDioQV+tpyGzQRxoZHyTbjYy9mCiutEWM0//9KjEceeLIQrp60Tp0A4iB6ZP+USxwF2Ug==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(7696005)(41300700001)(40460700003)(36860700001)(6666004)(8936002)(81166007)(8676002)(186003)(16526019)(356005)(26005)(5660300002)(1076003)(44832011)(7416002)(36756003)(82740400003)(40480700001)(2906002)(966005)(2616005)(86362001)(82310400005)(70586007)(70206006)(426003)(54906003)(47076005)(110136005)(336012)(478600001)(316002)(83380400001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 23:27:02.7362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c759278c-070e-45db-3222-08db5be536d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
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
Cc: rrichter@amd.com, terry.bowman@amd.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Robert Richter <rrichter@amd.com>

In Restricted CXL Device (RCD) mode a CXL device is exposed as an
RCiEP, but CXL downstream and upstream ports are not enumerated and
not visible in the PCIe hierarchy. Protocol and link errors are sent
to an RCEC.

Restricted CXL host (RCH) downstream port-detected errors are signaled
as internal AER errors, either Uncorrectable Internal Error (UIE) or
Corrected Internal Errors (CIE). The error source is the id of the
RCEC. A CXL handler must then inspect the error status in various CXL
registers residing in the dport's component register space (CXL RAS
capability) or the dport's RCRB (PCIe AER extended capability). [1]

Errors showing up in the RCEC's error handler must be handled and
connected to the CXL subsystem. Implement this by forwarding the error
to all CXL devices below the RCEC. Since the entire CXL device is
controlled only using PCIe Configuration Space of device 0, function
0, only pass it there [2]. The error handling is limited to currently
supported devices with the Memory Device class code set
(PCI_CLASS_MEMORY_CXL, 502h), where the handler can be implemented in
the existing cxl_pci driver. Support of CXL devices (e.g. a CXL.cache
device) can be enabled later.

In addition to errors directed to the CXL endpoint device, a handler
must also inspect the CXL RAS and PCIe AER capabilities of the CXL
downstream port that is connected to the device.

Since CXL downstream port errors are signaled using internal errors,
the handler requires those errors to be unmasked. This is subject of a
follow-on patch.

The reason for choosing this implementation is that a CXL RCEC device
is bound to the AER port driver, but the driver does not allow it to
register a custom specific handler to support CXL. Connecting the RCEC
hard-wired with a CXL handler does not work, as the CXL subsystem
might not be present all the time. The alternative to add an
implementation to the portdrv to allow the registration of a custom
RCEC error handler isn't worth doing it as CXL would be its only user.
Instead, just check for an CXL RCEC and pass it down to the connected
CXL device's error handler. With this approach the code can entirely
be implemented in the PCIe AER driver and is independent of the CXL
subsystem. The CXL driver only provides the handler.

[1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
[2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices

Co-developed-by: Terry Bowman <terry.bowman@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/pcie/Kconfig |  12 +++++
 drivers/pci/pcie/aer.c   | 100 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
index 228652a59f27..4f0e70fafe2d 100644
--- a/drivers/pci/pcie/Kconfig
+++ b/drivers/pci/pcie/Kconfig
@@ -49,6 +49,18 @@ config PCIEAER_INJECT
 	  gotten from:
 	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
 
+config PCIEAER_CXL
+	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"
+	default y
+	depends on PCIEAER && CXL_PCI
+	help
+	  Enables error handling of downstream ports of a CXL host
+	  that is operating in RCD mode (Restricted CXL Host, RCH).
+	  The downstream port reports AER errors to a given RCEC.
+	  Errors are handled by the CXL memory device driver.
+
+	  If unsure, say Y.
+
 #
 # PCI Express ECRC
 #
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d3344fcf1f79..2e3f00b6a5bd 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -946,14 +946,104 @@ static bool find_source_device(struct pci_dev *parent,
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
+	 * CXL downstream ports of a CXL host that is operating in RCD
+	 * mode (RCH) signal errors as RCEC internal errors. Forward
+	 * them to all CXL devices below the RCEC.
+	 *
+	 * See CXL 3.0:
+	 *   9.11.8 CXL Devices Attached to an RCH
+	 *   12.2.1.1 RCH Downstream Port-detected Errors
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
 
@@ -977,6 +1067,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
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
2.34.1

