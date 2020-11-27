Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084072C5F5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:58:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2TP1Z3VzDsNZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 15:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A3KNvT0e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29T11dXzDrQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:45:00 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4WYKs111503; Thu, 26 Nov 2020 23:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NdYKLuHN/QVJVnwH0I60txxUyCnLd4bl/1Vhtmb6avI=;
 b=A3KNvT0e+ndr7bcob38W6oCbXC0+kpx8ocXTTRIoXjn0ypE2e+j9J0rJb8R+xUTiDru8
 4rH3Y90ftZp6g2Oik3hPnZCpV9UD2IeySKRajovxQcxNx4hsOtgdEAToHvqdK+UOrNq5
 AYfsoiBGCSB5WzXGpONFu0GHRgP2ihkLXtOl81cpAqFu5HXBbrBBiXZj+dkDt1D4+/ex
 VUV+1uP+8cpyCq+4tObrqN/rUN0+87BRoPFKeZJoCRGXFmhUdmjNsh1Do88bKDLTsqD4
 qHtL6yNuWShxd3YcsySc9XgajsJMscNknfCaZAX9w5Kb6/vR29GiS/LKtZg0lVEOy8Nd 7A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352jf3syyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:44:52 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4hfcT012835;
 Fri, 27 Nov 2020 04:44:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 34xth9kw6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:44:51 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4iiYr34800230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:44 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC7F46E04C;
 Fri, 27 Nov 2020 04:44:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2B246E04E;
 Fri, 27 Nov 2020 04:44:48 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 07/22] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP and
 MMU_FTR_KUEP
Date: Fri, 27 Nov 2020 10:14:09 +0530
Message-Id: <20201127044424.40686-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is in preparation to adding support for kuap with hash translation.
In preparation for that rename/move kuap related functions to
non radix names. Also move the feature bit closer to MMU_FTR_KUEP.

MMU_FTR_KUEP is renamed to MMU_FTR_BOOK3S_KUEP to indicate the feature
is only relevant to BOOK3S_64

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 18 +++++++++---------
 arch/powerpc/include/asm/mmu.h           | 24 ++++++++++++++----------
 arch/powerpc/mm/book3s64/pkeys.c         |  4 ++--
 3 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 39d2e3a0d64d..262576514eac 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -24,7 +24,7 @@
 	mtspr	SPRN_AMR, \gpr2
 	/* No isync required, see kuap_restore_amr() */
 998:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
 
@@ -37,7 +37,7 @@
 	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
 999:	tdne	\gpr1, \gpr2
 	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
 #endif
@@ -58,7 +58,7 @@
 	mtspr	SPRN_AMR, \gpr2
 	isync
 99:
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
 
@@ -73,7 +73,7 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 
 static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP) && unlikely(regs->kuap != amr)) {
+	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP) && unlikely(regs->kuap != amr)) {
 		isync();
 		mtspr(SPRN_AMR, regs->kuap);
 		/*
@@ -86,7 +86,7 @@ static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 
 static inline unsigned long kuap_get_and_check_amr(void)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
 		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
 			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
@@ -97,7 +97,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 static inline void kuap_check_amr(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
 }
 
@@ -116,7 +116,7 @@ static inline unsigned long get_kuap(void)
 	 * This has no effect in terms of actually blocking things on hash,
 	 * so it doesn't break anything.
 	 */
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return AMR_KUAP_BLOCKED;
 
 	return mfspr(SPRN_AMR);
@@ -124,7 +124,7 @@ static inline unsigned long get_kuap(void)
 
 static inline void set_kuap(unsigned long value)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!early_mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return;
 
 	/*
@@ -139,7 +139,7 @@ static inline void set_kuap(unsigned long value)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
+	return WARN(mmu_has_feature(MMU_FTR_BOOK3S_KUAP) &&
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 255a1837e9f7..b6ab5edb644a 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -29,9 +29,18 @@
  */
 
 /*
- * Support for KUEP feature.
+ * Supports KUAP feature
+ * key 0 controlling userspace addresses on radix
+ * Key 3 on hash
  */
-#define MMU_FTR_KUEP			ASM_CONST(0x00000400)
+#define MMU_FTR_BOOK3S_KUAP		ASM_CONST(0x00000200)
+
+/*
+ * Supports KUEP feature
+ * key 0 controlling userspace addresses on radix
+ * Key 3 on hash
+ */
+#define MMU_FTR_BOOK3S_KUEP		ASM_CONST(0x00000400)
 
 /*
  * Support for memory protection keys.
@@ -120,11 +129,6 @@
  */
 #define MMU_FTR_1T_SEGMENT		ASM_CONST(0x40000000)
 
-/*
- * Supports KUAP (key 0 controlling userspace addresses) on radix
- */
-#define MMU_FTR_RADIX_KUAP		ASM_CONST(0x80000000)
-
 /* MMU feature bit sets for various CPUs */
 #define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	\
 	MMU_FTR_HPTE_TABLE | MMU_FTR_PPCAS_ARCH_V2
@@ -187,15 +191,15 @@ enum {
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
 		MMU_FTR_GTSE |
+#endif /* CONFIG_PPC_RADIX_MMU */
 #ifdef CONFIG_PPC_KUAP
-		MMU_FTR_RADIX_KUAP |
+	MMU_FTR_BOOK3S_KUAP |
 #endif /* CONFIG_PPC_KUAP */
-#endif /* CONFIG_PPC_RADIX_MMU */
 #ifdef CONFIG_PPC_MEM_KEYS
 	MMU_FTR_PKEY |
 #endif
 #ifdef CONFIG_PPC_KUEP
-	MMU_FTR_KUEP |
+	MMU_FTR_BOOK3S_KUEP |
 #endif /* CONFIG_PPC_KUAP */
 
 		0,
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 82c722fbce52..c5c61aa18a04 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -237,7 +237,7 @@ void __init setup_kuep(bool disabled)
 
 	if (smp_processor_id() == boot_cpuid) {
 		pr_info("Activating Kernel Userspace Execution Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_KUEP;
+		cur_cpu_spec->mmu_features |= MMU_FTR_BOOK3S_KUEP;
 	}
 
 	/*
@@ -258,7 +258,7 @@ void __init setup_kuap(bool disabled)
 
 	if (smp_processor_id() == boot_cpuid) {
 		pr_info("Activating Kernel Userspace Access Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
+		cur_cpu_spec->mmu_features |= MMU_FTR_BOOK3S_KUAP;
 	}
 
 	/*
-- 
2.28.0

