Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB8721E90
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 08:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZPT11Rx8z3f8F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJa+RBB1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJa+RBB1;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZPNK74xKz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 16:49:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3556AjtK020575;
	Mon, 5 Jun 2023 06:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HJqJaZSt0uSQY/GNzieQewyE0k1EYWnbC7Xe3l0cyh0=;
 b=qJa+RBB1/ViNmn72hsMbmMKaaiBaTJdZNn2L/TXYa3fjeZvQetA4jCA/kc5B/yaqnmw2
 hyfW7uMmKaVEnfkUVJn0rU6mwuZ7aaWAINq15vvRPi26WwmLJNnE37aVSvOotGKLO3jr
 noVURfydGDXsBQgxhjNLPz+F7kss8C+njmTiylA/zBJWI9XMqtGJ6Y2S8z3K60Wra5d7
 xgQDmzbF4XzXUhiAg/JEVEpwy5OLyrF3bAr497LBaLyuQDW7rO7OBt0UrJoxYwjGXDW8
 oKnPCA8d2EBnYdS/M3zt+mjsuLuvld4w5Zbp+05QLdGfMxKFLMPqhHL77rhlonfFQGY5 Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r18ndtr6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:17 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3556gmTN004430;
	Mon, 5 Jun 2023 06:49:17 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r18ndtr5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3555BO2K022677;
	Mon, 5 Jun 2023 06:49:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qyx5q8xh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3556nCqX19726898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 06:49:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E0A020043;
	Mon,  5 Jun 2023 06:49:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8E4920040;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from pwon.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 393AD6040B;
	Mon,  5 Jun 2023 16:49:08 +1000 (AEST)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 1/6] KVM: PPC: Use getters and setters for vcpu register state
Date: Mon,  5 Jun 2023 16:48:43 +1000
Message-Id: <20230605064848.12319-2-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bZrOHYgONJWkPeqCPn5AuZ2wTPZ5-7Er
X-Proofpoint-GUID: p0UriL7VGTCgvSe1H9cbptfLOHSr-ITK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=928 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

There are already some getter and setter functions used for accessing
vcpu register state, e.g. kvmppc_get_pc(). There are also more
complicated examples that are generated by macros like
kvmppc_get_sprg0() which are generated by the SHARED_SPRNG_WRAPPER()
macro.

In the new PAPR API for nested guest partitions the L1 is required to
communicate with the L0 to modify and read nested guest state.

Prepare to support this by replacing direct accesses to vcpu register
state with wrapper functions. Follow the existing pattern of using
macros to generate individual wrappers. These wrappers will
be augmented for supporting PAPR nested guests later.

Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h  |  68 +++++++-
 arch/powerpc/include/asm/kvm_ppc.h     |  48 ++++--
 arch/powerpc/kvm/book3s.c              |  22 +--
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |   4 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |   9 +-
 arch/powerpc/kvm/book3s_64_vio.c       |   4 +-
 arch/powerpc/kvm/book3s_hv.c           | 222 +++++++++++++------------
 arch/powerpc/kvm/book3s_hv.h           |  59 +++++++
 arch/powerpc/kvm/book3s_hv_builtin.c   |  10 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c  |   4 +-
 arch/powerpc/kvm/book3s_hv_ras.c       |   5 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c    |   8 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c   |   4 +-
 arch/powerpc/kvm/book3s_xive.c         |   9 +-
 arch/powerpc/kvm/powerpc.c             |   4 +-
 15 files changed, 322 insertions(+), 158 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index bbf5e2c5fe09..4e91f54a3f9f 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -392,6 +392,16 @@ static inline ulong kvmppc_get_pc(struct kvm_vcpu *vcpu)
 	return vcpu->arch.regs.nip;
 }
 
+static inline void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 val)
+{
+	vcpu->arch.pid = val;
+}
+
+static inline u32 kvmppc_get_pid(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.pid;
+}
+
 static inline u64 kvmppc_get_msr(struct kvm_vcpu *vcpu);
 static inline bool kvmppc_need_byteswap(struct kvm_vcpu *vcpu)
 {
@@ -403,10 +413,66 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault_dar;
 }
 
+#define BOOK3S_WRAPPER_SET(reg, size)					\
+static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+									\
+	vcpu->arch.reg = val;						\
+}
+
+#define BOOK3S_WRAPPER_GET(reg, size)					\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	return vcpu->arch.reg;						\
+}
+
+#define BOOK3S_WRAPPER(reg, size)					\
+	BOOK3S_WRAPPER_SET(reg, size)					\
+	BOOK3S_WRAPPER_GET(reg, size)					\
+
+BOOK3S_WRAPPER(tar, 64)
+BOOK3S_WRAPPER(ebbhr, 64)
+BOOK3S_WRAPPER(ebbrr, 64)
+BOOK3S_WRAPPER(bescr, 64)
+BOOK3S_WRAPPER(ic, 64)
+BOOK3S_WRAPPER(vrsave, 64)
+
+
+#define VCORE_WRAPPER_SET(reg, size)					\
+static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+	vcpu->arch.vcore->reg = val;					\
+}
+
+#define VCORE_WRAPPER_GET(reg, size)					\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
+{									\
+	return vcpu->arch.vcore->reg;					\
+}
+
+#define VCORE_WRAPPER(reg, size)					\
+	VCORE_WRAPPER_SET(reg, size)					\
+	VCORE_WRAPPER_GET(reg, size)					\
+
+
+VCORE_WRAPPER(vtb, 64)
+VCORE_WRAPPER(tb_offset, 64)
+VCORE_WRAPPER(lpcr, 64)
+
+static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.dec_expires;
+}
+
+static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val)
+{
+	vcpu->arch.dec_expires = val;
+}
+
 /* Expiry time of vcpu DEC relative to host TB */
 static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
+	return kvmppc_get_dec_expires(vcpu) - kvmppc_get_tb_offset_hv(vcpu);
 }
 
 static inline bool is_kvmppc_resume_guest(int r)
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 79a9c0bb8bba..fbac353ac46b 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -936,7 +936,7 @@ static inline ulong kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 #define SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
 {									\
-	mtspr(bookehv_spr, val);						\
+	mtspr(bookehv_spr, val);					\
 }									\
 
 #define SHARED_WRAPPER_GET(reg, size)					\
@@ -957,10 +957,32 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
 }									\
 
+#define SHARED_CACHE_WRAPPER_GET(reg, size)				\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	if (kvmppc_shared_big_endian(vcpu))				\
+	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
+	else								\
+	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
+}									\
+
+#define SHARED_CACHE_WRAPPER_SET(reg, size)				\
+static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+	if (kvmppc_shared_big_endian(vcpu))				\
+	       vcpu->arch.shared->reg = cpu_to_be##size(val);		\
+	else								\
+	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
+}									\
+
 #define SHARED_WRAPPER(reg, size)					\
 	SHARED_WRAPPER_GET(reg, size)					\
 	SHARED_WRAPPER_SET(reg, size)					\
 
+#define SHARED_CACHE_WRAPPER(reg, size)					\
+	SHARED_CACHE_WRAPPER_GET(reg, size)				\
+	SHARED_CACHE_WRAPPER_SET(reg, size)				\
+
 #define SPRNG_WRAPPER(reg, bookehv_spr)					\
 	SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
 	SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
@@ -970,23 +992,29 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 #define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
 	SPRNG_WRAPPER(reg, bookehv_spr)					\
 
+#define SHARED_SPRNG_CACHE_WRAPPER(reg, size, bookehv_spr)		\
+	SPRNG_WRAPPER(reg, bookehv_spr)					\
+
 #else
 
 #define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
 	SHARED_WRAPPER(reg, size)					\
 
+#define SHARED_SPRNG_CACHE_WRAPPER(reg, size, bookehv_spr)		\
+	SHARED_CACHE_WRAPPER(reg, size)					\
+
 #endif
 
 SHARED_WRAPPER(critical, 64)
-SHARED_SPRNG_WRAPPER(sprg0, 64, SPRN_GSPRG0)
-SHARED_SPRNG_WRAPPER(sprg1, 64, SPRN_GSPRG1)
-SHARED_SPRNG_WRAPPER(sprg2, 64, SPRN_GSPRG2)
-SHARED_SPRNG_WRAPPER(sprg3, 64, SPRN_GSPRG3)
-SHARED_SPRNG_WRAPPER(srr0, 64, SPRN_GSRR0)
-SHARED_SPRNG_WRAPPER(srr1, 64, SPRN_GSRR1)
-SHARED_SPRNG_WRAPPER(dar, 64, SPRN_GDEAR)
+SHARED_SPRNG_CACHE_WRAPPER(sprg0, 64, SPRN_GSPRG0)
+SHARED_SPRNG_CACHE_WRAPPER(sprg1, 64, SPRN_GSPRG1)
+SHARED_SPRNG_CACHE_WRAPPER(sprg2, 64, SPRN_GSPRG2)
+SHARED_SPRNG_CACHE_WRAPPER(sprg3, 64, SPRN_GSPRG3)
+SHARED_SPRNG_CACHE_WRAPPER(srr0, 64, SPRN_GSRR0)
+SHARED_SPRNG_CACHE_WRAPPER(srr1, 64, SPRN_GSRR1)
+SHARED_SPRNG_CACHE_WRAPPER(dar, 64, SPRN_GDEAR)
 SHARED_SPRNG_WRAPPER(esr, 64, SPRN_GESR)
-SHARED_WRAPPER_GET(msr, 64)
+SHARED_CACHE_WRAPPER_GET(msr, 64)
 static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 {
 	if (kvmppc_shared_big_endian(vcpu))
@@ -994,7 +1022,7 @@ static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 	else
 	       vcpu->arch.shared->msr = cpu_to_le64(val);
 }
-SHARED_WRAPPER(dsisr, 32)
+SHARED_CACHE_WRAPPER(dsisr, 32)
 SHARED_WRAPPER(int_pending, 32)
 SHARED_WRAPPER(sprg4, 64)
 SHARED_WRAPPER(sprg5, 64)
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 686d8d9eda3e..2fe31b518886 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -565,7 +565,7 @@ int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	regs->msr = kvmppc_get_msr(vcpu);
 	regs->srr0 = kvmppc_get_srr0(vcpu);
 	regs->srr1 = kvmppc_get_srr1(vcpu);
-	regs->pid = vcpu->arch.pid;
+	regs->pid = kvmppc_get_pid(vcpu);
 	regs->sprg0 = kvmppc_get_sprg0(vcpu);
 	regs->sprg1 = kvmppc_get_sprg1(vcpu);
 	regs->sprg2 = kvmppc_get_sprg2(vcpu);
@@ -683,19 +683,19 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			*val = get_reg_val(id, vcpu->arch.fscr);
 			break;
 		case KVM_REG_PPC_TAR:
-			*val = get_reg_val(id, vcpu->arch.tar);
+			*val = get_reg_val(id, kvmppc_get_tar(vcpu));
 			break;
 		case KVM_REG_PPC_EBBHR:
-			*val = get_reg_val(id, vcpu->arch.ebbhr);
+			*val = get_reg_val(id, kvmppc_get_ebbhr(vcpu));
 			break;
 		case KVM_REG_PPC_EBBRR:
-			*val = get_reg_val(id, vcpu->arch.ebbrr);
+			*val = get_reg_val(id, kvmppc_get_ebbrr(vcpu));
 			break;
 		case KVM_REG_PPC_BESCR:
-			*val = get_reg_val(id, vcpu->arch.bescr);
+			*val = get_reg_val(id, kvmppc_get_bescr(vcpu));
 			break;
 		case KVM_REG_PPC_IC:
-			*val = get_reg_val(id, vcpu->arch.ic);
+			*val = get_reg_val(id, kvmppc_get_ic(vcpu));
 			break;
 		default:
 			r = -EINVAL;
@@ -768,19 +768,19 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			vcpu->arch.fscr = set_reg_val(id, *val);
 			break;
 		case KVM_REG_PPC_TAR:
-			vcpu->arch.tar = set_reg_val(id, *val);
+			kvmppc_set_tar(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_EBBHR:
-			vcpu->arch.ebbhr = set_reg_val(id, *val);
+			kvmppc_set_ebbhr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_EBBRR:
-			vcpu->arch.ebbrr = set_reg_val(id, *val);
+			kvmppc_set_ebbrr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_BESCR:
-			vcpu->arch.bescr = set_reg_val(id, *val);
+			kvmppc_set_bescr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_IC:
-			vcpu->arch.ic = set_reg_val(id, *val);
+			kvmppc_set_ic(vcpu, set_reg_val(id, *val));
 			break;
 		default:
 			r = -EINVAL;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7f765d5ad436..738f2ecbe9b9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -347,7 +347,7 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	unsigned long v, orig_v, gr;
 	__be64 *hptep;
 	long int index;
-	int virtmode = vcpu->arch.shregs.msr & (data ? MSR_DR : MSR_IR);
+	int virtmode = kvmppc_get_msr(vcpu) & (data ? MSR_DR : MSR_IR);
 
 	if (kvm_is_radix(vcpu->kvm))
 		return kvmppc_mmu_radix_xlate(vcpu, eaddr, gpte, data, iswrite);
@@ -385,7 +385,7 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 
 	/* Get PP bits and key for permission check */
 	pp = gr & (HPTE_R_PP0 | HPTE_R_PP);
-	key = (vcpu->arch.shregs.msr & MSR_PR) ? SLB_VSID_KP : SLB_VSID_KS;
+	key = (kvmppc_get_msr(vcpu) & MSR_PR) ? SLB_VSID_KP : SLB_VSID_KS;
 	key &= slb_v;
 
 	/* Calculate permissions */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..e1aa078580a1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -15,6 +15,7 @@
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
+#include "book3s_hv.h"
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/pgalloc.h>
@@ -96,7 +97,7 @@ static long kvmhv_copy_tofrom_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr,
 					  void *to, void *from, unsigned long n)
 {
 	int lpid = vcpu->kvm->arch.lpid;
-	int pid = vcpu->arch.pid;
+	int pid = kvmppc_get_pid(vcpu);
 
 	/* This would cause a data segment intr so don't allow the access */
 	if (eaddr & (0x3FFUL << 52))
@@ -270,7 +271,7 @@ int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	/* Work out effective PID */
 	switch (eaddr >> 62) {
 	case 0:
-		pid = vcpu->arch.pid;
+		pid = kvmppc_get_pid(vcpu);
 		break;
 	case 3:
 		pid = 0;
@@ -294,9 +295,9 @@ int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	} else {
 		if (!(pte & _PAGE_PRIVILEGED)) {
 			/* Check AMR/IAMR to see if strict mode is in force */
-			if (vcpu->arch.amr & (1ul << 62))
+			if (kvmppc_get_amr_hv(vcpu) & (1ul << 62))
 				gpte->may_read = 0;
-			if (vcpu->arch.amr & (1ul << 63))
+			if (kvmppc_get_amr_hv(vcpu) & (1ul << 63))
 				gpte->may_write = 0;
 			if (vcpu->arch.iamr & (1ul << 62))
 				gpte->may_execute = 0;
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 93b695b289e9..4ba048f272f2 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -786,12 +786,12 @@ long kvmppc_h_get_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 	idx = (ioba >> stt->page_shift) - stt->offset;
 	page = stt->pages[idx / TCES_PER_PAGE];
 	if (!page) {
-		vcpu->arch.regs.gpr[4] = 0;
+		kvmppc_set_gpr(vcpu, 4, 0);
 		return H_SUCCESS;
 	}
 	tbl = (u64 *)page_address(page);
 
-	vcpu->arch.regs.gpr[4] = tbl[idx % TCES_PER_PAGE];
+	kvmppc_set_gpr(vcpu, 4, tbl[idx % TCES_PER_PAGE]);
 
 	return H_SUCCESS;
 }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..521d84621422 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -383,11 +383,6 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
 	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
 }
 
-static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
-{
-	vcpu->arch.pvr = pvr;
-}
-
 /* Dummy value used in computing PCR value below */
 #define PCR_ARCH_31    (PCR_ARCH_300 << 1)
 
@@ -794,7 +789,7 @@ static void kvmppc_update_vpa_dispatch(struct kvm_vcpu *vcpu,
 
 	vpa->enqueue_dispatch_tb = cpu_to_be64(be64_to_cpu(vpa->enqueue_dispatch_tb) + stolen);
 
-	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now + vc->tb_offset, stolen);
+	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now + kvmppc_get_tb_offset_hv(vcpu), stolen);
 
 	vcpu->arch.vpa.dirty = true;
 }
@@ -868,7 +863,7 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		/* Guests can't breakpoint the hypervisor */
 		if ((value1 & CIABR_PRIV) == CIABR_PRIV_HYPER)
 			return H_P3;
-		vcpu->arch.ciabr  = value1;
+		kvmppc_set_ciabr_hv(vcpu, value1);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_SET_DAWR0:
 		if (!kvmppc_power8_compatible(vcpu))
@@ -879,8 +874,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_UNSUPPORTED_FLAG_START;
 		if (value2 & DABRX_HYP)
 			return H_P4;
-		vcpu->arch.dawr0  = value1;
-		vcpu->arch.dawrx0 = value2;
+		kvmppc_set_dawr0_hv(vcpu, value1);
+		kvmppc_set_dawrx0_hv(vcpu, value2);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_SET_DAWR1:
 		if (!kvmppc_power8_compatible(vcpu))
@@ -895,8 +890,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_UNSUPPORTED_FLAG_START;
 		if (value2 & DABRX_HYP)
 			return H_P4;
-		vcpu->arch.dawr1  = value1;
-		vcpu->arch.dawrx1 = value2;
+		kvmppc_set_dawr1_hv(vcpu, value1);
+		kvmppc_set_dawrx1_hv(vcpu, value2);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
 		/*
@@ -1268,8 +1263,11 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		break;
 #endif
 	case H_RANDOM:
-		if (!arch_get_random_seed_longs(&vcpu->arch.regs.gpr[4], 1))
+		unsigned long rand;
+
+		if (!arch_get_random_seed_longs(&rand, 1))
 			ret = H_HARDWARE;
+		kvmppc_set_gpr(vcpu, 4, rand);
 		break;
 	case H_RPT_INVALIDATE:
 		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
@@ -1370,7 +1368,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
  */
 static void kvmppc_cede(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.shregs.msr |= MSR_EE;
+	kvmppc_set_msr_fast(vcpu, kvmppc_get_msr(vcpu) | MSR_EE);
 	vcpu->arch.ceded = 1;
 	smp_mb();
 	if (vcpu->arch.prodded) {
@@ -1544,7 +1542,7 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_PM))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_PM;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_PM);
 
 	return RESUME_GUEST;
 }
@@ -1554,7 +1552,7 @@ static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_EBB))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_EBB;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_EBB);
 
 	return RESUME_GUEST;
 }
@@ -1564,7 +1562,7 @@ static int kvmppc_tm_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_TM))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_TM;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_TM);
 
 	return RESUME_GUEST;
 }
@@ -1585,7 +1583,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * That can happen due to a bug, or due to a machine check
 	 * occurring at just the wrong time.
 	 */
-	if (vcpu->arch.shregs.msr & MSR_HV) {
+	if (kvmppc_get_msr(vcpu) & MSR_HV) {
 		printk(KERN_EMERG "KVM trap in HV mode!\n");
 		printk(KERN_EMERG "trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			vcpu->arch.trap, kvmppc_get_pc(vcpu),
@@ -1636,7 +1634,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * so that it knows that the machine check occurred.
 		 */
 		if (!vcpu->kvm->arch.fwnmi_enabled) {
-			ulong flags = (vcpu->arch.shregs.msr & 0x083c0000) |
+			ulong flags = (kvmppc_get_msr(vcpu) & 0x083c0000) |
 					(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 			kvmppc_core_queue_machine_check(vcpu, flags);
 			r = RESUME_GUEST;
@@ -1666,7 +1664,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		 * as a result of a hypervisor emulation interrupt
 		 * (e40) getting turned into a 700 by BML RTAS.
 		 */
-		flags = (vcpu->arch.shregs.msr & 0x1f0000ull) |
+		flags = (kvmppc_get_msr(vcpu) & 0x1f0000ull) |
 			(kvmppc_get_msr(vcpu) & SRR1_PREFIXED);
 		kvmppc_core_queue_program(vcpu, flags);
 		r = RESUME_GUEST;
@@ -1676,7 +1674,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	{
 		int i;
 
-		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
+		if (unlikely(kvmppc_get_msr(vcpu) & MSR_PR)) {
 			/*
 			 * Guest userspace executed sc 1. This can only be
 			 * reached by the P9 path because the old path
@@ -1754,7 +1752,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			break;
 		}
 
-		if (!(vcpu->arch.shregs.msr & MSR_DR))
+		if (!(kvmppc_get_msr(vcpu) & MSR_DR))
 			vsid = vcpu->kvm->arch.vrma_slb_v;
 		else
 			vsid = vcpu->arch.fault_gpa;
@@ -1778,7 +1776,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		long err;
 
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
-		vcpu->arch.fault_dsisr = vcpu->arch.shregs.msr &
+		vcpu->arch.fault_dsisr = kvmppc_get_msr(vcpu) &
 			DSISR_SRR1_MATCH_64S;
 		if (kvm_is_radix(vcpu->kvm) || !cpu_has_feature(CPU_FTR_ARCH_300)) {
 			/*
@@ -1787,7 +1785,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			 * hash fault handling below is v3 only (it uses ASDR
 			 * via fault_gpa).
 			 */
-			if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
+			if (kvmppc_get_msr(vcpu) & HSRR1_HISI_WRITE)
 				vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
 			r = RESUME_PAGE_FAULT;
 			break;
@@ -1801,7 +1799,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			break;
 		}
 
-		if (!(vcpu->arch.shregs.msr & MSR_IR))
+		if (!(kvmppc_get_msr(vcpu) & MSR_IR))
 			vsid = vcpu->kvm->arch.vrma_slb_v;
 		else
 			vsid = vcpu->arch.fault_gpa;
@@ -1863,7 +1861,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * Otherwise, we just generate a program interrupt to the guest.
 	 */
 	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
-		u64 cause = vcpu->arch.hfscr >> 56;
+		u64 cause = kvmppc_get_hfscr_hv(vcpu) >> 56;
 
 		r = EMULATE_FAIL;
 		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
@@ -1891,7 +1889,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		kvmppc_dump_regs(vcpu);
 		printk(KERN_EMERG "trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			vcpu->arch.trap, kvmppc_get_pc(vcpu),
-			vcpu->arch.shregs.msr);
+			kvmppc_get_msr(vcpu));
 		run->hw.hardware_exit_reason = vcpu->arch.trap;
 		r = RESUME_HOST;
 		break;
@@ -1915,11 +1913,11 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 	 * That can happen due to a bug, or due to a machine check
 	 * occurring at just the wrong time.
 	 */
-	if (vcpu->arch.shregs.msr & MSR_HV) {
+	if (kvmppc_get_msr(vcpu) & MSR_HV) {
 		pr_emerg("KVM trap in HV mode while nested!\n");
 		pr_emerg("trap=0x%x | pc=0x%lx | msr=0x%llx\n",
 			 vcpu->arch.trap, kvmppc_get_pc(vcpu),
-			 vcpu->arch.shregs.msr);
+			 kvmppc_get_msr(vcpu));
 		kvmppc_dump_regs(vcpu);
 		return RESUME_HOST;
 	}
@@ -1976,7 +1974,7 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
 		vcpu->arch.fault_dsisr = kvmppc_get_msr(vcpu) &
 					 DSISR_SRR1_MATCH_64S;
-		if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
+		if (kvmppc_get_msr(vcpu) & HSRR1_HISI_WRITE)
 			vcpu->arch.fault_dsisr |= DSISR_ISSTORE;
 		srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		r = kvmhv_nested_page_fault(vcpu);
@@ -2182,7 +2180,7 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 		}
 	}
 
-	vc->lpcr = new_lpcr;
+	kvmppc_set_lpcr_hv(vcpu, new_lpcr);
 
 	spin_unlock(&vc->lock);
 }
@@ -2207,64 +2205,64 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.dabrx);
 		break;
 	case KVM_REG_PPC_DSCR:
-		*val = get_reg_val(id, vcpu->arch.dscr);
+		*val = get_reg_val(id, kvmppc_get_dscr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_PURR:
-		*val = get_reg_val(id, vcpu->arch.purr);
+		*val = get_reg_val(id, kvmppc_get_purr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SPURR:
-		*val = get_reg_val(id, vcpu->arch.spurr);
+		*val = get_reg_val(id, kvmppc_get_spurr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_AMR:
-		*val = get_reg_val(id, vcpu->arch.amr);
+		*val = get_reg_val(id, kvmppc_get_amr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_UAMOR:
-		*val = get_reg_val(id, vcpu->arch.uamor);
+		*val = get_reg_val(id, kvmppc_get_uamor_hv(vcpu));
 		break;
 	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
 		i = id - KVM_REG_PPC_MMCR0;
-		*val = get_reg_val(id, vcpu->arch.mmcr[i]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, i));
 		break;
 	case KVM_REG_PPC_MMCR2:
-		*val = get_reg_val(id, vcpu->arch.mmcr[2]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, 2));
 		break;
 	case KVM_REG_PPC_MMCRA:
-		*val = get_reg_val(id, vcpu->arch.mmcra);
+		*val = get_reg_val(id, kvmppc_get_mmcra_hv(vcpu));
 		break;
 	case KVM_REG_PPC_MMCRS:
 		*val = get_reg_val(id, vcpu->arch.mmcrs);
 		break;
 	case KVM_REG_PPC_MMCR3:
-		*val = get_reg_val(id, vcpu->arch.mmcr[3]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, 3));
 		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
-		*val = get_reg_val(id, vcpu->arch.pmc[i]);
+		*val = get_reg_val(id, kvmppc_get_pmc_hv(vcpu, i));
 		break;
 	case KVM_REG_PPC_SPMC1 ... KVM_REG_PPC_SPMC2:
 		i = id - KVM_REG_PPC_SPMC1;
 		*val = get_reg_val(id, vcpu->arch.spmc[i]);
 		break;
 	case KVM_REG_PPC_SIAR:
-		*val = get_reg_val(id, vcpu->arch.siar);
+		*val = get_reg_val(id, kvmppc_get_siar_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SDAR:
-		*val = get_reg_val(id, vcpu->arch.sdar);
+		*val = get_reg_val(id, kvmppc_get_siar_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SIER:
-		*val = get_reg_val(id, vcpu->arch.sier[0]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 0));
 		break;
 	case KVM_REG_PPC_SIER2:
-		*val = get_reg_val(id, vcpu->arch.sier[1]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 1));
 		break;
 	case KVM_REG_PPC_SIER3:
-		*val = get_reg_val(id, vcpu->arch.sier[2]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 2));
 		break;
 	case KVM_REG_PPC_IAMR:
-		*val = get_reg_val(id, vcpu->arch.iamr);
+		*val = get_reg_val(id, kvmppc_get_iamr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_PSPB:
-		*val = get_reg_val(id, vcpu->arch.pspb);
+		*val = get_reg_val(id, kvmppc_get_pspb_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DPDES:
 		/*
@@ -2279,22 +2277,22 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 			*val = get_reg_val(id, vcpu->arch.vcore->dpdes);
 		break;
 	case KVM_REG_PPC_VTB:
-		*val = get_reg_val(id, vcpu->arch.vcore->vtb);
+		*val = get_reg_val(id, kvmppc_get_vtb_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWR:
-		*val = get_reg_val(id, vcpu->arch.dawr0);
+		*val = get_reg_val(id, kvmppc_get_dawr0_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWRX:
-		*val = get_reg_val(id, vcpu->arch.dawrx0);
+		*val = get_reg_val(id, kvmppc_get_dawrx0_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWR1:
-		*val = get_reg_val(id, vcpu->arch.dawr1);
+		*val = get_reg_val(id, kvmppc_get_dawr1_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWRX1:
-		*val = get_reg_val(id, vcpu->arch.dawrx1);
+		*val = get_reg_val(id, kvmppc_get_dawrx1_hv(vcpu));
 		break;
 	case KVM_REG_PPC_CIABR:
-		*val = get_reg_val(id, vcpu->arch.ciabr);
+		*val = get_reg_val(id, kvmppc_get_ciabr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_CSIGR:
 		*val = get_reg_val(id, vcpu->arch.csigr);
@@ -2306,13 +2304,13 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.tcscr);
 		break;
 	case KVM_REG_PPC_PID:
-		*val = get_reg_val(id, vcpu->arch.pid);
+		*val = get_reg_val(id, kvmppc_get_pid(vcpu));
 		break;
 	case KVM_REG_PPC_ACOP:
 		*val = get_reg_val(id, vcpu->arch.acop);
 		break;
 	case KVM_REG_PPC_WORT:
-		*val = get_reg_val(id, vcpu->arch.wort);
+		*val = get_reg_val(id, kvmppc_get_wort_hv(vcpu));
 		break;
 	case KVM_REG_PPC_TIDR:
 		*val = get_reg_val(id, vcpu->arch.tid);
@@ -2338,14 +2336,14 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		spin_unlock(&vcpu->arch.vpa_update_lock);
 		break;
 	case KVM_REG_PPC_TB_OFFSET:
-		*val = get_reg_val(id, vcpu->arch.vcore->tb_offset);
+		*val = get_reg_val(id, kvmppc_get_tb_offset_hv(vcpu));
 		break;
 	case KVM_REG_PPC_LPCR:
 	case KVM_REG_PPC_LPCR_64:
 		*val = get_reg_val(id, vcpu->arch.vcore->lpcr);
 		break;
 	case KVM_REG_PPC_PPR:
-		*val = get_reg_val(id, vcpu->arch.ppr);
+		*val = get_reg_val(id, kvmppc_get_ppr_hv(vcpu));
 		break;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case KVM_REG_PPC_TFHAR:
@@ -2417,7 +2415,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.vcore->arch_compat);
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		*val = get_reg_val(id, vcpu->arch.dec_expires);
+		*val = get_reg_val(id, kvmppc_get_dec_expires(vcpu));
 		break;
 	case KVM_REG_PPC_ONLINE:
 		*val = get_reg_val(id, vcpu->arch.online);
@@ -2425,6 +2423,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_PTCR:
 		*val = get_reg_val(id, vcpu->kvm->arch.l1_ptcr);
 		break;
+	case KVM_REG_PPC_FSCR:
+		*val = get_reg_val(id, kvmppc_get_fscr_hv(vcpu));
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -2453,29 +2454,29 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.dabrx = set_reg_val(id, *val) & ~DABRX_HYP;
 		break;
 	case KVM_REG_PPC_DSCR:
-		vcpu->arch.dscr = set_reg_val(id, *val);
+		kvmppc_set_dscr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_PURR:
-		vcpu->arch.purr = set_reg_val(id, *val);
+		kvmppc_set_purr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SPURR:
-		vcpu->arch.spurr = set_reg_val(id, *val);
+		kvmppc_set_spurr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_AMR:
-		vcpu->arch.amr = set_reg_val(id, *val);
+		kvmppc_set_amr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_UAMOR:
-		vcpu->arch.uamor = set_reg_val(id, *val);
+		kvmppc_set_uamor_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
 		i = id - KVM_REG_PPC_MMCR0;
-		vcpu->arch.mmcr[i] = set_reg_val(id, *val);
+		kvmppc_set_mmcr_hv(vcpu, i, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCR2:
-		vcpu->arch.mmcr[2] = set_reg_val(id, *val);
+		kvmppc_set_mmcr_hv(vcpu, 2, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCRA:
-		vcpu->arch.mmcra = set_reg_val(id, *val);
+		kvmppc_set_mmcra_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCRS:
 		vcpu->arch.mmcrs = set_reg_val(id, *val);
@@ -2485,32 +2486,32 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
-		vcpu->arch.pmc[i] = set_reg_val(id, *val);
+		kvmppc_set_pmc_hv(vcpu, i, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SPMC1 ... KVM_REG_PPC_SPMC2:
 		i = id - KVM_REG_PPC_SPMC1;
 		vcpu->arch.spmc[i] = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_SIAR:
-		vcpu->arch.siar = set_reg_val(id, *val);
+		kvmppc_set_siar_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SDAR:
-		vcpu->arch.sdar = set_reg_val(id, *val);
+		kvmppc_set_sdar_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER:
-		vcpu->arch.sier[0] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 0, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER2:
-		vcpu->arch.sier[1] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 1, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER3:
-		vcpu->arch.sier[2] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 2, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_IAMR:
-		vcpu->arch.iamr = set_reg_val(id, *val);
+		kvmppc_set_iamr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_PSPB:
-		vcpu->arch.pspb = set_reg_val(id, *val);
+		kvmppc_set_pspb_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DPDES:
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
@@ -2519,25 +2520,25 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 			vcpu->arch.vcore->dpdes = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_VTB:
-		vcpu->arch.vcore->vtb = set_reg_val(id, *val);
+		kvmppc_set_vtb_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWR:
-		vcpu->arch.dawr0 = set_reg_val(id, *val);
+		kvmppc_set_dawr0_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWRX:
-		vcpu->arch.dawrx0 = set_reg_val(id, *val) & ~DAWRX_HYP;
+		kvmppc_set_dawrx0_hv(vcpu, set_reg_val(id, *val) & ~DAWRX_HYP);
 		break;
 	case KVM_REG_PPC_DAWR1:
-		vcpu->arch.dawr1 = set_reg_val(id, *val);
+		kvmppc_set_dawr1_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWRX1:
-		vcpu->arch.dawrx1 = set_reg_val(id, *val) & ~DAWRX_HYP;
+		kvmppc_set_dawrx1_hv(vcpu, set_reg_val(id, *val) & ~DAWRX_HYP);
 		break;
 	case KVM_REG_PPC_CIABR:
-		vcpu->arch.ciabr = set_reg_val(id, *val);
+		kvmppc_set_ciabr_hv(vcpu, set_reg_val(id, *val));
 		/* Don't allow setting breakpoints in hypervisor code */
-		if ((vcpu->arch.ciabr & CIABR_PRIV) == CIABR_PRIV_HYPER)
-			vcpu->arch.ciabr &= ~CIABR_PRIV;	/* disable */
+		if ((kvmppc_get_ciabr_hv(vcpu) & CIABR_PRIV) == CIABR_PRIV_HYPER)
+			kvmppc_set_ciabr_hv(vcpu, kvmppc_get_ciabr_hv(vcpu) & ~CIABR_PRIV);	/* disable */
 		break;
 	case KVM_REG_PPC_CSIGR:
 		vcpu->arch.csigr = set_reg_val(id, *val);
@@ -2549,13 +2550,13 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.tcscr = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_PID:
-		vcpu->arch.pid = set_reg_val(id, *val);
+		kvmppc_set_pid(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_ACOP:
 		vcpu->arch.acop = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_WORT:
-		vcpu->arch.wort = set_reg_val(id, *val);
+		kvmppc_set_wort_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_TIDR:
 		vcpu->arch.tid = set_reg_val(id, *val);
@@ -2602,10 +2603,11 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		 * decrementer, which is better than a large one that
 		 * causes a hang.
 		 */
-		if (!vcpu->arch.dec_expires && tb_offset)
-			vcpu->arch.dec_expires = get_tb() + tb_offset;
+		kvmppc_set_tb_offset_hv(vcpu, tb_offset);
+		if (!kvmppc_get_dec_expires(vcpu) && tb_offset)
+			kvmppc_set_dec_expires(vcpu, get_tb() + tb_offset);
 
-		vcpu->arch.vcore->tb_offset = tb_offset;
+		kvmppc_set_tb_offset_hv(vcpu, tb_offset);
 		break;
 	}
 	case KVM_REG_PPC_LPCR:
@@ -2615,7 +2617,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		kvmppc_set_lpcr(vcpu, set_reg_val(id, *val), false);
 		break;
 	case KVM_REG_PPC_PPR:
-		vcpu->arch.ppr = set_reg_val(id, *val);
+		kvmppc_set_ppr_hv(vcpu, set_reg_val(id, *val));
 		break;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case KVM_REG_PPC_TFHAR:
@@ -2686,7 +2688,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		r = kvmppc_set_arch_compat(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		vcpu->arch.dec_expires = set_reg_val(id, *val);
+		kvmppc_set_dec_expires(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_ONLINE:
 		i = set_reg_val(id, *val);
@@ -2699,6 +2701,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_PTCR:
 		vcpu->kvm->arch.l1_ptcr = set_reg_val(id, *val);
 		break;
+	case KVM_REG_PPC_FSCR:
+		kvmppc_set_fscr_hv(vcpu, set_reg_val(id, *val));
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -2916,19 +2921,20 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.shared_big_endian = false;
 #endif
 #endif
-	vcpu->arch.mmcr[0] = MMCR0_FC;
+	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
+
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		vcpu->arch.mmcr[0] |= MMCR0_PMCCEXT;
-		vcpu->arch.mmcra = MMCRA_BHRB_DISABLE;
+		kvmppc_set_mmcr_hv(vcpu, 0, kvmppc_get_mmcr_hv(vcpu, 0) | MMCR0_PMCCEXT);
+		kvmppc_set_mmcra_hv(vcpu, MMCRA_BHRB_DISABLE);
 	}
 
-	vcpu->arch.ctrl = CTRL_RUNLATCH;
+	kvmppc_set_ctrl_hv(vcpu, CTRL_RUNLATCH);
 	/* default to host PVR, since we can't spoof it */
 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
 	spin_lock_init(&vcpu->arch.vpa_update_lock);
 	spin_lock_init(&vcpu->arch.tbacct_lock);
 	vcpu->arch.busy_preempt = TB_NIL;
-	vcpu->arch.shregs.msr = MSR_ME;
+	kvmppc_set_msr_fast(vcpu, MSR_ME);
 	vcpu->arch.intr_msr = MSR_SF | MSR_ME;
 
 	/*
@@ -2938,29 +2944,30 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	 * don't set the HFSCR_MSGP bit, and that causes those instructions
 	 * to trap and then we emulate them.
 	 */
-	vcpu->arch.hfscr = HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
-		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP;
+	kvmppc_set_hfscr_hv(vcpu, HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
+			    HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP);
 
 	/* On POWER10 and later, allow prefixed instructions */
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		vcpu->arch.hfscr |= HFSCR_PREFIX;
+		kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_PREFIX);
 
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		vcpu->arch.hfscr &= mfspr(SPRN_HFSCR);
+		kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) & mfspr(SPRN_HFSCR));
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		if (cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-			vcpu->arch.hfscr |= HFSCR_TM;
+			kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_TM);
 #endif
 	}
 	if (cpu_has_feature(CPU_FTR_TM_COMP))
 		vcpu->arch.hfscr |= HFSCR_TM;
 
-	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
+	vcpu->arch.hfscr_permitted = kvmppc_get_hfscr_hv(vcpu);
 
 	/*
 	 * PM, EBB, TM are demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB | HFSCR_TM);
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) & ~(HFSCR_PM | HFSCR_EBB | HFSCR_TM));
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
@@ -4038,7 +4045,6 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 /* call our hypervisor to load up HV regs and go */
 static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long host_psscr;
 	unsigned long msr;
 	struct hv_guest_state hvregs;
@@ -4118,7 +4124,7 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
 	*tb = mftb();
-	vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
+	vcpu->arch.dec_expires = dec + (*tb + kvmppc_get_tb_offset_hv(vcpu));
 
 	timer_rearm_host_dec(*tb);
 
@@ -4176,7 +4182,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		__this_cpu_write(cpu_in_guest, NULL);
 
 		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
-		    !(vcpu->arch.shregs.msr & MSR_PR)) {
+		    !(kvmppc_get_msr(vcpu) & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
 			/*
@@ -4655,7 +4661,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
-		if (vcpu->arch.shregs.msr & MSR_EE) {
+		if (kvmppc_get_msr(vcpu) & MSR_EE) {
 			if (xive_interrupt_pending(vcpu))
 				kvmppc_inject_interrupt_hv(vcpu,
 						BOOK3S_INTERRUPT_EXTERNAL, 0);
@@ -4677,7 +4683,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + vc->tb_offset);
+	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + kvmppc_get_tb_offset_hv(vcpu));
 
 	trace_kvm_guest_enter(vcpu);
 
@@ -4844,7 +4850,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		msr |= MSR_VSX;
 	if ((cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
+			(kvmppc_get_hfscr_hv(vcpu) & HFSCR_TM))
 		msr |= MSR_TM;
 	msr = msr_check_and_set(msr);
 
@@ -4868,7 +4874,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
 			accumulate_time(vcpu, &vcpu->arch.hcall);
 
-			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
+			if (WARN_ON_ONCE(kvmppc_get_msr(vcpu) & MSR_PR)) {
 				/*
 				 * These should have been caught reflected
 				 * into the guest by now. Final sanity check:
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 2f2e59d7d433..7a7005189ab1 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -50,3 +50,62 @@ void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
 #define start_timing(vcpu, next) do {} while (0)
 #define end_timing(vcpu) do {} while (0)
 #endif
+
+#define HV_WRAPPER_SET(reg, size)					\
+static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+	vcpu->arch.reg = val;						\
+}
+
+#define HV_WRAPPER_GET(reg, size)					\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
+{									\
+	return vcpu->arch.reg;						\
+}
+
+#define HV_WRAPPER(reg, size)						\
+	HV_WRAPPER_SET(reg, size)					\
+	HV_WRAPPER_GET(reg, size)					\
+
+#define HV_ARRAY_WRAPPER_SET(reg, size)					\
+static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, int i, u##size val)	\
+{									\
+	vcpu->arch.reg[i] = val;					\
+}
+
+#define HV_ARRAY_WRAPPER_GET(reg, size)					\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu, int i)	\
+{									\
+	return vcpu->arch.reg[i];					\
+}
+
+#define HV_ARRAY_WRAPPER(reg, size)					\
+	HV_ARRAY_WRAPPER_SET(reg, size)					\
+	HV_ARRAY_WRAPPER_GET(reg, size)					\
+
+HV_WRAPPER(mmcra, 64)
+HV_WRAPPER(hfscr, 64)
+HV_WRAPPER(fscr, 64)
+HV_WRAPPER(dscr, 64)
+HV_WRAPPER(purr, 64)
+HV_WRAPPER(spurr, 64)
+HV_WRAPPER(amr, 64)
+HV_WRAPPER(uamor, 64)
+HV_WRAPPER(siar, 64)
+HV_WRAPPER(sdar, 64)
+HV_WRAPPER(iamr, 64)
+HV_WRAPPER(dawr0, 64)
+HV_WRAPPER(dawr1, 64)
+HV_WRAPPER(dawrx0, 64)
+HV_WRAPPER(dawrx1, 64)
+HV_WRAPPER(ciabr, 64)
+HV_WRAPPER(wort, 64)
+HV_WRAPPER(ppr, 64)
+HV_WRAPPER(ctrl, 64)
+
+HV_ARRAY_WRAPPER(mmcr, 64)
+HV_ARRAY_WRAPPER(sier, 64)
+HV_ARRAY_WRAPPER(pmc, 32)
+
+HV_WRAPPER(pvr, 32)
+HV_WRAPPER(pspb, 32)
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index da85f046377a..9f9e9aab6015 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -182,9 +182,13 @@ EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
 
 long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
 {
+	unsigned long rand;
+
 	if (ppc_md.get_random_seed &&
-	    ppc_md.get_random_seed(&vcpu->arch.regs.gpr[4]))
+	    ppc_md.get_random_seed(&rand)) {
+		kvmppc_set_gpr(vcpu, 4, rand);
 		return H_SUCCESS;
+	}
 
 	return H_HARDWARE;
 }
@@ -510,7 +514,7 @@ void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 	 */
 	if ((msr & MSR_TS_MASK) == MSR_TS_MASK)
 		msr &= ~MSR_TS_MASK;
-	vcpu->arch.shregs.msr = msr;
+	kvmppc_set_msr_fast(vcpu, msr);
 	kvmppc_end_cede(vcpu);
 }
 EXPORT_SYMBOL_GPL(kvmppc_set_msr_hv);
@@ -548,7 +552,7 @@ static void inject_interrupt(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags)
 	kvmppc_set_srr0(vcpu, pc);
 	kvmppc_set_srr1(vcpu, (msr & SRR1_MSR_BITS) | srr1_flags);
 	kvmppc_set_pc(vcpu, new_pc);
-	vcpu->arch.shregs.msr = new_msr;
+	kvmppc_set_msr_fast(vcpu, new_msr);
 }
 
 void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags)
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 34f1db212824..34bc0a8a1288 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -305,7 +305,7 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	u32 pid;
 
 	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-	pid = vcpu->arch.pid;
+	pid = kvmppc_get_pid(vcpu);
 
 	/*
 	 * Prior memory accesses to host PID Q3 must be completed before we
@@ -330,7 +330,7 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 	int i;
 
 	lpid = kvm->arch.lpid;
-	pid = vcpu->arch.pid;
+	pid = kvmppc_get_pid(vcpu);
 
 	/*
 	 * See switch_mmu_to_guest_radix. ptesync should not be required here
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index ccfd96965630..3b43c3d00311 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -15,6 +15,7 @@
 #include <asm/cputhreads.h>
 #include <asm/hmi.h>
 #include <asm/kvm_ppc.h>
+#include "book3s_hv.h"
 
 /* SRR1 bits for machine check on POWER7 */
 #define SRR1_MC_LDSTERR		(1ul << (63-42))
@@ -173,14 +174,14 @@ long kvmppc_p9_realmode_hmi_handler(struct kvm_vcpu *vcpu)
 		ppc_md.hmi_exception_early(NULL);
 
 out:
-	if (vc->tb_offset) {
+	if (kvmppc_get_tb_offset_hv(vcpu)) {
 		u64 new_tb = mftb() + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
 			new_tb += 0x1000000;
 			mtspr(SPRN_TBU40, new_tb);
 		}
-		vc->tb_offset_applied = vc->tb_offset;
+		vc->tb_offset_applied = kvmppc_get_tb_offset_hv(vcpu);
 	}
 
 	return ret;
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 9182324dbef9..17cb75a127b0 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -776,8 +776,8 @@ long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 			r = rev[i].guest_rpte | (r & (HPTE_R_R | HPTE_R_C));
 			r &= ~HPTE_GR_RESERVED;
 		}
-		vcpu->arch.regs.gpr[4 + i * 2] = v;
-		vcpu->arch.regs.gpr[5 + i * 2] = r;
+		kvmppc_set_gpr(vcpu, 4 + i * 2, v);
+		kvmppc_set_gpr(vcpu, 5 + i * 2, r);
 	}
 	return H_SUCCESS;
 }
@@ -824,7 +824,7 @@ long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 			}
 		}
 	}
-	vcpu->arch.regs.gpr[4] = gr;
+	kvmppc_set_gpr(vcpu, 4, gr);
 	ret = H_SUCCESS;
  out:
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
@@ -872,7 +872,7 @@ long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 			kvmppc_set_dirty_from_hpte(kvm, v, gr);
 		}
 	}
-	vcpu->arch.regs.gpr[4] = gr;
+	kvmppc_set_gpr(vcpu, 4, gr);
 	ret = H_SUCCESS;
  out:
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index e165bfa842bf..e42984878503 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -481,7 +481,7 @@ static void icp_rm_down_cppr(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 
 unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.regs.gpr[5] = get_tb();
+	kvmppc_set_gpr(vcpu, 5, get_tb());
 	return xics_rm_h_xirr(vcpu);
 }
 
@@ -518,7 +518,7 @@ unsigned long xics_rm_h_xirr(struct kvm_vcpu *vcpu)
 	} while (!icp_rm_try_update(icp, old_state, new_state));
 
 	/* Return the result in GPR4 */
-	vcpu->arch.regs.gpr[4] = xirr;
+	kvmppc_set_gpr(vcpu, 4, xirr);
 
 	return check_too_hard(xics, icp);
 }
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index f4115819e738..4adff4f1896d 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -29,6 +29,7 @@
 #include <linux/seq_file.h>
 
 #include "book3s_xive.h"
+#include "book3s_hv.h"
 
 #define __x_eoi_page(xd)	((void __iomem *)((xd)->eoi_mmio))
 #define __x_trig_page(xd)	((void __iomem *)((xd)->trig_mmio))
@@ -328,7 +329,7 @@ static unsigned long xive_vm_h_xirr(struct kvm_vcpu *vcpu)
 	 */
 
 	/* Return interrupt and old CPPR in GPR4 */
-	vcpu->arch.regs.gpr[4] = hirq | (old_cppr << 24);
+	kvmppc_set_gpr(vcpu, 4, hirq | (old_cppr << 24));
 
 	return H_SUCCESS;
 }
@@ -364,7 +365,7 @@ static unsigned long xive_vm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server
 	hirq = xive_vm_scan_interrupts(xc, pending, scan_poll);
 
 	/* Return interrupt and old CPPR in GPR4 */
-	vcpu->arch.regs.gpr[4] = hirq | (xc->cppr << 24);
+	kvmppc_set_gpr(vcpu, 4, hirq | (xc->cppr << 24));
 
 	return H_SUCCESS;
 }
@@ -2779,8 +2780,6 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 
 int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-
 	/* The VM should have configured XICS mode before doing XICS hcalls. */
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
@@ -2799,7 +2798,7 @@ int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
 	case H_XIRR_X:
 		xive_vm_h_xirr(vcpu);
-		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
+		kvmppc_set_gpr(vcpu, 5, get_tb() + kvmppc_get_tb_offset_hv(vcpu));
 		return H_SUCCESS;
 	}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..ca9793c3d437 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1729,7 +1729,7 @@ int kvm_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 			val = get_reg_val(reg->id, vcpu->arch.vr.vscr.u[3]);
 			break;
 		case KVM_REG_PPC_VRSAVE:
-			val = get_reg_val(reg->id, vcpu->arch.vrsave);
+			val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
 			break;
 #endif /* CONFIG_ALTIVEC */
 		default:
@@ -1784,7 +1784,7 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vrsave = set_reg_val(reg->id, val);
+			kvmppc_set_vrsave(vcpu, set_reg_val(reg->id, val));
 			break;
 #endif /* CONFIG_ALTIVEC */
 		default:
-- 
2.31.1

