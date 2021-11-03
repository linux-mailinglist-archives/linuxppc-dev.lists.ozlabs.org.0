Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3868444438C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 15:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkq04071zz2ymv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 01:29:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wceayes8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hTjEF6AI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wceayes8; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hTjEF6AI; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkpxw3Zftz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 01:27:16 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 96E731FC9E;
 Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635949632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHRKGzOrFJY3TXPZxndVRyVPBDcEQsDOTrGLk8iE6xA=;
 b=wceayes8F/OBx1HLTE/AmGHLsenXO/zk5kdFt9Rs1VRCCqLO8JV0Tq/2o8hXtjQRHnON/X
 8hcXsORG/u+0hu720yTPL/1zMTJBUEWIEwOnpy3LuoZDjOE9w7YhTG68qFz6EalQKtF+zo
 9oHI0CDlurO6wG3XHipzpfuq2P4PxP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635949632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHRKGzOrFJY3TXPZxndVRyVPBDcEQsDOTrGLk8iE6xA=;
 b=hTjEF6AILKkdWduND5hj6YcCUfaugglzhjlvFNm9dwEvyEZYZ6uGckzpMOhXNlEWDOLQge
 Uq57flcqM5CHmPAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 6FE91A3BA0;
 Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org
Subject: [PATCH 1/3] s390/kexec_file: Don't opencode appended signature
 verification.
Date: Wed,  3 Nov 2021 15:27:06 +0100
Message-Id: <90b0c526962c7c835efddeaf5d70f6f5962287e0.1635948742.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635948742.git.msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
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
Cc: Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Frank van der Linden <fllinden@amazon.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Module verification already implements appeded signature verification.

Reuse it for kexec_file.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/s390/kernel/machine_kexec_file.c | 33 ++++-----------------------
 include/linux/verification.h          |  3 +++
 kernel/module-internal.h              |  2 --
 kernel/module.c                       |  4 +++-
 kernel/module_signing.c               | 24 +++++++++++--------
 5 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index f9e4baa64b67..634e641cd8aa 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -23,11 +23,10 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 };
 
 #ifdef CONFIG_KEXEC_SIG
-int s390_verify_sig(const char *kernel, unsigned long kernel_len)
+int s390_verify_sig(const char *kernel, unsigned long length)
 {
+	size_t kernel_len = length;
 	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
-	struct module_signature *ms;
-	unsigned long sig_len;
 
 	/* Skip signature verification when not secure IPLed. */
 	if (!ipl_secure_flag)
@@ -41,32 +40,8 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 		return -EKEYREJECTED;
 	kernel_len -= marker_len;
 
-	ms = (void *)kernel + kernel_len - sizeof(*ms);
-	kernel_len -= sizeof(*ms);
-
-	sig_len = be32_to_cpu(ms->sig_len);
-	if (sig_len >= kernel_len)
-		return -EKEYREJECTED;
-	kernel_len -= sig_len;
-
-	if (ms->id_type != PKEY_ID_PKCS7)
-		return -EKEYREJECTED;
-
-	if (ms->algo != 0 ||
-	    ms->hash != 0 ||
-	    ms->signer_len != 0 ||
-	    ms->key_id_len != 0 ||
-	    ms->__pad[0] != 0 ||
-	    ms->__pad[1] != 0 ||
-	    ms->__pad[2] != 0) {
-		return -EBADMSG;
-	}
-
-	return verify_pkcs7_signature(kernel, kernel_len,
-				      kernel + kernel_len, sig_len,
-				      VERIFY_USE_PLATFORM_KEYRING,
-				      VERIFYING_MODULE_SIGNATURE,
-				      NULL, NULL);
+	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
+					"kexec_file");
 }
 #endif /* CONFIG_KEXEC_SIG */
 
diff --git a/include/linux/verification.h b/include/linux/verification.h
index a655923335ae..c1cf0582012a 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -60,5 +60,8 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
 				   enum key_being_used_for usage);
 #endif
 
+int verify_appended_signature(const void *data, size_t *len, struct key *trusted_keys,
+			      const char *what);
+
 #endif /* CONFIG_SYSTEM_DATA_VERIFICATION */
 #endif /* _LINUX_VERIFY_PEFILE_H */
diff --git a/kernel/module-internal.h b/kernel/module-internal.h
index 33783abc377b..80461e14bf29 100644
--- a/kernel/module-internal.h
+++ b/kernel/module-internal.h
@@ -27,5 +27,3 @@ struct load_info {
 		unsigned int sym, str, mod, vers, info, pcpu;
 	} index;
 };
-
-extern int mod_verify_sig(const void *mod, struct load_info *info);
diff --git a/kernel/module.c b/kernel/module.c
index 5c26a76e800b..137b3661be75 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -57,6 +57,7 @@
 #include <linux/bsearch.h>
 #include <linux/dynamic_debug.h>
 #include <linux/audit.h>
+#include <linux/verification.h>
 #include <uapi/linux/module.h>
 #include "module-internal.h"
 
@@ -2894,7 +2895,8 @@ static int module_sig_check(struct load_info *info, int flags)
 	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
 		/* We truncate the module to discard the signature */
 		info->len -= markerlen;
-		err = mod_verify_sig(mod, info);
+		err = verify_appended_signature(mod, &info->len,
+						VERIFY_USE_SECONDARY_KEYRING, "module");
 		if (!err) {
 			info->sig_ok = true;
 			return 0;
diff --git a/kernel/module_signing.c b/kernel/module_signing.c
index 8723ae70ea1f..f492e410564d 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -14,13 +14,19 @@
 #include <crypto/public_key.h>
 #include "module-internal.h"
 
-/*
- * Verify the signature on a module.
+/**
+ * verify_appended_signature - Verify the signature on a module with the
+ * signature marker stripped.
+ * @data: The data to be verified
+ * @len: Size of @data.
+ * @trusted_keys: Keyring to use for verification
+ * @what: Informational string for log messages
  */
-int mod_verify_sig(const void *mod, struct load_info *info)
+int verify_appended_signature(const void *data, size_t *len,
+			      struct key *trusted_keys, const char *what)
 {
 	struct module_signature ms;
-	size_t sig_len, modlen = info->len;
+	size_t sig_len, modlen = *len;
 	int ret;
 
 	pr_devel("==>%s(,%zu)\n", __func__, modlen);
@@ -28,18 +34,18 @@ int mod_verify_sig(const void *mod, struct load_info *info)
 	if (modlen <= sizeof(ms))
 		return -EBADMSG;
 
-	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
+	memcpy(&ms, data + (modlen - sizeof(ms)), sizeof(ms));
 
-	ret = mod_check_sig(&ms, modlen, "module");
+	ret = mod_check_sig(&ms, modlen, what);
 	if (ret)
 		return ret;
 
 	sig_len = be32_to_cpu(ms.sig_len);
 	modlen -= sig_len + sizeof(ms);
-	info->len = modlen;
+	*len = modlen;
 
-	return verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
-				      VERIFY_USE_SECONDARY_KEYRING,
+	return verify_pkcs7_signature(data, modlen, data + modlen, sig_len,
+				      trusted_keys,
 				      VERIFYING_MODULE_SIGNATURE,
 				      NULL, NULL);
 }
-- 
2.31.1

