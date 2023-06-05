Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAA721E8F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 08:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZPS40lGQz3fF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KGee69YY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KGee69YY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZPNL057lz3dt3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 16:49:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3556dPgh028378;
	Mon, 5 Jun 2023 06:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WkS7MZWBSrb62U2O5K6fTSkq6+naoAHXZzFvLy5eIos=;
 b=KGee69YYpjKGCFzoTVO7F3GHcWCru3i4uxIdu9Xh6MVECMlGOINZ23w9QMfHrdHzBu86
 T1eTRk2cvH6L7Dm5faFp1mtumXKoCntBINCrd+qPkodFa0iVE5LzgOPP4I2/XsRWILCN
 KqKELsh6fMhom2oYfh3g2OcmXCh1guvZz+LDmrCPSMUR9IxdjlAs72HmqG1myIepWDou
 GcVBYsK6dmgGqD1Eay25h9Kb5uho8vhCZXnawlCPGPBAEwXmarHXD6u/oZXvzgvhc5CR
 TN8KtfIKkbWjdqZ9enmNC3Zda3UiJfwn8jvDvv58EhrSGuj+NjGLOtobK/MW0TtWgVqg fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1act0cev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:17 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3556e7pY029611;
	Mon, 5 Jun 2023 06:49:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1act0ce7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3555OCRP000393;
	Mon, 5 Jun 2023 06:49:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qyxku16r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3556nBeK42271042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 06:49:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A411B20043;
	Mon,  5 Jun 2023 06:49:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7E9120040;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from pwon.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 44484600E2;
	Mon,  5 Jun 2023 16:49:08 +1000 (AEST)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 2/6] KVM: PPC: Add fpr getters and setters
Date: Mon,  5 Jun 2023 16:48:44 +1000
Message-Id: <20230605064848.12319-3-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k0OGPNeyhNhySBZmrdngdafxqSAMxZCq
X-Proofpoint-ORIG-GUID: twoGNzzYtlJt-yeQoC-puxdubm6lDKeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=512 lowpriorityscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050058
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add wrappers for fpr registers to prepare for supporting PAPR nested
guests.

Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h | 31 +++++++++++++++++++++++++++
 arch/powerpc/include/asm/kvm_booke.h  | 10 +++++++++
 arch/powerpc/kvm/book3s.c             | 16 +++++++-------
 arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
 arch/powerpc/kvm/powerpc.c            | 22 +++++++++----------
 5 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 4e91f54a3f9f..a632e79639f0 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -413,6 +413,37 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault_dar;
 }
 
+static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
+{
+	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
+}
+
+static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
+{
+	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+}
+
+static inline u64 kvmppc_get_fpscr(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.fp.fpscr;
+}
+
+static inline void kvmppc_set_fpscr(struct kvm_vcpu *vcpu, u64 val)
+{
+	vcpu->arch.fp.fpscr = val;
+}
+
+
+static inline u64 kvmppc_get_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j)
+{
+	return vcpu->arch.fp.fpr[i][j];
+}
+
+static inline void kvmppc_set_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j, u64 val)
+{
+	vcpu->arch.fp.fpr[i][j] = val;
+}
+
 #define BOOK3S_WRAPPER_SET(reg, size)					\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
diff --git a/arch/powerpc/include/asm/kvm_booke.h b/arch/powerpc/include/asm/kvm_booke.h
index 0c3401b2e19e..7c3291aa8922 100644
--- a/arch/powerpc/include/asm/kvm_booke.h
+++ b/arch/powerpc/include/asm/kvm_booke.h
@@ -89,6 +89,16 @@ static inline ulong kvmppc_get_pc(struct kvm_vcpu *vcpu)
 	return vcpu->arch.regs.nip;
 }
 
+static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
+{
+	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+}
+
+static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
+{
+	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
+}
+
 #ifdef CONFIG_BOOKE
 static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2fe31b518886..6cd20ab9e94e 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -636,17 +636,17 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 		case KVM_REG_PPC_FPR0 ... KVM_REG_PPC_FPR31:
 			i = id - KVM_REG_PPC_FPR0;
-			*val = get_reg_val(id, VCPU_FPR(vcpu, i));
+			*val = get_reg_val(id, kvmppc_get_fpr(vcpu, i));
 			break;
 		case KVM_REG_PPC_FPSCR:
-			*val = get_reg_val(id, vcpu->arch.fp.fpscr);
+			*val = get_reg_val(id, kvmppc_get_fpscr(vcpu));
 			break;
 #ifdef CONFIG_VSX
 		case KVM_REG_PPC_VSR0 ... KVM_REG_PPC_VSR31:
 			if (cpu_has_feature(CPU_FTR_VSX)) {
 				i = id - KVM_REG_PPC_VSR0;
-				val->vsxval[0] = vcpu->arch.fp.fpr[i][0];
-				val->vsxval[1] = vcpu->arch.fp.fpr[i][1];
+				val->vsxval[0] = kvmppc_get_vsx_fpr(vcpu, i, 0);
+				val->vsxval[1] = kvmppc_get_vsx_fpr(vcpu, i, 1);
 			} else {
 				r = -ENXIO;
 			}
@@ -724,7 +724,7 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 		case KVM_REG_PPC_FPR0 ... KVM_REG_PPC_FPR31:
 			i = id - KVM_REG_PPC_FPR0;
-			VCPU_FPR(vcpu, i) = set_reg_val(id, *val);
+			kvmppc_set_fpr(vcpu, i, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_FPSCR:
 			vcpu->arch.fp.fpscr = set_reg_val(id, *val);
@@ -733,8 +733,8 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 		case KVM_REG_PPC_VSR0 ... KVM_REG_PPC_VSR31:
 			if (cpu_has_feature(CPU_FTR_VSX)) {
 				i = id - KVM_REG_PPC_VSR0;
-				vcpu->arch.fp.fpr[i][0] = val->vsxval[0];
-				vcpu->arch.fp.fpr[i][1] = val->vsxval[1];
+				kvmppc_set_vsx_fpr(vcpu, i, 0, val->vsxval[0]);
+				kvmppc_set_vsx_fpr(vcpu, i, 1, val->vsxval[1]);
 			} else {
 				r = -ENXIO;
 			}
@@ -765,7 +765,7 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 #endif /* CONFIG_KVM_XIVE */
 		case KVM_REG_PPC_FSCR:
-			vcpu->arch.fscr = set_reg_val(id, *val);
+			kvmppc_set_fpscr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_TAR:
 			kvmppc_set_tar(vcpu, set_reg_val(id, *val));
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 059c08ae0340..e6e66c3792f8 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -250,7 +250,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 				vcpu->arch.mmio_sp64_extend = 1;
 
 			emulated = kvmppc_handle_store(vcpu,
-					VCPU_FPR(vcpu, op.reg), size, 1);
+					kvmppc_get_fpr(vcpu, op.reg), size, 1);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
 				kvmppc_set_gpr(vcpu, op.update_reg, op.ea);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index ca9793c3d437..7f913e68342a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -938,7 +938,7 @@ static inline void kvmppc_set_vsr_dword(struct kvm_vcpu *vcpu,
 		val.vsxval[offset] = gpr;
 		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
 	} else {
-		VCPU_VSX_FPR(vcpu, index, offset) = gpr;
+		kvmppc_set_vsx_fpr(vcpu, index, offset, gpr);
 	}
 }
 
@@ -954,8 +954,8 @@ static inline void kvmppc_set_vsr_dword_dump(struct kvm_vcpu *vcpu,
 		val.vsxval[1] = gpr;
 		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
 	} else {
-		VCPU_VSX_FPR(vcpu, index, 0) = gpr;
-		VCPU_VSX_FPR(vcpu, index, 1) = gpr;
+		kvmppc_set_vsx_fpr(vcpu, index, 0, gpr);
+		kvmppc_set_vsx_fpr(vcpu, index, 1,  gpr);
 	}
 }
 
@@ -974,8 +974,8 @@ static inline void kvmppc_set_vsr_word_dump(struct kvm_vcpu *vcpu,
 	} else {
 		val.vsx32val[0] = gpr;
 		val.vsx32val[1] = gpr;
-		VCPU_VSX_FPR(vcpu, index, 0) = val.vsxval[0];
-		VCPU_VSX_FPR(vcpu, index, 1) = val.vsxval[0];
+		kvmppc_set_vsx_fpr(vcpu, index, 0, val.vsxval[0]);
+		kvmppc_set_vsx_fpr(vcpu, index, 1, val.vsxval[0]);
 	}
 }
 
@@ -997,9 +997,9 @@ static inline void kvmppc_set_vsr_word(struct kvm_vcpu *vcpu,
 	} else {
 		dword_offset = offset / 2;
 		word_offset = offset % 2;
-		val.vsxval[0] = VCPU_VSX_FPR(vcpu, index, dword_offset);
+		val.vsxval[0] = kvmppc_get_vsx_fpr(vcpu, index, dword_offset);
 		val.vsx32val[word_offset] = gpr32;
-		VCPU_VSX_FPR(vcpu, index, dword_offset) = val.vsxval[0];
+		kvmppc_set_vsx_fpr(vcpu, index, dword_offset, val.vsxval[0]);
 	}
 }
 #endif /* CONFIG_VSX */
@@ -1194,14 +1194,14 @@ static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
 		if (vcpu->kvm->arch.kvm_ops->giveup_ext)
 			vcpu->kvm->arch.kvm_ops->giveup_ext(vcpu, MSR_FP);
 
-		VCPU_FPR(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK) = gpr;
+		kvmppc_set_fpr(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK, gpr);
 		break;
 #ifdef CONFIG_PPC_BOOK3S
 	case KVM_MMIO_REG_QPR:
 		vcpu->arch.qpr[vcpu->arch.io_gpr & KVM_MMIO_REG_MASK] = gpr;
 		break;
 	case KVM_MMIO_REG_FQPR:
-		VCPU_FPR(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK) = gpr;
+		kvmppc_set_fpr(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK, gpr);
 		vcpu->arch.qpr[vcpu->arch.io_gpr & KVM_MMIO_REG_MASK] = gpr;
 		break;
 #endif
@@ -1419,7 +1419,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 		}
 
 		if (rs < 32) {
-			*val = VCPU_VSX_FPR(vcpu, rs, vsx_offset);
+			*val = kvmppc_get_vsx_fpr(vcpu, rs, vsx_offset);
 		} else {
 			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
 			*val = reg.vsxval[vsx_offset];
@@ -1438,7 +1438,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 		if (rs < 32) {
 			dword_offset = vsx_offset / 2;
 			word_offset = vsx_offset % 2;
-			reg.vsxval[0] = VCPU_VSX_FPR(vcpu, rs, dword_offset);
+			reg.vsxval[0] = kvmppc_get_vsx_fpr(vcpu, rs, dword_offset);
 			*val = reg.vsx32val[word_offset];
 		} else {
 			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
-- 
2.31.1

