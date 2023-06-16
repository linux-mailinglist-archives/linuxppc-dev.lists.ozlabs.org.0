Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12865732F8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:12:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fq/G4oOB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGhr6CKFz3c71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fq/G4oOB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGdT0C0tz3bnN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:09:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GB8KDq015816;
	Fri, 16 Jun 2023 11:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=77K1R1/kGwWHCcLG2tEIMVoGfZHm1aKBUIsLmqWw1So=;
 b=Fq/G4oOBRR/X6XqBnIrEAbYzlbI1Kqg96GPFuSK+QRwR1aZcN4K2zgh+XJyFBLhn2+EA
 fxPsq0usRYCH1z68mxZwiP519e1HvcLDcqwBbYorXUAHdP7czvY9UK90SlpkbHUODQoL
 e1lPrfKPSuWdhiOeBSuzP+eNv1t8+hqFvYEAT68A+qND5cPwZjKQMVmA8Ma9lD5Ai8ho
 nZYhgqLJC49KgzGSR0/PAdq98PkMiOSGZX/faGOHL5tqjp0jQHxVO2WFC2/sQMxobDLW
 mGdGyMstgOntnhRJ5vRiMsykqm5nBf64N/BJCU3HKP5SsTj7M5T8JPOB5vnNZdE7vOYP PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9m8a4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:06 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GB8Q0x016011;
	Fri, 16 Jun 2023 11:09:06 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9m8a4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:05 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAMR7J003274;
	Fri, 16 Jun 2023 11:09:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3r4gt5qhqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GB93NN983798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:09:03 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E1B75805B;
	Fri, 16 Jun 2023 11:09:03 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3097A5805C;
	Fri, 16 Jun 2023 11:08:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:08:56 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 03/16] powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
Date: Fri, 16 Jun 2023 16:38:13 +0530
Message-Id: <20230616110826.344417-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Odp8cUWp3s0d4YuSsCiOdERwl9xp95pY
X-Proofpoint-ORIG-GUID: s4EXAUrBlFL4zFELS2xfARnVFE1sJDJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160099
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

On memory unplug reduce DirectMap page count correctly.
root@ubuntu-guest:# grep Direct /proc/meminfo
DirectMap4k:           0 kB
DirectMap64k:           0 kB
DirectMap2M:    115343360 kB
DirectMap1G:           0 kB

Before fix:
root@ubuntu-guest:# ndctl disable-namespace all
disabled 1 namespace
root@ubuntu-guest:# grep Direct /proc/meminfo
DirectMap4k:           0 kB
DirectMap64k:           0 kB
DirectMap2M:    115343360 kB
DirectMap1G:           0 kB

After fix:
root@ubuntu-guest:# ndctl disable-namespace all
disabled 1 namespace
root@ubuntu-guest:# grep Direct /proc/meminfo
DirectMap4k:           0 kB
DirectMap64k:           0 kB
DirectMap2M:    104857600 kB
DirectMap1G:           0 kB

Fixes: a2dc009afa9a ("powerpc/mm/book3s/radix: Add mapping statistics")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 34 +++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 570add33c02d..15a099e53cde 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -743,9 +743,9 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
 }
 
 static void remove_pte_table(pte_t *pte_start, unsigned long addr,
-			     unsigned long end)
+			     unsigned long end, bool direct)
 {
-	unsigned long next;
+	unsigned long next, pages = 0;
 	pte_t *pte;
 
 	pte = pte_start + pte_index(addr);
@@ -767,13 +767,16 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
 		}
 
 		pte_clear(&init_mm, addr, pte);
+		pages++;
 	}
+	if (direct)
+		update_page_count(mmu_virtual_psize, -pages);
 }
 
 static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
-			     unsigned long end)
+				       unsigned long end, bool direct)
 {
-	unsigned long next;
+	unsigned long next, pages = 0;
 	pte_t *pte_base;
 	pmd_t *pmd;
 
@@ -791,19 +794,22 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 				continue;
 			}
 			pte_clear(&init_mm, addr, (pte_t *)pmd);
+			pages++;
 			continue;
 		}
 
 		pte_base = (pte_t *)pmd_page_vaddr(*pmd);
-		remove_pte_table(pte_base, addr, next);
+		remove_pte_table(pte_base, addr, next, direct);
 		free_pte_table(pte_base, pmd);
 	}
+	if (direct)
+		update_page_count(MMU_PAGE_2M, -pages);
 }
 
 static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
-			     unsigned long end)
+				       unsigned long end, bool direct)
 {
-	unsigned long next;
+	unsigned long next, pages = 0;
 	pmd_t *pmd_base;
 	pud_t *pud;
 
@@ -821,16 +827,20 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 				continue;
 			}
 			pte_clear(&init_mm, addr, (pte_t *)pud);
+			pages++;
 			continue;
 		}
 
 		pmd_base = pud_pgtable(*pud);
-		remove_pmd_table(pmd_base, addr, next);
+		remove_pmd_table(pmd_base, addr, next, direct);
 		free_pmd_table(pmd_base, pud);
 	}
+	if (direct)
+		update_page_count(MMU_PAGE_1G, -pages);
 }
 
-static void __meminit remove_pagetable(unsigned long start, unsigned long end)
+static void __meminit remove_pagetable(unsigned long start, unsigned long end,
+				       bool direct)
 {
 	unsigned long addr, next;
 	pud_t *pud_base;
@@ -859,7 +869,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 		}
 
 		pud_base = p4d_pgtable(*p4d);
-		remove_pud_table(pud_base, addr, next);
+		remove_pud_table(pud_base, addr, next, direct);
 		free_pud_table(pud_base, p4d);
 	}
 
@@ -882,7 +892,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
 {
-	remove_pagetable(start, end);
+	remove_pagetable(start, end, true);
 	return 0;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
@@ -918,7 +928,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 #ifdef CONFIG_MEMORY_HOTPLUG
 void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long page_size)
 {
-	remove_pagetable(start, start + page_size);
+	remove_pagetable(start, start + page_size, false);
 }
 #endif
 #endif
-- 
2.40.1

