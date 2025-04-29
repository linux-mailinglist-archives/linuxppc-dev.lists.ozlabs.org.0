Return-Path: <linuxppc-dev+bounces-8147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF3AA0D1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn11F30vSz30VF;
	Tue, 29 Apr 2025 23:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932305;
	cv=none; b=e6BIW3xb/iIBfjiVunDQDLsiuXUDc73KMHi80pLKIaBW+OuX0j6ixqeMFsSpV60hGuAjAIQZLX1heH68rjAF7PAOkVrXRX0aotDEqVIX6NuZiyH9JD5Vv8hAWmiRphM3rdw2hL7nFBl224F12QmdubsgNnm3Ji0BKIm/Sfl7MwmbWzRVpJkegPxhz10miLY5S1ZTkGEz4tXuQha8VRBBxZoROBpgKCISnXDSp46x9/WTBHGhqj4bWUjv9IEHJcYQhE6JBV94+AV0BQK9UsKCCWQj7iX6F5LbmY3bQUGId5jh18oIl3FtKTcNzqcpU0Qf14a+WlnBDl2cyxLIQHIV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932305; c=relaxed/relaxed;
	bh=S0yCm4OGge+sQpscopHNk2h1csJHis5gPj31mD/ExFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC9CXGizWsIxs/gRTFtJP2Dj5G0Imf5o6ik/n8Beuy8b8Kt58sY5nhK2xbe6KLaNKsa/N1c9wb194Pj0iKCdnZ62a4ZEbjXbUaPolPJeO5cGX4xU9m/9rJFQ8FlHC//7Qkwf3nZP3OpIdKmW4Az5HSOgwjOQeV5JzbfkVn45HfFqYbWhvLUtB6JghbGnjnMzQtCiHijfRagWJ5UPhLqBiol/HmDUt0tDq4VJdzG2DGyjGrSj2xnoQ5JCjXp5aJB+jIOttDtiIYtneqELIHgITemIvsXMUgmNQkPJ6gqONZGGZTXITmn0cKSSgTi7fvaOvKe8HM2lsMCTqhMymN0dTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WtCigX7B; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WtCigX7B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn1192pVbz30VV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:11:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=kmQUIW+5wYPfShUIrOsErGdMJNnQUWIZ+BIWQSkTJR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WtCigX7BHHuvjnDxDfwmcSBeyBTCRfjxFnCfp2BR4OAm8h26gm2cA1/Y41MLSAFgt
	 1Lui6JugA7ZpyRc/IZB1OjD42wB3i+36XOrIwAmkctFHApWN8n8eNQWTRbRgCPvph3
	 brq4Vp0mkbXBZ/i62ncTuTb5J/ZgYF05LkJovw2Q=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:34 +0200
Subject: [PATCH v3 7/9] module: Move lockdown check into generic module
 loader
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
Message-Id: <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=1576;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=kmQUIW+5wYPfShUIrOsErGdMJNnQUWIZ+BIWQSkTJR8=;
 b=UeBVXcH7NmJEkR+38OyjzyfoU04GJpL9A/GpeD8/tUNbtYa0RNhFf/oUemhiWfy3i/HNqh5wb
 6448IhPkVJ2DZ12vw7Fz0/2aJ9GNQhLh065QNg6B4NkyTQK1vbDsDIR
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The lockdown check buried in module_sig_check() will not compose well
with the introduction of hash-based module validation.
Move it into module_integrity_check() which will work better.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/module/main.c    | 6 +++++-
 kernel/module/signing.c | 3 +--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 0c88d443a3bc894b18a7aa230cadf396e585c415..1c353ece05fd1d2d709204e4d5fa44ecb8832bfa 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3254,7 +3254,11 @@ static int module_integrity_check(struct load_info *info, int flags)
 	if (IS_ENABLED(CONFIG_MODULE_SIG))
 		err = module_sig_check(info, flags);
 
-	return err;
+	if (err)
+		return err;
+	if (info->sig_ok)
+		return 0;
+	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
 }
 
 /*
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index e51920605da14771601327ea596dad2e12400518..029e1ef6f0e369fd48e8c81154b6c697ad7a6249 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -11,7 +11,6 @@
 #include <linux/module_signature.h>
 #include <linux/string.h>
 #include <linux/verification.h>
-#include <linux/security.h>
 #include <crypto/public_key.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
@@ -100,5 +99,5 @@ int module_sig_check(struct load_info *info, int flags)
 		return -EKEYREJECTED;
 	}
 
-	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
+	return 0;
 }

-- 
2.49.0


