Return-Path: <linuxppc-dev+bounces-7761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C56A9279E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZn5sKqz3c3D;
	Fri, 18 Apr 2025 04:27:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914433;
	cv=none; b=EwXP2sKfiRMpb9bcdJ2CGkwzUIkRnrJnIMrvOuZrHq8VfdX6Km8vqQvjU4WRUhFjbIcb4mGLTt2IWMObFl4/B9kvn69QnriL8z97Q9Oaq1eC629HFNeP/DEciFSoRME5q9YNi9cZZFqjJW4eaJrYx5nYbnx2388Mn43BMmYJH9d+EqLVLr7cum9EaX6w7JpGutb1mAX8pqJL7ftnYAP6gVvEP8Z4jZxFNhk1gKl+YzW4uL+M+4WIbxe1yBWBqgTLXj6LB12xqypCM5J4KNF76BjhTRy8zakBkljyzvKoCWN8w7Nhvg9wp5EJ3KNAMaXu3q7u4G9BPoYPiE+KP6fs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914433; c=relaxed/relaxed;
	bh=Xh/2S/nGlgGPJFz9Db514FKyYaJNeBByzBj8vgmPv3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhCrZn7+HdAqmob+nuEaq0GGSPuPCsIvXatMMkjNcV2+vYLyURpr06Nm55PiUS9ptMA5UheYxZZiVKgsHPiWQ+Z/6YHi0gQkmM9d7WjtyhAmi5clWWpcEStVYgF6WK+KgAaSzUQovPHyCkISk6S9MuEUYttIivBXnYD6rfAlkRrW952QP8Pc+jtUU2jei5usBsdKqr4ff9S8RQwx4uLhfdlwPtdH30hKANvn4HcV8bHqi5QylVuQiYw1Vzu9PbIbPHD73TEzbDVEg+VvNUYd6CObLMb1ANxe1g333VrMp0gf9Bo43rvsGcWrr4WXrKeuz8yLatFbehWz9eDZxoVaXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAMyrHeH; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAMyrHeH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZm0rpXz3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 640C94A239;
	Thu, 17 Apr 2025 18:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C6EC4CEEC;
	Thu, 17 Apr 2025 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914430;
	bh=502owMjVm+hoOhMR1Hf0JVEnqbSzLpYcfIVzN4dcz4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAMyrHeHfLzRwrbxfetwQRDA3HiqUq0/dEEsCTS0UxPPaEbIG5tJmbg3rAGVg2Tk/
	 FWgRyd7u4oJs/J9r/MSQDgrCniZyAAjfv07x8Q433tbtXM/cj02e8z9ogeT8hV3q3k
	 ltrMfiL0NqXOsLJSCktIBNSFeapon/0xKWEuD3gknlKZk/QqP8tIAQ9/aoOZLyKT+w
	 wEHiJRhrRc4OPQUjdEv6x14RMWAq8a1PQmaEc495s7C1yDMMD/HY9o9jkx28ppdzyF
	 5g8gRBVnj0K+a02wOI8Fe01UgGzGW+BWFfJ0rfAaj1KSLahA7+5wtmYqemxVSM60AF
	 fngOflAxzYM2A==
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
Subject: [PATCH 05/15] crypto: mips - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:13 -0700
Message-ID: <20250417182623.67808-6-ebiggers@kernel.org>
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

Continue disentangling the crypto library functions from the generic
crypto infrastructure by removing the unnecessary CRYPTO dependency of
CRYPTO_CHACHA_MIPS and CRYPTO_POLY1305_MIPS.  To do this, make
arch/mips/crypto/Kconfig be sourced regardless of CRYPTO, and explicitly
list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/Kconfig        | 2 ++
 arch/mips/crypto/Kconfig | 8 ++++----
 crypto/Kconfig           | 3 ---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc0772c1bad4..9e0cf394a46b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3136,8 +3136,10 @@ endif # CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
 
 source "drivers/cpuidle/Kconfig"
 
 endmenu
 
+source "arch/mips/crypto/Kconfig"
+
 source "arch/mips/kvm/Kconfig"
 
 source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 8283664a1f24..beb7b20cf3e8 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -7,41 +7,41 @@ config CRYPTO_POLY1305_MIPS
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_SHA1_OCTEON
 	tristate "Hash functions: SHA-1 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: mips OCTEON
 
 config CRYPTO_SHA256_OCTEON
 	tristate "Hash functions: SHA-224 and SHA-256 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_SHA512_OCTEON
 	tristate "Hash functions: SHA-384 and SHA-512 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index de71e9c9f2ad..cfa426bea0c6 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if MIPS
-source "arch/mips/crypto/Kconfig"
-endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
 if RISCV
 source "arch/riscv/crypto/Kconfig"
-- 
2.49.0


