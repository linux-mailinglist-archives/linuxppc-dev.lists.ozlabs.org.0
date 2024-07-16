Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCC933495
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 01:31:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ULB5aMOy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNwLz4yn3z3dVw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 09:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ULB5aMOy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2407::61d; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNq570lSLz3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 05:34:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcHPMn3pw340zMOb5OX/iwvzfyDQgoMIquMwBoIuIQTtxyxXL3YLrcqOSiSfPzi3ZMI85l0TeIZece7wln1ginxXH6NqdXUNetH5XEjCu9627KQDnYExlPhcUjlqTf0zLtnXw+P0L821r+iL5CJ+AvnA4Hm5kZc6mcEXqNkgqcm7L04T+2vHNp+xPCJD9k8OgKedW5iKQFRpkpcNJNdrvoTto/m2QtcAjNn5cwyh0yFUvXu6vWSnyH33wfKijPjdCj378MnTbNX4/h29hAy5ARwiMrsZQUohPXfaX1GmDI1qtP0bloglsPEYX0aJ6p9wV8WlJaSsod1u0yrkDsBvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUaZ2CCCwah1S2bUG1wuLlx9XA+UQHA5nrENPkn/Gb0=;
 b=Yn1dabyW8TDy6A/otBKBQTNt39fqQGqtFXsc229rBW2o5WHNU8fAC9O4wKbCTw5x6fX11NgpWQWyY4mlxBlThbvWFmB+afxain3vU3lFGtv1iuxox6svV7eECkGiKS8oZgAl01qUjXaBkk6mWoxdPZJWVvPxh8ZUjEHYzRmJcoBYYaq7EBe+FxXcvx0bSz1zSE7b+WlzITXp0hPxlHgoP9jF8DREQq0QWcqonznEpuu1OAV2/lehpQpMtmGdzXotuYUVMyD4ylJ0eZx3zS0ye7ogSvkpof343DA2ix1p+XiSUCfkhDKjyPC3+Np+YtezCKtduHNx80110vBOX2y6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUaZ2CCCwah1S2bUG1wuLlx9XA+UQHA5nrENPkn/Gb0=;
 b=ULB5aMOycgpJlV5PgHbMZ5Hqnk6geQrG/Tt0l8KWpmbusv/w1YR2UF2GPxpWcxWxNu2fWuoZNq9OObmPqAmKkIfBxe2TvxhO+CxBstUaUejUrkLr4jdUW0X/1d4jywDiYqo7z1PPOD6mXJmTcys/D/ehHYaKVn9rYc1NoYwyXVg=
Received: from MN0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::18)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Tue, 16 Jul
 2024 19:33:52 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::25) by MN0P220CA0024.outlook.office365.com
 (2603:10b6:208:52e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:33:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 14:33:50 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 16 Jul 2024 14:33:48 -0500
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Arnd
 Bergmann" <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, Yongji Xie
	<elohimes@gmail.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 0/8] PCI: Align small (<4k) BARs
Date: Tue, 16 Jul 2024 15:32:30 -0400
Message-ID: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b27bc0-1815-4322-0773-08dca5ce384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?COLMGyPoWBIX6dKXpjF5ZkY9S/jC6swul93KXEgkvHAxULSkdVmAvfbJ0zu0?=
 =?us-ascii?Q?Hjwj1BwOpo7RBCbdRz58Ba5Ww2YllC1gUFYmbEmIZ1T9jrlQ/rf8dtFxT4zw?=
 =?us-ascii?Q?IP0ciO3Aa4mtddZ+fs7t6zWdGv4cuStuyLUsy+qZ1S81jwOVDhhdwPewZB2l?=
 =?us-ascii?Q?I8zBvZjI8ZVXcKSMKX5L/W7TqepZMRPdH8K+6cTF4AzDayEMw+7gg8DhZQ8b?=
 =?us-ascii?Q?hH/Z4WGN42frQRWcfseLMicXcR4M1Y8MAIXlXC7WFo6+26iT/iKwvKTPQzbV?=
 =?us-ascii?Q?w0Eek9dBaea9kqER2Zj+Laj785QG4nyuoBLETs1BRO+BAlyQILvEE8h34azh?=
 =?us-ascii?Q?fTxcZkJ8CE79+couOnJsnTn9f3C4DJzUrJJFYcrKUPGb0r+WY4qZ0v4oSbEK?=
 =?us-ascii?Q?xN43Jqqc5asvoooX84Rq4Zqk61Kig2yNHF0hszGVWXVlyF5jmYKiVKP9tN84?=
 =?us-ascii?Q?hXvrIhbJc+6HE/roB7hjLTlBPsYfGrlIBJYWAF7SsjcAcnPAsqgReOgAoPxn?=
 =?us-ascii?Q?Y91MzDNT8rMybSxjkOTrFJoMdha6rqDDu/fi3oIecFddxek630dAhYgFaNnM?=
 =?us-ascii?Q?KObQifLWVIK+h1B/lLGIsW/Z4sUb+pO/hUNy4lgoQT7vmWlZLpRJ54hUJZRz?=
 =?us-ascii?Q?5HMzb9xK7LzzvLDCz5Mhjpl9eG9/UFsK5SY+LuZBU4vvVF+IQup4ybHcVbm/?=
 =?us-ascii?Q?0oUWei880rMdbu6/IuhKMni8Z+fmD70p6YGk9DrxYmDA5RRnweeeI+Z/TPBb?=
 =?us-ascii?Q?xd5dnDsiFmO4d59nS9cl3AUje47pachDH8Vsi3po9fX0lRdRm8KhImJPNC7c?=
 =?us-ascii?Q?jxZLxCIt1DmpQFtVJ00Bf4YTPPf/uQ4iIr/fF3jmh2wrHV4jVb7fM+kSiK1h?=
 =?us-ascii?Q?6+SWihE8xspqmF01zEJOtD2PECX7oZv7OwMmZ3nj7zdlGkqQsP32EPDJptDg?=
 =?us-ascii?Q?H6FkIKaaiAmus7SiShZ6B19T9DVwc3roHDrufZH2FslrSETBpdB3EtkgqozQ?=
 =?us-ascii?Q?vceBV0rAVtiffE/BhQfbvLyqAV5GUunpduzH3jR+XPufQzFHs/G6L5/YQvIv?=
 =?us-ascii?Q?U4O7xC+6kAXofrXF1I4MIuFg8b+ulmgzBpdNNF3qSbjMdqHCACqLfzwcb0O3?=
 =?us-ascii?Q?P3HweNzMJLQpn6i6B7RAGnpBF71MRITHTv7FCLU5WzFtmam+t9Qzk9JMmp/z?=
 =?us-ascii?Q?R3F/fRUbLHrYTGq9kEi2+DuWbHmSkaAb0mJnaOZyYNfcXZLrSQ6gT5t1alKK?=
 =?us-ascii?Q?gts9eRNy1+T4C56HJ0oai2jbC3WTcNRR9frSci3saHYffhxhnXNBUX51A/2o?=
 =?us-ascii?Q?62ivYuybuFdDHBomVUDGuvE8FtjjGV5C4USBbqHNswWFAac5J05t3TO+f+si?=
 =?us-ascii?Q?quQcgJLM0F4iYRvjPoeGybXaursRHaWBAJSj4yq4iXTa3rlKxg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:33:50.5495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b27bc0-1815-4322-0773-08dca5ce384c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:31:04 +1000
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

This series sets the default minimum resource alignment to 4k for memory
BARs. In preparation, it makes an optimization and addresses some corner
cases observed when reallocating BARs. I consider the prepapatory
patches to be prerequisites to changing the default BAR alignment.

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

v1->v2:
* rename ("PCI: don't clear already cleared bit") to
  ("PCI: Don't unnecessarily disable memory decoding")
* new patch: ("x86/PCI: Move some logic to new function")
* new patch: ("powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment")

Stewart Hildebrand (8):
  x86/PCI: Move some logic to new function
  PCI: Don't unnecessarily disable memory decoding
  PCI: Restore resource alignment
  PCI: Restore memory decoding after reallocation
  x86/PCI: Preserve IORESOURCE_STARTALIGN alignment
  powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment
  PCI: Don't reassign resources that are already aligned
  PCI: Align small (<4k) BARs

 arch/powerpc/kernel/pci-common.c |  6 +++--
 arch/x86/pci/i386.c              | 38 +++++++++++++++------------
 drivers/pci/pci.c                | 43 +++++++++++++++++++++++--------
 drivers/pci/setup-bus.c          | 44 ++++++++++++++++++++++++++++++++
 include/linux/pci.h              |  2 ++
 5 files changed, 103 insertions(+), 30 deletions(-)

-- 
2.45.2

