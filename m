Return-Path: <linuxppc-dev+bounces-15208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C03ACCF1DCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YG3gSHz2ySb;
	Mon, 05 Jan 2026 16:14:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590098;
	cv=none; b=DEHM1r58kl0STAhsJA/CMLtfPa0dVg2IZPtLyeswMN+CcUDzewro7Bxm8tQ461h4E1yf0B0riNmLNsLG/bCFLja4/5+f9IdLp6Y2OIZgz00NYwbXc3v1A5mJAsLLXVFwtqnDW/DKO1YXtdFHi+P/9w6yQMTElQ/gcd0Y/6L0vlMxAmZ8TVHkmaUojB+xr4HqBVrVmr1N+jAMXlz4Cjhn0lwHDzZWqe7G7lHRz8jUa/BYTMBLSzq9fgAGTMOIa92zSXbfnf0e/yjc6FXg2y8r8Df4Yfj91OWK9O2DY5K/4sPTcIeIGMTcaIriu4AblNh3JctA+CIxNYJJG1C6FXr47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590098; c=relaxed/relaxed;
	bh=GE/ik1wAzAwTyudQNL1qpPhVU7extNOPBrRt3K/rmXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dymtA6TrauP6r/jdvCNrviw6Lc0gf4l/ilRu3Yx3w8v98dcsQ9SotOJTMbiXxopnuM+ZtdH5g8Fysc/aQdAGrtwCNlUqxFFUBvrukKXgv8xhsjda1+Nz6sJwDsWbjCLEpPSGEuhFHhNqvjme2qRkVM5XVNbY38nmHBgrMRplWoHM5yZHe1SwOpryLomOF9Czjs93vf2UIHQLgEc4UrAr7BNGKF0lk9tXzzpJdV0P5VcsVcZkRUqKOZOhC6UBZNcbavO3rO6YjNoHADQj4NuDHf3cqiSL6vQ9VwtnkFfJ1hpyScKZsdzCRNyvxFH6uTfF00AAudWKsDh7i3/LawDurg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ha2Mg2lm; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ha2Mg2lm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YD6sBmz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:14:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D84D36011E;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5DAC116D0;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590094;
	bh=r+Qzw8crmbVQ6JrhV/JdglMrrXxEutC0ymCPwabmY4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ha2Mg2lmVEyVLJsqAxVeeF3Hs64jrH9zp2Xowl6MfoO/WjdTlOUp7UNsCTZkTJtfU
	 2AYsyz02/MC1BAUuUuoBZAAKn6CAkbwzdKIP9v/9RaFaVlsPUTBR1Woohd2oKK9FMO
	 5Rot1rQ1o2dNTQtuIt/afr1Uq6xrxjiZyQ+IT5GvmdQgtjAHrsK8GdwhELc8E7+eRv
	 9pHjeEyKHYLlQcEY3FNTJCSA4nzsOny+dsca1a4hl1RnrQpY5UnvlJGyvhEzgNgW8y
	 /GwmtZUqbDRE9WdmGEsKpgpkR36Z61nAyxx0OD8nadJY+jrz/URE7Bdw4del+ewJqI
	 vkYTEb2DdJScQ==
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
Subject: [PATCH 07/36] crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
Date: Sun,  4 Jan 2026 21:12:40 -0800
Message-ID: <20260105051311.1607207-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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

Instead of crypto_ft_tab[0] from aes_generic.c, use aes_enc_tab from
lib/crypto/aes.c.  These contain the same data, so the result is the
same.  This will allow aes_generic.c to eventually be removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig | 2 +-
 crypto/aegis.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 12a87f7cf150..443fe8e016fd 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -764,11 +764,11 @@ endmenu
 menu "AEAD (authenticated encryption with associated data) ciphers"
 
 config CRYPTO_AEGIS128
 	tristate "AEGIS-128"
 	select CRYPTO_AEAD
-	select CRYPTO_AES  # for AES S-box tables
+	select CRYPTO_LIB_AES  # for AES S-box tables
 	help
 	  AEGIS-128 AEAD algorithm
 
 config CRYPTO_AEGIS128_SIMD
 	bool "AEGIS-128 (arm NEON, arm64 NEON)"
diff --git a/crypto/aegis.h b/crypto/aegis.h
index 6ef9c174c973..ffcf8e85ea69 100644
--- a/crypto/aegis.h
+++ b/crypto/aegis.h
@@ -60,11 +60,11 @@ static __always_inline void crypto_aegis_block_and(union aegis_block *dst,
 static __always_inline void crypto_aegis_aesenc(union aegis_block *dst,
 						const union aegis_block *src,
 						const union aegis_block *key)
 {
 	const u8  *s  = src->bytes;
-	const u32 *t = crypto_ft_tab[0];
+	const u32 *t = aes_enc_tab;
 	u32 d0, d1, d2, d3;
 
 	d0 = t[s[ 0]] ^ rol32(t[s[ 5]], 8) ^ rol32(t[s[10]], 16) ^ rol32(t[s[15]], 24);
 	d1 = t[s[ 4]] ^ rol32(t[s[ 9]], 8) ^ rol32(t[s[14]], 16) ^ rol32(t[s[ 3]], 24);
 	d2 = t[s[ 8]] ^ rol32(t[s[13]], 8) ^ rol32(t[s[ 2]], 16) ^ rol32(t[s[ 7]], 24);
-- 
2.52.0


