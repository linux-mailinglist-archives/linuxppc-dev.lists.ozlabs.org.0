Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9D93C705
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 18:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pj1J96J1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVGBC6lw7z3dJX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 02:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pj1J96J1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::60e; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVG9W0hV9z3dKJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 02:11:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SulOuBlq2SuN9hmHyFyVhX0avQPnskV2NqW30vHa4PnmcwN+GU73UTgPuDGnTNmfng/Chndly5yuaQpPWbertb18Uw0VtXFFdoLL12MYPbN7ayxvaWKSlcR/hMIDHCEJlyKaMOg4leKZ5wBLk/cyBi4hNhkjHfpKA6UvF3mrAH5xvLZfktklEIcQ2gzuuGK6A6YRbNeojalMRNRyW9D7pdxsx2BM2HltqppRMWKbWqcTqEFgG0Aq7fF8ONkOmcj0Kj3w/RnDOx8gbxXvzezIwFuHAUL4vWJBnp0qA2c2YOZ7HPdeQu3i6bVxyrruoKIRqyXwBOgp3/0xDmaG7ALUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey2D5Nj1L+LR5ONtR62WFCidn6cPxAbXXYaYgxCGvQk=;
 b=UocXS2S52zQmkx0jp0W1U5/NiBFTDi7hwxLiX1ji1Bxn5qaaFjvYRX0BYIieHFyCkPFCoHpGG/k+QwnjDtFhKHVKRrW66xJWcK+fzU3R4IJM5zLy+VJPQvHjDs7HAkI3OaZyp6fiAAOz4WttLnVhNGokO0Yjin3psjEH4rfLxwh12pDirdkrh3G24X8Z85PXB7q1Z3VHzrwoRf9+W7gGVfIo98YVJD6BiJrPHl8//DJ9EUZsdEEvOhnXWw6ZqBt+Cqhrn8EYcPZgEFTAMbIbb9ZDBg3vLdMFcTVEXTHe++iVdDzkm+BbrDXXtqXxzPDYt7fxxwMvzQ1mPWhWWGbmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey2D5Nj1L+LR5ONtR62WFCidn6cPxAbXXYaYgxCGvQk=;
 b=Pj1J96J1tzmNaYuRsC0JC6ZzyS+8WCWkoUByPoFQvp/Erli/t+Yw4gLv22xWiarypJ4oaWTcsycyyr4R2hWMDLjrTMDuww4q4nBhhP8q5OgqtKfbxULpHQDN6tsJPHOHGvnR3euYRKIR3et47pw2U6mnL6zFbRjOR5XkpaJ+dyc=
Received: from PH1PEPF000132E7.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::27)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 16:11:36 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2a01:111:f403:c903::1) by PH1PEPF000132E7.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25 via Frontend
 Transport; Thu, 25 Jul 2024 16:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 16:11:36 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 11:11:30 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v5 1/1] x86/elf: Add a new .note section containing xfeatures buffer layout info to x86 core files
Date: Thu, 25 Jul 2024 21:40:18 +0530
Message-ID: <20240725161017.112111-2-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725161017.112111-1-vigbalas@amd.com>
References: <20240725161017.112111-1-vigbalas@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: fdadfadd-fee2-458c-0764-08dcacc4756b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zf/bMiy6Wbya8TsdOvi5M9Ae/ZgCuKOk0TEvUdUQOGChHu0oMybtw4VI2np9?=
 =?us-ascii?Q?3S11ex6NtI8tpEEOgYyA1vPHblyIwxDSp3cm8v1dIb6X1Bs5XqW8OhEoVzm8?=
 =?us-ascii?Q?CTrgtx2u0ZSrMlNwqI76pofV0Prc9Azm9/ZSLr92CjwOEwmtce1DcMIfTr4D?=
 =?us-ascii?Q?o/tLhe86Ri/jt/LizegAwMNR3spbMr5uRwjpXLKaJzK78Fj/uBEXX5PMpQ4e?=
 =?us-ascii?Q?QRSTT2GuOaIhfOofqEg1ZZXHxO0kAhUzld5ihKUC6Oo3nMT2xDKgAKCEEPH0?=
 =?us-ascii?Q?wFKg2G5TxKweGtvbzfALtb3XD5iOMh+d+HIvmx5AY9nLiAvrdHP/EllLyyWy?=
 =?us-ascii?Q?s9dTlpZWm3MY3M6VisEohZKPm6JBCEndy4BBJ2jBT71wFPizwc58nTuXTIIQ?=
 =?us-ascii?Q?dw510CmZ1D5PqCSBzzQeWndk6zc3k/1ynFhvoaMcReQI5nud6N9Kvz689ZKf?=
 =?us-ascii?Q?iU4RjCQk+zR3PY5Xb0ix6/024e8BsYE7sY+W7ELVWTE3TfMeTLkEsK9yKkeU?=
 =?us-ascii?Q?r5E1iYiXoRt+dNFlcSdL72DorQdSifgh8eEwUdtsG9boumawhMbqZVDEA+nj?=
 =?us-ascii?Q?DoYTeA9JNw28BDfVo/2rf4JRSfCg76PZn4UKUNRjmUfEjfnQ0JQ5pezuurz7?=
 =?us-ascii?Q?pJY1a3KJ0dG3+KakXWk5T5PVcLtpW0CwI6K9zc+D4Zi87rbnhd5Owguf0cfM?=
 =?us-ascii?Q?kkIYE+6qapvjTnSYaSU0YaSrTcGzyzv3w+v7Hx6UFOWsJdLcbCUsP7LZeIQR?=
 =?us-ascii?Q?FALLIwupb0t/kPnewZ8WOfzDkRgl6JM6UL/BQO30gMChaVZQO5yHhuJTAjpO?=
 =?us-ascii?Q?QUkH2vxAcpXUGyXzgAMqJ/fj/S6njQ73hBzv1PkDJtmEy8vNz0B/nOUqqyV1?=
 =?us-ascii?Q?Tfxg3DVcyn3kbmNHoPO3TKlIzGBkQ3xfEBB87P35tIyxddnPRdiv3P44FdIN?=
 =?us-ascii?Q?FQGNhKQ4E76OBJsRD+NK/eO5a5AqAX/I+Wgm3MiYEy1qgegVuZCKsAupQVVl?=
 =?us-ascii?Q?uc++AjUODMd0yYlxPpmLE5kHwlX+EEl9dIUNskjni/AQ0Iqim1H4sRta1owt?=
 =?us-ascii?Q?Yf/oSR1s+gX1aGcRRZxxSeBxGRxVseQ1ty/gcPLJx9ZGrVAG8dcmrRnTld/Z?=
 =?us-ascii?Q?Mdq1TwH7CAuAAX/M3nhkMACPtlbfPy2ozNmn9o5j+AGawp+ip+9VJFKN3FJf?=
 =?us-ascii?Q?FvMfx2r62p9q8pVoZNdRYW8wnxGyDcBORdLaXNeA0QDUwfAeVeB7mOwod5Ti?=
 =?us-ascii?Q?J7x+cbRAweEECNr9G6mYlmmPHhMhY7UNaBfQ2Jc2+kS8nKofll+UvTjv0vU1?=
 =?us-ascii?Q?Nwhg7SvZVhnvKhqipFMvcDEk8P85NiSls74aYMEmxszrb6JgkjNHchyftekl?=
 =?us-ascii?Q?vZsmaH5okOXUFgcYBkELBo6MGogK?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:11:36.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdadfadd-fee2-458c-0764-08dcacc4756b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462
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
v4->v5: Fixed build bot error
 arch/x86/Kconfig                |  1 +
 arch/x86/include/uapi/asm/elf.h | 17 +++++++
 arch/x86/kernel/fpu/xstate.c    | 89 +++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c                 |  4 +-
 include/uapi/linux/elf.h        |  1 +
 5 files changed, 110 insertions(+), 2 deletions(-)
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
index 000000000000..454d8872cd9c
--- /dev/null
+++ b/arch/x86/include/uapi/asm/elf.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_X86_ELF_H
+#define _UAPI_ASM_X86_ELF_H
+
+#include <linux/types.h>
+
+struct x86_xfeat_component {
+	__u32 type;
+	__u32 size;
+	__u32 offset;
+	__u32 flags;
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

