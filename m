Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0C62F910
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:15:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL1g5K3xz3fFj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:15:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bk1At1qu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bk1At1qu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsZ1Rxqz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:01 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7trK016577
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CE1iyMOdQ9jyfnhOfcTleOv3veUl1M6ljdDNx4GucJY=;
 b=bk1At1quPtYd6+t34w4Sox2lz1Cxw8zFLvN3Dea1B6R2+/ADv3FdgAH6oYDxAzZ1cPd9
 WY4tIei1dKVgcg37Qf4CfYUCUsSuCOvcdAqNlLHTNAEOLvjrjhTfNiDzUfAQp+CI7gjc
 A+t5Dxg2ZhlB1Qc7N5A8b3OQCNi//yFbudKwrrXhvQG92i6AHVSQPENn5nG7zgQI5WWU
 6JHAdHouwucUMVub689B/5jtfH/jEGvoY/iTssp7aVSLL3D1uhlQ82cdPcYlX81RuxNH
 bceMQlEJYDLygEem74eiXj+3AoHIxG5O78RZiY9IlX2Yr9RIwT9K4tlUPZ7SYiCMSJ+c AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6wqrr7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEqlme025760
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6wqrr7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6arp014676;
	Fri, 18 Nov 2022 15:07:57 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma02wdc.us.ibm.com with ESMTP id 3kt34a88d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7tro19268258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:56 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8D8958066;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81E6358055;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/13] powerpc/rtas: define pr_fmt and convert printk call sites
Date: Fri, 18 Nov 2022 09:07:46 -0600
Message-Id: <20221118150751.469393-9-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TI8166asZTyk08ranKEXpZ12VUUUPjYO
X-Proofpoint-GUID: zJpHjALrbIbylyk-kzs9ixH6kaOGPVK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set pr_fmt to "rtas: " and convert the handful of printk() uses in
rtas.c, adjusting the messages to remove now-redundant "RTAS"
strings.

Note that rtas_restart(), rtas_power_off(), and rtas_halt() all
currently use printk() without specifying a log level. These have been
changed to use pr_emerg(), which matches the behavior of
rtas_os_term().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 7a5812624e11..c3142d352f41 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2001 IBM.
  */
 
+#define pr_fmt(fmt)	"rtas: " fmt
+
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/export.h>
@@ -718,8 +720,7 @@ static int rtas_error_rc(int rtas_rc)
 			rc = -ENODEV;
 			break;
 		default:
-			printk(KERN_ERR "%s: unexpected RTAS error %d\n",
-					__func__, rtas_rc);
+			pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
 			rc = -ERANGE;
 			break;
 	}
@@ -923,8 +924,8 @@ void __noreturn rtas_restart(char *cmd)
 {
 	if (rtas_flash_term_hook)
 		rtas_flash_term_hook(SYS_RESTART);
-	printk("RTAS system-reboot returned %d\n",
-	       rtas_call(rtas_token("system-reboot"), 0, 1, NULL));
+	pr_emerg("system-reboot returned %d\n",
+		 rtas_call(rtas_token("system-reboot"), 0, 1, NULL));
 	for (;;);
 }
 
@@ -933,8 +934,8 @@ void rtas_power_off(void)
 	if (rtas_flash_term_hook)
 		rtas_flash_term_hook(SYS_POWER_OFF);
 	/* allow power on only with power button press */
-	printk("RTAS power-off returned %d\n",
-	       rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
+	pr_emerg("power-off returned %d\n",
+		 rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
 	for (;;);
 }
 
@@ -943,8 +944,8 @@ void __noreturn rtas_halt(void)
 	if (rtas_flash_term_hook)
 		rtas_flash_term_hook(SYS_HALT);
 	/* allow power on only with power button press */
-	printk("RTAS power-off returned %d\n",
-	       rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
+	pr_emerg("power-off returned %d\n",
+		 rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
 	for (;;);
 }
 
@@ -979,7 +980,7 @@ void rtas_os_term(char *str)
 	} while (rtas_busy_delay_time(status));
 
 	if (status != 0)
-		printk(KERN_EMERG "ibm,os-term call failed %d\n", status);
+		pr_emerg("ibm,os-term call failed %d\n", status);
 }
 
 /**
-- 
2.37.1

