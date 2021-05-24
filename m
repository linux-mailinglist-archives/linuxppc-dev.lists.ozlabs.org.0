Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC238E2EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 11:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpWWp6s2Kz3dFP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 19:05:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VEgEPFVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VEgEPFVY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpWS00Qmhz3bsp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 19:02:07 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14O8v61u023666; Mon, 24 May 2021 05:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=7eX2gy/zuhS8OjiDxr2VcenOd74UiuXCuRJmJCTOZVs=;
 b=VEgEPFVYUm9YUeHa31Vq6bMIXPd/xHDfCVyw2NAwUGtmng3R21v0p8Uc2ehYdIayIC3o
 ZUwmoE8PqvLkdjsMDlAz3OvkLQSobj5Wk7TqvxJZ6aNPyR/T0Rdqc+fKqVXlEfTi+tl0
 r+9NdkAaGacTnisGTcbL+eA8qgVG4a+iR+TpP+JzNwQiUvaTE3HtrHE8w+Gkua9L1CSm
 NlTDTykjCOfC5lYnb190mLMPitdPlcbFjOoiwfZCNKwP5RkUQ88OA10fXhlBeZiOtstU
 GwdTgRaxVASMH/5e+bIqqPWC9Z1UzfL4rBZmH/4ZMEw9bNklSKOiHrClzPUmZRSuRAJy mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r93803yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:56 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14O8wi3g027225;
 Mon, 24 May 2021 05:01:56 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r93803xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:56 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14O8nPrF028826;
 Mon, 24 May 2021 09:01:55 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 38psk8s76a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 09:01:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14O91sh636045212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 09:01:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A366FAE05C;
 Mon, 24 May 2021 09:01:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C52A5AE060;
 Mon, 24 May 2021 09:01:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 09:01:51 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v6 08/11] mm/mremap: properly flush the TLB on mremap.
Date: Mon, 24 May 2021 14:31:11 +0530
Message-Id: <20210524090114.63446-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
References: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E9Jsi4cLb3qfzd726OVY4c0xb9TlqyVJ
X-Proofpoint-ORIG-GUID: 5g1Qlm1no-PwpUDg4QhE5RZcILplYtPo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_04:2021-05-20,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240067
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
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As explained in
commit eb66ae030829 ("mremap: properly flush TLB before releasing the page")
mremap is special in that it doesn't take ownership of the page. The
optimized version for PUD/PMD aligned mremap also doesn't hold the ptl lock.
Hence flush the TLB before we update the new page table location. This ensures
the kernel invalidates the older translation cache before it can free the page via
the newly inserted translation.

Fixes: c49dd3401802 ("mm: speedup mremap on 1GB or larger regions")
Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
Link: https://lore.kernel.org/linux-mm/CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/mremap.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 000a71917557..8967a3707332 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -266,11 +266,13 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	/* Clear the pmd */
 	pmd = *old_pmd;
 	pmd_clear(old_pmd);
-
+	/*
+	 * flush the TLB before we move the page table entries.
+	 */
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
 
-	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
@@ -313,11 +315,14 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	/* Clear the pud */
 	pud = *old_pud;
 	pud_clear(old_pud);
+	/*
+	 * flush the TLB before we move the page table entries.
+	 */
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE);
 
 	VM_BUG_ON(!pud_none(*new_pud));
 
 	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
-	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
-- 
2.31.1

