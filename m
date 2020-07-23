Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3A22B75D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 22:16:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCNrr0xgwzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 06:16:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCNg72RZDzDrS5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 06:08:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NK1bud024010; Thu, 23 Jul 2020 16:07:58 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fe3dnc9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 16:07:57 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NJod9w005289;
 Thu, 23 Jul 2020 20:07:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32brq83j74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 20:07:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NK7qo564422104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 20:07:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B004C040;
 Thu, 23 Jul 2020 20:07:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF8574C044;
 Thu, 23 Jul 2020 20:07:48 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.150.76])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 20:07:48 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 3/7] KVM: PPC: Book3S HV: track the state GFNs associated
 with secure VMs
Date: Thu, 23 Jul 2020 13:07:20 -0700
Message-Id: <1595534844-16188-4-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_09:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 suspectscore=2 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230142
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
Cc: ldufour@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During the life of SVM, its GFNs transition through normal, secure and
shared states. Since the kernel does not track GFNs that are shared, it
is not possible to disambiguate a shared GFN from a GFN whose PFN has
not yet been migrated to a secure-PFN. Also it is not possible to
disambiguate a secure-GFN from a GFN whose GFN has been pagedout from
the ultravisor.

The ability to identify the state of a GFN is needed to skip migration
of its PFN to secure-PFN during ESM transition.

The code is re-organized to track the states of a GFN as explained
below.

************************************************************************
 1. States of a GFN
    ---------------
 The GFN can be in one of the following states.

 (a) Secure - The GFN is secure. The GFN is associated with
 	a Secure VM, the contents of the GFN is not accessible
 	to the Hypervisor.  This GFN can be backed by a secure-PFN,
 	or can be backed by a normal-PFN with contents encrypted.
 	The former is true when the GFN is paged-in into the
 	ultravisor. The latter is true when the GFN is paged-out
 	of the ultravisor.

 (b) Shared - The GFN is shared. The GFN is associated with a
 	a secure VM. The contents of the GFN is accessible to
 	Hypervisor. This GFN is backed by a normal-PFN and its
 	content is un-encrypted.

 (c) Normal - The GFN is a normal. The GFN is associated with
 	a normal VM. The contents of the GFN is accesible to
 	the Hypervisor. Its content is never encrypted.

 2. States of a VM.
    ---------------

 (a) Normal VM:  A VM whose contents are always accessible to
 	the hypervisor.  All its GFNs are normal-GFNs.

 (b) Secure VM: A VM whose contents are not accessible to the
 	hypervisor without the VM's consent.  Its GFNs are
 	either Shared-GFN or Secure-GFNs.

 (c) Transient VM: A Normal VM that is transitioning to secure VM.
 	The transition starts on successful return of
 	H_SVM_INIT_START, and ends on successful return
 	of H_SVM_INIT_DONE. This transient VM, can have GFNs
 	in any of the three states; i.e Secure-GFN, Shared-GFN,
 	and Normal-GFN.	The VM never executes in this state
 	in supervisor-mode.

 3. Memory slot State.
    ------------------
  	The state of a memory slot mirrors the state of the
  	VM the memory slot is associated with.

 4. VM State transition.
    --------------------

  A VM always starts in Normal Mode.

  H_SVM_INIT_START moves the VM into transient state. During this
  time the Ultravisor may request some of its GFNs to be shared or
  secured. So its GFNs can be in one of the three GFN states.

  H_SVM_INIT_DONE moves the VM entirely from transient state to
  secure-state. At this point any left-over normal-GFNs are
  transitioned to Secure-GFN.

  H_SVM_INIT_ABORT moves the transient VM back to normal VM.
  All its GFNs are moved to Normal-GFNs.

  UV_TERMINATE transitions the secure-VM back to normal-VM. All
  the secure-GFN and shared-GFNs are tranistioned to normal-GFN
  Note: The contents of the normal-GFN is undefined at this point.

 5. GFN state implementation:
    -------------------------

 Secure GFN is associated with a secure-PFN; also called uvmem_pfn,
 when the GFN is paged-in. Its pfn[] has KVMPPC_GFN_UVMEM_PFN flag
 set, and contains the value of the secure-PFN.
 It is associated with a normal-PFN; also called mem_pfn, when
 the GFN is pagedout. Its pfn[] has KVMPPC_GFN_MEM_PFN flag set.
 The value of the normal-PFN is not tracked.

 Shared GFN is associated with a normal-PFN. Its pfn[] has
 KVMPPC_UVMEM_SHARED_PFN flag set. The value of the normal-PFN
 is not tracked.

 Normal GFN is associated with normal-PFN. Its pfn[] has
 no flag set. The value of the normal-PFN is not tracked.

 6. Life cycle of a GFN
    --------------------
 --------------------------------------------------------------
 |        |     Share  |  Unshare | SVM       |H_SVM_INIT_DONE|
 |        |operation   |operation | abort/    |               |
 |        |            |          | terminate |               |
 -------------------------------------------------------------
 |        |            |          |           |               |
 | Secure |     Shared | Secure   |Normal     |Secure         |
 |        |            |          |           |               |
 | Shared |     Shared | Secure   |Normal     |Shared         |
 |        |            |          |           |               |
 | Normal |     Shared | Secure   |Normal     |Secure         |
 --------------------------------------------------------------

 7. Life cycle of a VM
    --------------------
 --------------------------------------------------------------------
 |         |  start    |  H_SVM_  |H_SVM_   |H_SVM_     |UV_SVM_    |
 |         |  VM       |INIT_START|INIT_DONE|INIT_ABORT |TERMINATE  |
 |         |           |          |         |           |           |
 --------- ----------------------------------------------------------
 |         |           |          |         |           |           |
 | Normal  | Normal    | Transient|Error    |Error      |Normal     |
 |         |           |          |         |           |           |
 | Secure  |   Error   | Error    |Error    |Error      |Normal     |
 |         |           |          |         |           |           |
 |Transient|   N/A     | Error    |Secure   |Normal     |Normal     |
 --------------------------------------------------------------------

************************************************************************

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 191 +++++++++++++++++++++++++++++++++----
 1 file changed, 172 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 533b608..1b2b029 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -98,7 +98,127 @@
 static unsigned long *kvmppc_uvmem_bitmap;
 static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
 
-#define KVMPPC_UVMEM_PFN	(1UL << 63)
+/*
+ * States of a GFN
+ * ---------------
+ * The GFN can be in one of the following states.
+ *
+ * (a) Secure - The GFN is secure. The GFN is associated with
+ *	a Secure VM, the contents of the GFN is not accessible
+ *	to the Hypervisor.  This GFN can be backed by a secure-PFN,
+ *	or can be backed by a normal-PFN with contents encrypted.
+ *	The former is true when the GFN is paged-in into the
+ *	ultravisor. The latter is true when the GFN is paged-out
+ *	of the ultravisor.
+ *
+ * (b) Shared - The GFN is shared. The GFN is associated with a
+ *	a secure VM. The contents of the GFN is accessible to
+ *	Hypervisor. This GFN is backed by a normal-PFN and its
+ *	content is un-encrypted.
+ *
+ * (c) Normal - The GFN is a normal. The GFN is associated with
+ *	a normal VM. The contents of the GFN is accesible to
+ *	the Hypervisor. Its content is never encrypted.
+ *
+ * States of a VM.
+ * ---------------
+ *
+ * Normal VM:  A VM whose contents are always accessible to
+ *	the hypervisor.  All its GFNs are normal-GFNs.
+ *
+ * Secure VM: A VM whose contents are not accessible to the
+ *	hypervisor without the VM's consent.  Its GFNs are
+ *	either Shared-GFN or Secure-GFNs.
+ *
+ * Transient VM: A Normal VM that is transitioning to secure VM.
+ *	The transition starts on successful return of
+ *	H_SVM_INIT_START, and ends on successful return
+ *	of H_SVM_INIT_DONE. This transient VM, can have GFNs
+ *	in any of the three states; i.e Secure-GFN, Shared-GFN,
+ *	and Normal-GFN.	The VM never executes in this state
+ *	in supervisor-mode.
+ *
+ * Memory slot State.
+ * -----------------------------
+ *	The state of a memory slot mirrors the state of the
+ *	VM the memory slot is associated with.
+ *
+ * VM State transition.
+ * --------------------
+ *
+ *  A VM always starts in Normal Mode.
+ *
+ *  H_SVM_INIT_START moves the VM into transient state. During this
+ *  time the Ultravisor may request some of its GFNs to be shared or
+ *  secured. So its GFNs can be in one of the three GFN states.
+ *
+ *  H_SVM_INIT_DONE moves the VM entirely from transient state to
+ *  secure-state. At this point any left-over normal-GFNs are
+ *  transitioned to Secure-GFN.
+ *
+ *  H_SVM_INIT_ABORT moves the transient VM back to normal VM.
+ *  All its GFNs are moved to Normal-GFNs.
+ *
+ *  UV_TERMINATE transitions the secure-VM back to normal-VM. All
+ *  the secure-GFN and shared-GFNs are tranistioned to normal-GFN
+ *  Note: The contents of the normal-GFN is undefined at this point.
+ *
+ * GFN state implementation:
+ * -------------------------
+ *
+ * Secure GFN is associated with a secure-PFN; also called uvmem_pfn,
+ * when the GFN is paged-in. Its pfn[] has KVMPPC_GFN_UVMEM_PFN flag
+ * set, and contains the value of the secure-PFN.
+ * It is associated with a normal-PFN; also called mem_pfn, when
+ * the GFN is pagedout. Its pfn[] has KVMPPC_GFN_MEM_PFN flag set.
+ * The value of the normal-PFN is not tracked.
+ *
+ * Shared GFN is associated with a normal-PFN. Its pfn[] has
+ * KVMPPC_UVMEM_SHARED_PFN flag set. The value of the normal-PFN
+ * is not tracked.
+ *
+ * Normal GFN is associated with normal-PFN. Its pfn[] has
+ * no flag set. The value of the normal-PFN is not tracked.
+ *
+ * Life cycle of a GFN
+ * --------------------
+ *
+ * --------------------------------------------------------------
+ * |        |     Share  |  Unshare | SVM       |H_SVM_INIT_DONE|
+ * |        |operation   |operation | abort/    |               |
+ * |        |            |          | terminate |               |
+ * -------------------------------------------------------------
+ * |        |            |          |           |               |
+ * | Secure |     Shared | Secure   |Normal     |Secure         |
+ * |        |            |          |           |               |
+ * | Shared |     Shared | Secure   |Normal     |Shared         |
+ * |        |            |          |           |               |
+ * | Normal |     Shared | Secure   |Normal     |Secure         |
+ * --------------------------------------------------------------
+ *
+ * Life cycle of a VM
+ * --------------------
+ *
+ * --------------------------------------------------------------------
+ * |         |  start    |  H_SVM_  |H_SVM_   |H_SVM_     |UV_SVM_    |
+ * |         |  VM       |INIT_START|INIT_DONE|INIT_ABORT |TERMINATE  |
+ * |         |           |          |         |           |           |
+ * --------- ----------------------------------------------------------
+ * |         |           |          |         |           |           |
+ * | Normal  | Normal    | Transient|Error    |Error      |Normal     |
+ * |         |           |          |         |           |           |
+ * | Secure  |   Error   | Error    |Error    |Error      |Normal     |
+ * |         |           |          |         |           |           |
+ * |Transient|   N/A     | Error    |Secure   |Normal     |Normal     |
+ * --------------------------------------------------------------------
+ */
+
+#define KVMPPC_GFN_UVMEM_PFN	(1UL << 63)
+#define KVMPPC_GFN_MEM_PFN	(1UL << 62)
+#define KVMPPC_GFN_SHARED	(1UL << 61)
+#define KVMPPC_GFN_SECURE	(KVMPPC_GFN_UVMEM_PFN | KVMPPC_GFN_MEM_PFN)
+#define KVMPPC_GFN_FLAG_MASK	(KVMPPC_GFN_SECURE | KVMPPC_GFN_SHARED)
+#define KVMPPC_GFN_PFN_MASK	(~KVMPPC_GFN_FLAG_MASK)
 
 struct kvmppc_uvmem_slot {
 	struct list_head list;
@@ -106,11 +226,11 @@ struct kvmppc_uvmem_slot {
 	unsigned long base_pfn;
 	unsigned long *pfns;
 };
-
 struct kvmppc_uvmem_page_pvt {
 	struct kvm *kvm;
 	unsigned long gpa;
 	bool skip_page_out;
+	bool remove_gfn;
 };
 
 bool kvmppc_uvmem_available(void)
@@ -163,8 +283,8 @@ void kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot)
 	mutex_unlock(&kvm->arch.uvmem_lock);
 }
 
-static void kvmppc_uvmem_pfn_insert(unsigned long gfn, unsigned long uvmem_pfn,
-				    struct kvm *kvm)
+static void kvmppc_mark_gfn(unsigned long gfn, struct kvm *kvm,
+			unsigned long flag, unsigned long uvmem_pfn)
 {
 	struct kvmppc_uvmem_slot *p;
 
@@ -172,24 +292,41 @@ static void kvmppc_uvmem_pfn_insert(unsigned long gfn, unsigned long uvmem_pfn,
 		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
 			unsigned long index = gfn - p->base_pfn;
 
-			p->pfns[index] = uvmem_pfn | KVMPPC_UVMEM_PFN;
+			if (flag == KVMPPC_GFN_UVMEM_PFN)
+				p->pfns[index] = uvmem_pfn | flag;
+			else
+				p->pfns[index] = flag;
 			return;
 		}
 	}
 }
 
-static void kvmppc_uvmem_pfn_remove(unsigned long gfn, struct kvm *kvm)
+/* mark the GFN as secure-GFN associated with @uvmem pfn device-PFN. */
+static void kvmppc_gfn_secure_uvmem_pfn(unsigned long gfn,
+			unsigned long uvmem_pfn, struct kvm *kvm)
 {
-	struct kvmppc_uvmem_slot *p;
+	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_UVMEM_PFN, uvmem_pfn);
+}
 
-	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
-		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
-			p->pfns[gfn - p->base_pfn] = 0;
-			return;
-		}
-	}
+/* mark the GFN as secure-GFN associated with a memory-PFN. */
+static void kvmppc_gfn_secure_mem_pfn(unsigned long gfn, struct kvm *kvm)
+{
+	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_MEM_PFN, 0);
 }
 
+/* mark the GFN as a shared GFN. */
+static void kvmppc_gfn_shared(unsigned long gfn, struct kvm *kvm)
+{
+	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_SHARED, 0);
+}
+
+/* mark the GFN as a non-existent GFN. */
+static void kvmppc_gfn_remove(unsigned long gfn, struct kvm *kvm)
+{
+	kvmppc_mark_gfn(gfn, kvm, 0, 0);
+}
+
+/* return true, if the GFN is a secure-GFN backed by a secure-PFN */
 static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 				    unsigned long *uvmem_pfn)
 {
@@ -199,10 +336,10 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
 			unsigned long index = gfn - p->base_pfn;
 
-			if (p->pfns[index] & KVMPPC_UVMEM_PFN) {
+			if (p->pfns[index] & KVMPPC_GFN_UVMEM_PFN) {
 				if (uvmem_pfn)
 					*uvmem_pfn = p->pfns[index] &
-						     ~KVMPPC_UVMEM_PFN;
+						     KVMPPC_GFN_PFN_MASK;
 				return true;
 			} else
 				return false;
@@ -354,6 +491,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 
 		mutex_lock(&kvm->arch.uvmem_lock);
 		if (!kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+			kvmppc_gfn_remove(gfn, kvm);
 			mutex_unlock(&kvm->arch.uvmem_lock);
 			continue;
 		}
@@ -361,6 +499,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = skip_page_out;
+		pvt->remove_gfn = true;
 		mutex_unlock(&kvm->arch.uvmem_lock);
 
 		pfn = gfn_to_pfn(kvm, gfn);
@@ -430,7 +569,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 		goto out_clear;
 
 	uvmem_pfn = bit + pfn_first;
-	kvmppc_uvmem_pfn_insert(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
+	kvmppc_gfn_secure_uvmem_pfn(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
 
 	pvt->gpa = gpa;
 	pvt->kvm = kvm;
@@ -525,6 +664,11 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
+		/*
+		 * do not drop the GFN. It is a valid GFN
+		 * that is transitioned to a shared GFN.
+		 */
+		pvt->remove_gfn = false;
 	}
 
 retry:
@@ -538,12 +682,16 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
+		pvt->remove_gfn = false; /* it continues to be a valid GFN */
 		kvm_release_pfn_clean(pfn);
 		goto retry;
 	}
 
-	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0, page_shift))
+	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+				page_shift)) {
+		kvmppc_gfn_shared(gfn, kvm);
 		ret = H_SUCCESS;
+	}
 	kvm_release_pfn_clean(pfn);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
@@ -599,6 +747,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 
 	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift))
 		ret = H_SUCCESS;
+
 out_unlock:
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
@@ -707,7 +856,8 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 /*
  * Release the device PFN back to the pool
  *
- * Gets called when secure page becomes a normal page during H_SVM_PAGE_OUT.
+ * Gets called when secure GFN tranistions from a secure-PFN
+ * to a normal PFN during H_SVM_PAGE_OUT.
  * Gets called with kvm->arch.uvmem_lock held.
  */
 static void kvmppc_uvmem_page_free(struct page *page)
@@ -722,7 +872,10 @@ static void kvmppc_uvmem_page_free(struct page *page)
 
 	pvt = page->zone_device_data;
 	page->zone_device_data = NULL;
-	kvmppc_uvmem_pfn_remove(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
+	if (pvt->remove_gfn)
+		kvmppc_gfn_remove(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
+	else
+		kvmppc_gfn_secure_mem_pfn(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
 	kfree(pvt);
 }
 
-- 
1.8.3.1

