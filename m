Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748267A542
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1glz0bR3z3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 08:56:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=itIHd8Pk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=itIHd8Pk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1gkx6wpwz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 08:55:37 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OKwiTi001797;
	Tue, 24 Jan 2023 21:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ulWBr2T+yL7S7eOFwc6GaXhAn2/8NPfy7qymXgU98Ng=;
 b=itIHd8PkHOLIN5bbkDnJ10LwdabAx9GGaObxvbq+nWtF3M54CbXH6UDrKKW2sQMZLjnL
 fZQAPEjt5KH3eB6IaXB2mTPkBECc/CvUJp/YY1dxjf5at9wQ5rMYu/mvtCyfoy6fuhsh
 TjCHSiVt5ouQ//c9RjT4EIInvpx4fp0rHUQLBccA3etA7xr0l7ggDEVavOR1CqBKeBi1
 5ftuIgqISwz0bWqWDWahPOakOCyct64URuQcSvlAaIa0KJJmtF7oueK467sDUdHjiq3y
 4nb1UPvoMvvInQ7uPZn/25dQxsjPJMog5EmCQtxRVgKDgvZfZ8WTWd97WdD/YsRxGRP7 1Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na838py5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 21:55:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OJYH43026587;
	Tue, 24 Jan 2023 21:55:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n87p6b41d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 21:55:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OLtREg42598902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 21:55:27 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A0220049;
	Tue, 24 Jan 2023 21:55:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D5DD20040;
	Tue, 24 Jan 2023 21:55:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 21:55:27 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 89405600D5;
	Wed, 25 Jan 2023 08:55:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h local_flush_tlb_page_psize
Date: Wed, 25 Jan 2023 08:54:24 +1100
Message-Id: <20230124215424.9068-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sp2JeD84FGWSSGZouaKvizXLhcqyv9b7
X-Proofpoint-ORIG-GUID: sp2JeD84FGWSSGZouaKvizXLhcqyv9b7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_15,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240199
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
Cc: kernel test robot <lkp@intel.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Converts the BUILD_BUG to a WARN to allow building with a low/unoptimised
compiler.

The original expectation was that a compiler would see that the only
usage of this function was in a function that is only called behind
radix-only guards. And it worked this way on GCC. It seems Clang does
not optimise away this call however, so thinks the function may be
invoked and triggers the build bug as reported by the kernel test robot.

https://lore.kernel.org/llvm/202301212348.eDkowvfF-lkp@intel.com

This fix converts the build bug to a warning to allow builds without
relying on particular compiler optimisation behaviours. The warning is
not rate limited because this implementation should still never be called
as-is, and anyone who might invoke it might appreciate it being very
obvious that it's not behaving as expected.

Fixes: 274d842fa1ef ("powerpc/tlb: Add local flush for page given mm_struct and psize")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 4be572908124..675196884640 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 
-#include <linux/build_bug.h>
+#include <linux/bug.h>
 
 #define MMU_NO_CONTEXT      (0)
 /*
@@ -80,7 +80,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
 					      unsigned long vmaddr, int psize)
 {
-	BUILD_BUG();
+	WARN(1, "Unimplemented local TLB flush with psize");
 }
 
 static inline void local_flush_tlb_mm(struct mm_struct *mm)

base-commit: 53ab112a95086d10dc353ea4f979abb01644bbb6
-- 
2.39.1

