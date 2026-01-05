Return-Path: <linuxppc-dev+bounces-15206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B0CF1DC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:15:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YF2BrKz2yPR;
	Mon, 05 Jan 2026 16:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590097;
	cv=none; b=TAmBb9IvITI2COsbIlIPjfJqtXXGLyLs9IT9ICZy41M/04looZPzSpnpsbq6jgP9gH42JLNhjVMDa8nB22liGLN7BqHQ2s31aHuIs26pnqDvdDsoiWEfzIfHHZoA+ZqaTqOAI2clmEFjKMmnUj6rou+fKOKq/EEwqAYmV6paLMXEDuAkc2Wiy55DWsGBVRnPTZqet4gAsqmhvR0H6XDrXRuukXHyGQW+gKfL9BGvXQaXZxeoEEVOKK5mhU4QR0MHPu93Q7fajC+OV7XBPq3wACTscAzNCJemZ4DX/uwKSuAVX+rwwqpWpwzh0NBIQObzvD//XLrYumYQAxPAI0T1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590097; c=relaxed/relaxed;
	bh=8A5s08j9C620oqGFPCl12LgSyPZskDWpf26EFaiB/u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8UBjqY82CcFlyC4SB2gqJ/18ipXl0W6SfoJrkpCjPK9Q/pMz5mJvHunO1wFZK88jdi6CzLrCurh7+PUDs8lowg/wSpASdTvAsgzU9OzdiAq7AgWR21+MQyVGpq9Vq9DRaVVLgeYtlHpNAt8f1fdeKcccenM/QXj4zIVmuej2oGcqTQ18o90rFxMO457g9kIm/JEkzqw7dhrIdgJmekzfj7iaY3APkWM5Eye8I8DPvphlToCrcrRnGotLODI1pvio7tJc9PmXjgnzg86Bvs7x6irlGz26UjdzIBzwoWoL6ghQsfFm3/SfUvwOmMUWP6/hAgVPrwClwvfltGZ27lLeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=igzB1iG3; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=igzB1iG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YD0gXzz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:14:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A1CE4430B;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9360AC19424;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590094;
	bh=NaJeCMt68rOEMjT7oGa1VxCfK2+6f9/LQJxPSOh0Gn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igzB1iG36I5ddwcCBE6IyNjLvWLYZddcUzh3vYUDSgjc80fDHOeJgz4Ttks7krqct
	 Xaj+2+Pd+DV44mOpYKoOdnjBs63BiWnHvapVzcjGu4Lueu2IvUOOJLTjDWT7qdeS+0
	 r2Wqpt2qb3tX0hWPzIB9Sl/T2zeTBmaSX2YRUxnTSWGcH7egQzFmEw1xenEG2kRiN3
	 sr1FQe6dnkZ70RTBR6ok0orcHW3XKrfBwnq7jWs/q9gtch1mvSPjAPzIUciiTs2LiM
	 vcQCl+yMtyokIL//1b7maM2ojnVhXhqx8Ol3cvyjugy8onEJpcWWz4iUR479Pbfeb4
	 c6dikBpXXTx7Q==
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
Subject: [PATCH 06/36] crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
Date: Sun,  4 Jan 2026 21:12:39 -0800
Message-ID: <20260105051311.1607207-7-ebiggers@kernel.org>
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

The call to sha256() occurs in code that is built when either
CRYPTO_AES_ARM64_CE_BLK or CRYPTO_AES_ARM64_NEON_BLK.  The option
CRYPTO_AES_ARM64 is unrelated, notwithstanding its documentation.  I'll
be removing CRYPTO_AES_ARM64 soon anyway, but before doing that, fix
where CRYPTO_LIB_SHA256 is selected from.

Fixes: 01834444d972 ("crypto: arm64/aes - use SHA-256 library instead of crypto_shash")
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


