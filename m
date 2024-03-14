Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D20987C534
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:38:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jJy7jNvG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twj2M6jW2z3vXB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jJy7jNvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::600; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwQ5S72MTz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 22:24:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g80selltH/zxpTiO0sFa1rT0jizCOj7632ep/KN26RURz1JMDqatd00T+mDn3pT8gFvvIoRZKdJ4klx3BjqXAKBPlB1j/DlOdXxCZCk+NrfSlRd0I/JDtKrkv2BeUqjoLUTOvJ4A52od7pSM7jQvfdHThxBofOSSsw5nPhFc/fEBNxwpUlvit2Bn+s10Ot0P1RwxcIXfc52bHIvE59NjDwbciOFgEvRcKreHayOI0kac7IFe+swakUGQe9Rx2qZhU8OPUgqvOtlUyHkzbOeORUNUcbJimB1Z5hgjIWTeY72cdU7TkuTPlcn90jHOuKYGWWfPGsujkkac0F5ZS096cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHXxC+7libhS9xFmXORztPpKAdK1hI+bqqQlSSjMfJ8=;
 b=AhuvRdVnrQekmP70hzLC6FkRi6oJFAKWNfqEmbpHjurEt0yx26BVcxauxwT1Ef4WLQ+PtgABu2TFPzzQ3B9/TTGvOIZsv74hbIczRF/JGUwNqKkDzb7rMs8uFSpR8zkUzVJsXcKJydVVT0Zzt/E6hnYnyA4Cz/VyXzJRUP4TyImd6B3oIjLZj5B/n3Icqch0ktN01xOGlqxWBlpr5ntCkWIJeQ5UCijaT+bGGmRgoEaAizS4ZEH2LYk0vcbeuZ1D6Fi4FzjhkTzcSfaW0Yf5TekJsBXCHWVmTOr73dPaq1nm5zik9MHFU5wL/9kc4XTWPpw1mhgiMkcMUWpb4amelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHXxC+7libhS9xFmXORztPpKAdK1hI+bqqQlSSjMfJ8=;
 b=jJy7jNvGxKQaCBqLkGd0yMbtE19tpJpK4WYjjpXyWTOi8XDoaK1ZqrFvpWRax8BXjGamAJ086YYL42H2BdTRlbEP9bIwr0NgFE8OTWkWkItIGuguBoF06dva8LVquIJ5xN4YW2tAYTe7KA4GFy3fCmuU+kVfH8OPpKZ48d/dJY8=
Received: from CH5P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::17)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 11:24:20 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::6a) by CH5P220CA0019.outlook.office365.com
 (2603:10b6:610:1ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 14 Mar 2024 11:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 11:24:20 +0000
Received: from llvm-slrz6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 06:24:15 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH 0/1] Add XSAVE layout description to Core files for debuggers to support varying XSAVE layouts
Date: Thu, 14 Mar 2024 16:53:27 +0530
Message-ID: <20240314112359.50713-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcac38f-4d63-40af-ce13-08dc44194b1d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NKs2ChYE4ZWf5PYK6KG2iY4y1DAdBDYef2Z4WOyCgfcbGLWpTNG5K6BCulkqoC9kQT7+YE2SyLkBoEw9ojozYl13rDlqnrzMwJAyDxDKJG/ixUSqPtewYkbac6QyMlhRuxm8dX2N37pogWfjWmdlyjWz5WabmU0a9N3pI4rnhCkK/6S7SDZYPyfHf+g/4OXq1cWtgM1hqIZPXfyEfPAZbi+OFzdD/DOrjt1dJZ66903e2uDuFUtENYO6X51uoTcQQzHly8Av3JsJzNKMx10CwHrQrFovJZcMWjCMAE/UFQqxY4Eqp43mEAxbWsCux8JTBQcyv6jIDkZCnbMXV876NEKUgaRKLNdkGBe4oHsRsK9HnNL2qWKES7G5VClEMggoPBYubU/x8YH9nRQXCMGmCljOblUxOuR/cfE2DLmIu47THkRC9OiNTlzVpYXgMT6V9hVH07cNUIDYb5Y99IDFzTCRs57V0sWHSM7aEAgoK1M9iBhqRL6L8YenXCbzJe7e080cJyTfGbbHV2V5m+23NwjuFD0GtAoEHtX2zcLH+QoQELwUdtYNuH2muxm35PYjX4BsjB749GvTn+OALdzGoGVEDGncKW94KAJQ5P0BuUd9Yzls4mpIeEui0e7utZhl5u0mkrzyKJWMolFi6pVyCRUrJ6LE3w4/3YVDQM+Rq3xh+KHLdZ+VsTLj2R3AwxZwRFy/VQYT588Zhq6E4zsEPA==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 11:24:20.4258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcac38f-4d63-40af-ce13-08dc44194b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Mailman-Approved-At: Fri, 15 Mar 2024 09:37:24 +1100
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch proposes to add an extra .note section in the corefile to dump the CPUID information of a machine. This is being done to solve the issue of tools like the debuggers having to deal with coredumps from machines with varying XSAVE layouts in spite of having the same XCR0 bits. The new proposed .note section, at this point, consists of an array of records containing the information of each extended feature that is present. This provides details about the offsets and the sizes of the various extended save state components of the machine where the application crash occurred. Requesting a review for this patch.

Some background:

The XSAVE layouts of modern AMD and Intel CPUs differ, especially since Memory Protection Keys and the AVX-512 features have been inculcated into the AMD CPUs. This is since AMD never adopted (and hence never left room in the XSAVE layout for) the Intel MPX feature. Tools like GDB had assumed a fixed XSAVE layout matching that of Intel (based on the XCR0 mask). Hence, the core dumps from AMD CPUs didn't match the known size for the XCR0 mask. This resulted in GDB and other tools not being able to access the values of the AVX-512 and PKRU registers on AMD CPUs. To solve this, an interim solution has been accepted into GDB, and is already a part of GDB 14, thanks to these series of patches : [ https://sourceware.org/pipermail/gdb-patches/2023-March/198081.html ].
But this patch series depends on heuristics based on the total XSAVE register set size and the XCR0 mask to infer the layouts of the various register blocks for core dumps, and hence, is not a foolproof mechanism to determine the layout of the XSAVE area.

Hence this new core dump note has been proposed as a more sturdy mechanism to allow GDB/LLDB and other relevant tools to determine the layout of the XSAVE area of the machine where the corefile was dumped.
The  new core dump note (which is being proposed as a per-process .note section), NT_X86_XSAVE_LAYOUT (0x205) contains an array of structures.
Each structure describes an individual extended feature containing offset, size and flags (that is obtained through CPUID instruction) in a format roughly matching the follow C structure:

struct xfeat_component {
       u32 xfeat_type;
       u32 xfeat_sz;
       u32 xfeat_off;
       u32 xfeat_flags;
};


Vignesh Balasubramanian (1):
  x86/elf: Add a new .note section containing Xfeatures information to
    x86 core files

 arch/Kconfig                   |   9 +++
 arch/powerpc/Kconfig           |   1 +
 arch/powerpc/include/asm/elf.h |   2 -
 arch/x86/Kconfig               |   1 +
 arch/x86/include/asm/elf.h     |   7 +++
 arch/x86/kernel/fpu/xstate.c   | 101 +++++++++++++++++++++++++++++++++
 include/linux/elf.h            |   2 +-
 include/uapi/linux/elf.h       |   1 +
 8 files changed, 121 insertions(+), 3 deletions(-)

-- 
2.43.0

