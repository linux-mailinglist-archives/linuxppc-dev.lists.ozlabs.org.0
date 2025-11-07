Return-Path: <linuxppc-dev+bounces-13922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF39C3EDDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 09:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2s5d3ps3z3bt7;
	Fri,  7 Nov 2025 19:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762502645;
	cv=none; b=gMMLZbkI9+kU6TRACcIA/XpS9z0gJ25BOL8h0Rw1hvQAzR6G7204kC7zDEd3ujXBOaEfoafrEhAh768XBxfw/5DlPGhufS7WxkKZaQXbTGkVnlP5mIw/zhgelx4N6TdtpywBG4i0LEO2KHNd7XElovsrY9N/0nifAu2MUrBZ2k0TVhJnGL4lpTXKCFhXgihuBPsYF/kLcfvJPuOvX6qV+S2hbj4FLc6pZimRysrbO7RtEPDi2ZidftJ2zSs+m4Dh3yrQBG1P9D8ga1CTdpBpMUEo4SkmlZLKKsPCdR8aDd37OvYrcmNYICib2hFKIS6DXa9emOocPlmDVGuZaxT+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762502645; c=relaxed/relaxed;
	bh=r0WIycQGoDb293KrA8TcGBXpp6L8iM0FDINhPucJVkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACpB70TYDxKin+++bQ8z3aZY/YJlHOs/+CSR3ymNHkREVe+Jn77CtDKsqssyb9z7beO93D1LNgvZtkn4AtO7bKzyMSxW3e3aa0JbGS2oNZctVSKan2WU5TAtdjaLVr+ymoGOgEq+G23J4ubUo2OjMAc10690ry+e9aqhG3hT9rIaDllZGrOLFMeYeRpIT5w9pCiyKLja9Mm7VYsxEyDgt4S0gu9viEC6TpuA8ds1bUY1AzEo24LJFAasl62BGMy8wrT/GiMLbz7Owrz78TDeigkFLzJNqrvAvGyVvehWoHEual396xh+nV5MVDPEP1f+kEG1Iqm3b8jZAT6exkV2+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OLdxbpPt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OLdxbpPt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2s5c5PgZz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 19:04:04 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A74SYuG005487;
	Fri, 7 Nov 2025 08:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=r0WIycQGoDb293KrA8TcGBXpp6L8iM0FDINhPucJV
	kc=; b=OLdxbpPtRlfedISYJtkV47VQXGKvrmnWwtT/z0GRXWqJ16Uct/ndwbrJ1
	3xdL/rx9wsTWIyrneqkuyIS2DEUUeg1ZBrMJvyKJewZVniXaUx/Jk4FU+D5y2oCg
	rgZo/AkpUOrJUm+PglqOODmtgKfmvdi3EzRnDZg1tQ7Ibm92QPz5HQqATiLkfFbx
	TUvd2Ynn7nYKNaNc2z2CqZ6vrCZhE41BAqBJTE6cu6e/BsF5stZon/L2zMNCqsJ6
	YZTIJwNHva4wS03g8cw2TwCPXxf38MuyLHooWvQ3yUlTeuxo2negfZHhEz7bYUNz
	sH/pyqoLpJzxHYlTWgP9Aa+/0po4w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuuk6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:03:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A783s6r012554;
	Fri, 7 Nov 2025 08:03:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuuk6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:03:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A73ShhD009863;
	Fri, 7 Nov 2025 08:03:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kskpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:03:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A783m5O53608754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 08:03:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB0E52004D;
	Fri,  7 Nov 2025 08:03:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90D5820043;
	Fri,  7 Nov 2025 08:03:45 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.216.224])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 08:03:45 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: [PATCH v7] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Fri,  7 Nov 2025 13:33:34 +0530
Message-ID: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Proofpoint-ORIG-GUID: ok-v2_INB8CXqRzvkuZIlxuRjmwV7NCB
X-Proofpoint-GUID: pMsfbICs8kSd9IhiyLUvd7fVEZhE_Ipd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6wHxH0Carqaw
 3uhmEQaqZjX2F7UEgngy4/c/cdrNLJ/D7TDbTLpgjCeKD233BKKU69L7RhGfgHh1PJlEq1ep3EL
 qOCBSiCgihZYUMNARnB79fIzC0K4K7tRejoayLjnmQcLbyFqRd3Lljb3e1RspxC7LF8l/b5/FKU
 RudwlJcdrYHHBrycZtvr6wab18JIjkHipVuB1OxwzsyPkRC6UsPlv+LK7qd6chtleaONOStDWRw
 QooZwuzOtKx/AlOgJmBekEj438v3AHHi+AXS5CZrWU5Y4L9jSio4ofAX9BqFWY0ugEJ227KLkoD
 dciwWHon3Ln9DjwRaAwp8xheengn+8w/g49iUaUn7c7p+fO8iC19CMMWQp29CUwoif0wZsJdDwx
 a0Zdk8goR2WfAtK3DA+P/Mi34+b1ZQ==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690da7ea cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=cx1aSUdoMbGpntF6QmcA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
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
Changelog:

v6 -> v7
https://lore.kernel.org/all/20251104132818.1724562-1-sourabhjain@linux.ibm.com/
 - declare crashk_cma_size static

---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/powerpc/include/asm/kexec.h              |  2 +
 arch/powerpc/kernel/setup-common.c            |  4 +-
 arch/powerpc/kexec/core.c                     | 10 ++++-
 arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
 5 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..1c10190d583d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1013,7 +1013,7 @@
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86] Reserve additional crash kernel memory from
+			[KNL, X86, ppc] Reserve additional crash kernel memory from
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
index d1a2d755381c..e59bdfcc6463 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -59,6 +59,8 @@ void machine_kexec(struct kimage *image)
 
 #ifdef CONFIG_CRASH_RESERVE
 
+static unsigned long long crashk_cma_size;
+
 static unsigned long long __init get_crash_base(unsigned long long crash_base)
 {
 
@@ -110,7 +112,7 @@ void __init arch_reserve_crashkernel(void)
 
 	/* use common parsing */
 	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
-				&crash_base, NULL, NULL, NULL);
+				&crash_base, NULL, &crashk_cma_size, NULL);
 
 	if (ret)
 		return;
@@ -130,6 +132,12 @@ void __init arch_reserve_crashkernel(void)
 	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
 }
 
+void __init kdump_cma_reserve(void)
+{
+	if (crashk_cma_size)
+		reserve_crashkernel_cma(crashk_cma_size);
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
2.51.1


