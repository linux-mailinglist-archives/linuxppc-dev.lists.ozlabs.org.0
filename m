Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE3223EB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 16:54:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7Yzd72szzDqL2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 00:54:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Yf154lyzDrNh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:38:49 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEUqUF033336; Fri, 17 Jul 2020 10:38:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32as6ejqct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:38:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEVOYA008659;
 Fri, 17 Jul 2020 14:38:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgxkfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:38:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HEcdow50528488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:38:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E614A4C050;
 Fri, 17 Jul 2020 14:38:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4654C046;
 Fri, 17 Jul 2020 14:38:35 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:38:35 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
Date: Fri, 17 Jul 2020 10:38:14 -0400
Message-Id: <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
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
 mlxlogscore=608 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently `kvm_vcpu_arch` stores all Monitor Mode Control registers
in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, mmcrs
Split this to give mmcra and mmcrs its own entries in vcpu and
use a flat array for mmcr0 to mmcr2. This patch implements this
cleanup to make code easier to read.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h       |  4 +++-
 arch/powerpc/include/uapi/asm/kvm.h       |  4 ++--
 arch/powerpc/kernel/asm-offsets.c         |  2 ++
 arch/powerpc/kvm/book3s_hv.c              | 16 ++++++++++++++--
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 12 ++++++------
 tools/arch/powerpc/include/uapi/asm/kvm.h |  4 ++--
 6 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 7e2d061..fc115e2 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -637,7 +637,9 @@ struct kvm_vcpu_arch {
 	u32 ccr1;
 	u32 dbsr;
 
-	u64 mmcr[5];
+	u64 mmcr[3];
+	u64 mmcra;
+	u64 mmcrs;
 	u32 pmc[8];
 	u32 spmc[2];
 	u64 siar;
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index 264e266..e55d847 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
 
 #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
 #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
-#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
-#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
+#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
+#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
 #define KVM_REG_PPC_MMCRS	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x14)
 #define KVM_REG_PPC_SIAR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x15)
 #define KVM_REG_PPC_SDAR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x16)
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 6657dc6..6fa4853 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -559,6 +559,8 @@ int main(void)
 	OFFSET(VCPU_IRQ_PENDING, kvm_vcpu, arch.irq_pending);
 	OFFSET(VCPU_DBELL_REQ, kvm_vcpu, arch.doorbell_request);
 	OFFSET(VCPU_MMCR, kvm_vcpu, arch.mmcr);
+	OFFSET(VCPU_MMCRA, kvm_vcpu, arch.mmcra);
+	OFFSET(VCPU_MMCRS, kvm_vcpu, arch.mmcrs);
 	OFFSET(VCPU_PMC, kvm_vcpu, arch.pmc);
 	OFFSET(VCPU_SPMC, kvm_vcpu, arch.spmc);
 	OFFSET(VCPU_SIAR, kvm_vcpu, arch.siar);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6bf66649..3f90eee 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1679,10 +1679,16 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_UAMOR:
 		*val = get_reg_val(id, vcpu->arch.uamor);
 		break;
-	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCRS:
+	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
 		i = id - KVM_REG_PPC_MMCR0;
 		*val = get_reg_val(id, vcpu->arch.mmcr[i]);
 		break;
+	case KVM_REG_PPC_MMCRA:
+		*val = get_reg_val(id, vcpu->arch.mmcra);
+		break;
+	case KVM_REG_PPC_MMCRS:
+		*val = get_reg_val(id, vcpu->arch.mmcrs);
+		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
 		*val = get_reg_val(id, vcpu->arch.pmc[i]);
@@ -1900,10 +1906,16 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_UAMOR:
 		vcpu->arch.uamor = set_reg_val(id, *val);
 		break;
-	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCRS:
+	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
 		i = id - KVM_REG_PPC_MMCR0;
 		vcpu->arch.mmcr[i] = set_reg_val(id, *val);
 		break;
+	case KVM_REG_PPC_MMCRA:
+		vcpu->arch.mmcra = set_reg_val(id, *val);
+		break;
+	case KVM_REG_PPC_MMCRS:
+		vcpu->arch.mmcrs = set_reg_val(id, *val);
+		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
 		vcpu->arch.pmc[i] = set_reg_val(id, *val);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 7194389..702eaa2 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -3428,7 +3428,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
 	mtspr	SPRN_PMC6, r9
 	ld	r3, VCPU_MMCR(r4)
 	ld	r5, VCPU_MMCR + 8(r4)
-	ld	r6, VCPU_MMCR + 16(r4)
+	ld	r6, VCPU_MMCRA(r4)
 	ld	r7, VCPU_SIAR(r4)
 	ld	r8, VCPU_SDAR(r4)
 	mtspr	SPRN_MMCR1, r5
@@ -3436,14 +3436,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
 	mtspr	SPRN_SIAR, r7
 	mtspr	SPRN_SDAR, r8
 BEGIN_FTR_SECTION
-	ld	r5, VCPU_MMCR + 24(r4)
+	ld	r5, VCPU_MMCR + 16(r4)
 	ld	r6, VCPU_SIER(r4)
 	mtspr	SPRN_MMCR2, r5
 	mtspr	SPRN_SIER, r6
 BEGIN_FTR_SECTION_NESTED(96)
 	lwz	r7, VCPU_PMC + 24(r4)
 	lwz	r8, VCPU_PMC + 28(r4)
-	ld	r9, VCPU_MMCR + 32(r4)
+	ld	r9, VCPU_MMCRS(r4)
 	mtspr	SPRN_SPMC1, r7
 	mtspr	SPRN_SPMC2, r8
 	mtspr	SPRN_MMCRS, r9
@@ -3551,9 +3551,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mfspr	r8, SPRN_SDAR
 	std	r4, VCPU_MMCR(r9)
 	std	r5, VCPU_MMCR + 8(r9)
-	std	r6, VCPU_MMCR + 16(r9)
+	std	r6, VCPU_MMCRA(r9)
 BEGIN_FTR_SECTION
-	std	r10, VCPU_MMCR + 24(r9)
+	std	r10, VCPU_MMCR + 16(r9)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	std	r7, VCPU_SIAR(r9)
 	std	r8, VCPU_SDAR(r9)
@@ -3578,7 +3578,7 @@ BEGIN_FTR_SECTION_NESTED(96)
 	mfspr	r8, SPRN_MMCRS
 	stw	r6, VCPU_PMC + 24(r9)
 	stw	r7, VCPU_PMC + 28(r9)
-	std	r8, VCPU_MMCR + 32(r9)
+	std	r8, VCPU_MMCRS(r9)
 	lis	r4, 0x8000
 	mtspr	SPRN_MMCRS, r4
 END_FTR_SECTION_NESTED(CPU_FTR_ARCH_300, 0, 96)
diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
index 264e266..e55d847 100644
--- a/tools/arch/powerpc/include/uapi/asm/kvm.h
+++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
@@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
 
 #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
 #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
-#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
-#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
+#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
+#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
 #define KVM_REG_PPC_MMCRS	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x14)
 #define KVM_REG_PPC_SIAR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x15)
 #define KVM_REG_PPC_SDAR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x16)
-- 
1.8.3.1

