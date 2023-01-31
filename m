Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA396824EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:55:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bQy2mkXz3f5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:55:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aKyB2/Po;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aKyB2/Po;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5f2d5pz2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5PYO2029039;
	Tue, 31 Jan 2023 06:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U8C+0QlsWH7fAWudF9ims90JHfDey/gQjvgG2A7qCyg=;
 b=aKyB2/Po6mi6UPAx5Mb3498lqP7brZEajgINwM/4hH49tukgYHamN7LmvMXdDycxmfaJ
 rX9N7YxxcM4IrxmqcLYd4U4TYBscU+KFJ5GaksecXmVYE5kW0k1IsPNadB4xmQX5seG+
 qWmCkTi9+YLGyB9NxY8m/dsO8H2yob3/qMHjxvmTESzat1fCED0JaJdqFIZF4rpmROCO
 LHnSuSdFA6oCMzcLccZ8IQpBoSGiOGakJMLO4U9rO9obF4LfCd904vDReNqLCffMsb92
 81yRW9saiGBbcPTsGCmWTwsPoiDjAAv3efeavI2yFVw9AchCYEIn3qV7A3Onq97Ort/j HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nevu21dks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:17 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V5ul1h003960;
	Tue, 31 Jan 2023 06:40:16 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nevu21djw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:16 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UCZfOd025984;
	Tue, 31 Jan 2023 06:40:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ndn6u9g29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6eBCv36766190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFD2E20043;
	Tue, 31 Jan 2023 06:40:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40B1720040;
	Tue, 31 Jan 2023 06:40:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:11 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 91117609C1;
	Tue, 31 Jan 2023 17:40:05 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 25/25] integrity/powerpc: Support loading keys from PLPKS
Date: Tue, 31 Jan 2023 17:39:28 +1100
Message-Id: <20230131063928.388035-26-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R9n9s5sVcu5b0hLQV2-aSv-Va5U5mqMs
X-Proofpoint-GUID: 9-uGLIuU0-_4AgdcK_5hb4nrg6CEJCXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
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

