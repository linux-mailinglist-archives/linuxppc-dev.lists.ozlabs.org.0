Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A488FFC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 14:03:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OxZCP8BM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V53cS21Vtz3vdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 00:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OxZCP8BM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V53bh0FhPz3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:02:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711630937;
	bh=x+HARHjN6PjTasqejFvCjOWEUt0vA4nR9qlaT1Vlr5g=;
	h=From:To:Cc:Subject:Date:From;
	b=OxZCP8BMd8mnym1pAo2FNEHLzwJZw5ncXfQr0rV0N1Q04cZ/fJnoQoZV/Nn7DByPx
	 oY4tNYQ7ULeBCNJhVjUmRDOZf0JoFLu7trm+Cvef9XPH4YXvIBPMR8a0iuq1DA6opt
	 PNmBx1LmqFhibPkoFuLOsooOyqY3tPRK2Bd+t8qrqnravOUzyJ5nxd7swfe4WM0XHg
	 8NfBW+VgQlBXl/ZTGzJY+o0TKPjcbW42iiQslibed/gj+H5D3H4LKUxtQ3+atdA3WS
	 QnTQuf00Th3iXc4HKt46R0Hw6ZnCcOfIxLIhbqmKg2DXlLfktNsJ1UvOctq19F8iUT
	 qJRF3UkQmxuVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V53bX1JF9z4wcq;
	Fri, 29 Mar 2024 00:02:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/crypto/chacha-p10: Fix failure on non Power10
Date: Fri, 29 Mar 2024 00:02:00 +1100
Message-ID: <20240328130200.3041687-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dtsen@linux.ibm.com, msuchanek@suse.de, herbert@gondor.apana.org.au, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/crypto/chacha-p10-glue.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/chacha-p10-glue.c
index 74fb86b0d209..7c728755852e 100644
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
2.44.0

