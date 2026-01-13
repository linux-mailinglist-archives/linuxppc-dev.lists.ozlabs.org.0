Return-Path: <linuxppc-dev+bounces-15630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D0CD18CC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr82M0N9Hz2xrC;
	Tue, 13 Jan 2026 23:39:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768307962;
	cv=none; b=jOZtZRG1T7quB+w7Sr52/6US5CF9IdQtegdFIEFJthFw01lDS4I842wzY5rFRkGA478ykVE1s5XcUVzZ5YzGZF2Mle9txSO8nK5cwtNT5vlt87GOKmYQ+y9V7E096kAer5b2F5cmgGMGYOhK0CJ9/nhYWRfLbFAILTPHmhZe4dbefJxRkQk3L0JDTfXuzK6pw8FnEqWQPKD7HkLnDilFBdFsa/K5m6dLU6SrtH3l+5lIyaNgN0A7fGTrnpqJMEGhSh1KjwAxinhO7mG8KGVNQKnX5qJr4Lf7Cw8Bwrf9Tj0vEnJZSqZzMnHjtGqWS4nZ808XKNH2FPVi/nzNG1Knfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768307962; c=relaxed/relaxed;
	bh=wlVcQyflTNaSHZtfFb2oB2BcEbRtMVQu3dqbaYyYBsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT/PyOYMQHbYUHvTbcHIBD4kh13daiwBFBTrwT4SoJqgX2zv5SULbh5zyoBqS3gA6c/riRMYqMrqXEFAHpgHVtNvyVDCwiBIvv8PX0F9ebeoYKLfH37DQQFJTa24UjoOq7lB3B7ZsfGe1Sy50MdjmFIGUBXn6ms4iq1Czfpqt2kIq976SNQv/EYPkEIT78A9XjuBs3RFGG3eyMPZlRJ1Y80c0vJDygxQbhKCNF/iESToPwNoeADDmmelcwV0RajuYJ938IHy8iCMIPCfbUABYWyTChe7AxIAPiTkDkBuSW12pFYRNQ53289lck0ikdNCOfkEOXSY2ruuvRKw8nmE5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=HwDx8m4k; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=HwDx8m4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr82L1wFNz2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:39:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=RQorPXdehc0KFlqVrNkkJBX1mt3mTv1fVMoaXkJK8y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HwDx8m4kObuifJBptBij52FLs34CPIIwX0xZpecEN5CqtV9olIVM9LXNj5gpwh0Ho
	 /HaJ/RxPerSH90uzujx1NA7LceH+4B6fZrIjkmSGwkTtSSausH7LGDM6WMKY9+4/br
	 B1k0esnoVH1KvnghToW1IMmOshsIHHDSe7fg14vQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:53 +0100
Subject: [PATCH v4 09/17] module: Make module loading policy usable without
 MODULE_SIG
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-module-hashes-v4-9-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
 Xiu Jianfeng <xiujianfeng@huawei.com>, Nicolas Schier <nsc@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=4367;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RQorPXdehc0KFlqVrNkkJBX1mt3mTv1fVMoaXkJK8y4=;
 b=bVQw49emaM/5dAN8H/yxv1X4vVfg9hhJGkglV3b67z3dydC0IttJbKNfzZjvOz3Ub6EGRVvEt
 UrMAvueLp52AuJq9oN9Lqy/g0nC0FQ+3kHN45id2hyRhNiNoqIDYOrI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The loading policy functionality will also be used by the hash-based
module validation. Split it out from CONFIG_MODULE_SIG so it is usable
by both.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/module.h  |  8 ++++----
 kernel/module/Kconfig   |  5 ++++-
 kernel/module/main.c    | 26 +++++++++++++++++++++++++-
 kernel/module/signing.c | 21 ---------------------
 4 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index f288ca5cd95b..f9601cba47cd 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -444,7 +444,7 @@ struct module {
 	const u32 *gpl_crcs;
 	bool using_gplonly_symbols;
 
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 	/* Signature was verified. */
 	bool sig_ok;
 #endif
@@ -916,7 +916,7 @@ static inline bool retpoline_module_ok(bool has_retpoline)
 }
 #endif
 
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 bool is_module_sig_enforced(void);
 
 void set_module_sig_enforced(void);
@@ -925,7 +925,7 @@ static inline bool module_sig_ok(struct module *module)
 {
 	return module->sig_ok;
 }
-#else	/* !CONFIG_MODULE_SIG */
+#else	/* !CONFIG_MODULE_SIG_POLICY */
 static inline bool is_module_sig_enforced(void)
 {
 	return false;
@@ -939,7 +939,7 @@ static inline bool module_sig_ok(struct module *module)
 {
 	return true;
 }
-#endif	/* CONFIG_MODULE_SIG */
+#endif	/* CONFIG_MODULE_SIG_POLICY */
 
 #if defined(CONFIG_MODULES) && defined(CONFIG_KALLSYMS)
 int module_kallsyms_on_each_symbol(const char *modname,
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index e8bb2c9d917e..db3b61fb3e73 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -270,9 +270,12 @@ config MODULE_SIG
 	  debuginfo strip done by some packagers (such as rpmbuild) and
 	  inclusion into an initramfs that wants the module size reduced.
 
+config MODULE_SIG_POLICY
+	def_bool MODULE_SIG
+
 config MODULE_SIG_FORCE
 	bool "Require modules to be validly signed"
-	depends on MODULE_SIG
+	depends on MODULE_SIG_POLICY
 	help
 	  Reject unsigned modules or signed modules for which we don't have a
 	  key.  Without this, such modules will simply taint the kernel.
diff --git a/kernel/module/main.c b/kernel/module/main.c
index a88f95a13e06..4442397a9f92 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2541,7 +2541,7 @@ static void module_augment_kernel_taints(struct module *mod, struct load_info *i
 				mod->name);
 		add_taint_module(mod, TAINT_TEST, LOCKDEP_STILL_OK);
 	}
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 	mod->sig_ok = info->sig_ok;
 	if (!mod->sig_ok) {
 		pr_notice_once("%s: module verification failed: signature "
@@ -3921,3 +3921,27 @@ static int module_debugfs_init(void)
 }
 module_init(module_debugfs_init);
 #endif
+
+#ifdef CONFIG_MODULE_SIG_POLICY
+
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "module."
+
+static bool sig_enforce = IS_ENABLED(CONFIG_MODULE_SIG_FORCE);
+module_param(sig_enforce, bool_enable_only, 0644);
+
+/*
+ * Export sig_enforce kernel cmdline parameter to allow other subsystems rely
+ * on that instead of directly to CONFIG_MODULE_SIG_FORCE config.
+ */
+bool is_module_sig_enforced(void)
+{
+	return sig_enforce;
+}
+EXPORT_SYMBOL(is_module_sig_enforced);
+
+void set_module_sig_enforced(void)
+{
+	sig_enforce = true;
+}
+#endif
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index 6d64c0d18d0a..66d90784de89 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -16,27 +16,6 @@
 #include <uapi/linux/module.h>
 #include "internal.h"
 
-#undef MODULE_PARAM_PREFIX
-#define MODULE_PARAM_PREFIX "module."
-
-static bool sig_enforce = IS_ENABLED(CONFIG_MODULE_SIG_FORCE);
-module_param(sig_enforce, bool_enable_only, 0644);
-
-/*
- * Export sig_enforce kernel cmdline parameter to allow other subsystems rely
- * on that instead of directly to CONFIG_MODULE_SIG_FORCE config.
- */
-bool is_module_sig_enforced(void)
-{
-	return sig_enforce;
-}
-EXPORT_SYMBOL(is_module_sig_enforced);
-
-void set_module_sig_enforced(void)
-{
-	sig_enforce = true;
-}
-
 int module_sig_check(struct load_info *info, int flags)
 {
 	int err;

-- 
2.52.0


