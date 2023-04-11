Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D386DE880
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 02:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px3TH56Fwz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:28:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GuKX/iEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e8a::610; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GuKX/iEP;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwtzR54ZYz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:05:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M46oy+YV3e7UEe1zBeJwESept1jLMuX0htCKf7Z2bxJ6/s3cP2PIOGcxb4JFQiKrkxtSHHJrBmmz6mfSdo6TjoWDH/H1LC/eNGrn+L9mO/Z9n5MwBDXBbNcz5GLjHcChYxG/ONj0jjWiWjrAO9PSSC1nTLnzGBTPV28KRBX2TrzrpVyBMdoOluO8DxIq4djheEn06X4AjqJgjV2j2OmMvyNRjKE7vtlqQ+sKWlYV39rAFbMVmC/pau7/H9WueGNVP94ZXL6qOFPjo+XnDN4lRWRXsDZbYuaQrKrSRf4yhGE6f1Ch0fWD1BDFJ0htApfrMN9iRVYN7qqBW1xZqbo+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4ZCRrCWSpGRon5DPUy2i9yAnHrELFU55+UIaeoiKNk=;
 b=n2tpFdonLsYRsMPKB9iKtOPHh8TMrMw8EPDgenFmYFZ4FBdMi8DQqV+145mhf1TkddVqkpif6EASi9rMCH3jljTC9tEXS3GCAjojXT4FE8xQEewLyfcRq9b0mnO3XqW6zkuDTxL1RaVnwPKxzad2jnkVPNRsKrgs/5TwxW3v+HVwO4PntDoTd4r8+9O1UebAXljpvVQcwp782P4knHET1PbqS/DjZsU30OjktMP0OUnlzB3/FtQtwu0lhKgxSswguyJy09yyj0nSuqu/TNN8v2sa2boGSg8Aso2syh8ZnuAwGdDLTO7hU1OTch/6XZELn+KwxlmqAg2NQH5jSAaT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4ZCRrCWSpGRon5DPUy2i9yAnHrELFU55+UIaeoiKNk=;
 b=GuKX/iEP5UMHAlZgtoehfc5/yfO+DpYWb2dAuN3VF5yI3KRas25NVkTVxqLK82YczL+hzrnhmalaqPM5nvHcnMAJeZ8m+u35V43rdbMBkHFLHqCtA7PymcsUFbTPcf2RluibNGBO8zX35SrAGwzFsUgXCxxzLggYAgJFHRXwRvs=
Received: from BN9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::35)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 18:04:37 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::4b) by BN9P223CA0030.outlook.office365.com
 (2603:10b6:408:10b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.26 via Frontend Transport; Tue, 11 Apr 2023 18:04:36 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 13:04:35 -0500
From: Terry Bowman <terry.bowman@amd.com>
To: <alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <bwidawsk@kernel.org>, <dan.j.williams@intel.com>,
	<dave.jiang@intel.com>, <Jonathan.Cameron@huawei.com>,
	<linux-cxl@vger.kernel.org>
Subject: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected errors to the CXL.mem dev handler
Date: Tue, 11 Apr 2023 13:03:01 -0500
Message-ID: <20230411180302.2678736-6-terry.bowman@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411180302.2678736-1-terry.bowman@amd.com>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb8d8ab-f159-4f87-e6e8-08db3ab73643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0SGQNGoS+upoqTqw25eWvqc01KDWnJIhSbtrpBrny5SAnUnv0MsVG0IJBWafPX7dF1H5M887rhrOLFC2qMrVxyYGUWSet+Od+9IRQbrn2DPs9mP+g7JmvMoDd5CAPHHYdrhn/0/PlZDlLatMD9V5WeXZeLNuJ3DRvW9Qx1KrH0hQFuyB6uMT/MQAX2kn162lyrsw/o6hA9qtiRLUeSgpfV5eGfO3UbO4YlyCsJgiHkH8U3Nu9fNpkBEWNjSNtdJHL9v0pQab9X8pnxaKoSUbVIUa8ueh8GeV0j9B8qLpkPasXst4evuSswNSYeyYu8EWzcSmT8ctourzLRpNcW7eo3wupFY9YzwztnOf0Isqp2+NFdYqdQtM9JOXg9gkkQFVkqH9yXZ+Ewkq1/UUsWaKAfbIrdXkcAtKaJK5sIOawoelIRc0xozrDeB2P3RXmkUj9RApJxOPlZ8oEYQ61u0N2NZOfBusBcAORGPaTecs5DH3zHJI8FnDH3jEVhoq1amMtMYVO9A9fkKQjZIltrG/gYwNlbDhza8ZMqJysGI2/26NytRnLDMf5a2Abg/+RVa1a+Fd+EdZhwX2itgVIQH0/eBF3HZrKLqY7SrYJWJstBIs4DoGRgmRH6VKE3IiaE4G+PA8auXQM6QMpy3tcxmRTXJrVRn+ILH+vhUOb5pbB/gs9w+JJI4REJ2WAdK/DDjetARroK5aB32tmQF4mk2UOC/sJW9lwmKoYh0kOsnhRoE=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(8936002)(966005)(40480700001)(41300700001)(40460700003)(7696005)(426003)(2616005)(336012)(83380400001)(47076005)(316002)(82310400005)(110136005)(82740400003)(54906003)(36860700001)(81166007)(356005)(36756003)(44832011)(6666004)(5660300002)(7416002)(16526019)(8676002)(4326008)(478600001)(186003)(86362001)(70206006)(1076003)(70586007)(26005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:04:36.6434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb8d8ab-f159-4f87-e6e8-08db3ab73643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
X-Mailman-Approved-At: Wed, 12 Apr 2023 10:27:20 +1000
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
Cc: rrichter@amd.com, terry.bowman@amd.com, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
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
cap) or the dport's RCRB (AER ext cap). [1]

Errors showing up in the RCEC's error handler must be handled and
connected to the CXL subsystem. Implement this by forwarding the error
to all CXL devices below the RCEC. Since the entire CXL device is
controlled only using PCIe Configuration Space of device 0, Function
0, only pass it there [2]. These devices have the Memory Device class
code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
can implement the handler. In addition to errors directed to the CXL
endpoint device, the handler must also inspect the CXL downstream
port's CXL RAS and PCIe AER external capabilities that is connected to
the device.

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
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/pcie/Kconfig |  8 ++++++
 drivers/pci/pcie/aer.c   | 61 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
index 228652a59f27..b0dbd864d3a3 100644
--- a/drivers/pci/pcie/Kconfig
+++ b/drivers/pci/pcie/Kconfig
@@ -49,6 +49,14 @@ config PCIEAER_INJECT
 	  gotten from:
 	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
 
+config PCIEAER_CXL
+	bool "PCI Express CXL RAS support"
+	default y
+	depends on PCIEAER && CXL_PCI
+	help
+	  This enables CXL error handling for Restricted CXL Hosts
+	  (RCHs).
+
 #
 # PCI Express ECRC
 #
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 7a25b62d9e01..171a08fd8ebd 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -946,6 +946,65 @@ static bool find_source_device(struct pci_dev *parent,
 	return true;
 }
 
+#ifdef CONFIG_PCIEAER_CXL
+
+static bool is_cxl_mem_dev(struct pci_dev *dev)
+{
+	/*
+	 * A CXL device is controlled only using PCIe Configuration
+	 * Space of device 0, Function 0.
+	 */
+	if (dev->devfn != PCI_DEVFN(0, 0))
+		return false;
+
+	/* Right now there is only a CXL.mem driver */
+	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
+		return false;
+
+	return true;
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
+static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info);
+
+static int cxl_handle_error_iter(struct pci_dev *dev, void *data)
+{
+	struct aer_err_info *e_info = (struct aer_err_info *)data;
+
+	if (!is_cxl_mem_dev(dev))
+		return 0;
+
+	/* pci_dev_put() in handle_error_source() */
+	dev = pci_dev_get(dev);
+	if (dev)
+		handle_error_source(dev, e_info);
+
+	return 0;
+}
+
+static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
+{
+	/*
+	 * CXL downstream port errors are signaled as RCEC internal
+	 * errors. Forward them to all CXL devices below the RCEC.
+	 */
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
+	    is_internal_error(info))
+		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
+}
+
+#else
+static inline void cxl_handle_error(struct pci_dev *dev,
+				    struct aer_err_info *info) { }
+#endif
+
 /**
  * handle_error_source - handle logging error into an event log
  * @dev: pointer to pci_dev data structure of error source device
@@ -957,6 +1016,8 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int aer = dev->aer_cap;
 
+	cxl_handle_error(dev, info);
+
 	if (info->severity == AER_CORRECTABLE) {
 		/*
 		 * Correctable error does not need software intervention.
-- 
2.34.1

