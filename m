Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079A6FD469
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:35:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLK11JpMz3fl5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:35:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWehEvXR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWehEvXR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDS6Hrtz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:31:52 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3QPQw019053;
	Wed, 10 May 2023 03:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sKIsZlqzGUVCq2K2Svz80734k9GCccAN8lIxOrQ2p5Q=;
 b=WWehEvXRON7NDBiA/N/oOUhCbl9G+Or5QqaNUnOV2qaw0tW36whTXIm+SdwJiImpa1TQ
 ZIjkwW7mcJM3guOPAlhRlBZ7HEAH1M4NjTRGo9E8SUeCkADJZZnLIlXp8GT4r7xVVNVn
 OTRM9yfqaJJLsigZ9HGpTOwZc77GSyHvViEV49ENL4gR9MyXl7TtJmQP6qeZelBm9LiD
 /C4FMWdZy/5Uum1QL20QIyoLVfVhoYU4HPgINsHnY1nPXOzhkRT84BF+mwxYzhXqSl9x
 L1el1cl1P9fve4FosJ5p5JTdzYtE1bDDa9RnmC4FYcVX/SAdf29mErxXoQFNRQdxS4Cf lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urb2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3E2lR016496;
	Wed, 10 May 2023 03:31:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urb24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A2oEr7031120;
	Wed, 10 May 2023 03:31:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e8s7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VZaJ26477304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE7772004D;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4290F20040;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0E085605A6;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/11] powerpc: Mark accesses to power_save callback in arch_cpu_idle
Date: Wed, 10 May 2023 13:31:11 +1000
Message-Id: <20230510033117.1395895-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z9fh3513USAEN4Nkh1JRR9szIGGqbEG4
X-Proofpoint-GUID: h5q_Tc287SuW1nkAapD0Wq79a0FyPHl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=966 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100021
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The power_save callback can be overwritten by another core at boot time.
Specifically, null values will be replaced exactly once with the callback
suitable for the particular platform (PowerNV / pseries lpars), making
this value a good candidate for __ro_after_init.

Even with this the case, KCSAN sees unmarked reads to the callback
variable, and notices that unfortunate compiler reorderings could lead
to distinct function pointers being read. In reality this is impossible,
so don't instrument at this read.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: Mark instances at init where the callback is written to, and
data_race() read as there is no capacity for the value to change
underneath.
---
 arch/powerpc/kernel/idle.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index b1c0418b25c8..43d96c0e3b96 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -35,7 +35,7 @@ EXPORT_SYMBOL(cpuidle_disable);
 
 static int __init powersave_off(char *arg)
 {
-	ppc_md.power_save = NULL;
+	WRITE_ONCE(ppc_md.power_save, NULL);
 	cpuidle_disable = IDLE_POWERSAVE_OFF;
 	return 1;
 }
@@ -43,10 +43,13 @@ __setup("powersave=off", powersave_off);
 
 void arch_cpu_idle(void)
 {
+	/* power_save callback assigned only at init so no data race */
+	void (*power_save)(void) = data_race(ppc_md.power_save);
+
 	ppc64_runlatch_off();
 
-	if (ppc_md.power_save) {
-		ppc_md.power_save();
+	if (power_save) {
+		power_save();
 		/*
 		 * Some power_save functions return with
 		 * interrupts enabled, some don't.
-- 
2.37.2

