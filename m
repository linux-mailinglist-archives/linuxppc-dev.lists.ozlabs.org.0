Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 993AB1FEE8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 11:24:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nc2B181NzDrC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 19:24:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nbxK67N4zDrDn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 19:19:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05I90j3m029730; Thu, 18 Jun 2020 05:19:39 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31r4hm1xqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 05:19:39 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05I9B7Ri005658;
 Thu, 18 Jun 2020 09:19:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 31r0u9g57s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 09:19:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05I9JYoh56557714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 09:19:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E904A42045;
 Thu, 18 Jun 2020 09:19:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35C842042;
 Thu, 18 Jun 2020 09:19:30 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.71.42])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 09:19:30 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] KVM: PPC: Book3S HV: Fix function definition in
 book3s_hv_uvmem.c
Date: Thu, 18 Jun 2020 02:19:02 -0700
Message-Id: <1592471945-24786-2-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592471945-24786-1-git-send-email-linuxram@us.ibm.com>
References: <1592471945-24786-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_04:2020-06-17,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 cotscore=-2147483648
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180065
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

Without this fix, git is confused. It generates wrong
function context for code changes in subsequent patches.
Weird, but true.

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
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index ad950f89..3599aaa 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -369,8 +369,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  * Alloc a PFN from private device memory pool and copy page from normal
  * memory to secure memory using UV_PAGE_IN uvcall.
  */
-static int
-kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
+static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 		   unsigned long end, unsigned long gpa, struct kvm *kvm,
 		   unsigned long page_shift, bool *downgrade)
 {
@@ -437,8 +436,8 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  * In the former case, uses dev_pagemap_ops.migrate_to_ram handler
  * to unmap the device page from QEMU's page tables.
  */
-static unsigned long
-kvmppc_share_page(struct kvm *kvm, unsigned long gpa, unsigned long page_shift)
+static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
+		unsigned long page_shift)
 {
 
 	int ret = H_PARAMETER;
@@ -487,9 +486,9 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  * H_PAGE_IN_SHARED flag makes the page shared which means that the same
  * memory in is visible from both UV and HV.
  */
-unsigned long
-kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
-		     unsigned long flags, unsigned long page_shift)
+unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
+		unsigned long flags,
+		unsigned long page_shift)
 {
 	bool downgrade = false;
 	unsigned long start, end;
@@ -546,10 +545,10 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  * Provision a new page on HV side and copy over the contents
  * from secure memory using UV_PAGE_OUT uvcall.
  */
-static int
-kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
-		    unsigned long end, unsigned long page_shift,
-		    struct kvm *kvm, unsigned long gpa)
+static int kvmppc_svm_page_out(struct vm_area_struct *vma,
+		unsigned long start,
+		unsigned long end, unsigned long page_shift,
+		struct kvm *kvm, unsigned long gpa)
 {
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
-- 
1.8.3.1

