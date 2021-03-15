Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207133B144
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZH26N5Sz30Df
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=im8d/FzN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=im8d/FzN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZGD3LcZz2yxp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:39:48 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FBXsev163184; Mon, 15 Mar 2021 07:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ItVLSezVqEEm8jQ3OR6KaVz/AyVinhGZxzf/J7ApD9c=;
 b=im8d/FzNuYrCTNVuEpvX4LRUBmVorLQx8jS3psvCOhmrlpiQUv9LcKNHEWI8VdkPM0GG
 CFZX0LVw1SgQfSAJptvjEWwKvo5H5BCOBrJyutcCN29P0hfxnZSjl++dkfNf+5bsDekV
 mfXxhoMNZLciRahnDUfA+e/RtqLX0leHid/pSnErNfIQh+/PvK/ORFGBdjTFuJtagyHm
 gJ4d4L+yu9v/CTAR629I5uIad6KfmNiHJTO0mBwyzDBEGsmeDqYxv3C5/WtyDcjhQzCE
 Vt5LHGrotiSzhLBww80ly6BUYF4v3G5nvq5QxeLvTFi7nR5MZ+AjpujvBtxKqzeNlZBR IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379yj1u9nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:45 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FBYCA2164316;
 Mon, 15 Mar 2021 07:38:45 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379yj1u9n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:44 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FBWVV5031994;
 Mon, 15 Mar 2021 11:38:44 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 37a6t3013p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:38:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FBchjQ25428240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:38:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CECBAC060;
 Mon, 15 Mar 2021 11:38:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2ED2AC05F;
 Mon, 15 Mar 2021 11:38:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 11:38:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 3/6] mm/mremap: Use pmd/pud_poplulate to update page table
 entries
Date: Mon, 15 Mar 2021 17:08:21 +0530
Message-Id: <20210315113824.270796-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
References: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150081
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pmd/pud_populate is the right interface to be used to set the respective
page table entries. Some architectures like ppc64 do assume that set_pmd/pud_at
can only be used to set a hugepage PTE. Since we are not setting up a hugepage
PTE here, use the pmd/pud_populate interface.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/mremap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index ec8f840399ed..574287f9bb39 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -26,6 +26,7 @@
 
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
+#include <asm/pgalloc.h>
 
 #include "internal.h"
 
@@ -257,9 +258,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	pmd_clear(old_pmd);
 
 	VM_BUG_ON(!pmd_none(*new_pmd));
+	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
 
-	/* Set the new pmd */
-	set_pmd_at(mm, new_addr, new_pmd, pmd);
 	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
@@ -306,8 +306,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 
 	VM_BUG_ON(!pud_none(*new_pud));
 
-	/* Set the new pud */
-	set_pud_at(mm, new_addr, new_pud, pud);
+	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
 	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
-- 
2.29.2

