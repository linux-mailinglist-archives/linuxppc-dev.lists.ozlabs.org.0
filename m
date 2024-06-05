Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C78FCE89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 15:11:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzoqxJIe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSWz4Q85z3cVf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:11:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzoqxJIe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSSD5GcYz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 23:07:56 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455CuJwQ004830;
	Wed, 5 Jun 2024 13:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=PAnxPcg4stU078HduddXkQh0zKC4HTo+w/gVBmhdhTg=;
 b=UzoqxJIelx3GFsD2iecl2KvK32azKX6F3VJpCSy57vFRm/ZSdRXa3dAzwbRXyt2YoX0K
 +7d0hDG1ViZLYs7jbxx5zk5RZJpIPc2cwuu6Qlmv+ln4F89XIMZ/2ZXvNzKcSw5dNN3t
 KAdQs/+cyJ2fRbabAlNoMrrKUHJii+Yh/x8wDTj+5xJ6Ts2BeUQVfg6FqXsGxS2cxovh
 whsGSTFtcwXX/me3KVfKpRRBcEuCxPsO6oe+g/qp4DaywAdtMB+uz3o7k/ameBfz0iv4
 TbTp1ohPBuqvaMluqtBXfknyhhDJgTM6vm5Vq1rwS+emyfawcs51p6mwWefifX/hMp8o qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjns38es6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:48 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 455D3FFV016699;
	Wed, 5 Jun 2024 13:07:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjns38ery-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455CZw0r000781;
	Wed, 5 Jun 2024 13:07:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu4g6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455D7fFM52494746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 13:07:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93E592004F;
	Wed,  5 Jun 2024 13:07:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B93A020043;
	Wed,  5 Jun 2024 13:07:39 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 13:07:39 +0000 (GMT)
Subject: [PATCH v2 7/8] KVM: PPC: Book3S HV: Add one-reg interface for
 HASHPKEYR register
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 05 Jun 2024 13:07:39 +0000
Message-ID: <171759285547.1480.12374595786792346073.stgit@linux.ibm.com>
In-Reply-To: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
References: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5rrn8rJ3HkFXItAMJpQ9T8iWjHv-8Kem
X-Proofpoint-ORIG-GUID: PAeI1xVMgMlppLivDDpU3a9OGn193yNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=645 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050099
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
Cc: atrajeev@linux.vnet.ibm.com, sbhat@linux.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, npiggin@gmail.com, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch adds a one-reg register identifier which can be used to
read and set the virtual HASHPKEYR for the guest during enter/exit
with KVM_REG_PPC_HASHPKEYR. The specific SPR KVM API documentation
too updated.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst      |    1 +
 arch/powerpc/include/asm/kvm_host.h |    1 +
 arch/powerpc/include/uapi/asm/kvm.h |    1 +
 arch/powerpc/kvm/book3s_hv.c        |    6 ++++++
 arch/powerpc/kvm/book3s_hv.h        |    1 +
 5 files changed, 10 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0c22cb4196d8..899480d4acaf 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2440,6 +2440,7 @@ registers, find a list below:
   PPC     KVM_REG_PPC_DEC_EXPIRY          64
   PPC     KVM_REG_PPC_PTCR                64
   PPC     KVM_REG_PPC_HASHKEYR            64
+  PPC     KVM_REG_PPC_HASHPKEYR           64
   PPC     KVM_REG_PPC_DAWR1               64
   PPC     KVM_REG_PPC_DAWRX1              64
   PPC     KVM_REG_PPC_DEXCR               64
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index a0cd9dbf534f..6a0c771d3ce8 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -601,6 +601,7 @@ struct kvm_vcpu_arch {
 	ulong dawrx1;
 	ulong dexcr;
 	ulong hashkeyr;
+	ulong hashpkeyr;
 	ulong ciabr;
 	ulong cfar;
 	ulong ppr;
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index 23a0af739c78..eaeda001784e 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -647,6 +647,7 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
 #define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
 #define KVM_REG_PPC_HASHKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc7)
+#define KVM_REG_PPC_HASHPKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc8)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ccc9564c5a31..bf05b63b0e20 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2355,6 +2355,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_HASHKEYR:
 		*val = get_reg_val(id, kvmppc_get_hashkeyr_hv(vcpu));
 		break;
+	case KVM_REG_PPC_HASHPKEYR:
+		*val = get_reg_val(id, kvmppc_get_hashpkeyr_hv(vcpu));
+		break;
 	case KVM_REG_PPC_CIABR:
 		*val = get_reg_val(id, kvmppc_get_ciabr_hv(vcpu));
 		break;
@@ -2604,6 +2607,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_HASHKEYR:
 		kvmppc_set_hashkeyr_hv(vcpu, set_reg_val(id, *val));
 		break;
+	case KVM_REG_PPC_HASHPKEYR:
+		kvmppc_set_hashpkeyr_hv(vcpu, set_reg_val(id, *val));
+		break;
 	case KVM_REG_PPC_CIABR:
 		kvmppc_set_ciabr_hv(vcpu, set_reg_val(id, *val));
 		/* Don't allow setting breakpoints in hypervisor code */
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index c073fdfa7dc4..a404c9b221c1 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -118,6 +118,7 @@ KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64, KVMPPC_GSID_DAWRX0)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64, KVMPPC_GSID_DAWRX1)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dexcr, 64, KVMPPC_GSID_DEXCR)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hashkeyr, 64, KVMPPC_GSID_HASHKEYR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hashpkeyr, 64, KVMPPC_GSID_HASHPKEYR)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64, KVMPPC_GSID_CIABR)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64, KVMPPC_GSID_WORT)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64, KVMPPC_GSID_PPR)


