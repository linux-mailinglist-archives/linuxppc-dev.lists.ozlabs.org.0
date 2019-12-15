Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B111F55A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 03:13:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47b7Gg1CSczDqlV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 13:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47b7Dl6BSjzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 13:11:19 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBF21YEH038325; Sat, 14 Dec 2019 21:11:08 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvsgjh5r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Dec 2019 21:11:07 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBF2ApA3005742;
 Sun, 15 Dec 2019 02:11:12 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2wvqc5frkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 02:11:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBF2B6tq44106060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Dec 2019 02:11:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2C1AE05F;
 Sun, 15 Dec 2019 02:11:06 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31359AE064;
 Sun, 15 Dec 2019 02:11:06 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 15 Dec 2019 02:11:06 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 9C6CC2E210B; Sat, 14 Dec 2019 18:11:04 -0800 (PST)
Date: Sat, 14 Dec 2019 18:11:04 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH V3 1/2] KVM: PPC: Add skip_page_out parameter
Message-ID: <20191215021104.GA27378@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-14_07:2019-12-13,2019-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912150018
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
Cc: linuxram@us.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This patch is based on Bharata's v11 KVM patches for secure guests:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-November/200918.html
---

From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Date: Fri, 13 Dec 2019 15:06:16 -0600
Subject: [PATCH V3 1/2] KVM: PPC: Add skip_page_out parameter

Add 'skip_page_out' parameter to kvmppc_uvmem_drop_pages() which will
be needed in a follow-on patch that implements H_SVM_INIT_ABORT hcall.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_uvmem.h | 4 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c      | 2 +-
 arch/powerpc/kvm/book3s_hv.c                | 2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index 50204e228f16..3cf8425b9838 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -20,7 +20,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm);
+			     struct kvm *kvm, bool skip_page_out);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
@@ -69,6 +69,6 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 
 static inline void
 kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			struct kvm *kvm) { }
+			struct kvm *kvm, bool skip_page_out) { }
 #endif /* CONFIG_PPC_UV */
 #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index da857c8ba6e4..744dba98e5d1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1102,7 +1102,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	unsigned int shift;
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
-		kvmppc_uvmem_drop_pages(memslot, kvm);
+		kvmppc_uvmem_drop_pages(memslot, kvm, true);
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 597f4bfecf0e..66d5312be16b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5493,7 +5493,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 			continue;
 
 		kvm_for_each_memslot(memslot, slots) {
-			kvmppc_uvmem_drop_pages(memslot, kvm);
+			kvmppc_uvmem_drop_pages(memslot, kvm, true);
 			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
 		}
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index f24ac3cfb34c..9a5bbad7d87e 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -259,7 +259,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
  * QEMU page table with normal PTEs from newly allocated pages.
  */
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm)
+			     struct kvm *kvm, bool skip_page_out)
 {
 	int i;
 	struct kvmppc_uvmem_page_pvt *pvt;
@@ -277,7 +277,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
-		pvt->skip_page_out = true;
+		pvt->skip_page_out = skip_page_out;
 		mutex_unlock(&kvm->arch.uvmem_lock);
 
 		pfn = gfn_to_pfn(kvm, gfn);
-- 
2.17.2

