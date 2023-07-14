Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA10753F28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:40:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jaZH2lNG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2bKb2G4Hz3ccD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 01:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jaZH2lNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2bBy3St4z3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 01:35:06 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EFMZLs012619;
	Fri, 14 Jul 2023 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ulu5vJbACvbiSK46ko2yUJA6DNl8Z+GY2OmXOKSupq0=;
 b=jaZH2lNGYV2tcInAEhA1Pm7nnEwBDz5nM2uK2uAoNR8oUP9HIUg+VwTaUjJ6MtL5IqHn
 dFxBQ2HyccguC+VHz2SJSIkIZXIbD9dbKYc1GWY+ddMoLqDN496TWO5N+FBhthFDmn8g
 SRFJXenNrncdHYXTm9a7mA9XbcL8rrvGc9CyjWmOGzfW9XpcNZP8qtpd4zAnTFc4q1Q0
 5nazqsWhuTJyZ3j8jJCfCWLey4iSHduFUv2eiVA1041eulnHB0z6gAatOmsCOLU23w1i
 lLRHQNznjcbJHoXwrc1zp6ngYH8y89ETajSdVtrWfHvHRqV9TcJ1Elp6+xsJrOZFu/tW NQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru8xx89h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:35:01 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36EDO0Vf007362;
	Fri, 14 Jul 2023 15:34:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rtpvs217b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:34:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36EFYuDq17433334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 15:34:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E1D72004B;
	Fri, 14 Jul 2023 15:34:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4185E20040;
	Fri, 14 Jul 2023 15:34:54 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.52.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jul 2023 15:34:54 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH 6/6] integrity: PowerVM support for loading third party code signing keys
Date: Fri, 14 Jul 2023 11:34:35 -0400
Message-Id: <20230714153435.28155-7-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230714153435.28155-1-nayna@linux.ibm.com>
References: <20230714153435.28155-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HwOzgwTify1fGTbAt7-M_LdjlMbR_BHa
X-Proofpoint-GUID: HwOzgwTify1fGTbAt7-M_LdjlMbR_BHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140141
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

On secure boot enabled PowerVM LPAR, third party code signing keys are
needed during early boot to verify signed third party modules. These
third party keys are stored in moduledb object in the Platform
KeyStore(PKS).

Load third party code signing keys onto .secondary_trusted_keys keyring.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
Jarkko, this patch is based on Linus master tree branch, which does
not contain the following commits yet:

c9d004712300 integrity: Enforce digitalSignature usage in the ima and
evm keyrings
59b656eb58fe KEYS: DigitalSignature link restriction

 certs/system_keyring.c                        | 22 +++++++++++++++++++
 include/keys/system_keyring.h                 |  8 +++++++
 security/integrity/integrity.h                |  1 +
 .../platform_certs/keyring_handler.c          |  8 +++++++
 .../platform_certs/keyring_handler.h          |  5 +++++
 .../integrity/platform_certs/load_powerpc.c   | 18 ++++++++++++++-
 6 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index a7a49b17ceb1..b0235732c1d4 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -347,3 +347,25 @@ void __init set_platform_trusted_keys(struct key *keyring)
 	platform_trusted_keys = keyring;
 }
 #endif
+
+void __init add_to_secondary_keyring(const char *source, const void *data,
+				     size_t len)
+{
+	key_ref_t key;
+	key_perm_t perm;
+	int rc = 0;
+
+	perm = (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW;
+
+	key = key_create_or_update(make_key_ref(secondary_trusted_keys, 1), "asymmetric",
+				   NULL, data, len, perm,
+				   KEY_ALLOC_NOT_IN_QUOTA);
+	if (IS_ERR(key)) {
+		rc = PTR_ERR(key);
+		pr_err("Problem loading X.509 certificate %d\n", rc);
+	} else {
+		pr_notice("Loaded X.509 cert '%s'\n",
+			  key_ref_to_ptr(key)->description);
+		key_ref_put(key);
+	}
+}
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index 91e080efb918..a57a77ccf003 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -41,8 +41,16 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
 	const struct key_type *type,
 	const union key_payload *payload,
 	struct key *restriction_key);
+
+void __init add_to_secondary_keyring(const char *source, const void *data,
+				     size_t len);
+
 #else
 #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_builtin_trusted
+void __init add_to_secondary_keyring(const char *source, const void *data,
+				     size_t len)
+{
+}
 #endif
 
 #ifdef CONFIG_INTEGRITY_MACHINE_KEYRING
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index d7553c93f5c0..efaa2eb789ad 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -228,6 +228,7 @@ static inline int __init integrity_load_cert(const unsigned int id,
 {
 	return 0;
 }
+
 #endif /* CONFIG_INTEGRITY_SIGNATURE */
 
 #ifdef CONFIG_INTEGRITY_ASYMMETRIC_KEYS
diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
index b3e5df136e50..6095df043498 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -77,6 +77,14 @@ __init efi_element_handler_t get_handler_for_ca_keys(const efi_guid_t *sig_type)
 	return NULL;
 }
 
+__init efi_element_handler_t get_handler_for_code_signing_keys(const efi_guid_t *sig_type)
+{
+	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
+		return add_to_secondary_keyring;
+
+	return NULL;
+}
+
 /*
  * Return the appropriate handler for particular signature list types found in
  * the UEFI dbx and MokListXRT tables.
diff --git a/security/integrity/platform_certs/keyring_handler.h b/security/integrity/platform_certs/keyring_handler.h
index 6f15bb4cc8dc..f92895cc50f6 100644
--- a/security/integrity/platform_certs/keyring_handler.h
+++ b/security/integrity/platform_certs/keyring_handler.h
@@ -34,6 +34,11 @@ efi_element_handler_t get_handler_for_mok(const efi_guid_t *sig_type);
  */
 efi_element_handler_t get_handler_for_ca_keys(const efi_guid_t *sig_type);
 
+/*
+ * Return the handler for particular signature list types for code signing keys.
+ */
+efi_element_handler_t get_handler_for_code_signing_keys(const efi_guid_t *sig_type);
+
 /*
  * Return the handler for particular signature list types found in the dbx.
  */
diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index 6263ce3b3f1e..32c4e5fbf0fb 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -59,7 +59,7 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
 static int __init load_powerpc_certs(void)
 {
 	void *db = NULL, *dbx = NULL, *data = NULL;
-	void *trustedca = NULL;
+	void *trustedca = NULL, *moduledb = NULL;
 	u64 dsize = 0;
 	u64 offset = 0;
 	int rc = 0;
@@ -137,6 +137,22 @@ static int __init load_powerpc_certs(void)
 		kfree(data);
 	}
 
+	data = get_cert_list("moduledb", 9,  &dsize);
+	if (!data) {
+		pr_info("Couldn't get moduledb list from firmware\n");
+	} else if (IS_ERR(data)) {
+		rc = PTR_ERR(data);
+		pr_err("Error reading moduledb from firmware: %d\n", rc);
+	} else {
+		extract_esl(moduledb, data, dsize, offset);
+
+		rc = parse_efi_signature_list("powerpc:moduledb", moduledb, dsize,
+					      get_handler_for_code_signing_keys);
+		if (rc)
+			pr_err("Couldn't parse moduledb signatures: %d\n", rc);
+		kfree(data);
+	}
+
 	return rc;
 }
 late_initcall(load_powerpc_certs);
-- 
2.31.1

