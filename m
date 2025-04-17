Return-Path: <linuxppc-dev+bounces-7765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C8A927A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZt3lGjz3c4r;
	Fri, 18 Apr 2025 04:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914438;
	cv=none; b=cf95gItTzU9tzqEdVBiCWOdCtP0DOg8vM3SR9Sh/rODBe7qYSI02S5MDd9Br9mXMks/kBin4DldJPC4cxUUqYz5/qW3CAc3W7fNgiXX6CBVyOG6UiyPHx4YhaseU1uzeO1p2e+Mv4MU8K6Gi+WLRKodzpghqQZtWuTAaHN0YlUJ2VYWtA+uwpfgOeZYmq6pRhy3CSbqnZcK08tDcig99GtRSMDnnc4GuUBnpEQ/LqzANYzYzoXkyVOlTH4YtS+Q9k4WHS2b8/rPVSNmhlTE4flniaBJgI8dqcwpamqqjByJu0cTli/M8VWVkQxjJouDp1WztkC/hz5pxVYBqYtSL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914438; c=relaxed/relaxed;
	bh=8hZQ2R0YEs0vZ6aEcLQBtSfCUDsQ+taoCfYorQUDELk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhDvckBCKvhiUmDz3np3oliT0IxQBJGBwrE9KHIJ+H7eIRZXVuj39+O96j094xGMqxP7rB9DsrL5+WWsnm4+mqU2TBY1QOTv9xC8tu+lshZyxB3IRa87va9wntwxHqxTWSmrJWVVFWYwzPXY3WptrufOXDZ+l4grTBIiEs/ebJ2X4PR/cRJvyuiz7DtTQKUont3IQeAPDnPqpxJShEZYTLeokjzK+X7CKqmsxkpIAnsWh9AALVrNJUoFbYm4r+7MMuFlXKAiCx7+ee1XMGcqo9HnORZhrMl9UthV+ivhRQDmocuafJQv9HQlmEbqdh3jQ4J+po1APf8rRfN45DvsFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsPQ7SM0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsPQ7SM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZs4JFHz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE1A549E43;
	Thu, 17 Apr 2025 18:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A178C4CEEE;
	Thu, 17 Apr 2025 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914435;
	bh=JbJS8/qnHgUt3U/s/OZ1wHouJGsPrwOIMNb0fsrruts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsPQ7SM08OE2nVaOMuo7BI2L0WCPbuWvkvRFKYA1VN20m7TA2WLujzpAcLu7ZMcib
	 hPnCRg0E7SNiql3hUMjtjrKocI+hy9AGuNATMqCgnk/rNoSndaJyXohW2QtNmOUSPf
	 HrM2yP1EtnKQZI2TXj4jwGIcWlPFoOfnUtif6W1J55H7QSOzeGZBBl4pFsL/oOnTEN
	 CWOaPKhbHIyWJ9YsfjPH79eEhWbfY/xLRdrWQ9tJfUzkID0IPOW6mp/fkmf8M1/xUN
	 vdYRLr2CQUbbJhMAXeeDorK0RWUQEsRQB9v5kyhJZrk3fHLwmkx9SgLxxg4V3BakOJ
	 ld/9yQXGcf11g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 11/15] crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
Date: Thu, 17 Apr 2025 11:26:19 -0700
Message-ID: <20250417182623.67808-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
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

Source arch/sparc/crypto/Kconfig regardless of CRYPTO, so that if
library functions are ever added to there they can be built without
pulling in the generic crypto infrastructure.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/Kconfig        |  2 ++
 arch/sparc/crypto/Kconfig | 14 +++++++-------
 crypto/Kconfig            |  3 ---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0f88123925a4..b1081e627a28 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -407,10 +407,12 @@ config UBOOT_ENTRY_ADDR
 	 hardcoded by the SPARC32 and LEON port.
 
 	 This is the virtual address u-boot jumps to when booting the Linux
 	 Kernel.
 
+source "arch/sparc/crypto/Kconfig"
+
 endmenu
 endif
 
 endmenu
 
diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index e858597de89d..477a85370507 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (sparc64)"
 
 config CRYPTO_DES_SPARC64
 	tristate "Ciphers: DES and Triple DES EDE, modes: ECB/CBC"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_DES
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: DES (FIPS 46-2) cipher algorithm
@@ -16,61 +16,61 @@ config CRYPTO_DES_SPARC64
 
 	  Architecture: sparc64
 
 config CRYPTO_MD5_SPARC64
 	tristate "Digests: MD5"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_MD5
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_SHA1_SPARC64
 	tristate "Hash functions: SHA-1"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
 config CRYPTO_SHA256_SPARC64
 	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_SHA512_SPARC64
 	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preseving ciphers: AES with ECB, CBC, and CTR modes
 
 	  Architecture: sparc64 using crypto instructions
 
 config CRYPTO_CAMELLIA_SPARC64
 	tristate "Ciphers: Camellia, modes: ECB, CBC"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: Camellia cipher algorithms
 	  Length-preserving ciphers: Camellia with ECB and CBC modes
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 78e83ce576ed..c0906bb4f844 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if SPARC
-source "arch/sparc/crypto/Kconfig"
-endif
 if X86
 source "arch/x86/crypto/Kconfig"
 endif
 endif
 
-- 
2.49.0


