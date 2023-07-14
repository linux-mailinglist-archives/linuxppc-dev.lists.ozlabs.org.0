Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA9753F1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:39:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsyzRCNO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2bHW1nWwz3cXW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 01:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FsyzRCNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2bBs4jgBz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 01:35:01 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EFNhcm004338;
	Fri, 14 Jul 2023 15:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+RvnfWZAmGRLXbRgAF1QJ11Guj5P6AWFfBClRn7Eijs=;
 b=FsyzRCNOvUdO2O/iCdgbLoUB/hTVgB4Ts0IbTpg+VHJ2yXUYsLP0CyIoCOzeYjbkuCAp
 9aK4M/eSH+js3r9ze2/mweGfhZw0W92iblbh1ln6k2BBp77bFMuHftOPyDVsB7hfB7vC
 ULpjFllh+tifJ0k6pUNY1owygkthE48/lMfVGpDBbripC/t95L6tUdUZZasq1s3jb1Pe
 LOsIbgToKO/1VJylRjtM3chshf62lP/+eeC6iITu6LIu8IqO/42hG2VqitA56+5jM5PM
 RxtioDeCVKoNT+9+etRnIuXp61yOlYUNf02D4xJRupEjFUX44YjB2XgUlw98lPgXu5A0 sw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru8ye06eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:34:58 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36E9nB9l007566;
	Fri, 14 Jul 2023 15:34:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rtpwc8bhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:34:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36EFYpJu48300392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 15:34:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BC832004B;
	Fri, 14 Jul 2023 15:34:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51A4C20040;
	Fri, 14 Jul 2023 15:34:49 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.52.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jul 2023 15:34:49 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH 4/6] integrity: check whether imputed trust is enabled
Date: Fri, 14 Jul 2023 11:34:33 -0400
Message-Id: <20230714153435.28155-5-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230714153435.28155-1-nayna@linux.ibm.com>
References: <20230714153435.28155-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _5KBNV4CSkm2y1G-sJGFw2pbKHyBzaG_
X-Proofpoint-GUID: _5KBNV4CSkm2y1G-sJGFw2pbKHyBzaG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140141
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Nayna Jain <nayna@linux.ibm.com>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

trust_moklist() is specific to UEFI enabled systems. Other platforms
rely only on the Kconfig.

Define a generic wrapper named imputed_trust_enabled().

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 security/integrity/digsig.c                       |  2 +-
 security/integrity/integrity.h                    |  5 +++--
 .../integrity/platform_certs/keyring_handler.c    |  2 +-
 .../integrity/platform_certs/machine_keyring.c    | 15 ++++++++++++++-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/security/integrity/digsig.c b/security/integrity/digsig.c
index 6f31ffe23c48..48d505cacd81 100644
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
index 1649d047e3b8..b3e5df136e50 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -61,7 +61,7 @@ __init efi_element_handler_t get_handler_for_db(const efi_guid_t *sig_type)
 __init efi_element_handler_t get_handler_for_mok(const efi_guid_t *sig_type)
 {
 	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0) {
-		if (IS_ENABLED(CONFIG_INTEGRITY_MACHINE_KEYRING) && trust_moklist())
+		if (IS_ENABLED(CONFIG_INTEGRITY_MACHINE_KEYRING) && imputed_trust_enabled())
 			return add_to_machine_keyring;
 		else
 			return add_to_platform_keyring;
diff --git a/security/integrity/platform_certs/machine_keyring.c b/security/integrity/platform_certs/machine_keyring.c
index 9482e16cb2ca..58cd72b193e6 100644
--- a/security/integrity/platform_certs/machine_keyring.c
+++ b/security/integrity/platform_certs/machine_keyring.c
@@ -60,7 +60,7 @@ static __init bool uefi_check_trust_mok_keys(void)
 	return false;
 }
 
-bool __init trust_moklist(void)
+static bool __init trust_moklist(void)
 {
 	static bool initialized;
 	static bool trust_mok;
@@ -75,3 +75,16 @@ bool __init trust_moklist(void)
 
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

