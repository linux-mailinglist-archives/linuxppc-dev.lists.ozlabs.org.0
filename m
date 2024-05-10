Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCA8C1F75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 10:08:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iebstXhD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbM396DL4z3cYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 18:08:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iebstXhD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbM2Q5XSdz3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 18:08:14 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44A82NB1020425;
	Fri, 10 May 2024 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Yb/vjD8glsfq1SlBLic5YblLSj4cuO72sCftFNzR4Is=;
 b=iebstXhDp5oERp8z25g1LkwTcjwRRINFrQEc6P3gi74lT00gEpW2hZHCv0/g97WBtfmW
 6df5C3iCWGbEyvinq7YmZVGdJRce9/9zIVoWakov7LonW32AQboDjdoXYRBu4rIporm+
 A+KhcKkhn3Qs379fvnvaZ/M2yRIFKkYCgxHp9WpSADWHinEOS/f3tIQ8XfmZChFcyyQn
 lCe1233N1RkLixeX7AB/kybCMar3Zoh8jb7KebRmQqCXRwZOWxnDJxjrWM7xWIeVgmuh
 m7WnSrTEhVBC7VbamhIT8hlh0klYLxKJDckJIWdlOpZtp9+eLnPTrRi8E2Wb7RJ95pxx JQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1fqf00c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 08:08:05 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A7YODI009470;
	Fri, 10 May 2024 08:08:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysfxr233-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 08:08:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44A880o751380730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 08:08:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9F222004D;
	Fri, 10 May 2024 08:07:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B18262004E;
	Fri, 10 May 2024 08:07:58 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 08:07:58 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/85xx: fix compile error without CONFIG_CRASH_DUMP
Date: Fri, 10 May 2024 13:37:57 +0530
Message-ID: <20240510080757.560159-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: coLCGXngZv6SWSWuRM0Avfe4Vqkeb-Cr
X-Proofpoint-GUID: coLCGXngZv6SWSWuRM0Avfe4Vqkeb-Cr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_04,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405100057
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, stable@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 5c4233cc0920 ("powerpc/kdump: Split KEXEC_CORE and
CRASH_DUMP dependency"), crashing_cpu is not available without
CONFIG_CRASH_DUMP. Fix compile error on 64-BIT 85xx owing to this
change.

Cc: stable@vger.kernel.org
Fixes: 5c4233cc0920 ("powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/all/fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de/
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/85xx/smp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 40aa58206888..e52b848b64b7 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -398,6 +398,7 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
 	hard_irq_disable();
 	mpic_teardown_this_cpu(secondary);
 
+#ifdef CONFIG_CRASH_DUMP
 	if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
 		/*
 		 * We enter the crash kernel on whatever cpu crashed,
@@ -406,9 +407,11 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
 		 */
 		disable_threadbit = 1;
 		disable_cpu = cpu_first_thread_sibling(cpu);
-	} else if (sibling != crashing_cpu &&
-		   cpu_thread_in_core(cpu) == 0 &&
-		   cpu_thread_in_core(sibling) != 0) {
+	} else if (sibling == crashing_cpu) {
+		return;
+	}
+#endif
+	if (cpu_thread_in_core(cpu) == 0 && cpu_thread_in_core(sibling) != 0) {
 		disable_threadbit = 2;
 		disable_cpu = sibling;
 	}
-- 
2.45.0

