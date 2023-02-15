Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 082E5697417
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 03:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGhKB6p0pz3cfW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:06:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g8BzUrwS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g8BzUrwS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGhG95WRWz3c6y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 13:04:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F1g82X013704;
	Wed, 15 Feb 2023 02:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qmP4KPao04LG+v7mxmQoLGhWBScCO458YAMQRaei39c=;
 b=g8BzUrwSoZL0OTlFOP+OfVCtcfiNi4yS0TBkdvK60zoyKJUbtcxRCcJoaTAZIWITyIHv
 WzasRlPtN8l3YDVjpDONQOhx/zas9lJJTp8sv+aNhbGChJp4tAC9cBz+Xw2FXR6UCuq4
 /Ajkt8PN2c9OEtC3Aa/BxjA2gLeOyhVW9K0/IXpGp3MJpN5AJ3JNAQBg2JTe4D7dfjMb
 s2ZBQQZ9rajEwRWDs1P4OUUM2gAOWkW1vIZW2O1qb2+569icS42TznrkDKuWntsNZIS/
 0ZKwflfuVJiuA/zDa7naikWe1FHHlqzDxYU0C7kQ/p0MEDUCo25xc3cKS8ED9Saop19e TA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrny0gka0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EJhP41017640;
	Wed, 15 Feb 2023 02:04:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6mrsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F244d046268758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 02:04:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60B3420049;
	Wed, 15 Feb 2023 02:04:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDED820040;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9444C60425;
	Wed, 15 Feb 2023 13:04:01 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct argument
Date: Wed, 15 Feb 2023 13:01:50 +1100
Message-Id: <20230215020155.1969194-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215020155.1969194-1-rmclure@linux.ibm.com>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6NobVIYPDeeuVPm8h5YJ-YYmCIjoKab4
X-Proofpoint-GUID: 6NobVIYPDeeuVPm8h5YJ-YYmCIjoKab4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=535 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150017
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

pmdp_collapse_flush has references in generic code with just three
parameters, due to the choice of mm context being implied by the vm_area
context parameter.

Define __pmdp_collapse_flush to accept an additional mm_struct *
parameter, with pmdp_collapse_flush an inline function that unpacks
the vma and calls __pmdp_collapse_flush. The mm_struct * parameter
is needed in a future patch providing Page Table Check support,
which is defined in terms of mm context objects.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v6: New patch
v7: Remove explicit `return' in macro. Prefix macro args with __,
as done with ptep_test_and_clear_young.
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb4c67bf45d7..7e0d546f4b3c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1244,14 +1244,19 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
 }
 
-static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
-					unsigned long address, pmd_t *pmdp)
+static inline pmd_t __pmdp_collapse_flush(struct vm_area_struct *vma, struct mm_struct *mm,
+					  unsigned long address, pmd_t *pmdp)
 {
 	if (radix_enabled())
 		return radix__pmdp_collapse_flush(vma, address, pmdp);
 	return hash__pmdp_collapse_flush(vma, address, pmdp);
 }
-#define pmdp_collapse_flush pmdp_collapse_flush
+#define pmdp_collapse_flush(__vma, __addr, __pmdp)			\
+({									\
+	struct vm_area_struct *_vma = (__vma);				\
+									\
+	__pmdp_collapse_flush(_vma, _vma->vm_mm, (__addr), (__pmdp));	\
+})
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
-- 
2.37.2

