Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0231A68DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 14:47:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N6D946LnzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 22:47:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N65C2WW0zDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 22:41:19 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83CbaWU013146; Tue, 3 Sep 2019 08:41:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uspv6udce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:41:13 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x83CbbJD013204;
 Tue, 3 Sep 2019 08:41:13 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uspv6udc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:41:13 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x83CeqRf005358;
 Tue, 3 Sep 2019 12:41:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2uqgh6y20u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 12:41:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83CfBRV65601870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 12:41:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 135BBC6057;
 Tue,  3 Sep 2019 12:41:11 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCA30C6055;
 Tue,  3 Sep 2019 12:41:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.33.18])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 12:41:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [RFC PATCH 3/3] powerpc/mm/book3s64/radix: Flush the full mm even
 when need_flush_all is set
Date: Tue,  3 Sep 2019 18:10:54 +0530
Message-Id: <20190903124054.30611-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903124054.30611-1-aneesh.kumar@linux.ibm.com>
References: <20190903124054.30611-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030132
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the previous patch, we should now not be using need_flush_all for powerpc.
But then make sure we force a PID tlbie flush with RIC=2 if we ever
find need_flush_all set. Also don't reset it after a mmu gather flush

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 3 +--
 include/asm-generic/tlb.h            | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index dc395152e973..cfa708c99313 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -858,7 +858,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	 * that flushes the process table entry cache upon process teardown.
 	 * See the comment for radix in arch_exit_mmap().
 	 */
-	if (tlb->fullmm) {
+	if (tlb->fullmm || tlb->need_flush_all) {
 		__flush_all_mm(mm, true);
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
 		if (!tlb->freed_tables)
@@ -871,7 +871,6 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 		else
 			radix__flush_tlb_pwc_range_psize(mm, start, end, psize);
 	}
-	tlb->need_flush_all = 0;
 }
 
 static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 04c0644006fd..e64991142a8b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -428,7 +428,7 @@ static inline void tlb_change_page_size(struct mmu_gather *tlb,
 {
 #ifdef CONFIG_HAVE_MMU_GATHER_PAGE_SIZE
 	if (tlb->page_size && tlb->page_size != page_size) {
-		if (!tlb->fullmm)
+		if (!tlb->fullmm && !tlb->need_flush_all)
 			tlb_flush_mmu(tlb);
 	}
 
-- 
2.21.0

