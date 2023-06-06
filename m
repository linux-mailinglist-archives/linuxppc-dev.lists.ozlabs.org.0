Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F12724A28
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbHVm1Q4Sz3f0f
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 03:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PgpTTLdl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PgpTTLdl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbHTt5Ll7z3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 03:27:14 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356HKt8v012806;
	Tue, 6 Jun 2023 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tf+9H6+wPbrddSLARBiqpXfgZZ5fw/WGYj1RVHwN3OU=;
 b=PgpTTLdlKSOKUA4K69+ifvEHvYlLQOPnqbxrQej+SYajEhurq4eaZ/kufHdd5dMA60mN
 1snFaO9JOVT9KdUaKWfVxa+Yd5Ell7k1OtO+g+Mv4Z1N0DhuopHKrydRa2+F41g3mJ6Y
 OmrtS5vAiJIOFzLguJoiMRwQ4Xe1Z6lRC4Wq1uJrRMMjkw3smmgDiSCxUv+4Bi5V05MV
 rxEq+cYjFX4fNdVbcBx7fj89Tb+IH4ImMrqoRvD+aGwi8qK63TN5stXhcluC8vdhplpz
 gXPNpAbx1FRl4hOLd+6XUkm/qb+eYSrJL2D7reavia+CaarDz2VpMqwXY+FYaBdEOXS8 pQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r294d03mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 17:27:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3567qeJ2014490;
	Tue, 6 Jun 2023 17:27:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qyxahhph8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 17:27:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356HQwMo13370062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 17:26:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 659DA20049;
	Tue,  6 Jun 2023 17:26:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA2B620040;
	Tue,  6 Jun 2023 17:26:55 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.101.222])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 17:26:55 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-integrity <linux-integrity@vger.kernel.org>
Subject: [PATCH] security/integrity: fix pointer to ESL data and its size on pseries
Date: Tue,  6 Jun 2023 13:26:52 -0400
Message-Id: <20230606172652.198227-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mh9IIeRDXFo6BJlckmIqBjcY1ruqOxO6
X-Proofpoint-GUID: mh9IIeRDXFo6BJlckmIqBjcY1ruqOxO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_12,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060147
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Russell Currey <ruscur@russell.cc>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
Extract ESL by stripping off the timestamp before passing to ESL parser.

Fixes: 4b3e71e9a34c ("integrity/powerpc: Support loading keys from PLPKS")
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 .../integrity/platform_certs/load_powerpc.c   | 39 ++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index b9de70b90826..57768cbf1fd3 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -15,6 +15,9 @@
 #include "keyring_handler.h"
 #include "../integrity.h"
 
+#define extract_data(db, data, size, offset)	\
+	do { db = data + offset; size = size - offset; } while (0)
+
 /*
  * Get a certificate list blob from the named secure variable.
  *
@@ -55,8 +58,10 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
  */
 static int __init load_powerpc_certs(void)
 {
+	void *data = NULL;
+	u64 dsize = 0;
+	u64 offset = 0;
 	void *db = NULL, *dbx = NULL;
-	u64 dbsize = 0, dbxsize = 0;
 	int rc = 0;
 	ssize_t len;
 	char buf[32];
@@ -74,38 +79,46 @@ static int __init load_powerpc_certs(void)
 		return -ENODEV;
 	}
 
+	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
+		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
+		offset = 8;
+
 	/*
 	 * Get db, and dbx. They might not exist, so it isn't an error if we
 	 * can't get them.
 	 */
-	db = get_cert_list("db", 3, &dbsize);
-	if (!db) {
+	data = get_cert_list("db", 3, &dsize);
+	if (!data) {
 		pr_info("Couldn't get db list from firmware\n");
-	} else if (IS_ERR(db)) {
-		rc = PTR_ERR(db);
+	} else if (IS_ERR(data)) {
+		rc = PTR_ERR(data);
 		pr_err("Error reading db from firmware: %d\n", rc);
 		return rc;
 	} else {
-		rc = parse_efi_signature_list("powerpc:db", db, dbsize,
+		extract_data(db, data, dsize, offset);
+
+		rc = parse_efi_signature_list("powerpc:db", db, dsize,
 					      get_handler_for_db);
 		if (rc)
 			pr_err("Couldn't parse db signatures: %d\n", rc);
-		kfree(db);
+		kfree(data);
 	}
 
-	dbx = get_cert_list("dbx", 4,  &dbxsize);
-	if (!dbx) {
+	data = get_cert_list("dbx", 4,  &dsize);
+	if (!data) {
 		pr_info("Couldn't get dbx list from firmware\n");
-	} else if (IS_ERR(dbx)) {
-		rc = PTR_ERR(dbx);
+	} else if (IS_ERR(data)) {
+		rc = PTR_ERR(data);
 		pr_err("Error reading dbx from firmware: %d\n", rc);
 		return rc;
 	} else {
-		rc = parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
+		extract_data(dbx, data, dsize, offset);
+
+		rc = parse_efi_signature_list("powerpc:dbx", dbx, dsize,
 					      get_handler_for_dbx);
 		if (rc)
 			pr_err("Couldn't parse dbx signatures: %d\n", rc);
-		kfree(dbx);
+		kfree(data);
 	}
 
 	return rc;
-- 
2.31.1

