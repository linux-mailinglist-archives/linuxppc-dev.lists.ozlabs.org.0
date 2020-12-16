Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FD2DBEF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:47:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwsJK631yzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:46:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gsu3DFVq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwsDQ2wd1zDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 21:43:33 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BGAWb66181162; Wed, 16 Dec 2020 05:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JFRCWX2MdaQuc8hcGE9w6p9wMjQ+UWDiawbL4B5b018=;
 b=gsu3DFVqziQUw3E5sg7sy7eTNezJ0gM18OsWYdqMDmZuvwR+31+wzbmjQZqE/0Y2/war
 tZpAEo9Yt0Vvj0SRMsQ/0u/gwJZpw2F2ASxHlGRup0eXCrfpkFL730dWrmNOLRnhQv5u
 WuKO3pkOeHrcFsrhJ8U7sIeYQdFlQ9umNJ6W+ru9sxEMPl18EpW/T1yDdKCfKE4j9ZgA
 xZN55D3Vea9W7lLyF1hv7nzeCAMM/b5iIGNVtCaU7hZITIaCKQrAzN6+nuvT+VpYRoqc
 RlOFyn+wLUKUEdtxRjoHF02zaXkLEmdILEANmedMDLWNEPp/qZndZ4msdGjNRjDPja0k NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fg9x0qty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:23 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BGAXhQK185281;
 Wed, 16 Dec 2020 05:43:23 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fg9x0qsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:22 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAhK0J011336;
 Wed, 16 Dec 2020 10:43:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 35cng8a66r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 10:43:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BGAhIr121365210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 10:43:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C461D11C04A;
 Wed, 16 Dec 2020 10:43:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A50D811C050;
 Wed, 16 Dec 2020 10:43:15 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.249])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 10:43:15 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v3 2/4] KVM: PPC: Rename current DAWR macros and variables
Date: Wed, 16 Dec 2020 16:12:17 +0530
Message-Id: <20201216104219.458713-3-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216104219.458713-1-ravi.bangoria@linux.ibm.com>
References: <20201216104219.458713-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_04:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=972 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012160063
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
index c2722ff36e98..5a77aac516ba 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -548,8 +548,8 @@ int main(void)
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
index e3b1839fc251..bcbad8daa974 100644
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
index 937dd5114300..8c608f4d912c 100644
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
index cd9995ee8441..75804062f2c5 100644
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
@@ -2574,8 +2574,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
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

