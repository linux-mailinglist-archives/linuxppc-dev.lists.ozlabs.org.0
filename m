Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363D28582B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 07:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5jhQ5NxgzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 16:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EWHQ6RP4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5jfm0YMCzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 16:33:19 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0975WMV7076490; Wed, 7 Oct 2020 01:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6WT4/u7c/6qHKIb+SCgLNmEaUxjKlKvV+/VZY+oB9fE=;
 b=EWHQ6RP4rXxLlM0jqNWN9B1IDdIfDpaUWNB7kOA1ixN7h+BmxmHzAAnh/XjQat7FLhUN
 UzOG2STIRLVbycAFnYUPBvKf0jiAfbM60pUDw0rywDxOObAL33nnmp1maPC+2npAaClA
 4V+2Fg46nF8D5ohnXYR7t1MGxStBdTBW3mamep/V7ClYfKiADFgu9sOzVlCcj48l5PZl
 oRR4pgJrfkfarRiZGvg44sBT9WnP8XYlHdNqgxiIC1bt5eFzZhEm1GqqvRnH/IkIazjb
 XRob9h300TRzub4lpqNv8lYawvXNI7qJW7xh1lVhd0BGwVAjR/YtIOE0/DCoS5xkG6Wk GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3416ww110y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 01:33:11 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0975WihQ077519;
 Wed, 7 Oct 2020 01:33:11 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3416ww110p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 01:33:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0975NYBL001857;
 Wed, 7 Oct 2020 05:33:11 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 33xgx9kvcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 05:33:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0975XAxY55509328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 05:33:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3575DB2066;
 Wed,  7 Oct 2020 05:33:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6422DB2064;
 Wed,  7 Oct 2020 05:33:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.92.41])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 05:33:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mm: Update tlbiel loop on POWER10
Date: Wed,  7 Oct 2020 11:03:05 +0530
Message-Id: <20201007053305.232879-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_03:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070033
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

With POWER10, single tlbiel instruction invalidates all the congruence
class of the TLB and hence we need to issue only one tlbiel with SET=0.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c         |  7 ++++++-
 arch/powerpc/kvm/book3s_hv_builtin.c | 11 ++++++++++-
 arch/powerpc/mm/book3s64/radix_tlb.c | 23 ++++++++++++++++-------
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3bd3118c7633..00b5c5981db5 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4939,7 +4939,12 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	 * Work out how many sets the TLB has, for the use of
 	 * the TLB invalidation loop in book3s_hv_rmhandlers.S.
 	 */
-	if (radix_enabled())
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		/*
+		 * P10 will flush all the congruence class with a single tlbiel
+		 */
+		kvm->arch.tlb_sets = 1;
+	} else if (radix_enabled())
 		kvm->arch.tlb_sets = POWER9_TLB_SETS_RADIX;	/* 128 */
 	else if (cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm->arch.tlb_sets = POWER9_TLB_SETS_HASH;	/* 256 */
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 073617ce83e0..2803a4b01109 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -702,6 +702,7 @@ static void wait_for_sync(struct kvm_split_mode *sip, int phase)
 
 void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
 {
+	int num_sets;
 	unsigned long rb, set;
 
 	/* wait for every other thread to get to real mode */
@@ -712,11 +713,19 @@ void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
 	mtspr(SPRN_LPID, sip->lpidr_req);
 	isync();
 
+	/*
+	 * P10 will flush all the congruence class with a single tlbiel
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		num_sets =  1;
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
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 143b4fd396f0..9e76ba766b3c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -56,14 +56,21 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	if (early_cpu_has_feature(CPU_FTR_HVMODE)) {
 		/* MSR[HV] should flush partition scope translations first. */
 		tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 0);
-		for (set = 1; set < num_sets; set++)
-			tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 0);
+
+		if (!early_cpu_has_feature(CPU_FTR_ARCH_31)) {
+			for (set = 1; set < num_sets; set++)
+				tlbiel_radix_set_isa300(set, is, 0,
+							RIC_FLUSH_TLB, 0);
+		}
 	}
 
 	/* Flush process scoped entries. */
 	tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 1);
-	for (set = 1; set < num_sets; set++)
-		tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 1);
+
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_31)) {
+		for (set = 1; set < num_sets; set++)
+			tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 1);
+	}
 
 	asm volatile("ptesync": : :"memory");
 }
@@ -300,9 +307,11 @@ static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 		return;
 	}
 
-	/* For the remaining sets, just flush the TLB */
-	for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
-		__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		/* For the remaining sets, just flush the TLB */
+		for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
+			__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
+	}
 
 	asm volatile("ptesync": : :"memory");
 	asm volatile(PPC_RADIX_INVALIDATE_ERAT_USER "; isync" : : :"memory");
-- 
2.26.2

