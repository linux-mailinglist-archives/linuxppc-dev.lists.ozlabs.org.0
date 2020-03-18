Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D797918A1FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 18:52:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jHgH1My5zDqGN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 04:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jHTN0JdrzDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:43:51 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IHXrsv006547
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7fs3h9f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:48 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 18 Mar 2020 17:43:47 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 17:43:44 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02IHggrx42205618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 17:42:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 653405204E;
 Wed, 18 Mar 2020 17:43:43 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.41.106])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 274E752052;
 Wed, 18 Mar 2020 17:43:43 +0000 (GMT)
Subject: [PATCH 3/3] KVM: PPC: Kill kvmppc_ops::mmu_destroy() and
 kvmppc_mmu_destroy()
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Wed, 18 Mar 2020 18:43:42 +0100
In-Reply-To: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
References: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031817-0020-0000-0000-000003B6A125
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031817-0021-0000-0000-0000220F0BCC
Message-Id: <158455342241.178873.4247147895547739532.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=718 suspectscore=2 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
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

These are only used by HV KVM and BookE, and in both cases they are
nops.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/include/asm/kvm_ppc.h |    2 --
 arch/powerpc/kvm/book3s.c          |    5 -----
 arch/powerpc/kvm/book3s_hv.c       |    6 ------
 arch/powerpc/kvm/book3s_pr.c       |    1 -
 arch/powerpc/kvm/booke.c           |    5 -----
 arch/powerpc/kvm/booke.h           |    2 --
 arch/powerpc/kvm/e500.c            |    1 -
 arch/powerpc/kvm/e500_mmu.c        |    4 ----
 arch/powerpc/kvm/e500mc.c          |    1 -
 9 files changed, 27 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 399a657c1bf3..be627367e3bd 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -107,7 +107,6 @@ extern void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 gvaddr, gpa_t gpaddr,
                            unsigned int gtlb_idx);
 extern void kvmppc_mmu_priv_switch(struct kvm_vcpu *vcpu, int usermode);
 extern void kvmppc_mmu_switch_pid(struct kvm_vcpu *vcpu, u32 pid);
-extern void kvmppc_mmu_destroy(struct kvm_vcpu *vcpu);
 extern int kvmppc_mmu_dtlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
 extern int kvmppc_mmu_itlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
 extern gpa_t kvmppc_mmu_xlate(struct kvm_vcpu *vcpu, unsigned int gtlb_index,
@@ -290,7 +289,6 @@ struct kvmppc_ops {
 	int (*age_hva)(struct kvm *kvm, unsigned long start, unsigned long end);
 	int (*test_age_hva)(struct kvm *kvm, unsigned long hva);
 	void (*set_spte_hva)(struct kvm *kvm, unsigned long hva, pte_t pte);
-	void (*mmu_destroy)(struct kvm_vcpu *vcpu);
 	void (*free_memslot)(struct kvm_memory_slot *free,
 			     struct kvm_memory_slot *dont);
 	int (*create_memslot)(struct kvm_memory_slot *slot,
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index d07a8e12fa15..19ccb019eb3b 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -858,11 +858,6 @@ int kvm_set_spte_hva(struct kvm *kvm, unsigned long hva, pte_t pte)
 	return 0;
 }
 
-void kvmppc_mmu_destroy(struct kvm_vcpu *vcpu)
-{
-	vcpu->kvm->arch.kvm_ops->mmu_destroy(vcpu);
-}
-
 int kvmppc_core_init_vm(struct kvm *kvm)
 {
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2cefd071b848..48d0bce16164 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4558,11 +4558,6 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
 	}
 }
 
-static void kvmppc_mmu_destroy_hv(struct kvm_vcpu *vcpu)
-{
-	return;
-}
-
 void kvmppc_setup_partition_table(struct kvm *kvm)
 {
 	unsigned long dw0, dw1;
@@ -5526,7 +5521,6 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.age_hva  = kvm_age_hva_hv,
 	.test_age_hva = kvm_test_age_hva_hv,
 	.set_spte_hva = kvm_set_spte_hva_hv,
-	.mmu_destroy  = kvmppc_mmu_destroy_hv,
 	.free_memslot = kvmppc_core_free_memslot_hv,
 	.create_memslot = kvmppc_core_create_memslot_hv,
 	.init_vm =  kvmppc_core_init_vm_hv,
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 28e63a68a3dc..5cc88203f435 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2098,7 +2098,6 @@ static struct kvmppc_ops kvm_ops_pr = {
 	.age_hva  = kvm_age_hva_pr,
 	.test_age_hva = kvm_test_age_hva_pr,
 	.set_spte_hva = kvm_set_spte_hva_pr,
-	.mmu_destroy  = kvmppc_mmu_destroy_pr,
 	.free_memslot = kvmppc_core_free_memslot_pr,
 	.create_memslot = kvmppc_core_create_memslot_pr,
 	.init_vm = kvmppc_core_init_vm_pr,
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 7b27604adadf..8a516d947405 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -2074,11 +2074,6 @@ void kvmppc_booke_vcpu_put(struct kvm_vcpu *vcpu)
 	kvmppc_clear_dbsr();
 }
 
-void kvmppc_mmu_destroy(struct kvm_vcpu *vcpu)
-{
-	vcpu->kvm->arch.kvm_ops->mmu_destroy(vcpu);
-}
-
 int kvmppc_core_init_vm(struct kvm *kvm)
 {
 	return kvm->arch.kvm_ops->init_vm(kvm);
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index 9d3169fbce55..65b4d337d337 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -94,7 +94,6 @@ enum int_class {
 
 void kvmppc_set_pending_interrupt(struct kvm_vcpu *vcpu, enum int_class type);
 
-extern void kvmppc_mmu_destroy_e500(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
 				       struct kvm_vcpu *vcpu,
 				       unsigned int inst, int *advance);
@@ -102,7 +101,6 @@ extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong *spr_val);
-extern void kvmppc_mmu_destroy_e500(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
 				       struct kvm_vcpu *vcpu,
 				       unsigned int inst, int *advance);
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index f2b4feaff6d2..7e8b69015d20 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -490,7 +490,6 @@ static struct kvmppc_ops kvm_ops_e500 = {
 	.vcpu_put    = kvmppc_core_vcpu_put_e500,
 	.vcpu_create = kvmppc_core_vcpu_create_e500,
 	.vcpu_free   = kvmppc_core_vcpu_free_e500,
-	.mmu_destroy  = kvmppc_mmu_destroy_e500,
 	.init_vm = kvmppc_core_init_vm_e500,
 	.destroy_vm = kvmppc_core_destroy_vm_e500,
 	.emulate_op = kvmppc_core_emulate_op_e500,
diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index 2d910b87e441..e131fbecdcc4 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -533,10 +533,6 @@ gpa_t kvmppc_mmu_xlate(struct kvm_vcpu *vcpu, unsigned int index,
 	return get_tlb_raddr(gtlbe) | (eaddr & pgmask);
 }
 
-void kvmppc_mmu_destroy_e500(struct kvm_vcpu *vcpu)
-{
-}
-
 /*****************************************/
 
 static void free_gtlb(struct kvmppc_vcpu_e500 *vcpu_e500)
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index e6b06cb2b92c..1c189b5aadcc 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -376,7 +376,6 @@ static struct kvmppc_ops kvm_ops_e500mc = {
 	.vcpu_put    = kvmppc_core_vcpu_put_e500mc,
 	.vcpu_create = kvmppc_core_vcpu_create_e500mc,
 	.vcpu_free   = kvmppc_core_vcpu_free_e500mc,
-	.mmu_destroy  = kvmppc_mmu_destroy_e500,
 	.init_vm = kvmppc_core_init_vm_e500mc,
 	.destroy_vm = kvmppc_core_destroy_vm_e500mc,
 	.emulate_op = kvmppc_core_emulate_op_e500,

