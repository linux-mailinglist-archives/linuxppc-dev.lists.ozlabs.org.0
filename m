Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEEC7492E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 03:09:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DnstPRiH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxJN01KwMz3bsX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:09:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DnstPRiH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxJM4332Tz2ywt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 11:08:48 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3660on1B024966;
	Thu, 6 Jul 2023 01:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=edQ8vgcM9tLrKdOXS2pWJ7NAC770/4d60hdzot4KJUM=;
 b=DnstPRiHiVbzsAMrc6E6i+pa8dYp5ZSeE8yEWcQBkmt6WNdddjAPIp/95HbmfhgwzhCT
 TOV4qW4gdkna/GaShJF+GC9h+XgayLhCdEPtmXRyx0qrcCcUw4QVzeYiEqePPhAK6whg
 tHnYAjRZnjqzLC2IVTQVA/5FCgv8xSYVeRDjpXu1F4gSh56zkdSom2vZsRY51R9AeLqq
 YW62DW+1zt7it6pAqKk+lg1zLUoo9gKTAQ9JXP/d6Gos9prQ5ZdLl7lfGo0qsbG8/U8M
 O9Cf4KvPrl7qnXkw4XKpfWnVoDuHa/Sh0mQ237GdM1s1BXCKAMOdA4nMSs5vOCk40l7N Cw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnke98eej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 01:08:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 365NGrJ8007412;
	Thu, 6 Jul 2023 01:08:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4u2a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 01:08:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36618bKx58720716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 01:08:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D1D120043;
	Thu,  6 Jul 2023 01:08:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8FBF20040;
	Thu,  6 Jul 2023 01:08:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 01:08:36 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 48291600D2;
	Thu,  6 Jul 2023 11:08:35 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powermac: Use early_* IO variants in via_calibrate_decr
Date: Thu,  6 Jul 2023 11:08:16 +1000
Message-ID: <20230706010816.72682-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bbpt1WbuTp2Y0uvCa-ieCLKILOvnySSy
X-Proofpoint-ORIG-GUID: bbpt1WbuTp2Y0uvCa-ieCLKILOvnySSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=600 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060007
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a powermac platform, under the call path

  start_kernel
   time_init
    ppc_md.calibrate_decr (pmac_calibrate_decr)
     via_calibrate_decr

we run ioremap and iounmap. The unmap can enable interrupts
unexpectedly (cond_resched in vunmap_pmd_range), which is warned about
later in the boot sequence in start_kernel.

Use the early_* variants of these IO functions to prevent this.

The issue is pre-existing, but is surfaced by commit 721255b9826b
("genirq: Use a maple tree for interrupt descriptor management").
It's not clear to me why this causes it to surface.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/platforms/powermac/time.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 4c5790aff1b5..8633891b7aa5 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -26,8 +26,8 @@
 #include <linux/rtc.h>
 #include <linux/of_address.h>
 
+#include <asm/early_ioremap.h>
 #include <asm/sections.h>
-#include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/nvram.h>
@@ -182,7 +182,7 @@ static int __init via_calibrate_decr(void)
 		return 0;
 	}
 	of_node_put(vias);
-	via = ioremap(rsrc.start, resource_size(&rsrc));
+	via = early_ioremap(rsrc.start, resource_size(&rsrc));
 	if (via == NULL) {
 		printk(KERN_ERR "Failed to map VIA for timer calibration !\n");
 		return 0;
@@ -207,7 +207,7 @@ static int __init via_calibrate_decr(void)
 
 	ppc_tb_freq = (dstart - dend) * 100 / 6;
 
-	iounmap(via);
+	early_iounmap((void *)via, resource_size(&rsrc));
 
 	return 1;
 }
-- 
2.41.0

