Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8369199F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmW53b85z3f4J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:05:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcF17GMl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcF17GMl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmV70WLwz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A80bix002178;
	Fri, 10 Feb 2023 08:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xTlYStkg39Zq6lksZloGiyJlSyVApYtqi6JfwV+gBgc=;
 b=JcF17GMl79/A0WVx3hpoLhaVLcd2efJZ8HA7OxaCzSNI3FPKI5S7xKySA21hc2nPQ5+q
 9yy1SqC+opG8XdR5XN00eRrJ0fqje5YP7h98PpRYL4UqZLfxye5TSrs4ibtRjgKB3sEt
 kxe38upO2fC8RqkpG9xAhLP/RTR2L6Dx9A4YPJw2I6z1g9rYPn8SwMdn8As5hdFQY1R8
 kZLbjzLtq1R/RIdM9rFuhDGH3G7oqw6YDmleE7LOOHd/I5kYYp/Xupgs7vqDKdHnvwui
 spohhpyCHngHUzPYbzoba618In7c0VzxwI3XLvKkB/AFqVd7gA19mTlyJxxtsrnf/dV3 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj1r031j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:24 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A82vmU014490;
	Fri, 10 Feb 2023 08:04:24 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj1r030g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319NtHiO003761;
	Fri, 10 Feb 2023 08:04:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06n40b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84IFm44368346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC63B20049;
	Fri, 10 Feb 2023 08:04:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4E2520043;
	Fri, 10 Feb 2023 08:04:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:17 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BF1A4606E8;
	Fri, 10 Feb 2023 19:04:14 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 04/26] powerpc/secvar: Use u64 in secvar_operations
Date: Fri, 10 Feb 2023 19:03:39 +1100
Message-Id: <20230210080401.345462-5-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R7tjIwZKIF-i8-wViDafC6xzvEBwPU1A
X-Proofpoint-GUID: NImE48W92YKamPldFZhUMvZnMfv8EaN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100070
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

From: Michael Ellerman <mpe@ellerman.id.au>

There's no reason for secvar_operations to use uint64_t vs the more
common kernel type u64.

The types are compatible, but they require different printk format
strings which can lead to confusion.

Change all the secvar related routines to use u64.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Russell Currey <ruscur@russell.cc>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: Include new patch
---
 arch/powerpc/include/asm/secvar.h                | 9 +++------
 arch/powerpc/kernel/secvar-sysfs.c               | 8 ++++----
 arch/powerpc/platforms/powernv/opal-secvar.c     | 9 +++------
 security/integrity/platform_certs/load_powerpc.c | 4 ++--
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 4cc35b58b986..07ba36f868a7 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -14,12 +14,9 @@
 extern const struct secvar_operations *secvar_ops;
 
 struct secvar_operations {
-	int (*get)(const char *key, uint64_t key_len, u8 *data,
-		   uint64_t *data_size);
-	int (*get_next)(const char *key, uint64_t *key_len,
-			uint64_t keybufsize);
-	int (*set)(const char *key, uint64_t key_len, u8 *data,
-		   uint64_t data_size);
+	int (*get)(const char *key, u64 key_len, u8 *data, u64 *data_size);
+	int (*get_next)(const char *key, u64 *key_len, u64 keybufsize);
+	int (*set)(const char *key, u64 key_len, u8 *data, u64 data_size);
 };
 
 #ifdef CONFIG_PPC_SECURE_BOOT
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 7fa5f8ed9542..702044edf14d 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -47,7 +47,7 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
 			 char *buf)
 {
-	uint64_t dsize;
+	u64 dsize;
 	int rc;
 
 	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
@@ -64,8 +64,8 @@ static ssize_t data_read(struct file *filep, struct kobject *kobj,
 			 struct bin_attribute *attr, char *buf, loff_t off,
 			 size_t count)
 {
-	uint64_t dsize;
 	char *data;
+	u64 dsize;
 	int rc;
 
 	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
@@ -166,9 +166,9 @@ static int update_kobj_size(void)
 
 static int secvar_sysfs_load(void)
 {
-	char *name;
-	uint64_t namesize = 0;
 	struct kobject *kobj;
+	u64 namesize = 0;
+	char *name;
 	int rc;
 
 	name = kzalloc(NAME_MAX_SIZE, GFP_KERNEL);
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index 14133e120bdd..ef89861569e0 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -54,8 +54,7 @@ static int opal_status_to_err(int rc)
 	return err;
 }
 
-static int opal_get_variable(const char *key, uint64_t ksize,
-			     u8 *data, uint64_t *dsize)
+static int opal_get_variable(const char *key, u64 ksize, u8 *data, u64 *dsize)
 {
 	int rc;
 
@@ -71,8 +70,7 @@ static int opal_get_variable(const char *key, uint64_t ksize,
 	return opal_status_to_err(rc);
 }
 
-static int opal_get_next_variable(const char *key, uint64_t *keylen,
-				  uint64_t keybufsize)
+static int opal_get_next_variable(const char *key, u64 *keylen, u64 keybufsize)
 {
 	int rc;
 
@@ -88,8 +86,7 @@ static int opal_get_next_variable(const char *key, uint64_t *keylen,
 	return opal_status_to_err(rc);
 }
 
-static int opal_set_variable(const char *key, uint64_t ksize, u8 *data,
-			     uint64_t dsize)
+static int opal_set_variable(const char *key, u64 ksize, u8 *data, u64 dsize)
 {
 	int rc;
 
diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index a2900cb85357..1e4f80a4e71c 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -18,7 +18,7 @@
 /*
  * Get a certificate list blob from the named secure variable.
  */
-static __init void *get_cert_list(u8 *key, unsigned long keylen, uint64_t *size)
+static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
 {
 	int rc;
 	void *db;
@@ -51,7 +51,7 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, uint64_t *size)
 static int __init load_powerpc_certs(void)
 {
 	void *db = NULL, *dbx = NULL;
-	uint64_t dbsize = 0, dbxsize = 0;
+	u64 dbsize = 0, dbxsize = 0;
 	int rc = 0;
 	struct device_node *node;
 
-- 
2.39.1

