Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A161888D14D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 23:41:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ICJtMX3p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V44YJ31XPz3vZZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ICJtMX3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V44XY3Ffyz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 09:41:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0E84CE2471;
	Tue, 26 Mar 2024 22:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A94DC433F1;
	Tue, 26 Mar 2024 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711492873;
	bh=fE8YQ0ldH4jAPvC8YbW24he4IxhcXj1g5OmwhFjAj+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ICJtMX3pCuiusynEfe3bAP6Lspz0zcyuLbBOka+EOsCaOFZME4FZ4QIKrK/MZdJmq
	 Ctvnh5OIwUz+4zf2REjGVM2wdtuYwLoVkURryHKORb15fiwpv0FTQMJtESTGs4TGQ9
	 M95cMSdR9qm2j/ow8DdkaA96bSW6B+j3pXIETUi2N1JbBiGG6nS+FatuULN7WX9ApY
	 OEQW8S0LDu+tihl3F/LXp4MYlPtjNGctBOW8AUwWSRImiBVjqWYm1AiepC0fk/OF4a
	 ICeRLsN9MuXhJv/PBCigSpwkmoq065lOs3WVMt19zKcKFsi3X/clDOsIaByQv9Gr8K
	 a1f7cxjjNEj7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: llvm@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 8/9] ALSA: aoa: avoid false-positive format truncation warning
Date: Tue, 26 Mar 2024 23:38:07 +0100
Message-Id: <20240326223825.4084412-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jakub Kicinski <kuba@kernel.org>, Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

clang warns about what it interprets as a truncated snprintf:

sound/aoa/soundbus/i2sbus/core.c:171:6: error: 'snprintf' will always be truncated; specified size is 6, but format string expands to at least 7 [-Werror,-Wformat-truncation-non-kprintf]

The actual problem here is that it does not understand the special
%pOFn format string and assumes that it is a pointer followed by
the string "OFn", which would indeed not fit.

Slightly increasing the size of the buffer to its natural alignment
avoids the warning, as it is now long enough for the correct and
the incorrect interprations.

Fixes: b917d58dcfaa ("ALSA: aoa: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/aoa/soundbus/i2sbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index b8ff5cccd0c8..5431d2c49421 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -158,7 +158,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	struct device_node *child, *sound = NULL;
 	struct resource *r;
 	int i, layout = 0, rlen, ok = force;
-	char node_name[6];
+	char node_name[8];
 	static const char *rnames[] = { "i2sbus: %pOFn (control)",
 					"i2sbus: %pOFn (tx)",
 					"i2sbus: %pOFn (rx)" };
-- 
2.39.2

