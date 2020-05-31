Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D61E9506
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 04:36:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZMr7462XzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 12:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZMgL2jFCzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 12:28:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04V22kuK175310; Sat, 30 May 2020 22:28:38 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bkc112qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 May 2020 22:28:38 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04V2QGss026577;
 Sun, 31 May 2020 02:28:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 31bf480m7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 31 May 2020 02:28:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04V2SXFq58196016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 31 May 2020 02:28:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC054AE045;
 Sun, 31 May 2020 02:28:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7689AE051;
 Sun, 31 May 2020 02:28:30 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.70.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 31 May 2020 02:28:30 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 4/4] KVM: PPC: Book3S HV: migrate hot plugged memory
Date: Sat, 30 May 2020 19:27:51 -0700
Message-Id: <1590892071-25549-5-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-30_21:2020-05-28,
 2020-05-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 cotscore=-2147483648 suspectscore=2 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005310010
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
 bharata@linux.ibm.com, aneesh.kumar@linux.ibm.com, sukadev@linux.vnet.ibm.com,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Dufour <ldufour@linux.ibm.com>

When a memory slot is hot plugged to a SVM, GFNs associated with that
memory slot automatically default to secure GFN. Hence migrate the
PFNs associated with these GFNs to device-PFNs.

uv_migrate_mem_slot() is called to achieve that. It will not call
UV_PAGE_IN since this request is ignored by the Ultravisor.
NOTE: Ultravisor does not trust any page content provided by
the Hypervisor, ones the VM turns secure.

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
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
	(fixed merge conflicts. Modified the commit message)
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  4 ++++
 arch/powerpc/kvm/book3s_hv.c                | 11 +++++++----
 arch/powerpc/kvm/book3s_hv_uvmem.c          |  3 +--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index f0c5708..2ec2e5afb 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -23,6 +23,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 			     struct kvm *kvm, bool skip_page_out,
 			     bool purge_gfn);
+int uv_migrate_mem_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
@@ -78,5 +79,8 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 			struct kvm *kvm, bool skip_page_out,
 			bool purge_gfn) { }
+
+static int uv_migrate_mem_slot(struct kvm *kvm,
+		const struct kvm_memory_slot *memslot);
 #endif /* CONFIG_PPC_UV */
 #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4c62bfe..604d062 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4516,13 +4516,16 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
 	case KVM_MR_CREATE:
 		if (kvmppc_uvmem_slot_init(kvm, new))
 			return;
-		uv_register_mem_slot(kvm->arch.lpid,
-				     new->base_gfn << PAGE_SHIFT,
-				     new->npages * PAGE_SIZE,
-				     0, new->id);
+		if (uv_register_mem_slot(kvm->arch.lpid,
+					 new->base_gfn << PAGE_SHIFT,
+					 new->npages * PAGE_SIZE,
+					 0, new->id))
+			return;
+		uv_migrate_mem_slot(kvm, new);
 		break;
 	case KVM_MR_DELETE:
 		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
+		kvmppc_uvmem_drop_pages(old, kvm, true, true);
 		kvmppc_uvmem_slot_free(kvm, old);
 		break;
 	default:
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 36dda1d..1fa5f2a 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -377,8 +377,7 @@ static int kvmppc_svm_migrate_page(struct vm_area_struct *vma,
 	return ret;
 }
 
-static int uv_migrate_mem_slot(struct kvm *kvm,
-		const struct kvm_memory_slot *memslot)
+int uv_migrate_mem_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot)
 {
 	unsigned long gfn = memslot->base_gfn;
 	unsigned long end;
-- 
1.8.3.1

