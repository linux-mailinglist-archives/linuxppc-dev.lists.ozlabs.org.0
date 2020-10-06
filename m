Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE128483E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 10:18:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C59N06qwhzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 19:18:40 +1100 (AEDT)
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
 header.s=pp1 header.b=ERwPQCHf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C59LF3kn9zDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 19:17:09 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0968ERdx002362; Tue, 6 Oct 2020 04:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wSw3h8sH4JvsEFrE/resOl+ID27cuLNjs2vZKdirQYs=;
 b=ERwPQCHfNvx8WVJg3V4ksXNIB1ck1GFlUM+Yk66GzO3OghHz9aikZBiD0/qxjaIX1hGA
 /BFjsoPEPVoumsz56JNogf7Ncw6f5DghDUGzEmfPjQeV7OibE911lLKZ2pK6H0OdfeDN
 46JO8JAoVSnFYyZyc6unl44B0/oHx/wBOk5lLv2mdxrrMFUvMW5hGOZNTECYaGOoLTwX
 MbKa5jqwsknugFD4nH7XBv/d0p2HTg1BjJYYWmWcEc1jEBTVguo6kAx/MdtDZv15nfjd
 pvNnjHYffP3tLp8dNLKBAIsb9RFjDPE43upkXeEVXyvADpIQOQf2diSGWc3YzfUyW3Bd wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340mvxr28m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 04:17:04 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0968ERf0002383;
 Tue, 6 Oct 2020 04:17:03 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340mvxr27y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 04:17:03 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0968GiBL020782;
 Tue, 6 Oct 2020 08:17:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 33xgx8wt68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 08:17:02 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0968Gv5t35258720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 08:16:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4920BE051;
 Tue,  6 Oct 2020 08:17:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86E3BBE04F;
 Tue,  6 Oct 2020 08:16:59 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  6 Oct 2020 08:16:59 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] powerpc/mm: Support tlbiel set value of 1 on POWER10
Date: Tue,  6 Oct 2020 13:46:56 +0530
Message-Id: <20201006081656.150735-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_03:2020-10-06,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010060049
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With POWER10, tlbiel invalidates all the congruence class of TLB
and hence we need to issue only one tlbiel with SET=0. Update
POWER10_TLB_SETS to 1 and use that in the rest of the code.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 +
 arch/powerpc/kvm/book3s_hv.c                  |  4 +++-
 arch/powerpc/kvm/book3s_hv_builtin.c          |  8 +++++++-
 arch/powerpc/mm/book3s64/hash_native.c        |  4 +++-
 arch/powerpc/mm/book3s64/radix_tlb.c          | 13 ++++++++++---
 5 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 683a9c7d1b03..755ae1ea910a 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -129,6 +129,7 @@
 #define POWER8_TLB_SETS		512	/* # sets in POWER8 TLB */
 #define POWER9_TLB_SETS_HASH	256	/* # sets in POWER9 TLB Hash mode */
 #define POWER9_TLB_SETS_RADIX	128	/* # sets in POWER9 TLB Radix mode */
+#define POWER10_TLB_SETS	1	/* # sets in POWER10 TLB */
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3bd3118c7633..12553cb55ede 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4939,7 +4939,9 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	 * Work out how many sets the TLB has, for the use of
 	 * the TLB invalidation loop in book3s_hv_rmhandlers.S.
 	 */
-	if (radix_enabled())
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		kvm->arch.tlb_sets = POWER10_TLB_SETS;	/* 1 */
+	else if (radix_enabled())
 		kvm->arch.tlb_sets = POWER9_TLB_SETS_RADIX;	/* 128 */
 	else if (cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm->arch.tlb_sets = POWER9_TLB_SETS_HASH;	/* 256 */
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 073617ce83e0..7dfe38771f3c 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -702,6 +702,7 @@ static void wait_for_sync(struct kvm_split_mode *sip, int phase)
 
 void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
 {
+	int num_sets;
 	unsigned long rb, set;
 
 	/* wait for every other thread to get to real mode */
@@ -712,11 +713,16 @@ void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
 	mtspr(SPRN_LPID, sip->lpidr_req);
 	isync();
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		num_sets = POWER10_TLB_SETS;
+	else
+		num_sets = POWER9_TLB_SETS_RADIX;
+
 	/* Invalidate the TLB on thread 0 */
 	if (local_paca->kvm_hstate.tid == 0) {
 		sip->do_set = 0;
 		asm volatile("ptesync" : : : "memory");
-		for (set = 0; set < POWER9_TLB_SETS_RADIX; ++set) {
+		for (set = 0; set < num_sets; ++set) {
 			rb = TLBIEL_INVAL_SET_LPID +
 				(set << TLBIEL_INVAL_SET_SHIFT);
 			asm volatile(PPC_TLBIEL(%0, %1, 0, 0, 0) : :
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index cf20e5229ce1..abea64c804b2 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -130,7 +130,9 @@ void hash__tlbiel_all(unsigned int action)
 		BUG();
 	}
 
-	if (early_cpu_has_feature(CPU_FTR_ARCH_300))
+	if (early_cpu_has_feature(CPU_FTR_ARCH_31))
+		tlbiel_all_isa300(POWER10_TLB_SETS, is);
+	else if (early_cpu_has_feature(CPU_FTR_ARCH_300))
 		tlbiel_all_isa300(POWER9_TLB_SETS_HASH, is);
 	else if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
 		tlbiel_all_isa206(POWER8_TLB_SETS, is);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 143b4fd396f0..47db637755c4 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -83,7 +83,9 @@ void radix__tlbiel_all(unsigned int action)
 		BUG();
 	}
 
-	if (early_cpu_has_feature(CPU_FTR_ARCH_300))
+	if (early_cpu_has_feature(CPU_FTR_ARCH_31))
+		tlbiel_all_isa300(POWER10_TLB_SETS, is);
+	else if (early_cpu_has_feature(CPU_FTR_ARCH_300))
 		tlbiel_all_isa300(POWER9_TLB_SETS_RADIX, is);
 	else
 		WARN(1, "%s called on pre-POWER9 CPU\n", __func__);
@@ -284,7 +286,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
  */
 static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
-	int set;
+	int set, num_sets;
 
 	asm volatile("ptesync": : :"memory");
 
@@ -300,8 +302,13 @@ static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 		return;
 	}
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		num_sets = POWER10_TLB_SETS;
+	else
+		num_sets = POWER9_TLB_SETS_RADIX;
+
 	/* For the remaining sets, just flush the TLB */
-	for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
+	for (set = 1; set < num_sets; set++)
 		__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-- 
2.26.2

