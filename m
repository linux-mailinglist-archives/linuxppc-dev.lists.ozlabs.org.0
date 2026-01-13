Return-Path: <linuxppc-dev+bounces-15640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599DD18E47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8Bx04wkz2ynn;
	Tue, 13 Jan 2026 23:46:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308408;
	cv=none; b=Ka0UpRIgDtSsgFXs/iMcGq1TB6uTYu3zCeYxhrJ1emNF0+MBKEMP/NDqONLXpMfGu5VFkcvcn2aCjTpLXXToIHCCWyFiBD4GddixbRBmH7h4wOoi3CZVlOV4rze3JTcOoT4LUY1AWxNz+pC+wXgPbIbir2kTKon5f6yDgHkDjSbcVmGaHhX7vKUXZJWvEXSK83XoMO1dX/xHhrUU6KQw2B3n21RyISQLVZJQagcQNnC9cG9hTWJEGg1Gf3NUDEqQ8ErZHGJrNXyirxLvwAccJ/fLUeX3E295jYR57apk76wzvBsEcCbeE8q2ari7+eGIIgz5z6/zcZT8hdZ3C+ifbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308408; c=relaxed/relaxed;
	bh=PrDLwPyl2RVdIvUDPsJ865p2Ac6MRsDTAB7xMkqdBJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaP6xbQC1ew77DRVkQlQT/Hdnp3LNsYcEGNTgBRph2CSaiWQiyXzRhHbITuo/qBcLPjgcXb5zUMFjHqFCTh+WpnU62hBMkt64UXfiZy3cnvQ7qIpixbp/kDwXcPApF8a+5O+KOV02fZjwKfQyQA74tnu7ln8T1FVkySflM80Zoyw/jvujgR1cqEa58zV3d8rUorYljLASQKKDWb/if9NxLg6PB6lQ/08FBKthRiKivsaMd7L+cDabZvv6tgFj2JBMtGHTP+AFjT1Wn8+7YzvQT3E2qxlTY3swWl7PNRGhOA/hg6gtZH120WK4AQ7oXYJY4eyEA/pxE6VY3Oj0+H4aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=c11joj4q; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=c11joj4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8Bw1MGvz2yks
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=AQXwlX52KxlPEn4u0pj+ZozDxqAQgmwa0bwnrtMfO2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c11joj4qS+McPfr25fP7A7kNvS54i2wodhNwGm8BF8MCHBCTbxTURec2JoyZDdRLa
	 Kw17+gExC9oSprSJCnNAf0nQsgFYPfgN6utQbd3WSPey3DtHOjtQxfI3MZ2PKPf3+h
	 eArjJN7G84s4hKv5pQDHE51Nz9g0vsrfcVsPQXdw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:55 +0100
Subject: [PATCH v4 11/17] module: Move lockdown check into generic module
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
Message-Id: <20260113-module-hashes-v4-11-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=1463;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=AQXwlX52KxlPEn4u0pj+ZozDxqAQgmwa0bwnrtMfO2o=;
 b=6Vy1azrI605whNaZMGmixiJa2Dmq7kFxo81sevB94fs40VlaNg6/O/Qz3rsQ10vnnq984b5K0
 ZZT91klbjx1D5nQcLz0zpYHmdyhSDmffrqm+1UCDCPp4hIbzpVmoMks
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
index 9c570078aa9c..c09b25c0166a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3351,7 +3351,11 @@ static int module_integrity_check(struct load_info *info, int flags)
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
index 66d90784de89..8a5f66389116 100644
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
@@ -68,5 +67,5 @@ int module_sig_check(struct load_info *info, int flags)
 		return -EKEYREJECTED;
 	}
 
-	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
+	return 0;
 }

-- 
2.52.0


