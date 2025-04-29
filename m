Return-Path: <linuxppc-dev+bounces-8152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E053EAA0D3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn16x65llz30VV;
	Tue, 29 Apr 2025 23:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932601;
	cv=none; b=W/+iq+ThI+EzkVjVdoXkNjN7ECPER/1mpN3nAELAjpI/wJP5I5D58WNKSSlqxGNIl85m8265ytZsFOgoZkhMWu99IHCvzk2oR/m++XvDTps3BmQF2sovdfGtfkl+lZpUxfUamgRNpO+O2zxFCJ5f5XzVFbS1X6YIFWSKstvKXVtMvwUa2Lp5NzZoUDR1RMMf+EPJ6KI+awBqWbLGFjbw31ZCvRcfebegq71K2AA9AP7x6IrrGCpcs+dM1/qIpvxAG6L57bycDt8ilN8/oMl5oTALsajQVk2YwvVXoxQeYmSlWi1l6WPwAixlS3I/Fz6GDxPTUoSko6FapchG33UA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932601; c=relaxed/relaxed;
	bh=D0mfzNzeZGvxseKRVw4KkjR3t663Y4oMuKWcXq6VpbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAjBxFQdYP8lGdnRRA+ur22nQcD8dBm3rsKIpmIqaUB+rfIQOIMUG3oE63rHxJrbxiZ3yD9cjGACl77tVF5/NqoRna+rMbKCTXJcyHdiC1oOQHRgh95Ds4S27nlkFBJngDSobXE1GTbss+ehyK/jaWIl5tGFvW8olKiRlj4ZnPyYLFIwXWxDshcv9vSXXa3DVLeGzStDZPhk6tvLxuntMd7oJAqXBDjRwRNRzmSFgI/lcamAdfvOJZWRD3WdHxWtJN9ca0YpDPVhpoDjA5XqKOa8Oy4xUqbvopnuFPxvUPC9eNQ+jswPgcrvN8SS8u1glPikMRut//giyCrJFuy+xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ndr5eUgV; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ndr5eUgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn16w6Y43z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:16:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=d/NdlzD2KV2pF2aazqdTVXD1jSSYLt8dgjzDd7PvoPo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ndr5eUgVSV+gAn8uBtqf5gkqDazOK0n25l02cugLtcQTuqMr/LNpa6t6wzbfuMAjH
	 12Qulrdyx2c2aBEE5Yq6GwMxJfjD8udHNeMcCf4DwcNNIpMaOWa5/Pa3TCszUfVEud
	 TJ/gfqJ/aj7cVBefjCJblpJsOrMKeMlWCvvIu+FQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:28 +0200
Subject: [PATCH v3 1/9] powerpc/ima: Drop unnecessary check for
 CONFIG_MODULE_SIG
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
Message-Id: <20250429-module-hashes-v3-1-00e9258def9e@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=1136;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=d/NdlzD2KV2pF2aazqdTVXD1jSSYLt8dgjzDd7PvoPo=;
 b=xAYAenyFdE04MOoAyCY51VYJoTBGGcK4Soq/RQ+egxA1KIPa8xT21DSMBRyeZrix2b6b8RUK5
 4oPcru3LJfZABty4/kT+0dOo2ZPe8NuL+rpxUHGjPov6s65d3wYcJWl
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When CONFIG_MODULE_SIG is disabled set_module_sig_enforced() is defined
as an empty stub, so the check is unnecessary.
The specific configuration option for set_module_sig_enforced() is
about to change and removing the check avoids some later churn.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---
This patch is not strictly necessary right now, but makes looking for
usages of CONFIG_MODULE_SIG easier.
---
 arch/powerpc/kernel/ima_arch.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index b7029beed847dc0acf15b3edbdd7fe9e60626f24..690263bf4265c78331b5f306097543ce12ac7dbd 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -63,8 +63,7 @@ static const char *const secure_and_trusted_rules[] = {
 const char *const *arch_get_ima_policy(void)
 {
 	if (is_ppc_secureboot_enabled()) {
-		if (IS_ENABLED(CONFIG_MODULE_SIG))
-			set_module_sig_enforced();
+		set_module_sig_enforced();
 
 		if (is_ppc_trustedboot_enabled())
 			return secure_and_trusted_rules;

-- 
2.49.0


