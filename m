Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FC674EC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 08:57:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NysK86RSGz3fND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QKTuzhB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QKTuzhB3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nys1t7364z3fGv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 18:43:46 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K7JfAb027594;
	Fri, 20 Jan 2023 07:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DkjetBvNyupAHj8KhGylZIP4X9T8JCN3PLJ/4RRN4zc=;
 b=QKTuzhB3tbIEqykyYDxEhB+WKJyo4pe3wNzAql1+/BIQ3eh/ETnFLc0sCrSg2kSGefe7
 i1QZ8zvqpFZjH+m59d2BoUsnubCC5RlI43+AF34jLWN6fDyV/JQ9XqLdyfpOJ5pAOR19
 /kMktxPpSQd8Ku5rcgYe5torIGdoaziBA4d0BwyhlSIJebCKj/drov0jy2ly3ju5H1nv
 85Z7LflXYWgAftRFE46FfncRnAf5Vkm0c0Zw67o0NsLRTizSYxoicXVEV1SHesTc+vSK
 d9GRyrplcRbjrFaRT3E7gtjtDPpJoD0vfIsnjMg4Omjslb8MKxBo26S+A2kv4kZDE/hb DQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7pfj8ck8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JLDIIN025743;
	Fri, 20 Jan 2023 07:43:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n3m16dkgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K7haXP23855480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 07:43:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 988E520043;
	Fri, 20 Jan 2023 07:43:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D9A220040;
	Fri, 20 Jan 2023 07:43:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 07:43:36 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6F235609C3;
	Fri, 20 Jan 2023 18:43:30 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v4 24/24] integrity/powerpc: Support loading keys from pseries secvar
Date: Fri, 20 Jan 2023 18:43:06 +1100
Message-Id: <20230120074306.1326298-25-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120074306.1326298-1-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qm1zgF_EukHmA95Zx8ly3KCZV9BOTRcV
X-Proofpoint-GUID: Qm1zgF_EukHmA95Zx8ly3KCZV9BOTRcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The secvar object format is only in the device tree under powernv.
We now have an API call to retrieve it in a generic way, so we should
use that instead of having to handle the DT here.

Add support for pseries secvar, with the "ibm,plpks-sb-v1" format.
The object format is expected to be the same, so there shouldn't be any
functional differences between objects retrieved from powernv and
pseries.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch

v4: Pass format buffer size (stefanb, npiggin)
---
 .../integrity/platform_certs/load_powerpc.c     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index dee51606d5f4..d4ce91bf3fec 100644
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
+	len = secvar_ops->format(buf, 32);
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
2.39.0

