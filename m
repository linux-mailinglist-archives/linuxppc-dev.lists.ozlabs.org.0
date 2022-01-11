Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E929048ACC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 12:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY7yz5PrYz3bWR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 22:39:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cNTa4UdE;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Gx/naHni;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cNTa4UdE; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Gx/naHni; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY7wn4FDvz2ypj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 22:38:00 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9ACCA1F3BE;
 Tue, 11 Jan 2022 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641901077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5S+PDIMt0cv778Ug4dTHgOhwSV6I7mLY7fYsPSMbc8=;
 b=cNTa4UdEI8NMT2ulyV45F/C/V13CVcxnHg2/esmZQ9mIhQ4wW8tFjineNtW9R8OYNjpyzQ
 /zlZ9M4CizPX6Da//4DbLf1GFhpmIzRgQqK8WzvxT/I3jGEGk7/mfQepNvv2M1J7zCxtl2
 fc3gS9gTAYfCRnrha03OmoNgg3j/HZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641901077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5S+PDIMt0cv778Ug4dTHgOhwSV6I7mLY7fYsPSMbc8=;
 b=Gx/naHnidUOgdbPPRqig0Wgs+UDBOAiZnhMMzrD37EGj9I3JOKbn2QGeVXTk7DLgO/rsjU
 BxTzShMlokMLUABA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 5459AA3B8F;
 Tue, 11 Jan 2022 11:37:57 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v5 3/6] kexec_file: Don't opencode appended signature
 verification.
Date: Tue, 11 Jan 2022 12:37:45 +0100
Message-Id: <7834eb187ef67cd88fc67f10e831130e3717d776.1641900831.git.msuchanek@suse.de>
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

Module verification already implements appeded signature verification.

Reuse it for kexec_file.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v3: - Philipp Rudo <prudo@redhat.com>: Update the dependency on
      MODULE_SIG_FORMAT to MODULE_SIG
    - Include linux/verification.h - previously added in earlier patch
v4: - kernel test robot <lkp@intel.com>: Use unsigned long rather than size_t for data length
    - Update the code in kernel/module_signing.c to use pointer rather
      than memcpy as the kexec and IMA code does
---
 arch/powerpc/Kconfig                  |  2 +-
 arch/powerpc/kexec/elf_64.c           | 19 +++------------
 arch/s390/Kconfig                     |  2 +-
 arch/s390/kernel/machine_kexec_file.c | 18 ++------------
 include/linux/verification.h          |  3 +++
 kernel/module-internal.h              |  2 --
 kernel/module.c                       |  4 +++-
 kernel/module_signing.c               | 34 ++++++++++++++++-----------
 8 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1cde9b6c5987..4092187474ff 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -562,7 +562,7 @@ config ARCH_HAS_KEXEC_PURGATORY
 
 config KEXEC_SIG
 	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
+	depends on KEXEC_FILE && MODULE_SIG
 	help
 	  This option makes kernel signature verification mandatory for
 	  the kexec_file_load() syscall.
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 98d1cb5135b4..64cd314cce0d 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -23,6 +23,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/verification.h>
 #include <linux/module_signature.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
@@ -156,9 +157,6 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
 {
 	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
-	struct module_signature *ms;
-	unsigned long sig_len;
-	int ret;
 
 	if (marker_len > kernel_len)
 		return -EKEYREJECTED;
@@ -168,19 +166,8 @@ int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
 		return -EKEYREJECTED;
 	kernel_len -= marker_len;
 
-	ms = (void *)kernel + kernel_len - sizeof(*ms);
-	ret = mod_check_sig(ms, kernel_len, "kexec");
-	if (ret)
-		return ret;
-
-	sig_len = be32_to_cpu(ms->sig_len);
-	kernel_len -= sizeof(*ms) + sig_len;
-
-	return verify_pkcs7_signature(kernel, kernel_len,
-				      kernel + kernel_len, sig_len,
-				      VERIFY_USE_PLATFORM_KEYRING,
-				      VERIFYING_MODULE_SIGNATURE,
-				      NULL, NULL);
+	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
+					 "kexec_file");
 }
 #endif /* CONFIG_KEXEC_SIG */
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 2a5bb4f29cfe..cece7152ea35 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -544,7 +544,7 @@ config ARCH_HAS_KEXEC_PURGATORY
 
 config KEXEC_SIG
 	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
+	depends on KEXEC_FILE && MODULE_SIG
 	help
 	  This option makes kernel signature verification mandatory for
 	  the kexec_file_load() syscall.
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index c944d71316c7..345f2eab6e04 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -29,9 +29,6 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 {
 	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
-	struct module_signature *ms;
-	unsigned long sig_len;
-	int ret;
 
 	/* Skip signature verification when not secure IPLed. */
 	if (!ipl_secure_flag)
@@ -45,19 +42,8 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 		return -EKEYREJECTED;
 	kernel_len -= marker_len;
 
-	ms = (void *)kernel + kernel_len - sizeof(*ms);
-	ret = mod_check_sig(ms, kernel_len, "kexec");
-	if (ret)
-		return ret;
-
-	sig_len = be32_to_cpu(ms->sig_len);
-	kernel_len -= sizeof(*ms) + sig_len;
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
index a655923335ae..32db9287a7b0 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -60,5 +60,8 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
 				   enum key_being_used_for usage);
 #endif
 
+int verify_appended_signature(const void *data, unsigned long *len,
+			      struct key *trusted_keys, const char *what);
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
index 84a9141a5e15..8481933dfa92 100644
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
index 8723ae70ea1f..30149969f21f 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -14,32 +14,38 @@
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
+int verify_appended_signature(const void *data, unsigned long *len,
+			      struct key *trusted_keys, const char *what)
 {
-	struct module_signature ms;
-	size_t sig_len, modlen = info->len;
+	struct module_signature *ms;
+	unsigned long sig_len, modlen = *len;
 	int ret;
 
-	pr_devel("==>%s(,%zu)\n", __func__, modlen);
+	pr_devel("==>%s(,%lu)\n", __func__, modlen);
 
-	if (modlen <= sizeof(ms))
+	if (modlen <= sizeof(*ms))
 		return -EBADMSG;
 
-	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
+	ms = data + modlen - sizeof(*ms);
 
-	ret = mod_check_sig(&ms, modlen, "module");
+	ret = mod_check_sig(ms, modlen, what);
 	if (ret)
 		return ret;
 
-	sig_len = be32_to_cpu(ms.sig_len);
-	modlen -= sig_len + sizeof(ms);
-	info->len = modlen;
+	sig_len = be32_to_cpu(ms->sig_len);
+	modlen -= sig_len + sizeof(*ms);
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

