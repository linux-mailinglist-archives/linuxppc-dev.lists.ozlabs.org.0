Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F306A18A1F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 18:50:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jHd51YKZzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 04:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jHTG34jzzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:43:45 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IHWLd9007161
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:43 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu71a50y8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:43 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 18 Mar 2020 17:43:40 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 17:43:38 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IHhbJj55509100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 17:43:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C82A405B;
 Wed, 18 Mar 2020 17:43:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2293DA4054;
 Wed, 18 Mar 2020 17:43:37 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.41.106])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 17:43:37 +0000 (GMT)
Subject: [PATCH 2/3] KVM: PPC: Move kvmppc_mmu_init() PR KVM
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Wed, 18 Mar 2020 18:43:36 +0100
In-Reply-To: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
References: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031817-4275-0000-0000-000003AE9102
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031817-4276-0000-0000-000038C3BD5B
Message-Id: <158455341635.178873.1065508736749938881.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1034 bulkscore=0 mlxlogscore=954
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180076
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
Cc: kvm-ppc@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is only relevant to PR KVM. Make it obvious by moving the
function declaration to the Book3s header and rename it with
a _pr suffix.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/include/asm/kvm_ppc.h    |    1 -
 arch/powerpc/kvm/book3s.h             |    1 +
 arch/powerpc/kvm/book3s_32_mmu_host.c |    2 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c |    2 +-
 arch/powerpc/kvm/book3s_pr.c          |    2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bc2494e5710a..399a657c1bf3 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -108,7 +108,6 @@ extern void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 gvaddr, gpa_t gpaddr,
 extern void kvmppc_mmu_priv_switch(struct kvm_vcpu *vcpu, int usermode);
 extern void kvmppc_mmu_switch_pid(struct kvm_vcpu *vcpu, u32 pid);
 extern void kvmppc_mmu_destroy(struct kvm_vcpu *vcpu);
-extern int kvmppc_mmu_init(struct kvm_vcpu *vcpu);
 extern int kvmppc_mmu_dtlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
 extern int kvmppc_mmu_itlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
 extern gpa_t kvmppc_mmu_xlate(struct kvm_vcpu *vcpu, unsigned int gtlb_index,
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 3a4613985949..eae259ee49af 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -16,6 +16,7 @@ extern int kvm_age_hva_hv(struct kvm *kvm, unsigned long start,
 extern int kvm_test_age_hva_hv(struct kvm *kvm, unsigned long hva);
 extern void kvm_set_spte_hva_hv(struct kvm *kvm, unsigned long hva, pte_t pte);
 
+extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
 extern void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu,
 				     unsigned int inst, int *advance);
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index d4cb3bcf41b6..e8e7b2c530d1 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -356,7 +356,7 @@ void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu)
 /* From mm/mmu_context_hash32.c */
 #define CTX_TO_VSID(c, id)	((((c) * (897 * 16)) + (id * 0x111)) & 0xffffff)
 
-int kvmppc_mmu_init(struct kvm_vcpu *vcpu)
+int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
 	int err;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index 044dd49eeb9d..e452158a18d7 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -384,7 +384,7 @@ void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu)
 	__destroy_context(to_book3s(vcpu)->context_id[0]);
 }
 
-int kvmppc_mmu_init(struct kvm_vcpu *vcpu)
+int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
 	int err;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index db3a87319642..28e63a68a3dc 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1795,7 +1795,7 @@ static int kvmppc_core_vcpu_create_pr(struct kvm_vcpu *vcpu)
 
 	vcpu->arch.shadow_msr = MSR_USER64 & ~MSR_LE;
 
-	err = kvmppc_mmu_init(vcpu);
+	err = kvmppc_mmu_init_pr(vcpu);
 	if (err < 0)
 		goto free_shared_page;
 

