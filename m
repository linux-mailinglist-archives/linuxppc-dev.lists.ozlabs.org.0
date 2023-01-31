Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2446682558
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 08:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bcW4g1mz3f4y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:03:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UDp7S1qO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UDp7S1qO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5v63Zmz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5uXgP010224;
	Tue, 31 Jan 2023 06:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RPhN9mMQhcfjLV7uTVV3s7wKdYfZjdVljGEnBuExVKA=;
 b=UDp7S1qO0ytb+yN/R/cQYIY1saKzzLesjcwKK6JCIvAKsLkGvw0nh2Jew0NtkJzC0o7S
 Ft9Wav96QkQtRXOfSFpr1oLBNG9Npn5gsndNhCjJax6MlqfIj1rq5s1Sjithq7ibcU9I
 TJODS+UzBbNWnDoyG+TZOxJG9+0dNw7fm6cao3gSu7EBMx25H6KsDDiqn273IouBQl0h
 AMXLAVKXk2jKIbukvc2luWKHB9zZIgm2Lo+RnUuEcEwDOIp/mwxAe9UOZS8n01nEGUeb
 Lqsh7699cpZNaYtxrfZmJK2txnYKPQg1IYIB2eyY2pmd5WMI34tRMoOjGppeNGRXBlZ/ 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3new9kgtgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:15 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V6TtVx001270;
	Tue, 31 Jan 2023 06:40:15 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3new9kgtf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UKWpuY013277;
	Tue, 31 Jan 2023 06:40:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyb3h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6e8tv40042892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE5522004E;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E89E2004D;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 27AA9606DB;
	Tue, 31 Jan 2023 17:40:04 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 05/25] powerpc/secvar: Warn and error if multiple secvar ops are set
Date: Tue, 31 Jan 2023 17:39:08 +1100
Message-Id: <20230131063928.388035-6-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 44KXDBwoiFNa-ARbwx_nZUGdbdp45RCJ
X-Proofpoint-GUID: 7DpXq9Zb4Zf0lpX_q4KBBTqZlbbcez3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The secvar code only supports one consumer at a time.

Multiple consumers aren't possible at this point in time, but we'd want
it to be obvious if it ever could happen.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v4: Return an error and don't actually try to set secvar_operations if the
    warning is triggered (npiggin)

v5: Drop "extern" to fix a checkpatch check (snowpatch)
---
 arch/powerpc/include/asm/secvar.h            | 4 ++--
 arch/powerpc/kernel/secvar-ops.c             | 8 ++++++--
 arch/powerpc/platforms/powernv/opal-secvar.c | 4 +---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 07ba36f868a7..a2b5f2203dc5 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -21,11 +21,11 @@ struct secvar_operations {
 
 #ifdef CONFIG_PPC_SECURE_BOOT
 
-extern void set_secvar_ops(const struct secvar_operations *ops);
+int set_secvar_ops(const struct secvar_operations *ops);
 
 #else
 
-static inline void set_secvar_ops(const struct secvar_operations *ops) { }
+static inline int set_secvar_ops(const struct secvar_operations *ops) { return 0; }
 
 #endif
 
diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secvar-ops.c
index 6a29777d6a2d..9c8dd4e7c270 100644
--- a/arch/powerpc/kernel/secvar-ops.c
+++ b/arch/powerpc/kernel/secvar-ops.c
@@ -8,10 +8,14 @@
 
 #include <linux/cache.h>
 #include <asm/secvar.h>
+#include <asm/bug.h>
 
-const struct secvar_operations *secvar_ops __ro_after_init;
+const struct secvar_operations *secvar_ops __ro_after_init = NULL;
 
-void set_secvar_ops(const struct secvar_operations *ops)
+int set_secvar_ops(const struct secvar_operations *ops)
 {
+	if (WARN_ON_ONCE(secvar_ops))
+		return -1;
 	secvar_ops = ops;
+	return 0;
 }
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index ef89861569e0..4c0a3b030fe0 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -113,9 +113,7 @@ static int opal_secvar_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	set_secvar_ops(&opal_secvar_ops);
-
-	return 0;
+	return set_secvar_ops(&opal_secvar_ops);
 }
 
 static const struct of_device_id opal_secvar_match[] = {
-- 
2.39.1

