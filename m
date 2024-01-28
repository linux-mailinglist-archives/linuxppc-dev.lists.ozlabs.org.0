Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31983F99F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 21:00:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sY1zb8vB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNMjr0nVdz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 07:00:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sY1zb8vB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNMhC63m7z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 06:59:07 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40SEUaic022216;
	Sun, 28 Jan 2024 19:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ty6vjLOwPP33OPQjO3uFsILZSqZnowDhF4Yj7NgqsI0=;
 b=sY1zb8vBP/MJfDvvMQ1ngSiGOkh5zbG89sLqCvUh6r2rFh5nIXOUqLbWINVhejLcUqrj
 01lrTm3/kaJfVNS7VQXm5vU1bEGGfMoi6adQiO66cGiHsCQYg8SEn+NcNbSrY3x+ur2g
 j+jzWpWTXGcBx66kLHsAcNSliHPfIwsxrKCZotvfg7ggifIMOMxtHwLL1BadmosmZh7F
 r0a36Ktwp5spT9odHM7qP7NWeBg/c7DDbaxW3mOf3Y29v/K0QnMYAVFLBJ4rO9a8A6W+
 iQjPjzHfozGXAP6Al1LGAcvnsZSCxQmnZJNzY/9eZHn1mh69CHt8/xGV86qXZLbgcB3Q zQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vw5nm3mh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 19:58:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40SIopO6007189;
	Sun, 28 Jan 2024 19:58:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwev1urnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 19:58:58 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40SJwtrr34013692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 28 Jan 2024 19:58:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33AA820043;
	Sun, 28 Jan 2024 19:58:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2334520040;
	Sun, 28 Jan 2024 19:58:55 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 28 Jan 2024 19:58:55 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id B30D5E098B; Sun, 28 Jan 2024 20:58:54 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 5/5] sched/vtime: do not include <asm/vtime.h> header
Date: Sun, 28 Jan 2024 20:58:54 +0100
Message-Id: <2402f44309e1c9705501bdc9b798e8fe6d73f905.1706470223.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1706470223.git.agordeev@linux.ibm.com>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vc4e6bh2MHI0qSI1BxnPS8gjiOEC6MYu
X-Proofpoint-ORIG-GUID: Vc4e6bh2MHI0qSI1BxnPS8gjiOEC6MYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=514
 mlxscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401280151
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no architecture-specific code or data left
that generic <linux/vtime.h> needs to know about.
Thus, avoid the inclusion of <asm/vtime.h> header.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/asm-generic/vtime.h | 1 -
 include/linux/vtime.h       | 4 ----
 2 files changed, 5 deletions(-)
 delete mode 100644 include/asm-generic/vtime.h

diff --git a/include/asm-generic/vtime.h b/include/asm-generic/vtime.h
deleted file mode 100644
index b1a49677fe25..000000000000
--- a/include/asm-generic/vtime.h
+++ /dev/null
@@ -1 +0,0 @@
-/* no content, but patch(1) dislikes empty files */
diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 593466ceebed..29dd5b91dd7d 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -5,10 +5,6 @@
 #include <linux/context_tracking_state.h>
 #include <linux/sched.h>
 
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-#include <asm/vtime.h>
-#endif
-
 /*
  * Common vtime APIs
  */
-- 
2.40.1

