Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2118C8FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:30:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kH5x1Cm2zDrLv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:30:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kGvX6cZwzDrZp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:21:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K83YGA032216
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:26 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3x6byy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:26 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 20 Mar 2020 08:21:24 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:21:22 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8LKO143450610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:21:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6786011C064;
 Fri, 20 Mar 2020 08:21:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BB5711C052;
 Fri, 20 Mar 2020 08:21:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.168])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 08:21:13 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH 4/4] powerpc kvm_asm: rename PPC_LD and PPC_STD macros to
 avoid redefinition
Date: Fri, 20 Mar 2020 13:48:37 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200320081837.1016820-1-bala24@linux.ibm.com>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032008-0028-0000-0000-000003E80E0D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-0029-0000-0000-000024AD6BDF
Message-Id: <20200320081837.1016820-5-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=434
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200035
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

use PPC_KVM_LD and PPC_KVM_STD to fix gcc warnings on redefinition as
we consolidate all ppc instruction encoding in ppc-opcode.h

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_asm.h    |  8 ++++----
 arch/powerpc/kvm/booke_interrupts.S   |  8 ++++----
 arch/powerpc/kvm/bookehv_interrupts.S | 28 +++++++++++++--------------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index 635fb154b33f..d3f607c57856 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -11,11 +11,11 @@
 
 #ifdef __ASSEMBLY__
 #ifdef CONFIG_64BIT
-#define PPC_STD(sreg, offset, areg)  std sreg, (offset)(areg)
-#define PPC_LD(treg, offset, areg)   ld treg, (offset)(areg)
+#define PPC_KVM_STD(sreg, offset, areg)  (std sreg, (offset)(areg))
+#define PPC_KVM_LD(treg, offset, areg)   (ld treg, (offset)(areg))
 #else
-#define PPC_STD(sreg, offset, areg)  stw sreg, (offset+4)(areg)
-#define PPC_LD(treg, offset, areg)   lwz treg, (offset+4)(areg)
+#define PPC_KVM_STD(sreg, offset, areg)  (stw sreg, ((offset) + 4)(areg))
+#define PPC_KVM_LD(treg, offset, areg)   (lwz treg, ((offset) + 4)(areg))
 #endif
 #endif
 
diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
index 2e56ab5a5f55..3a343da95ea5 100644
--- a/arch/powerpc/kvm/booke_interrupts.S
+++ b/arch/powerpc/kvm/booke_interrupts.S
@@ -443,13 +443,13 @@ lightweight_exit:
 	 * written directly to the shared area, so we
 	 * need to reload them here with the guest's values.
 	 */
-	PPC_LD(r3, VCPU_SHARED_SPRG4, r5)
+	PPC_KVM_LD(r3, VCPU_SHARED_SPRG4, r5)
 	mtspr	SPRN_SPRG4W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG5, r5)
+	PPC_KVM_LD(r3, VCPU_SHARED_SPRG5, r5)
 	mtspr	SPRN_SPRG5W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG6, r5)
+	PPC_KVM_LD(r3, VCPU_SHARED_SPRG6, r5)
 	mtspr	SPRN_SPRG6W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG7, r5)
+	PPC_KVM_LD(r3, VCPU_SHARED_SPRG7, r5)
 	mtspr	SPRN_SPRG7W, r3
 
 #ifdef CONFIG_KVM_EXIT_TIMING
diff --git a/arch/powerpc/kvm/bookehv_interrupts.S b/arch/powerpc/kvm/bookehv_interrupts.S
index c577ba4b3169..97e9b3289c7b 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -89,7 +89,7 @@ END_BTB_FLUSH_SECTION
 #endif
 
 	oris	r8, r6, MSR_CE@h
-	PPC_STD(r6, VCPU_SHARED_MSR, r11)
+	PPC_KVM_STD(r6, VCPU_SHARED_MSR, r11)
 	ori	r8, r8, MSR_ME | MSR_RI
 	PPC_STL	r5, VCPU_PC(r4)
 
@@ -386,17 +386,17 @@ _GLOBAL(kvmppc_resume_host)
 	PPC_LL	r3, PACA_SPRG_VDSO(r13)
 #endif
 	mfspr	r5, SPRN_SPRG9
-	PPC_STD(r6, VCPU_SHARED_SPRG4, r11)
+	PPC_KVM_STD(r6, VCPU_SHARED_SPRG4, r11)
 	mfspr	r8, SPRN_SPRG6
-	PPC_STD(r7, VCPU_SHARED_SPRG5, r11)
+	PPC_KVM_STD(r7, VCPU_SHARED_SPRG5, r11)
 	mfspr	r9, SPRN_SPRG7
 #ifdef CONFIG_64BIT
 	mtspr	SPRN_SPRG_VDSO_WRITE, r3
 #endif
-	PPC_STD(r5, VCPU_SPRG9, r4)
-	PPC_STD(r8, VCPU_SHARED_SPRG6, r11)
+	PPC_KVM_STD(r5, VCPU_SPRG9, r4)
+	PPC_KVM_STD(r8, VCPU_SHARED_SPRG6, r11)
 	mfxer	r3
-	PPC_STD(r9, VCPU_SHARED_SPRG7, r11)
+	PPC_KVM_STD(r9, VCPU_SHARED_SPRG7, r11)
 
 	/* save guest MAS registers and restore host mas4 & mas6 */
 	mfspr	r5, SPRN_MAS0
@@ -405,7 +405,7 @@ _GLOBAL(kvmppc_resume_host)
 	stw	r5, VCPU_SHARED_MAS0(r11)
 	mfspr	r7, SPRN_MAS2
 	stw	r6, VCPU_SHARED_MAS1(r11)
-	PPC_STD(r7, VCPU_SHARED_MAS2, r11)
+	PPC_KVM_STD(r7, VCPU_SHARED_MAS2, r11)
 	mfspr	r5, SPRN_MAS3
 	mfspr	r6, SPRN_MAS4
 	stw	r5, VCPU_SHARED_MAS7_3+4(r11)
@@ -602,7 +602,7 @@ lightweight_exit:
 	stw	r3, VCPU_HOST_MAS6(r4)
 	lwz	r3, VCPU_SHARED_MAS0(r11)
 	lwz	r5, VCPU_SHARED_MAS1(r11)
-	PPC_LD(r6, VCPU_SHARED_MAS2, r11)
+	PPC_KVM_LD(r6, VCPU_SHARED_MAS2, r11)
 	lwz	r7, VCPU_SHARED_MAS7_3+4(r11)
 	lwz	r8, VCPU_SHARED_MAS4(r11)
 	mtspr	SPRN_MAS0, r3
@@ -620,15 +620,15 @@ lightweight_exit:
 	 * SPRGs, so we need to reload them here with the guest's values.
 	 */
 	lwz	r3, VCPU_VRSAVE(r4)
-	PPC_LD(r5, VCPU_SHARED_SPRG4, r11)
+	PPC_KVM_LD(r5, VCPU_SHARED_SPRG4, r11)
 	mtspr	SPRN_VRSAVE, r3
-	PPC_LD(r6, VCPU_SHARED_SPRG5, r11)
+	PPC_KVM_LD(r6, VCPU_SHARED_SPRG5, r11)
 	mtspr	SPRN_SPRG4W, r5
-	PPC_LD(r7, VCPU_SHARED_SPRG6, r11)
+	PPC_KVM_LD(r7, VCPU_SHARED_SPRG6, r11)
 	mtspr	SPRN_SPRG5W, r6
-	PPC_LD(r8, VCPU_SHARED_SPRG7, r11)
+	PPC_KVM_LD(r8, VCPU_SHARED_SPRG7, r11)
 	mtspr	SPRN_SPRG6W, r7
-	PPC_LD(r5, VCPU_SPRG9, r4)
+	PPC_KVM_LD(r5, VCPU_SPRG9, r4)
 	mtspr	SPRN_SPRG7W, r8
 	mtspr	SPRN_SPRG9, r5
 
@@ -638,7 +638,7 @@ lightweight_exit:
 	PPC_LL	r6, VCPU_CTR(r4)
 	PPC_LL	r7, VCPU_CR(r4)
 	PPC_LL	r8, VCPU_PC(r4)
-	PPC_LD(r9, VCPU_SHARED_MSR, r11)
+	PPC_KVM_LD(r9, VCPU_SHARED_MSR, r11)
 	PPC_LL	r0, VCPU_GPR(R0)(r4)
 	PPC_LL	r1, VCPU_GPR(R1)(r4)
 	PPC_LL	r2, VCPU_GPR(R2)(r4)
-- 
2.24.1

