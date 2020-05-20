Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C21DBBD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:45:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S0Wz1QbjzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S0Tq5DgHzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 03:43:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KHY4Nc081243; Wed, 20 May 2020 13:43:15 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312bg8rjrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 13:43:14 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04KHfGB7019054;
 Wed, 20 May 2020 17:43:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 313x2j1q2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 17:43:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04KHhADf1900976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 17:43:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3914111C04A;
 Wed, 20 May 2020 17:43:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8FF411C04C;
 Wed, 20 May 2020 17:43:09 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.145.151.133])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 17:43:09 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, paulus@samba.org
Subject: [PATCH v2] KVM: PPC: Book3S HV: relax check on H_SVM_INIT_ABORT
Date: Wed, 20 May 2020 19:43:08 +0200
Message-Id: <20200520174308.77820-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520193259.0b66db32@bahia.lan>
References: <20200520193259.0b66db32@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_13:2020-05-20,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 cotscore=-2147483648 malwarescore=0
 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200142
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
Cc: sukadev@linux.ibm.com, linuxram@us.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_*
Hcalls") added checks of secure bit of SRR1 to filter out the Hcall
reserved to the Ultravisor.

However, the Hcall H_SVM_INIT_ABORT is made by the Ultravisor passing the
context of the VM calling UV_ESM. This allows the Hypervisor to return to
the guest without going through the Ultravisor. Thus the Secure bit of SRR1
is not set in that particular case.

In the case a regular VM is calling H_SVM_INIT_ABORT, this hcall will be
filtered out in kvmppc_h_svm_init_abort() because kvm->arch.secure_guest is
not set in that case.

Fixes: 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_* Hcalls")
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 93493f0cbfe8..6ad1a3b14300 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1099,9 +1099,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 			ret = kvmppc_h_svm_init_done(vcpu->kvm);
 		break;
 	case H_SVM_INIT_ABORT:
-		ret = H_UNSUPPORTED;
-		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_init_abort(vcpu->kvm);
+		/*
+		 * Even if that call is made by the Ultravisor, the SSR1 value
+		 * is the guest context one, with the secure bit clear as it has
+		 * not yet been secured. So we can't check it here.
+		 */
+		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
 		break;
 
 	default:
-- 
2.26.2

