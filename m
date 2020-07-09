Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B321970D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:08:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2N2H1MM6zF0mS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBw2NG0zDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:48 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06933Bj6009582; Wed, 8 Jul 2020 23:30:39 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kt7j077-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:38 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693EUEZ032627;
 Thu, 9 Jul 2020 03:30:38 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 325k2435f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:38 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693Ubwc13960054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:37 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92F33B2065;
 Thu,  9 Jul 2020 03:30:37 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D08FB2067;
 Thu,  9 Jul 2020 03:30:35 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:35 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 18/23] powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on
 kexec
Date: Thu,  9 Jul 2020 08:59:41 +0530
Message-Id: <20200709032946.881753-19-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090023
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As we kexec across kernels that use AMR/IAMR for different purposes
we need to ensure that new kernels get kexec'd with a reset value
of AMR/IAMR. For ex: the new kernel can use key 0 for kernel mapping and the old
AMR value prevents access to key 0.

This patch also removes reset if IAMR and AMOR in kexec_sequence. Reset of AMOR
is not needed and the IAMR reset is partial (it doesn't do the reset
on secondary cpus) and is redundant with this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kexec.h | 23 ++++++++++++++++++++++
 arch/powerpc/include/asm/kexec.h           | 12 +++++++++++
 arch/powerpc/kernel/misc_64.S              | 14 -------------
 arch/powerpc/kexec/core_64.c               |  2 ++
 arch/powerpc/mm/book3s64/pgtable.c         |  3 +++
 5 files changed, 40 insertions(+), 14 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/kexec.h

diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/include/asm/book3s/64/kexec.h
new file mode 100644
index 000000000000..6b5c3a248ba2
--- /dev/null
+++ b/arch/powerpc/include/asm/book3s/64/kexec.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_POWERPC_BOOK3S_64_KEXEC_H_
+#define _ASM_POWERPC_BOOK3S_64_KEXEC_H_
+
+
+#define reset_sprs reset_sprs
+static inline void reset_sprs(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_206)) {
+		mtspr(SPRN_AMR, 0);
+		mtspr(SPRN_UAMOR, 0);
+	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+		mtspr(SPRN_IAMR, 0);
+	}
+
+	/*  Do we need isync()? We are going via a kexec reset */
+	isync();
+}
+
+#endif
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c68476818753..89f7e3462292 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -150,6 +150,18 @@ static inline void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 }
 
 #endif /* CONFIG_KEXEC_CORE */
+
+#ifdef CONFIG_PPC_BOOK3S_64
+#include <asm/book3s/64/kexec.h>
+#endif
+
+#ifndef reset_sprs
+#define reset_sprs reset_sprs
+static inline void reset_sprs(void)
+{
+}
+#endif
+
 #endif /* ! __ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_KEXEC_H */
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 1864605eca29..7bb46ad98207 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -413,20 +413,6 @@ _GLOBAL(kexec_sequence)
 	li	r0,0
 	std	r0,16(r1)
 
-BEGIN_FTR_SECTION
-	/*
-	 * This is the best time to turn AMR/IAMR off.
-	 * key 0 is used in radix for supervisor<->user
-	 * protection, but on hash key 0 is reserved
-	 * ideally we want to enter with a clean state.
-	 * NOTE, we rely on r0 being 0 from above.
-	 */
-	mtspr	SPRN_IAMR,r0
-BEGIN_FTR_SECTION_NESTED(42)
-	mtspr	SPRN_AMOR,r0
-END_FTR_SECTION_NESTED_IFSET(CPU_FTR_HVMODE, 42)
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-
 	/* save regs for local vars on new stack.
 	 * yes, we won't go back, but ...
 	 */
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index b4184092172a..8a449b2d8715 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -152,6 +152,8 @@ static void kexec_smp_down(void *arg)
 	if (ppc_md.kexec_cpu_down)
 		ppc_md.kexec_cpu_down(0, 1);
 
+	reset_sprs();
+
 	kexec_smp_wait();
 	/* NOTREACHED */
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c58ad1049909..e63fcc00744c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -15,6 +15,7 @@
 #include <asm/powernv.h>
 #include <asm/firmware.h>
 #include <asm/ultravisor.h>
+#include <asm/kexec.h>
 
 #include <mm/mmu_decl.h>
 #include <trace/events/thp.h>
@@ -165,6 +166,8 @@ void mmu_cleanup_all(void)
 		radix__mmu_cleanup_all();
 	else if (mmu_hash_ops.hpte_clear_all)
 		mmu_hash_ops.hpte_clear_all();
+
+	reset_sprs();
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-- 
2.26.2

