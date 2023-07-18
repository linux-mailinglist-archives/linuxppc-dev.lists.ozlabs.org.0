Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA417571D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:36:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHK5UlW8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jkN17nxz3dFj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHK5UlW8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jc15k3cz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:41 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2BosA000475;
	Tue, 18 Jul 2023 02:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7nW9q7tdZJxOOlA6qcPKIyqZf0s0/C0nAEYZfH3pzyA=;
 b=bHK5UlW83pBy+mvT7kAj5FpzsiWOtQRArkO99xqrlbNTBzkIdcqm5PUck+1QPdkkPFSi
 tJ9JwGIb3g9R8ld3CwrWlS8SDKJdybSxb8AIXOTk0Um6xJO/v5JT4Ge0T5exiHxexquJ
 1wStDZb8GU/92iFAXd+ENobLEa/xpR3UbuIRcHZcxdBFOnRhIClb7PPJhCTR67pYjfjk
 HegkrIeb0ppaVfqvthROyacHKxkpX60yHUAZ6wZd6ICXhv6ozEWoze4VesH3Lg+x4sr2
 sTBzgn5ckv23RWGwNnVAnKU7EftA9G6KQko43Gc5lX5LFGrWdRX4wVTPYymioF+YtFrS yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwgy4s2uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:20 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2DQ40004343;
	Tue, 18 Jul 2023 02:30:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwgy4s2u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HK400t008046;
	Tue, 18 Jul 2023 02:30:19 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv80j1gu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:19 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2UIjv62128634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:18 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBA7258059;
	Tue, 18 Jul 2023 02:30:17 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DE2658061;
	Tue, 18 Jul 2023 02:30:13 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:30:12 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 06/13] mm/huge pud: Use transparent huge pud helpers only with CONFIG_TRANSPARENT_HUGEPAGE
Date: Tue, 18 Jul 2023 07:59:26 +0530
Message-ID: <20230718022934.90447-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ES02WVMAErXakCwqbD2hpQ7s__tECIf
X-Proofpoint-GUID: pIxa-hk4w24V8T-V78Ld5Ptd048HzFlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/pgtable.h | 2 ++
 mm/mremap.c             | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ca67ecbd9a66..bc9d6b681e25 100644
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

