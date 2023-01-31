Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 270556824C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:46:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bDh0TLMz3fC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:46:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhM8wYOk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhM8wYOk;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5c2DX7z2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:19 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5Wxdl007566;
	Tue, 31 Jan 2023 06:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v7DDCYQBQbsPquSXn556Y6fam/jtnfHZrD2Y/zC3WEw=;
 b=WhM8wYOkRdcEDw19hQVSISu7s1uW7q57WJYIS8emVk0BRy4ysies0zNMKw2yh5GPe911
 egox08eMVuZ4W5yI05JyOX8vbSnFXBeNjFO7ywFW82Am7JRVBbNSbA6faq58anJD0iDJ
 6nO1Xyu71WK+gZ/kl0yu7YgxiH+yFPzy+yTPPrwCB/9qR7CjtdbqjIhHu+T0a/vh8kig
 WpXR1j1gIhXNAYqp1zff6mjyOxp1ELBfletYTgoFGZNnjPGcqmQJukKxeuQGvjElZ+Ye
 TpDdIjaCHAN5kemaQKhMpSVOnHonpVKqsse2I0ZLeVQnxpFd3EqlE9PMIaKkRe1Rrd9w Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3neusy2wys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:14 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V6bfms021088;
	Tue, 31 Jan 2023 06:40:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3neusy2wxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UK8qNV026916;
	Tue, 31 Jan 2023 06:40:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ncvs7k432-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6e89N45875550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEAE220049;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F12220043;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6DE79606E9;
	Tue, 31 Jan 2023 17:40:04 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 09/25] powerpc/secvar: Clean up init error messages
Date: Tue, 31 Jan 2023 17:39:12 +1100
Message-Id: <20230131063928.388035-10-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CY9Fb3P_JkLgSpqqhkuGSm0AO2gdLOEA
X-Proofpoint-ORIG-GUID: jvZXzxIGoFw_uH83BsJcEnRWgwxpscAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=891 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310059
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove unnecessary prefixes from error messages in secvar_sysfs_init()
(the file defines pr_fmt, so putting "secvar:" in every message is
unnecessary). Make capitalisation and punctuation more consistent.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: New patch (ajd)
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 0966806f28c7..8f3deff94009 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -196,13 +196,13 @@ static int secvar_sysfs_init(void)
 	int rc;
 
 	if (!secvar_ops) {
-		pr_warn("secvar: failed to retrieve secvar operations.\n");
+		pr_warn("Failed to retrieve secvar operations\n");
 		return -ENODEV;
 	}
 
 	secvar_kobj = kobject_create_and_add("secvar", firmware_kobj);
 	if (!secvar_kobj) {
-		pr_err("secvar: Failed to create firmware kobj\n");
+		pr_err("Failed to create firmware kobj\n");
 		return -ENOMEM;
 	}
 
@@ -214,7 +214,7 @@ static int secvar_sysfs_init(void)
 
 	secvar_kset = kset_create_and_add("vars", NULL, secvar_kobj);
 	if (!secvar_kset) {
-		pr_err("secvar: sysfs kobject registration failed.\n");
+		pr_err("sysfs kobject registration failed\n");
 		kobject_put(secvar_kobj);
 		return -ENOMEM;
 	}
-- 
2.39.1

