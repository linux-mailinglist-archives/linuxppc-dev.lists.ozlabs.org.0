Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A0939D3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 11:07:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EfYwES9P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSrrX597Tz3cp1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 19:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EfYwES9P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSrqr0tnyz2y8g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 19:06:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6WNxbpx8rXLVYepMqRVLI2Q0SYaBkMRm4AN4CWdKM8WHO20ysR7Tws0aQPYcQrxtntXbqTttjvByEh5G+dkA9PFTDP8BOCQFura8pBb0J2fFz26117p21I9/ApMectAtu9l4OAN/sOoQcNCTynFMjuTIayCPV2jx/Nw9jAvEv0tZEY9pkr74lhZt1QpW1uOKa718j8vSybwB3m8Fb+7/nG5Vylj4qs3k4AkB7gPfbWJ0RANlsE7YVKSyullcIXovM/B8fR5kVpO84Lfueu4l1npPnft+Wc9/ksJ8yvMJp752zIi0g1bdDaT9vJpNof48SSFmp+oY5zTt2Q+iQP1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0Fs5wGoydiIYjd4z5IRE9lPFCqN22KUT4bK7UVFpyk=;
 b=k72+X0StLWqtPG2DQMdG7xdTMFd8DR4ZOPyApX2u7ukEln7CQPHmbn1cyqFioiMruc80W7eN5ykET8Hep2NBxhDxmyMaW+enkF9N7Hb4CcA3ACNou2PAP7u3CuPi6M8N6/DMUf9otaSUyFwpd1XpHg9NiJP1oornZ9fBazftfggho5d8K4nCy+vdfdbAFt35+rpTKZsTgVIN1k7khV/RtvW16sJaFSJIPzELWuJmuontwePR56Nc2cEelF2iXyieRBSuN+l1PsWMHa1wlXCfzLqyRr/omGO7MdKHk3fnZt2TfpIvdkVk4xUk6SFcvJiLaOHB8UUtlK3trJVphadtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0Fs5wGoydiIYjd4z5IRE9lPFCqN22KUT4bK7UVFpyk=;
 b=EfYwES9PsEKDfUcjNgx/OZ27NMciWezJgZoX7rEAbM/CZ/I5ryII4E0GxhFEniVPuxGkP5e2Bxgt+u7DVwTtNPg1BZ5uhBLcftufGmnAQEDjqlZjkteAMCTQNYlCXyleltyTae1pn7PgifevXMH6CmbuYXIVSsfRqL28Ykm8JSg=
Received: from CH2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:610:58::23)
 by SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Tue, 23 Jul
 2024 09:06:27 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::f5) by CH2PR20CA0013.outlook.office365.com
 (2603:10b6:610:58::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 23 Jul 2024 09:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:06:26 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 04:06:09 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v4 1/1] x86/elf: Add a new .note section containing xfeatures buffer layout info to x86 core files
Date: Tue, 23 Jul 2024 14:34:55 +0530
Message-ID: <20240723090454.8241-2-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723090454.8241-1-vigbalas@amd.com>
References: <20240723090454.8241-1-vigbalas@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d52f37-edce-4da0-3fa4-08dcaaf6bbc7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?wHRXUkeH4XN5a+sQT3TfN3AVjdo89u6V2omrB+1KcqWwrPe+ZaMZagk10B5D?=
 =?us-ascii?Q?D5OzESfgUfwekpDmiDzbiMFmPqcoS9M/dM4f+3BaHHt20CoXGeatIspd0etK?=
 =?us-ascii?Q?ui02feAfDmYyJL5febGyS4/NYJ4oJ35HcEdxt80hiGUi2wcE6hMhyRz732ah?=
 =?us-ascii?Q?nT3/gSmsX+HD0fv81/4nstClfusaF5QR4iRS0PSPMOmNrY9Uh04fma1XfWZw?=
 =?us-ascii?Q?Q1dpuK2b3+VTULI3C3lcRmH7l1ZkL1oCLnkX9CMn08r0zxmo0UodYEbz4mdy?=
 =?us-ascii?Q?wNgSRDUsqcxrFfp/9MFnbZvG+nFrPFr7hUaTzRjrI857kC/6rloUzth/H32+?=
 =?us-ascii?Q?cJJOLX3i6bwRxGyGuqkYHqYYlWfbqmqe9zVC5s2BVep8JvG4Jth3Enl76AkI?=
 =?us-ascii?Q?ClA/T8USOA2vqb3PXz9NpRBGi3BbUwHcT4WZYgOI+Am2kAuP4VFwbpXAkx53?=
 =?us-ascii?Q?W8YRtB7VYEZbhiIySoLnWqWGsLDEb156hP75ohFRA40UTfx0vrXLaNbo07HK?=
 =?us-ascii?Q?1sgtBx1ouyyFpOyzcKw9Piuxh+HWZlI0yxtNudo1k8RufjkZUQ16DJfY0hPe?=
 =?us-ascii?Q?JpvYdeeuMLIGOxeZwq4vO4K08b4Rla7ZNVkcL/8rrvkOGV1t8p4bz8aIqYk/?=
 =?us-ascii?Q?OqfOzPFzLemplI54Z2bNIsl3aRZRfdeaSXgVoXwlzpcQ+JCYK6cEdYUtnLkL?=
 =?us-ascii?Q?8H4cMhC7qPDE52yrnt8s9ujUv9jYuQIjva6v0RFtXpL1KtQoUMOLsZqEEZix?=
 =?us-ascii?Q?AZWYCjop1AzqDenA1xhT3X00sifMkoZzoWHDJDzJ5+i4iW4a/t2GCPrtVxpd?=
 =?us-ascii?Q?fndSsQ4stvl2wtPe/QxKDcs4ros/B7wIHGRm/Wmm6+EpNOlOS1qYyY84Nf7m?=
 =?us-ascii?Q?SiCTV8nLHT3PBhWrpl8dBGzVXGLEr1YSrDGIIJfPsFFW4YDHa9AI8wiqs/6G?=
 =?us-ascii?Q?yY/9LQC8eRj+msM48umRVxvg3H76ftXlDuO8E8kxtbjE+ZGa/a4zUcVtuDM0?=
 =?us-ascii?Q?YC6GgJOfsloKpEAfwmQr/W1bfZcsV/2Nh/oBZq4IN2xbnRy+3b7tFaqfl3kc?=
 =?us-ascii?Q?zJ12RpCV60B+AdeKnT7Hj/aFLxYIqOsJspxh3vfL2VsB9MBfeyPKsLlxW2Bz?=
 =?us-ascii?Q?hO8nq+UrpPlBaLP/0Kl2UXpEvSoFnh1sMdHD+pebwOggssDwUz4psVFZFY4F?=
 =?us-ascii?Q?cZZdLNmt2bbpGOQRBHHxUyPK/9SIKxspRomMvJIlqSq9+ozaCqUBhckiQ4Kq?=
 =?us-ascii?Q?jo4FE0/OymEMXDoVtUKYKh5I5Z8TjAfjJHg5OGsi1pqO769PinbRze9COjXq?=
 =?us-ascii?Q?QiYjT8OXpz/M8jP56xguDXYgKONixQXzSZ4VgX0btLl0EPDVBIdSQAAL4xnR?=
 =?us-ascii?Q?fgVbHefJ3kQW+kUvFEsLr/5gDs60?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:06:26.7904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d52f37-edce-4da0-3fa4-08dcaaf6bbc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296
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

struct x86_xfeat_component {
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
 V3->v4: Moved struct xfeat_comp to newly added uapi header
 arch/x86/Kconfig                |  1 +
 arch/x86/include/uapi/asm/elf.h | 15 ++++++
 arch/x86/kernel/fpu/xstate.c    | 89 +++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c                 |  4 +-
 include/uapi/linux/elf.h        |  1 +
 5 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/include/uapi/asm/elf.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index cbe5fac4b9dd..476572c10bbb 100644
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
diff --git a/arch/x86/include/uapi/asm/elf.h b/arch/x86/include/uapi/asm/elf.h
new file mode 100644
index 000000000000..cf037e1c8e37
--- /dev/null
+++ b/arch/x86/include/uapi/asm/elf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_X86_ELF_H
+#define _UAPI_ASM_X86_ELF_H
+
+struct x86_xfeat_component {
+	u32 type;
+	u32 size;
+	u32 offset;
+	u32 flags;
+} __packed;
+
+_Static_assert(sizeof(struct x86_xfeat_component)%4 == 0, "x86_xfeat_component is not aligned");
+
+#endif /* _UAPI_ASM_X86_ELF_H */
+
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index c5a026fee5e0..f3a2e59a28e7 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/proc_fs.h>
 #include <linux/vmalloc.h>
+#include <linux/coredump.h>
 
 #include <asm/fpu/api.h>
 #include <asm/fpu/regset.h>
@@ -23,6 +24,8 @@
 #include <asm/prctl.h>
 #include <asm/elf.h>
 
+#include <uapi/asm/elf.h>
+
 #include "context.h"
 #include "internal.h"
 #include "legacy.h"
@@ -1838,3 +1841,89 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
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
+		struct x86_xfeat_component xc = {
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
+	return cnt * (sizeof(struct x86_xfeat_component));
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
+	if ((sizeof(struct x86_xfeat_component) * num_records) != en.n_descsz)
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
index 5ae8045f4df4..8d4539cf5858 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2039,7 +2039,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	{
 		size_t sz = info.size;
 
-		/* For cell spufs */
+		/* For cell spufs and x86 xstate */
 		sz += elf_coredump_extra_notes_size();
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
@@ -2103,7 +2103,7 @@ static int elf_core_dump(struct coredump_params *cprm)
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

