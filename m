Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A67C939D3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 11:06:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=boVNr7YL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSrqJ39fFz3cxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 19:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=boVNr7YL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::61a; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSrpb50NRz3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 19:05:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4laMHJwiGM0eeqmCt+HNC0B/cLq/Ze9vZ9XOzRzmobJxDZufrdOjvIAQJT6qByTYv5epo07l2idf283mLkTKjAApeqPzmSZYvDpw3ntXNZQAB3UKEbd2+YqpU09UOo/qOhLGdkrJTqrnIvasC2Q3yHmu5OJZilOFQkdYkiMWp+D4rG4R5Rq/8OHuETgw1Z2dssQBeJ1swDlIKOT99NHqSjqlniD6qlQPtlzAvhmRQWcds0cdmuzmyuPWFUQbArmFv2MREEUvTEcr/gQUBGqICg4tmdQKLEVrz/WEpbvV5BoWhdwjLNi0Ul2hrIckltsvzAlyo+fyul+XNnc2rcSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtMSQ2UWgJ3UdAMy9RzIntBd3GmM49CTeq9ZcqRfx78=;
 b=hwBoVFb8tv/zt4ih1MdUV20g7PM8jZqhUtBcBnad1CNAOipHkBkIBBpa6uLCIzmTp/k+0iT/kD3kCLmzvoIt5z5sB/w4hlgJE6xjA8uAllk3zMkndTXbYIfh4moqEoDaVEB8HzUtpf2ExWFLCH76AQFx5cfhvJGq/atXQoU4llorzogIzSW3KnOxaeO/ZaFWEJ1OTcuXkmIdZ2HMJVEqrI7Gad7pA+rtXdla5TpHipDSsMfEtoVdDJlzX+mTWDi0NfWg3DAJnQU71JYbN0eFkIXmS5Bf85rxls2WKCysA8oYPj2+Gg/r5fsdyaMM81C3mI3W+noTq+3wbzEpUIsKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtMSQ2UWgJ3UdAMy9RzIntBd3GmM49CTeq9ZcqRfx78=;
 b=boVNr7YLCnVfkcRIfp9THW/SkV74OFR1hIpbVSuZUMJQmvwN07zXQ1EYbUynM5qL/FGiz9WE4JJi8FKyUGnbgsH4HJLTB5RbJ5uCTOFeJY+XFce3SWauFsbt7KLsHSsCvlmvl+KmguCFXAKym8o2AFqT1jNJdeP+DIpR1iy/ITg=
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Tue, 23 Jul 2024 09:05:17 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::1d) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 09:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:05:17 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 04:05:10 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v4 0/1] Add XSAVE layout description to Core files for debuggers to support varying XSAVE layouts
Date: Tue, 23 Jul 2024 14:34:53 +0530
Message-ID: <20240723090454.8241-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fddbe6-c88c-49e1-bcbd-08dcaaf6929b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5XpCy1OC619rfvmf07aGE/Id2+vMYDDjoNuD8tXPzXu9NL3IOMSGDkPDVA/A?=
 =?us-ascii?Q?yPUdy+h2B9ryFhhbzmAExp49qLsNYZB94zc8HWfwN1zLzY/EBFslBBUxHvg/?=
 =?us-ascii?Q?B515s8XuFBY9SVV5XRCqJC+PdVs/46unqDPQTld/cVpDMgA9XJZLOtKvi1/0?=
 =?us-ascii?Q?9tyi0BpEwZmZ1jmeIMmvnk8KxTvwZYDZUehPUJKUsUwzEc9At1kZ5RgVGFDT?=
 =?us-ascii?Q?vkGxFMs+Hib+mbphgY2+Kzmf9B8lx1CilaLa55QkLEe4hmZ8SCZBF0C457gE?=
 =?us-ascii?Q?lb1J3vnXHIKlVe2U8TFQRryjdRMxfJil9IelkAxl6cf8kvOrCcRy83Iq0scl?=
 =?us-ascii?Q?U5ysuanb83DKGiXftkIBlOgrFthETdrcIRJYVCipS/Dy7L22oKy5qeY90pN7?=
 =?us-ascii?Q?aga5x2/SJMZO4tkgI6jP7AyiFciDAhJYydusB7i9qIPstNhb8juJxFKvb6V8?=
 =?us-ascii?Q?C4y8lSwI5PhtDc2eoB62YU5G97qeU+9YozNRY6GSkhh/1TJdhGYihbSdVr4n?=
 =?us-ascii?Q?W4AoDhX5+TS1cUnz/uiHFa6N9lolZW4rvBrm91HQYj/1Mi+bPQ0HB9x4WYDy?=
 =?us-ascii?Q?FM+ciBkgeSPOLbwj9730R9G8Ei1i43oVBWxATL0wGskC2xBKP+m9FpH1I1Gc?=
 =?us-ascii?Q?4Ae/QoHc1IYNy6nFK9SvWmbgu107FAL4js4UiWaYAl+kja5c7CaYnxZRRKLT?=
 =?us-ascii?Q?bcClti8YAb9197Lo8DaZQ/F3xvsU3NBINEk/AzLA9KjksMVvSRqyiCu3He0H?=
 =?us-ascii?Q?+G/6pJssWL8EqTSFTO/sX6fZ9Bk3nHB5S8RSjHO6N/35eUQUIV3y0Lq/X3RU?=
 =?us-ascii?Q?3fVa10lWX1fqzqKiIqAgH1zgwWNRKGCRcfO7hWzFORa3otX/mQCnFls2Tt5p?=
 =?us-ascii?Q?y3Fl1CyrK2BnQj+j197/kP8pIF4pkdY6zoSVcn/3Tui5d3OQCglZc9ACcBwX?=
 =?us-ascii?Q?iWa08Pw5jvuv50Nk5BQll7W7iu7uoEb7okkPf90ACVXVu3OyecCZRdRmqop5?=
 =?us-ascii?Q?CjS6/TSoQR7hRu2OfnHoapxug65Hqmb7kt4NyDfxyHzCWrnI/TAYpappKKRu?=
 =?us-ascii?Q?6JXUZSfQ6PUaJkcHSOZtnNcwMMHI/GFIAaR33B0y+NfjZ0v7/ptSFHa0rBHC?=
 =?us-ascii?Q?90nF4bfklOV1zLbzjVI0YolRHJ81coaraTsnNcsgPXIMaewE4N05RSpOJ9HZ?=
 =?us-ascii?Q?XtSVcXTsBW2686y7FWXnfLj26o4vjxcoF62fwseQkJ36E1KfCObsyh0RY7B6?=
 =?us-ascii?Q?qku6OMgNgoAi7ymLG7wbnl1ysmC6cJ5a7PDIKWJ1vzfgTPXvbI2B1KmtKecT?=
 =?us-ascii?Q?k6OWjuHPF9jHGgYzm1Mz0uCOKkBgZCl0xOSapXR3TBjXOTmYQ7DL3gnDoPS1?=
 =?us-ascii?Q?C8L13u2p57oifVKlWfgi8d+Dil+EXEUhknKhICnxhVJiA58YkrNd628nNDcb?=
 =?us-ascii?Q?YjymXJLbvnnTzs2l1obe9KP1KBEm0iUN?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:05:17.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fddbe6-c88c-49e1-bcbd-08dcaaf6929b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch proposes to add an extra .note section in the corefile to
dump the CPUID information of a machine.
This is being done to solve the issue of tools like the debuggers
having to deal with coredumps from machines with varying XSAVE
layouts in spite of having the same XCR0 bits.
The new proposed .note section, at this point, consists of an array
of records containing the information of each extended feature that
is present. This provides details about the offsets and the sizes
of the various extended save state components of the machine where
the application crash occurred. Requesting a review for this patch.


Vignesh Balasubramanian (1):
  x86/elf: Add a new .note section containing xfeatures buffer layout
    info to x86 core files

 arch/x86/Kconfig                |  1 +
 arch/x86/include/uapi/asm/elf.h | 15 ++++++
 arch/x86/kernel/fpu/xstate.c    | 89 +++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c                 |  4 +-
 include/uapi/linux/elf.h        |  1 +
 5 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/include/uapi/asm/elf.h

-- 
2.34.1

