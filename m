Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79137B57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:46:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KY415SVFzDqty
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KXs72GNpzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KXs63VxQz8wRT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:42 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KXs61CvJz9sP6; Fri,  7 Jun 2019 03:36:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KXs53YJHz9sNm
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 03:36:41 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56HSIPk102796
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Jun 2019 13:36:39 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sy78q0e82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 13:36:39 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 6 Jun 2019 18:36:38 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 18:36:35 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56HaXNe19333566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 17:36:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BAE4AC05F;
 Thu,  6 Jun 2019 17:36:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE14AC059;
 Thu,  6 Jun 2019 17:36:31 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 17:36:31 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 8/9] KVM: PPC: Ultravisor: Enter a secure guest
Date: Thu,  6 Jun 2019 14:36:13 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606173614.32090-1-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060617-2213-0000-0000-0000039B189C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011224; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214150; UDB=6.00638204; IPR=6.00995229; 
 MB=3.00027209; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 17:36:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060617-2214-0000-0000-00005EBEA896
Message-Id: <20190606173614.32090-9-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060117
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

To enter a secure guest, we have to go through the ultravisor, therefore
we do a ucall when we are entering a secure guest.

This change is needed for any sort of entry to the secure guest from the
hypervisor, whether it is a return from an hcall, a return from a
hypervisor interrupt, or the first time that a secure guest vCPU is run.

If we are returning from an hcall, the results are already in the
appropriate registers (R3:12), except for R6,7, which need to be
restored before doing the ucall (UV_RETURN).

Have fast_guest_return check the kvm_arch.secure_guest field so that a
new CPU enters UV when started (in response to a RTAS start-cpu call).

Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
[Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
 the MSR_S bit]
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
[Fix UV_RETURN token number and arch.secure_guest check]
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[Update commit message and ret_to_ultra comment]
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h       |  1 +
 arch/powerpc/include/asm/ultravisor-api.h |  1 +
 arch/powerpc/kernel/asm-offsets.c         |  1 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 37 +++++++++++++++++++----
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 013c76a0a03e..184becb62ea4 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -294,6 +294,7 @@ struct kvm_arch {
 	cpumask_t cpu_in_guest;
 	u8 radix;
 	u8 fwnmi_enabled;
+	u8 secure_guest;
 	bool threads_indep;
 	bool nested_enable;
 	pgd_t *pgtable;
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index 24bfb4c1737e..15e6ce77a131 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -19,5 +19,6 @@
 
 /* opcodes */
 #define UV_WRITE_PATE			0xF104
+#define UV_RETURN			0xF11C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8e02444e9d3d..44742724513e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -508,6 +508,7 @@ int main(void)
 	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
 	OFFSET(KVM_RADIX, kvm, arch.radix);
 	OFFSET(KVM_FWNMI, kvm, arch.fwnmi_enabled);
+	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
 	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
 	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
 	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index cffb365d9d02..d719d730d31e 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -36,6 +36,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 #include <asm/cpuidle.h>
+#include <asm/ultravisor-api.h>
 
 /* Sign-extend HDEC if not on POWER9 */
 #define EXTEND_HDEC(reg)			\
@@ -1092,16 +1093,12 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	ld	r5, VCPU_LR(r4)
-	ld	r6, VCPU_CR(r4)
 	mtlr	r5
-	mtcr	r6
 
 	ld	r1, VCPU_GPR(R1)(r4)
 	ld	r2, VCPU_GPR(R2)(r4)
 	ld	r3, VCPU_GPR(R3)(r4)
 	ld	r5, VCPU_GPR(R5)(r4)
-	ld	r6, VCPU_GPR(R6)(r4)
-	ld	r7, VCPU_GPR(R7)(r4)
 	ld	r8, VCPU_GPR(R8)(r4)
 	ld	r9, VCPU_GPR(R9)(r4)
 	ld	r10, VCPU_GPR(R10)(r4)
@@ -1119,10 +1116,35 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_HDSISR, r0
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 
+	ld	r6, VCPU_KVM(r4)
+	lbz	r7, KVM_SECURE_GUEST(r6)
+	cmpdi	r7, 0
+	bne	ret_to_ultra
+
+	lwz	r6, VCPU_CR(r4)
+	mtcr	r6
+
+	ld	r7, VCPU_GPR(R7)(r4)
+	ld	r6, VCPU_GPR(R6)(r4)
 	ld	r0, VCPU_GPR(R0)(r4)
 	ld	r4, VCPU_GPR(R4)(r4)
 	HRFI_TO_GUEST
 	b	.
+/*
+ * We are entering a secure guest, so we have to invoke the ultravisor to do
+ * that. If we are returning from a hcall, the results are already in the
+ * appropriate registers (R3:12), except for R6,7 which we used as temporary
+ * registers above. Restore them, and set R0 to the ucall number (UV_RETURN).
+ */
+ret_to_ultra:
+	lwz	r6, VCPU_CR(r4)
+	mtcr	r6
+	mfspr	r11, SPRN_SRR1
+	LOAD_REG_IMMEDIATE(r0, UV_RETURN)
+	ld	r7, VCPU_GPR(R7)(r4)
+	ld	r6, VCPU_GPR(R6)(r4)
+	ld	r4, VCPU_GPR(R4)(r4)
+	sc	2
 
 /*
  * Enter the guest on a P9 or later system where we have exactly
@@ -3318,13 +3340,16 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
  *   r0 is used as a scratch register
  */
 kvmppc_msr_interrupt:
+	andis.	r0, r11, MSR_S@h
 	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
-	cmpwi	r0, 2 /* Check if we are in transactional state..  */
+	cmpwi	cr1, r0, 2 /* Check if we are in transactional state..  */
 	ld	r11, VCPU_INTR_MSR(r9)
-	bne	1f
+	bne	cr1, 1f
 	/* ... if transactional, change to suspended */
 	li	r0, 1
 1:	rldimi	r11, r0, MSR_TS_S_LG, 63 - MSR_TS_T_LG
+	beqlr
+	oris	r11, r11, MSR_S@h		/* preserve MSR_S bit setting */
 	blr
 
 /*
-- 
2.20.1

