Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37E7FE771
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:56:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFmUBCqO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sggnt2Vl2z3cXd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:56:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFmUBCqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggmG1LT5z3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:55:25 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU2HTo0000920;
	Thu, 30 Nov 2023 02:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8Y7mvEuAwVNPvaqJOPL7pzTTQBxhkVQZwJrf3qTgOFU=;
 b=RFmUBCqOYQShoPGuZ5UA6/AzzkbH6jrDNww9eu2h0MXcePOt5Yjdq/+0FWosFbr63p6l
 J2tSSO05Hgt0xu9Y3b4aleFcUT64xNF+BNQcpeNPPaziDdnvwmt6O5jpKAxxVAhOBqxY
 2xb8/oEEcKckK+geoIUwc2nqLaU/uSbAu+GiwrwoDex1ioQ7GlJsVj67EhTXbd6owQpP
 3ITWNnE61db64zZA9cCuAd06TM4+LZcwzMcxbgpeG98TCW50yIaTX6OuM0cuS+y2z7W8
 nOVOiTG2qIn1yw5eoIA3U+wgeZDX1tCJ9PPPIRsmFUg4NcTQRJHQLX/XAFpMbufTtJkW ig== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uphfqgqqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0Y2td022405;
	Thu, 30 Nov 2023 02:55:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfkb6ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:17 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU2tFIf29491766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 02:55:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A324020040;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30B262004B;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AABB36064D;
	Thu, 30 Nov 2023 13:55:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 4/7] powerpc: mm: Default p{m,u}d_pte implementations
Date: Thu, 30 Nov 2023 13:53:57 +1100
Message-ID: <20231130025404.37179-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130025404.37179-2-rmclure@linux.ibm.com>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ul48WJxNqFDMMrfp4CmGfEAZJvrJoD7Q
X-Proofpoint-ORIG-GUID: ul48WJxNqFDMMrfp4CmGfEAZJvrJoD7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=635
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300020
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For 32-bit systems which have no usecases for p{m,u}d_pte() prior to
page table checking, implement default stubs.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v9: New patch
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
 arch/powerpc/include/asm/nohash/64/pgtable.h |  2 ++
 arch/powerpc/include/asm/pgtable.h           | 17 +++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8fdb7667c509..2454174b26cb 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -887,6 +887,8 @@ static inline int pud_present(pud_t pud)
 
 extern struct page *pud_page(pud_t pud);
 extern struct page *pmd_page(pmd_t pmd);
+
+#define pud_pte pud_pte
 static inline pte_t pud_pte(pud_t pud)
 {
 	return __pte_raw(pud_raw(pud));
@@ -1043,6 +1045,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
 }
 #endif
 
+#define pmd_pte pmd_pte
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte_raw(pmd_raw(pmd));
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index f58cbebde26e..09a34fe196ae 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -93,6 +93,7 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
+#define pmd_pte pmd_pte
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte(pmd_val(pmd));
@@ -134,6 +135,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 
 extern struct page *pud_page(pud_t pud);
 
+#define pud_pte pud_pte
 static inline pte_t pud_pte(pud_t pud)
 {
 	return __pte(pud_val(pud));
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9c0f2151f08f..d7d0f47760d3 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -233,6 +233,23 @@ static inline int pud_pfn(pud_t pud)
 }
 #endif
 
+#ifndef pmd_pte
+#define pmd_pte pmd_pte
+static inline pte_t pmd_pte(pmd_t pmd)
+{
+	WARN_ONCE(1, "pmd: platform does not use pmd entries directly");
+	return __pte(pmd_val(pmd));
+}
+#endif
+
+#ifndef pud_pte
+#define pud_pte pud_pte
+static inline pte_t pud_pte(pud_t pud)
+{
+	WARN_ONCE(1, "pud: platform does not use pud entries directly");
+	return __pte(pud_val(pud));
+}
+#endif
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.43.0

