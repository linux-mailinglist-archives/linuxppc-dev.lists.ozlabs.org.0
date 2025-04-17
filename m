Return-Path: <linuxppc-dev+bounces-7762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3EA927A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZp4Tr5z3c3s;
	Fri, 18 Apr 2025 04:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914434;
	cv=none; b=apdlDvJ1wu0ZPikHHaPJWEUzykaJYKxMrVSR/18v0OBKh9ecWELezh68pagSR1+09U8A9Gma04oJ5mQ9LtHW0CldKobb/vgmFFORQx0pvDkRfBTCs917F9RC6oClZ3uGxxftanclqe9kAWPBpiY3ZjYZDQHduVg8QIdRz7B8oSMdD2pFRpmCkEnrOfTtTGafOqByfs5dcKQoGcUxQvbdBQW0Gut6d1g+hs7O6+0pE+XFwYjeCur5MFx+78JSkh52ReOgkMOcG4D/2gIIUXYga5GKervpTQciq4k9y7RD0S2H4zHPf8NTQJvIkdkHYe8omZDagG2dsBmCPVMQ2yNfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914434; c=relaxed/relaxed;
	bh=Ziu+L6Gvu/QsNUG27BOWOGH5dUupD0J8kiCPibpJTeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbGI1m+EW7JY+uhJU/AbN0hCJ2Gbxgdx0U39W5Qb144b78kJgepMc82xlOZ1kQuAhJoGyK+/JWQVoe9uujwg76I0mH3wVEEo3S3O42YdJXypHUUjpLeeP//BcBlo4KYIzzcQuoDqJCPJXuKwjhSHiSz1bU7leoUqlJa4Qh+qSIxfr1NgRYBD1vifSIxh0kqv7vWEeN5U+Y3ErQlEc+QAPgtUhbO81R4Kjsd8sP+c1JeBOqy0p+616oNODP4/dzd6tnREYlWPkfWME9oNUmcfFZ9/M/pnkcK0C/+2BpPXOszjU4VV38JA0uaiM3xDkqu0IHak1dIm5N4puGGTmcREqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWMie4DA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWMie4DA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZn0Q68z3c4D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C50A4A510;
	Thu, 17 Apr 2025 18:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E2AC4CEF0;
	Thu, 17 Apr 2025 18:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914431;
	bh=G+RJfQwnrkpe+wcA+WG93U24b0GCpAuDSETRip59rRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWMie4DATTokrFQv/LaLT+2y5Te5b7EzAIDVUK6YdkaXLjrBF5GDhBHPh+63huN2W
	 Er83WZhTfYFCVtYFjOI3rJWltW5O9QQ2PCYWbMoZAQvKCc+FAm47RNAKyZTqpbmLMv
	 5/wbtrkLP20SSF/KC5920irbPfn5FnSadNc4EAK1eVK8tb/4Uf2ZOSnZ3cHuiQ1zNO
	 VzCg47eWhx45SZp2T/tDX+++Uc+pssczx1X8xY3QBG4xkFlVkMu6ZumATl2ZMa97wB
	 quS/5UzIHOtaGmLyS7TiXHsHj/cYY6Mw48TKzI9Z8ILte/qi2p4qJMoeEFfVRCDNxn
	 m7ZdqcDwRm2ag==
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
Subject: [PATCH 06/15] crypto: powerpc - drop redundant dependencies on PPC
Date: Thu, 17 Apr 2025 11:26:14 -0700
Message-ID: <20250417182623.67808-7-ebiggers@kernel.org>
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

arch/powerpc/crypto/Kconfig is sourced only when CONFIG_PPC=y, so there
is no need for the symbols defined inside it to depend on PPC.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index cbcf76953d83..8bcc69013464 100644
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


