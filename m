Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247E2DBEE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:45:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwsGL50FhzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:45:14 +1100 (AEDT)
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
 header.s=pp1 header.b=fAX3QT4E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwsDQ1XbBzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 21:43:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BGAW6F4188881; Wed, 16 Dec 2020 05:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SP/BY12MiHFWQBLtPm+M6Exivcanq4WI/0Lfarr4tWA=;
 b=fAX3QT4EAcrZt8gCkMQQ8wyQPhAsnF82W5vUsOu9UOn2dO9LhLOa96NlOIOkLlfTEEZp
 UTIJRhGnZRx28PZ2uTUbBtxYg0Jv46qCa+D3PMhq2Ekk0A83XG4T87ychGDZ53qDrNBv
 UNaRf1iasnGsJTXK4ue9KRMv0f57lE3cFIkMDvgWDKFhGI+zXW4V04uwDFfbi+CJTsWR
 rC7Ur541vBL/ddOZjvHPCgavmLMwXuQfP6pLwd5EU3AglRtO7pzLwYSw34Hc5gqHFvQC
 ulB5u+yenRX9Ez2LwQSfn4qTLczNCuoziPvzFe7RS0w8CCX++/qADjuHMeXgYNLuWuNQ ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fdn5dfgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:26 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BGAX9fK192418;
 Wed, 16 Dec 2020 05:43:26 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fdn5dfg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:26 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAhOsi012207;
 Wed, 16 Dec 2020 10:43:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 35cng8a66u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 10:43:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BGAhM1s30081392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 10:43:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3226911C050;
 Wed, 16 Dec 2020 10:43:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F28911C04A;
 Wed, 16 Dec 2020 10:43:19 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.249])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 10:43:19 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v3 3/4] KVM: PPC: Add infrastructure to support 2nd DAWR
Date: Wed, 16 Dec 2020 16:12:18 +0530
Message-Id: <20201216104219.458713-4-ravi.bangoria@linux.ibm.com>
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
 phishscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160063
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

kvm code assumes single DAWR everywhere. Add code to support 2nd DAWR.
DAWR is a hypervisor resource and thus H_SET_MODE hcall is used to set/
unset it. Introduce new case H_SET_MODE_RESOURCE_SET_DAWR1 for 2nd DAWR.
Also, kvm will support 2nd DAWR only if CPU_FTR_DAWR1 is set.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst            |  2 ++
 arch/powerpc/include/asm/hvcall.h         |  8 ++++-
 arch/powerpc/include/asm/kvm_host.h       |  3 ++
 arch/powerpc/include/uapi/asm/kvm.h       |  2 ++
 arch/powerpc/kernel/asm-offsets.c         |  2 ++
 arch/powerpc/kvm/book3s_hv.c              | 43 +++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c       |  7 ++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 23 ++++++++++++
 tools/arch/powerpc/include/uapi/asm/kvm.h |  2 ++
 9 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 36d5f1f3c6dd..abb24575bdf9 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2249,6 +2249,8 @@ registers, find a list below:
   PPC     KVM_REG_PPC_PSSCR               64
   PPC     KVM_REG_PPC_DEC_EXPIRY          64
   PPC     KVM_REG_PPC_PTCR                64
+  PPC     KVM_REG_PPC_DAWR1               64
+  PPC     KVM_REG_PPC_DAWRX1              64
   PPC     KVM_REG_PPC_TM_GPR0             64
   ...
   PPC     KVM_REG_PPC_TM_GPR31            64
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ca6840239f90..98afa58b619a 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -560,16 +560,22 @@ struct hv_guest_state {
 	u64 pidr;
 	u64 cfar;
 	u64 ppr;
+	/* Version 1 ends here */
+	u64 dawr1;
+	u64 dawrx1;
+	/* Version 2 ends here */
 };
 
 /* Latest version of hv_guest_state structure */
-#define HV_GUEST_STATE_VERSION	1
+#define HV_GUEST_STATE_VERSION	2
 
 static inline int hv_guest_state_size(unsigned int version)
 {
 	switch (version) {
 	case 1:
 		return offsetofend(struct hv_guest_state, ppr);
+	case 2:
+		return offsetofend(struct hv_guest_state, dawrx1);
 	default:
 		return -1;
 	}
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 62cadf1a596e..a93cfb672421 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -307,6 +307,7 @@ struct kvm_arch {
 	u8 svm_enabled;
 	bool threads_indep;
 	bool nested_enable;
+	bool dawr1_enabled;
 	pgd_t *pgtable;
 	u64 process_table;
 	struct dentry *debugfs_dir;
@@ -586,6 +587,8 @@ struct kvm_vcpu_arch {
 	ulong dabr;
 	ulong dawr0;
 	ulong dawrx0;
+	ulong dawr1;
+	ulong dawrx1;
 	ulong ciabr;
 	ulong cfar;
 	ulong ppr;
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index c3af3f324c5a..9f18fa090f1f 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -644,6 +644,8 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_MMCR3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
 #define KVM_REG_PPC_SIER2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
 #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+#define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
+#define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 5a77aac516ba..a35ea4e19360 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -550,6 +550,8 @@ int main(void)
 	OFFSET(VCPU_DABRX, kvm_vcpu, arch.dabrx);
 	OFFSET(VCPU_DAWR0, kvm_vcpu, arch.dawr0);
 	OFFSET(VCPU_DAWRX0, kvm_vcpu, arch.dawrx0);
+	OFFSET(VCPU_DAWR1, kvm_vcpu, arch.dawr1);
+	OFFSET(VCPU_DAWRX1, kvm_vcpu, arch.dawrx1);
 	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
 	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
 	OFFSET(VCPU_DEC, kvm_vcpu, arch.dec);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bcbad8daa974..b7a30c0692a7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -785,6 +785,22 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		vcpu->arch.dawr0  = value1;
 		vcpu->arch.dawrx0 = value2;
 		return H_SUCCESS;
+	case H_SET_MODE_RESOURCE_SET_DAWR1:
+		if (!kvmppc_power8_compatible(vcpu))
+			return H_P2;
+		if (!ppc_breakpoint_available())
+			return H_P2;
+		if (!cpu_has_feature(CPU_FTR_DAWR1))
+			return H_P2;
+		if (!vcpu->kvm->arch.dawr1_enabled)
+			return H_FUNCTION;
+		if (mflags)
+			return H_UNSUPPORTED_FLAG_START;
+		if (value2 & DABRX_HYP)
+			return H_P4;
+		vcpu->arch.dawr1  = value1;
+		vcpu->arch.dawrx1 = value2;
+		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
 		/* KVM does not support mflags=2 (AIL=2) */
 		if (mflags != 0 && mflags != 3)
@@ -1752,6 +1768,12 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_DAWRX:
 		*val = get_reg_val(id, vcpu->arch.dawrx0);
 		break;
+	case KVM_REG_PPC_DAWR1:
+		*val = get_reg_val(id, vcpu->arch.dawr1);
+		break;
+	case KVM_REG_PPC_DAWRX1:
+		*val = get_reg_val(id, vcpu->arch.dawrx1);
+		break;
 	case KVM_REG_PPC_CIABR:
 		*val = get_reg_val(id, vcpu->arch.ciabr);
 		break;
@@ -1984,6 +2006,12 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_DAWRX:
 		vcpu->arch.dawrx0 = set_reg_val(id, *val) & ~DAWRX_HYP;
 		break;
+	case KVM_REG_PPC_DAWR1:
+		vcpu->arch.dawr1 = set_reg_val(id, *val);
+		break;
+	case KVM_REG_PPC_DAWRX1:
+		vcpu->arch.dawrx1 = set_reg_val(id, *val) & ~DAWRX_HYP;
+		break;
 	case KVM_REG_PPC_CIABR:
 		vcpu->arch.ciabr = set_reg_val(id, *val);
 		/* Don't allow setting breakpoints in hypervisor code */
@@ -3441,6 +3469,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
 	unsigned long host_psscr = mfspr(SPRN_PSSCR);
 	unsigned long host_pidr = mfspr(SPRN_PID);
+	unsigned long host_dawr1 = 0;
+	unsigned long host_dawrx1 = 0;
+
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		host_dawr1 = mfspr(SPRN_DAWR1);
+		host_dawrx1 = mfspr(SPRN_DAWRX1);
+	}
 
 	/*
 	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
@@ -3479,6 +3514,10 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (dawr_enabled()) {
 		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
 		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
+			mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
+		}
 	}
 	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 	mtspr(SPRN_IC, vcpu->arch.ic);
@@ -3532,6 +3571,10 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_CIABR, host_ciabr);
 	mtspr(SPRN_DAWR0, host_dawr0);
 	mtspr(SPRN_DAWRX0, host_dawrx0);
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		mtspr(SPRN_DAWR1, host_dawr1);
+		mtspr(SPRN_DAWRX1, host_dawrx1);
+	}
 	mtspr(SPRN_PID, host_pidr);
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 8c608f4d912c..907e68d20486 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -49,6 +49,8 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	hr->pidr = vcpu->arch.pid;
 	hr->cfar = vcpu->arch.cfar;
 	hr->ppr = vcpu->arch.ppr;
+	hr->dawr1 = vcpu->arch.dawr1;
+	hr->dawrx1 = vcpu->arch.dawrx1;
 }
 
 static void byteswap_pt_regs(struct pt_regs *regs)
@@ -91,6 +93,8 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
 	hr->pidr = swab64(hr->pidr);
 	hr->cfar = swab64(hr->cfar);
 	hr->ppr = swab64(hr->ppr);
+	hr->dawr1 = swab64(hr->dawr1);
+	hr->dawrx1 = swab64(hr->dawrx1);
 }
 
 static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
@@ -138,6 +142,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 
 	/* Don't let data address watchpoint match in hypervisor state */
 	hr->dawrx0 &= ~DAWRX_HYP;
+	hr->dawrx1 &= ~DAWRX_HYP;
 
 	/* Don't let completed instruction address breakpt match in HV state */
 	if ((hr->ciabr & CIABR_PRIV) == CIABR_PRIV_HYPER)
@@ -167,6 +172,8 @@ static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	vcpu->arch.pid = hr->pidr;
 	vcpu->arch.cfar = hr->cfar;
 	vcpu->arch.ppr = hr->ppr;
+	vcpu->arch.dawr1 = hr->dawr1;
+	vcpu->arch.dawrx1 = hr->dawrx1;
 }
 
 void kvmhv_restore_hv_return_state(struct kvm_vcpu *vcpu,
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 75804062f2c5..65161c062dc5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -57,6 +57,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define STACK_SLOT_HFSCR	(SFS-72)
 #define STACK_SLOT_AMR		(SFS-80)
 #define STACK_SLOT_UAMOR	(SFS-88)
+#define STACK_SLOT_DAWR1	(SFS-96)
+#define STACK_SLOT_DAWRX1	(SFS-104)
 /* the following is used by the P9 short path */
 #define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
 
@@ -715,6 +717,12 @@ BEGIN_FTR_SECTION
 	std	r7, STACK_SLOT_DAWRX0(r1)
 	std	r8, STACK_SLOT_IAMR(r1)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	mfspr	r6, SPRN_DAWR1
+	mfspr	r7, SPRN_DAWRX1
+	std	r6, STACK_SLOT_DAWR1(r1)
+	std	r7, STACK_SLOT_DAWRX1(r1)
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S | CPU_FTR_DAWR1)
 
 	mfspr	r5, SPRN_AMR
 	std	r5, STACK_SLOT_AMR(r1)
@@ -805,6 +813,12 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	ld	r6, VCPU_DAWRX0(r4)
 	mtspr	SPRN_DAWR0, r5
 	mtspr	SPRN_DAWRX0, r6
+BEGIN_FTR_SECTION
+	ld	r5, VCPU_DAWR1(r4)
+	ld	r6, VCPU_DAWRX1(r4)
+	mtspr	SPRN_DAWR1, r5
+	mtspr	SPRN_DAWRX1, r6
+END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 1:
 	ld	r7, VCPU_CIABR(r4)
 	ld	r8, VCPU_TAR(r4)
@@ -1769,6 +1783,12 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_DAWR0, r6
 	mtspr	SPRN_DAWRX0, r7
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
+BEGIN_FTR_SECTION
+	ld	r6, STACK_SLOT_DAWR1(r1)
+	ld	r7, STACK_SLOT_DAWRX1(r1)
+	mtspr	SPRN_DAWR1, r6
+	mtspr	SPRN_DAWRX1, r7
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S | CPU_FTR_DAWR1)
 BEGIN_FTR_SECTION
 	ld	r5, STACK_SLOT_TID(r1)
 	ld	r6, STACK_SLOT_PSSCR(r1)
@@ -3343,6 +3363,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	mtspr	SPRN_IAMR, r0
 	mtspr	SPRN_CIABR, r0
 	mtspr	SPRN_DAWRX0, r0
+BEGIN_FTR_SECTION
+	mtspr	SPRN_DAWRX1, r0
+END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 
 BEGIN_MMU_FTR_SECTION
 	b	4f
diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
index c3af3f324c5a..9f18fa090f1f 100644
--- a/tools/arch/powerpc/include/uapi/asm/kvm.h
+++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
@@ -644,6 +644,8 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_MMCR3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
 #define KVM_REG_PPC_SIER2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
 #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+#define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
+#define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
-- 
2.26.2

