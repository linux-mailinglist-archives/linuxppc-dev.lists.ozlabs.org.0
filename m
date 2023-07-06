Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B57497E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:05:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bi3KaxNO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVwT2qqZz3cc7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:04:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bi3KaxNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVp35VLLz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:59:23 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668qQSf013375;
	Thu, 6 Jul 2023 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CCRKKwBNmbNEXrHZXrT40NjFgPyXV2Q+00nl9gdum18=;
 b=bi3KaxNOU8l0U91MtNjqdDxNN6h7eDdWvXF2fobthN8F+aY5WVW+nzctW5gjy+P80BEQ
 +JXYfXvjNYqFrPCpuDcGi0kCFPcooS+qH5WOuahw/FFoOBsPmEqvqZ12je+koCB0kirx
 lMv9RJMr9gQUM/RgkuODzqnDOkvGVHxDV29tJAwzvejE/Y7yhIONafQQITCIyESOTr9k
 Pxb559O58Ku+pFplOpmEfMmY/IeESQlp+OP7B6HxnospMfk4R2VbUpPJzOgZJvRWp5yd
 4Qidy7mWCPkHp6fhegFDJ2vh7Zlw6YmAzCsW7XYOCryiL0SJHADBdIihHLMQe8Pvx9No jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntfrr485-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:06 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668sQO0019849;
	Thu, 6 Jul 2023 08:59:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntfrr47m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36680Yo8023003;
	Thu, 6 Jul 2023 08:59:04 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs5qy1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:04 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668x3fI1114834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:59:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A93A58064;
	Thu,  6 Jul 2023 08:59:03 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0997A58059;
	Thu,  6 Jul 2023 08:58:59 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:58:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 06/13] mm/huge pud: Use transparent huge pud helpers only with CONFIG_TRANSPARENT_HUGEPAGE
Date: Thu,  6 Jul 2023 14:28:12 +0530
Message-ID: <20230706085819.827761-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
References: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0bXOmG1rEAB8OaUVCUViSM-43wJivQJV
X-Proofpoint-GUID: TUKWLIiVIJVFytlnvJjJMP4oj8752eB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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
index 91def34f7784..b5af3e014606 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -558,6 +558,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 #endif
 #ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void pudp_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pud_t *pudp)
 {
@@ -571,6 +572,7 @@ static inline void pudp_set_wrprotect(struct mm_struct *mm,
 {
 	BUILD_BUG();
 }
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 #endif
 
diff --git a/mm/mremap.c b/mm/mremap.c
index 11e06e4ab33b..056478c106ee 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -349,7 +349,7 @@ static inline bool move_normal_pud(struct vm_area_struct *vma,
 }
 #endif
 
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
 			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
 {
-- 
2.41.0

