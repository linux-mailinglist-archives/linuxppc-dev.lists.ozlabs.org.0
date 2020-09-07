Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D025F3F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 09:27:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlKcd6PqqzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 17:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f0RNSh/q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlKZV2ZCBzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 17:25:53 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08773Vgl011992; Mon, 7 Sep 2020 03:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OJnNOq+oby8aRLHI0Gsl4COqtZxElFM6BmGCcqNgiOs=;
 b=f0RNSh/qXlJ34K8Iuj22cVWKNPPt2D9+U9CeugXPQZWCLLjGqxy7lGYjXNDKbkP+SdiV
 LLh3VzPEmqwM1SqzjgST/c92twVJoFq00pO9EtIxaE+HlGsSnES6ICjLWVWFoKv2JNLU
 bieLZQ5D4xRUulY5hMrnwTXqZ6tnlTRsdyAqVHSjHU6Ao8Y3Fw0tGdzE8DKQrxvdgeh+
 uN9LwIBoXsbKrILuD7zxbNY6X1SIJm+BwCga4oOvtLPRj7LJPD6aZzi8fRG+9FIdm9Vy
 4EdHSqy8svy+PO7/hfEcvpJ3TMbR+LxB5H3h9BJLWH0z0aS/snKmodpmEUz1N+VCOPfu VQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33dd78cv8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 03:25:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0877LZhu022859;
 Mon, 7 Sep 2020 07:25:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 33c2a8e85d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 07:25:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0877PhuJ66650534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Sep 2020 07:25:43 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C29906E05B;
 Mon,  7 Sep 2020 07:25:43 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 617116E04C;
 Mon,  7 Sep 2020 07:25:42 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.38.157])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Sep 2020 07:25:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerepc/book3s64/hash: Align start/end address correctly
 with bolt mapping
Date: Mon,  7 Sep 2020 12:55:39 +0530
Message-Id: <20200907072539.67310-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-07_01:2020-09-07,
 2020-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009070068
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This ensures we don't do a partial mapping of memory. With nvdimm, when
creating namespaces with size not aligned to 16MB, the kernel ends up partially
mapping the pages. This can result in kernel adding multiple hash page table
entries for the same range. A new namespace will result in
create_section_mapping() with start and end overlapping an already existing
bolted hash page table entry.

commit: 6acd7d5ef264 ("libnvdimm/namespace: Enforce memremap_compat_align()")
made sure that we always create namespaces aligned to 16MB. But we can do
better by avoiding mapping pages that are not aligned. This helps to catch
access to these partially mapped pages early.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 12 +++++++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c663e7ba801f..7185bc43b24f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -260,8 +260,12 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 	DBG("htab_bolt_mapping(%lx..%lx -> %lx (%lx,%d,%d)\n",
 	    vstart, vend, pstart, prot, psize, ssize);
 
-	for (vaddr = vstart, paddr = pstart; vaddr < vend;
-	     vaddr += step, paddr += step) {
+	/* Carefully map only the possible range */
+	vaddr = ALIGN(vstart, step);
+	paddr = ALIGN(pstart, step);
+	vend  = ALIGN_DOWN(vend, step);
+
+	for (; vaddr < vend; vaddr += step, paddr += step) {
 		unsigned long hash, hpteg;
 		unsigned long vsid = get_kernel_vsid(vaddr, ssize);
 		unsigned long vpn  = hpt_vpn(vaddr, vsid, ssize);
@@ -343,7 +347,9 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 	if (!mmu_hash_ops.hpte_removebolted)
 		return -ENODEV;
 
-	for (vaddr = vstart; vaddr < vend; vaddr += step) {
+	/* Unmap the full range specificied */
+	vaddr = ALIGN_DOWN(vstart, step);
+	for (;vaddr < vend; vaddr += step) {
 		rc = mmu_hash_ops.hpte_removebolted(vaddr, psize, ssize);
 		if (rc == -ENOENT) {
 			ret = -ENOENT;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index d5f0c10d752a..5c8adeb8c955 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -276,6 +276,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	int psize;
 
 	start = ALIGN(start, PAGE_SIZE);
+	end   = ALIGN_DOWN(end, PAGE_SIZE);
 	for (addr = start; addr < end; addr += mapping_size) {
 		unsigned long gap, previous_size;
 		int rc;
-- 
2.26.2

