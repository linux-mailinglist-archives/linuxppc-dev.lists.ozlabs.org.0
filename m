Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C39A048ACC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 12:39:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY7yD57wsz3cN6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 22:39:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=af8p/6PB;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lq3s24y1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=af8p/6PB; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lq3s24y1; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY7wn4K78z2yw5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 22:38:00 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3ABB91F3BF;
 Tue, 11 Jan 2022 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641901078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMeJYRdjSb6eOUZmaN5YfP8/wtUzUEKymy7rkLY/s6E=;
 b=af8p/6PBECMt2AJo6d+lPXkOZ55rr4fwNZIs0bxZs9s07nPV2EUyC/bnqjiJzplw8B26YQ
 LW7F4IS8CobnTZqvbhKrKH3E6gVTFRTu7zV87VpxwYOitPiL92wKGeOoTlvI7xyFF3SjCi
 xu2qH1Ww5nLb3yyJCFULk2zcs+x5a0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641901078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMeJYRdjSb6eOUZmaN5YfP8/wtUzUEKymy7rkLY/s6E=;
 b=lq3s24y1prNekwRRb9+judS8MWA3UZXeHZG6GvZa7Tjekd2uucQeu/EJIofIFDFxG2hgo8
 t8pW14jfvdwO5SBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id E7A42A3B91;
 Tue, 11 Jan 2022 11:37:57 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v5 5/6] module: Use key_being_used_for for log messages in
 verify_appended_signature
Date: Tue, 11 Jan 2022 12:37:47 +0100
Message-Id: <65d9913441b16e27b672cfabbab24fa5c12bee14.1641900831.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641900831.git.msuchanek@suse.de>
References: <cover.1641900831.git.msuchanek@suse.de>
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

Add value for kexec appended signature and pass in key_being_used_for
enum rather than a string to verify_appended_signature to produce log
messages about the signature.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kexec/elf_64.c              |  2 +-
 arch/s390/kernel/machine_kexec_file.c    |  2 +-
 crypto/asymmetric_keys/asymmetric_type.c |  1 +
 include/linux/verification.h             |  4 +++-
 kernel/module.c                          |  3 ++-
 kernel/module_signing.c                  | 11 ++++++-----
 6 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 6dec8151ef73..c50869195d51 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -156,7 +156,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
 {
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
-					 "kexec_file");
+					 VERIFYING_KEXEC_APPENDED_SIGNATURE);
 }
 #endif /* CONFIG_KEXEC_SIG */
 
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index c3deccf1da83..63eec38e3137 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -32,7 +32,7 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 		return 0;
 
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
-					"kexec_file");
+					VERIFYING_KEXEC_APPENDED_SIGNATURE);
 }
 #endif /* CONFIG_KEXEC_SIG */
 
diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index ad8af3d70ac0..6fd20eec3882 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -25,6 +25,7 @@ const char *const key_being_used_for[NR__KEY_BEING_USED_FOR] = {
 	[VERIFYING_KEXEC_PE_SIGNATURE]		= "kexec PE sig",
 	[VERIFYING_KEY_SIGNATURE]		= "key sig",
 	[VERIFYING_KEY_SELF_SIGNATURE]		= "key self sig",
+	[VERIFYING_KEXEC_APPENDED_SIGNATURE]	= "kexec appended sig",
 	[VERIFYING_UNSPECIFIED_SIGNATURE]	= "unspec sig",
 };
 EXPORT_SYMBOL_GPL(key_being_used_for);
diff --git a/include/linux/verification.h b/include/linux/verification.h
index 32db9287a7b0..f92c49443b4f 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -26,6 +26,7 @@ enum key_being_used_for {
 	VERIFYING_KEXEC_PE_SIGNATURE,
 	VERIFYING_KEY_SIGNATURE,
 	VERIFYING_KEY_SELF_SIGNATURE,
+	VERIFYING_KEXEC_APPENDED_SIGNATURE,
 	VERIFYING_UNSPECIFIED_SIGNATURE,
 	NR__KEY_BEING_USED_FOR
 };
@@ -61,7 +62,8 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
 #endif
 
 int verify_appended_signature(const void *data, unsigned long *len,
-			      struct key *trusted_keys, const char *what);
+			      struct key *trusted_keys,
+			      enum key_being_used_for purpose);
 
 #endif /* CONFIG_SYSTEM_DATA_VERIFICATION */
 #endif /* _LINUX_VERIFY_PEFILE_H */
diff --git a/kernel/module.c b/kernel/module.c
index d91ca0f93a40..0a359dc6b690 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2891,7 +2891,8 @@ static int module_sig_check(struct load_info *info, int flags)
 	 */
 	if (flags == 0) {
 		err = verify_appended_signature(mod, &info->len,
-						VERIFY_USE_SECONDARY_KEYRING, "module");
+						VERIFY_USE_SECONDARY_KEYRING,
+						VERIFYING_MODULE_SIGNATURE);
 		if (!err) {
 			info->sig_ok = true;
 			return 0;
diff --git a/kernel/module_signing.c b/kernel/module_signing.c
index 39a6dd7c6dd2..20857d2a15ca 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -19,17 +19,18 @@
  * @data: The data to be verified
  * @len: Size of @data.
  * @trusted_keys: Keyring to use for verification
- * @what: Informational string for log messages
+ * @purpose: The use to which the key is being put
  */
 int verify_appended_signature(const void *data, unsigned long *len,
-			      struct key *trusted_keys, const char *what)
+			      struct key *trusted_keys,
+			      enum key_being_used_for purpose)
 {
 	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature *ms;
 	unsigned long sig_len, modlen = *len;
 	int ret;
 
-	pr_devel("==>%s(,%lu)\n", __func__, modlen);
+	pr_devel("==>%s %s(,%lu)\n", __func__, key_being_used_for[purpose], modlen);
 
 	if (markerlen > modlen)
 		return -ENODATA;
@@ -44,7 +45,7 @@ int verify_appended_signature(const void *data, unsigned long *len,
 
 	ms = data + modlen - sizeof(*ms);
 
-	ret = mod_check_sig(ms, modlen, what);
+	ret = mod_check_sig(ms, modlen, key_being_used_for[purpose]);
 	if (ret)
 		return ret;
 
@@ -54,6 +55,6 @@ int verify_appended_signature(const void *data, unsigned long *len,
 
 	return verify_pkcs7_signature(data, modlen, data + modlen, sig_len,
 				      trusted_keys,
-				      VERIFYING_MODULE_SIGNATURE,
+				      purpose,
 				      NULL, NULL);
 }
-- 
2.31.1

