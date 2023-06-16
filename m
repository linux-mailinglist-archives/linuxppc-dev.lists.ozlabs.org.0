Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140C7330BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 14:05:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJ0CCkKR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjHtR3bnJz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:05:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJ0CCkKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjHsW6KkTz301V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 22:05:03 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GC2Lkr022986;
	Fri, 16 Jun 2023 12:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=olZzUnBM/e0N6uqOS2BdEdJT2kmPhsk0clbOlTlXdCc=;
 b=rJ0CCkKRp4LNJYjT8Yerck+ryFBBBSdMcQEBlWrRZC5v7Nu/Cnt64ffdVCnqKOK+rHrD
 wAOyaoTs+Pxd97Ihk5EDYi/JuFG7yPvK5U8Vo4WSdZiQFrCkSE1qetfPcraLVitVNK/z
 f50JbH/e1xX/MoXNhBbeASxqUJrkmiGaW2W7oYonBxZqy3ISKx+EKvrENGqCzsDGGqzz
 oXwt52Sjzg0kvhF+UdyJaNg2yeV0UfDlFC+pTl9U1jxggf9csMJkjkv45/K1a+lH+DIn
 jyE7kC2pWdZa7Fod2CYI0FCF87VqgHF+NBXYljIb2ctjOCAoChdaXsIHyxsTGfUJHlN0 Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8qcs82a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 12:04:42 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GC3H3G028054;
	Fri, 16 Jun 2023 12:04:42 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8qcs8276-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 12:04:42 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35FMGLok020557;
	Fri, 16 Jun 2023 11:09:57 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3r4gt529ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:56 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GB9tVf2687568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:09:55 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AB275805D;
	Fri, 16 Jun 2023 11:09:55 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46A6358059;
	Fri, 16 Jun 2023 11:09:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:09:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 11/16] mm/huge pud: Use transparent huge pud helpers only with CONFIG_TRANSPARENT_HUGEPAGE
Date: Fri, 16 Jun 2023 16:38:21 +0530
Message-Id: <20230616110826.344417-12-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: frKTnl-WpFRdIDjBFqJxtBQcZz3jswKD
X-Proofpoint-ORIG-GUID: WMYlyHWFkL4rQ2q3O0j-Mohn2_cm_BLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160108
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pudp_set_wrprotect and move_huge_pud helpers are only used when
CONFIG_TRANSPARENT_HUGEPAGE is enabled. Similar to pmdp_set_wrprotect and
move_huge_pmd_helpers use architecture override only if
CONFIG_TRANSPARENT_HUGEPAGE is set

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/pgtable.h | 2 ++
 mm/mremap.c             | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c5174d1f9db..c7f5806dc9d1 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -550,6 +550,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 #endif
 #ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void pudp_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pud_t *pudp)
 {
@@ -563,6 +564,7 @@ static inline void pudp_set_wrprotect(struct mm_struct *mm,
 {
 	BUILD_BUG();
 }
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 #endif
 
diff --git a/mm/mremap.c b/mm/mremap.c
index b11ce6c92099..6373db571e5c 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -338,7 +338,7 @@ static inline bool move_normal_pud(struct vm_area_struct *vma,
 }
 #endif
 
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
 			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
 {
-- 
2.40.1

