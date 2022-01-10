Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E6489AD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXZzN2Rd8z3bbG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:53:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CTITD+AS;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lrC7ADtM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CTITD+AS; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lrC7ADtM; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXZvk49l6z2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 00:50:10 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6CA33210F8;
 Mon, 10 Jan 2022 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641822607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Sg8NmS9Cl8uGlravuAR0TWOLfnwUgnMmpUpTIKU9d8=;
 b=CTITD+ASPAe8vMUGqH1kuCV9b9rF10kpGg21BBa4hsgxOR3IJg4rU3J+a4FFBlKPjPmC+F
 XLUzgXSd5Vqy433TPBvUW/QBFfuqt3dQ97h4gIzMhkUdyy47+v9RCuR2sP2DaLUy2GBsT5
 TBwGvm18mQfoe5KgwH730gJ1J+z2nMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641822607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Sg8NmS9Cl8uGlravuAR0TWOLfnwUgnMmpUpTIKU9d8=;
 b=lrC7ADtMTbDQt8wQKX18n/99GXCakud6nVwAm5HwkIJY8FBXrzxu551+Z+RtzYsRzowx+2
 vL/aV9XVemCKruAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 2619EA3B8B;
 Mon, 10 Jan 2022 13:50:07 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v4 4/6] module: strip the signature marker in the verification
 function.
Date: Mon, 10 Jan 2022 14:49:56 +0100
Message-Id: <96d29773b9ef418a71b1d8bbfd0a456a0f996ec6.1641822505.git.msuchanek@suse.de>
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

It is stripped by each caller separately.

Note: this changes the error for kexec_file from EKEYREJECTED to ENODATA
when the signature marker is missing.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v3: - Philipp Rudo <prudo@redhat.com>: Update the commit with note about
      change of raturn value
    - the module_signature.h is now no longer needed for kexec_file
---
 arch/powerpc/kexec/elf_64.c           | 11 -----------
 arch/s390/kernel/machine_kexec_file.c | 11 -----------
 kernel/module.c                       |  7 +------
 kernel/module_signing.c               | 12 ++++++++++--
 4 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 64cd314cce0d..6dec8151ef73 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -24,7 +24,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/verification.h>
-#include <linux/module_signature.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
@@ -156,16 +155,6 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 #ifdef CONFIG_KEXEC_SIG
 int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
 {
-	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
-
-	if (marker_len > kernel_len)
-		return -EKEYREJECTED;
-
-	if (memcmp(kernel + kernel_len - marker_len, MODULE_SIG_STRING,
-		   marker_len))
-		return -EKEYREJECTED;
-	kernel_len -= marker_len;
-
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
 					 "kexec_file");
 }
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index 345f2eab6e04..c3deccf1da83 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -12,7 +12,6 @@
 #include <linux/elf.h>
 #include <linux/errno.h>
 #include <linux/kexec.h>
-#include <linux/module_signature.h>
 #include <linux/verification.h>
 #include <linux/vmalloc.h>
 #include <asm/boot_data.h>
@@ -28,20 +27,10 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 #ifdef CONFIG_KEXEC_SIG
 int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 {
-	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
-
 	/* Skip signature verification when not secure IPLed. */
 	if (!ipl_secure_flag)
 		return 0;
 
-	if (marker_len > kernel_len)
-		return -EKEYREJECTED;
-
-	if (memcmp(kernel + kernel_len - marker_len, MODULE_SIG_STRING,
-		   marker_len))
-		return -EKEYREJECTED;
-	kernel_len -= marker_len;
-
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
 					"kexec_file");
 }
diff --git a/kernel/module.c b/kernel/module.c
index 8481933dfa92..d91ca0f93a40 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2882,7 +2882,6 @@ static inline void kmemleak_load_module(const struct module *mod,
 static int module_sig_check(struct load_info *info, int flags)
 {
 	int err = -ENODATA;
-	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	const char *reason;
 	const void *mod = info->hdr;
 
@@ -2890,11 +2889,7 @@ static int module_sig_check(struct load_info *info, int flags)
 	 * Require flags == 0, as a module with version information
 	 * removed is no longer the module that was signed
 	 */
-	if (flags == 0 &&
-	    info->len > markerlen &&
-	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
-		/* We truncate the module to discard the signature */
-		info->len -= markerlen;
+	if (flags == 0) {
 		err = verify_appended_signature(mod, &info->len,
 						VERIFY_USE_SECONDARY_KEYRING, "module");
 		if (!err) {
diff --git a/kernel/module_signing.c b/kernel/module_signing.c
index 30149969f21f..39a6dd7c6dd2 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -15,8 +15,7 @@
 #include "module-internal.h"
 
 /**
- * verify_appended_signature - Verify the signature on a module with the
- * signature marker stripped.
+ * verify_appended_signature - Verify the signature on a module
  * @data: The data to be verified
  * @len: Size of @data.
  * @trusted_keys: Keyring to use for verification
@@ -25,12 +24,21 @@
 int verify_appended_signature(const void *data, unsigned long *len,
 			      struct key *trusted_keys, const char *what)
 {
+	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature *ms;
 	unsigned long sig_len, modlen = *len;
 	int ret;
 
 	pr_devel("==>%s(,%lu)\n", __func__, modlen);
 
+	if (markerlen > modlen)
+		return -ENODATA;
+
+	if (memcmp(data + modlen - markerlen, MODULE_SIG_STRING,
+		   markerlen))
+		return -ENODATA;
+	modlen -= markerlen;
+
 	if (modlen <= sizeof(*ms))
 		return -EBADMSG;
 
-- 
2.31.1

