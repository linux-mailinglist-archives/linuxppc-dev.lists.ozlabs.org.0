Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95177CBF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 13:47:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XPbbaNhO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ8d72j7fz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 21:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XPbbaNhO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ8bk118xz3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 21:45:53 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37FBabte022879;
	Tue, 15 Aug 2023 11:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2K+xOl9iCiEdHbs8U9vWbwZhgSfvBN7iaw7oWsKkQPc=;
 b=XPbbaNhOnU8UFf4Lnvjkk37nYdZ3TxihizCdZoTUQ5M3gxyQX4gFenyJcuIfodhbANJQ
 Wc9OAb3Vkmi7hLO+KuNK4vtlTZ9yDmAwafsPLSI6c1qc+qZuHE7Lom5tZsrghD28G8w7
 3r7Alpfu1SXcjbdBclHqL1a6tJKMsGY1IKNdaffr8DTWsHjAN2N4kelk+HN29ApxCzUh
 lM2t+OzGqTKAvFBKsjACGvCgh8aFOf+dMs+sFPL/ZR91DeG/y5MucAMgLjrLo+R2u0Lj
 huVYAMltseboaQVfE2glNRpQjqssJ48Rmy6TiZEQj6vB4mSfneIydxBrx0foUqa2EIe6 fQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sg8gvg6dd-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 11:45:49 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37F8cXlO018831;
	Tue, 15 Aug 2023 11:27:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3seq41bsgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 11:27:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37FBRj9H22151742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Aug 2023 11:27:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 541162004B;
	Tue, 15 Aug 2023 11:27:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCDD020040;
	Tue, 15 Aug 2023 11:27:42 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.3.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Aug 2023 11:27:42 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v4 4/6] integrity: check whether imputed trust is enabled
Date: Tue, 15 Aug 2023 07:27:20 -0400
Message-Id: <20230815112722.1591829-5-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230815112722.1591829-1-nayna@linux.ibm.com>
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xFpLP3FvDYwU2X2lsCA1AdThV3mQ-91U
X-Proofpoint-ORIG-GUID: xFpLP3FvDYwU2X2lsCA1AdThV3mQ-91U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_10,2023-08-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150103
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, inux-kernel@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

trust_moklist() is specific to UEFI enabled systems. Other platforms
rely only on the Kconfig.

Define a generic wrapper named imputed_trust_enabled().

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/digsig.c                    |  2 +-
 security/integrity/integrity.h                 |  5 +++--
 .../integrity/platform_certs/keyring_handler.c |  3 ++-
 .../integrity/platform_certs/machine_keyring.c | 18 ++++++++++++++++--
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/security/integrity/digsig.c b/security/integrity/digsig.c
index d0704b1597d4..df387de29bfa 100644
--- a/security/integrity/digsig.c
+++ b/security/integrity/digsig.c
@@ -113,7 +113,7 @@ static int __init __integrity_init_keyring(const unsigned int id,
 	} else {
 		if (id == INTEGRITY_KEYRING_PLATFORM)
 			set_platform_trusted_keys(keyring[id]);
-		if (id == INTEGRITY_KEYRING_MACHINE && trust_moklist())
+		if (id == INTEGRITY_KEYRING_MACHINE && imputed_trust_enabled())
 			set_machine_trusted_keys(keyring[id]);
 		if (id == INTEGRITY_KEYRING_IMA)
 			load_module_cert(keyring[id]);
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index 7167a6e99bdc..d7553c93f5c0 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -320,13 +320,14 @@ static inline void __init add_to_platform_keyring(const char *source,
 
 #ifdef CONFIG_INTEGRITY_MACHINE_KEYRING
 void __init add_to_machine_keyring(const char *source, const void *data, size_t len);
-bool __init trust_moklist(void);
+bool __init imputed_trust_enabled(void);
 #else
 static inline void __init add_to_machine_keyring(const char *source,
 						  const void *data, size_t len)
 {
 }
-static inline bool __init trust_moklist(void)
+
+static inline bool __init imputed_trust_enabled(void)
 {
 	return false;
 }
diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
index 1649d047e3b8..586027b9a3f5 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -61,7 +61,8 @@ __init efi_element_handler_t get_handler_for_db(const efi_guid_t *sig_type)
 __init efi_element_handler_t get_handler_for_mok(const efi_guid_t *sig_type)
 {
 	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0) {
-		if (IS_ENABLED(CONFIG_INTEGRITY_MACHINE_KEYRING) && trust_moklist())
+		if (IS_ENABLED(CONFIG_INTEGRITY_MACHINE_KEYRING) &&
+		    imputed_trust_enabled())
 			return add_to_machine_keyring;
 		else
 			return add_to_platform_keyring;
diff --git a/security/integrity/platform_certs/machine_keyring.c b/security/integrity/platform_certs/machine_keyring.c
index 9482e16cb2ca..a401640a63cd 100644
--- a/security/integrity/platform_certs/machine_keyring.c
+++ b/security/integrity/platform_certs/machine_keyring.c
@@ -34,7 +34,8 @@ void __init add_to_machine_keyring(const char *source, const void *data, size_t
 	 * If the restriction check does not pass and the platform keyring
 	 * is configured, try to add it into that keyring instead.
 	 */
-	if (rc && efi_enabled(EFI_BOOT) && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
+	if (rc && efi_enabled(EFI_BOOT) &&
+	    IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
 		rc = integrity_load_cert(INTEGRITY_KEYRING_PLATFORM, source,
 					 data, len, perm);
 
@@ -60,7 +61,7 @@ static __init bool uefi_check_trust_mok_keys(void)
 	return false;
 }
 
-bool __init trust_moklist(void)
+static bool __init trust_moklist(void)
 {
 	static bool initialized;
 	static bool trust_mok;
@@ -75,3 +76,16 @@ bool __init trust_moklist(void)
 
 	return trust_mok;
 }
+
+/*
+ * Provides platform specific check for trusting imputed keys before loading
+ * on .machine keyring. UEFI systems enable this trust based on a variable,
+ * and for other platforms, it is always enabled.
+ */
+bool __init imputed_trust_enabled(void)
+{
+	if (efi_enabled(EFI_BOOT))
+		return trust_moklist();
+
+	return true;
+}
-- 
2.31.1

