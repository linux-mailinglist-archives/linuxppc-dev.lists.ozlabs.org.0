Return-Path: <linuxppc-dev+bounces-15644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D9D18E62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8C40KFLz2yxl;
	Tue, 13 Jan 2026 23:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308415;
	cv=none; b=Ici3yBlUAQyOcw3I+Q3wrKZ0RBdPwRn4/vYbwgRjsdvjDpB5LkhxbINUZgBtYDJsZ5VSvRoRYI+zgNZ98ST5wupVKuXa/CzrXen2E1Kx2oSocb+hqINb2WplZ6NxcXjrNpVztWoXlIJsdyHvSb0PUWbUBzyh8gDwhZSkVUKjlbABhvZHffVslcwncgpCo/st/1y2NmPfjHe5NxFFEH0wwJeivVvK6xu+QPkw5GjGopucQMWUerrHLpAReS91tH4hjXjrvmj/YfZweLIhuGRLaBFun/slJgZes5oO/a9Uee9de4p45LlHCNxu/65Hf3tk3FqvzqhDCSePTnb0Ob5wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308415; c=relaxed/relaxed;
	bh=usnWAMXl7pbEMNKZcHZDrxdM8T47Z3a6SASbvVfXI6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFGCBKEU4dS8RCU/Zqgb/UFmuRIMmrvdFebrTnyyQ+1d0hecU4LQNs3qoDI8LLMauIajvVfak5jQGnjE9xXPesRMIzh0lSCZzD65R4dhZ1A69Rt6DxIObeo7TAMEn3zAk4ghtlqIdG1lv3DFryNJIwyyrW3LoB0TSyJLCCX2SCrB4tazA75lJc9xGKGYnxGQoNszuObMWpCDSPi9xqX7kLdEoQXKr4Uhtol1eMlCbgNaFGxpz3bsZtzY6pIgispdIhOotWAr9uF+Vk5Y+sLAiUGQBieJD9eq78FhTC8nBLbv0MMP4PeK+zLsi3phg0uoxE6/7DmFN7ZvH6Dyv13QlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WFMGTKFM; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WFMGTKFM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8C31lXyz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307861;
	bh=mjGdw2yxzWxgtsTNEl1bBGcD2Uicfy0x+S+3g1xrhKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WFMGTKFMSCsakSKivcHT5zu72mKHJYU+l6hZ0Ds8YZP6nlir5oVmNph2sjIDlclnG
	 +y3O47iXttG/2e2trcAME/dynWcEVSqoRVgGfwQn4M071eJAIdD7sx4q2lIzsfxZ8h
	 SEtYLkde87SzPAkZ9Mq72QmsJzaGe7nQdHrm0Q20=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:56 +0100
Subject: [PATCH v4 12/17] module: Move signature splitting up
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
Message-Id: <20260113-module-hashes-v4-12-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=3025;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mjGdw2yxzWxgtsTNEl1bBGcD2Uicfy0x+S+3g1xrhKs=;
 b=awMfsURUOFCD2iZVVxJ0L7EbCCDNlOcWxUEUE7J742mmPYLUEoPlh9tuteXrcLXkmbAsJ5IEp
 W8BKKGMM5JdC9G+RCkMV/mRthjFNtlf97D2xKTMLMHkvxfe/OH8pPvq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The signature splitting will also be used by CONFIG_MODULE_HASHES.

Move it up the callchain, so the result can be reused.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/module/internal.h |  2 +-
 kernel/module/main.c     | 13 ++++++++++++-
 kernel/module/signing.c  | 21 +++++++--------------
 3 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index e053c29a5d08..e2d49122c2a1 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -337,7 +337,7 @@ int module_enforce_rwx_sections(const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs,
 void module_mark_ro_after_init(const Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			       const char *secstrings);
 
-int module_sig_check(struct load_info *info, int flags);
+int module_sig_check(struct load_info *info, const u8 *sig, size_t sig_len);
 
 #ifdef CONFIG_DEBUG_KMEMLEAK
 void kmemleak_load_module(const struct module *mod, const struct load_info *info);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c09b25c0166a..d65bc300a78c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3346,10 +3346,21 @@ static int early_mod_check(struct load_info *info, int flags)
 
 static int module_integrity_check(struct load_info *info, int flags)
 {
+	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
+				       MODULE_INIT_IGNORE_VERMAGIC);
+	size_t sig_len;
+	const u8 *sig;
 	int err = 0;
 
+	if (IS_ENABLED(CONFIG_MODULE_SIG_POLICY)) {
+		err = mod_split_sig(info->hdr, &info->len, mangled_module,
+				    &sig_len, &sig, "module");
+		if (err)
+			return err;
+	}
+
 	if (IS_ENABLED(CONFIG_MODULE_SIG))
-		err = module_sig_check(info, flags);
+		err = module_sig_check(info, sig, sig_len);
 
 	if (err)
 		return err;
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index 8a5f66389116..86164761cac7 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -15,26 +15,19 @@
 #include <uapi/linux/module.h>
 #include "internal.h"
 
-int module_sig_check(struct load_info *info, int flags)
+int module_sig_check(struct load_info *info, const u8 *sig, size_t sig_len)
 {
 	int err;
 	const char *reason;
 	const void *mod = info->hdr;
-	size_t sig_len;
-	const u8 *sig;
-	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
-				       MODULE_INIT_IGNORE_VERMAGIC);
 
-	err = mod_split_sig(info->hdr, &info->len, mangled_module, &sig_len, &sig, "module");
+	err = verify_pkcs7_signature(mod, info->len, sig, sig_len,
+				     VERIFY_USE_SECONDARY_KEYRING,
+				     VERIFYING_MODULE_SIGNATURE,
+				     NULL, NULL);
 	if (!err) {
-		err = verify_pkcs7_signature(mod, info->len, sig, sig_len,
-					     VERIFY_USE_SECONDARY_KEYRING,
-					     VERIFYING_MODULE_SIGNATURE,
-					     NULL, NULL);
-		if (!err) {
-			info->sig_ok = true;
-			return 0;
-		}
+		info->sig_ok = true;
+		return 0;
 	}
 
 	/*

-- 
2.52.0


