Return-Path: <linuxppc-dev+bounces-15629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC7D18CA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:38:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr81n49hhz2xqj;
	Tue, 13 Jan 2026 23:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768307933;
	cv=none; b=Iuo/8G8uvfm3FTE7EcDOCTEU6OvGuUxMAK9ynOh97bIz3fzJPCahVYnGETx+rtQKfGqQM6pleHJTPGPNAWFMOfUAxcXydNUKjAj2VfBw+nLfjYvDxBYpZ2eycBHZF7mSdVEJcPTu7U6hXShk8X/i5VCqIh1tNhQjMSowq+ZT/Um2K+vkGd2cKp10DHR3h9sB9wBPPpv6cmtwCwrCDB6xjFeIFLCZYThRAcNtZmnhG2SioixZzPREX9XFVMFhQ6Xx/1D+96lpUtVKu7JoIGdJtdCa+IUoCV0sjyhT5Fee2vpMokKcLfxOijuATa4k4o0J+zDcyJuj1idSVQC6W1Q+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768307933; c=relaxed/relaxed;
	bh=DIXEuujJP/53sOc3ApBy/q8pmMgXk0ccgl59IEXdAWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvjsssKCxGLLZDo6E825fDtqAEboYddrxOQp2FgUXu2edVheXMA9U0Cvf9ehScrY+NZSoXbfoElS3y1Sfsy5F88nDhISEIYhlfnVBqweLDVwNG+quwH0KL6sQHSab+xtrD6XyFNoZfMgoelBYEk0ajFCJliBfddErunShCBhSQf045kd8t2JD9t+4fCdY2iSugT8IkUaEXIsr8GzQ6wDciEvdf4vqWEdGThZ2hJpppUwKWxF9FUI1KcDtFfh6yltYZu4XTDZ76ZdUg95uKFaEdWK4Frxs243HxyyatGy3ZY1ezV6tM3VSuwUzSYMwXMRYK+Yw7esjCs2F4C4tDbadw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nLeIsvEx; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nLeIsvEx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr81m3mv3z2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:38:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=hAtUMf8ROTvpdShxHkvsJpyhYnZ3QmMAbWJii+OYDwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nLeIsvExC5+X5jR6mAuQuUN5tW0dQT0O9VUluGpThGtpwWNvj7wLGe1zG9lReHHvI
	 hwMd35xOpaV/hNwcgnmzKnO9zXPRicy3RX0put7fcX7WmnvfIMfrmMAF6Pfbc5BgRX
	 JFuK5TPWUz4zYhDfTrtoepW83gPOIG5P+CCCuaMQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:54 +0100
Subject: [PATCH v4 10/17] module: Move integrity checks into dedicated
 function
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
Message-Id: <20260113-module-hashes-v4-10-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=2653;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hAtUMf8ROTvpdShxHkvsJpyhYnZ3QmMAbWJii+OYDwI=;
 b=TYnqLgErqQEviRfBX9IuT27Me3D9lspxMjCYygzqKNWOCT0fixqKr0JI61UfvKcHMaW/fOJGy
 mWucsr0K+t7BOii4UjO7tGT63L3saYtdlekPsdi1BZX7jaOghA6L1t0
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With the addition of hash-based integrity checking, the configuration
matrix is easier to represent in a dedicated function and with explicit
usage of IS_ENABLED().

Drop the now unnecessary stub for module_sig_check().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/module/internal.h |  7 -------
 kernel/module/main.c     | 18 ++++++++++++++----
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 037fbb3b7168..e053c29a5d08 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -337,14 +337,7 @@ int module_enforce_rwx_sections(const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs,
 void module_mark_ro_after_init(const Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			       const char *secstrings);
 
-#ifdef CONFIG_MODULE_SIG
 int module_sig_check(struct load_info *info, int flags);
-#else /* !CONFIG_MODULE_SIG */
-static inline int module_sig_check(struct load_info *info, int flags)
-{
-	return 0;
-}
-#endif /* !CONFIG_MODULE_SIG */
 
 #ifdef CONFIG_DEBUG_KMEMLEAK
 void kmemleak_load_module(const struct module *mod, const struct load_info *info);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 4442397a9f92..9c570078aa9c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3344,6 +3344,16 @@ static int early_mod_check(struct load_info *info, int flags)
 	return err;
 }
 
+static int module_integrity_check(struct load_info *info, int flags)
+{
+	int err = 0;
+
+	if (IS_ENABLED(CONFIG_MODULE_SIG))
+		err = module_sig_check(info, flags);
+
+	return err;
+}
+
 /*
  * Allocate and load the module: note that size of section 0 is always
  * zero, and we rely on this for optional sections.
@@ -3357,18 +3367,18 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	char *after_dashes;
 
 	/*
-	 * Do the signature check (if any) first. All that
-	 * the signature check needs is info->len, it does
+	 * Do the integrity checks (if any) first. All that
+	 * they need is info->len, it does
 	 * not need any of the section info. That can be
 	 * set up later. This will minimize the chances
 	 * of a corrupt module causing problems before
-	 * we even get to the signature check.
+	 * we even get to the integrity check.
 	 *
 	 * The check will also adjust info->len by stripping
 	 * off the sig length at the end of the module, making
 	 * checks against info->len more correct.
 	 */
-	err = module_sig_check(info, flags);
+	err = module_integrity_check(info, flags);
 	if (err)
 		goto free_copy;
 

-- 
2.52.0


