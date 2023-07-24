Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580275FFAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 21:15:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eg07Wzo+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8qcs1l59z3cYy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 05:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eg07Wzo+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8qVy2Sfqz30YT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 05:10:34 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OJ9Vks012368;
	Mon, 24 Jul 2023 19:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VNEBeAWzU/CT4iyd6EAoxgzBL6LW64vgyDe8qKmFgh0=;
 b=Eg07Wzo++/WPSXNsInbAxeEDrUuN6D8+uwTP+2ehrAX8cwbotjGI1cy30M4tDh+N8G1B
 EkyUKwgPju2eJ42gclRm0m0FVEuk3iLbB1x4I/yk7M0IUyecoNn3yWihHK2pCDQ4uCs1
 GLDQBaU0OBX5DI7sbHa/6fdZMJhLLcS02tnaMkuLhmCHmhcOhfNmPE+9B8qgZKgYbN+R
 YNb7+g0wxMnR0mstL88qyz8s4HZOBCQCHUxCMcIcSU47NxlvcyXkbpyquWeegBtQowrQ
 4c11jLgGSHYExNEjZkPuVEQJFGurohUe3zLqeUdGsQt4vxi1OZiXyK7+YayiU2arKuOB EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1vrvkssw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:10:15 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OJ9vue014568;
	Mon, 24 Jul 2023 19:10:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1vrvkssm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:10:15 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OI0bji002375;
	Mon, 24 Jul 2023 19:10:14 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjnkna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:10:14 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OJAEnG31064600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 19:10:14 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E60158068;
	Mon, 24 Jul 2023 19:10:14 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C0F558055;
	Mon, 24 Jul 2023 19:10:09 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.177.66.22])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 19:10:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 08/13] powerpc/mm/trace: Convert trace event to trace event class
Date: Tue, 25 Jul 2023 00:37:54 +0530
Message-ID: <20230724190759.483013-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tsAODs3yZXCKz5iwX_3juu_3x31vgKdm
X-Proofpoint-GUID: MykmrjbFbcLZDV9QhlQqoR2j0HYK66AN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_14,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240168
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

