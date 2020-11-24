Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D52AC2C2385
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 12:03:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgLj14grQzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 22:03:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mDco5F5w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgLf80FrVzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 22:00:31 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOAYs38089830; Tue, 24 Nov 2020 06:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dp+Dm2v3MWsC92DWNxSIQBihQu51aEEGwTEfMlSNYz8=;
 b=mDco5F5wU+ZD/AX2s3zd4v/jjmQQ1TPd1onomEc2JCyPFysx6/f1EPqFqIiil5YxTOAv
 wU7WeiHbg3bcND6kAOFNXtorMziThid3A483hYwi+rNIf+fh6H9YtO7Yfgb7BbTyKT9S
 9oc6KE3yrTJkPrwTUD1kWP6GEV/UgqCJWguJ4vDJvh8Iksu5PTsM4RijJNua7gnpDrHI
 hERmd/lPTDQuO6xBfvvQo6TPR7uNyqZvqHFUlAA+dWjzCfWrZ1JeFdDTya1ewMS+deID
 aICt6uI4EBjO5YfCi5dk5usi0b7wt2pdMssoSBAMp786Lfd8YKNom5JsE9wGx0Ddgj3H hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fe119w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 06:00:23 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AOAhsS9119503;
 Tue, 24 Nov 2020 06:00:23 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fe119sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 06:00:23 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOAsDSC019584;
 Tue, 24 Nov 2020 11:00:20 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 34xt5h9t6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 11:00:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOB0I3j48955888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 11:00:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 086964204B;
 Tue, 24 Nov 2020 11:00:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 370BC42052;
 Tue, 24 Nov 2020 11:00:15 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.32.189])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 11:00:14 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v2 2/4] KVM: PPC: Rename current DAWR macros and variables
Date: Tue, 24 Nov 2020 16:29:51 +0530
Message-Id: <20201124105953.39325-3-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124105953.39325-1-ravi.bangoria@linux.ibm.com>
References: <20201124105953.39325-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=997
 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1011 adultscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240064
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 kvm@vger.kernel.org, leobras.c@gmail.com, jniethe5@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Power10 is introducing second DAWR. Use real register names (with
suffix 0) from ISA for current macros and variables used by kvm.
One exception is KVM_REG_PPC_DAWR. Keep it as it is because it's
uapi so changing it will break userspace.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h     |  4 ++--
 arch/powerpc/kernel/asm-offsets.c       |  4 ++--
 arch/powerpc/kvm/book3s_hv.c            | 24 ++++++++++++------------
 arch/powerpc/kvm/book3s_hv_nested.c     |  8 ++++----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 20 ++++++++++----------
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index d67a470e95a3..62cadf1a596e 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -584,8 +584,8 @@ struct kvm_vcpu_arch {
 	u32 ctrl;
 	u32 dabrx;
 	ulong dabr;
-	ulong dawr;
-	ulong dawrx;
+	ulong dawr0;
+	ulong dawrx0;
 	ulong ciabr;
 	ulong cfar;
 	ulong ppr;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8711c2164b45..e4256f5b4602 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -547,8 +547,8 @@ int main(void)
 	OFFSET(VCPU_CTRL, kvm_vcpu, arch.ctrl);
 	OFFSET(VCPU_DABR, kvm_vcpu, arch.dabr);
 	OFFSET(VCPU_DABRX, kvm_vcpu, arch.dabrx);
-	OFFSET(VCPU_DAWR, kvm_vcpu, arch.dawr);
-	OFFSET(VCPU_DAWRX, kvm_vcpu, arch.dawrx);
+	OFFSET(VCPU_DAWR0, kvm_vcpu, arch.dawr0);
+	OFFSET(VCPU_DAWRX0, kvm_vcpu, arch.dawrx0);
 	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
 	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
 	OFFSET(VCPU_DEC, kvm_vcpu, arch.dec);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 490a0f6a7285..d5c6efc8a76e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -782,8 +782,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_UNSUPPORTED_FLAG_START;
 		if (value2 & DABRX_HYP)
 			return H_P4;
-		vcpu->arch.dawr  = value1;
-		vcpu->arch.dawrx = value2;
+		vcpu->arch.dawr0  = value1;
+		vcpu->arch.dawrx0 = value2;
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
 		/* KVM does not support mflags=2 (AIL=2) */
@@ -1747,10 +1747,10 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.vcore->vtb);
 		break;
 	case KVM_REG_PPC_DAWR:
-		*val = get_reg_val(id, vcpu->arch.dawr);
+		*val = get_reg_val(id, vcpu->arch.dawr0);
 		break;
 	case KVM_REG_PPC_DAWRX:
-		*val = get_reg_val(id, vcpu->arch.dawrx);
+		*val = get_reg_val(id, vcpu->arch.dawrx0);
 		break;
 	case KVM_REG_PPC_CIABR:
 		*val = get_reg_val(id, vcpu->arch.ciabr);
@@ -1979,10 +1979,10 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.vcore->vtb = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_DAWR:
-		vcpu->arch.dawr = set_reg_val(id, *val);
+		vcpu->arch.dawr0 = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_DAWRX:
-		vcpu->arch.dawrx = set_reg_val(id, *val) & ~DAWRX_HYP;
+		vcpu->arch.dawrx0 = set_reg_val(id, *val) & ~DAWRX_HYP;
 		break;
 	case KVM_REG_PPC_CIABR:
 		vcpu->arch.ciabr = set_reg_val(id, *val);
@@ -3437,8 +3437,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	int trap;
 	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
 	unsigned long host_ciabr = mfspr(SPRN_CIABR);
-	unsigned long host_dawr = mfspr(SPRN_DAWR0);
-	unsigned long host_dawrx = mfspr(SPRN_DAWRX0);
+	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
+	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
 	unsigned long host_psscr = mfspr(SPRN_PSSCR);
 	unsigned long host_pidr = mfspr(SPRN_PID);
 
@@ -3477,8 +3477,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_SPURR, vcpu->arch.spurr);
 
 	if (dawr_enabled()) {
-		mtspr(SPRN_DAWR0, vcpu->arch.dawr);
-		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx);
+		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
+		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
 	}
 	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 	mtspr(SPRN_IC, vcpu->arch.ic);
@@ -3530,8 +3530,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
 	mtspr(SPRN_HFSCR, host_hfscr);
 	mtspr(SPRN_CIABR, host_ciabr);
-	mtspr(SPRN_DAWR0, host_dawr);
-	mtspr(SPRN_DAWRX0, host_dawrx);
+	mtspr(SPRN_DAWR0, host_dawr0);
+	mtspr(SPRN_DAWRX0, host_dawrx0);
 	mtspr(SPRN_PID, host_pidr);
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 2b433c3bacea..1d4b335485d0 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -33,8 +33,8 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	hr->dpdes = vc->dpdes;
 	hr->hfscr = vcpu->arch.hfscr;
 	hr->tb_offset = vc->tb_offset;
-	hr->dawr0 = vcpu->arch.dawr;
-	hr->dawrx0 = vcpu->arch.dawrx;
+	hr->dawr0 = vcpu->arch.dawr0;
+	hr->dawrx0 = vcpu->arch.dawrx0;
 	hr->ciabr = vcpu->arch.ciabr;
 	hr->purr = vcpu->arch.purr;
 	hr->spurr = vcpu->arch.spurr;
@@ -151,8 +151,8 @@ static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	vc->pcr = hr->pcr | PCR_MASK;
 	vc->dpdes = hr->dpdes;
 	vcpu->arch.hfscr = hr->hfscr;
-	vcpu->arch.dawr = hr->dawr0;
-	vcpu->arch.dawrx = hr->dawrx0;
+	vcpu->arch.dawr0 = hr->dawr0;
+	vcpu->arch.dawrx0 = hr->dawrx0;
 	vcpu->arch.ciabr = hr->ciabr;
 	vcpu->arch.purr = hr->purr;
 	vcpu->arch.spurr = hr->spurr;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 799d6d0f4ead..8e3fb393a980 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -52,8 +52,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define STACK_SLOT_PID		(SFS-32)
 #define STACK_SLOT_IAMR		(SFS-40)
 #define STACK_SLOT_CIABR	(SFS-48)
-#define STACK_SLOT_DAWR		(SFS-56)
-#define STACK_SLOT_DAWRX	(SFS-64)
+#define STACK_SLOT_DAWR0	(SFS-56)
+#define STACK_SLOT_DAWRX0	(SFS-64)
 #define STACK_SLOT_HFSCR	(SFS-72)
 #define STACK_SLOT_AMR		(SFS-80)
 #define STACK_SLOT_UAMOR	(SFS-88)
@@ -711,8 +711,8 @@ BEGIN_FTR_SECTION
 	mfspr	r7, SPRN_DAWRX0
 	mfspr	r8, SPRN_IAMR
 	std	r5, STACK_SLOT_CIABR(r1)
-	std	r6, STACK_SLOT_DAWR(r1)
-	std	r7, STACK_SLOT_DAWRX(r1)
+	std	r6, STACK_SLOT_DAWR0(r1)
+	std	r7, STACK_SLOT_DAWRX0(r1)
 	std	r8, STACK_SLOT_IAMR(r1)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 
@@ -801,8 +801,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	lbz	r5, 0(r5)
 	cmpdi	r5, 0
 	beq	1f
-	ld	r5, VCPU_DAWR(r4)
-	ld	r6, VCPU_DAWRX(r4)
+	ld	r5, VCPU_DAWR0(r4)
+	ld	r6, VCPU_DAWRX0(r4)
 	mtspr	SPRN_DAWR0, r5
 	mtspr	SPRN_DAWRX0, r6
 1:
@@ -1759,8 +1759,8 @@ END_FTR_SECTION(CPU_FTR_TM | CPU_FTR_P9_TM_HV_ASSIST, 0)
 	/* Restore host values of some registers */
 BEGIN_FTR_SECTION
 	ld	r5, STACK_SLOT_CIABR(r1)
-	ld	r6, STACK_SLOT_DAWR(r1)
-	ld	r7, STACK_SLOT_DAWRX(r1)
+	ld	r6, STACK_SLOT_DAWR0(r1)
+	ld	r7, STACK_SLOT_DAWRX0(r1)
 	mtspr	SPRN_CIABR, r5
 	/*
 	 * If the DAWR doesn't work, it's ok to write these here as
@@ -2566,8 +2566,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
 	rlwimi	r5, r4, 2, DAWRX_WT
 	clrrdi	r4, r4, 3
-	std	r4, VCPU_DAWR(r3)
-	std	r5, VCPU_DAWRX(r3)
+	std	r4, VCPU_DAWR0(r3)
+	std	r5, VCPU_DAWRX0(r3)
 	/*
 	 * If came in through the real mode hcall handler then it is necessary
 	 * to write the registers since the return path won't. Otherwise it is
-- 
2.26.2

