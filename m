Return-Path: <linuxppc-dev+bounces-8146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C92AA0D17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn11D3YKrz30VM;
	Tue, 29 Apr 2025 23:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932304;
	cv=none; b=FhpT81HTz9l2tIf4NZlQ1Ku5YiKJ9CP4syWsHqnbJ54RiM9+76vqeDYZvlnSdFNYwOBGELuKfXvrAY1mLOPKs8l/qUjWwrWWTKUUx552/ilZqnMt4ktmgcDNuVgWvrQrMhhfr+V11Whe8gGXsxW89VA7Tp2BhcNS7wz2eQpm3PH9/1H6/O9jaUTVY0R7PXfazHfGNzvkKftprmCR9wuK0pYTPk8/lwXB7Vx8+SN/YHjjx/C7RtCn35HvIlmNghK+i5/p/LWlPgphuhQick/ye51jxHZqlMnmKpiBZzQP0dJWn7gn89Rm8wJWFyEkzDvGimWzia8Azsy/mTJ+ru5UzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932304; c=relaxed/relaxed;
	bh=oUFhmXFCBunPnLrlSz62rC8pQNGqtXlW5XV6j5WYmww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdUMW7zJWVUAka0FIEYVtrrv/h7g7sE/ZmJ19QwkZ9hsHQUpeT39nHqTe5UL/sfYvvZlj74kIkqmJ4vXz+AvMV4a7gId3SPsh2Rq+cF5IQloV4OhCvtrHDN3FHYxRD+SRtJc5nr/2X7F12IY3nUQuZGdYFXMlHUVd5c1YXDUgiOh18JqzPYhigwlhuopwkIXwqQOr15G3J5/1sUVYx/jc4v5z4ydbH8T/wtzRVTIKvkoqia2r8vLPM21vIbXmWzVQTfw02FkTa/6fiJH8WlZzS5NGmK08Ymym6O1h89LcVlyrVg2f/SW05SmySF0rIKC1y7RprXglRvYVEUxuGPFtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=InUYUEBx; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=InUYUEBx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 418 seconds by postgrey-1.37 at boromir; Tue, 29 Apr 2025 23:11:41 AEST
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn1191f8Bz30VF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:11:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=UCCJkeYdVSKNrm9L/l2LgArwTnkqToFIXrGQtz775hQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=InUYUEBxzcaSdnkfyWEYs5gnGMDG+ZrErjBcXwVYAokpi9GEx8U1OAq8QYl2tMjVP
	 1ekrjrvh9Kq4zyyJzkto/U4Kn8QLoXereQhuqEhHhjjsu1IS7NMnfsLI/u0MH1f9jK
	 qMLc+34JpYBUgNoLb0o6WFDZy5UfMXBeZPj/wmy4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:32 +0200
Subject: [PATCH v3 5/9] module: Make module loading policy usable without
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
Message-Id: <20250429-module-hashes-v3-5-00e9258def9e@weissschuh.net>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
In-Reply-To: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=4529;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UCCJkeYdVSKNrm9L/l2LgArwTnkqToFIXrGQtz775hQ=;
 b=FFTZUNwOflf9z+ryGT7IH9ClBV+Qgyns9jpZd219As5W1VpY2anGRlh//7RjRR1nc7E7upt8z
 nqLMla0XzUOAp/oDbt2x4NABjz1decy6MVywaUlDbU1LQpYgWKpemko
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
 kernel/module/Kconfig   |  6 +++++-
 kernel/module/main.c    | 26 +++++++++++++++++++++++++-
 kernel/module/signing.c | 21 ---------------------
 4 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index d94b196d5a34e104d81308df4b150452eb96cdc9..68aa8bbd33acc84e013dc575ee88bd4e3101f9f4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -453,7 +453,7 @@ struct module {
 	const u32 *gpl_crcs;
 	bool using_gplonly_symbols;
 
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 	/* Signature was verified. */
 	bool sig_ok;
 #endif
@@ -921,14 +921,14 @@ static inline bool retpoline_module_ok(bool has_retpoline)
 }
 #endif
 
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 bool is_module_sig_enforced(void);
 
 static inline bool module_sig_ok(struct module *module)
 {
 	return module->sig_ok;
 }
-#else	/* !CONFIG_MODULE_SIG */
+#else	/* !CONFIG_MODULE_SIG_POLICY */
 static inline bool is_module_sig_enforced(void)
 {
 	return false;
@@ -938,7 +938,7 @@ static inline bool module_sig_ok(struct module *module)
 {
 	return true;
 }
-#endif	/* CONFIG_MODULE_SIG */
+#endif	/* CONFIG_MODULE_SIG_POLICY */
 
 #if defined(CONFIG_MODULES) && defined(CONFIG_KALLSYMS)
 int module_kallsyms_on_each_symbol(const char *modname,
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index c51f25538d0ea66e6486ad0be6684173cd0140b5..a3146e9378fcd3292a756a2a7ea5241524cbc408 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -265,9 +265,13 @@ config MODULE_SIG
 	  debuginfo strip done by some packagers (such as rpmbuild) and
 	  inclusion into an initramfs that wants the module size reduced.
 
+config MODULE_SIG_POLICY
+	def_bool y
+	depends on MODULE_SIG
+
 config MODULE_SIG_FORCE
 	bool "Require modules to be validly signed"
-	depends on MODULE_SIG
+	depends on MODULE_SIG_POLICY
 	help
 	  Reject unsigned modules or signed modules for which we don't have a
 	  key.  Without this, such modules will simply taint the kernel.
diff --git a/kernel/module/main.c b/kernel/module/main.c
index a2859dc3eea66ec19991e7e4afb5bbcae2c2d167..83c66205556fdde92152c131f1f58229c4f7f734 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2432,7 +2432,7 @@ static void module_augment_kernel_taints(struct module *mod, struct load_info *i
 				mod->name);
 		add_taint_module(mod, TAINT_TEST, LOCKDEP_STILL_OK);
 	}
-#ifdef CONFIG_MODULE_SIG
+#ifdef CONFIG_MODULE_SIG_POLICY
 	mod->sig_ok = info->sig_ok;
 	if (!mod->sig_ok) {
 		pr_notice_once("%s: module verification failed: signature "
@@ -3808,3 +3808,27 @@ static int module_debugfs_init(void)
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
index a2ff4242e623d5d4e87d2f3d139d8620fb937579..e51920605da14771601327ea596dad2e12400518 100644
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
 /*
  * Verify the signature on a module.
  */

-- 
2.49.0


