Return-Path: <linuxppc-dev+bounces-2631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1B9B2C8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:17:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcTpM4wWfz2xg3;
	Mon, 28 Oct 2024 21:17:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730110635;
	cv=none; b=MtW+2Tre82HzdzPBACFJBrRmVKHrGFsM4ZZ3VG8lLpOhd5bEhTnkGLraDc6kqQwjQal5tWp4ku1YOztKVkoIqLsl6sMpnZSRNholaytLepJUkSOqwAdkX0d6YXbONLudzz3o6RCHHw1TFESi/IYoElBrd0Bvj1IPhzHEtsDrV5yeEMxu5Bi4YnluHgu6saeWDHg0bqbrcFTVWLG+AAzUF4zXrhgGTd7FYnr4P3f+dyQGTE+M9tekxycsSXx4X6p7E3R5qrR+n1Q3eYWwTrnPzYCuXN2g6bzAfhE9cMHeOjTy6WeLBWrc62WJ+cCcJ40Vv2G7WYtlRZPyMEKR2xw33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730110635; c=relaxed/relaxed;
	bh=rV0CJojqgF+K3HycVkCYf9g6yidOMYi7KPub2UeehL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsdIWqgt5opeqaQROOjpLOh3RS1fgpoFp1fpFVgNpQUSv70XBy3sRQJL+4jWFKCr5MB7SzU1N72X58Bzzh9Iqcx5Vl9eeAqWusIWDCMWsg3YmCkhNLhcZnIYH0JemlWoLRmhssUmgCmTUeIRNCuBtQEpu2rIkMxaRZuqi0LijaMfdnXGqKMX0Ge0h3t8mhzn6PgCLowde2A2kh/6/NOo88HV2XR7egXIaA0ff9vYN5NLk/cr5G49S8sapzZkrAuZ17SznQkkeGeXKS74Y8HsBcdjnI5fA4osf2BZ0Py76i/xJDoB0C+6wK5YH1CKcOiJ+Ct/3XH9ypjga4jhz8TYqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Es08A8tQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Es08A8tQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcTpL1CQ5z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:17:13 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4We9w014877;
	Mon, 28 Oct 2024 10:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=rV0CJojqgF+K3HycVkCYf9g6yidOMYi7KPub2Ueeh
	L8=; b=Es08A8tQZcBwNCM26LN1RJPww9gy/Wb1Kbpkl/tvRUQxgAnR9ihKm8xb/
	/iE+Iqxc1nNkpp14jJFWVDnZK3peXM0P/hSKHFp2NgtIu0e7W64OcgZlktWss+DS
	xQSJKevBKdzi+O0cYlVBGCr5vyz1QsrDq72UEtdP/GSk0WC2iEtjLmpn6ApispRH
	9Poioth/4LnEOTL5fDP94gw5kV+8Zw6244Gb5W9zFYfnsJIoTUc4qxEEayn0XJsI
	PMDMt2ATX3I8VuKElcrs41dAAQUB3WS7EzZQAPCcB/SokQfdVEQ1/hIzIpt3g9ep
	nN0WmyZ+umoqOAxRTCn9L8KjS2zsg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3nshqmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 10:17:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49SAGxxr014644;
	Mon, 28 Oct 2024 10:16:59 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3nshqmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 10:16:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49S6qKPU017312;
	Mon, 28 Oct 2024 10:16:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42hars5wv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 10:16:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49SAGtse15729030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 10:16:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 329C820265;
	Mon, 28 Oct 2024 10:16:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B55020263;
	Mon, 28 Oct 2024 10:16:52 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com.com (unknown [9.39.17.130])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Oct 2024 10:16:52 +0000 (GMT)
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Amit Machhiwal <amachhiw@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Add Power11 capability support for Nested PAPR guests
Date: Mon, 28 Oct 2024 15:46:22 +0530
Message-ID: <20241028101622.741573-1-amachhiw@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fkS9FBpgItT9aBY-4QhWDYW3FgVhShzQ
X-Proofpoint-GUID: UV3ZMactXfDCqgLLLj4kPAnnVUCbyDS9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The Power11 architected and raw mode support in Linux was merged via [1]
and the corresponding support in QEMU is pending in [2], which is
currently in its V6.

Currently, booting a KVM guest inside a pseries LPAR (Logical Partition)
on a kernel without [1] results the guest boot in a Power10
compatibility mode (i.e., with logical PVR of Power10). However, booting
a KVM guest on a kernel with [1] causes the following boot crash.

On a Power11 LPAR, the Power Hypervisor (L0) returns a support for both
Power10 and Power11 capabilities through H_GUEST_GET_CAPABILITIES hcall.
However, KVM currently supports only Power10 capabilities, resulting in
only Power10 capabilities being set as "nested capabilities" via an
H_GUEST_SET_CAPABILITIES hcall.

In the guest entry path, gs_msg_ops_kvmhv_nestedv2_config_fill_info() is
called by kvmhv_nestedv2_flush_vcpu() to fill the GSB (Guest State
Buffer) elements. The arch_compat is set to the logical PVR of Power11,
followed by an H_GUEST_SET_STATE hcall. This hcall returns
H_INVALID_ELEMENT_VALUE as a return code when setting a Power11 logical
PVR, as only Power10 capabilities were communicated as supported between
PHYP and KVM, utimately resulting in the KVM guest boot crash.

 KVM: unknown exit, hardware reason ffffffffffffffea
 NIP 000000007daf97e0   LR 000000007daf1aec CTR 000000007daf1ab4 XER 0000000020040000 CPU#0
 MSR 8000000000103000 HID0 0000000000000000  HF 6c002000 iidx 3 didx 3
 TB 00000000 00000000 DECR 0
 GPR00 8000000000003000 000000007e580e20 000000007db26700 0000000000000000
 GPR04 00000000041a0c80 000000007df7f000 0000000000200000 000000007df7f000
 GPR08 000000007db6d5d8 000000007e65fa90 000000007db6d5d0 0000000000003000
 GPR12 8000000000000001 0000000000000000 0000000000000000 0000000000000000
 GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20 0000000000000000 0000000000000000 0000000000000000 000000007db21a30
 GPR24 000000007db65000 0000000000000000 0000000000000000 0000000000000003
 GPR28 000000007db6d5e0 000000007db22220 000000007daf27ac 000000007db75000
 CR 20000404  [ E  -  -  -  -  G  -  G  ]     RES 000@ffffffffffffffff
  SRR0 000000007daf97e0  SRR1 8000000000102000    PVR 0000000000820200 VRSAVE 0000000000000000
 SPRG0 0000000000000000 SPRG1 000000000000ff20  SPRG2 0000000000000000  SPRG3 0000000000000000
 SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
  CFAR 0000000000000000
  LPCR 0000000000020400
  PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

Fix this by adding the Power11 capability support and the required
plumbing in place.

Note:
  * Booting a Power11 KVM nested PAPR guest requires [2] in QEMU.

[1] https://lore.kernel.org/all/20240221044623.1598642-1-mpe@ellerman.id.au/
[2] https://lore.kernel.org/all/20240731055022.696051-1-adityag@linux.ibm.com/

Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h   | 11 ++++++-----
 arch/powerpc/include/asm/hvcall.h     |  1 +
 arch/powerpc/kvm/book3s_hv.c          |  7 +++++--
 arch/powerpc/kvm/book3s_hv_nested.c   |  2 ++
 arch/powerpc/kvm/book3s_hv_nestedv2.c |  4 +++-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 201218faed61..29a529d2ab8b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -193,6 +193,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
 #define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0010000000000000)
+#define CPU_FTR_P11_PVR			LONG_ASM_CONST(0x0020000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -454,7 +455,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
 	    CPU_FTR_DEXCR_NPHIE)
 
-#define CPU_FTRS_POWER11	CPU_FTRS_POWER10
+#define CPU_FTRS_POWER11	(CPU_FTRS_POWER10 | CPU_FTR_P11_PVR)
 
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
@@ -475,7 +476,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
 	     CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
 	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | \
-	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10 | CPU_FTRS_POWER11)
 #else
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
@@ -483,7 +484,7 @@ static inline void cpu_feature_keys_init(void) { }
 	     CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
 	     CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
 	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | \
-	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_3 | CPU_FTRS_POWER10 | CPU_FTRS_POWER11)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
@@ -547,7 +548,7 @@ enum {
 	    (CPU_FTRS_POSSIBLE & ~CPU_FTR_HVMODE & ~CPU_FTR_DBELL & \
 	     CPU_FTRS_POWER7 & CPU_FTRS_POWER8E & CPU_FTRS_POWER8 & \
 	     CPU_FTRS_POWER9 & CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
-	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER10 & CPU_FTRS_POWER11 & CPU_FTRS_DT_CPU_BASE)
 #else
 #define CPU_FTRS_ALWAYS		\
 	    (CPU_FTRS_PPC970 & CPU_FTRS_POWER5 & \
@@ -555,7 +556,7 @@ enum {
 	     CPU_FTRS_PA6T & CPU_FTRS_POWER8 & CPU_FTRS_POWER8E & \
 	     ~CPU_FTR_HVMODE & ~CPU_FTR_DBELL & CPU_FTRS_POSSIBLE & \
 	     CPU_FTRS_POWER9 & CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
-	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
+	     CPU_FTRS_POWER10 & CPU_FTRS_POWER11 & CPU_FTRS_DT_CPU_BASE)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 7a8495660c2f..65d1f291393d 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -495,6 +495,7 @@
 #define H_GUEST_CAP_COPY_MEM	(1UL<<(63-0))
 #define H_GUEST_CAP_POWER9	(1UL<<(63-1))
 #define H_GUEST_CAP_POWER10	(1UL<<(63-2))
+#define H_GUEST_CAP_POWER11	(1UL<<(63-3))
 #define H_GUEST_CAP_BITMAP2	(1UL<<(63-63))
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ba0492f9de65..3cdd6d6df041 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -400,7 +400,10 @@ static inline unsigned long map_pcr_to_cap(unsigned long pcr)
 		cap = H_GUEST_CAP_POWER9;
 		break;
 	case PCR_ARCH_31:
-		cap = H_GUEST_CAP_POWER10;
+		if (cpu_has_feature(CPU_FTR_P11_PVR))
+			cap = H_GUEST_CAP_POWER11;
+		else
+			cap = H_GUEST_CAP_POWER10;
 		break;
 	default:
 		break;
@@ -415,7 +418,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
 	/* We can (emulate) our own architecture version and anything older */
-	if (cpu_has_feature(CPU_FTR_ARCH_31))
+	if (cpu_has_feature(CPU_FTR_P11_PVR) || cpu_has_feature(CPU_FTR_ARCH_31))
 		host_pcr_bit = PCR_ARCH_31;
 	else if (cpu_has_feature(CPU_FTR_ARCH_300))
 		host_pcr_bit = PCR_ARCH_300;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 05f5220960c6..db54b259c251 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -445,6 +445,8 @@ long kvmhv_nested_init(void)
 	if (rc == H_SUCCESS) {
 		unsigned long capabilities = 0;
 
+		if (cpu_has_feature(CPU_FTR_P11_PVR))
+			capabilities |= H_GUEST_CAP_POWER11;
 		if (cpu_has_feature(CPU_FTR_ARCH_31))
 			capabilities |= H_GUEST_CAP_POWER10;
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index eeecea8f202b..e5c7ce1fb761 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -370,7 +370,9 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
 			 * default to L1's PVR.
 			 */
 			if (!vcpu->arch.vcore->arch_compat) {
-				if (cpu_has_feature(CPU_FTR_ARCH_31))
+				if (cpu_has_feature(CPU_FTR_P11_PVR))
+					arch_compat = PVR_ARCH_31_P11;
+				else if (cpu_has_feature(CPU_FTR_ARCH_31))
 					arch_compat = PVR_ARCH_31;
 				else if (cpu_has_feature(CPU_FTR_ARCH_300))
 					arch_compat = PVR_ARCH_300;

base-commit: c964ced7726294d40913f2127c3f185a92cb4a41
-- 
2.47.0


