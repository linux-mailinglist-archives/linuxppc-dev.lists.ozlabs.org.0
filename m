Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16E67143E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbXp6XlMz3fln
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:32:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dt4iJOiK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dt4iJOiK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4H3rMZz3cdG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:27 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I3C7wt005658;
	Wed, 18 Jan 2023 06:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pSGBK/p1S4qtRP/VoxR01+uYjKCt8SW95Ne9npUDY6Q=;
 b=dt4iJOiK9z+XqTGMNcA1UIgHQuuIrBdQx/i/vOJoA7UKyvqYNSj9uSw9VeohIhv6sg6A
 pDhNo+PQP88j6UFvYzzfdW6k1/1lyYN7VRSNr3t3YW6gw7ZGT5R6fLmIJPSk+AKzjmmQ
 fXj2pFWFQbm6hCEp0o3Jrn8XWcNNopl49mRP5Wge3D+bhyuSGQHGBQAd3CC3aLLCzxO3
 NBvDb2kFzc7+S6PN+PXX8TrE89cmABcW5j0bQa49NaIq8GTaNUYiPs7KbjxoogZDyR59
 RUUyD1uEIKkPZx50Skkq1stUj5dj1YtTtaP0JqSn92vlRWdeL3E8BlRkQI7ojKxWEKsl uw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n68n7u2fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:18 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HNc0Pk030354;
	Wed, 18 Jan 2023 06:11:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16kgr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BD5e40108438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55EB320043;
	Wed, 18 Jan 2023 06:11:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60BF820040;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 49204605F2;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 07/24] powerpc/secvar: Extend sysfs to include config vars
Date: Wed, 18 Jan 2023 17:10:32 +1100
Message-Id: <20230118061049.1006141-8-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tewWwI44R-8DNqf36KS-pMXeCFUAQET8
X-Proofpoint-GUID: tewWwI44R-8DNqf36KS-pMXeCFUAQET8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180051
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

The forthcoming pseries consumer of the secvar API wants to expose a
number of config variables.  Allowing secvar implementations to provide
their own sysfs attributes makes it easy for consumers to expose what
they need to.

This is not being used by the OPAL secvar implementation at present, and
the config directory will not be created if no attributes are set.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: Remove unnecessary "secvar:" prefix from error messages (ajd)

    Merge config attributes into secvar_operations (mpe)
---
 arch/powerpc/include/asm/secvar.h  |  2 ++
 arch/powerpc/kernel/secvar-sysfs.c | 33 +++++++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index b2cb9bb7c540..ebf95386d720 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/sysfs.h>
 
 #define SECVAR_MAX_FORMAT_LEN	30 // max length of string returned by ->format()
 
@@ -21,6 +22,7 @@ struct secvar_operations {
 	int (*set)(const char *key, u64 key_len, u8 *data, u64 data_size);
 	ssize_t (*format)(char *buf);
 	int (*max_size)(u64 *max_size);
+	const struct attribute **config_attrs;
 };
 
 #ifdef CONFIG_PPC_SECURE_BOOT
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 9f0e49bf3903..b82e95a2e415 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -140,6 +140,19 @@ static int update_kobj_size(void)
 	return 0;
 }
 
+static int secvar_sysfs_config(struct kobject *kobj)
+{
+	struct attribute_group config_group = {
+		.name = "config",
+		.attrs = (struct attribute **)secvar_ops->config_attrs,
+	};
+
+	if (secvar_ops->config_attrs)
+		return sysfs_create_group(kobj, &config_group);
+
+	return 0;
+}
+
 static int secvar_sysfs_load(void)
 {
 	struct kobject *kobj;
@@ -202,26 +215,36 @@ static int secvar_sysfs_init(void)
 
 	rc = sysfs_create_file(secvar_kobj, &format_attr.attr);
 	if (rc) {
-		kobject_put(secvar_kobj);
-		return -ENOMEM;
+		pr_err("Failed to create format object\n");
+		rc = -ENOMEM;
+		goto err;
 	}
 
 	secvar_kset = kset_create_and_add("vars", NULL, secvar_kobj);
 	if (!secvar_kset) {
 		pr_err("sysfs kobject registration failed\n");
-		kobject_put(secvar_kobj);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto err;
 	}
 
 	rc = update_kobj_size();
 	if (rc) {
 		pr_err("Cannot read the size of the attribute\n");
-		return rc;
+		goto err;
+	}
+
+	rc = secvar_sysfs_config(secvar_kobj);
+	if (rc) {
+		pr_err("Failed to create config directory\n");
+		goto err;
 	}
 
 	secvar_sysfs_load();
 
 	return 0;
+err:
+	kobject_put(secvar_kobj);
+	return rc;
 }
 
 late_initcall(secvar_sysfs_init);
-- 
2.39.0

