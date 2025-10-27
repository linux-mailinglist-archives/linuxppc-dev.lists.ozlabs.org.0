Return-Path: <linuxppc-dev+bounces-13344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F63C0EDB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH8y0m0lz3ckc;
	Tue, 28 Oct 2025 02:14:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761578050;
	cv=none; b=i6Ln/gX4cnJEIs588mURHrq9MCHHuvxyUDQQV2kswzTQyIBUABRlH6xyS8Og8jawFJod6QMzuvrNLMBIJR1g+OENh3/dWX3wkLx4aDS55q5WjdwbQvdJsMJSBKxmSw4beqX/x2fjuCRVeJKjy1/YpYAdIR8T0iwnL5yn5uMF/xcb+CN7b6MPqwjmHvHZmI0OfdywP+Y3syekwHqsqpQy+fUBYmMaWsFve7GF4VngXQ9cp7aPKhB2MCIhcwaZaT5rgxi4gz96NN9eCnGPF5bmhRtp9qipzC0t3pMuDpdJIvHgHNn5o9w5dv8ucAc5yu9x5xSTenlPXp/GHQN/nGB79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761578050; c=relaxed/relaxed;
	bh=Mn62luHv9rmAYQ3FI4Py23M1yrftLGOxebh0K1xAE/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVLJ/o0gxK1TOUCStJweRXWHITGxCpyRMcM9mpssSi/10+wXROZcJ1Qnn31oUFia/reIU9+1pux/tpGkoqFWE71fsHt6K647x7oV1A6GLPytlOAEWz2tAtatVQW3KFHB+zGeMNNgeP+KdCctPNy8HYxD1HgUoSfADtZXD0fkHqFk8EGtVM12bSCNiNoB7d18yPLZ+kqgTrXiiMz/CEUI0PXuZAXH4VKKiZPgze6GIcuNyf9Vi6GsN2OU/mrxdYC6Zy8BvH2z3+YYLqxNe8D8aef4QFgKilHhdSTjXGKHqurVTMHcbZE+I2vCnkbRKU+trtKSBecTnf6iLsDKvwWzqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/RS0L0f; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/RS0L0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH8x217Cz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:14:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RCkIxS020055;
	Mon, 27 Oct 2025 15:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Mn62luHv9rmAYQ3FI
	4Py23M1yrftLGOxebh0K1xAE/U=; b=E/RS0L0fwUGoojV14y3s4QLwFfmmUi7qf
	jbcph1Sqjg4FmQM/zg8Xfbk/nMJEKtrtl0LfLKcfeSaeBAbfcDK7OMKT/FlQMNKf
	BonPO3b3KvFxDXBn7jNZOioUUStW0yRE6+yfdeFxS5cq+IAN1NKP+FGsK1YKlazF
	csW1sxEcwOhHxSJVzRVN+12/YtSS6uuCYjBbhjkFwZipp9JI7+tiYlPNeSZXQ2hd
	nx1SWYKYHFdkqQJU6IU67xBXsdRV/bQ/B9L1f0quexf+yCdryd3PqA5oak3x4JIH
	7N1hDh5C1E7Ek4XpTsp1kG4X6I8A0nLY7+oQeVqwVSMshkOqiJaVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:14:01 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59RFBWgE030739;
	Mon, 27 Oct 2025 15:14:00 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:14:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RBg9XD030114;
	Mon, 27 Oct 2025 15:14:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a19vme6dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59RFDuqe24052008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 15:13:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB6F720049;
	Mon, 27 Oct 2025 15:13:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BE5820040;
	Mon, 27 Oct 2025 15:13:54 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Oct 2025 15:13:54 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 4/4] powerpc/kdump: add support for high crashkernel reservation
Date: Mon, 27 Oct 2025 20:43:38 +0530
Message-ID: <20251027151338.819957-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 7DZoI7SZtAdOA9PIQTTsAwMEUGDDfcQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX0JQasyWXR5hz
 +Lh5O74LG4DQORCfPVjnmh+RoJi8GelFlw8h8e5akT5XVh/V+JmNSo7OxyDyp86zdXJTi9a1dta
 R9sXRuAoyGYQNFJBHjebHeiPeINaaxEov1BAd86Alz4pdDXnk2ud0AQvJRQjDzwOHGxYAuRzKih
 KjpquOihE0fPh6eR/sJet13KKIT8bc3uzLLdqKHLEm1rK4azXez1c87zDpKHOrCNt44+bn7Eop7
 XNyeft0b6jX37A4YGDa88HTMHQKpbIo3UmV97Ab/Nezg8oGvQyGhp+IS1xu38nloCZuIqC9rwY0
 8nGpYicTXb14BKx96rQoEVyh+S8YE0CEKRK24ATXMqWQmycOLWbcLOE04tQh5QW+eEOc92C0po7
 LmoZ0CHLuJjAvHBcU9euB682cQAq2A==
X-Proofpoint-GUID: due5pbIqlPB7G3B9D1Uqe3-dAX6kCQMe
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=68ff8c39 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=Scd-oUUrW7Fc3xwtgnsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With this changes included crashkernel=xxM,high will be supported on
powerpc. This allow user to allocated crashkernel memory on higer memory
region and keeping the low memory allocation minimal.

The low memory reservation is by default set to 64 MB and it is reserved
below RTAS_INSTANTIATE_MAX (1G) to make sure rtas instantiation work
properly.

powerpc uses generic crashkernel parser and reserve functions and they
are capable of handling high crashkernel reservtion so
arch_reserve_crashkernel() is updated call generic crashkernel praser
and reserve function with resptive options to make
crashkernel=XXM,high prase and make crashkernel memory get reserved on
higher memory regions.

Note: High crashkernel is supported only on PPC 64-bit systems when
64-bit RTAS is instantiated and Radix MMU is enabled; otherwise, the
crashkernel reservation falls back to the default, even if the kernel
command includes crashkernel=XXM,high.

Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/crash_reserve.h |  8 +++++
 arch/powerpc/include/asm/kexec.h         |  1 +
 arch/powerpc/include/asm/rtas.h          |  9 +++++
 arch/powerpc/kexec/core.c                | 45 +++++++++++++++++-------
 4 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/crash_reserve.h b/arch/powerpc/include/asm/crash_reserve.h
index 6467ce29b1fa..d96d7726104a 100644
--- a/arch/powerpc/include/asm/crash_reserve.h
+++ b/arch/powerpc/include/asm/crash_reserve.h
@@ -2,7 +2,15 @@
 #ifndef _ASM_POWERPC_CRASH_RESERVE_H
 #define _ASM_POWERPC_CRASH_RESERVE_H
 
+#include <asm/rtas.h>
+
 /* crash kernel regions are Page size agliged */
 #define CRASH_ALIGN             PAGE_SIZE
 
+#define DEFAULT_CRASH_KERNEL_LOW_SIZE SZ_64M
+
+#define CRASH_ADDR_LOW_MAX	RTAS_INSTANTIATE_MAX
+#define CRASH_ADDR_HIGH_MAX	memblock_end_of_DRAM()
+
+
 #endif /* _ASM_POWERPC_CRASH_RESERVE_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..080fef2344b4 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -116,6 +116,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 int __init overlaps_crashkernel(unsigned long start, unsigned long size);
 extern void arch_reserve_crashkernel(void);
 extern void kdump_cma_reserve(void);
+unsigned long long __init get_crash_base(unsigned long long crash_base);
 #else
 static inline void arch_reserve_crashkernel(void) {}
 static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index aaa4c3bc1d61..d290437d8131 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -561,6 +561,14 @@ static inline int page_is_rtas_user_buf(unsigned long pfn)
 	return 0;
 }
 
+static inline bool is_rtas_high_crashkernel_capable(void)
+{
+	if (rtas_64)
+		return true;
+
+	return false;
+}
+
 /* Not the best place to put pSeries_coalesce_init, will be fixed when we
  * move some of the rtas suspend-me stuff to pseries */
 void pSeries_coalesce_init(void);
@@ -569,6 +577,7 @@ void rtas_initialize(void);
 static inline int page_is_rtas_user_buf(unsigned long pfn) { return 0;}
 static inline void pSeries_coalesce_init(void) { }
 static inline void rtas_initialize(void) { }
+static inline bool is_rtas_high_crashkernel_capable(void) { return true; }
 #endif
 
 #ifdef CONFIG_HV_PERF_CTRS
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 25744737eff5..09b7518bba36 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -15,6 +15,7 @@
 #include <linux/irq.h>
 #include <linux/ftrace.h>
 
+#include <asm/rtas.h>
 #include <asm/kdump.h>
 #include <asm/machdep.h>
 #include <asm/pgalloc.h>
@@ -61,7 +62,7 @@ void machine_kexec(struct kimage *image)
 
 #ifdef CONFIG_CRASH_RESERVE
 
-static unsigned long long __init get_crash_base(unsigned long long crash_base)
+unsigned long long __init get_crash_base(unsigned long long crash_base)
 {
 
 #ifndef CONFIG_NONSTATIC_KERNEL
@@ -101,35 +102,55 @@ static unsigned long long __init get_crash_base(unsigned long long crash_base)
 #endif
 }
 
+static bool high_crashkernel_supported(void)
+{
+#if defined(CONFIG_PPC64) && (defined(CONFIG_PPC_PSERIES) || defined(CONFIG_PPC_POWERNV))
+	if (early_radix_enabled() && is_rtas_high_crashkernel_capable())
+		return true;
+#endif
+	return false;
+}
+
 void __init arch_reserve_crashkernel(void)
 {
-	unsigned long long crash_size, crash_base, crash_end;
+	unsigned long long crash_size, crash_base, crash_end, low_size = 0;
 	unsigned long long kernel_start, kernel_size;
 	unsigned long long total_mem_sz;
+	bool high = false;
 	int ret;
 
 	total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
 
 	/* use common parsing */
 	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
-				&crash_base, NULL, &cma_size, NULL);
+				&crash_base, &low_size, &cma_size, &high);
 
 	if (ret)
 		return;
 
-	crash_base = get_crash_base(crash_base);
-	crash_end = crash_base + crash_size - 1;
+	if (high && !high_crashkernel_supported()) {
+		high = false;
+		low_size = 0;
+		pr_warn("High crashkernel unsupported, using standard reservation");
+	}
 
-	kernel_start = __pa(_stext);
-	kernel_size = _end - _stext;
+	if (high) {
+		crash_base = 0;
+	} else {
+		crash_base = get_crash_base(crash_base);
+		crash_end = crash_base + crash_size - 1;
 
-	/* The crash region must not overlap the current kernel */
-	if ((kernel_start + kernel_size > crash_base) && (kernel_start <= crash_end)) {
-		pr_warn("Crash kernel can not overlap current kernel\n");
-		return;
+		kernel_start = __pa(_stext);
+		kernel_size = _end - _stext;
+
+		/* The crash region must not overlap the current kernel */
+		if ((kernel_start + kernel_size > crash_base) && (kernel_start <= crash_end)) {
+			pr_warn("Crash kernel can not overlap current kernel\n");
+			return;
+		}
 	}
 
-	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
+	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
 }
 
 void __init kdump_cma_reserve(void)
-- 
2.51.0


