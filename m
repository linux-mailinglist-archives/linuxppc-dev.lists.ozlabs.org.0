Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355BE94AC98
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:18:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GZzd3jQO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfDMq18cLz3d9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GZzd3jQO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::624; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfDM54JRRz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:17:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glEDpMLVARs6ReRh8NaR1ph1C2y70ahgyJT9Ll3FMla8QHeot/g+N0TNPObZkEAvDeIbYODBpz3XpPqNlpzb05N3HKeAlGcXyvWWar5N9/4uCXLZebgZZjbaybuX/LN4Vn8gkhGl8tie8sgUzSQmWtXN/r7cd+WFO3YcI9A8Mz97cCWWxtSVpUn0LKuIWoBhlH5X1JN5L1xvEgInNpn8Jt2/nIqjuV3eTRxnuojaLWlfmzgqBB2PZpl78LPpFZFGIhC+ny4xHEaMgcyJ76qdBGuVXJzP2tnh1qX2lpVsPwNoEf4ZWxNdZi39z0fm/E1gyfL1RAnGIrLgX1vR8KqxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqD0UQKzYaC/AbvBnKgM1Q9wq6jLCtY55rqZEdKt6ZI=;
 b=BfKQM566tON56SPmCBBw1FS8MlJu7zy1YKPhbgPPOsS1yRqfSxkFqa1Q2QId71cbmB3KhDSf+vv8S9nSY7skyCbKTxRnlJr95H+3OazzJU07uGTj5eXdKnPgZUOoM3A2QgsnRrTnmVw5wgg4LsNJvbVFCi9lm7ARRZy7OKWJAOzEZp7GbNe5l3TwF+ayVnpYY2NAOVch93qzxXBA5keNQin2qpZBW6I9EEOLJG3LukecXS3shLtN42Lk0PFqiqO+2XIusSOP24sa71oSoWWnihIc3J2VyjtusDrXm4BMKShMGJbZyeaGocKnUZk3l9KFOF8ejVb9AQZtYcfElEtsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqD0UQKzYaC/AbvBnKgM1Q9wq6jLCtY55rqZEdKt6ZI=;
 b=GZzd3jQO011Lxc9J1udRQuLJD/Bc4SU7MUMihNkRd0UFT4zkXRMdkNfkO9+2B8YdoQa9dTW2gHn1vIalVlvS1pop9j9xMk/hUPW0yoMBOoQAIiHuhH0ubMy5wncSb5GLePv3ltDOe+eILqKkxnr+T/xPXJJ8K8AUgX2paC3gs/4=
Received: from BN0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:408:e5::21)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 15:17:27 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::a9) by BN0PR02CA0046.outlook.office365.com
 (2603:10b6:408:e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28 via Frontend
 Transport; Wed, 7 Aug 2024 15:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 15:17:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 10:17:26 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 10:17:24 -0500
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Arnd
 Bergmann" <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, Yongji Xie
	<elohimes@gmail.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 0/8] PCI: Align small BARs
Date: Wed, 7 Aug 2024 11:17:09 -0400
Message-ID: <20240807151723.613742-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 2586882c-a4fe-4973-d731-08dcb6f40c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?MvetW+L7jH8+Spr+g6axWt3hPcykMqFaCb8vhnp5ZLZ/f8IIB0dvZG8belKy?=
 =?us-ascii?Q?NiMyjgZProDYeeuuqzedI3JTo9Dt+nCvty0zkPE9s3c0lEk6s90nArwf0H8d?=
 =?us-ascii?Q?6b8WZJNZpQPv0598pXN3RvuwFSMQMxkMFIDX8fs+JeWBUAD/hDL+juol50Bz?=
 =?us-ascii?Q?06GLGH3HsVfh7g4Jg8/wTHg++Y5wSl8Y7ybcS6F3zDhw+60hdMFHDlXZ3QOt?=
 =?us-ascii?Q?bXpuKz+d/u6szgW6zt2bKALzHlytZqncwUZh+0blFzbEEgsAR+F4cQBKoQuZ?=
 =?us-ascii?Q?AMaeDqvOH8NmeF+II2jUHWl9jqQ5fzwkpW/WzhtddrJwJE1fp8m7uS/BJRPv?=
 =?us-ascii?Q?E+HViipOySxRMb2W7kvkuqdaSCUNkWh64u31mwuNl17pmJcpZb9gYNcu2inN?=
 =?us-ascii?Q?gNWe7LC01tUgu5X5Sq8ohRY4+E02WylgmSAPMF+KfgEPlV8i+BL4Cv9a1QN1?=
 =?us-ascii?Q?vm4mbrEKBMRWcLXA6uaeAJEsqotznr9+f3XdJnOQcL5EUb8aKjDr2w/rkxqz?=
 =?us-ascii?Q?pIHo4OIGr3i6oNp+XoNtpKrBEGcXOi2tPbSp2PAzexV3xsOpR6PZZO932p+o?=
 =?us-ascii?Q?BP7+pXy/yoL9EqxLnFCfttck+fAxiRD8/ARDUUOUIYQgrFl/BR44Bs457A8J?=
 =?us-ascii?Q?s2xzk+OsjSY/mGtCuJF5ZBgjq5UG4cZGQrBqNt6tyUPo3vvausnpsifOG86y?=
 =?us-ascii?Q?9eohuwggyJG70szfMbPoZ+zJBw9Ml167RT9GNkIT5grihoKNnlQJnDxCVW2Y?=
 =?us-ascii?Q?g0FG4uAySB0SWncueRPJjgi5FwN7+bPauLFOVY6uKXj2arEFTlUal1qSFZTy?=
 =?us-ascii?Q?5Qd5ElNItXl/X6MKwMb9cwGy0kbzeIHuyuVYgcMbHY1p0OQd3ZvvJDxVbqpm?=
 =?us-ascii?Q?Bt0y3r62SFn6Ek5zhv35HJHymoNKR9jSdyy2GV03XedISUboGiPfS6kw5iJf?=
 =?us-ascii?Q?YlBUQIPTnxBE1zZ6/LsB88bl/V15HEzcT0vsglBYJ/pyivXIRh/JWZg5xMEE?=
 =?us-ascii?Q?IEnX9mLGyDrFV2lCZh0/rXhsXo+xds6HIcvacT8sscsU9cOMEEyPYf/PkK4I?=
 =?us-ascii?Q?kxIOSjjuXESzaAsb6OVD4N8yydPkS2vcwsZ6bke8Q+FhcJxEsgLpT1K/qsGY?=
 =?us-ascii?Q?qEz9hZLe6xdgZTJjfSx76ylgp1YO6ctNLLdE/nMlcC0/COVyA5WhVg9DWVV3?=
 =?us-ascii?Q?lhEBbFJc65RRwivLRJjrgR8O1x+Haq0Ydbk1PI6i+VnSwNo98jndROpIz6Uz?=
 =?us-ascii?Q?n4Mc1PTtZMFLyegJLkrbXbNtbwN91oX88tI9icUldQIzFS94+9NOgpK+aLaY?=
 =?us-ascii?Q?Y4G9OvY4+57sanHghZ+ELafvnZlaaf+/qqPonD14T2H1Blum/XImGZLn5hYS?=
 =?us-ascii?Q?Wvjqg2tnCyfdpcjdBIgG0HvNxdnKplLfX2GzQ1kUyLPPIuGulA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 15:17:27.4567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2586882c-a4fe-4973-d731-08dcb6f40c58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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
Cc: linux-pci@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stewart Hildebrand <stewart.hildebrand@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In this context, "small" is defined as max(SZ_4K, PAGE_SIZE).

This series sets the default minimum resource alignment to
max(SZ_4K, PAGE_SIZE) for memory BARs. In preparation, it makes an
optimization and addresses some corner cases observed when reallocating
BARs. I consider the prepapatory patches to be prerequisites to changing
the default BAR alignment.

I considered introducing checks for the specific scenarios described,
but chose not to pursue this. A check such as "if (xen_domain())" may be
pretty simple, but that doesn't account for other hypervisors. If other
hypervisors are to be considered, or if we try to dynamically reallocate
BARs for devices being marked for passthrough, such a check may quickly
grow unwieldy. Further, checking for the MSI-X tables residing in a
small (<4k) BAR is unlikely to be a one-liner. Making 4k alignment the
default seems more robust. Lastly, when using IORESOURCE_STARTALIGN, all
resources in the system need to be aligned.

I considered alternatively adding new functionality to the
pci=resource_alignment= option, but that approach was already attempted
and decided against [1].

[1] https://lore.kernel.org/linux-pci/1473757234-5284-4-git-send-email-xyjxie@linux.vnet.ibm.com/

v2->v3:
* clarify 4k vs PAGE_SIZE
* rename ("x86/PCI: Move some logic to new function") to
  ("x86/PCI: Improve code readability")
* rename ("PCI: Align small (<4k) BARs") to
  ("PCI: Align small BARs")

v1->v2:
* rename ("PCI: don't clear already cleared bit") to
  ("PCI: Don't unnecessarily disable memory decoding")
* new patch: ("x86/PCI: Move some logic to new function")
* new patch: ("powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment")

Stewart Hildebrand (8):
  x86/PCI: Improve code readability
  PCI: Don't unnecessarily disable memory decoding
  PCI: Restore resource alignment
  PCI: Restore memory decoding after reallocation
  x86/PCI: Preserve IORESOURCE_STARTALIGN alignment
  powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment
  PCI: Don't reassign resources that are already aligned
  PCI: Align small BARs

 arch/powerpc/kernel/pci-common.c |  6 +++--
 arch/x86/pci/i386.c              | 38 +++++++++++++++------------
 drivers/pci/pci.c                | 43 +++++++++++++++++++++++--------
 drivers/pci/setup-bus.c          | 44 ++++++++++++++++++++++++++++++++
 include/linux/pci.h              |  2 ++
 5 files changed, 103 insertions(+), 30 deletions(-)

-- 
2.46.0

