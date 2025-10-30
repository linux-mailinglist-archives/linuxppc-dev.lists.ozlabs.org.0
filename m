Return-Path: <linuxppc-dev+bounces-13550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28462C1F76B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 11:10:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy0Gz1xmRz30V1;
	Thu, 30 Oct 2025 21:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761819019;
	cv=none; b=fX/fp+WjwMjDKydLlF3XhQKruZMAg6DXDZVCD4dtlr8IHG15jTUdfBiKCp/bG1XlU7/qnv3CNc4vbK6yeeJSUHyuIQimg6UUPY8ZlzkGnbCphCFjrrbGdSLfOBCHSgpWaz29jUI/QCqaX5MZKu1EQ3HGyNCYgzpwZtu6nizueg7PphfvLPQ7U2IR2MTcksXMRDhl4Mv41UKJ/f1Evn1rX9/o1SgBR8wGROOKlN/AdcDCQ5Pro32+IByrIKypBYyR3gf3VIzzPhuFYy9Yujn9ooytTEbxOZSAVGYwR/gvi8vxjbi0zGtZiHN2eavJu77iNuLVBbbJkFflBZ8KmlvFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761819019; c=relaxed/relaxed;
	bh=0V37xgVKueyIWqkxKj09DN0b46S9FABWDf8W5GKouyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vi6HhH5pF8BFC0COp0O636K3EiWDJOZzJPyeWeMUjFcxL7nAdNU5jlijONDxMW45NXZtO6OeCnA+k7UmgqE3J2HNf6x6nzQTHUc7gzgfOx4YP/ZQUCiDbsU+8vih6XPBx+1SLz4TYMKiBfmbV5J1JUVBgUwTElmG/zDeYqxrnma5PrSNkSfdXZvpG8mYL5fPtKlAcSowl3jR9442R8oEus+3UAp8xEKQsDoLdDVTdMZg1NJw9CGVZAWlQacWGKS+E6EFPWYH9yw91frAxdatBomEUq4HfDNgQU/PB8THU5Hu3i0jXpAKeUTcq+DHitnJ6Y6ixhRahBj9VTetnkEhsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KrAzlqSz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KrAzlqSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy0Gy1tVwz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 21:10:17 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TLUA66019857;
	Thu, 30 Oct 2025 10:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=0V37xgVKueyIWqkxKj09DN0b46S9FABWDf8W5GKou
	yM=; b=KrAzlqSzCMBp8hljIkELaK3V9d4AdRvu3AJfQrv2xfQvrTjdP6TgLxnji
	NjOexsLXt8TvwZcWDNiKZdMfpJZpgnQI9MJgOEd0jUiA2vWnl8KUlONsiDWzSeF6
	DCo5ek3k19Ni3oqQccNTddFB30J2UCNBNe0ZlChN83MrugN0ywYiyH1eL1+g54dv
	bAr3Lkl+SzRa56HAUH31liRLItgXTyD37feo2H9HrPk8MKxAFxVm+HpkPel2Qi0q
	LsLpwnRVnObP/G27z0JqrlmHIBqHT+jK3OthdsYpz8K4O6lbVd+bOISTR0Uiw31M
	Bfy0WaI7RWFhs4zxsJi6QLJ8Y8eIQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agqhxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:10:07 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59U9vWBp018818;
	Thu, 30 Oct 2025 10:10:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agqhxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:10:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59U9if6S018796;
	Thu, 30 Oct 2025 10:10:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33xwg367-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:10:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59UAA2VL42729964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 10:10:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E324A2007B;
	Thu, 30 Oct 2025 10:10:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C40D92007A;
	Thu, 30 Oct 2025 10:09:59 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Oct 2025 10:09:59 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Thu, 30 Oct 2025 15:39:55 +0530
Message-ID: <20251030100955.1453314-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=K+gv3iWI c=1 sm=1 tr=0 ts=6903397f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=hzSy7ndL_gk34g0HB54A:9
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: 7LerGYTmQTquXF30wpwfsG3va-KN3MnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX8kcuiV8j4SR8
 05mUGZCHSADL2HYJ1d/YSjTxaN4vUFQcCzlsO5exNH6OIxGG2kb8K7Lo6B3zaYyGRU8GE3Rizmq
 +4b0He9yzLCzsKvYZV0ykTcDhdwY3K72xhHu/AJw9o0G4xnI/U6lG6fCPTvqyYXlJfMBJuAE44y
 DN8/ibGWp6pilic+UegQRf1GkQqcSE5BlZmtoVsZE/6nAFro6RpOEAuzEsEVJeq0fn/iJxvQ4aJ
 tyMV48VcJmaf3Ti62VJQgjvk4CJg1n5VOoHhDaBbeFJsnHy8HxVizItqO66lmXEMyKnfGvKpohd
 K4qk3+ZM13LSSFnrjJLXDGvwjvtTWV/woTPJeOoreJMgnyWH4t3MLw+ny0E5n0X8j5CbTFmE439
 K1mL4v6IPCh7F7PGf2nHgWQDkci89Q==
X-Proofpoint-GUID: KGeUGQV41FAhEfJd3aj9UiPz2vhU0T4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
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

Cc: Baoquan he <bhe@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changlog:

v3 -> v4
 - Removed repeated initialization to tmem in
   crash_exclude_mem_range_guarded()
 - Call crash_exclude_mem_range() with right crashk ranges

---
 arch/powerpc/include/asm/kexec.h   |  2 ++
 arch/powerpc/kernel/setup-common.c |  4 ++-
 arch/powerpc/kexec/core.c          | 10 ++++++-
 arch/powerpc/kexec/ranges.c        | 43 ++++++++++++++++++++++--------
 4 files changed, 46 insertions(+), 13 deletions(-)

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


