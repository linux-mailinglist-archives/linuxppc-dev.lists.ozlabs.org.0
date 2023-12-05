Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B711F8063CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 01:59:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JqL4nt47;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlJw11Vcsz3d8W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 11:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JqL4nt47;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ayan.kumar.halder@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl0Q36qgWz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 23:36:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exn84DqH4NCoAc0TTwhCIvIiRu5dwgyDMifzhxbtHnJwPPXHy3+LGcl5HJsZvPAkTF3od95dE52KO+L55LNzObIjXV/g5lhp9E0MFIKA5lWEgDw5I7zfNUlXFiRjaa/kWNxD/pvxjynnDfG/MV8VHcHMEDpwNyq/tTL3Mza36yhj0GRQ9wo0PqoMBwCDUVFCFhGN80UUCgIFTzj5syd3kbxbuqP0uKp5LLHnavhxSaxWCWJBaww5Q+GuGgT8JgOqilun+keefE7wvDKv2B5kd3gPTA8/Ch5HcqyIh9r8IAj9RjZAX6xmPRHFcxQgGaGU5LNXUNf68k1UAeX/uWJbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uyj/8cp0CE7Vhp/O/0rqRwp1f4z0B5xHlVMVld0lpM=;
 b=SIu70EArJY857kAeV9MvyUrw1wXUEVJF3Tx7AZJ7Gh/vzufjeuBrV6e/jk074nqxCb7f/KRkydUgH4J7SuDR8oCpUyHcoNoiUISa1KCdmFdBM8HKls9LfgeuxeJf2W/RgUTINhqvFcFnBwEotFiWGpNwE0DSCLH6ivWmT3OqgphFmMuIMf5OvCCbIa1aqMjCk7mPGyEiyEn9smlyAl3xQ0NvAu1FIVUxk4iVvxKKH3lnL8blUzwZfbHw0xapYS+YochFN751xKsRGuNlCRrCVSpsW7L/fIQf80dNnfhJOb0r42A0wXMFr8tKj23qFPfyFSHLjMT25PylI6Zy1VF1sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uyj/8cp0CE7Vhp/O/0rqRwp1f4z0B5xHlVMVld0lpM=;
 b=JqL4nt47/WRmtEZIuSxCQfV0VB/eHOyY2ufXVwwsAb2htF4Ac73w6f8z6rjEUPvclVrTW7LaBxOwohALqlTee31/kSGVLXoGTH0Bdx8/HJBAH3LR1nRhp7MhkZscfW4HzkGwoGBMptD0Ivk2yYnvkA67k85lKoR/FZrR/iHpMbs=
Received: from BL0PR02CA0069.namprd02.prod.outlook.com (2603:10b6:207:3d::46)
 by SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 12:35:46 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::b4) by BL0PR02CA0069.outlook.office365.com
 (2603:10b6:207:3d::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29 via Frontend
 Transport; Tue, 5 Dec 2023 12:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 12:35:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 06:35:45 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 06:35:44 -0600
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<ayan.kumar.halder@amd.com>
Subject: [PATCH] tty: hvc: dcc: Check for TXfull condition while setting up early console
Date: Tue, 5 Dec 2023 12:35:34 +0000
Message-ID: <20231205123534.3376883-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SJ0PR12MB5438:EE_
X-MS-Office365-Filtering-Correlation-Id: ba11229a-7061-4bfa-4413-08dbf58eb44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IBNJnSKhizmFbvHPdhCuBgtY2GwyFbSB2xG1XJoSD5vjh9has6Xzipspq2rBdfZMmPPXcJGPBBca2EqndEAa7f5hUB/vM0HIRs9149/+N2vSlF72UC16DYFTHvc4JrsDgScFhJSU+5YZKqSyF14DVKeI/5kEmXIvtkzGDivxq477jqtORnOHqTAmzYrQea1gu898TLeowqHsWjZ2CZNMJ8qCA4b5ZirV3c1fchW8kXqTUHKYvPjJ4b/A2wHKy3Y6poSjhca3sstQGiAMgZYbW12TW/mWIEZBXEohem9OkrrlVyG3ZjlUKeaKHvYkMn0KVlpSHXNIxrhL33pNxjQgUeTG8Yja6fnOg2hjoflm3fs2THhjlC0ZO89+NRGSh4SbfStp3UTdttTxLiW7o7RP/cJxCSmpV0qALkbGvbXvZxZVIsMXF675/pd3npfWCxgfOpet/H6vpy5HWnPesFMSafdjjdc4QLVWiH9709GEccosL8poVXbOl9jFwkGaIPKk4wnwQBKyaMBxLbpvvonKMdZZ8vTL7v0ps81hldo5nTAEP0xQ8Kwxqc/VRAxQYRa62XcWIeWST71KtHvDijLmU+b0NEX6u7mk9vScfTow1Yg+2Cz9/qhSwoOzorzqsG38oITL+O+x7e3WmWJfTVpfeO/286q07yYk54b9theOeDbqXEK+IMxc2DmW5svFxRR7o+8xtP326RHFXi3S8g43jJUxSqehf9Ocv1FxrZuI3zrigEF7I8XzDg6LZTBFqFC73PwRsA41v+zNSvh6CmAk5Q==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(40480700001)(36860700001)(103116003)(2906002)(110136005)(316002)(54906003)(86362001)(70206006)(8676002)(70586007)(41300700001)(36756003)(4326008)(8936002)(356005)(47076005)(5660300002)(82740400003)(81166007)(7049001)(478600001)(40460700003)(426003)(26005)(1076003)(336012)(6666004)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 12:35:46.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba11229a-7061-4bfa-4413-08dbf58eb44a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5438
X-Mailman-Approved-At: Wed, 06 Dec 2023 11:59:02 +1100
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
Cc: julien@xen.org, stefano.stabellini@amd.com, gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, jirislaby@kernel.org, michal.orzel@amd.com, michal.simek@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0,
"If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"

Thus one should always check for TXfull condition before hvc can be
used as an early console. This is similar to what is being done
today in hvc_dcc_console_init() and hvc_dcc_init().

The count 0x4000000 has been obtained from uboot (v2024.01-rc3)
drivers/serial/arm_dcc.c "TIMEOUT_COUNT".
It reads the dcc status and waits for 0x4000000  times for the TX Fifo
to be available before returning an error. Thus, it will prevent DCC
to be used as early console.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 drivers/tty/hvc/hvc_dcc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/hvc/hvc_dcc.c b/drivers/tty/hvc/hvc_dcc.c
index 1751108cf763..136381bec7cd 100644
--- a/drivers/tty/hvc/hvc_dcc.c
+++ b/drivers/tty/hvc/hvc_dcc.c
@@ -47,6 +47,14 @@ static void dcc_early_write(struct console *con, const char *s, unsigned n)
 static int __init dcc_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
+	unsigned int count = 0x4000000;
+
+	while (--count && (__dcc_getstatus() & DCC_STATUS_TX))
+		cpu_relax();
+
+	if (__dcc_getstatus() & DCC_STATUS_TX)
+		return -ENODEV;
+
 	device->con->write = dcc_early_write;
 
 	return 0;
-- 
2.25.1

