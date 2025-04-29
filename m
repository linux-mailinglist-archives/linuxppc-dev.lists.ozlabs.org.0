Return-Path: <linuxppc-dev+bounces-8153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1228CAA0D3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn16x6R5Wz30Vf;
	Tue, 29 Apr 2025 23:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932601;
	cv=none; b=OiivyhgkP5lPYzjSJdRKKSdbmvxe1AX16r2Yuu0ISOh4KH0I8DcUg7nc6WEJDo8swpB5evpOGP5VUNPhBSpusg04NvpaXpO2e7idegM1XvIKESMtIG+F6owhZPS3hAZDgbc9w4hetz9c9K/edy+pnGrUYvmMgpkwhiw+yvvNC0EPVBx2SAY3iXvMwORWkc+xct01Zz/iVUZGDOoCiuhB/0440CWuRoNBHoF2lNFAGGwQoDCKF+kmp2SplUx+6UySbjtq7Ci4kbSYDeLFOdWcyawaHtzdJdnNa8EZORp6EGD4GcbXiQ7Wu3xxkPrJZ7tGevmEPYwZt+DkffAG3RUrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932601; c=relaxed/relaxed;
	bh=GwIgXgXMxDD89UdFxdVKvfSxS1D5hFyBysRT3C0LZs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPbK/9+4KI3qJnNP69mcEge6OMkIXdOkH9xq7dcOordqUB5aeActQnR/DIDgZc12OneUGUP4dhI6LmMxOMnluaXEbCDyFHz6ZzwfsXmgnZ4A3Z24PNnySCcxuIzrwiDKH3hRwDkQHCdN7dqBOT/GNWofKTLGRE4eTwIg88Oj1G1JXdxkIREJRWw1Yrsya7c8d3b6Q2msfHdQrOcrPuvBtD2HOX4jtkDWShRytC0eJkX1CMGdZR6OwpQCoRtuEle3P1tyqj5hLzq/L1SDCDmVj6U9xzG7PhD8oJqByL1qbw0HOImDjFwJw0Dy6AGQhxEpa2RKQbbAySDPAgaTRPXT6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=eiah1WdL; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=eiah1WdL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn16w74G2z30T3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:16:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=1xKcF/fZBhfU3Lws3Lfk6rUfxpZo4l0csYGo9PaBtCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eiah1WdL2eKnsF7tQ414dNOZY13u6Gw2P3IfbaT/10ayiN3HQ8kS3E/T1C3+5ggRb
	 QEGUilTpabghS1t6UmwPDRzXag/l+pAotCjlPOcc2hoD4PWZyCCR/8Elaucqny/daz
	 fuTcdZeyUfEffjQMxcQzOZWNYyc7eoBO/Ny43d14=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:29 +0200
Subject: [PATCH v3 2/9] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
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
Message-Id: <20250429-module-hashes-v3-2-00e9258def9e@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=1247;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1xKcF/fZBhfU3Lws3Lfk6rUfxpZo4l0csYGo9PaBtCc=;
 b=a13h5wSKAMY2UUgKVrcvnkrp4Fl9Me3K/4ZYxUABDz23YhoCDCM9pCfUmG0fTL+//hJo5AEVV
 PMuGwyrVySpBCThOG9GBIP02IHEMR+SD7/hVSngRiTx+1Er+YuGCw/9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When configuration settings are disabled the guarded functions are
defined as empty stubs, so the check is unnecessary.
The specific configuration option for set_module_sig_enforced() is
about to change and removing the checks avoids some later churn.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---
This patch is not strictly necessary right now, but makes looking for
usages of CONFIG_MODULE_SIG easier.
---
 security/integrity/ima/ima_efi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/ima_efi.c
index 138029bfcce1e40ef37700c15e30909f6e9b4f2d..a35dd166ad47beb4a7d46cc3e8fc604f57e03ecb 100644
--- a/security/integrity/ima/ima_efi.c
+++ b/security/integrity/ima/ima_efi.c
@@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] = {
 const char * const *arch_get_ima_policy(void)
 {
 	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
-		if (IS_ENABLED(CONFIG_MODULE_SIG))
-			set_module_sig_enforced();
-		if (IS_ENABLED(CONFIG_KEXEC_SIG))
-			set_kexec_sig_enforced();
+		set_module_sig_enforced();
+		set_kexec_sig_enforced();
 		return sb_arch_rules;
 	}
 	return NULL;

-- 
2.49.0


