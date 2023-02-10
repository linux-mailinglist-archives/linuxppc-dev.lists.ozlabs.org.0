Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4676919F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmwt6qrDz3fmT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:24:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LGpHkk/u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LGpHkk/u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmVB6jSlz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:34 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A7wePn014028;
	Fri, 10 Feb 2023 08:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rrTNg83lJ7wakaXXcijVCkkIStFN8UYyTvaL1kZX0qY=;
 b=LGpHkk/utfES1QgbsXjjnYp/1mus9L6gXLNOHl9rBaX1CqocrDQ88csmf6MTYO2UGkX9
 ugFzvc78u0V6QbZEfly7BkTq5/QMwl3Js3FJir8x0LsLHuajTRE3Ma+7QEDiohy6Xrbu
 Vyec0PhkmCV7Sef+vIBysvSIG0VtyhgaAHWem705PYCTbYM3OQVfOL8HQZTblLW4+Ibr
 aRKSorh0L78FihdxBJzejmUADl7vmNExBH0/HP8MBjSQ6htIvpgQixCdkOcJEs1x3NhU
 LPGfcI/7nCeku1ZJ6tmA1khjK/uHSc+IBbsxy2z00QxvP9/+Glgke1Bk7LXduwp98JFO gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj0sr5g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:29 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A80uZq020556;
	Fri, 10 Feb 2023 08:04:28 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj0sr5es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:28 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319Bdsn3000395;
	Fri, 10 Feb 2023 08:04:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3nhf06n3uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84NtX29688152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34E722004B;
	Fri, 10 Feb 2023 08:04:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C9E32004F;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 22453609C6;
	Fri, 10 Feb 2023 19:04:16 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 26/26] integrity/powerpc: Support loading keys from PLPKS
Date: Fri, 10 Feb 2023 19:04:01 +1100
Message-Id: <20230210080401.345462-27-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mhrrDLiXlOoUagyQDR59ONps7h0XfGmn
X-Proofpoint-GUID: x-myQ4hbvBCWzWHMna7FIh51ivzA-EI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100070
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

From: Russell Currey <ruscur@russell.cc>

Add support for loading keys from the PLPKS on pseries machines, with the
"ibm,plpks-sb-v1" format.

The object format is expected to be the same, so there shouldn't be any
functional differences between objects retrieved on powernv or pseries.

Unlike on powernv, on pseries the format string isn't contained in the
device tree. Use secvar_ops->format() to fetch the format string in a
generic manner, rather than searching the device tree ourselves.

(The current code searches the device tree for a node compatible with
"ibm,edk2-compat-v1". This patch switches to calling secvar_ops->format(),
which in the case of OPAL/powernv means opal_secvar_format(), which
searches the device tree for a node compatible with "ibm,secvar-backend"
and checks its "format" property. These are equivalent, as skiboot creates
a node with both "ibm,edk2-compat-v1" and "ibm,secvar-backend" as
compatible strings.)

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3: New patch

v4: Pass format buffer size (stefanb, npiggin)

v5: Use sizeof(buf) rather than stating the size twice (npiggin)

    Clarify change to DT compatible strings in commit message (zohar)

    Reword commit message a bit (ajd)
---
 .../integrity/platform_certs/load_powerpc.c     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index dee51606d5f4..b9de70b90826 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -10,7 +10,6 @@
 #include <linux/cred.h>
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <linux/of.h>
 #include <asm/secure_boot.h>
 #include <asm/secvar.h>
 #include "keyring_handler.h"
@@ -59,16 +58,22 @@ static int __init load_powerpc_certs(void)
 	void *db = NULL, *dbx = NULL;
 	u64 dbsize = 0, dbxsize = 0;
 	int rc = 0;
-	struct device_node *node;
+	ssize_t len;
+	char buf[32];
 
 	if (!secvar_ops)
 		return -ENODEV;
 
-	/* The following only applies for the edk2-compat backend. */
-	node = of_find_compatible_node(NULL, NULL, "ibm,edk2-compat-v1");
-	if (!node)
+	len = secvar_ops->format(buf, sizeof(buf));
+	if (len <= 0)
 		return -ENODEV;
 
+	// Check for known secure boot implementations from OPAL or PLPKS
+	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf)) {
+		pr_err("Unsupported secvar implementation \"%s\", not loading certs\n", buf);
+		return -ENODEV;
+	}
+
 	/*
 	 * Get db, and dbx. They might not exist, so it isn't an error if we
 	 * can't get them.
@@ -103,8 +108,6 @@ static int __init load_powerpc_certs(void)
 		kfree(dbx);
 	}
 
-	of_node_put(node);
-
 	return rc;
 }
 late_initcall(load_powerpc_certs);
-- 
2.39.1

