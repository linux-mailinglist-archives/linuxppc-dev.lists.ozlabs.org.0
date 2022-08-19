Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368A5993BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M875R1hkGz3fZZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hym2tMU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hym2tMU0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vP47vtz3c7r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3Rt6S024070;
	Fri, 19 Aug 2022 03:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jgwyzvvvoqleRhlG7CStW/ahYf4Lsxyh8J1YvmB97fk=;
 b=Hym2tMU0/QJeH31HAyenSgT404uITeLNMl5qBctxQ76y/pyEQmiNS4PhFuPqeSV5DR0+
 OPVd3exvsTG8BzCr0b97KUhuKSE2A1AHc/+AYqfCQk0MDqRm+O4xkLbDAzF6cJVBgTDy
 SLz+yAXIz4OkRV3vLjfQO4ZueUVPkzNKcDDqSgMKJ276INNzuBBL2iTw0rEblVQsQxsT
 o6mg0OWB/m2a7qGFP4DU3umIx6kg9jg5c1kfwIM11bg+rIyA7LZvrYEcZ1ZxKP7eqdhY
 0npq2n49Hon5Lly3zihZvwUwUtPg31lAoB1RBOH4tMAXSPOrUtQWKkwAOx71g48TrpM4 jQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22mwgacc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3cl5f011393;
	Fri, 19 Aug 2022 03:39:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hx3k9ep19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3drKM12845442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A126AE04D;
	Fri, 19 Aug 2022 03:39:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7C15AE045;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AC54E604F8;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 17/18] powerpc/64s: Fix comment on interrupt handler prologue
Date: Fri, 19 Aug 2022 13:38:05 +1000
Message-Id: <20220819033806.162054-18-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BCnlesPXKsN9CE9Pu6dfQ-6gT2FTDv6M
X-Proofpoint-ORIG-GUID: BCnlesPXKsN9CE9Pu6dfQ-6gT2FTDv6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=880
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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

