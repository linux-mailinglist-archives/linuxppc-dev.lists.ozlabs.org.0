Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DDA5BF6E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTr20V0yz3fQq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:02:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GaLkldV6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GaLkldV6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTlF73Dzz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6dJa8030664;
	Wed, 21 Sep 2022 06:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cF39PwrLfuAxLKiNwLN6OZ93WU2Uzob9brPFXq2nFGQ=;
 b=GaLkldV6CM7XFZMprFLz45TdS9jMAN3x10gEDgkxcxlB/x6VHX3YMRcdOThDdZxOlXpg
 2yv6kd7YI7lBIqxremWsHwhwvwVjmd42GFZARF5nwg9//ivbw/zB00+GsaJGIClINqSU
 heilw/UziWINdkEpsdnoOJLDh5H9qLSnBsKdpXC8gJQP5zFVmGt/rrfkXrNM1xLHhGUj
 xOOzC6MVB+HenoveN2Af8o9F1whtZzMEQ4lWmvo2dbGcsOezUmhbEmuIStXjzp/BXS97
 qyBEfUtGJp8cVc4s043d7V0Zv6+Dr0kowhtvxu8ykBMcwrumaoeikC/Dl1iHT1nD1rFJ fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw9r0q2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6m2KU004610;
	Wed, 21 Sep 2022 06:58:13 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw9r0q17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:13 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6pqSF002721;
	Wed, 21 Sep 2022 06:58:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghkm3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6w8pR45613520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D8065204F;
	Wed, 21 Sep 2022 06:58:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EBD765204E;
	Wed, 21 Sep 2022 06:58:07 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A0EAD60060;
	Wed, 21 Sep 2022 16:58:04 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 07/25] powerpc/64s: Fix comment on interrupt handler prologue
Date: Wed, 21 Sep 2022 16:55:47 +1000
Message-Id: <20220921065605.1051927-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qm3nfMrWmxQdMuRFxb3y-xa7H3-J9DwZ
X-Proofpoint-ORIG-GUID: zvBNrs7ZOUzeEm9qZT1Yb1FJx31pzy0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=932 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V2: Given its own commit
V3: Annotate r11-r12 save locations with comment.
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

