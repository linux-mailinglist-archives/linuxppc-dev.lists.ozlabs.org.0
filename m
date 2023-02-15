Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2E6988AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:15:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHDSW230Qz3f3P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 10:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bGhZUlNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bGhZUlNi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHDPV659rz3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 10:12:30 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FKNQUp040859;
	Wed, 15 Feb 2023 23:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hSCA1RTAplu/vMzlswpBRXiRIipMoBynj/LIx5im/E4=;
 b=bGhZUlNiGLrpzMapHVa+FBMh+saGGdw53vPPe6tDavWamM/u87LOpuHpWsQx0CnTh5nz
 H72ydBValdUynzKW9KuJHS4Qzg5DMbZZ5P9mj/+9hZZSIa5V5mCGATjNKulDMGTZJYuW
 grvF7JjwPCTCXvWGct/Uy0MGYagkLcjyX7naki/Yq0DstzzImq68m2Kr3C/ci9I/S/fy
 i627VrDhbNkM3Pg3q/REy/eiTtPb7cMzya2zSSOKj/bK9dsZYU4RUphHVzho8PAGAupA
 hTjtoxt1/l6dgYrcG2yB0TfW3dA/RkcBH4dvwOkyCHNJBuaJgFnQ20P6TMVUQvp4xbyl 6g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns67fbt2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FBNbDG010684;
	Wed, 15 Feb 2023 23:12:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6wxqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FNCIw744696002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 23:12:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 131372004B;
	Wed, 15 Feb 2023 23:12:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8576F20040;
	Wed, 15 Feb 2023 23:12:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 23:12:17 +0000 (GMT)
Received: from civic.. (unknown [9.177.83.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9385760418;
	Thu, 16 Feb 2023 10:12:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct argument
Date: Thu, 16 Feb 2023 10:11:48 +1100
Message-Id: <20230215231153.2147454-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215231153.2147454-1-rmclure@linux.ibm.com>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: De4s_FQPtFPgGvSpD-D65J3g0CjAhpZE
X-Proofpoint-GUID: De4s_FQPtFPgGvSpD-D65J3g0CjAhpZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_13,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=546 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150197
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
v7: Remove explicit `return' in macro. Prefix macro args with __
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

