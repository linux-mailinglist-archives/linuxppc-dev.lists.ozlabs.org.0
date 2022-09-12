Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046505B5297
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 03:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQqHk6hYSz3c3V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:48:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oamck208;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oamck208;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQqH25Rx9z2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 11:47:42 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28BLK4XG026495;
	Mon, 12 Sep 2022 01:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iI974MInPCA+KVUYu4Z+G5iaNuTYIGpXYyR2gS0WdGc=;
 b=oamck208UAeHwF7f2Jxm3hnlm8XK4VgeqAOX944yr5dayM96LJe8tmRsQRZ29HXab8Ow
 F05NrVyPcVLAJ9a0/KFg5WvIPBF6LlJ59ckw74Lr3efHlYmCfbNKbBxsQ+z7mlOTp6jJ
 lWT06vN6IR7I73jc0CDnzRCzYSq+NWXV+lRCrWcYAeNFpDWKVkIlJOoC40vTjSvzqy/q
 0CGurKgw83btdELYrRMoECZtJHs6PSY6ylb2tx5EYZvaSLud1QeKQuXlVJ+YSJl/r4hN
 DWRfzRuU6sbRYZ+DB8lgDCD6DMw1Tv8w8mDaDZgBKQ/M3tNkvtV93aukq6/tAoniEbJZ dA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jh7k849ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 01:47:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C1bk1t023699;
	Mon, 12 Sep 2022 01:47:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3jghuhs8ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 01:47:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C1lVJq40305022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 01:47:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C342AE04D;
	Mon, 12 Sep 2022 01:47:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAF42AE045;
	Mon, 12 Sep 2022 01:47:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 01:47:30 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1BB14600E5;
	Mon, 12 Sep 2022 11:47:28 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc: mm: move pud_pfn stub to common pgtable header
Date: Mon, 12 Sep 2022 11:47:01 +1000
Message-Id: <20220912014703.185471-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F-zVcS3O0tPYZekDKSa2xUv0hdmv6AXi
X-Proofpoint-ORIG-GUID: F-zVcS3O0tPYZekDKSa2xUv0hdmv6AXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-11_14,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209120004
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

The pud_pfn inline call is only referenced on 64-bit Book3S systems,
but its invocations are gated by pud_devmap() invocations, rendering the
body of this function as dead code.

As such, this function is readily exportable to all platforms in the
instance where kernel features depend on it at least being defined.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
 arch/powerpc/include/asm/pgtable.h           | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 392ff48f77df..8874f2a3661d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1411,16 +1411,6 @@ static inline int pgd_devmap(pgd_t pgd)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline int pud_pfn(pud_t pud)
-{
-	/*
-	 * Currently all calls to pud_pfn() are gated around a pud_devmap()
-	 * check so this should never be used. If it grows another user we
-	 * want to know about it.
-	 */
-	BUILD_BUG();
-	return 0;
-}
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
 pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 33f4bf8d22b0..522145b16a07 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -158,6 +158,18 @@ struct seq_file;
 void arch_report_meminfo(struct seq_file *m);
 #endif /* CONFIG_PPC64 */
 
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	/*
+	 * Currently all calls to pud_pfn() are gated around a pud_devmap()
+	 * check so this should never be used. If it grows another user we
+	 * want to know about it.
+	 */
+	BUILD_BUG();
+	return 0;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.34.1

