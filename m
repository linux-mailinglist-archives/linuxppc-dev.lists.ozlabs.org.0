Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9E92F850
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 11:48:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PMP5etHV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL6HV1gPBz3fpr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:48:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PMP5etHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL6Gc3v0Nz3fRH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 19:48:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TloulxvpNgblgiofl7HLLQs83AnA/+2bOSyyNqMuNpaLW2XrVHz0VT/QTFmosw9QNJ8pZejOGdMnKshxkZg00jL7aDraht9kUtetCtu3K5dBGbQEXjxfR5Oif9MxWuFl6mvAL86FjlSPmndtGaaHhLd/o6a03G4pHIBgA8PReXlU7ZSiQIIT7onKxuQxtHzy72SD0JUoXPBR2eF/ArNfyu6VownO+7x12NJPfRlsrwvkeOnZGacKNxLcYrs/gQF1qH5/iOy0F0vWqmM5+5vZziqHiLgjvZ/l3zjlPaNu9GNISU5UlYmp/ilmZW6hNI26hY7sBKt6ZIBcRQCoRlps7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=387FX6VvX1AVmkl2PCG9EQ6GwRBthuvgIJiY+5NMILc=;
 b=RLUiqgrVakoho6ipaY/EqkIPzf2EVF3vxE5uPJHd3SuXqXe866xjdP0BiKGtXy8dQw0uOsfxwx7ADySy45OrM7S8PqEpdZc75JL3ahFLto8krBtIGv2jqUI0EvQ0TCvwX3zSHq2kECaZcnxguHWxS5sP+EmqFPx77ZOITXBHyuyExvHQv1NfyNIZYD/Uwy8YnHFcoRv5kwRpUksA5ujFr1FIKHDpt4tWqntABUVkdii/zKNA5keUm3EM1nzV8eW+D5tfkHzzCygnLsgCnX8LCLYJtEDOEqJtkn0FTsS3+OH1lCilcVr4V5zOiMzi+9jUf0kvT/HxFR3dwHH5z/cBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=387FX6VvX1AVmkl2PCG9EQ6GwRBthuvgIJiY+5NMILc=;
 b=PMP5etHV3P3Dpp4TrlZhslwcRi/vjmCLmMviv1D4QuOXQmVxiQcpdqfVQH/5b1xZvbX+J6HMwEjcXQHcGIWJQz0pzGuYw1lqnYZTSLds32ILgR6dy6rwxbZtQeg16HVhlUO9QuXhorvUPvPkUoHrmH6foxgIZMKVKd9gg0nenmM=
Received: from BN9PR03CA0423.namprd03.prod.outlook.com (2603:10b6:408:113::8)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 09:47:46 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::a2) by BN9PR03CA0423.outlook.office365.com
 (2603:10b6:408:113::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 09:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 09:47:45 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 04:47:40 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v3 1/1] x86/elf: Add a new .note section containing xfeatures buffer layout info to x86 core files
Date: Fri, 12 Jul 2024 15:16:31 +0530
Message-ID: <20240712094630.29757-2-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712094630.29757-1-vigbalas@amd.com>
References: <20240712094630.29757-1-vigbalas@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: e10d0301-d48a-4eae-55c5-08dca257aee2
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?pnGMH4dFB8D4uMQ3QbOMjhYEP3hcSoRCqE9CWQXDz/S2qnOpK1JEtfDkdUUW?=
 =?us-ascii?Q?hHxaHRaMpDFRGSFxaULl1NayJEoLr+AnqCn2mF5xCQWACsqyE5TCq5/xd5J3?=
 =?us-ascii?Q?DcaVtXU34uVwK6ZjXQKJaF5bJ/O2hR2QTHv9xovFeX2dDC7o89Mzyv2p2T6g?=
 =?us-ascii?Q?bCxEEQ3HNbza0RvWEi3+xFvl3sMCan15AqXh11YEJ/IoGO/QmiLuvq2Riuow?=
 =?us-ascii?Q?UAZXdhoDOp8yY572MBa/wjkhzBLkaNBigktItrxfI9M0GanX2z8lHKv/Ijpb?=
 =?us-ascii?Q?f28+d40LAmahfgWsDQnI346UQ/z0mE/wWn8XZze1nDFXnYbE+Ol2YZT4HOcy?=
 =?us-ascii?Q?kKH9/YEytJwz7zx3rgb+7EdBDTfIhj9oVNYWmjlUJGSFhRRGBOrtuhUWDf/9?=
 =?us-ascii?Q?XiPSDVOv4CG/j8PEs/+nUkYf+4Qq62G7NU+qtsqOpChzYJlEv+/tfvKny/NL?=
 =?us-ascii?Q?3bFYF8PeXq00nP7wU8URTucuM+3UE02oSdES11kL+1w3rNnJVns6fuK3KhRS?=
 =?us-ascii?Q?gLbtxwXjuybWCxHm9cyABlrzIIK/PaPUH5WekVLtrpRg3XDUGTraGaaxmDDB?=
 =?us-ascii?Q?p9ZDLJR3c7qazhe4YJQxuWTkOPOp41TAEEGSVYz5uAlLI5oY6ntW2m1PROq+?=
 =?us-ascii?Q?o8YM12jnYmj0uebAeGLpsVwKbITj+Ig9n9EpCbaZLog+esaAcT+T3H7WUQSl?=
 =?us-ascii?Q?Uat8Y390l2zEuKQvN2CVEVD/8GEl6rwYyq/k2UbdgXGGOT1tiMwh9W3SKsqN?=
 =?us-ascii?Q?o4kK2KR2KlZMSYq/e7/ldsEJS06+qiHayK5da9teVIIsSdHLQOlpu4FmDjrl?=
 =?us-ascii?Q?e6gEy7UMmuqwHHQHEp0sWKG7TMk6+hHFvA64mU1AQveyEAdobAKrKAJoi9QI?=
 =?us-ascii?Q?wcpuSAw6dL7zMqBDU3PhALiPBumFvwvtdEJ5CpE7oCIAU9pVprP5pl/KpE7t?=
 =?us-ascii?Q?yrSwoTYNLeM/gidP93879xmzg7oxq/9JJRUViSxskW8z/TYSiL2hy5+ngo8m?=
 =?us-ascii?Q?logIWViY0kyUEeR7lSSEtNUCISP6FvfVhPqO3pIRTpj3lMLdBZQoTnABQ6AW?=
 =?us-ascii?Q?reTAl67G74OIo6fQ7hR/3sODkBkqqbjndfkEtmBk6MPC7UNVnW1WKsvBxvWj?=
 =?us-ascii?Q?ZznKpXGJLEZeMuOWhvcz4o7PTGYqG6ky4SOOAEIoqT3xMiyf1kk+FNTXG8bQ?=
 =?us-ascii?Q?TCieZJKHnSeriE3DJEwlUcmDfV/0KxYZOJ6QXv5Nllaam4XSAgQ7eihK7gAN?=
 =?us-ascii?Q?ud8l8cpPaFLun8MOr+CvKXvCwtwJlCuTXh6qVIHKTzL3Fe9dZh0d6wZ/9Szl?=
 =?us-ascii?Q?Kc0PE5jYXeKEVSG8+udXOt7cTVbcTWqYDs/ynbzeMnFGp6T+DUJeZGd9y9hz?=
 =?us-ascii?Q?lFyi2Kc7wp1An418w2KQLDUnyWQh?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:47:45.8909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10d0301-d48a-4eae-55c5-08dca257aee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, Borislav Petkov <bp@alien8.de>, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new .note section containing type, size, offset and flags of every
xfeature that is present.

This information will be used by debuggers to understand the XSAVE
layout of the machine where the core file has been dumped, and to read
XSAVE registers, especially during cross-platform debugging.

The XSAVE layouts of modern AMD and Intel CPUs differ, especially since
Memory Protection Keys and the AVX-512 features have been inculcated into
the AMD CPUs.

Since AMD never adopted (and hence never left room in the XSAVE
layout for) the Intel MPX feature. Tools like GDB had assumed a fixed
XSAVE layout matching that of Intel (based on the XCR0 mask).

Hence, core dumps from AMD CPUs didn't match the known size for the
XCR0 mask. This resulted in GDB and other tools not being able to access
the values of the AVX-512 and PKRU registers on AMD CPUs.

To solve this, an interim solution has been accepted into GDB, and is
already a part of GDB 14, see
https://sourceware.org/pipermail/gdb-patches/2023-March/198081.html.

But it depends on heuristics based on the total XSAVE register set size
and the XCR0 mask to infer the layouts of the various register blocks
for core dumps, and hence, is not a foolproof mechanism to determine the
layout of the XSAVE area.

Therefore, add a new core dump note in order to allow GDB/LLDB and other
relevant tools to determine the layout of the XSAVE area of the machine
where the corefile was dumped.

The new core dump note (which is being proposed as a per-process .note
section), NT_X86_XSAVE_LAYOUT (0x205) contains an array of structures.

Each structure describes an individual extended feature containing
offset, size and flags in this format:

struct xfeat_component {
       u32 type;
       u32 size;
       u32 offset;
       u32 flags;
};

and in an independent manner, allowing for future extensions without
depending on hw arch specifics like CPUID etc.

Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
Co-developed-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
---
V2->v3: simplified code as per review comments.
 arch/x86/Kconfig             |  1 +
 arch/x86/include/asm/elf.h   |  9 ++++
 arch/x86/kernel/fpu/xstate.c | 87 ++++++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c              |  4 +-
 include/uapi/linux/elf.h     |  1 +
 5 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1d7122a18..0ea43da0b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -107,6 +107,7 @@ config X86
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HAVE_EXTRA_ELF_NOTES
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 1fb83d477..cad37090b 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -13,6 +13,15 @@
 #include <asm/auxvec.h>
 #include <asm/fsgsbase.h>
 
+struct xfeat_component {
+	u32 type;
+	u32 size;
+	u32 offset;
+	u32 flags;
+} __packed;
+
+_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");
+
 typedef unsigned long elf_greg_t;
 
 #define ELF_NGREG (sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index c5a026fee..5d59f390c 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/proc_fs.h>
 #include <linux/vmalloc.h>
+#include <linux/coredump.h>
 
 #include <asm/fpu/api.h>
 #include <asm/fpu/regset.h>
@@ -1838,3 +1839,89 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
 	return 0;
 }
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */
+
+#ifdef CONFIG_COREDUMP
+static const char owner_name[] = "LINUX";
+
+/*
+ * Dump type, size, offset and flag values for every xfeature that is present.
+ */
+static int dump_xsave_layout_desc(struct coredump_params *cprm)
+{
+	int num_records = 0;
+	int i;
+
+	for_each_extended_xfeature(i, fpu_user_cfg.max_features) {
+		struct xfeat_component xc = {
+			.type   = i,
+			.size   = xstate_sizes[i],
+			.offset = xstate_offsets[i],
+			/* reserved for future use */
+			.flags  = 0,
+		};
+
+		if (!dump_emit(cprm, &xc, sizeof(xc)))
+			return 0;
+
+		num_records++;
+	}
+	return num_records;
+}
+
+static u32 get_xsave_desc_size(void)
+{
+	u32 cnt = 0;
+	u32 i;
+
+	for_each_extended_xfeature(i, fpu_user_cfg.max_features)
+		cnt++;
+
+	return cnt * (sizeof(struct xfeat_component));
+}
+
+int elf_coredump_extra_notes_write(struct coredump_params *cprm)
+{
+	int num_records = 0;
+	struct elf_note en;
+
+	if (!fpu_user_cfg.max_features)
+		return 0;
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
+	if (!num_records)
+		return 1;
+
+	/* Total size should be equal to the number of records */
+	if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz)
+		return 1;
+
+	return 0;
+}
+
+int elf_coredump_extra_notes_size(void)
+{
+	int size;
+
+	if (!fpu_user_cfg.max_features)
+		return 0;
+
+	/* .note header */
+	size  = sizeof(struct elf_note);
+	/*  Name plus alignment to 4 bytes */
+	size += roundup(sizeof(owner_name), 4);
+	size += get_xsave_desc_size();
+
+	return size;
+}
+#endif /* CONFIG_COREDUMP */
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43897b03..3d15c7369 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2006,7 +2006,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	{
 		size_t sz = info.size;
 
-		/* For cell spufs */
+		/* For cell spufs and x86 xstate */
 		sz += elf_coredump_extra_notes_size();
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
@@ -2070,7 +2070,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	if (!write_note_info(&info, cprm))
 		goto end_coredump;
 
-	/* For cell spufs */
+	/* For cell spufs and x86 xstate */
 	if (elf_coredump_extra_notes_write(cprm))
 		goto end_coredump;
 
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b54b313bc..e30a9b47d 100644
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

