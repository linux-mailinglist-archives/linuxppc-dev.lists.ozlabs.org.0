Return-Path: <linuxppc-dev+bounces-15645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4CD18EBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8J74KW5z2yFx;
	Tue, 13 Jan 2026 23:51:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308679;
	cv=none; b=HblDnsWS6vQD8TqLMxgzmNcbxuTprqVrPacZwk+zUE9k2fuzNaoojnkabJOVxVYSHO0tykF3FhqyjeB0Lyxj0eKsFxjiQXfe0r2Vc0jdwOLlXt/4qkN9TYlcOEohf1D/jBLjZirt+s695lG0eKCAN4fr3vI5uUzXTYsowxh0UnLFyRYMc2KHkNyrULkbJt1IfqyiQ8b2P8sCQNUDWJyZXuTCVu6di16OAw83HyYvxJ85otfcsGQQ4/a9WkzZMFaewgkwubB+cZmhLjsd4FK77o5l+XmCVXPbJYK7ZdU1gCKz60rClqFLI/5Af3PE4/wSmNh4T4F+FmIHTW36D6WOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308679; c=relaxed/relaxed;
	bh=OZcSPQ+nxFNp1PVjO+C5npOM7BXWqDYLGR4hgh6VUM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSnqy3jKzwYfoe6vx6vzQA98ohBPCf1e1NBLr1qbR6drn3P73OSs7Nu/m6FV4ttMJShYwkO3WhpvEhBdS6OpDo02YBJKhEy1RDHTWfJaouHKGzASucOml7x+emSOYikuHP/YkiFXZ0FhZ9HHlv7NNmQkrcIZAzbY5OtzD5RHyXYlfTbqikur2yCtYv4d69W7r/zmmUHdFJtafP/SCjef4VhlmAbogSi+19Xups+wJ9jqNecmR/URgU6RD1t3ubWEtmJXYALqFv2xKynceXpuPNMAJFjBzv1w+s6Mo8bmmAEG8AJE6IXNy0QCZ6SLxHuTKe7bl/z16CeE3m3oepGGwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=YE+kQagF; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=YE+kQagF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8J61ZcYz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:51:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307861;
	bh=wiGilzlJGxFjaan6NlKlyZZaDBA2UKvl/XF2WjjMx6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YE+kQagFKh9daN0RxItnnroaDWonJFctrKTeWMvLqOvMs2i9t3IWQMf9nRQyJDNRJ
	 HSv4PhKj7Vdtix8kAjUS93d/J4s1s75KZcejQntz3rSuVvDFQkV9CEca7KfYBa1uf3
	 On97uSNgCluCpj+piU3wGzomnlrPzTzs1KtBdfVc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:57 +0100
Subject: [PATCH v4 13/17] module: Report signature type to users
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
Message-Id: <20260113-module-hashes-v4-13-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=4866;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wiGilzlJGxFjaan6NlKlyZZaDBA2UKvl/XF2WjjMx6k=;
 b=KAsSSKg1Ln9puX/5OxsRVwQb8QTjxUUu8XwkrwtE72rnkyqXNI+EKOqMaGUlcezXU7vfnPPeu
 YgXgsZUuxtnBrtSgolQua8rPA0Kqtl5vge+JPQPk7zeD40eqoowxPTw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The upcoming CONFIG_MODULE_HASHES will introduce a signature type.
This needs to be handled by callers differently than PKCS7 signatures.

Report the signature type to the caller and let them verify it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/module_signature.h    |  2 +-
 kernel/module/main.c                |  9 +++++++--
 kernel/module_signature.c           | 14 ++++----------
 security/integrity/ima/ima_modsig.c |  8 +++++++-
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/include/linux/module_signature.h b/include/linux/module_signature.h
index 186a55effa30..a45ce3b24403 100644
--- a/include/linux/module_signature.h
+++ b/include/linux/module_signature.h
@@ -41,6 +41,6 @@ struct module_signature {
 };
 
 int mod_split_sig(const void *buf, size_t *buf_len, bool mangled,
-		  size_t *sig_len, const u8 **sig, const char *name);
+		  enum pkey_id_type *sig_type, size_t *sig_len, const u8 **sig, const char *name);
 
 #endif /* _LINUX_MODULE_SIGNATURE_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d65bc300a78c..2a28a0ece809 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3348,19 +3348,24 @@ static int module_integrity_check(struct load_info *info, int flags)
 {
 	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
 				       MODULE_INIT_IGNORE_VERMAGIC);
+	enum pkey_id_type sig_type;
 	size_t sig_len;
 	const u8 *sig;
 	int err = 0;
 
 	if (IS_ENABLED(CONFIG_MODULE_SIG_POLICY)) {
 		err = mod_split_sig(info->hdr, &info->len, mangled_module,
-				    &sig_len, &sig, "module");
+				    &sig_type, &sig_len, &sig, "module");
 		if (err)
 			return err;
 	}
 
-	if (IS_ENABLED(CONFIG_MODULE_SIG))
+	if (IS_ENABLED(CONFIG_MODULE_SIG) && sig_type == PKEY_ID_PKCS7) {
 		err = module_sig_check(info, sig, sig_len);
+	} else {
+		pr_err("module: not signed with expected PKCS#7 message\n");
+		err = -ENOPKG;
+	}
 
 	if (err)
 		return err;
diff --git a/kernel/module_signature.c b/kernel/module_signature.c
index b2384a73524c..8e0ac9906c9c 100644
--- a/kernel/module_signature.c
+++ b/kernel/module_signature.c
@@ -19,18 +19,11 @@
  * @file_len:	Size of the file to which @ms is appended.
  * @name:	What is being checked. Used for error messages.
  */
-static int mod_check_sig(const struct module_signature *ms, size_t file_len,
-			 const char *name)
+static int mod_check_sig(const struct module_signature *ms, size_t file_len, const char *name)
 {
 	if (be32_to_cpu(ms->sig_len) >= file_len - sizeof(*ms))
 		return -EBADMSG;
 
-	if (ms->id_type != PKEY_ID_PKCS7) {
-		pr_err("%s: not signed with expected PKCS#7 message\n",
-		       name);
-		return -ENOPKG;
-	}
-
 	if (ms->algo != 0 ||
 	    ms->hash != 0 ||
 	    ms->signer_len != 0 ||
@@ -38,7 +31,7 @@ static int mod_check_sig(const struct module_signature *ms, size_t file_len,
 	    ms->__pad[0] != 0 ||
 	    ms->__pad[1] != 0 ||
 	    ms->__pad[2] != 0) {
-		pr_err("%s: PKCS#7 signature info has unexpected non-zero params\n",
+		pr_err("%s: signature info has unexpected non-zero params\n",
 		       name);
 		return -EBADMSG;
 	}
@@ -47,7 +40,7 @@ static int mod_check_sig(const struct module_signature *ms, size_t file_len,
 }
 
 int mod_split_sig(const void *buf, size_t *buf_len, bool mangled,
-		  size_t *sig_len, const u8 **sig, const char *name)
+		  enum pkey_id_type *sig_type, size_t *sig_len, const u8 **sig, const char *name)
 {
 	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature ms;
@@ -74,6 +67,7 @@ int mod_split_sig(const void *buf, size_t *buf_len, bool mangled,
 	if (ret)
 		return ret;
 
+	*sig_type = ms.id_type;
 	*sig_len = be32_to_cpu(ms.sig_len);
 	modlen -= *sig_len + sizeof(ms);
 	*buf_len = modlen;
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index a57342d39b07..a05008324a10 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -41,15 +41,21 @@ int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 		    struct modsig **modsig)
 {
 	size_t buf_len_sz = buf_len;
+	enum pkey_id_type sig_type;
 	struct modsig *hdr;
 	size_t sig_len;
 	const u8 *sig;
 	int rc;
 
-	rc = mod_split_sig(buf, &buf_len_sz, true, &sig_len, &sig, func_tokens[func]);
+	rc = mod_split_sig(buf, &buf_len_sz, true, &sig_type, &sig_len, &sig, func_tokens[func]);
 	if (rc)
 		return rc;
 
+	if (sig_type != PKEY_ID_PKCS7) {
+		pr_err("%s: not signed with expected PKCS#7 message\n", func_tokens[func]);
+		return -ENOPKG;
+	}
+
 	/* Allocate sig_len additional bytes to hold the raw PKCS#7 data. */
 	hdr = kzalloc(struct_size(hdr, raw_pkcs7, sig_len), GFP_KERNEL);
 	if (!hdr)

-- 
2.52.0


