Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28537674EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 09:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NysSV6qDYz3fLB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tp4E4kQV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tp4E4kQV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nys1y6Kbvz3fJC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 18:43:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K7Vhh6002607;
	Fri, 20 Jan 2023 07:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zTIV6PRVUVjhP5LqIHw2BlDGgUnAlkowALzDmGJNn38=;
 b=Tp4E4kQVfeBFEhoaXq4TFX1JjbZOpEGiyXOdQRy9gs+wLVPFE9/4YPd40OXLJDyClIVU
 st/Pi9xuOlNyLBiQ/Znu4aMf7CnU2SAfK8YztwzN0/pMKoyxF8GAlKISQNf3F0PEF+AD
 x/jAG8IgZFxqtHE2rWUYnEs/d+8izP98GyGw06RRGXiF4pTH3RkQkxMtredT0ezymqVb
 ElpMDd2THqSGoALx96yx/XmT3jdDytaEYLQ0Iub+cTZ+36wo6zMney7GFLx9oC2od9Lz
 H6vR7/qUjJqZAFKyMRAVRCRWwh4UOGbcYrkoJC7rb5mSd7XKUoikO5FMpLzsz3fq1BRe 6Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7pn5074w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JI6nne017303;
	Fri, 20 Jan 2023 07:43:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n3m16dkh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K7hbEn51577222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 07:43:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B55420043;
	Fri, 20 Jan 2023 07:43:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F30920040;
	Fri, 20 Jan 2023 07:43:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 07:43:37 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5EC47609BD;
	Fri, 20 Jan 2023 18:43:30 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v4 23/24] integrity/powerpc: Improve error handling & reporting when loading certs
Date: Fri, 20 Jan 2023 18:43:05 +1100
Message-Id: <20230120074306.1326298-24-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120074306.1326298-1-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bRAPPKGDQav7vgoJpIt36L050mtPuogk
X-Proofpoint-GUID: bRAPPKGDQav7vgoJpIt36L050mtPuogk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200070
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, gcwilson@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

A few improvements to load_powerpc.c:

 - include integrity.h for the pr_fmt()
 - move all error reporting out of get_cert_list()
 - use ERR_PTR() to better preserve error detail
 - don't use pr_err() for missing keys

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch
---
 .../integrity/platform_certs/load_powerpc.c   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index 1e4f80a4e71c..dee51606d5f4 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -14,9 +14,15 @@
 #include <asm/secure_boot.h>
 #include <asm/secvar.h>
 #include "keyring_handler.h"
+#include "../integrity.h"
 
 /*
  * Get a certificate list blob from the named secure variable.
+ *
+ * Returns:
+ *  - a pointer to a kmalloc'd buffer containing the cert list on success
+ *  - NULL if the key does not exist
+ *  - an ERR_PTR on error
  */
 static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
 {
@@ -25,19 +31,19 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
 
 	rc = secvar_ops->get(key, keylen, NULL, size);
 	if (rc) {
-		pr_err("Couldn't get size: %d\n", rc);
-		return NULL;
+		if (rc == -ENOENT)
+			return NULL;
+		return ERR_PTR(rc);
 	}
 
 	db = kmalloc(*size, GFP_KERNEL);
 	if (!db)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	rc = secvar_ops->get(key, keylen, db, size);
 	if (rc) {
 		kfree(db);
-		pr_err("Error reading %s var: %d\n", key, rc);
-		return NULL;
+		return ERR_PTR(rc);
 	}
 
 	return db;
@@ -69,7 +75,11 @@ static int __init load_powerpc_certs(void)
 	 */
 	db = get_cert_list("db", 3, &dbsize);
 	if (!db) {
-		pr_err("Couldn't get db list from firmware\n");
+		pr_info("Couldn't get db list from firmware\n");
+	} else if (IS_ERR(db)) {
+		rc = PTR_ERR(db);
+		pr_err("Error reading db from firmware: %d\n", rc);
+		return rc;
 	} else {
 		rc = parse_efi_signature_list("powerpc:db", db, dbsize,
 					      get_handler_for_db);
@@ -81,6 +91,10 @@ static int __init load_powerpc_certs(void)
 	dbx = get_cert_list("dbx", 4,  &dbxsize);
 	if (!dbx) {
 		pr_info("Couldn't get dbx list from firmware\n");
+	} else if (IS_ERR(dbx)) {
+		rc = PTR_ERR(dbx);
+		pr_err("Error reading dbx from firmware: %d\n", rc);
+		return rc;
 	} else {
 		rc = parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
 					      get_handler_for_dbx);
-- 
2.39.0

