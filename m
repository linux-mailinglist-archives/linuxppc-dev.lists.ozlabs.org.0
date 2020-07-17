Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E06223F1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 17:06:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7ZFP0fDpzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 01:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7YfC6gGrzDrNh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:38:59 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEUqd4033321; Fri, 17 Jul 2020 10:38:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32as6ejqh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:38:52 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEUQVD024138;
 Fri, 17 Jul 2020 14:38:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 32b6jsr73p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:38:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06HEcmV846399966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:38:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECA24C05A;
 Fri, 17 Jul 2020 14:38:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC5BF4C052;
 Fri, 17 Jul 2020 14:38:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:38:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 05/15] KVM: PPC: Book3S HV: Save/restore new PMU registers
Date: Fri, 17 Jul 2020 10:38:17 -0400
Message-Id: <1594996707-3727-6-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=1 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=625 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170103
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerISA v3.1 has added new performance monitoring unit (PMU)
special purpose registers (SPRs). They are

Monitor Mode Control Register 3 (MMCR3)
Sampled Instruction Event Register A (SIER2)
Sampled Instruction Event Register B (SIER3)

Patch addes support to save/restore these new
SPRs while entering/exiting guest. Also includes
changes to support KVM_REG_PPC_MMCR3/SIER2/SIER3.
And adds new SPRs to KVM API documentation.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 Documentation/virt/kvm/api.rst            |  3 +++
 arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
 arch/powerpc/include/asm/kvm_host.h       |  4 ++--
 arch/powerpc/include/uapi/asm/kvm.h       |  5 +++++
 arch/powerpc/kernel/asm-offsets.c         |  3 +++
 arch/powerpc/kvm/book3s_hv.c              | 22 ++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_interrupts.S   |  8 ++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 24 ++++++++++++++++++++++++
 tools/arch/powerpc/include/uapi/asm/kvm.h |  5 +++++
 9 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 426f945..8cb6eb7 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2156,9 +2156,12 @@ registers, find a list below:
   PPC     KVM_REG_PPC_MMCRA               64
   PPC     KVM_REG_PPC_MMCR2               64
   PPC     KVM_REG_PPC_MMCRS               64
+  PPC     KVM_REG_PPC_MMCR3               64
   PPC     KVM_REG_PPC_SIAR                64
   PPC     KVM_REG_PPC_SDAR                64
   PPC     KVM_REG_PPC_SIER                64
+  PPC     KVM_REG_PPC_SIER2               64
+  PPC     KVM_REG_PPC_SIER3               64
   PPC     KVM_REG_PPC_PMC1                32
   PPC     KVM_REG_PPC_PMC2                32
   PPC     KVM_REG_PPC_PMC3                32
diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index 45704f2..078f464 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -119,7 +119,7 @@ struct kvmppc_host_state {
 	void __iomem *xive_tima_virt;
 	u32 saved_xirr;
 	u64 dabr;
-	u64 host_mmcr[7];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER */
+	u64 host_mmcr[10];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER, MMCR3, SIER2/3 */
 	u32 host_pmc[8];
 	u64 host_purr;
 	u64 host_spurr;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index fc115e2..4f26623 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -637,14 +637,14 @@ struct kvm_vcpu_arch {
 	u32 ccr1;
 	u32 dbsr;
 
-	u64 mmcr[3];
+	u64 mmcr[4];
 	u64 mmcra;
 	u64 mmcrs;
 	u32 pmc[8];
 	u32 spmc[2];
 	u64 siar;
 	u64 sdar;
-	u64 sier;
+	u64 sier[3];
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	u64 tfhar;
 	u64 texasr;
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index e55d847..1cc779d 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -640,6 +640,11 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_ONLINE	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0xbf)
 #define KVM_REG_PPC_PTCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc0)
 
+/* POWER10 registers */
+#define KVM_REG_PPC_MMCR3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
+#define KVM_REG_PPC_SIER2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
+#define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
  */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 6fa4853..8711c21 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -698,6 +698,9 @@ int main(void)
 	HSTATE_FIELD(HSTATE_SDAR, host_mmcr[4]);
 	HSTATE_FIELD(HSTATE_MMCR2, host_mmcr[5]);
 	HSTATE_FIELD(HSTATE_SIER, host_mmcr[6]);
+	HSTATE_FIELD(HSTATE_MMCR3, host_mmcr[7]);
+	HSTATE_FIELD(HSTATE_SIER2, host_mmcr[8]);
+	HSTATE_FIELD(HSTATE_SIER3, host_mmcr[9]);
 	HSTATE_FIELD(HSTATE_PMC1, host_pmc[0]);
 	HSTATE_FIELD(HSTATE_PMC2, host_pmc[1]);
 	HSTATE_FIELD(HSTATE_PMC3, host_pmc[2]);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3f90eee..d650d31 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1689,6 +1689,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_MMCRS:
 		*val = get_reg_val(id, vcpu->arch.mmcrs);
 		break;
+	case KVM_REG_PPC_MMCR3:
+		*val = get_reg_val(id, vcpu->arch.mmcr[3]);
+		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
 		*val = get_reg_val(id, vcpu->arch.pmc[i]);
@@ -1704,7 +1707,13 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.sdar);
 		break;
 	case KVM_REG_PPC_SIER:
-		*val = get_reg_val(id, vcpu->arch.sier);
+		*val = get_reg_val(id, vcpu->arch.sier[0]);
+		break;
+	case KVM_REG_PPC_SIER2:
+		*val = get_reg_val(id, vcpu->arch.sier[1]);
+		break;
+	case KVM_REG_PPC_SIER3:
+		*val = get_reg_val(id, vcpu->arch.sier[2]);
 		break;
 	case KVM_REG_PPC_IAMR:
 		*val = get_reg_val(id, vcpu->arch.iamr);
@@ -1916,6 +1925,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_MMCRS:
 		vcpu->arch.mmcrs = set_reg_val(id, *val);
 		break;
+	case KVM_REG_PPC_MMCR3:
+		*val = get_reg_val(id, vcpu->arch.mmcr[3]);
+		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
 		vcpu->arch.pmc[i] = set_reg_val(id, *val);
@@ -1931,7 +1943,13 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.sdar = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_SIER:
-		vcpu->arch.sier = set_reg_val(id, *val);
+		vcpu->arch.sier[0] = set_reg_val(id, *val);
+		break;
+	case KVM_REG_PPC_SIER2:
+		vcpu->arch.sier[1] = set_reg_val(id, *val);
+		break;
+	case KVM_REG_PPC_SIER3:
+		vcpu->arch.sier[2] = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_IAMR:
 		vcpu->arch.iamr = set_reg_val(id, *val);
diff --git a/arch/powerpc/kvm/book3s_hv_interrupts.S b/arch/powerpc/kvm/book3s_hv_interrupts.S
index 63fd81f..59822cb 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupts.S
+++ b/arch/powerpc/kvm/book3s_hv_interrupts.S
@@ -140,6 +140,14 @@ BEGIN_FTR_SECTION
 	std	r8, HSTATE_MMCR2(r13)
 	std	r9, HSTATE_SIER(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	mfspr	r5, SPRN_MMCR3
+	mfspr	r6, SPRN_SIER2
+	mfspr	r7, SPRN_SIER3
+	std	r5, HSTATE_MMCR3(r13)
+	std	r6, HSTATE_SIER2(r13)
+	std	r7, HSTATE_SIER3(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	mfspr	r3, SPRN_PMC1
 	mfspr	r5, SPRN_PMC2
 	mfspr	r6, SPRN_PMC3
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 702eaa2..799d6d0 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -3436,6 +3436,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
 	mtspr	SPRN_SIAR, r7
 	mtspr	SPRN_SDAR, r8
 BEGIN_FTR_SECTION
+	ld      r5, VCPU_MMCR + 24(r4)
+	ld      r6, VCPU_SIER + 8(r4)
+	ld      r7, VCPU_SIER + 16(r4)
+	mtspr   SPRN_MMCR3, r5
+	mtspr   SPRN_SIER2, r6
+	mtspr   SPRN_SIER3, r7
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
+BEGIN_FTR_SECTION
 	ld	r5, VCPU_MMCR + 16(r4)
 	ld	r6, VCPU_SIER(r4)
 	mtspr	SPRN_MMCR2, r5
@@ -3496,6 +3504,14 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MMCR2, r8
 	mtspr	SPRN_SIER, r9
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	ld      r5, HSTATE_MMCR3(r13)
+	ld      r6, HSTATE_SIER2(r13)
+	ld      r7, HSTATE_SIER3(r13)
+	mtspr   SPRN_MMCR3, r5
+	mtspr   SPRN_SIER2, r6
+	mtspr   SPRN_SIER3, r7
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	mtspr	SPRN_MMCR0, r3
 	isync
 	mtlr	r0
@@ -3555,6 +3571,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	std	r10, VCPU_MMCR + 16(r9)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	mfspr   r5, SPRN_MMCR3
+	mfspr   r6, SPRN_SIER2
+	mfspr   r7, SPRN_SIER3
+	std     r5, VCPU_MMCR + 24(r9)
+	std     r6, VCPU_SIER + 8(r9)
+	std     r7, VCPU_SIER + 16(r9)
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	std	r7, VCPU_SIAR(r9)
 	std	r8, VCPU_SDAR(r9)
 	mfspr	r3, SPRN_PMC1
diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
index e55d847..1cc779d 100644
--- a/tools/arch/powerpc/include/uapi/asm/kvm.h
+++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
@@ -640,6 +640,11 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_ONLINE	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0xbf)
 #define KVM_REG_PPC_PTCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc0)
 
+/* POWER10 registers */
+#define KVM_REG_PPC_MMCR3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
+#define KVM_REG_PPC_SIER2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
+#define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
  */
-- 
1.8.3.1

