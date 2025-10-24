Return-Path: <linuxppc-dev+bounces-13294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E9C076D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 19:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctThN2Vqpz3bjb;
	Sat, 25 Oct 2025 04:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761325300;
	cv=none; b=Zk+PE8UvtCukh6UKGvbrEf0LnhSWaRq8g2CG3+vtigQAW+KSAlBH0LjS/4Ny7qiJem749pXlLhrUnuipPEVIal7RcPWIBp/p+kutVm2PJjRjInF5Kvi2l4w+8UCTRfeE2pzugp/SZI8ZtFQquQaOzNDDrPU4k/32Mi5KBRtnxFkmFNAVAlYa4XGQGvr9w1QDUW/atFLX/egyOqSwANMNc9WwqWSVbWJwRMG3B1Te5fdvpzwuDIjfCezCqSf1TQ2T0kv7KiILtzQczO5wS2Bt0sOtN2qNDY1SLbswaAZUKIVpoYsuNFITdUl7IuYkRENSQDRtEV90kwPUZioQ9G8ELw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761325300; c=relaxed/relaxed;
	bh=7dHlaUzHinDpePO6Po04kgX2dIvt96L4JFFOnjpTMro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzKyq4T2YCLuw5OvDt/RspfJ42NT2+oCN1OpGDcxNKTo6r7eAnr/zdrmvQfLqTsFA9EF5iu5YX60+BKqraf4GPZm9BbEd1FKUR4u5IfAZk90excQdxJVZD0UMTlE0c/wgdrzxgQYLanJMWnJASI+5Y1vZjiEwyRiCiyXV0aP8CGBPJNyE4gps6+Qrd0ApZ7wEz6PFPLymyxw1JuaehHx1ORj49nHLuSeAgFDeHje5nqESkclHO5nHDOvdg30q231T6sGDmoD6DuIZa68zjz9mPLTYjTjg/1nyWQcb99hs6pFO2Jarvgt8x1FtuHLsbDvuMmUSVRaCqHf8T+dHozT+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rEdVBQLh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rEdVBQLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctThL5Trkz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 04:01:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ODkF7O027261;
	Fri, 24 Oct 2025 17:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=7dHlaUzHinDpePO6Po04kgX2dIvt96L4JFFOnjpTM
	ro=; b=rEdVBQLh5PPLxYTrJiCIX0P6uSdfAzAdU/47p67+rq+a1lkwYmFkk0J9n
	OBxcgAFQp8LDqOrGlZ2sGIkl01FAzqrddaujNJ+wBV7GuLSCWvWbfsyXqd7zxe5Z
	OgWY5/HmUoCUlatCEHf4uhET0eApXwWLFEL/uWAUwjL+ql0GSLKtPicaCJRB2TXj
	Jl98dyGCFiM2dy0K22vOHpHRS4WGZzkKWEFIndmbpwmarpv43XC4Z0HoIlbKZAcF
	wVPIBcAGBkMJD5rrCQV4qs+2Bwbu7N8omXkBtBrV2hSMz+TD/oPJvXy0ggSYTr8Y
	i0yHLHUt8M+xYwwSey48Q0bOCj/Yw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33frdyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 17:01:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59OH0cq6002308;
	Fri, 24 Oct 2025 17:01:28 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33frdyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 17:01:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59OF2vQS002488;
	Fri, 24 Oct 2025 17:01:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vqejuwhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 17:01:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59OH1NTv27787728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 17:01:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C464420040;
	Fri, 24 Oct 2025 17:01:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 983B820043;
	Fri, 24 Oct 2025 17:01:21 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.26.205])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Oct 2025 17:01:21 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH v3] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Fri, 24 Oct 2025 22:31:18 +0530
Message-ID: <20251024170118.297472-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=FMYWBuos c=1 sm=1 tr=0 ts=68fbb0e8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=Og_BekIr16yU6-hBN0sA:9
X-Proofpoint-GUID: FpuPgPriXy9C12TVmwnECU4v-6yOmsGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX3Uc83Y47QzkS
 ohRvLG7QlqgqFsMc90IMFhARZFAYWOrlwnxxIul0025dj6J4Cdktcp6A5zgxr5tKHOHut7L13kx
 CLAQE8yJs0tUr9sae06c//oqnSnK8rpCDdVN/pJuJMNaxc4Y63yc06vWEwHaIr11KnIPdaVvkXP
 Dr1RSs3o6hEgdePzUOrtJW9Z/N588biudaxlQYwWVESB9+SgZHsBNNVzeJnY8NPX5y0Mtra9jZx
 rP1+n7GYr1k8UcM0YUkL+NRqOa1hgLDOoVWEI4NzYD1UYCwVlOZbmsHMqvJUPDUZBeBzgHJR0qi
 YYFVGQgftNMMPSlHgpOmsz/RO2ENC2wf46F6wt34lA2N9ZMfcEmG9cGgRLqJ4mY/zOGAtDL8uEd
 HE4yAZGROygkU/UHZSmJ7pD8p0L8LA==
X-Proofpoint-ORIG-GUID: 5B0X3zHVhy_ZxA7y7qOVH6W3wu2Pm-6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
crashkernel= command line option") and commit ab475510e042 ("kdump:
implement reserve_crashkernel_cma") added CMA support for kdump
crashkernel reservation.

Extend crashkernel CMA reservation support to powerpc.

The following changes are made to enable CMA reservation on powerpc:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump
- Include the CMA-reserved ranges in the usable memory ranges for the
  kdump kernel to use.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore.

With the introduction of the CMA crashkernel regions,
crash_exclude_mem_range() needs to be called multiple times to exclude
both crashk_res and crashk_cma_ranges from the crash memory ranges. To
avoid repetitive logic for validating mem_ranges size and handling
reallocation when required, this functionality is moved to a new wrapper
function crash_exclude_mem_range_guarded().

To ensure proper CMA reservation, reserve_crashkernel_cma() is called
after pageblock_order is initialized.

Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changlog:

v1 -> v2:
 - Fix build warnings, ensure kernel build when CONFIG_CMA is
   disabled

v2 -> v3
 - While excluding crashk_cma_ranges, reallocate mem_ranges if there is
   insufficient space to split crash memory range
 - Added a wrapper, crash_exclude_mem_range_guarded(), to simplify the
   logic for checking mem_ranges size and handling reallocation
---
 arch/powerpc/include/asm/kexec.h   |  2 ++
 arch/powerpc/kernel/setup-common.c |  4 ++-
 arch/powerpc/kexec/core.c          | 10 ++++++-
 arch/powerpc/kexec/ranges.c        | 44 ++++++++++++++++++++++--------
 4 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 4bbf9f699aaa..bd4a6c42a5f3 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -115,9 +115,11 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 #ifdef CONFIG_CRASH_RESERVE
 int __init overlaps_crashkernel(unsigned long start, unsigned long size);
 extern void arch_reserve_crashkernel(void);
+extern void kdump_cma_reserve(void);
 #else
 static inline void arch_reserve_crashkernel(void) {}
 static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
+static inline void kdump_cma_reserve(void) { }
 #endif
 
 #if defined(CONFIG_CRASH_DUMP)
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 68d47c53876c..c8c42b419742 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -35,6 +35,7 @@
 #include <linux/of_irq.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
+#include <asm/kexec.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/processor.h>
@@ -995,11 +996,12 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();
 
 	/*
-	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
+	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
 	 * hugetlb. These must be called after initmem_init(), so that
 	 * pageblock_order is initialised.
 	 */
 	fadump_cma_init();
+	kdump_cma_reserve();
 	kvm_cma_reserve();
 	gigantic_hugetlb_cma_reserve();
 
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index d1a2d755381c..25744737eff5 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -33,6 +33,8 @@ void machine_kexec_cleanup(struct kimage *image)
 {
 }
 
+unsigned long long cma_size;
+
 /*
  * Do not allocate memory (or fail in any way) in machine_kexec().
  * We are past the point of no return, committed to rebooting now.
@@ -110,7 +112,7 @@ void __init arch_reserve_crashkernel(void)
 
 	/* use common parsing */
 	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
-				&crash_base, NULL, NULL, NULL);
+				&crash_base, NULL, &cma_size, NULL);
 
 	if (ret)
 		return;
@@ -130,6 +132,12 @@ void __init arch_reserve_crashkernel(void)
 	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
 }
 
+void __init kdump_cma_reserve(void)
+{
+	if (cma_size)
+		reserve_crashkernel_cma(cma_size);
+}
+
 int __init overlaps_crashkernel(unsigned long start, unsigned long size)
 {
 	return (start + size) > crashk_res.start && start <= crashk_res.end;
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 3702b0bdab14..c61aa96f0942 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -515,7 +515,7 @@ int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
  */
 int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Early boot failure observed on guests when low memory (first memory
@@ -528,6 +528,13 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 	if (ret)
 		goto out;
 
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		ret = add_mem_range(mem_ranges, crashk_cma_ranges[i].start,
+				    crashk_cma_ranges[i].end);
+		if (ret)
+			goto out;
+	}
+
 	ret = add_rtas_mem_range(mem_ranges);
 	if (ret)
 		goto out;
@@ -546,6 +553,23 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
+static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+					   unsigned long long mstart,
+					   unsigned long long mend)
+{
+	struct crash_mem *tmem = *mem_ranges;
+
+	/* Reallocate memory ranges if there is no space to split ranges */
+	tmem = *mem_ranges;
+	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
+		tmem = realloc_mem_ranges(mem_ranges);
+		if (!tmem)
+			return -ENOMEM;
+	}
+
+	return crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
+}
+
 /**
  * get_crash_memory_ranges - Get crash memory ranges. This list includes
  *                           first/crashing kernel's memory regions that
@@ -557,7 +581,6 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 {
 	phys_addr_t base, end;
-	struct crash_mem *tmem;
 	u64 i;
 	int ret;
 
@@ -582,19 +605,18 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 			sort_memory_ranges(*mem_ranges, true);
 	}
 
-	/* Reallocate memory ranges if there is no space to split ranges */
-	tmem = *mem_ranges;
-	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
-		tmem = realloc_mem_ranges(mem_ranges);
-		if (!tmem)
-			goto out;
-	}
-
 	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
+	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
 	if (ret)
 		goto out;
 
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			goto out;
+	}
+
 	/*
 	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
 	 *        regions are exported to save their context at the time of
-- 
2.51.0


