Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2E45E041
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 19:06:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0QmF22cBz3dpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 05:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rRxGzAhF;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=i2iW+K4j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rRxGzAhF; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=i2iW+K4j; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0QjP1s8vz2ypV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 05:03:37 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 311FC21B36;
 Thu, 25 Nov 2021 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637863414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nki8oKAYJ8Wy585sdbUvxt9eszYdDH7kQPAAKG0sKs=;
 b=rRxGzAhFnzlxk8xFlFlrHtykFxHB7IZg2sxGzqji7TZIuTH7r+hfyRFt1lpJsSYqxM0kTY
 g7AhJ5OkKPnja+GdOxBqUEr2yJQIC/C9EK4WEN4Vk+B+CZDj4TNIu3hzYQD4TRy8VzcOFI
 PGDMzb2MDelJi2m6LFgsiPf6/SKGHMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637863414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nki8oKAYJ8Wy585sdbUvxt9eszYdDH7kQPAAKG0sKs=;
 b=i2iW+K4j9B6Dc9uaJrADgTRd/0t6IXMDqfWTrzpenfu1PPghZwnc6lYgQCrOb2cUJIAmYt
 ZPzuOfWLAutE15BQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id D8A9CA3B8C;
 Thu, 25 Nov 2021 18:03:33 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org
Subject: [PATCH v2 5/6] module: Use key_being_used_for for log messages in
 verify_appended_signature
Date: Thu, 25 Nov 2021 19:02:43 +0100
Message-Id: <e454eb4f2f8dfe611b5da480a87519e5ad95a640.1637862358.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1637862358.git.msuchanek@suse.de>
References: <cover.1637862358.git.msuchanek@suse.de>
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
 Heiko Carstens <hca@linux.ibm.com>, linux-crypto@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
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
 include/linux/verification.h             |  3 ++-
 kernel/module.c                          |  3 ++-
 kernel/module_signing.c                  | 11 ++++++-----
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 63634c95265d..3aa5269f6e0f 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -158,7 +158,7 @@ int elf64_verify_sig(const char *kernel, unsigned long length)
 	size_t kernel_len = length;
 
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
-					"kexec_file");
+					 VERIFYING_KEXEC_APPENDED_SIGNATURE);
 }
 #endif /* CONFIG_KEXEC_SIG */
 
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index c4632c1a1b59..316d082c9d99 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -33,7 +33,7 @@ int s390_verify_sig(const char *kernel, unsigned long length)
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
index c1cf0582012a..23748feb9e03 100644
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
@@ -61,7 +62,7 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
 #endif
 
 int verify_appended_signature(const void *data, size_t *len, struct key *trusted_keys,
-			      const char *what);
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
index 4c28cb55275f..cef72a6f6b5d 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -19,17 +19,18 @@
  * @data: The data to be verified
  * @len: Size of @data.
  * @trusted_keys: Keyring to use for verification
- * @what: Informational string for log messages
+ * @purpose: The use to which the key is being put
  */
 int verify_appended_signature(const void *data, size_t *len,
-			      struct key *trusted_keys, const char *what)
+			      struct key *trusted_keys,
+			      enum key_being_used_for purpose)
 {
 	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature ms;
 	size_t sig_len, modlen = *len;
 	int ret;
 
-	pr_devel("==>%s(,%zu)\n", __func__, modlen);
+	pr_devel("==>%s %s(,%zu)\n", __func__, key_being_used_for[purpose], modlen);
 
 	if (markerlen > modlen)
 		return -ENODATA;
@@ -44,7 +45,7 @@ int verify_appended_signature(const void *data, size_t *len,
 
 	memcpy(&ms, data + (modlen - sizeof(ms)), sizeof(ms));
 
-	ret = mod_check_sig(&ms, modlen, what);
+	ret = mod_check_sig(&ms, modlen, key_being_used_for[purpose]);
 	if (ret)
 		return ret;
 
@@ -54,6 +55,6 @@ int verify_appended_signature(const void *data, size_t *len,
 
 	return verify_pkcs7_signature(data, modlen, data + modlen, sig_len,
 				      trusted_keys,
-				      VERIFYING_MODULE_SIGNATURE,
+				      purpose,
 				      NULL, NULL);
 }
-- 
2.31.1

