Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C07EAAC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 08:12:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bu6dwQav;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STyDR00Ytz3d8p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bu6dwQav;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STyCb1nzBz301f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 18:11:54 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE7ACQJ019555;
	Tue, 14 Nov 2023 07:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qs7XwBlnK9MfzZj755HoeG3HBRYK2tADjxwZp9JyJ7k=;
 b=bu6dwQav7LpfNo5HdEu2PWnUp8atjvDD0QjxTCILLdWesyhN/Jq3lMPmcc3wMVGCqZWk
 6J43/jUQ07zjCYqjh+qRfj50GLwHKTZq6aXmx4k6VSglP42ocHzlTaRzgad0N1zvm+H3
 M0ba5QEb9hgd4KJB++h5Z3HTaceo9f9qnny6mBwQP8XEjC3Wqf38CXAPX0Ia50Q7j3QV
 vazCud9kYkj+MYWS1hXh4idyBmaTzHGDusvqrRN/+8iRV2PdGQ5GipcJWMzSZIFe8iG8
 QJftYN5i/XbNz55LVdhJ4t1atSqY7FNpnhSyRP47SR4YL7lZUgtZoVqBtzRHG9bxT4JH Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc491g0rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:11:43 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE7BTds022381;
	Tue, 14 Nov 2023 07:11:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc491g0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:11:43 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE5CvCA029390;
	Tue, 14 Nov 2023 07:11:42 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxspfyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:11:42 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE7BfCi55968128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 07:11:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E835805C;
	Tue, 14 Nov 2023 07:11:41 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 934D258058;
	Tue, 14 Nov 2023 07:11:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.56.65])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 07:11:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
Date: Tue, 14 Nov 2023 12:41:30 +0530
Message-ID: <20231114071130.197966-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9P4RDdDU2BJ086CGUl1JE4MFUtKeSkMO
X-Proofpoint-GUID: KitHkWbXq0ljzRoJj6HsPRx1iWtJzTMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_05,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=459 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140054
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
But that got dropped by
commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")

With the change in this patch numa fault pte (pte_protnone()) gets mapped as regular user pte
with RWX cleared (no-access) whereas earlier it used to be mapped _PAGE_PRIVILEGED.

Hash fault handling code did get some WARN_ON added because those
functions are not expected to get called with _PAGE_READ cleared.
commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page fault path")
explains the details.

Also revert commit 1abce0580b89 ("powerpc/64s: Fix __pte_needs_flush() false positive warning")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 9 +++------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 ++-------
 arch/powerpc/mm/book3s64/hash_utils.c         | 7 +++++++
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb77eddca54b..2cc58ac74080 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -17,12 +17,6 @@
 #define _PAGE_EXEC		0x00001 /* execute permission */
 #define _PAGE_WRITE		0x00002 /* write access allowed */
 #define _PAGE_READ		0x00004	/* read access allowed */
-#define _PAGE_NA		_PAGE_PRIVILEGED
-#define _PAGE_NAX		_PAGE_EXEC
-#define _PAGE_RO		_PAGE_READ
-#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
-#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
-#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
 #define _PAGE_SAO		0x00010 /* Strong access order */
 #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
@@ -529,6 +523,9 @@ static inline bool pte_user(pte_t pte)
 }
 
 #define pte_access_permitted pte_access_permitted
+/*
+ * execute-only mappings return false
+ */
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 1950c1b825b4..fd642b729775 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -158,11 +158,6 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 	 */
 }
 
-static inline bool __pte_protnone(unsigned long pte)
-{
-	return (pte & (pgprot_val(PAGE_NONE) | _PAGE_RWX)) == pgprot_val(PAGE_NONE);
-}
-
 static inline bool __pte_flags_need_flush(unsigned long oldval,
 					  unsigned long newval)
 {
@@ -179,8 +174,8 @@ static inline bool __pte_flags_need_flush(unsigned long oldval,
 	/*
 	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
 	 */
-	VM_WARN_ON_ONCE(!__pte_protnone(oldval) && oldval & _PAGE_PRIVILEGED);
-	VM_WARN_ON_ONCE(!__pte_protnone(newval) && newval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ad2afa08e62e..0626a25b0d72 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -310,9 +310,16 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags
 			else
 				rflags |= 0x3;
 		}
+		VM_WARN_ONCE(!(pteflags & _PAGE_RWX), "no-access mapping request");
 	} else {
 		if (pteflags & _PAGE_RWX)
 			rflags |= 0x2;
+		/*
+		 * We should never hit this in normal fault handling because
+		 * a permission check (check_pte_access()) will bubble this
+		 * to higher level linux handler even for PAGE_NONE.
+		 */
+		VM_WARN_ONCE(!(pteflags & _PAGE_RWX), "no-access mapping request");
 		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
 			rflags |= 0x1;
 	}
-- 
2.41.0

