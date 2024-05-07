Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3908BDF0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:56:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iT4AWdNy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYZ86z7pz3dPs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iT4AWdNy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::601; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYYQ5wR0z3cds
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:55:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crUm/L3kkFN69lZQuo4zYpFMRbrHwKhb87f9cwA3De2dLuNLgM5rkwaTvoKO2WfuFISDojMIB/A+gm4SO6t0dBMcg29L3sXpYFgZ2BaajQqSTPqKBBQ3X1Ho2I/FgXmyRNbWcUffJNMCGbWSBmeLH60MaN6VgadzGLLUlBsSll+73tMA+0hDuwN79jyCALCwoSLeUxjaiUow8/nJGTt3pFH92X+gOVKGsKgJc4NTmULpoEjzGNO+5tJsw9G1+YWnddW/vleGyBKJX7sseU7didLq6NtQNTucP89m69f5Fnmb6Id2SExiwYX52v5C8t7ZACQm9QJhG6pyNu9dUZtsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvWvcNyrfOh/mJWkZUAq7R+6sOUKk//y5OhCTj4Hi6g=;
 b=JNvGP5O3AKoEQxgXTkblVxwGCrCr6qyOnWpQYlO8ga19/Xlql05JCSCDFnaw9PvVmNph+/9musJ2pNA51PMJdqitZWHeydSLJZZb9zVLlpQySqw6EPaqaD4RixfBQ4UfiN6j4c0Xs6lDoIKHFuujVT2R4qkCCGt9xuH6w1EQMBVlRom3AZ64gEIszEcugn8E+4PMaB2E3id21H8D/Uy1VlNdh9Ow1gNJtcjSrMCXAzdKJGm4K2u0gEkPHlSJwREm9BDDq5SBg8DzAYjywxGNokqVEMBbyZjlqzsbKNe+jPakmI6TKVg/lvr51MDcoJQqC9MbXcNnyObtfAkuF8deZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvWvcNyrfOh/mJWkZUAq7R+6sOUKk//y5OhCTj4Hi6g=;
 b=iT4AWdNyrZRXKpbYE9gLSmLz93EUPtO84jbyTsaw3bUwHMiNCx/vku6EyKwpqzvwFQjE8DyLtK/LF6S1/srW8NmtQJ0uNYkmOTf1FJ5mll6Fa4jA7NmT4rMiJTeiRobbQrZbn3ZikfOoCzEmdio4f5ow+mGI6mEVsyBP2CqkK5s=
Received: from PH0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:5::23)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:55:02 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:510:5:cafe::b7) by PH0PR07CA0018.outlook.office365.com
 (2603:10b6:510:5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Tue, 7 May 2024 09:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 09:55:00 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 04:54:54 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v2 1/1] x86/elf: Add a new .note section containing Xfeatures information to x86 core files
Date: Tue, 7 May 2024 15:23:31 +0530
Message-ID: <20240507095330.2674-2-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507095330.2674-1-vigbalas@amd.com>
References: <20240507095330.2674-1-vigbalas@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: b805896c-55c2-4cbc-b2a2-08dc6e7bc287
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?jDrNtz4tlWcfY/dAu2iP2U2KV4YEj/VRCGDaSBIHteBYi0Yw/reYgPELo40+?=
 =?us-ascii?Q?nOAoY/kYJUGSbulU1U2NtCSOUCKj0HpIpBbV1d5LQc9F9aBXL+7Igq9K5m+l?=
 =?us-ascii?Q?epY9rfEr/Gge3d5jFd7I4EL9qtWp2Di5deSCOv06zEvrC/+qxd0kRoTiezfJ?=
 =?us-ascii?Q?53czmSHLRXORiF4JIJPzfey8VxwA/NZQcwU4lDovN3bHMPw8LID2qkGGlZ2Y?=
 =?us-ascii?Q?YXCflsT8wkk2HOX4/Zi00O7nbuVQzfsgMB6hiMk5FD/UMH5epcksehVtzQ6+?=
 =?us-ascii?Q?YbT2/3lEowko0neNNHbKlj6GwRDjujqUbaDO4WBmCY4ofK7djLPimPl1EcnN?=
 =?us-ascii?Q?nhBDgZ+Hmx0XAW9b2+TMPxqcMdckWuko9o7gkt8rr4wFsMraE2CIebZewmTs?=
 =?us-ascii?Q?bnsZqlxcVCP/sdwIziYJYkixSAI+d64mF1BlNovl0FRw0Fq+HLy8uVSI7XrZ?=
 =?us-ascii?Q?Tn3QdrbaaK1QwxnwjwstEceGbjeSKDk0jReTP70J9EZMGYQbxtdz18WY4iew?=
 =?us-ascii?Q?ottDAhcxoMrMu8XbYRlGqY2kHdCjCIucPmbZsPSUcYx2ydDCKBYh5dQHHHAr?=
 =?us-ascii?Q?Jg6mtj9mO7Hv/vPNSefokKCkY7H5kJngzrrxiVMKWX+XIrpbFHA2C4H1jPGs?=
 =?us-ascii?Q?EvMUEHzMlj0fIwK3p18fS0S0JB3nTJGXssyQ7oGJI/UO7C6D/cdFOjIybJNg?=
 =?us-ascii?Q?+eAAeGsZ359YVKP+K/DvFa4eqGRrPii7AKiILjGkJaI0TS24G7Z6Mxs7lkeB?=
 =?us-ascii?Q?gA+AB6nMWqAF/ew3VyK+h5IN250goKiq6YP3QeDfYeC/1vmy/hY+o3RoWolK?=
 =?us-ascii?Q?15jWiV2vzS+65RsFcZ1uUBZ80KA+AG1BwqqPh68maaw6JzLlwiuBndw0tx0h?=
 =?us-ascii?Q?El8DVOL1tWnsGiYMAYMkKQ8TqGEeweAL0IHAf71WJoi1NBG2BM6TaNOsioQb?=
 =?us-ascii?Q?sPVJVFnf+ikx6jHVaz5rwKf0bsLy3fD4Aa4OQQ2OvRt7Mp7YVl6+47bS+DKA?=
 =?us-ascii?Q?Xoq2I3Vd9sN6ItKzl1b51Opao4ogDwY6KzRFhbVzindV8Fthv4jqLP1859+r?=
 =?us-ascii?Q?49Mgxc+XIU0lKGjOR9bnpoeVDgBTOZg2OhUqT4wnsWOvOK5nygKixUyLqnKq?=
 =?us-ascii?Q?GtjtFozXSQ1PhmRDtvkOTJBRDo1bRjUg96o53qbtSgUHwJGJPB58vPvrW/6Z?=
 =?us-ascii?Q?UUUAmiXVOqqEZ2l/kb8xePOjiwQiIIzbGhZ6z19f/tkto01DH1YGnOnhpWBl?=
 =?us-ascii?Q?itK3kJ0hVaZh3gVxttLMLKM1wPeuYIDxTqoVDZegEIftlfuo6AWpKcl8QeEi?=
 =?us-ascii?Q?zTJ7YS46tqbyL+ueqmV0tt2+?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 09:55:00.1754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b805896c-55c2-4cbc-b2a2-08dc6e7bc287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878
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

Add a new .note section containing type, size, offset and flags of
every xfeature that is present.

This information will be used by the debuggers to understand the XSAVE
layout of the machine where the core file is dumped, and to read XSAVE
registers, especially during cross-platform debugging.

Some background:

The XSAVE layouts of modern AMD and Intel CPUs differ, especially since
Memory Protection Keys and the AVX-512 features have been inculcated into
the AMD CPUs.
This is since AMD never adopted (and hence never left room in the XSAVE
layout for) the Intel MPX feature. Tools like GDB had assumed a fixed XSAVE
layout matching that of Intel (based on the XCR0 mask).
Hence, the core dumps from AMD CPUs didn't match the known size for the
XCR0 mask. This resulted in GDB and other tools not being able to access
the values of the AVX-512 and PKRU registers on AMD CPUs.
To solve this, an interim solution has been accepted into GDB, and is
already a part of GDB 14, thanks to these series of patches
[ https://sourceware.org/pipermail/gdb-patches/2023-March/198081.html ].
But this patch series depends on heuristics based on the total XSAVE
register set size and the XCR0 mask to infer the layouts of the various
register blocks for core dumps, and hence, is not a foolproof mechanism to
determine the layout of the XSAVE area.

Hence this new core dump note has been proposed as a more sturdy mechanism
to allow GDB/LLDB and other relevant tools to determine the layout of the
XSAVE area of the machine where the corefile was dumped.
The new core dump note (which is being proposed as a per-process .note
section), NT_X86_XSAVE_LAYOUT (0x205) contains an array of structures.
Each structure describes an individual extended feature containing offset,
size and flags (that is obtained through CPUID instruction) in a format
roughly matching the follow C structure:

struct xfeat_component {
       u32 xfeat_type;
       u32 xfeat_sz;
       u32 xfeat_off;
       u32 xfeat_flags;
};

Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
---
v1->v2: Removed kernel internal defn dependency, code improvements

 arch/x86/Kconfig             |   1 +
 arch/x86/include/asm/elf.h   |  34 +++++++++
 arch/x86/kernel/fpu/xstate.c | 141 +++++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c              |   4 +-
 include/uapi/linux/elf.h     |   1 +
 5 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 928820e61cb5..cc67daab3396 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -105,6 +105,7 @@ config X86
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HAVE_EXTRA_ELF_NOTES
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 1fb83d47711f..5952574db64b 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -13,6 +13,40 @@
 #include <asm/auxvec.h>
 #include <asm/fsgsbase.h>
 
+struct xfeat_component {
+	u32 xfeat_type;
+	u32 xfeat_sz;
+	u32 xfeat_off;
+	u32 xfeat_flags;
+} __packed;
+
+_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");
+
+enum custom_feature {
+	FEATURE_XSAVE_FP = 0,
+	FEATURE_XSAVE_SSE = 1,
+	FEATURE_XSAVE_YMM = 2,
+	FEATURE_XSAVE_BNDREGS = 3,
+	FEATURE_XSAVE_BNDCSR = 4,
+	FEATURE_XSAVE_OPMASK = 5,
+	FEATURE_XSAVE_ZMM_Hi256 = 6,
+	FEATURE_XSAVE_Hi16_ZMM = 7,
+	FEATURE_XSAVE_PT = 8,
+	FEATURE_XSAVE_PKRU = 9,
+	FEATURE_XSAVE_PASID = 10,
+	FEATURE_XSAVE_CET_USER = 11,
+	FEATURE_XSAVE_CET_SHADOW_STACK = 12,
+	FEATURE_XSAVE_HDC = 13,
+	FEATURE_XSAVE_UINTR = 14,
+	FEATURE_XSAVE_LBR = 15,
+	FEATURE_XSAVE_HWP = 16,
+	FEATURE_XSAVE_XTILE_CFG = 17,
+	FEATURE_XSAVE_XTILE_DATA = 18,
+	FEATURE_MAX,
+	FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
+	FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
+};
+
 typedef unsigned long elf_greg_t;
 
 #define ELF_NGREG (sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 33a214b1a4ce..3d1c3c96e34d 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/proc_fs.h>
 #include <linux/vmalloc.h>
+#include <linux/coredump.h>
 
 #include <asm/fpu/api.h>
 #include <asm/fpu/regset.h>
@@ -87,6 +88,8 @@ static unsigned int xstate_flags[XFEATURE_MAX] __ro_after_init;
 #define XSTATE_FLAG_SUPERVISOR	BIT(0)
 #define XSTATE_FLAG_ALIGNED64	BIT(1)
 
+static const char owner_name[] = "LINUX";
+
 /*
  * Return whether the system supports a given xfeature.
  *
@@ -1837,3 +1840,141 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
 	return 0;
 }
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */
+
+#ifdef CONFIG_COREDUMP
+static int get_sub_leaf(int custom_xfeat)
+{
+	switch (custom_xfeat) {
+	case FEATURE_XSAVE_YMM:			return XFEATURE_YMM;
+	case FEATURE_XSAVE_BNDREGS:		return XFEATURE_BNDREGS;
+	case FEATURE_XSAVE_BNDCSR:		return XFEATURE_BNDCSR;
+	case FEATURE_XSAVE_OPMASK:		return XFEATURE_OPMASK;
+	case FEATURE_XSAVE_ZMM_Hi256:		return XFEATURE_ZMM_Hi256;
+	case FEATURE_XSAVE_Hi16_ZMM:		return XFEATURE_Hi16_ZMM;
+	case FEATURE_XSAVE_PT:			return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
+	case FEATURE_XSAVE_PKRU:		return XFEATURE_PKRU;
+	case FEATURE_XSAVE_PASID:		return XFEATURE_PASID;
+	case FEATURE_XSAVE_CET_USER:		return XFEATURE_CET_USER;
+	case FEATURE_XSAVE_CET_SHADOW_STACK:	return XFEATURE_CET_KERNEL_UNUSED;
+	case FEATURE_XSAVE_HDC:			return XFEATURE_RSRVD_COMP_13;
+	case FEATURE_XSAVE_UINTR:		return XFEATURE_RSRVD_COMP_14;
+	case FEATURE_XSAVE_LBR:			return XFEATURE_LBR;
+	case FEATURE_XSAVE_HWP:			return XFEATURE_RSRVD_COMP_16;
+	case FEATURE_XSAVE_XTILE_CFG:		return XFEATURE_XTILE_CFG;
+	case FEATURE_XSAVE_XTILE_DATA:		return XFEATURE_XTILE_DATA;
+	default:
+		pr_warn_ratelimited("Not a valid XSAVE Feature.");
+		return 0;
+	}
+}
+
+/*
+ * Dump type, size, offset and flag values for every xfeature that is present.
+ */
+static int dump_xsave_layout_desc(struct coredump_params *cprm)
+{
+	u32 supported_features = 0;
+	struct xfeat_component xc;
+	u32 eax, ebx, ecx, edx;
+	int num_records = 0;
+	int sub_leaf = 0;
+	int i;
+
+	/* Find supported extended features */
+	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
+	supported_features = eax;
+
+	for (i = FEATURE_XSAVE_EXTENDED_START;
+			i <= FEATURE_XSAVE_EXTENDED_END; i++) {
+		sub_leaf = get_sub_leaf(i);
+		if (!sub_leaf)
+			continue;
+		if (supported_features & (1U << sub_leaf)) {
+			cpuid_count(XSTATE_CPUID, sub_leaf, &eax, &ebx, &ecx, &edx);
+			xc.xfeat_type = i;
+			xc.xfeat_sz = eax;
+			xc.xfeat_off = ebx;
+			/* Reserved for future use */
+			xc.xfeat_flags = 0;
+
+			if (!dump_emit(cprm, &xc,
+				       sizeof(struct xfeat_component)))
+				return 0;
+			num_records++;
+		}
+	}
+
+	return num_records;
+}
+
+static int get_xsave_desc_size(void)
+{
+	int supported_features = 0;
+	int xfeatures_count = 0;
+	u32 eax, ebx, ecx, edx;
+	int sub_leaf = 0;
+	int i;
+
+	/* Find supported extended features */
+	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
+	supported_features = eax;
+
+	for (i = FEATURE_XSAVE_EXTENDED_START;
+			i <= FEATURE_XSAVE_EXTENDED_END; i++) {
+		sub_leaf = get_sub_leaf(i);
+		if (!sub_leaf)
+			continue;
+		if (supported_features & (1U << sub_leaf))
+			xfeatures_count++;
+	}
+
+	return xfeatures_count * (sizeof(struct xfeat_component));
+}
+
+int elf_coredump_extra_notes_write(struct coredump_params *cprm)
+{
+	int num_records = 0;
+	struct elf_note en;
+
+	en.n_namesz = sizeof(owner_name);
+	en.n_descsz = get_xsave_desc_size();
+	en.n_type = NT_X86_XSAVE_LAYOUT;
+
+	if (!dump_emit(cprm, &en, sizeof(en)))
+		return 1;
+	if (!dump_emit(cprm, owner_name, en.n_namesz))
+		return 1;
+	if (!dump_align(cprm, 4))
+		return 1;
+
+	num_records = dump_xsave_layout_desc(cprm);
+	if (!num_records) {
+		pr_warn_ratelimited("Error adding XSTATE layout ELF note. XSTATE buffer in the core file will be unparseable.");
+		return 1;
+	}
+
+	/* Total size should be equal to the number of records */
+	if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz) {
+		pr_warn_ratelimited("Error adding XSTATE layout ELF note. The size of the .note section does not match with the total size of the records.");
+		return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * Return the size of new note.
+ */
+int elf_coredump_extra_notes_size(void)
+{
+	int size = 0;
+
+	/* NOTE Header */
+	size += sizeof(struct elf_note);
+	/* name + align */
+	size += roundup(sizeof(owner_name), 4);
+	size += get_xsave_desc_size();
+
+	return size;
+}
+#endif
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 5397b552fbeb..833bcb7e957b 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2000,7 +2000,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	{
 		size_t sz = info.size;
 
-		/* For cell spufs */
+		/* For cell spufs and x86 xstate */
 		sz += elf_coredump_extra_notes_size();
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
@@ -2064,7 +2064,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	if (!write_note_info(&info, cprm))
 		goto end_coredump;
 
-	/* For cell spufs */
+	/* For cell spufs and x86 xstate */
 	if (elf_coredump_extra_notes_write(cprm))
 		goto end_coredump;
 
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b54b313bcf07..e30a9b47dc87 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -411,6 +411,7 @@ typedef struct elf64_shdr {
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
 /* Old binutils treats 0x203 as a CET state */
 #define NT_X86_SHSTK	0x204		/* x86 SHSTK state */
+#define NT_X86_XSAVE_LAYOUT	0x205	/* XSAVE layout description */
 #define NT_S390_HIGH_GPRS	0x300	/* s390 upper register halves */
 #define NT_S390_TIMER	0x301		/* s390 timer register */
 #define NT_S390_TODCMP	0x302		/* s390 TOD clock comparator register */
-- 
2.34.1

