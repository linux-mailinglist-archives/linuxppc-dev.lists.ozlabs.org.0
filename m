Return-Path: <linuxppc-dev+bounces-13687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F8C2A07C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 05:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0Jjt6ypcz30RT;
	Mon,  3 Nov 2025 15:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762144690;
	cv=none; b=PHVOLdi5cZ6gLhO8eCFndnDXxM2uLr+BnLqJF+Lm+PEh2S6hgN3YOZp65gRjzGB/v0o0lDGQjeeP/G8BIPCW13GgGXil6iZ9A4bCDuBKuHidehuiWdvMGSnzVqY96CZTrcox/BuPuqsHsW5iA24ENY1Px5LKBEJxjJ34kbzrU48o0qRM4Y120+LayRq1naGkq1fvltbRrM813s57bDvaoDAzW1QC5S3ZMGUIwGIu1d8HimxlIKZ1kGNao6l/wYNDIcDsP4mHJlSA71bPuPrZwzijxNCQRNQF8SQrdRtOU4io0gCxoxqGkD7L0G2ReI3Z3TkJKOaVxks+x3tt0eyx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762144690; c=relaxed/relaxed;
	bh=SGwfhCu4TSenW6IfnwL1XQw8Lo8uFegSO8a9n4FyLUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9joL4q9O3GJb3bxqKURlC9PF155krd3phqj1D0ZDxAmR0CLWv8m7ULERbB9g0vjho13LeZ9CkhqEuwqK3DYhaRim8M2iXeSWveyTG5ZtMuXsXitB+/ovvPwReu/N9xAkmDg4HL5Gba4KMAG4izkoJA+2femZc1VLBmRvQMfzIIO4VOTn/Cr623v2cPmfVotx0L+lLii9EEgIdG8vIwxsygQndBHNgy984YvKm87p0l9+QWVW6+pWO9WU+OvB7yZmCUyjD/wGBpC5G+SFBZBwQSMtKNduYRvaI8YQ18dg/YH1Oh1AVhy6CuRD0tyaMq8682LggwEeqfISe+Q2bBK7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oKH2KMRa; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oKH2KMRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0Jjs5tSCz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 15:38:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A25v51H009411;
	Mon, 3 Nov 2025 04:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SGwfhCu4TSenW6IfnwL1XQw8Lo8uFegSO8a9n4FyL
	UI=; b=oKH2KMRajF+F0Xhe2VKP8W836iGdSCQLKiWsrTzAI3dXtql/rJSQ2nIOa
	tGrsssFJiwYbZebJCJ+KJs6nbAtTpbakxhkz4PkpSEUq6aGbBo6zdO0Jd+4Xm+oB
	Ci8yT9EIlA3HlNiOCgQMyil5rx485QhI9a+QRIBvd9Drkr8g4sNDmKRi5JSnOthy
	3JJpeTDnBayP5q2V5ZyS2Nlxb8PghzQVSSJGfBpcsRTGSnSoIph5v0D7KIGTaxQb
	fkSvBH3TqsJlTtuVs12RoJc4TlTzhwDGyBIEST4ELJhMPMVzcbidxWRMU2P3oGFK
	fTsyDX1JpK3ZF2Y/xpH4yVy6EoD+g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu4x0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:37:59 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A34bxe5027892;
	Mon, 3 Nov 2025 04:37:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu4x08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:37:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A32qgfQ009822;
	Mon, 3 Nov 2025 04:37:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1k3rb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:37:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A34brSZ39649598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 04:37:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B06D2004B;
	Mon,  3 Nov 2025 04:37:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCABE20043;
	Mon,  3 Nov 2025 04:37:50 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 04:37:50 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Mon,  3 Nov 2025 10:07:47 +0530
Message-ID: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: KGtpEA-AaWKqU6yzeU4m-SNdEnrlPRoR
X-Proofpoint-GUID: T48vZg9Jtnp4tx_tfEzcXhUtpZelosrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6iZh/ZDfiFpc
 lQ5B48TiRKWf44v05nakMOM7SAof5ZeoRN9i5sNBAjEBmMBaHW7CF7Vetg5HD1pUBMhC8ZL9NFz
 1DuqUBb5O9PqiU/XAx0bJgFCsDNju9ymO1sBjdITavqx9RDoHn1Qok/DMuGFkBLgpwfoQrTKa2A
 6cZ+97e1OfEjYTwNj3k8GhkaOZm+Jk4SdIyYFys/3WYtXY2J7a0wbWfnedwxs37Dt1jRzL8xEFf
 Wpxf+9d1Lap3HFpA9WV6LAZLe6ZPKEZqfvoTryAlAJxLW8kjuJ6D9UjMQA9+g9vvti2LyJJtUuh
 fSYS4/HbXa6VNfp5N1X2uc2to7iLQecyQBwxLRm37zNTEbhq/zKU3tfLoeDw8yFWN8egjcdU8wo
 z5vKu63Hf2UA0j8YARzV28I6c1KXDw==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690831a7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=cx1aSUdoMbGpntF6QmcA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
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

Update kernel-parameters.txt to document CMA support for crashkernel on
powerpc architecture.

Cc: Baoquan he <bhe@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changlog:

v3 -> v4
 - Removed repeated initialization to tmem in
   crash_exclude_mem_range_guarded()
 - Call crash_exclude_mem_range() with right crashk ranges

v4 -> v5:
 - Document CMA-based crashkernel support for ppc64 in kernel-parameters.txt
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/powerpc/include/asm/kexec.h              |  2 +
 arch/powerpc/kernel/setup-common.c            |  4 +-
 arch/powerpc/kexec/core.c                     | 10 ++++-
 arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
 5 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..0f386b546cec 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1013,7 +1013,7 @@
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86] Reserve additional crash kernel memory from
+			[KNL, X86, ppc64] Reserve additional crash kernel memory from
 			CMA. This reservation is usable by the first system's
 			userspace memory and kernel movable allocations (memory
 			balloon, zswap). Pages allocated from this memory range
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
index 3702b0bdab14..3bd27c38726b 100644
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
+				    crashk_cma_ranges[i].end - crashk_cma_ranges[i].start + 1);
+		if (ret)
+			goto out;
+	}
+
 	ret = add_rtas_mem_range(mem_ranges);
 	if (ret)
 		goto out;
@@ -546,6 +553,22 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
+static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+					   unsigned long long mstart,
+					   unsigned long long mend)
+{
+	struct crash_mem *tmem = *mem_ranges;
+
+	/* Reallocate memory ranges if there is no space to split ranges */
+	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
+		tmem = realloc_mem_ranges(mem_ranges);
+		if (!tmem)
+			return -ENOMEM;
+	}
+
+	return crash_exclude_mem_range(tmem, mstart, mend);
+}
+
 /**
  * get_crash_memory_ranges - Get crash memory ranges. This list includes
  *                           first/crashing kernel's memory regions that
@@ -557,7 +580,6 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 {
 	phys_addr_t base, end;
-	struct crash_mem *tmem;
 	u64 i;
 	int ret;
 
@@ -582,19 +604,18 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
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


