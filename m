Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE17571DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:38:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jeqfpFQZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jmR02rXz309q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jeqfpFQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jcD3NHYz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2ESnc015898;
	Tue, 18 Jul 2023 02:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VNEBeAWzU/CT4iyd6EAoxgzBL6LW64vgyDe8qKmFgh0=;
 b=jeqfpFQZjGupCiZ6A8A0m94xnpnZ8ouEjqUeHYMXgegKr/zn+vjPNuQiQPxfV7FlN8+f
 u0nKRNMjuJWs8nmugxNRnfU9atd64js+atW3hVe3IQiIQJYfm13Mc+4rmgvjw/o1AZh8
 HGeJT3+cHiQIXszB4hFX/Q46bUSzhL5vST6QnoxC+3DEDl2bL6D8iQ7d4/+KPP84nsnu
 Ggzj1ta1+fVhpez7NulGNLKY5oSjASEv7pqaW/h7d1IG5EyJYemHWb7zOJbQtISxOXKS
 ZYiMZhONPElojvU9Hq3xytr0s7asWw2cXpU9dM9PUMpTRi2ZhZFWLuXrFpESBEUyCD6W Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhs809u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:31 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2FGP2018637;
	Tue, 18 Jul 2023 02:30:30 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhs809tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:30 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HMmEo7029129;
	Tue, 18 Jul 2023 02:30:29 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv6smbtau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:29 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2UTeK6488632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:29 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F5C958057;
	Tue, 18 Jul 2023 02:30:29 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3369258063;
	Tue, 18 Jul 2023 02:30:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:30:23 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 08/13] powerpc/mm/trace: Convert trace event to trace event class
Date: Tue, 18 Jul 2023 07:59:28 +0530
Message-ID: <20230718022934.90447-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f4UAcqeplPmsunleHh4YnXcYkxb1EaV4
X-Proofpoint-GUID: IZtQYHfavdkrOdtBOck1b5xyVf-SazP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

A follow-up patch will add a pud variant for this same event.
Using event class makes that addition simpler.

No functional change in this patch.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  2 +-
 include/trace/events/thp.h               | 23 ++++++++++++++++-------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 51f48984abca..988948d69bc1 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -214,7 +214,7 @@ unsigned long hash__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr
 
 	old = be64_to_cpu(old_be);
 
-	trace_hugepage_update(addr, old, clr, set);
+	trace_hugepage_update_pmd(addr, old, clr, set);
 	if (old & H_PAGE_HASHPTE)
 		hpte_do_hugepage_flush(mm, addr, pmdp, old);
 	return old;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e7ea492ac510..02e185d2e4d6 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -962,7 +962,7 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
 #endif
 
 	old = radix__pte_update(mm, addr, pmdp_ptep(pmdp), clr, set, 1);
-	trace_hugepage_update(addr, old, clr, set);
+	trace_hugepage_update_pmd(addr, old, clr, set);
 
 	return old;
 }
diff --git a/include/trace/events/thp.h b/include/trace/events/thp.h
index 202b3e3e67ff..a95c78b10561 100644
--- a/include/trace/events/thp.h
+++ b/include/trace/events/thp.h
@@ -8,25 +8,29 @@
 #include <linux/types.h>
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(hugepage_set_pmd,
+DECLARE_EVENT_CLASS(hugepage_set,
 
-	    TP_PROTO(unsigned long addr, unsigned long pmd),
-	    TP_ARGS(addr, pmd),
+	    TP_PROTO(unsigned long addr, unsigned long pte),
+	    TP_ARGS(addr, pte),
 	    TP_STRUCT__entry(
 		    __field(unsigned long, addr)
-		    __field(unsigned long, pmd)
+		    __field(unsigned long, pte)
 		    ),
 
 	    TP_fast_assign(
 		    __entry->addr = addr;
-		    __entry->pmd = pmd;
+		    __entry->pte = pte;
 		    ),
 
-	    TP_printk("Set pmd with 0x%lx with 0x%lx", __entry->addr, __entry->pmd)
+	    TP_printk("Set page table entry with 0x%lx with 0x%lx", __entry->addr, __entry->pte)
 );
 
+DEFINE_EVENT(hugepage_set, hugepage_set_pmd,
+	    TP_PROTO(unsigned long addr, unsigned long pmd),
+	    TP_ARGS(addr, pmd)
+);
 
-TRACE_EVENT(hugepage_update,
+DECLARE_EVENT_CLASS(hugepage_update,
 
 	    TP_PROTO(unsigned long addr, unsigned long pte, unsigned long clr, unsigned long set),
 	    TP_ARGS(addr, pte, clr, set),
@@ -48,6 +52,11 @@ TRACE_EVENT(hugepage_update,
 	    TP_printk("hugepage update at addr 0x%lx and pte = 0x%lx clr = 0x%lx, set = 0x%lx", __entry->addr, __entry->pte, __entry->clr, __entry->set)
 );
 
+DEFINE_EVENT(hugepage_update, hugepage_update_pmd,
+	    TP_PROTO(unsigned long addr, unsigned long pmd, unsigned long clr, unsigned long set),
+	    TP_ARGS(addr, pmd, clr, set)
+);
+
 DECLARE_EVENT_CLASS(migration_pmd,
 
 		TP_PROTO(unsigned long addr, unsigned long pmd),
-- 
2.41.0

