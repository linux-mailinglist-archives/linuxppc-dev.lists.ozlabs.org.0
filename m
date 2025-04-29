Return-Path: <linuxppc-dev+bounces-8148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202FAA0D1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn11F4Llxz30WY;
	Tue, 29 Apr 2025 23:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932305;
	cv=none; b=KwphmdIPKgAWf1EHIrbH+15T5xJNy5it7xRdWHmf6ASjGGbqqgKE3XDhFgiu2ybRaS87riTVGigyIqJXT0umUR8P05CQM2BauIftrRus5YBKQUuaH915QVADxFesLVFRVMG9XOXfOYXuR2rYJ2OyBEUb73l/O3ycD2d43+ipdJ6fyJmdfDfzIqHu/KV7IPUeYCHBy20kM09dErFaQClfV0X8cn5JVEjAaXAeEUZytRvn52jg2wmnU1j1vOYJ7Kic4jW/GqM+rPuuno8Fq/vk9SaFzKglc+cYypyUpkQ+7G4OpX3QdYUVcdihxkUrbiu9v4qMeLQBXX/5YHcvl2oPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932305; c=relaxed/relaxed;
	bh=aScCtlxWmkOt5Ivc1Zwa4/rnBW43yx6ns9TNjITSQ0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hya6ASH0y78MNZPXSLbR29nfJf+LMwPM8aVIiYH1zQ/NNMXGRXov88OMJp7B4CvIUhHcg7GxRdRrTgYvIWLN9T5BvEkAZ9gOcnm5F3I58FdWij8uTP3N3RfTK4kwFPFKISASJwz6WqtVoZi6uZFELs2cPnDQT2WAMPvQXzFbISEmo+VnkcMuuz5yMU7NdBYBM0Hj+8RX9IjZuFBgZUrJPVVphlzLxGMXHjeEq038odLosl2KTERQbVSFDPeYx16J6FvET3rHFywkfQv5B7KAIb3BlnJ/alS6IskDeziloGqCglgnUOSUBCBxW6GiaxCVwXQmbeUyrAqf96UmiI3JNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IP1DdbS6; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IP1DdbS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Tue, 29 Apr 2025 23:11:40 AEST
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn1186JzXz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:11:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=uAWB6PT9KWFnBAMA3cbexNOM6gBbMJ+pc0ZLJPh/nCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IP1DdbS6IzaBothHocjADf+qL4oAkLdiurq64F5MflZ0CZDa/lYpWrsml+742YHst
	 iOyI0+5LcIsIS/W4HFdjoT/ntGDbtphulyydXha40XALs+kRmGLCiVLEfgRlEXd44i
	 i3j7qFAN06WEqLbuj3qkp+iO8C4pKXai2Bd1HOA8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:33 +0200
Subject: [PATCH v3 6/9] module: Move integrity checks into dedicated
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
Message-Id: <20250429-module-hashes-v3-6-00e9258def9e@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=2744;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=uAWB6PT9KWFnBAMA3cbexNOM6gBbMJ+pc0ZLJPh/nCk=;
 b=iRF9YHFRJ0F5rufwXzvY22fLGkR188SEbIQOvxK8Ykc40lMoYTbbn3dxF8M1U6Io0VBFSQnub
 DLlawF/4eSbCgHUqpSnuVTwGNU8WrJh6r3nnQCGoXmCtSCexZ7mG2aR
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
index 626cf8668a7eb9202fce13d631f39429a4fe0ace..42fbc53c6af66a1b531fcad08997742d838eb481 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -325,14 +325,7 @@ int module_enable_text_rox(const struct module *mod);
 int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 				char *secstrings, struct module *mod);
 
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
index 83c66205556fdde92152c131f1f58229c4f7f734..0c88d443a3bc894b18a7aa230cadf396e585c415 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3247,6 +3247,16 @@ static int early_mod_check(struct load_info *info, int flags)
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
@@ -3260,18 +3270,18 @@ static int load_module(struct load_info *info, const char __user *uargs,
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
2.49.0


