Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FC6DE882
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 02:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px3VD0rXWz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e+LB4dOW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eb2::620; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e+LB4dOW;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwtzX3KQVz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:05:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIjwjJSQA1vN8iO0862himxM4p6zRzygQnvCL2KVDgqbgF6sMCdPY6ChV4+G6PcSH7TXNcSKMj9BqquJwSl8r4u0ajL3dKEQ3M3OJfSPhohT5XeXNky1BlDQobbiBd4Wzc6oi5z8OvpCg+6Fe9HsYdH6cznmrbl1ZL8p0+rmB8TeaqqZrA5pBetiAjopCo5RVQ/OUFOs53DIyt7r9cJvinxSBvaPtdeB8vPtw0IedTltFcz8blPSXbQLH8FEYXn1ZLOkKAde9AmWreaGKd2Lb6X57LBlkbNfp2iSKwNNBv3vdQX3fCZjHkNXmLFUlvD2tmraXVCG8UFwtGsnCRVWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2zFiMs2oIqp2Cdsmd91Xau6Ybwk/eHR8N/sswJ3q5w=;
 b=QPeEBp1J76sxjxDvvebDyUE6dDKNVS3ZyMM57FqLAzADMOx/jbvk21wgGY6/trehTcfkEcDPQmkJl84WpXt5VheVvdyqBlqXIO+WCDI4nXYTYSpqLWc7nOVBWjYwGRf+UUTMAqhJ5jfacw4f/pndTVQ3dg4G88VmVuxkujgBQZrySCf9UxFM/tkVw5y0E3ffL+HVHgprOO/7bR6AtwotOM1NM2LU53QMT/tFLnRj2sre56640ztjtPUFqrn7VvGBimGXbkv1oQUtnKqhqvxrqVyf8bpngE6mVqbsHwbjYaEhMstV59yWExbiv+fNRvrjVGq/VcxGVQtoIho0LdT9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2zFiMs2oIqp2Cdsmd91Xau6Ybwk/eHR8N/sswJ3q5w=;
 b=e+LB4dOWTtUba/lCdS/fki7n7bXhzeYN8XSppVLF7hI/MjlCJNrY+q4AGLYKh2xjMv/6aG04mY1RomA+79QXqXKLVP3aNdREgAAN0K03wvVDiKbu8JJNzO/xJIjUEt4TxD1Bb+Zl7hxcOLz0ZaN891BuWgueytzfrfjyAd0eiSY=
Received: from BN9PR03CA0696.namprd03.prod.outlook.com (2603:10b6:408:ef::11)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 18:04:49 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::76) by BN9PR03CA0696.outlook.office365.com
 (2603:10b6:408:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:04:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 18:04:49 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 13:04:48 -0500
From: Terry Bowman <terry.bowman@amd.com>
To: <alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <bwidawsk@kernel.org>, <dan.j.williams@intel.com>,
	<dave.jiang@intel.com>, <Jonathan.Cameron@huawei.com>,
	<linux-cxl@vger.kernel.org>
Subject: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable RCH downstream port error handling
Date: Tue, 11 Apr 2023 13:03:02 -0500
Message-ID: <20230411180302.2678736-7-terry.bowman@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: ad78fed2-a404-40a9-905f-08db3ab73e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4/c+xi/etY6MLRknICeekGbnE6bJxjNwp6pnt699UyTwdTs6N4zTSLLZav23gOPlFY0OJFZlksGJ4WeL04X3kAaE/mW3DFu2uVDWeftbFegM8swQ75SbvjitlrHq7czWB0IcgC5VmfqkBWr6KU8nPvsiwcEH+D9JyszdZlItcmdtYszyFHINa28INo+4vI0RxGzRLQPTEBUcRBfoAco5X8hIihmlVw8D6nl5C5W82B0xdKjDJdaBdluY5txM+5G9tUHdN67/kaSeYKoaJxV5fmVRfkaOpLmwd5zC4gw28+O/AmNWGbXFXI09TNlkbMW6go+LEwE/fmk9oGdnknHu7UwZtlc1am6VKYqfBzKR9QAtYG9qx3wh36E+63ysNiEFVcsrLdYIYVS26ciFYSRo+UOSvckLYrNvBXthggOomfCgsovrgwGBd3Aa2EEblWkuplsJalj4uQlox7lTYfIwx3QnDCszseAnFeEB8kY+rC30HhmGOicRc1KapYG6iGh5qr1g/rfgWM1vFSIOQThYJ5LQSEd6LCyBYYjrOPLK/NFUUX35TxRlqVORcYPlTpjHEX+C45xvXZqusK2D7rsoW2SgTU12ExvAwUbm+CP+2mp6P6H46Ja3RLbX1W5Sh1nEZWhSqgM2u91DE1dN4zQJ3+2eTe/jUnfoi2padZbxa1orT96pFRiG6ghZ1UC3ZTom90ucwBbmVDmget8FWesMX6ZI+zOvHGD/WjYem3kOHVn0vPrTA04JBdTz5ndraZ0kEilaiCF84ierqoYqB05T6A==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(426003)(2906002)(26005)(336012)(16526019)(186003)(1076003)(2616005)(70206006)(47076005)(83380400001)(41300700001)(70586007)(8676002)(54906003)(7416002)(478600001)(110136005)(5660300002)(8936002)(40480700001)(7696005)(44832011)(6666004)(316002)(4326008)(81166007)(356005)(36860700001)(82740400003)(36756003)(82310400005)(86362001)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:04:49.6869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad78fed2-a404-40a9-905f-08db3ab73e0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
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

RCEC AER corrected and uncorrectable internal errors (CIE/UIE) are
disabled by default. [1][2] Enable them to receive CXL downstream port
errors of a Restricted CXL Host (RCH).

[1] CXL 3.0 Spec, 12.2.1.1 - RCH Downstream Port Detected Errors
[2] PCIe Base Spec 6.0, 7.8.4.3 Uncorrectable Error Mask Register,
    7.8.4.6 Correctable Error Mask Register

Co-developed-by: Terry Bowman <terry.bowman@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/pcie/aer.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 171a08fd8ebd..3973c731e11d 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1000,7 +1000,79 @@ static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
 }
 
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
+static int handles_cxl_error_iter(struct pci_dev *dev, void *data)
+{
+	int *handles_cxl = data;
+
+	*handles_cxl = is_cxl_mem_dev(dev) && cxl_error_is_native(dev);
+
+	return *handles_cxl;
+}
+
+static bool handles_cxl_errors(struct pci_dev *rcec)
+{
+	int handles_cxl = 0;
+
+	if (!rcec->aer_cap)
+		return false;
+
+	if (pci_pcie_type(rcec) == PCI_EXP_TYPE_RC_EC)
+		pcie_walk_rcec(rcec, handles_cxl_error_iter, &handles_cxl);
+
+	return !!handles_cxl;
+}
+
+static int __cxl_unmask_internal_errors(struct pci_dev *rcec)
+{
+	int aer, rc;
+	u32 mask;
+
+	/*
+	 * Internal errors are masked by default, unmask RCEC's here
+	 * PCI6.0 7.8.4.3 Uncorrectable Error Mask Register (Offset 08h)
+	 * PCI6.0 7.8.4.6 Correctable Error Mask Register (Offset 14h)
+	 */
+	aer = rcec->aer_cap;
+	rc = pci_read_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, &mask);
+	if (rc)
+		return rc;
+	mask &= ~PCI_ERR_UNC_INTN;
+	rc = pci_write_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, mask);
+	if (rc)
+		return rc;
+
+	rc = pci_read_config_dword(rcec, aer + PCI_ERR_COR_MASK, &mask);
+	if (rc)
+		return rc;
+	mask &= ~PCI_ERR_COR_INTERNAL;
+	rc = pci_write_config_dword(rcec, aer + PCI_ERR_COR_MASK, mask);
+
+	return rc;
+}
+
+static void cxl_unmask_internal_errors(struct pci_dev *rcec)
+{
+	if (!handles_cxl_errors(rcec))
+		return;
+
+	if (__cxl_unmask_internal_errors(rcec))
+		dev_err(&rcec->dev, "cxl: Failed to unmask internal errors");
+	else
+		dev_dbg(&rcec->dev, "cxl: Internal errors unmasked");
+}
+
 #else
+static inline void cxl_unmask_internal_errors(struct pci_dev *dev) { }
 static inline void cxl_handle_error(struct pci_dev *dev,
 				    struct aer_err_info *info) { }
 #endif
@@ -1397,6 +1469,7 @@ static int aer_probe(struct pcie_device *dev)
 		return status;
 	}
 
+	cxl_unmask_internal_errors(port);
 	aer_enable_rootport(rpc);
 	pci_info(port, "enabled with IRQ %d\n", dev->irq);
 	return 0;
-- 
2.34.1

