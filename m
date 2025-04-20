Return-Path: <linuxppc-dev+bounces-7824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9DA9491A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnD1y5Pz2ySp;
	Mon, 21 Apr 2025 05:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177264;
	cv=none; b=EfbPuBfAUTSoMHOSOXu76kXA3a4L2LhqJX1uFpZ1/nv5wIhxx/Ryt2cCs+KhcQPsJprH2dIORiIF5Jmn1y+I0vajImwv0FJVRtpxTPHA8mlvUPZML+yoZqQTx9vtPUsfNu+EGi8wx3JWEH8SA8eKS4pjapOaPFyS+BwljePBTIZfJ4COSMDrTI5BLvZhwcXBOnphwII1dkAWu/5wHHJpbHtjcooMfgs/l0mYAvMEphNw+RB0c8hZy74dfs1zKCVBcnJ7RMgp5LlnMQoUmEOgRGm2wtbAxEq2oAboI+iyXaJWFrA76rFRDmr2XrgD7os2HNSH8+WTpIWBFHtLPrK+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177264; c=relaxed/relaxed;
	bh=83KXcYEIsD7ECHA1NKyy7H7dP/VBiX8gnJNujLDgaCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oj7FlAM7myFHdPAY7t7rf1PSqeFWxA7uRgu9LAUUlDemv3Zdf6PdGLRNNZlVzQf27qLnFxA/ZnyBGjflK1f53qH/FWqfqiy1h+DZnNn+lhIYRcRYbOtOsifNXGPzSlxo/JNomMm67ET+hGiW/s86KuzUJFdZAXpTi1cnTQNFlPw8gQo171MaE/HxnGJnG8vTuux2M2/vYymtVvsEk2/VjzGlqYVLPdtOyB4icFIizUG+YWRWgDnFSLUQFv1fFWMVNLewrvUykpDY3vmN9qFXLJ2D7js8D/B3nme1roJLb4pAV2tncVQrown91FSFrDwgLGNER2T+HWOD8d+w9SAQ3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E2xZ4KW5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E2xZ4KW5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgdn92xv5z3bcy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A957A61155;
	Sun, 20 Apr 2025 19:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88EFC4CEF2;
	Sun, 20 Apr 2025 19:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177258;
	bh=Wsz8KfnWpKz3RjYagwsQwuMx7mcDuZ3DmLJCHCvCnLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2xZ4KW5Pp6GY/TWizi6GAOOXMZzDb5wjHT++8poogg5/85P9lO38XFXkIkTyJidR
	 94z2Ah7sF4UvG3kioylNC8LbE17K+iuEdbZ5tCXkenLerrhreO4+VGH2wXRdIPVynv
	 OLo1yy3vEIgsLZZ44hNSqAv7xog5qZ6wshOeEjGEGI55ke8xourKat6MoUhaZ0vZI0
	 AzDHJ5R7NXKhaunnB9eeyAiOHktkhimLjnL55dtZrAB0LWczGZu/OkRfXmJAbkmR/w
	 XFxLJvu5AyYntgJSpWFP9Jdq6V2iJfF/7anZPtGfK9IvUGKNFzQ+UonFs0oZblHKBS
	 U0U/IkR8RwExA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 02/13] crypto: powerpc - drop redundant dependencies on PPC
Date: Sun, 20 Apr 2025 12:25:58 -0700
Message-ID: <20250420192609.295075-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

arch/powerpc/crypto/Kconfig is sourced only when CONFIG_PPC=y, so there
is no need for the symbols defined inside it to depend on PPC.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index cbcf76953d835..8bcc690134644 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -15,48 +15,46 @@ config CRYPTO_CURVE25519_PPC64
 	  Architecture: PowerPC64
 	  - Little-endian
 
 config CRYPTO_MD5_PPC
 	tristate "Digests: MD5"
-	depends on PPC
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC
 	tristate "Hash functions: SHA-1"
-	depends on PPC
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC_SPE
 	tristate "Hash functions: SHA-1 (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_SHA256_PPC_SPE
 	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, and XTS modes
 
-- 
2.49.0


