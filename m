Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4386622341
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xhk5bSjz3f5y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c2SkuQFB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c2SkuQFB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch1tdPz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94R0LW002411;
	Wed, 9 Nov 2022 04:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gqmramCxS9yrLLYXu6cMM894sTGe4AJWl63Nbk6Q7vE=;
 b=c2SkuQFBmi8DtsL0Nh7vP15FR7uJMbKIpi6VYu33l0v2hZ9Jt19eem8o89m2EKYoXbOt
 NhMDbKtMHRGfiRBCyLNSoWrRLBGDjIXe6tGag/ZgQ7fg/f1vsCdXqB6DuFN32GBpRNwR
 qJ43Ekj9yNMq5wpsWi0t/suuilJJtTa+u/z5unTHK4K29SRjHWOlhq22/SRMYWCFI9kk
 mNMMbQBM9nA29yYZMr2v9XkQIygb1i0Q/A7VlQpVw2T1al6qOgLnsEN/wVHgXhncsxZA
 2GxW7egPYbYoDCodNhfzDQ6SluXmWScAwJVGCbS9zl0+fIFTHW5JM87eobPuW56H3Kku vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh8av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94gD8S019669;
	Wed, 9 Nov 2022 04:51:37 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh89x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94pTQi014746;
	Wed, 9 Nov 2022 04:51:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqdd1vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94pWkS56885676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:51:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 875BB5204F;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 328225204E;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC6466038D;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 5/9] cxl: Use radix__flush_all_mm instead of generic flush_all_mm
Date: Wed,  9 Nov 2022 15:51:08 +1100
Message-Id: <20221109045112.187069-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sKJ67ejjkHCXXsPhfV5ix_-oCseXvpYX
X-Proofpoint-ORIG-GUID: 8YDhQL5rH-VVJfmJPaDVo_NcfVwV3XPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=834 adultscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090028
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The generic implementation of this function isn't really generic (Hash
is not implemented). Unfortunately, the runtime warnings cannot be
replaced with BUILD_BUG's, so it seems safer not to provide a stub in
the first place.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* New in v10 to remove hash__flush_all_mm, hash__local_flush_all_mm
---
 arch/powerpc/include/asm/mmu_context.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index c1ea270bb848..57f5017111f4 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -151,8 +151,8 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
 	 * nMMU and/or PSL need to be cleaned up.
 	 *
 	 * Both the 'copros' and 'active_cpus' counts are looked at in
-	 * flush_all_mm() to determine the scope (local/global) of the
-	 * TLBIs, so we need to flush first before decrementing
+	 * radix__flush_all_mm() to determine the scope (local/global)
+	 * of the TLBIs, so we need to flush first before decrementing
 	 * 'copros'. If this API is used by several callers for the
 	 * same context, it can lead to over-flushing. It's hopefully
 	 * not common enough to be a problem.
@@ -164,7 +164,7 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
 	 * in-between.
 	 */
 	if (radix_enabled()) {
-		flush_all_mm(mm);
+		radix__flush_all_mm(mm);
 
 		c = atomic_dec_if_positive(&mm->context.copros);
 		/* Detect imbalance between add and remove */
-- 
2.38.1

