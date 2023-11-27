Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AEB7F98EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 06:50:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o9QLWt9Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdvp22hd0z3clc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 16:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o9QLWt9Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdvlC4sPdz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 16:48:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR5i3dZ006009;
	Mon, 27 Nov 2023 05:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=59mcf6fBIdwg2SNCF1lVg0EMHsi0wmSPoX0uIzmPuCA=;
 b=o9QLWt9Y7mtb0x6f+vTEhgaTN6JXiv3nMfvHUPuSzz8DscefESQnDMOca8WfU8bDe3O3
 V+b7H3baePbfvQobK8IF+SnfWIv74ul70/C17FSMbBqC46JurrKDNxIpjKN0+KEF3An2
 xJ+rvNwE8cFpbz1N8my2PlSGd7rk5qIbeUSJyQ4csWyB2hitMeAvEl7Ay+vDONh9yFvb
 rbxP9mp6SAAXvDFN27EsWdeVeS+9s3mOm+sKyCG/c0uDn1VR/5nBRScZJdvPm8LGw6Zs
 BUsnU4uw7qqdz4nZ04e/Ru+gtcPh9f/sWH229ic8gZfdyDJemtIaJvu/dTtbME0V4WCB xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgdp5gr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:09 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR5TgLv030732;
	Mon, 27 Nov 2023 05:48:08 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgdp5gqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR44AZO007618;
	Mon, 27 Nov 2023 05:48:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfjp8qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR5m6CK26542574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 05:48:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FE6F20148;
	Mon, 27 Nov 2023 05:48:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97F1C20147;
	Mon, 27 Nov 2023 05:48:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 05:48:05 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.177.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 733956030B;
	Mon, 27 Nov 2023 16:48:00 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64: Only warn for kuap locked when KCSAN not present
Date: Mon, 27 Nov 2023 16:46:47 +1100
Message-ID: <20231127054648.1205221-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127054648.1205221-2-rmclure@linux.ibm.com>
References: <20231127054648.1205221-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ob1PPKjzai-ynY2apSI49XHBzrbCYK4f
X-Proofpoint-ORIG-GUID: _vhaxRz7zwe2naOyqdpSkhWYC0QjeC6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_03,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=697 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270039
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
Cc: elver@google.com, arnd@arndb.de, gautam@linux.ibm.com, Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arbitrary instrumented locations, including syscall handlers, can call
arch_local_irq_restore() transitively when KCSAN is enabled, and in turn
also replay_soft_interrupts_irqrestore(). The precondition on entry to
this routine that is checked is that KUAP is enabled (user access
prohibited). Failure to meet this condition only triggers a warning
however, and afterwards KUAP is enabled anyway. That is, KUAP being
disabled on entry is in fact permissable, but not possible on an
uninstrumented kernel.

Disable this assertion only when KCSAN is enabled.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/irq_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index 938e66829eae..1b7e8ebb052a 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -189,7 +189,8 @@ static inline __no_kcsan void replay_soft_interrupts_irqrestore(void)
 	 * and re-locking AMR but we shouldn't get here in the first place,
 	 * hence the warning.
 	 */
-	kuap_assert_locked();
+	if (!IS_ENABLED(CONFIG_KCSAN))
+		kuap_assert_locked();
 
 	if (kuap_state != AMR_KUAP_BLOCKED)
 		set_kuap(AMR_KUAP_BLOCKED);
-- 
2.43.0

