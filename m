Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748B1F9002
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:35:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ljm95kQGzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lh1Q1ws0zDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:16:42 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F622eA032504; Mon, 15 Jun 2020 02:16:36 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ncdggq1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:16:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6Ew2j031725;
 Mon, 15 Jun 2020 06:16:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31mpe991g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:16:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6GW8A4260292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:16:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1115C6057;
 Mon, 15 Jun 2020 06:16:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5D3FC605B;
 Mon, 15 Jun 2020 06:16:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:16:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 40/41] powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on
 kexec
Date: Mon, 15 Jun 2020 11:44:29 +0530
Message-Id: <20200615061430.770174-41-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-12,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 cotscore=-2147483648
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006150050
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

We can kexec into a kernel that doesn't use memory keys for kernel
mapping (such as an older kernel which doesn't support kuap/kuep with hash
translation). We need to make sure we reset the AMR/IAMR value on kexec
otherwise, the new kernel will use key 0 for kernel mapping and the old
AMR value prevents access to key 0.

This patch also removes reset if IAMR and AMOR in kexec_sequence. Reset of AMOR
is not needed and the IAMR reset is partial (it doesn't do the reset
on secondary cpus) and is redundant with this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 20 ++++++++++++++++++++
 arch/powerpc/include/asm/kup.h           | 14 ++++++++++++++
 arch/powerpc/kernel/misc_64.S            | 14 --------------
 arch/powerpc/kexec/core_64.c             |  3 +++
 arch/powerpc/mm/book3s64/pgtable.c       |  3 +++
 5 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 78b3f67ae8c5..be04733c89f3 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -365,6 +365,26 @@ static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
 }
 #endif /* CONFIG_PPC_KUAP */
 
+#define reset_kuap reset_kuap
+static inline void reset_kuap(void)
+{
+	if (mmu_has_feature(MMU_FTR_KUAP)) {
+		mtspr(SPRN_AMR, 0);
+		/*  Do we need isync()? We are going via a kexec reset */
+		isync();
+	}
+}
+
+#define reset_kuep reset_kuep
+static inline void reset_kuep(void)
+{
+	if (mmu_has_feature(MMU_FTR_KUEP)) {
+		mtspr(SPRN_IAMR, 0);
+		/*  Do we need isync()? We are going via a kexec reset */
+		isync();
+	}
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index a29f69bbf6ec..c7ab7310f230 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -113,6 +113,20 @@ static inline void prevent_current_write_to_user(void)
 	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_WRITE);
 }
 
+#ifndef reset_kuap
+#define reset_kuap reset_kuap
+static inline void reset_kuap(void)
+{
+}
+#endif
+
+#ifndef reset_kuep
+#define reset_kuep reset_kuep
+static inline void reset_kuep(void)
+{
+}
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_KUAP_H_ */
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
index b4184092172a..a124715f33ea 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -152,6 +152,9 @@ static void kexec_smp_down(void *arg)
 	if (ppc_md.kexec_cpu_down)
 		ppc_md.kexec_cpu_down(0, 1);
 
+	reset_kuap();
+	reset_kuep();
+
 	kexec_smp_wait();
 	/* NOTREACHED */
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c58ad1049909..9673f4b74c9a 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -165,6 +165,9 @@ void mmu_cleanup_all(void)
 		radix__mmu_cleanup_all();
 	else if (mmu_hash_ops.hpte_clear_all)
 		mmu_hash_ops.hpte_clear_all();
+
+	reset_kuap();
+	reset_kuep();
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-- 
2.26.2

