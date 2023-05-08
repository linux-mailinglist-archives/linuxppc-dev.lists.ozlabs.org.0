Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F26FB3A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 17:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFQ212lSRz3fPL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:19:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZFd+03Sq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZFd+03Sq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFCV25mfmz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 17:24:42 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3486rqF3001896;
	Mon, 8 May 2023 07:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CwfuVmzgoYaidA3QJbl3isUzf11hIu2fpk5T5C/Kfz4=;
 b=ZFd+03SqbdKWqzQh19CzbK3XDajcB7qK6aHTdejN5BewvUiFv2R3GEqSkfOhm3BQSR2P
 YKUXB58JBdHYmhlw/tO0UACc4z9rKysBCbkRhuJtDIEf4w4euh5Uer9DLhe7JE3j4812
 Hpb2XpHAIeuq8J/G1IzdWL7s5pUfrV0cmm7tJrGi95f19K0qtxqdn6R5x3JbRUubTtlw
 vZQn35vUH/OxF53pyzr1HZh14J2V4UPpElp2WIVZF2ixDRXdc6IHGdylDUlpuiqic1Yi
 XzezuM4xGC03sMQdPXy58c/f7na1wHLkNjdI8y/7Q4uohBscyw+h2TzqhN4N1xQ4edFN BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qev7agxuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:40 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3486s8us002259;
	Mon, 8 May 2023 07:24:39 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qev7agxu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:39 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3483tphY024507;
	Mon, 8 May 2023 07:24:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gsvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3487OXL021824234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 07:24:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7E5220049;
	Mon,  8 May 2023 07:24:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D233620040;
	Mon,  8 May 2023 07:24:28 +0000 (GMT)
Received: from pwon.ibmuc.com (unknown [9.177.74.71])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 07:24:28 +0000 (GMT)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v1 3/5] KVM: PPC: Add vr getters and setters
Date: Mon,  8 May 2023 17:23:30 +1000
Message-Id: <20230508072332.2937883-4-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230508072332.2937883-1-jpn@linux.vnet.ibm.com>
References: <20230508072332.2937883-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nBgfdPwxV6lkX6zJZaAnyLwezfVbNdI0
X-Proofpoint-GUID: Kw6xNVrmimQETqM-erf9C-fyWODNdsyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 mlxlogscore=686 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080049
X-Mailman-Approved-At: Tue, 09 May 2023 01:16:28 +1000
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, sbhat@linux.ibm.com, kautuk.consul.1980@gmail.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add wrappers for vr registers to prepare for supporting PAPR nested
guests.

Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h | 20 +++++++++++
 arch/powerpc/kvm/powerpc.c            | 50 +++++++++++++--------------
 2 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index a632e79639f0..77653c5b356b 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -444,6 +444,26 @@ static inline void kvmppc_set_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j, u64 v
 	vcpu->arch.fp.fpr[i][j] = val;
 }
 
+static inline vector128 kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i)
+{
+	return vcpu->arch.vr.vr[i];
+}
+
+static inline void kvmppc_set_vsx_vr(struct kvm_vcpu *vcpu, int i, vector128 val)
+{
+	vcpu->arch.vr.vr[i] = val;
+}
+
+static inline u32 kvmppc_get_vscr(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.vr.vscr.u[3];
+}
+
+static inline void kvmppc_set_vscr(struct kvm_vcpu *vcpu, u32 val)
+{
+	vcpu->arch.vr.vscr.u[3] = val;
+}
+
 #define BOOK3S_WRAPPER_SET(reg, size)					\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9468df8d9987..c1084d40e292 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -932,9 +932,9 @@ static inline void kvmppc_set_vsr_dword(struct kvm_vcpu *vcpu,
 		return;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		val.vval = kvmppc_get_vsx_vr(vcpu, index - 32);
 		val.vsxval[offset] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, val.vval);
 	} else {
 		kvmppc_set_vsx_fpr(vcpu, index, offset, gpr);
 	}
@@ -947,10 +947,10 @@ static inline void kvmppc_set_vsr_dword_dump(struct kvm_vcpu *vcpu,
 	int index = vcpu->arch.io_gpr & KVM_MMIO_REG_MASK;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		val.vval = kvmppc_get_vsx_vr(vcpu, index - 32);
 		val.vsxval[0] = gpr;
 		val.vsxval[1] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, val.vval);
 	} else {
 		kvmppc_set_vsx_fpr(vcpu, index, 0, gpr);
 		kvmppc_set_vsx_fpr(vcpu, index, 1,  gpr);
@@ -968,7 +968,7 @@ static inline void kvmppc_set_vsr_word_dump(struct kvm_vcpu *vcpu,
 		val.vsx32val[1] = gpr;
 		val.vsx32val[2] = gpr;
 		val.vsx32val[3] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, val.vval);
 	} else {
 		val.vsx32val[0] = gpr;
 		val.vsx32val[1] = gpr;
@@ -989,9 +989,9 @@ static inline void kvmppc_set_vsr_word(struct kvm_vcpu *vcpu,
 		return;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		val.vval = kvmppc_get_vsx_vr(vcpu, index - 32);
 		val.vsx32val[offset] = gpr32;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, val.vval);
 	} else {
 		dword_offset = offset / 2;
 		word_offset = offset % 2;
@@ -1056,9 +1056,9 @@ static inline void kvmppc_set_vmx_dword(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	val.vval = kvmppc_get_vsx_vr(vcpu, index);
 	val.vsxval[offset] = gpr;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, val.vval);
 }
 
 static inline void kvmppc_set_vmx_word(struct kvm_vcpu *vcpu,
@@ -1072,9 +1072,9 @@ static inline void kvmppc_set_vmx_word(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	val.vval = kvmppc_get_vsx_vr(vcpu, index);
 	val.vsx32val[offset] = gpr32;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, val.vval);
 }
 
 static inline void kvmppc_set_vmx_hword(struct kvm_vcpu *vcpu,
@@ -1088,9 +1088,9 @@ static inline void kvmppc_set_vmx_hword(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	val.vval = kvmppc_get_vsx_vr(vcpu, index);
 	val.vsx16val[offset] = gpr16;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, val.vval);
 }
 
 static inline void kvmppc_set_vmx_byte(struct kvm_vcpu *vcpu,
@@ -1104,9 +1104,9 @@ static inline void kvmppc_set_vmx_byte(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	val.vval = kvmppc_get_vsx_vr(vcpu, index);
 	val.vsx8val[offset] = gpr8;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, val.vval);
 }
 #endif /* CONFIG_ALTIVEC */
 
@@ -1419,7 +1419,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 		if (rs < 32) {
 			*val = kvmppc_get_vsx_fpr(vcpu, rs, vsx_offset);
 		} else {
-			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
+			reg.vval = kvmppc_get_vsx_vr(vcpu, rs - 32);
 			*val = reg.vsxval[vsx_offset];
 		}
 		break;
@@ -1439,7 +1439,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 			reg.vsxval[0] = kvmppc_get_vsx_fpr(vcpu, rs, dword_offset);
 			*val = reg.vsx32val[word_offset];
 		} else {
-			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
+			reg.vval = kvmppc_get_vsx_vr(vcpu, rs - 32);
 			*val = reg.vsx32val[vsx_offset];
 		}
 		break;
@@ -1554,7 +1554,7 @@ static int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	reg.vval = kvmppc_get_vsx_vr(vcpu, index);
 	*val = reg.vsxval[vmx_offset];
 
 	return result;
@@ -1572,7 +1572,7 @@ static int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	reg.vval = kvmppc_get_vsx_vr(vcpu, index);
 	*val = reg.vsx32val[vmx_offset];
 
 	return result;
@@ -1590,7 +1590,7 @@ static int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	reg.vval = kvmppc_get_vsx_vr(vcpu, index);
 	*val = reg.vsx16val[vmx_offset];
 
 	return result;
@@ -1608,7 +1608,7 @@ static int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	reg.vval = kvmppc_get_vsx_vr(vcpu, index);
 	*val = reg.vsx8val[vmx_offset];
 
 	return result;
@@ -1717,14 +1717,14 @@ int kvm_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			val.vval = vcpu->arch.vr.vr[reg->id - KVM_REG_PPC_VR0];
+			val.vval = kvmppc_get_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0);
 			break;
 		case KVM_REG_PPC_VSCR:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
 				r = -ENXIO;
 				break;
 			}
-			val = get_reg_val(reg->id, vcpu->arch.vr.vscr.u[3]);
+			val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
 			break;
 		case KVM_REG_PPC_VRSAVE:
 			val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
@@ -1768,14 +1768,14 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vr.vr[reg->id - KVM_REG_PPC_VR0] = val.vval;
+			kvmppc_set_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0, val.vval);
 			break;
 		case KVM_REG_PPC_VSCR:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vr.vscr.u[3] = set_reg_val(reg->id, val);
+			kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
 			break;
 		case KVM_REG_PPC_VRSAVE:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
-- 
2.31.1

