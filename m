Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF07DF3A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 14:24:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U/ouYeQC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLl332dsmz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 00:24:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U/ouYeQC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLl2B4NsCz3cRG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 00:23:46 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A2D7ura032030;
	Thu, 2 Nov 2023 13:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0r4OI5W+7ltBO0KFANasyZQ3UEyYUTjyL0N/iJzhINk=;
 b=U/ouYeQCf1kjrXxYcEhk4ga7YtzxwIKXPhl0dFEsCx/CmjLYKa9ZakP+anF3Fx2RT3AX
 Av0W/jAuiHNv4FDM38SpjERi4RjZFoQoCkaLhO9CtgFlZn2RwgoHjBWFk3+zx9qs0xru
 KPujRbNcuZSvBTe4n3tRQ+5g0pK2rnv4QQ9JqHeK1bHeNz9veynuY8pTc4eBgmyIVI2z
 GxhpFXSyNaRpopHdISyryMdsqExe02uqGXOJr/2yuXktaqryAKqKBgH/3N5W6jorpTdc
 7lUu0URPl2ALcb7v93UKr6YPlJBI2KGNqU6brZt+96/du/UeMo7kRqmZKaocH9h0Of4O Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u4ccj0kvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 13:23:36 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A2D7mds031481;
	Thu, 2 Nov 2023 13:23:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u4ccj0ku8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 13:23:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A2D0T7N007685;
	Thu, 2 Nov 2023 13:23:32 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1dmnxt1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 13:23:32 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A2DNWOH27591392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Nov 2023 13:23:32 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70EC858054;
	Thu,  2 Nov 2023 13:23:32 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF0358068;
	Thu,  2 Nov 2023 13:23:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.123.97])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Nov 2023 13:23:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
Date: Thu,  2 Nov 2023 18:53:27 +0530
Message-ID: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I7amZqdSsR8vJgQHSaeyViLVQGDqpYWn
X-Proofpoint-ORIG-GUID: h8HqqD1AW_E4Mp6Lady4caHcU6cTuwnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-02_03,2023-11-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=470 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311020108
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

With this change numa fault pte (pte_protnone()) gets mapped as regular user pte
with RWX cleared (no-access). This also remove pte_user() from
book3s/64.

pte_access_permitted() now checks for _PAGE_EXEC because we now support
EXECONLY mappings.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 23 +++++---------------
 arch/powerpc/mm/book3s64/hash_utils.c        | 17 +++++++++++++++
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb77eddca54b..7c7de7b56df0 100644
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
@@ -119,9 +113,9 @@
 /*
  * user access blocked by key
  */
-#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
 #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
 #define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC)
+#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
 #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
 /*
  * _PAGE_CHG_MASK masks of bits that are to be preserved across
@@ -523,19 +517,14 @@ static inline bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
 }
 #endif /* CONFIG_PPC_MEM_KEYS */
 
-static inline bool pte_user(pte_t pte)
-{
-	return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
-}
-
 #define pte_access_permitted pte_access_permitted
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
-	/*
-	 * _PAGE_READ is needed for any access and will be
-	 * cleared for PROT_NONE
-	 */
-	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
+
+	if (!pte_present(pte))
+		return false;
+
+	if (!(pte_read(pte) || pte_exec(pte)))
 		return false;
 
 	if (write && !pte_write(pte))
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ad2afa08e62e..b2eda22195f0 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -310,9 +310,26 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags
 			else
 				rflags |= 0x3;
 		}
+		WARN_ON(!(pteflags & _PAGE_RWX));
 	} else {
 		if (pteflags & _PAGE_RWX)
 			rflags |= 0x2;
+		else {
+			/*
+			 * PAGE_NONE will get mapped to 0b110 (slb key 1 no access)
+			 * We picked 0b110 instead of 0b000 so that slb key 0 will
+			 * get only read only access for the same rflags.
+			 */
+			if (mmu_has_feature(MMU_FTR_KERNEL_RO))
+				rflags |= (HPTE_R_PP0 | 0x2);
+			/*
+			 * rflags = HPTE_R_N
+			 * Without KERNEL_RO feature this will result in slb
+			 * key 0 with read/write. But ISA only supports that.
+			 * There is no key 1 no-access and key 0 read-only
+			 * pp bit support.
+			 */
+		}
 		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
 			rflags |= 0x1;
 	}
-- 
2.41.0

