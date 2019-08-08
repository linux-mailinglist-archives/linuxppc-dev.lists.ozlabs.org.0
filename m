Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B7858F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 06:22:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463wF63CxtzDq99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 14:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463vvT4zJFzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 14:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 463vvS2j2Mz8tV4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 14:06:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 463vvR6ylgz9sDB; Thu,  8 Aug 2019 14:06:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 463vvP03HYz9sN1;
 Thu,  8 Aug 2019 14:06:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7842JOp022266; Thu, 8 Aug 2019 00:06:38 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u8bte16hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Aug 2019 00:06:38 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7845Gb2023723;
 Thu, 8 Aug 2019 04:06:37 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 2u51w64adh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Aug 2019 04:06:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7846aDq39387440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Aug 2019 04:06:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F35EEC6057;
 Thu,  8 Aug 2019 04:06:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1738EC6055;
 Thu,  8 Aug 2019 04:06:32 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.85.135.60])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Aug 2019 04:06:31 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5 7/7] powerpc/kvm: Use UV_RETURN ucall to return to
 ultravisor
Date: Thu,  8 Aug 2019 01:05:55 -0300
Message-Id: <20190808040555.2371-8-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808040555.2371-1-cclaudio@linux.ibm.com>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-08_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908080042
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
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

When an SVM makes an hypercall or incurs some other exception, the
Ultravisor usually forwards (a.k.a. reflects) the exceptions to the
Hypervisor. After processing the exception, Hypervisor uses the
UV_RETURN ultracall to return control back to the SVM.

The expected register state on entry to this ultracall is:

* Non-volatile registers are restored to their original values.
* If returning from an hypercall, register R0 contains the return value
  (unlike other ultracalls) and, registers R4 through R12 contain any
  output values of the hypercall.
* R3 contains the ultracall number, i.e UV_RETURN.
* If returning with a synthesized interrupt, R2 contains the
  synthesized interrupt number.

Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h       |  1 +
 arch/powerpc/include/asm/ultravisor-api.h |  1 +
 arch/powerpc/kernel/asm-offsets.c         |  1 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 39 +++++++++++++++++++----
 4 files changed, 36 insertions(+), 6 deletions(-)

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
index 8cd49abff4f3..6a0f9c74f959 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -24,5 +24,6 @@
 
 /* opcodes */
 #define UV_WRITE_PATE			0xF104
+#define UV_RETURN			0xF11C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 524a7bba0ee5..aadc6176824b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -510,6 +510,7 @@ int main(void)
 	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
 	OFFSET(KVM_RADIX, kvm, arch.radix);
 	OFFSET(KVM_FWNMI, kvm, arch.fwnmi_enabled);
+	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
 	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
 	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
 	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index bc18366cd1ba..0a5b2a8236c7 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -36,6 +36,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 #include <asm/cpuidle.h>
+#include <asm/ultravisor-api.h>
 
 /* Sign-extend HDEC if not on POWER9 */
 #define EXTEND_HDEC(reg)			\
@@ -1090,16 +1091,10 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	ld	r5, VCPU_LR(r4)
-	ld	r6, VCPU_CR(r4)
 	mtlr	r5
-	mtcr	r6
 
 	ld	r1, VCPU_GPR(R1)(r4)
-	ld	r2, VCPU_GPR(R2)(r4)
-	ld	r3, VCPU_GPR(R3)(r4)
 	ld	r5, VCPU_GPR(R5)(r4)
-	ld	r6, VCPU_GPR(R6)(r4)
-	ld	r7, VCPU_GPR(R7)(r4)
 	ld	r8, VCPU_GPR(R8)(r4)
 	ld	r9, VCPU_GPR(R9)(r4)
 	ld	r10, VCPU_GPR(R10)(r4)
@@ -1117,10 +1112,42 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_HDSISR, r0
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 
+	ld	r6, VCPU_KVM(r4)
+	lbz	r7, KVM_SECURE_GUEST(r6)
+	cmpdi	r7, 0
+	ld	r6, VCPU_GPR(R6)(r4)
+	ld	r7, VCPU_GPR(R7)(r4)
+	bne	ret_to_ultra
+
+	lwz	r0, VCPU_CR(r4)
+	mtcr	r0
+
 	ld	r0, VCPU_GPR(R0)(r4)
+	ld	r2, VCPU_GPR(R2)(r4)
+	ld	r3, VCPU_GPR(R3)(r4)
 	ld	r4, VCPU_GPR(R4)(r4)
 	HRFI_TO_GUEST
 	b	.
+/*
+ * Use UV_RETURN ultracall to return control back to the Ultravisor after
+ * processing an hypercall or interrupt that was forwarded (a.k.a. reflected)
+ * to the Hypervisor.
+ *
+ * All registers have already been loaded, except:
+ *   R0 = hcall result
+ *   R2 = SRR1, so UV can detect a synthesized interrupt (if any)
+ *   R3 = UV_RETURN
+ */
+ret_to_ultra:
+	lwz	r0, VCPU_CR(r4)
+	mtcr	r0
+
+	ld	r0, VCPU_GPR(R3)(r4)
+	mfspr	r2, SPRN_SRR1
+	li	r3, 0
+	ori	r3, r3, UV_RETURN
+	ld	r4, VCPU_GPR(R4)(r4)
+	sc	2
 
 /*
  * Enter the guest on a P9 or later system where we have exactly
-- 
2.20.1

