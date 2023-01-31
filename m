Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24866824C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:45:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bCf4fM1z3f8h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:45:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJeUaFCq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJeUaFCq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5c1NTjz2ymk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V6IWSw004085;
	Tue, 31 Jan 2023 06:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=otnGpFY9MquFvFsvYoPp4smm+BqfHTn69RwFg0TJv9M=;
 b=rJeUaFCqRJZ7d/6p+4WTGzyMuw9lWoRFfIlcalmOnFR0NU63G4l/cUFxaA1stPjupk5p
 mKkFGfDjAdfaPBCIg4fX9uBElgIW66YY8lIBuJ/lxtdndE/IetjGDq7OskxAMOAGKtAG
 7RQdFzoj0tf/NdOOLdLLPgQjHbqxsvQtQxRNhWpA+3pbfakwlVGAN/rJjUBQNSh6f4a9
 cl+dATIPJ6dM8UP95kWdBeK0fINiBY2UuXlzS+IrbdC17rvg9GOxlJiBtZnk9wyA/BGm
 2uJktio0S8oUAFW+P2NIpR0vdwQDqdeo/BBO6uAKJRODYXKVCz5CKT4LDN3zI2ut5nj0 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3newkwgeyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:14 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V6WNWx023597;
	Tue, 31 Jan 2023 06:40:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3newkwgexf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UKWZE2012859;
	Tue, 31 Jan 2023 06:40:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyb3h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6e95F44695846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BFD32004B;
	Tue, 31 Jan 2023 06:40:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D226320043;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B134860805;
	Tue, 31 Jan 2023 17:40:04 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 13/25] powerpc/secvar: Don't print error on ENOENT when reading variables
Date: Tue, 31 Jan 2023 17:39:16 +1100
Message-Id: <20230131063928.388035-14-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Uq7U4V3th2Ym66k5JrpOUsHjKelhk2u
X-Proofpoint-ORIG-GUID: 30oN84RXlwGEBlmnl2Y7s0wEKyk879zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

If attempting to read the size or data attributes of a  non-existent
variable (which will be possible after a later patch to expose the PLPKS
via the secvar interface), don't spam the kernel log with error messages.
Only print errors for return codes that aren't ENOENT.

Reported-by: Sudhakar Kuppusamy <sudhakar@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch
---
 arch/powerpc/kernel/secvar-sysfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 9b6be63b7b36..ca3df3f7156c 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -43,8 +43,8 @@ static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
 
 	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
 	if (rc) {
-		pr_err("Error retrieving %s variable size %d\n", kobj->name,
-		       rc);
+		if (rc != -ENOENT)
+			pr_err("Error retrieving %s variable size %d\n", kobj->name, rc);
 		return rc;
 	}
 
@@ -61,7 +61,8 @@ static ssize_t data_read(struct file *filep, struct kobject *kobj,
 
 	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
 	if (rc) {
-		pr_err("Error getting %s variable size %d\n", kobj->name, rc);
+		if (rc != -ENOENT)
+			pr_err("Error getting %s variable size %d\n", kobj->name, rc);
 		return rc;
 	}
 	pr_debug("dsize is %llu\n", dsize);
-- 
2.39.1

