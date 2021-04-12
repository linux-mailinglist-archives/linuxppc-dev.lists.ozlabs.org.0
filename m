Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9DA35D309
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK3Jq1DXvz30C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wg0CPOav;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wg0CPOav; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK3JM3PY7z300c
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 08:27:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CM4KNW077369; Mon, 12 Apr 2021 18:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=luum+pxer+WirNEHYuoLeR8uzLoE4JG3p9cQsJmIasA=;
 b=Wg0CPOavJ3uE1n5qX7HblbGliNZ/zg3t9iEtpU1QDxSQ3hecAKGOiuLe4lTubCTfg7kq
 M5H1nlUjzSSVKe7568XFvb1m3WwvQ+4nZ1lFBYfRUTcVp4G3r08i5NhicydcK7XaN8df
 MRMlQZlTFYjJ1OwEmyVslNKFyPNRUyQof6y9lLaXJEH+JLs+Xh4pPfl/9mbHJ8yP5Dey
 kPKr9skN1W2ZJyy9Cl7BjAfUaLGePlXXovI1eQCpVUvqIVOvMd0KZBT0gYXGldd2zfef
 ek5YuLlnZgXlXWNtHv92mugSbcbCeCfHoo34LeVk6VO2d5iKYSBy17RIdmQeqdUwr4Ug Iw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkdgb967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 18:27:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CMBj1s025896;
 Mon, 12 Apr 2021 22:27:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 37u3n98mvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 22:27:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CMR6ZK24445210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 22:27:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C22FBE054;
 Mon, 12 Apr 2021 22:27:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFD32BE04F;
 Mon, 12 Apr 2021 22:27:04 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.82.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 22:27:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 2/2] KVM: PPC: Book3S HV: Provide a more accurate
 MAX_VCPU_ID in P9
Date: Mon, 12 Apr 2021 19:26:56 -0300
Message-Id: <20210412222656.3466987-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210412222656.3466987-1-farosas@linux.ibm.com>
References: <20210412222656.3466987-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oCn6YlPUZtVWsAbTJdrY0kke-9Qv5__6
X-Proofpoint-ORIG-GUID: oCn6YlPUZtVWsAbTJdrY0kke-9Qv5__6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_11:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=967 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120142
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The KVM_CAP_MAX_VCPU_ID capability was added by commit 0b1b1dfd52a6
("kvm: introduce KVM_MAX_VCPU_ID") to allow for vcpu ids larger than
KVM_MAX_VCPU in powerpc.

For a P9 host we depend on the guest VSMT value to know what is the
maximum number of vcpu id we can support:

kvmppc_core_vcpu_create_hv:
    (...)
    if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-->         if (id >= (KVM_MAX_VCPUS * kvm->arch.emul_smt_mode)) {
                    pr_devel("KVM: VCPU ID too high\n");
                    core = KVM_MAX_VCORES;
            } else {
                    BUG_ON(kvm->arch.smt_mode != 1);
                    core = kvmppc_pack_vcpu_id(kvm, id);
            }
    } else {
            core = id / kvm->arch.smt_mode;
    }

which means that the value being returned by the capability today for
a given guest is potentially way larger than what we actually support:

\#define KVM_MAX_VCPU_ID (MAX_SMT_THREADS * KVM_MAX_VCORES)

If the capability is queried before userspace enables the
KVM_CAP_PPC_SMT ioctl there is not much we can do, but if the emulated
smt mode is already known we could provide a more accurate value.

The only practical effect of this change today is to make the
kvm_create_max_vcpus test pass for powerpc. The QEMU spapr machine has
a lower max vcpu than what KVM allows so even KVM_MAX_VCPU is not
reached.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

---
I see that for ppc, QEMU uses the capability after enabling
KVM_CAP_PPC_SMT, so we could change QEMU to issue the check extension
on the vm fd so that it would get the more accurate value.
---
 arch/powerpc/kvm/powerpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index a2a68a958fa0..95c9f47cc1b3 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -649,7 +649,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = KVM_MAX_VCPUS;
 		break;
 	case KVM_CAP_MAX_VCPU_ID:
-		r = KVM_MAX_VCPU_ID;
+		if (hv_enabled && cpu_has_feature(CPU_FTR_ARCH_300))
+			r = KVM_MAX_VCPUS * ((kvm) ? kvm->arch.emul_smt_mode : 1);
+		else
+			r = KVM_MAX_VCPU_ID;
 		break;
 #ifdef CONFIG_PPC_BOOK3S_64
 	case KVM_CAP_PPC_GET_SMMU_INFO:
-- 
2.29.2

