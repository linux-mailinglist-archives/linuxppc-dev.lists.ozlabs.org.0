Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF66713D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:22:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbKT4mtzz3fNW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:22:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RZLKTcMI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RZLKTcMI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4D1P9Kz3c6l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I3X8PM013916;
	Wed, 18 Jan 2023 06:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YOKVyZlHt9gKVreG+L7L/eHzAmNuRlWREtNcu1SGhnc=;
 b=RZLKTcMItTe6NPOL7ASuN3hVnjT9jEhS/5an9Ef4a506Zxqi8naR1g5kTpR3+JpKwoxd
 kGnCAzwCxHGTuxlMLTNs39XBFnIHtRGYdI0idq/Fu5Jx2RCk6fMY6DFNgSRXFF6qWsnT
 VskAgnzn+7dSz6MvEpuGrMeYluqFJbrQbatliP8X6YhXqfgM9Gajw3Gol09oNIZqdk2d
 0/BY3kf7cA312JqrPOrg98sOSiueIJ8WMM4NCc3Hx1qeCtPQFAX7B858BTONNx4c01pl
 lch8CJjstzPOxeC/sVA7IzFWcgIKSy3wEExaO0II2vo2vK+CrTBexXXIP3tGe2aaEfdn bw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n68ycaq5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:18 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HEZ69c007302;
	Wed, 18 Jan 2023 06:11:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n3m16kgru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BDGv52429126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C57BF20040;
	Wed, 18 Jan 2023 06:11:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFBB820043;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5BC8160954;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 12/24] powerpc/pseries: Move PLPKS constants to header file
Date: Wed, 18 Jan 2023 17:10:37 +1100
Message-Id: <20230118061049.1006141-13-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p9p-OMbiirYkwoAKFCJTpoD6eCpnISex
X-Proofpoint-ORIG-GUID: p9p-OMbiirYkwoAKFCJTpoD6eCpnISex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180051
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

Move the constants defined in plpks.c to plpks.h, and standardise their
naming, so that PLPKS consumers can make use of them later on.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch
---
 arch/powerpc/include/asm/plpks.h       | 36 +++++++++++++---
 arch/powerpc/platforms/pseries/plpks.c | 57 ++++++++++----------------
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 8295502ee93b..6466aadd7145 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -14,14 +14,40 @@
 #include <linux/types.h>
 #include <linux/list.h>
 
-#define OSSECBOOTAUDIT 0x40000000
-#define OSSECBOOTENFORCE 0x20000000
-#define WORLDREADABLE 0x08000000
-#define SIGNEDUPDATE 0x01000000
+// Object policy flags from supported_policies
+#define PLPKS_OSSECBOOTAUDIT	PPC_BIT32(1) // OS secure boot must be audit/enforce
+#define PLPKS_OSSECBOOTENFORCE	PPC_BIT32(2) // OS secure boot must be enforce
+#define PLPKS_PWSET		PPC_BIT32(3) // No access without password set
+#define PLPKS_WORLDREADABLE	PPC_BIT32(4) // Readable without authentication
+#define PLPKS_IMMUTABLE		PPC_BIT32(5) // Once written, object cannot be removed
+#define PLPKS_TRANSIENT		PPC_BIT32(6) // Object does not persist through reboot
+#define PLPKS_SIGNEDUPDATE	PPC_BIT32(7) // Object can only be modified by signed updates
+#define PLPKS_HVPROVISIONED	PPC_BIT32(28) // Hypervisor has provisioned this object
 
-#define PLPKS_VAR_LINUX	0x02
+// Signature algorithm flags from signed_update_algorithms
+#define PLPKS_ALG_RSA2048	PPC_BIT(0)
+#define PLPKS_ALG_RSA4096	PPC_BIT(1)
+
+// Object label OS metadata flags
+#define PLPKS_VAR_LINUX		0x02
 #define PLPKS_VAR_COMMON	0x04
 
+// Flags for which consumer owns an object is owned by
+#define PLPKS_FW_OWNER			0x1
+#define PLPKS_BOOTLOADER_OWNER		0x2
+#define PLPKS_OS_OWNER			0x3
+
+// Flags for label metadata fields
+#define PLPKS_LABEL_VERSION		0
+#define PLPKS_MAX_LABEL_ATTR_SIZE	16
+#define PLPKS_MAX_NAME_SIZE		239
+#define PLPKS_MAX_DATA_SIZE		4000
+
+// Timeouts for PLPKS operations
+#define PLPKS_MAX_TIMEOUT		5000 // msec
+#define PLPKS_FLUSH_SLEEP		10 // msec
+#define PLPKS_FLUSH_SLEEP_RANGE		400
+
 struct plpks_var {
 	char *component;
 	u8 *name;
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 955117f81e50..5bdc093de6fb 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -20,19 +20,6 @@
 #include <asm/machdep.h>
 #include <asm/plpks.h>
 
-#define PKS_FW_OWNER	     0x1
-#define PKS_BOOTLOADER_OWNER 0x2
-#define PKS_OS_OWNER	     0x3
-
-#define LABEL_VERSION	    0
-#define MAX_LABEL_ATTR_SIZE 16
-#define MAX_NAME_SIZE	    239
-#define MAX_DATA_SIZE	    4000
-
-#define PKS_FLUSH_MAX_TIMEOUT 5000 //msec
-#define PKS_FLUSH_SLEEP	      10 //msec
-#define PKS_FLUSH_SLEEP_RANGE 400
-
 static u8 *ospassword;
 static u16 ospasswordlength;
 
@@ -59,7 +46,7 @@ struct label_attr {
 
 struct label {
 	struct label_attr attr;
-	u8 name[MAX_NAME_SIZE];
+	u8 name[PLPKS_MAX_NAME_SIZE];
 	size_t size;
 };
 
@@ -122,7 +109,7 @@ static int pseries_status_to_err(int rc)
 static int plpks_gen_password(void)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
-	u8 *password, consumer = PKS_OS_OWNER;
+	u8 *password, consumer = PLPKS_OS_OWNER;
 	int rc;
 
 	password = kzalloc(maxpwsize, GFP_KERNEL);
@@ -158,7 +145,7 @@ static struct plpks_auth *construct_auth(u8 consumer)
 {
 	struct plpks_auth *auth;
 
-	if (consumer > PKS_OS_OWNER)
+	if (consumer > PLPKS_OS_OWNER)
 		return ERR_PTR(-EINVAL);
 
 	auth = kzalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
@@ -168,7 +155,7 @@ static struct plpks_auth *construct_auth(u8 consumer)
 	auth->version = 1;
 	auth->consumer = consumer;
 
-	if (consumer == PKS_FW_OWNER || consumer == PKS_BOOTLOADER_OWNER)
+	if (consumer == PLPKS_FW_OWNER || consumer == PLPKS_BOOTLOADER_OWNER)
 		return auth;
 
 	memcpy(auth->password, ospassword, ospasswordlength);
@@ -188,7 +175,7 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 	struct label *label;
 	size_t slen;
 
-	if (!name || namelen > MAX_NAME_SIZE)
+	if (!name || namelen > PLPKS_MAX_NAME_SIZE)
 		return ERR_PTR(-EINVAL);
 
 	slen = strlen(component);
@@ -202,9 +189,9 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 	if (component)
 		memcpy(&label->attr.prefix, component, slen);
 
-	label->attr.version = LABEL_VERSION;
+	label->attr.version = PLPKS_LABEL_VERSION;
 	label->attr.os = varos;
-	label->attr.length = MAX_LABEL_ATTR_SIZE;
+	label->attr.length = PLPKS_MAX_LABEL_ATTR_SIZE;
 	memcpy(&label->name, name, namelen);
 
 	label->size = sizeof(struct label_attr) + namelen;
@@ -266,10 +253,10 @@ static int plpks_confirm_object_flushed(struct label *label,
 		if (!rc && status == 1)
 			break;
 
-		usleep_range(PKS_FLUSH_SLEEP,
-			     PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_RANGE);
-		timeout = timeout + PKS_FLUSH_SLEEP;
-	} while (timeout < PKS_FLUSH_MAX_TIMEOUT);
+		usleep_range(PLPKS_FLUSH_SLEEP,
+			     PLPKS_FLUSH_SLEEP + PLPKS_FLUSH_SLEEP_RANGE);
+		timeout = timeout + PLPKS_FLUSH_SLEEP;
+	} while (timeout < PLPKS_MAX_TIMEOUT);
 
 	rc = pseries_status_to_err(rc);
 
@@ -284,13 +271,13 @@ int plpks_write_var(struct plpks_var var)
 	int rc;
 
 	if (!var.component || !var.data || var.datalen <= 0 ||
-	    var.namelen > MAX_NAME_SIZE || var.datalen > MAX_DATA_SIZE)
+	    var.namelen > PLPKS_MAX_NAME_SIZE || var.datalen > PLPKS_MAX_DATA_SIZE)
 		return -EINVAL;
 
-	if (var.policy & SIGNEDUPDATE)
+	if (var.policy & PLPKS_SIGNEDUPDATE)
 		return -EINVAL;
 
-	auth = construct_auth(PKS_OS_OWNER);
+	auth = construct_auth(PLPKS_OS_OWNER);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
 
@@ -322,10 +309,10 @@ int plpks_remove_var(char *component, u8 varos, struct plpks_var_name vname)
 	struct label *label;
 	int rc;
 
-	if (!component || vname.namelen > MAX_NAME_SIZE)
+	if (!component || vname.namelen > PLPKS_MAX_NAME_SIZE)
 		return -EINVAL;
 
-	auth = construct_auth(PKS_OS_OWNER);
+	auth = construct_auth(PLPKS_OS_OWNER);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
 
@@ -357,14 +344,14 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 	u8 *output;
 	int rc;
 
-	if (var->namelen > MAX_NAME_SIZE)
+	if (var->namelen > PLPKS_MAX_NAME_SIZE)
 		return -EINVAL;
 
 	auth = construct_auth(consumer);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
 
-	if (consumer == PKS_OS_OWNER) {
+	if (consumer == PLPKS_OS_OWNER) {
 		label = construct_label(var->component, var->os, var->name,
 					var->namelen);
 		if (IS_ERR(label)) {
@@ -379,7 +366,7 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 		goto out_free_label;
 	}
 
-	if (consumer == PKS_OS_OWNER)
+	if (consumer == PLPKS_OS_OWNER)
 		rc = plpar_hcall(H_PKS_READ_OBJECT, retbuf, virt_to_phys(auth),
 				 virt_to_phys(label), label->size, virt_to_phys(output),
 				 maxobjsize);
@@ -419,17 +406,17 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 
 int plpks_read_os_var(struct plpks_var *var)
 {
-	return plpks_read_var(PKS_OS_OWNER, var);
+	return plpks_read_var(PLPKS_OS_OWNER, var);
 }
 
 int plpks_read_fw_var(struct plpks_var *var)
 {
-	return plpks_read_var(PKS_FW_OWNER, var);
+	return plpks_read_var(PLPKS_FW_OWNER, var);
 }
 
 int plpks_read_bootloader_var(struct plpks_var *var)
 {
-	return plpks_read_var(PKS_BOOTLOADER_OWNER, var);
+	return plpks_read_var(PLPKS_BOOTLOADER_OWNER, var);
 }
 
 static __init int pseries_plpks_init(void)
-- 
2.39.0

