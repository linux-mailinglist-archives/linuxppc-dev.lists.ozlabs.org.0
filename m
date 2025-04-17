Return-Path: <linuxppc-dev+bounces-7757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB4A92791
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZl0Vw2z2yrJ;
	Fri, 18 Apr 2025 04:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914431;
	cv=none; b=Zw04kottfchjtSfi94Xcvi4SmmMFJ3UqCBrN6h/aq652S2DcDmUfZd1kRRKJNspDZ6nbyqsqQRFF5qB37GMXmKkHOINs61kbagXZ3Zw/WQeFNl5VCpfkCIYqI4A8TeOGQeanMIHvoz3ptuEnsnxL3K1kIip16p046jHViS13rAaQEURHwV6akm+1ZGdVzfpvQA9wuuRNG/1HPMwGtADFW8zfOLnnSEvgZmcrCZPE4QQfwB0lQi7AwbSSt2C4v5oXfwjlSB0ZUWxpR/ZS3gUwwcBIqU7SC4I/gfEyGHrX5KrRRpJdxF+cLJj3e7eMQLr6QTmOzp3XXKxMufEr1cuYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914431; c=relaxed/relaxed;
	bh=QLvmdUOpIt3qputYjrPPCWLqkyP+trIqVdJfTraaI+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfRj3MS7to3atCn7tdrUMVPwQXwAM+/wQmpUDRWj55IpPPMcKibokZgyoEzenXy7ysJ9UolT60WBzyRg2XNPSNejCM3k3p8i1kTItPtlYTqja1z+9yC5VeCBj0jnlVSqKn1lpQloBVuYvckD5eo9OISC6la4CxfiGHdhwsEXc2MVYzxr+qdn+ITd3wNn1x+hGQvEVlcwqqekg+dAPs3RPaJq5WsIRxwNRYktHD9nSGECoK3fHX4DmttUbhQaASQSAvsEhzT/RlX8Loy99lqDBw2DeKE6dJjHfUSPRO4iOWhbbjd07wiRvvLBKgRbZObxJzEQzzL4SbPEC7OwrJONJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=toxBea61; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=toxBea61;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZk1Mkdz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF4ABA4A456;
	Thu, 17 Apr 2025 18:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8307C4CEEC;
	Thu, 17 Apr 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914427;
	bh=nXbV1Uvq4c8RL4YhRp/ivGFjNzOtTa70IujwafR6+UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=toxBea61JWC5/trBUl49NvCsVkVAmNhju3B87UReIfBHz8VnRyE/LuVybLVF2k/nY
	 ozG0hZ8OBwzDL6uS4Zi1cnO2Mrn+mq1gQ/r8Oq+czYCLjfyTD/V03RB7fCo5SP71wf
	 zlxk4RJm3o05FtCFrRaAKTzpr6oWDwo/e21dJwjhdxrVVorZg+xwqsKTLym49Olhvz
	 SwdxWMKOu8BP6ibmjf8JnzW3kYR8b7Naf0ZpIJmNV9xQkNMUjmcXpx+iFVvnhelZFG
	 WffphaS/N+aHynjqKlRMXoA+AQi8OOH4tWYJ2rqeMi/Rw6uFqtGdZWOBgLIHH2X50p
	 7wDfzUig2kHFw==
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
Subject: [PATCH 02/15] crypto: arm64 - drop redundant dependencies on ARM64
Date: Thu, 17 Apr 2025 11:26:10 -0700
Message-ID: <20250417182623.67808-3-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

arch/arm64/crypto/Kconfig is sourced only when CONFIG_ARM64=y, so there
is no need for the symbols defined inside it to depend on ARM64.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 7c2f63f2e307..704d0b7e1d13 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -135,11 +135,11 @@ config CRYPTO_AES_ARM64
 
 	  Architecture: arm64
 
 config CRYPTO_AES_ARM64_CE
 	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
@@ -252,11 +252,11 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
-- 
2.49.0


