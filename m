Return-Path: <linuxppc-dev+bounces-15556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559BD14E90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj2z3wg2z2yFx;
	Tue, 13 Jan 2026 06:23:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245803;
	cv=none; b=THjD8OnT46iHv5qGWQyjCLLRPUlG+pKGD+OR27qu5lf+D8Po9M+Bix7ij4Vjf0BAuHIt+8HA29TNBJRNrlxwqePg3LCyf2dMswWWL3kPayTJrphNXjzV9pqKq+Ec8h3/s4uYiWKtAIgeFfNt63pOnJdf8xGUKmPwCLCMIMW4ivY6Zv+U+7TgY8MalNA5ckW6pyTJSKIHLwP0BMffwgwoBYWOB6t3my8S1bFR+0IQN5qLutTeJhvd/zsxfETMRud+dn7bbI06gDI3tTHxiQ0b1kKL6cwkHo9z1yq+qbx39/1gAf1IysIXpAxJlpCrR9Z+sEcecFWEKr4s7w2Q+qW/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245803; c=relaxed/relaxed;
	bh=X5QVv+pK3Q/Yd8L1PsQakg0si7xNSItbltSuybfv5CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9WHMsJPwv2jiu6N5mHH6/ufjwMg5J63mcOTVM3DNMahNAujiILvFI/13JcPtRzPadgEF0ncCkMNX8OyNbXXaHAQPpxMPFx5KxVOOptS0sJG1KwWqFt5EesSXWo+KUPLvX0DYy5RlX2trjmp2At86eq83gvwUIN4voP/PUg7q0ij8RXR6ZzAQJOQZMHHXfOk/VJOFLQl39D91BFCUbd5Lcd0/AaDF17fxiPbw43fTjBXIIlvQXKcp/AskWyh//ZPVhNzr3Hd7yvPe8T6EaeKmZpvcXlSHm8vby50M2h1n6zDof5e323BrK4WYBCq0lvnXNrapCZ3ujily/ooCRVFIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JXIHBvTp; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JXIHBvTp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj2y6nVYz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D8004430D;
	Mon, 12 Jan 2026 19:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EDDC4AF0B;
	Mon, 12 Jan 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245801;
	bh=jF7KhWSZryEBB0FeZdUnAzVuxZQQQuTKuWy5tUR+OmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JXIHBvTpr+H6VX4tbUc+PGAH5U0i1qcPQ/D9pk3S5+zn6TPIK3c9zuSj62qZvCQsW
	 NezYfkOvYDjk8SDzcWZEm0pV/M/QtoIolJj7BCFE3jieqSwUy9Q8HoTjScWYkKXAIY
	 EGJyRspSX3ezX38NkMpCfd3FeywvkK6RPpye3nl+z71yk17w1EkE4n91YothPcu5ny
	 2eys2Ah0khcFVZzHoxmLLiTEmxNFK6hGDOrqjEqHXPvE3pTB/pDb94E0UZhl9nhGQt
	 fJ17HRRNKm26vQZTwyd3aV5KEua5phkd5XM/D6RbTU0GuDZSgjbkHy5JcvGhgAHnBi
	 9+Osz6DZLMkzg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 06/35] crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
Date: Mon, 12 Jan 2026 11:20:04 -0800
Message-ID: <20260112192035.10427-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The call to sha256() occurs in code that is built when either
CRYPTO_AES_ARM64_CE_BLK or CRYPTO_AES_ARM64_NEON_BLK.  The option
CRYPTO_AES_ARM64 is unrelated, notwithstanding its documentation.  I'll
be removing CRYPTO_AES_ARM64 soon anyway, but before doing that, fix
where CRYPTO_LIB_SHA256 is selected from.

Fixes: 01834444d972 ("crypto: arm64/aes - use SHA-256 library instead of crypto_shash")
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index da1c9ea8ea83..4453dff8f0c1 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -38,11 +38,10 @@ config CRYPTO_SM3_ARM64_CE
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_AES_ARM64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
 	select CRYPTO_AES
-	select CRYPTO_LIB_SHA256
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
 	    XCTR, and XTS modes
 	  AEAD cipher: AES with CBC, ESSIV, and SHA-256
@@ -64,10 +63,11 @@ config CRYPTO_AES_ARM64_CE
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_CE
+	select CRYPTO_LIB_SHA256
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
 	  - ECB (Electronic Codebook) mode (NIST SP800-38A)
 	  - CBC (Cipher Block Chaining) mode (NIST SP800-38A)
@@ -81,10 +81,11 @@ config CRYPTO_AES_ARM64_CE_BLK
 config CRYPTO_AES_ARM64_NEON_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
+	select CRYPTO_LIB_SHA256
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
 	  - ECB (Electronic Codebook) mode (NIST SP800-38A)
 	  - CBC (Cipher Block Chaining) mode (NIST SP800-38A)
-- 
2.52.0


