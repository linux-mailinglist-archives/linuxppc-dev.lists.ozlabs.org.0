Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0E849BBB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 14:27:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcAAbqKI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT6cf3v74z3cDS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 00:27:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcAAbqKI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT6bv6zQRz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 00:26:51 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DBKnk019393;
	Mon, 5 Feb 2024 13:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mdHnH3qetbE94X7CB4elv56+yDxmbNIgxKJqE8r61Og=;
 b=JcAAbqKISfYXuQ7vUxFRaHVkJksJfs/iWRXSghLcH88IRI2xQD7VXDpJNqe6upJJWLCU
 ctWK7Drkxi0kIzlcB5wnIyYhHF3jjlG1mFBapi920QLOfh8mx09R3YTeedLzJVGefC5N
 QGf4AHxavoK2NpYX7bw0hVjMYE3FdrqP7Z9qDNqzxhpOt+aNRwWUTJO0Gs9FEfKB4aOH
 I51wdKwrZhBd0ibFLtxa7zi3ohqhUy6VyQR8jN4eeoOvo3L3JoPJmGPVi2zfwEEcMtgj
 1ugYoSBRL6bHtfm6qieM2Q2LhGo/2pxKdy4npmIVTXvpe+rPajBI6+USXq6HyD87ootn fA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w30b88c8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 13:26:40 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415DC8q8021755;
	Mon, 5 Feb 2024 13:26:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w30b88c8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 13:26:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 415D71ZW020234;
	Mon, 5 Feb 2024 13:26:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w1ytsrws1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 13:26:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 415DQZjW16057040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 13:26:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E3FF2004B;
	Mon,  5 Feb 2024 13:26:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE3220043;
	Mon,  5 Feb 2024 13:26:32 +0000 (GMT)
Received: from li-a83676cc-350e-11b2-a85c-e11f86bb8d73.ibm.com.com (unknown [9.43.119.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 13:26:32 +0000 (GMT)
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to empty 'arch_compat'
Date: Mon,  5 Feb 2024 18:56:07 +0530
Message-ID: <20240205132607.2776637-1-amachhiw@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _bqdb9hlZOc-8EMgVZbiUklYjAIer3PQ
X-Proofpoint-ORIG-GUID: 3wWOD7aAiCD7PQ0uFC7-sU7WZquFkmOZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_08,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxlogscore=839 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050101
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Amit Machhiwal <amachhiw@linux.ibm.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, rebooting a pseries nested qemu-kvm guest (L2) results in
below error as L1 qemu sends PVR value 'arch_compat' == 0 via
ppc_set_compat ioctl. This triggers a condition failure in
kvmppc_set_arch_compat() resulting in an EINVAL.

qemu-system-ppc64: Unable to set CPU compatibility mode in KVM: Invalid
argument

Also, a value of 0 for arch_compat generally refers the default
compatibility of the host. But, arch_compat, being a Guest Wide Element
in nested API v2, cannot be set to 0 in GSB as PowerVM (L0) expects a
non-zero value. A value of 0 triggers a kernel trap during a reboot and
consequently causes it to fail:

[   22.106360] reboot: Restarting system
KVM: unknown exit, hardware reason ffffffffffffffea
NIP 0000000000000100   LR 000000000000fe44 CTR 0000000000000000 XER 0000000020040092 CPU#0
MSR 0000000000001000 HID0 0000000000000000  HF 6c000000 iidx 3 didx 3
TB 00000000 00000000 DECR 0
GPR00 0000000000000000 0000000000000000 c000000002a8c300 000000007fe00000
GPR04 0000000000000000 0000000000000000 0000000000001002 8000000002803033
GPR08 000000000a000000 0000000000000000 0000000000000004 000000002fff0000
GPR12 0000000000000000 c000000002e10000 0000000105639200 0000000000000004
GPR16 0000000000000000 000000010563a090 0000000000000000 0000000000000000
GPR20 0000000105639e20 00000001056399c8 00007fffe54abab0 0000000105639288
GPR24 0000000000000000 0000000000000001 0000000000000001 0000000000000000
GPR28 0000000000000000 0000000000000000 c000000002b30840 0000000000000000
CR 00000000  [ -  -  -  -  -  -  -  -  ]     RES 000@ffffffffffffffff
 SRR0 0000000000000000  SRR1 0000000000000000    PVR 0000000000800200 VRSAVE 0000000000000000
SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG3 0000000000000000
SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
HSRR0 0000000000000000 HSRR1 0000000000000000
 CFAR 0000000000000000
 LPCR 0000000000020400
 PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

 kernel:trap=0xffffffea | pc=0x100 | msr=0x1000

This patch updates kvmppc_set_arch_compat() to use the host PVR value if
'compat_pvr' == 0 indicating that qemu doesn't want to enforce any
specific PVR compat mode.

Fixes: 19d31c5f1157 ("KVM: PPC: Add support for nestedv2 guests")
Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---

Changes v1 -> v2:
    - Added descriptive error log in the patch description when
      `arch_compat == 0` passed in GSB
    - Added a helper function for PCR to capabilities mapping
    - Added relevant comments around the changes being made

v1: https://lore.kernel.org/lkml/20240118095653.2588129-1-amachhiw@linux.ibm.com/

 arch/powerpc/kvm/book3s_hv.c          | 25 +++++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_nestedv2.c | 23 +++++++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 52427fc2a33f..270ab9cf9a54 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -391,6 +391,23 @@ static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
 /* Dummy value used in computing PCR value below */
 #define PCR_ARCH_31    (PCR_ARCH_300 << 1)
 
+static inline unsigned long map_pcr_to_cap(unsigned long pcr)
+{
+	unsigned long cap = 0;
+
+	switch (pcr) {
+	case PCR_ARCH_300:
+		cap = H_GUEST_CAP_POWER9;
+		break;
+	case PCR_ARCH_31:
+		cap = H_GUEST_CAP_POWER10;
+	default:
+		break;
+	}
+
+	return cap;
+}
+
 static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 {
 	unsigned long host_pcr_bit = 0, guest_pcr_bit = 0, cap = 0;
@@ -424,11 +441,9 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 			break;
 		case PVR_ARCH_300:
 			guest_pcr_bit = PCR_ARCH_300;
-			cap = H_GUEST_CAP_POWER9;
 			break;
 		case PVR_ARCH_31:
 			guest_pcr_bit = PCR_ARCH_31;
-			cap = H_GUEST_CAP_POWER10;
 			break;
 		default:
 			return -EINVAL;
@@ -440,6 +455,12 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 		return -EINVAL;
 
 	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
+		/*
+		 * 'arch_compat == 0' would mean the guest should default to
+		 * L1's compatibility. In this case, the guest would pick
+		 * host's PCR and evaluate the corresponding capabilities.
+		 */
+		cap = map_pcr_to_cap(guest_pcr_bit);
 		if (!(cap & nested_capabilities))
 			return -EINVAL;
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index 5378eb40b162..6042bdc70230 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -138,6 +138,7 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
 	vector128 v;
 	int rc, i;
 	u16 iden;
+	u32 arch_compat = 0;
 
 	vcpu = gsm->data;
 
@@ -347,8 +348,26 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
 			break;
 		}
 		case KVMPPC_GSID_LOGICAL_PVR:
-			rc = kvmppc_gse_put_u32(gsb, iden,
-						vcpu->arch.vcore->arch_compat);
+			/*
+			 * Though 'arch_compat == 0' would mean the default
+			 * compatibility, arch_compat, being a Guest Wide
+			 * Element, cannot be filled with a value of 0 in GSB
+			 * as this would result into a kernel trap.
+			 * Hence, when `arch_compat == 0`, arch_compat should
+			 * default to L1's PVR.
+			 *
+			 * Rework this when PowerVM supports a value of 0
+			 * for arch_compat for KVM API v2.
+			 */
+			if (!vcpu->arch.vcore->arch_compat) {
+				if (cpu_has_feature(CPU_FTR_ARCH_31))
+					arch_compat = PVR_ARCH_31;
+				else if (cpu_has_feature(CPU_FTR_ARCH_300))
+					arch_compat = PVR_ARCH_300;
+			} else {
+				arch_compat = vcpu->arch.vcore->arch_compat;
+			}
+			rc = kvmppc_gse_put_u32(gsb, iden, arch_compat);
 			break;
 		}
 

base-commit: 6764c317b6bb91bd806ef79adf6d9c0e428b191e
-- 
2.43.0

