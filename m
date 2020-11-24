Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C52C2393
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 12:05:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgLlg16Z3zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 22:05:17 +1100 (AEDT)
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
 header.s=pp1 header.b=L6dtgd9g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgLfB44HPzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 22:00:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOAYmLP089092; Tue, 24 Nov 2020 06:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CqZqMxZNtgQe0J4P7sf0JuhLg7vpIIvkMM7t2EOC+o0=;
 b=L6dtgd9g+aWLRzrfZ0KSWBdoWNBeawC/NpyP+U4sHAYK0clSXyF/bckfVr9EsjfrcHvJ
 kTHC0rDVqq8wcZb+r3uG15qKLzVAO2QCLRUt391W1IUfcO+HHSaOaWKqYd3WR7bkhPlM
 uCSxmw2LtSe01vh89jFik/Yrzg5j9eVsJyuEhTs+51CLzKu6TIGgd6HH1eNIWJpI4wwZ
 yMqzItnCILPgkOn/5G3rpOKwjYGvlGH3LqJG3QeDXKl/Z2rBWuMq/FTVv7+FMss2z2UF
 9arTZTWlJtMc/YcTlv8vkNAP8BElYpKwxBkjXwPOeTboAgt1Q/BrHAKRtPM58IMjJEqF 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fe11a08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 06:00:27 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AOAYtVR089966;
 Tue, 24 Nov 2020 06:00:27 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fe119xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 06:00:26 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOArnTU026097;
 Tue, 24 Nov 2020 11:00:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 34xth89t8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 11:00:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOB0LXL10814028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 11:00:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D1642063;
 Tue, 24 Nov 2020 11:00:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6156842067;
 Tue, 24 Nov 2020 11:00:18 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.32.189])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 11:00:18 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v2 3/4] KVM: PPC: Add infrastructure to support 2nd DAWR
Date: Tue, 24 Nov 2020 16:29:52 +0530
Message-Id: <20201124105953.39325-4-ravi.bangoria@linux.ibm.com>
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
 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
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

kvm code assumes single DAWR everywhere. Add code to support 2nd DAWR.
DAWR is a hypervisor resource and thus H_SET_MODE hcall is used to set/
unset it. Introduce new case H_SET_MODE_RESOURCE_SET_DAWR1 for 2nd DAWR.
Also, kvm will support 2nd DAWR only if CPU_FTR_DAWR1 is set.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst            |  2 ++
 arch/powerpc/include/asm/hvcall.h         |  8 ++++-
 arch/powerpc/include/asm/kvm_host.h       |  2 ++
 arch/powerpc/include/uapi/asm/kvm.h       |  2 ++
 arch/powerpc/kernel/asm-offsets.c         |  2 ++
 arch/powerpc/kvm/book3s_hv.c              | 41 +++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c       |  7 ++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 23 +++++++++++++
 tools/arch/powerpc/include/uapi/asm/kvm.h |  2 ++
 9 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index eb3a1316f03e..72c98735aa52 100644
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
index a7073fddb657..4bacd27a348b 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -558,16 +558,22 @@ struct hv_guest_state {
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
index 62cadf1a596e..9804afdf8578 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -586,6 +586,8 @@ struct kvm_vcpu_arch {
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
index e4256f5b4602..26d4fa8fe51e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -549,6 +549,8 @@ int main(void)
 	OFFSET(VCPU_DABRX, kvm_vcpu, arch.dabrx);
 	OFFSET(VCPU_DAWR0, kvm_vcpu, arch.dawr0);
 	OFFSET(VCPU_DAWRX0, kvm_vcpu, arch.dawrx0);
+	OFFSET(VCPU_DAWR1, kvm_vcpu, arch.dawr1);
+	OFFSET(VCPU_DAWRX1, kvm_vcpu, arch.dawrx1);
 	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
 	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
 	OFFSET(VCPU_DEC, kvm_vcpu, arch.dec);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d5c6efc8a76e..2ff645789e9e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -785,6 +785,20 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
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
@@ -1752,6 +1766,12 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
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
@@ -1984,6 +2004,12 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
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
@@ -3441,6 +3467,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3479,6 +3512,10 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3532,6 +3569,10 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
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
index 1d4b335485d0..aec86013f7de 100644
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
index 8e3fb393a980..fe31c5338fdf 100644
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
@@ -3335,6 +3355,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
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

