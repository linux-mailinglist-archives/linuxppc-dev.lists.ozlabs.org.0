Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E42108B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 11:54:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xc4r3L2kzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 19:54:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbM51xwbzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06190vKE005813; Wed, 1 Jul 2020 05:21:12 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320k1pguhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:12 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619F5c7027087;
 Wed, 1 Jul 2020 09:21:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 31wwr826y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0619Jm3U31916326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:19:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71D9E4C046;
 Wed,  1 Jul 2020 09:21:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E3E74C05A;
 Wed,  1 Jul 2020 09:21:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:07 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 02/10] KVM: PPC: Book3S HV: Save/restore new PMU registers
Date: Wed,  1 Jul 2020 05:20:54 -0400
Message-Id: <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=1
 cotscore=-2147483648 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=805 mlxscore=0 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010063
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerISA v3.1 has added new performance monitoring unit (PMU)
special purpose registers (SPRs). They are

Monitor Mode Control Register 3 (MMCR3)
Sampled Instruction Event Register A (SIER2)
Sampled Instruction Event Register B (SIER3)

Patch addes support to save/restore these new
SPRs while entering/exiting guest.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
 arch/powerpc/include/asm/kvm_host.h       |  4 ++--
 arch/powerpc/kernel/asm-offsets.c         |  3 +++
 arch/powerpc/kvm/book3s_hv.c              |  6 ++++--
 arch/powerpc/kvm/book3s_hv_interrupts.S   |  8 ++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 24 ++++++++++++++++++++++++
 6 files changed, 42 insertions(+), 5 deletions(-)

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
index 7e2d061..d718061 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -637,12 +637,12 @@ struct kvm_vcpu_arch {
 	u32 ccr1;
 	u32 dbsr;
 
-	u64 mmcr[5];
+	u64 mmcr[6];
 	u32 pmc[8];
 	u32 spmc[2];
 	u64 siar;
 	u64 sdar;
-	u64 sier;
+	u64 sier[3];
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	u64 tfhar;
 	u64 texasr;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 6657dc6..20a8b1e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -696,6 +696,9 @@ int main(void)
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
index 6bf66649..c265800 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1698,7 +1698,8 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.sdar);
 		break;
 	case KVM_REG_PPC_SIER:
-		*val = get_reg_val(id, vcpu->arch.sier);
+		i = id - KVM_REG_PPC_SIER;
+		*val = get_reg_val(id, vcpu->arch.sier[i]);
 		break;
 	case KVM_REG_PPC_IAMR:
 		*val = get_reg_val(id, vcpu->arch.iamr);
@@ -1919,7 +1920,8 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.sdar = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_SIER:
-		vcpu->arch.sier = set_reg_val(id, *val);
+		i = id - KVM_REG_PPC_SIER;
+		vcpu->arch.sier[i] = set_reg_val(id, *val);
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
index 7194389..57b6c14 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -3436,6 +3436,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
 	mtspr	SPRN_SIAR, r7
 	mtspr	SPRN_SDAR, r8
 BEGIN_FTR_SECTION
+	ld	r5, VCPU_MMCR + 40(r4)
+	ld	r6, VCPU_SIER + 8(r4)
+	ld	r7, VCPU_SIER + 16(r4)
+	mtspr	SPRN_MMCR3, r5
+	mtspr	SPRN_SIER2, r6
+	mtspr	SPRN_SIER3, r7
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
+BEGIN_FTR_SECTION
 	ld	r5, VCPU_MMCR + 24(r4)
 	ld	r6, VCPU_SIER(r4)
 	mtspr	SPRN_MMCR2, r5
@@ -3496,6 +3504,14 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MMCR2, r8
 	mtspr	SPRN_SIER, r9
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	ld	r5, HSTATE_MMCR3(r13)
+	ld	r6, HSTATE_SIER2(r13)
+	ld	r7, HSTATE_SIER3(r13)
+	mtspr	SPRN_MMCR3, r5
+	mtspr	SPRN_SIER2, r6
+	mtspr	SPRN_SIER3, r7
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	mtspr	SPRN_MMCR0, r3
 	isync
 	mtlr	r0
@@ -3555,6 +3571,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	std	r10, VCPU_MMCR + 24(r9)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	mfspr	r5, SPRN_MMCR3
+	mfspr	r6, SPRN_SIER2
+	mfspr	r7, SPRN_SIER3
+	std	r5, VCPU_MMCR + 40(r9)
+	std	r6, VCPU_SIER + 8(r9)
+	std	r7, VCPU_SIER + 16(r9)
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	std	r7, VCPU_SIAR(r9)
 	std	r8, VCPU_SDAR(r9)
 	mfspr	r3, SPRN_PMC1
-- 
1.8.3.1

