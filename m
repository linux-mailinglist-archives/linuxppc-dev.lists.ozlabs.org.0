Return-Path: <linuxppc-dev+bounces-7821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B65CEA94906
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgdn85qb4z2ydn;
	Mon, 21 Apr 2025 05:27:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177260;
	cv=none; b=iZthPv97YyarR+WECnz93pq/ZrYSrHN71XIku9i7PakC5A8BMQMig0BQTJusyLkmdL3ptnA3zzSiIIWN0Jwd5xpJ64UBxovED3hsx07/C6qt73OmitcqAWWEoNV5V9Twaq0kQ5GRyz8aMINCfLv9NIjH+cGrRy+uljRijQu6IF3LEC2ARZjOGYsCoV+ULzwuzBzFA2SMDdBUzmD51xSlAOoPHK4NJo0e3eXxej3EymwjfqOIQP+DpGFmLhw0hB4wnus1GYRRdSRZu4jcfvDvEFax9jnptFOgYn21wjrXr08uSZzbq6o+3Fuz30nwYgAtZMqOI3YsDTDxTXOpLw+axw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177260; c=relaxed/relaxed;
	bh=BXOTPuOli1eIcJwQG34NgZuSSH6yPSMhMkpDB3PNs3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRugd1O08KjDYyMVz1bBp9zlHjAWKUnhje4DbfBs7i2LQC11FfFw/G8F9Q6lyIkN3D0MRwoGX+7HV2vAehAhL9zMsqRlvck/S5d9gm9CId2iMRE5jbAhG8sk+rl8q7MkXpMEvI2ISNljol5f9KHMw7sRvjEhoaey0mf4qHcnQUdSOih1pMK6/dvEmesjgCtFmhtN2d1JI6kGwCA7MntwAJxYDR0cmeQbvzr3ccbiBgJu6wdj64Ck1VIdy1rOMl+efkjPNUIFstn8a1bg/7H9vrnyDdcaiMfTUrBpFNhBePyun8QZYYu53psu+ndMpmw4OTBSoEiqf+MXmJn+8pXWkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o9TI7aC0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o9TI7aC0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgdn753Bjz2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5773C4A6E6;
	Sun, 20 Apr 2025 19:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A345C4CEF0;
	Sun, 20 Apr 2025 19:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177257;
	bh=ySujzJwEjUZrj9er8XlrWX/11KoXjZIlZ2vhV5/jq10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9TI7aC0W6sDFYjdwFetT0Htr1lKbZ7CRIb92PqjTlyPCPRl834rlsPq4Upa7TwVU
	 KUK3O17RKKGtV9jgwuXyKmuOVSZQqgsouS72xWZ2DXYXR2p3aaop7Z/twb1Pp2xNrh
	 VSR8kglU79GjgMfqghQnbKAFMEFT6wrVHmrnbFNrAdKrNv8Ow9NZ1Wk+PQCHs+Ubwf
	 05CeLhHFtz4u9QqW+2DLK5sXGu72F+lpuVxsqScpn5fKKuKiGEaQkcwCdA9aHHDDv0
	 KmyWrMC+UAVURp3ysmv/Bn5eXgycy3Jqe2p8DBklv3xLuCGcbUhveQqhNiOlXVgRYj
	 y//Xcbxc8AzVw==
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
Subject: [PATCH v2 01/13] crypto: arm64 - drop redundant dependencies on ARM64
Date: Sun, 20 Apr 2025 12:25:57 -0700
Message-ID: <20250420192609.295075-2-ebiggers@kernel.org>
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

arch/arm64/crypto/Kconfig is sourced only when CONFIG_ARM64=y, so there
is no need for the symbols defined inside it to depend on ARM64.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 7c2f63f2e3072..704d0b7e1d137 100644
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


