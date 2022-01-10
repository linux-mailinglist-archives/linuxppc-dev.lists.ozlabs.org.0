Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AF489AD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXb0s5F0Xz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:54:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mKenB4Cl;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tHBKSy4U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mKenB4Cl; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tHBKSy4U; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXZvl0xjGz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 00:50:10 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0DC7D212BB;
 Mon, 10 Jan 2022 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641822608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8UfsVs9ewQVYRAbN7Ug1IzhKfCrKnLEWfDZ94pDZQ8=;
 b=mKenB4Clw5CYe+TAg15IUaDmLkwbLOVkUcU8tymww/MniKePlDSYxOY4aDwwfdbHke7Bgw
 DWtBIuf/zidfvBtVfPMkZOO+XHaRnWdMWYwyoXPNS+FoDyy0aKTz2zKX1F0KVCtAIdXK8K
 SNJVdWvN0kn9xPKJP/tQDfZsjx8dBS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641822608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8UfsVs9ewQVYRAbN7Ug1IzhKfCrKnLEWfDZ94pDZQ8=;
 b=tHBKSy4UOfGBis4IGWS254lpdyHkmiPEhyj48Ig1bycfLuI0amwmH5IgzM1xlooypS3zng
 LK+y4Yd+6fGmSNDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id BB06EA3B8D;
 Mon, 10 Jan 2022 13:50:07 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v4 6/6] module: Move duplicate mod_check_sig users code to
 mod_parse_sig
Date: Mon, 10 Jan 2022 14:49:58 +0100
Message-Id: <59d134a3eae4fa802ed9135385cee6fe4838ec01.1641822505.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641822505.git.msuchanek@suse.de>
References: <cover.1641822505.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Michal Suchanek <msuchanek@suse.de>, "Serge E. Hallyn" <serge@hallyn.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Multiple users of mod_check_sig check for the marker, then call
mod_check_sig, extract signature length, and remove the signature.

Put this code in one place together with mod_check_sig.

This changes the error from ENOENT to ENODATA for ima_read_modsig in the
case the signature marker is missing.

This also changes the buffer length in ima_read_modsig from size_t to
unsigned long. This reduces the possible value range on 32bit but the
length refers to kernel in-memory buffer which cannot be longer than
ULONG_MAX.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v3: - Philipp Rudo <prudo@redhat.com>: Update the commit with note about
      change of raturn value
    - Preserve the EBADMSG error code while moving code araound
v4: - remove unused variable ms in module_signing
    - note about buffer length
---
 include/linux/module_signature.h    |  1 +
 kernel/module_signature.c           | 56 ++++++++++++++++++++++++++++-
 kernel/module_signing.c             | 27 +++-----------
 security/integrity/ima/ima_modsig.c | 22 ++----------
 4 files changed, 63 insertions(+), 43 deletions(-)

diff --git a/include/linux/module_signature.h b/include/linux/module_signature.h
index 7eb4b00381ac..1343879b72b3 100644
--- a/include/linux/module_signature.h
+++ b/include/linux/module_signature.h
@@ -42,5 +42,6 @@ struct module_signature {
 
 int mod_check_sig(const struct module_signature *ms, size_t file_len,
 		  const char *name);
+int mod_parse_sig(const void *data, size_t *len, size_t *sig_len, const char *name);
 
 #endif /* _LINUX_MODULE_SIGNATURE_H */
diff --git a/kernel/module_signature.c b/kernel/module_signature.c
index 00132d12487c..b8eb30182183 100644
--- a/kernel/module_signature.c
+++ b/kernel/module_signature.c
@@ -8,14 +8,36 @@
 
 #include <linux/errno.h>
 #include <linux/printk.h>
+#include <linux/string.h>
 #include <linux/module_signature.h>
 #include <asm/byteorder.h>
 
+/**
+ * mod_check_sig_marker - check that the given data has signature marker at the end
+ *
+ * @data:	Data with appended signature
+ * @len:	Length of data. Signature marker length is subtracted on success.
+ */
+static inline int mod_check_sig_marker(const void *data, size_t *len)
+{
+	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
+
+	if (markerlen > *len)
+		return -ENODATA;
+
+	if (memcmp(data + *len - markerlen, MODULE_SIG_STRING,
+		   markerlen))
+		return -ENODATA;
+
+	*len -= markerlen;
+	return 0;
+}
+
 /**
  * mod_check_sig - check that the given signature is sane
  *
  * @ms:		Signature to check.
- * @file_len:	Size of the file to which @ms is appended.
+ * @file_len:	Size of the file to which @ms is appended (without the marker).
  * @name:	What is being checked. Used for error messages.
  */
 int mod_check_sig(const struct module_signature *ms, size_t file_len,
@@ -44,3 +66,35 @@ int mod_check_sig(const struct module_signature *ms, size_t file_len,
 
 	return 0;
 }
+
+/**
+ * mod_parse_sig - check that the given signature is sane and determine signature length
+ *
+ * @data:	Data with appended signature.
+ * @len:	Length of data. Signature and marker length is subtracted on success.
+ * @sig_len:	Length of signature. Filled on success.
+ * @name:	What is being checked. Used for error messages.
+ */
+int mod_parse_sig(const void *data, size_t *len, size_t *sig_len, const char *name)
+{
+	const struct module_signature *sig;
+	int rc;
+
+	rc = mod_check_sig_marker(data, len);
+	if (rc)
+		return rc;
+
+	if (*len < sizeof(*sig))
+		return -EBADMSG;
+
+	sig = (const struct module_signature *)(data + (*len - sizeof(*sig)));
+
+	rc = mod_check_sig(sig, *len, name);
+	if (rc)
+		return rc;
+
+	*sig_len = be32_to_cpu(sig->sig_len);
+	*len -= *sig_len + sizeof(*sig);
+
+	return 0;
+}
diff --git a/kernel/module_signing.c b/kernel/module_signing.c
index 20857d2a15ca..1d4cb03cce21 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -25,35 +25,16 @@ int verify_appended_signature(const void *data, unsigned long *len,
 			      struct key *trusted_keys,
 			      enum key_being_used_for purpose)
 {
-	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
-	struct module_signature *ms;
-	unsigned long sig_len, modlen = *len;
+	unsigned long sig_len;
 	int ret;
 
-	pr_devel("==>%s %s(,%lu)\n", __func__, key_being_used_for[purpose], modlen);
+	pr_devel("==>%s %s(,%lu)\n", __func__, key_being_used_for[purpose], *len);
 
-	if (markerlen > modlen)
-		return -ENODATA;
-
-	if (memcmp(data + modlen - markerlen, MODULE_SIG_STRING,
-		   markerlen))
-		return -ENODATA;
-	modlen -= markerlen;
-
-	if (modlen <= sizeof(*ms))
-		return -EBADMSG;
-
-	ms = data + modlen - sizeof(*ms);
-
-	ret = mod_check_sig(ms, modlen, key_being_used_for[purpose]);
+	ret = mod_parse_sig(data, len, &sig_len, key_being_used_for[purpose]);
 	if (ret)
 		return ret;
 
-	sig_len = be32_to_cpu(ms->sig_len);
-	modlen -= sig_len + sizeof(*ms);
-	*len = modlen;
-
-	return verify_pkcs7_signature(data, modlen, data + modlen, sig_len,
+	return verify_pkcs7_signature(data, *len, data + *len, sig_len,
 				      trusted_keys,
 				      purpose,
 				      NULL, NULL);
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index fb25723c65bc..b40c8fdf6139 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -37,33 +37,17 @@ struct modsig {
  *
  * Return: 0 on success, error code otherwise.
  */
-int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
+int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t len,
 		    struct modsig **modsig)
 {
-	const size_t marker_len = strlen(MODULE_SIG_STRING);
-	const struct module_signature *sig;
 	struct modsig *hdr;
-	size_t sig_len;
-	const void *p;
+	unsigned long sig_len, buf_len = len;
 	int rc;
 
-	if (buf_len <= marker_len + sizeof(*sig))
-		return -ENOENT;
-
-	p = buf + buf_len - marker_len;
-	if (memcmp(p, MODULE_SIG_STRING, marker_len))
-		return -ENOENT;
-
-	buf_len -= marker_len;
-	sig = (const struct module_signature *)(p - sizeof(*sig));
-
-	rc = mod_check_sig(sig, buf_len, func_tokens[func]);
+	rc = mod_parse_sig(buf, &buf_len, &sig_len, func_tokens[func]);
 	if (rc)
 		return rc;
 
-	sig_len = be32_to_cpu(sig->sig_len);
-	buf_len -= sig_len + sizeof(*sig);
-
 	/* Allocate sig_len additional bytes to hold the raw PKCS#7 data. */
 	hdr = kzalloc(sizeof(*hdr) + sig_len, GFP_KERNEL);
 	if (!hdr)
-- 
2.31.1

