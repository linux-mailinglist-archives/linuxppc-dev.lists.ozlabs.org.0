Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C725169564B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 03:03:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG4HH2hx2z3cLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 13:03:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AqaOjZ9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AqaOjZ9Y;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG4DH3P7wz3bgd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 13:00:31 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E1i7eb029061;
	Tue, 14 Feb 2023 02:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NW/ZOVX4sveTJ3SZZZwrnzddTX6e4Kq6qOKF3GNilXc=;
 b=AqaOjZ9YwlyqKLjpQCjcnnJKwlYpfsIvzOWM8MzLuQkH/sLkX53YjAGzdBC99WLMe23x
 I2PHek14JZFf8iFbJjTbLy3Rtot1kkCVflkUOSHESs0Pbw3BPN/IrC6CY4Oe7O6cO3Z+
 KaYonsAC7eqQuVIGdYPU1AgT+QUGIlvrcVXEO+fFoFs2xGa6iwf5A2SmF+E2m7bJBnw3
 YIDwP037AeAYZLNeGNSh18sQ6Hnxt9A8cJNdLrHBC8IynO7wjEAHy+2QYoaLaVUATxYn
 i4Ys1OmsxWiICTu6Ywi9l191avNnZLxH76kXLdPWL9/qvvAu65UwZJ5YpU/3puJt2xBz tQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr0w2gb7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31D8KGJf008601;
	Tue, 14 Feb 2023 02:00:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3np2n6afwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31E20KwQ36569514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 02:00:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E63AD20043;
	Tue, 14 Feb 2023 02:00:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6335220049;
	Tue, 14 Feb 2023 02:00:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Feb 2023 02:00:19 +0000 (GMT)
Received: from civic.. (unknown [9.177.28.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8E11B60570;
	Tue, 14 Feb 2023 13:00:15 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct argument
Date: Tue, 14 Feb 2023 12:59:34 +1100
Message-Id: <20230214015939.1853438-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214015939.1853438-1-rmclure@linux.ibm.com>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NSGSqVhi2gCtX8yd3rVT6j6n_th58iH3
X-Proofpoint-GUID: NSGSqVhi2gCtX8yd3rVT6j6n_th58iH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_13,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=574 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140005
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
parameter, with pmdp_collapse_flush a macro that unpacks the vma and
calls __pmdp_collapse_flush. The mm_struct * parameter is needed in a
future patch providing Page Table Check support, which is defined in
terms of mm context objects.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v6: New patch
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb4c67bf45d7..9d8b4e25f5ed 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1244,14 +1244,22 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
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
+#define pmdp_collapse_flush(vma, addr, pmdp)				\
+({									\
+	struct vm_area_struct *_vma = (vma);				\
+	pmd_t _r;							\
+									\
+	_r = __pmdp_collapse_flush(_vma, _vma->vm_mm, (addr), (pmdp));	\
+									\
+	_r;								\
+})
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
-- 
2.37.2

