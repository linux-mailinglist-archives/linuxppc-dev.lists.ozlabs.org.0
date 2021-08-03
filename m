Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834473DF073
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 16:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfHXz3kJ1z30Gf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 00:38:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3mmmwNq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f3mmmwNq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfHXV39pJz307Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 00:37:45 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173EaK33032260; Tue, 3 Aug 2021 10:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tLN72oLhqkifL5Ze8gcwxPcar2obJSiBJeWMGeqXaIM=;
 b=f3mmmwNqZ5yWSO6n3A/snNnyfGK8iKfZFqWo4VROlgx/35VnvgLKlTOESg/E59XB1p8N
 6ZXc+4yCDVIlGs6IKb60DKx5F78xmbEuE2BjtatjawbrVJp0WxRAOrmzcGuE5z8HMyuF
 W2pyYvdL6/EY236zEcw19aGzr9ZcX+IXq3vujkiZutbdG9d2NiFTviUhCmP4/kt7Rbch
 J4a8PgtdUhaUaf+s5bEdUG2FVD5E+Ip9U4T1qFJRfqFYHtWFwyUDBYKhxRmN+Zeb1LFP
 gGWadGjfNO0mWZzO7ty1vs/sVd3IP6ssKBqZwUPuMUZh/c8VnI5x46Vb1OSc83hAwo7o Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a76d72jtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 10:37:38 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 173Eb4qi039309;
 Tue, 3 Aug 2021 10:37:37 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a76d72js8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 10:37:37 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173EX2Gq000602;
 Tue, 3 Aug 2021 14:37:36 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3a4x5ckeac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 14:37:36 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173EbZSn36897160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 14:37:35 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52523136067;
 Tue,  3 Aug 2021 14:37:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53D7F136059;
 Tue,  3 Aug 2021 14:37:33 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.83.113])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 14:37:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID tlbie if
 we cross PMD_SIZE
Date: Tue,  3 Aug 2021 20:07:25 +0530
Message-Id: <20210803143725.615186-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g1__6icWIVqu6I2zxp6fUt6f5aMfFaur
X-Proofpoint-GUID: X5TjH2UPwEK0T2VlfYSQ1gkguWwqgYsZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_04:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With shared mapping, even though we are unmapping a large range, the kernel
will force a TLB flush with ptl lock held to avoid the race mentioned in
commit 1cf35d47712d ("mm: split 'tlb_flush_mmu()' into tlb flushing and memory freeing parts")
This results in the kernel issuing a high number of TLB flushes even for a large
range. This can be improved by making sure the kernel switch to pid based flush if the
kernel is unmapping a 2M range.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index aefc100d79a7..21d0f098e43b 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1106,7 +1106,7 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
  * invalidating a full PID, so it has a far lower threshold to change from
  * individual page flushes to full-pid flushes.
  */
-static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
+static unsigned long tlb_single_page_flush_ceiling __read_mostly = 32;
 static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
 
 static inline void __radix__flush_tlb_range(struct mm_struct *mm,
@@ -1133,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	if (fullmm)
 		flush_pid = true;
 	else if (type == FLUSH_TYPE_GLOBAL)
-		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
+		flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
 	else
 		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
 	/*
@@ -1335,7 +1335,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	if (fullmm)
 		flush_pid = true;
 	else if (type == FLUSH_TYPE_GLOBAL)
-		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
+		flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
 	else
 		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
 
@@ -1505,7 +1505,7 @@ void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
 			continue;
 
 		nr_pages = (end - start) >> def->shift;
-		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
+		flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
 
 		/*
 		 * If the number of pages spanning the range is above
-- 
2.31.1

