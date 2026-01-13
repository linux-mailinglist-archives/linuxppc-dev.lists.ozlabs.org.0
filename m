Return-Path: <linuxppc-dev+bounces-15639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E6D18E41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:47:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8Bw5t4Sz2ynP;
	Tue, 13 Jan 2026 23:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308408;
	cv=none; b=Am6+olALR7Xh27wgpmSYYZQB+/+SubbrqHSVt0I7oUNXGEjZpPG5E94mARv1XO7aD4w0jIC1pwtBMoOLXBye5PKhZbVMSupN+cKWrhHwjaOVX5/sYz1QdDHgb0y1oCEwYht89E8WKBqnWP1VgoH62nEGbqujFKAjym1+/jZE9OccfxjPRwwwTe1O1ljlkiD4Q54nU2KKFsuMcyQLK7mYPreyhB46qsAiVgKa+Bg2Ju/fA1Yv3SLCGhEIVqmcaICL5WMhCHpf5qWHBF6hnCmQyXlSG9akjcGU+vC9/yJVGn2EOLVOnBtRIN4vpNrkF58A2UTUuX+n7XihWcvFz6SIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308408; c=relaxed/relaxed;
	bh=CeygNIzHFWJ7cWbz5rn6ZflPngLSKJOy6OOrAL0rlRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQ9NhHcvkjNi8wBMCHYrzT+c3shuZHR1MbeGkaUPuVLmNiEACCAhYak723I3bV8UbD9wPXUoLIzAzbOENOIeXFj0KkhJcDCf/B019SsidGvKNhcy9FPcRlvEkvMZUlafVAWldJnt0Khi0QR56BHyC0XyQQkTUcs+q1LnUrZCMh0VyvjgZQLbX5J8UxgVrH7+M0eXY9WddAkWwfCLSW8fASux10c3wamK8XLy+wwP6iYEmSTAfEweUxvazqgJZKS6gsgoQlUe1BoC/3xMllaK0R/4O1+YGWi2vidmqiVcR5VnmUjhaxSGZCPAdm9B0ntF8nhzn81yKXRQxpILKHyvjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nykdCqRX; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nykdCqRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8Bw0Dg2z2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=s0y09ejJrfvI6BDYjzt+p3QqNUHYOG0PUerqb17chAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nykdCqRXMQEPNNVhqI4IMkhiOVHlWWTvYcRj6i/WpHHMJuriU0oAdA6iaFR0bxyCp
	 RqnMAFimntilzRwbpGFb977FfLmG7lTw2tkOB7UXSOpSKEZ4eUzY5XEw2iK3gIXums
	 KLNufKaP8k/iv8PG/rUfSk4ssFbwf0H+NXhvUH2g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:48 +0100
Subject: [PATCH v4 04/17] module: Make mod_verify_sig() static
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
Message-Id: <20260113-module-hashes-v4-4-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=1228;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=s0y09ejJrfvI6BDYjzt+p3QqNUHYOG0PUerqb17chAU=;
 b=uwg0wFTAu3Q06NkGGP+SClBTEtm6t/P9IPUONWe98bNwGb9YkRYeWkqllddS3Jy0aw5RpuMhA
 a43F4kdpYaJAlRRI+ZcWb/HGQ+OCDraXpoYd0EBmq25H2uVLsqPNyev
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It is not used outside of signing.c.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/module/internal.h | 1 -
 kernel/module/signing.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 618202578b42..e68fbcd60c35 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -119,7 +119,6 @@ struct module_use {
 	struct module *source, *target;
 };
 
-int mod_verify_sig(const void *mod, struct load_info *info);
 int try_to_force_load(struct module *mod, const char *reason);
 bool find_symbol(struct find_symbol_arg *fsa);
 struct module *find_module_all(const char *name, size_t len, bool even_unformed);
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index a2ff4242e623..fe3f51ac6199 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -40,7 +40,7 @@ void set_module_sig_enforced(void)
 /*
  * Verify the signature on a module.
  */
-int mod_verify_sig(const void *mod, struct load_info *info)
+static int mod_verify_sig(const void *mod, struct load_info *info)
 {
 	struct module_signature ms;
 	size_t sig_len, modlen = info->len;

-- 
2.52.0


