Return-Path: <linuxppc-dev+bounces-4832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECBA057D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkM621M7z30fd;
	Wed,  8 Jan 2025 21:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331330;
	cv=none; b=HV8E9uXGIe9EYBmt0CPr1j/kW72/sZ42mr3rqugMyGTuc2inZWpr7K05BOpRGtW9ec2+X9wfkswRXqBMVkhMeKAaZrQMHIXEQXY/E0lniwEDtEz++kCk71zHZWDkVxB5JTbMtoeGL1hxrNwtGRn0smwckNFclQqAqwRDHaRnPnXDLNQsW4fjNBbIXScBfsHf4SQllpJLnbPWguAA+TQ6wQGS+kE0a8DYn93ofSs1/AhqyJbS8LVjSlNJzF+3Ld6xRKT5ktswiweUwe2Fyjaflue1PHjwNGlp5aem+5SNZsT+0JqGXKVyoOTjvORnm4b/8vF88Mwdb6wqXrU6qCD/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331330; c=relaxed/relaxed;
	bh=l5YP8r2VmvweWZw4/9zj/3mPN9vQQRZUcaCX+Kau0iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsdO/ArEXmx7KMuqhFJaOICwenfGXnl2F8EhD3YAR/5jfON+DCZodESGw9E6jR4jnRaqPleyp07T8MLrKWAu7nLxyUrgALHK6rP48gxwjaKZklPurWCrfLN77Mny718KIhRhy7U3vO0ZkUheEBQUmRQu/U6Wir6QjKAcMIa+fpNS1UiskkFjwVha/AkNDCbFR+mTYr4YETbAYDeOjc/lhdrP5ZgP5D5hq9fT1dSfMpf3j+U7Y6r8LkASX8OguA4Ql+GhpodfX6qV54dVQ+fan7sSB3ak/GXPPzZMNzRcm1f82/8o5PWT9BUVbMF6rluIDsV5JC+tGNfDxlY0aGqeAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rvddL87l; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rvddL87l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSkM539yNz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:15:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5088lBKp007191;
	Wed, 8 Jan 2025 10:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=l5YP8r2VmvweWZw4/
	9zj/3mPN9vQQRZUcaCX+Kau0iM=; b=rvddL87lxoMNMEHQgoeQpJnUtwwC93vj3
	VpbGwEQLqDjrUNFRWqd0HpsRY//M/BCfCi9Bgr1rh1BRECynexrGbiW46povHBhv
	nepEXSRDTXI8ThUTUON9kNPocFdlG4Bi9/W0XABAO7LssYxmvR4MEYZpeDEzi7qZ
	DxTcd25RVl3NSoIdtspCRMdVUZqnli0GYhd8m6+Hta80o3zif8c/upI8gFFlwBvS
	aGGSsPWDV44/Bc1Kce/5gCnEH/OEgs1MSmGt+PMzyfdCZyIe+gCnzzTLb/5/gSkG
	bzGX+R9nHDvW5qKETqskw5mY2v8E67UEmNDMM/cmsX8OSTJqrzrpQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4415r54r4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5088CHea008875;
	Wed, 8 Jan 2025 10:15:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfpyyb3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:18 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AFEkP50069954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:15:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 555F020063;
	Wed,  8 Jan 2025 10:15:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8702E2005A;
	Wed,  8 Jan 2025 10:15:12 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:15:12 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 4/5] powerpc/crash: use generic crashkernel reservation
Date: Wed,  8 Jan 2025 15:44:57 +0530
Message-ID: <20250108101458.406806-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UQlKl8TJcuqTf8Acu6scBJpT6rd0tJ2_
X-Proofpoint-GUID: UQlKl8TJcuqTf8Acu6scBJpT6rd0tJ2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 0ab97169aa05 ("crash_core: add generic function to do
reservation") added a generic function to reserve crashkernel memory.
So let's use the same function on powerpc and remove the
architecture-specific code that essentially does the same thing.

The generic crashkernel reservation also provides a way to split the
crashkernel reservation into high and low memory reservations, which can
be enabled for powerpc in the future.

Along with moving to the generic crashkernel reservation, the code
related to finding the base address for the crashkernel has been
separated into its own function name get_crash_base() for better
readability and maintainability.

To prevent crashkernel memory from being added to iomem_resource, the
function arch_add_crash_res_to_iomem() has been introduced. For further
details on why this should not be done for the PowerPC architecture,
please refer to the previous commit titled "crash: let arch decide crash
memory export to iomem_resource.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig                     |  3 +
 arch/powerpc/include/asm/crash_reserve.h | 18 +++++
 arch/powerpc/include/asm/kexec.h         |  4 +-
 arch/powerpc/kernel/prom.c               |  2 +-
 arch/powerpc/kexec/core.c                | 90 ++++++++++--------------
 5 files changed, 63 insertions(+), 54 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crash_reserve.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a0ce777f9706..8df8871215f8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -717,6 +717,9 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
 	def_bool y
 	depends on PPC64
 
+config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+	def_bool CRASH_RESERVE
+
 config FA_DUMP
 	bool "Firmware-assisted dump"
 	depends on CRASH_DUMP && PPC64 && (PPC_RTAS || PPC_POWERNV)
diff --git a/arch/powerpc/include/asm/crash_reserve.h b/arch/powerpc/include/asm/crash_reserve.h
new file mode 100644
index 000000000000..f5e60721de41
--- /dev/null
+++ b/arch/powerpc/include/asm/crash_reserve.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_CRASH_RESERVE_H
+#define _ASM_POWERPC_CRASH_RESERVE_H
+
+/* crash kernel regions are Page size agliged */
+#define CRASH_ALIGN             PAGE_SIZE
+
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+
+static inline bool arch_add_crash_res_to_iomem(void)
+{
+	return false;
+}
+#define arch_add_crash_res_to_iomem arch_add_crash_res_to_iomem
+#endif
+
+#endif /* _ASM_POWERPC_CRASH_RESERVE_H */
+
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 270ee93a0f7d..64741558071f 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -113,9 +113,9 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 
 #ifdef CONFIG_CRASH_RESERVE
 int __init overlaps_crashkernel(unsigned long start, unsigned long size);
-extern void reserve_crashkernel(void);
+extern void arch_reserve_crashkernel(void);
 #else
-static inline void reserve_crashkernel(void) {}
+static inline void arch_reserve_crashkernel(void) {}
 static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
 #endif
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index e0059842a1c6..9ed9dde7d231 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -860,7 +860,7 @@ void __init early_init_devtree(void *params)
 	 */
 	if (fadump_reserve_mem() == 0)
 #endif
-		reserve_crashkernel();
+		arch_reserve_crashkernel();
 	early_reserve_mem();
 
 	if (memory_limit > memblock_phys_mem_size())
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 4945b33322ae..b21cfa814492 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -80,38 +80,20 @@ void machine_kexec(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-void __init reserve_crashkernel(void)
-{
-	unsigned long long crash_size, crash_base, total_mem_sz;
-	int ret;
 
-	total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
-	/* use common parsing */
-	ret = parse_crashkernel(boot_command_line, total_mem_sz,
-			&crash_size, &crash_base, NULL, NULL);
-	if (ret == 0 && crash_size > 0) {
-		crashk_res.start = crash_base;
-		crashk_res.end = crash_base + crash_size - 1;
-	}
-
-	if (crashk_res.end == crashk_res.start) {
-		crashk_res.start = crashk_res.end = 0;
-		return;
-	}
-
-	/* We might have got these values via the command line or the
-	 * device tree, either way sanitise them now. */
-
-	crash_size = resource_size(&crashk_res);
+static unsigned long long __init get_crash_base(unsigned long long crash_base)
+{
 
 #ifndef CONFIG_NONSTATIC_KERNEL
-	if (crashk_res.start != KDUMP_KERNELBASE)
+	if (crash_base != KDUMP_KERNELBASE)
 		printk("Crash kernel location must be 0x%x\n",
 				KDUMP_KERNELBASE);
 
-	crashk_res.start = KDUMP_KERNELBASE;
+	return KDUMP_KERNELBASE;
 #else
-	if (!crashk_res.start) {
+	unsigned long long crash_base_align;
+
+	if (!crash_base) {
 #ifdef CONFIG_PPC64
 		/*
 		 * On the LPAR platform place the crash kernel to mid of
@@ -123,45 +105,51 @@ void __init reserve_crashkernel(void)
 		 * kernel starts at 128MB offset on other platforms.
 		 */
 		if (firmware_has_feature(FW_FEATURE_LPAR))
-			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_512M);
+			crash_base = min_t(u64, ppc64_rma_size / 2, SZ_512M);
 		else
-			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_128M);
+			crash_base = min_t(u64, ppc64_rma_size / 2, SZ_128M);
 #else
-		crashk_res.start = KDUMP_KERNELBASE;
+		crash_base = KDUMP_KERNELBASE;
 #endif
 	}
 
-	crash_base = PAGE_ALIGN(crashk_res.start);
-	if (crash_base != crashk_res.start) {
-		printk("Crash kernel base must be aligned to 0x%lx\n",
-				PAGE_SIZE);
-		crashk_res.start = crash_base;
-	}
+	crash_base_align = PAGE_ALIGN(crash_base);
+	if (crash_base != crash_base_align)
+		pr_warn("Crash kernel base must be aligned to 0x%lx\n", PAGE_SIZE);
 
+	return crash_base_align;
 #endif
-	crash_size = PAGE_ALIGN(crash_size);
-	crashk_res.end = crashk_res.start + crash_size - 1;
+}
 
-	/* The crash region must not overlap the current kernel */
-	if (overlaps_crashkernel(__pa(_stext), _end - _stext)) {
-		printk(KERN_WARNING
-			"Crash kernel can not overlap current kernel\n");
-		crashk_res.start = crashk_res.end = 0;
+void __init arch_reserve_crashkernel(void)
+{
+	unsigned long long crash_size, crash_base, crash_end;
+	unsigned long long kernel_start, kernel_size;
+	unsigned long long total_mem_sz;
+	int ret;
+
+	total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
+
+	/* use common parsing */
+	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
+				&crash_base, NULL, NULL);
+
+	if (ret)
 		return;
-	}
 
-	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
-			"for crashkernel (System RAM: %ldMB)\n",
-			(unsigned long)(crash_size >> 20),
-			(unsigned long)(crashk_res.start >> 20),
-			(unsigned long)(total_mem_sz >> 20));
+	crash_base = get_crash_base(crash_base);
+	crash_end = crash_base + crash_size - 1;
 
-	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
-	    memblock_reserve(crashk_res.start, crash_size)) {
-		pr_err("Failed to reserve memory for crashkernel!\n");
-		crashk_res.start = crashk_res.end = 0;
+	kernel_start = __pa(_stext);
+	kernel_size = _end - _stext;
+
+	/* The crash region must not overlap the current kernel */
+	if ((kernel_start + kernel_size > crash_base) && (kernel_start <= crash_end)) {
+		pr_warn("Crash kernel can not overlap current kernel\n");
 		return;
 	}
+
+	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
 }
 
 int __init overlaps_crashkernel(unsigned long start, unsigned long size)
-- 
2.47.1


