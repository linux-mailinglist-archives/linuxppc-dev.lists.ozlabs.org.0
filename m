Return-Path: <linuxppc-dev+bounces-13204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC5C01076
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslMW5gcmz3bW7;
	Thu, 23 Oct 2025 23:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761221671;
	cv=none; b=Nf3YYw7Sh4MemeIgM39K/D/oXjV/Id8Dj82e5zJE7tj5zPNdKFZIDq5hEcapKg9+hB3BXGP9p9Ojh8r32z38PyNPBSWBX91q5Jr43rV7kLYSgVq3rt2HkhVRyJH/F5BBK9qRfKNXR87ZOsPQAdJjW0BmM9fmaihyGUA0ev1wkfonWZ+mdoa8GbZ2Lfm7oJtUDie7oLMCxc14FoHAwib8fCzRAsQ85caFeN8fhtc9QNJTn91i6EbZF9EJSh+9xS1Kl+/DlqulMvo2krNGHp5vK+E9KOK2WI/X40A+CuIGhag5I2x18dv0Y74dvtMEd5bIKeub/qqY5raOpVaIrtaPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761221671; c=relaxed/relaxed;
	bh=noznYeJYVxcEjpJ+JM/W3euXd8oNSppIyqdqzy6yMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tv4cWq6qkSHTQ9Q3lyYcePxAF8I2yUcCErVXTfVGfeGMQIYqIuDnkEKiqZQKSzJPAaaUIEpUWemdTb0IF/DRwN4GfxZxmBSU2CHecv99DH0v6sD4Rkhm50fjVZwhN7ny4hivNg5NKG/MaM7Kt3gMq7m8vXQ7mZPJeHNm2mnz8phXzL9aekjuVMI5tTgK+yuhz06mo5C75KpLZ4lOddmsQ6W6E70qTxXo5MOnkH9qhcMRGvyCVIizOkK+qc6ExDzLE+1qBGDt5oybzLCDmoFtB+cXLbPf0wdYTTkQkTKOlkGygDq1VdjiybZs9/Q2ZhDtfjEG8QZ+DfV2Ccu+QiHbAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zpv/y4Fg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zpv/y4Fg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslMV3Prmz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:14:30 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N0TnY4020225;
	Thu, 23 Oct 2025 12:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=noznYeJYVxcEjpJ+JM/W3euXd8oNSppIyqdqzy6yM
	xo=; b=Zpv/y4Fgb9Ii1kqhd0xebXTQwcCPXu6UnNjwM9jUlw5KPhKCU2ubYjv8d
	64zoDSEqFGhWqfWPHqe/8KxN+YqRUvrHfJ7lq0jW5RWnY1lIMfcu7q9/m4FM7wid
	5KM0TVZWzCSac68fLa8L3LgBKWiymBkCJ4CVX3XZOjusUVRK9+mfnlLYi7Sbfw6U
	6mqUv3UnRkp/NYZjn5Vme2abdNv0iZkd/6/6+MS1JEabjIs8EDLZiTSmc+j8LTx0
	HfDQkxvg1c704h1nacH3TvmvnUl+q0C9QwkFheaawLzKQDx8bnyBZi9LoYtaOj/k
	maBb7KdzZLiYd7nercCarc7CPGetg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33fj1p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 12:14:22 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59NCAmR9029563;
	Thu, 23 Oct 2025 12:14:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33fj1p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 12:14:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59NB1VsL011075;
	Thu, 23 Oct 2025 12:14:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vqx1da6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 12:14:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59NCEH6C37749042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Oct 2025 12:14:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09C7A20043;
	Thu, 23 Oct 2025 12:14:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 150FA2004D;
	Thu, 23 Oct 2025 12:14:15 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Oct 2025 12:14:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH v2] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Thu, 23 Oct 2025 17:44:12 +0530
Message-ID: <20251023121413.56963-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=FMYWBuos c=1 sm=1 tr=0 ts=68fa1c1e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=-o-kazUmVXvP5PRTSMQA:9
X-Proofpoint-GUID: urLZP4uBE4QmZlKrV_0P-18y0Utn6DUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX0QuJNJIB1jkN
 oNU7BUx1rYkuYJv91VGVu6xc3S+v8HofIXlPMSbuSoKM3flKAsUr9yVDa1AQ59BbMM1TfVaS9Uw
 Zd7sbqY5PyGSdILMe7xiZ1n5hxfiMg/CAfitQyYFCjgS6Q8XuFHWboCno+zrApH7vuVhL63bROY
 Ib2iRls8YIIrJcW65RJMjSFW50mruIttuIzpSDIcP+ddidBn8MkUQIYcT9zL8rwixPEhSQAhCYH
 8l6UGhXkIowiuPoSL3otq4vcPG1SLXVD3SD3Z4XNcoF0TSEhuopxqLRXgtOnmdftI2FjOYLVjYw
 e5Dk+zRJekIqdFKuX6HUfOFVMnhOwKvwS7oXTt1sDIptcUIzsvT7OR4ywIduON+o485YToRyJz5
 MUvl/XkoLsID/KWVkXXFSCoD4b/r+A==
X-Proofpoint-ORIG-GUID: rnoMubnsjzVSf6anKdXptHEu1_ajFyxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
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
  prevent them from being exported through /proc/vmcore

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

Changelog:

v1 -> v2:
 - Fix build warnings, ensure kernel build when CONFIG_CMA is
   disabled

---
 arch/powerpc/include/asm/kexec.h   |  7 +++++++
 arch/powerpc/kernel/setup-common.c |  4 +++-
 arch/powerpc/kexec/core.c          | 13 ++++++++++++-
 arch/powerpc/kexec/ranges.c        | 16 +++++++++++++++-
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 4bbf9f699aaa..c158ffbfeadb 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -51,9 +51,16 @@
 
 #ifndef __ASSEMBLER__
 #include <asm/reg.h>
+#include <linux/crash_reserve.h>
 
 typedef void (*crash_shutdown_t)(void);
 
+#ifdef CRASHKERNEL_CMA
+void kdump_cma_reserve(void);
+#else
+static inline void kdump_cma_reserve(void) { }
+#endif
+
 #ifdef CONFIG_KEXEC_CORE
 struct kimage;
 struct pt_regs;
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
index d1a2d755381c..6e7bf8fc868d 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/irq.h>
 #include <linux/ftrace.h>
+#include <linux/crash_reserve.h>
 
 #include <asm/kdump.h>
 #include <asm/machdep.h>
@@ -33,6 +34,8 @@ void machine_kexec_cleanup(struct kimage *image)
 {
 }
 
+unsigned long long cma_size;
+
 /*
  * Do not allocate memory (or fail in any way) in machine_kexec().
  * We are past the point of no return, committed to rebooting now.
@@ -110,7 +113,7 @@ void __init arch_reserve_crashkernel(void)
 
 	/* use common parsing */
 	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
-				&crash_base, NULL, NULL, NULL);
+				&crash_base, NULL, &cma_size, NULL);
 
 	if (ret)
 		return;
@@ -130,6 +133,14 @@ void __init arch_reserve_crashkernel(void)
 	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
 }
 
+#ifdef CRASHKERNEL_CMA
+void __init kdump_cma_reserve(void)
+{
+	if (cma_size)
+		reserve_crashkernel_cma(cma_size);
+}
+#endif
+
 int __init overlaps_crashkernel(unsigned long start, unsigned long size)
 {
 	return (start + size) > crashk_res.start && start <= crashk_res.end;
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 3702b0bdab14..dad58fc38251 100644
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
@@ -595,6 +602,13 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 	if (ret)
 		goto out;
 
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(tmem, crashk_cma_ranges[i].start,
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


