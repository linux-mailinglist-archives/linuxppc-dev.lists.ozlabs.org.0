Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CF5BA679
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNNV47BGz3fFP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IH9fhad3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IH9fhad3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5y2fBjz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:42 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VFdV003827;
	Fri, 16 Sep 2022 05:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5RP1dEcO8uTda1G7LIeGaTEGLlxwcsmROyXdybcoPKo=;
 b=IH9fhad3QscINhUyTYTASHzMBGV+GrltiKbwD3wZxubc/mp7bkaO9yCVceXSknPLvVBh
 6KfXBG1wFJXDw+JMjZgbQkeLIJvCCtM8ms+0iu08vqXNy8EGZ2KpkuU8dk3s18aKYoZK
 wbvn2/8+//Y5UwHZg37VOpN2MVAh4/KQyb32zV3+EBNqvgbMQ1QMIoj6k5ZRXQldPsX5
 RKgbXxLXh05hsQkGgLyisFYo/zrYcgKfu1B8sX/F5lu6UgQT/nckxt7EiffUTOPo9Xk6
 gCf8qboMbap7xAitSuHOgERZIG6jQcwqM1OO/cy/EaBrMuY5hkAMt1JpbA3+riSqir34 iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f81y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5XDF8015044;
	Fri, 16 Sep 2022 05:33:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f81xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kia1020998;
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3jm9218gwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XIoL34013660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28C61AE053;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8BB0AE045;
	Fri, 16 Sep 2022 05:33:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:17 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4AC0960418;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/23] powerpc/64s: Fix comment on interrupt handler prologue
Date: Fri, 16 Sep 2022 15:32:44 +1000
Message-Id: <20220916053300.786330-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -fTgnMgyXts2anJ9lrAWu0yqx537c9Al
X-Proofpoint-GUID: 8mrBHoNBWOzbDA8G8sMKc5WRUxARXkXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=880 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Interrupt handlers on 64s systems will often need to save register state
from the interrupted process to make space for loading special purpose
registers or for internal state.

Fix a comment documenting a common code path macro in the beginning of
interrupt handlers where r10 is saved to the PACA to afford space for
the value of the CFAR. Comment is currently written as if r10-r12 are
saved to PACA, but in fact only r10 is saved, with r11-r12 saved much
later. The distance in code between these saves has grown over the many
revisions of this macro. Fix this by signalling with a comment where
r11-r12 are saved to the PACA.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Nicholas Piggin <npiggin@gmail.com>
---
V1 -> V2: Given its own commit
V2 -> V3: Annotate r11-r12 save locations with comment.
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..a3b51441b039 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -281,7 +281,7 @@ BEGIN_FTR_SECTION
 	mfspr	r9,SPRN_PPR
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
-	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
+	std	r10,IAREA+EX_R10(r13)		/* save r10 */
 	.if ICFAR
 BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_CFAR
@@ -321,7 +321,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mfctr	r10
 	std	r10,IAREA+EX_CTR(r13)
 	mfcr	r9
-	std	r11,IAREA+EX_R11(r13)
+	std	r11,IAREA+EX_R11(r13)		/* save r11 - r12 */
 	std	r12,IAREA+EX_R12(r13)
 
 	/*
-- 
2.34.1

