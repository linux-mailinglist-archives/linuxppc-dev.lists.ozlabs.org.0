Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFA1C27BF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 20:34:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DySX45T0zDr3l
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 04:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=PWqPGct5; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DyKk33Q1zDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 04:28:10 +1000 (AEST)
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 010742075B;
 Sat,  2 May 2020 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588444088;
 bh=DIRRWMKKG6PuEZe/jxmnBQSb7EtQNzSmtDxFdL5Rd74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWqPGct5HDq0OUWPrgUsx7rK3tDbG+8sNdu4jJJYWt/+/yQ17tK0BnhXBcie2PqXc
 /px/lgw4jBC+9RANyujawdCzcMFCPhOtJ4Mpyc2v0BWrapwq5Dh/7u3Sbtzr22AUEA
 iEOcpPSkn9LnwYA0kldJJj4wxarmeqTpFW1Tmd7U=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 2/7] crypto: powerpc/sha1 - remove unused temporary workspace
Date: Sat,  2 May 2020 11:24:22 -0700
Message-Id: <20200502182427.104383-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502182427.104383-1-ebiggers@kernel.org>
References: <20200502182427.104383-1-ebiggers@kernel.org>
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Eric Biggers <ebiggers@google.com>

The PowerPC implementation of SHA-1 doesn't actually use the 16-word
temporary array that's passed to the assembly code.  This was probably
meant to correspond to the 'W' array that lib/sha1.c uses.  However, in
sha1-powerpc-asm.S these values are actually stored in GPRs 16-31.

Referencing SHA_WORKSPACE_WORDS from this code also isn't appropriate,
since it's an implementation detail of lib/sha1.c.

Therefore, just remove this unneeded array.

Tested with:

	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-
	make mpc85xx_defconfig
	cat >> .config << EOF
	# CONFIG_MODULES is not set
	# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
	CONFIG_DEBUG_KERNEL=y
	CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
	CONFIG_CRYPTO_SHA1_PPC=y
	EOF
	make olddefconfig
	make -j32
	qemu-system-ppc -M mpc8544ds -cpu e500 -nographic \
		-kernel arch/powerpc/boot/zImage \
		-append "cryptomgr.fuzz_iterations=1000 cryptomgr.panic_on_fail=1"

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/sha1.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/crypto/sha1.c b/arch/powerpc/crypto/sha1.c
index 7b43fc352089b1..db46b6130a9642 100644
--- a/arch/powerpc/crypto/sha1.c
+++ b/arch/powerpc/crypto/sha1.c
@@ -16,12 +16,11 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mm.h>
-#include <linux/cryptohash.h>
 #include <linux/types.h>
 #include <crypto/sha.h>
 #include <asm/byteorder.h>
 
-extern void powerpc_sha_transform(u32 *state, const u8 *src, u32 *temp);
+void powerpc_sha_transform(u32 *state, const u8 *src);
 
 static int sha1_init(struct shash_desc *desc)
 {
@@ -47,7 +46,6 @@ static int sha1_update(struct shash_desc *desc, const u8 *data,
 	src = data;
 
 	if ((partial + len) > 63) {
-		u32 temp[SHA_WORKSPACE_WORDS];
 
 		if (partial) {
 			done = -partial;
@@ -56,12 +54,11 @@ static int sha1_update(struct shash_desc *desc, const u8 *data,
 		}
 
 		do {
-			powerpc_sha_transform(sctx->state, src, temp);
+			powerpc_sha_transform(sctx->state, src);
 			done += 64;
 			src = data + done;
 		} while (done + 63 < len);
 
-		memzero_explicit(temp, sizeof(temp));
 		partial = 0;
 	}
 	memcpy(sctx->buffer + partial, src, len - done);
-- 
2.26.2

