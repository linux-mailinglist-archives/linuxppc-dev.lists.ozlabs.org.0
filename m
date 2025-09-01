Return-Path: <linuxppc-dev+bounces-11597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF99B3EF6D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 22:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG0bt22D0z30N8;
	Tue,  2 Sep 2025 06:20:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756758010;
	cv=none; b=YS8Kstz/HEzk8T9Cdc3brLeynDo4jdGE2D3IdwhZEVEcaI2hVplXQY7bJRf7Z7/poQE/E2aSERhf/b2/fl7eWrus5lBJSk00VEgB5QcguDwJqqZEjI4kUh7TmeaEFWQbhOYFhTKk+BLwPoeJ8ZJpLYKXqEeeQFAmCnEg9zh8RtlFFTZblwYXXrd+D6dGpbVO9wT3lvpczX/5EHiQIzncoa05kGSlIOKEah4kpb+2bCjbP2ru0+XDBiXSW4uTksz+O96Oi76Dr9TCZW/PoZb+e7H80P1gTafnw56hOnK73CQsMWlxIjk4VkE9XmJO5PQ65QmpEXv59UDo5/J/mSDJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756758010; c=relaxed/relaxed;
	bh=orrZV8BgljpRok2XNuKDuddPobJ4kJErV/0v8tbU/Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTX/mYye45Y2xApQ5QGpG5/sX7QzzP6WVVyb/W/ZOK/b1k7+b4SOEmdC41sHG9hBNqftvOdv7y9mg0EOlxZp+dKsddSv+7hWFeCsuXKkfbQajdVcAQDi51/ADI+TVCquYX1yfbmwqPbhDEb7e4N/+toaNzIs3SrkQPDfMGt0IB0+VnwKX9ItDu9tsp7rQOAbRAENgHVfYV6QZVhKiekRG7Nby9NplQ4igyyWcNCpn6nLXhtNbYe+lNBd8irnu7lhSpyFL1R7Qyj+LNfIkJDVwI27YA8+k6QSbHBO0RJYLuZCSMrrk8wu/s75hX9+zxw7jHdkaQ9WeCNKR8m0V0LXhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EHQUaFNi; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EHQUaFNi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG0bq24jzz30D3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 06:20:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B5D6451D0;
	Mon,  1 Sep 2025 20:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AD7C4CEFB;
	Mon,  1 Sep 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758005;
	bh=JTwVCxO7VQKt0pRSCgeHeHvmX5quhsNXXzZV2f26Bs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EHQUaFNi4blbX5PTf7aLd/PFviWGJZSHnriTKZcM4f5aizDg/DZbXpaXL6iuDApof
	 QNpM6udN3UQwiCu/HyvhXSUaOX55V+3SkCyOZmubMBBzBJZb0iJtbBBBPk6xS7flRN
	 JY5pAM/vhJ9JKqTgmkfaYUTnh0e++XI7Ds8kCVPwyE0AMjbqOnhoxfDYWg/mTAIt6i
	 JaW/NRdzgOkpDOmlj4zKTj8dG2MGdbxU5NbFyGk8Z3O2kGAlFymWw2I8HK2CGsIbjZ
	 qlgqW6m3ZsNwGLAIpLghUxEceS+rA8Ha4rNV+DCRZXDyedqOCd58DWdqNXIYtzpnY8
	 xYA+XIk3l3CEA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6/6] wireguard: kconfig: Simplify crypto kconfig selections
Date: Mon,  1 Sep 2025 13:18:15 -0700
Message-ID: <20250901201815.594177-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
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

Simplify the kconfig entry for WIREGUARD:

- Drop the selections of the arch-optimized ChaCha20, Poly1305, BLAKE2s,
  and Curve25519 code.  These options no longer exist, as lib/crypto/
  now enables the arch-optimized code automatically.

- Drop the selection of CRYPTO.  This was needed only to make the
  arch-optimized options visible.  lib/crypto/ now handles these options
  internally, without any dependency on CRYPTO.

- Drop the dependency on !KMSAN.  This was needed only to avoid
  selecting arch-optimized code that isn't compatible with KMSAN.
  lib/crypto/ now handles the !KMSAN dependencies internally.

- Add a selection of CRYPTO_LIB_UTILS, since WireGuard directly calls
  crypto_memneq().  This gets selected indirectly by
  CRYPTO_LIB_CURVE25519 and CRYPTO_LIB_CHACHA20POLY1305 anyway, but it's
  best to make this dependency explicit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/Kconfig | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index b29628d46be9b..ac12eaf11755d 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -74,28 +74,15 @@ config DUMMY
 
 config WIREGUARD
 	tristate "WireGuard secure network tunnel"
 	depends on NET && INET
 	depends on IPV6 || !IPV6
-	depends on !KMSAN # KMSAN doesn't support the crypto configs below
 	select NET_UDP_TUNNEL
 	select DST_CACHE
-	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
-	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
-	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
-	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
-	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
-	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
-	select CRYPTO_POLY1305_ARM if ARM
-	select CRYPTO_BLAKE2S_ARM if ARM
-	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
-	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
-	select CRYPTO_POLY1305_MIPS if MIPS
-	select CRYPTO_CHACHA_S390 if S390
+	select CRYPTO_LIB_UTILS
 	help
 	  WireGuard is a secure, fast, and easy to use replacement for IPSec
 	  that uses modern cryptography and clever networking tricks. It's
 	  designed to be fairly general purpose and abstract enough to fit most
 	  use cases, while at the same time remaining extremely simple to
-- 
2.50.1


