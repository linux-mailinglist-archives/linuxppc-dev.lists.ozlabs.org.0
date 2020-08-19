Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE8249F92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:23:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWpPb0pVBzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:23:15 +1000 (AEST)
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
 header.s=pp1 header.b=FmHEtvvY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWnxx0FKGzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:02:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JD28Xg185746; Wed, 19 Aug 2020 09:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ueLZBCl46XwmGhfzKkgdbcfo+IIM63XgD/hY+HvwHME=;
 b=FmHEtvvYmahUqUu6S2BXzLt2/TcLSr2/fIgCSgUrTg8a32OxTbQDHouMMWfPDXejRXTv
 97SF/+k1MPehG3XRwcIhlYhBjxM4G1VVykpRcLYt3tIo9cgtmKjujaonwTQgrfx30IpR
 kg4wHhKr97FF2e4aGybKlcH0ADgJ4mCDHMeA0WXdhhj/xFKHd55XVheIvC3LDRDLSd8F
 1wUxXOpSbYkwv/Co2u5W2DW7VEfph2+BgdXXcL3+Rw8WgtVtJflJ/3NpDoYJKypClfZO
 yZPB5LHQuDFv9v29U3fQrELg8NS18d9A0pvbDaZFnCqTbnlnSsfUNUDhFxDwMixxa/2t ZQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3313qqswam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:02:17 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JD0J2N023797;
 Wed, 19 Aug 2020 13:01:52 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3304ce42ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1qjd44499260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5842FB205F;
 Wed, 19 Aug 2020 13:01:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0699CB2067;
 Wed, 19 Aug 2020 13:01:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:49 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 11/13] mm/debug_vm_pgtable/pmd_clear: Don't use
 pmd/pud_clear on pte entries
Date: Wed, 19 Aug 2020 18:31:05 +0530
Message-Id: <20200819130107.478414-12-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=982 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190110
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pmd_clear() should not be used to clear pmd level pte entries.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 8f7a8ccb5a54..63576fe767a2 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -191,6 +191,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_young(pmd));
 
+	/*  Clear the pte entries  */
+	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
 	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
 }
 
@@ -311,6 +313,8 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	pudp_test_and_clear_young(vma, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(pud_young(pud));
+
+	pudp_huge_get_and_clear(mm, vaddr, pudp);
 }
 
 static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
@@ -429,8 +433,6 @@ static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
 	 * This entry points to next level page table page.
 	 * Hence this must not qualify as pud_bad().
 	 */
-	pmd_clear(pmdp);
-	pud_clear(pudp);
 	pud_populate(mm, pudp, pmdp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(pud_bad(pud));
@@ -562,7 +564,6 @@ static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
 	 * This entry points to next level page table page.
 	 * Hence this must not qualify as pmd_bad().
 	 */
-	pmd_clear(pmdp);
 	pmd_populate(mm, pmdp, pgtable);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_bad(pmd));
-- 
2.26.2

