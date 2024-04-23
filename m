Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE138AE45E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 13:41:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MggvnvHC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP0ZN0mz9z3vcf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 21:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MggvnvHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP0YR2wYnz3ddX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 21:40:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A48A2613EF;
	Tue, 23 Apr 2024 11:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77933C116B1;
	Tue, 23 Apr 2024 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713872440;
	bh=BUu7gSVq7EVIapepEGDTH6KVx8cTZeOA7YDgtQSfOKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MggvnvHCIZG3rEFI7aNL5Am8evbh+SbnjNZIHc3KD7m5eW3fVv0KbV4gHpsR7kpUh
	 TZ3DYkDfodHV3Ri5mlKWuP//M42VWVr2+Gdd2SdCWhBaIweZA6aQAt9LuyY6YOojA/
	 lARvuqpVq6WiNz6YGd1l+y1GwoKWD8IRjLWiDdcTlxtxHWCtXzH7/bWXm+LMVW5DRG
	 dAyUo/R/a9LNvmdIyHAkIvb0NwolST493J1Me9y7Gw5L5cmtZLP6crbTPFFNYdxE/b
	 YqGds313IKXqZ11GCaYly8S5F/blw+0UPhuUt2djD91dCyGdZXpD8W3lLTc4DAj4Oy
	 q6rS+0otLiUHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/16] powerpc/crypto/chacha-p10: Fix failure on non Power10
Date: Tue, 23 Apr 2024 07:01:38 -0400
Message-ID: <20240423110151.1658546-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423110151.1658546-1-sashal@kernel.org>
References: <20240423110151.1658546-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.28
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
Cc: Sasha Levin <sashal@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 69630926011c1f7170a465b7b5c228deb66e9372 ]

The chacha-p10-crypto module provides optimised chacha routines for
Power10. It also selects CRYPTO_ARCH_HAVE_LIB_CHACHA which says it
provides chacha_crypt_arch() to generic code.

Notably the module needs to provide chacha_crypt_arch() regardless of
whether it is loaded on Power10 or an older CPU.

The implementation of chacha_crypt_arch() already has a fallback to
chacha_crypt_generic(), however the module as a whole fails to load on
pre-Power10, because of the use of module_cpu_feature_match().

This breaks for example loading wireguard:

  jostaberry-1:~ # modprobe -v wireguard
  insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst
  modprobe: ERROR: could not insert 'wireguard': No such device

Fix it by removing module_cpu_feature_match(), and instead check the
CPU feature manually. If the CPU feature is not found, the module
still loads successfully, but doesn't register the Power10 specific
algorithms. That allows chacha_crypt_generic() to remain available for
use, fixing the problem.

  [root@fedora ~]# modprobe -v wireguard
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/net/ipv4/udp_tunnel.ko
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/net/ipv6/ip6_udp_tunnel.ko
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/lib/crypto/libchacha.ko
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/lib/crypto/libchacha20poly1305.ko
  insmod /lib/modules/6.8.0-00001-g786a790c4d79/kernel/drivers/net/wireguard/wireguard.ko
  [   18.910452][  T721] wireguard: allowedips self-tests: pass
  [   18.914999][  T721] wireguard: nonce counter self-tests: pass
  [   19.029066][  T721] wireguard: ratelimiter self-tests: pass
  [   19.029257][  T721] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
  [   19.029361][  T721] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

Reported-by: Michal Suchánek <msuchanek@suse.de>
Closes: https://lore.kernel.org/all/20240315122005.GG20665@kitsune.suse.cz/
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240328130200.3041687-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/crypto/chacha-p10-glue.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/chacha-p10-glue.c
index 74fb86b0d2097..7c728755852e1 100644
--- a/arch/powerpc/crypto/chacha-p10-glue.c
+++ b/arch/powerpc/crypto/chacha-p10-glue.c
@@ -197,6 +197,9 @@ static struct skcipher_alg algs[] = {
 
 static int __init chacha_p10_init(void)
 {
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return 0;
+
 	static_branch_enable(&have_p10);
 
 	return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
@@ -204,10 +207,13 @@ static int __init chacha_p10_init(void)
 
 static void __exit chacha_p10_exit(void)
 {
+	if (!static_branch_likely(&have_p10))
+		return;
+
 	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_cpu_feature_match(PPC_MODULE_FEATURE_P10, chacha_p10_init);
+module_init(chacha_p10_init);
 module_exit(chacha_p10_exit);
 
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (P10 accelerated)");
-- 
2.43.0

