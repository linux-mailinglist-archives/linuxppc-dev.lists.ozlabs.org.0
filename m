Return-Path: <linuxppc-dev+bounces-15578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE19D14F8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3Y5lQdz3brZ;
	Tue, 13 Jan 2026 06:23:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245833;
	cv=none; b=dOsz6IDMZIptSpqbm5TmQ2FDjX47fzTg6VY0bh+ePtY2+ASojK8SJXD7C4YXXUVGlpQxIr1MgQc1M+b3AhzjEZyueDi3R8DQEdF7IoBGm3hHMSoRFWYgc4atZQyydoWgzHVmNCD5TuLZqEZLvLo8Hpe7acHOu5UhUXBC0NiqmKMP5ivqgVwmu+Bg2/3AgKP2PTVRJdwldosr1IR7o/0XV3FQwRA2GDJDAjxZy+oKi6feo78HAKioZYaKPI0YuKYZWQBctEMHKjWoctFyLviU16p2CjCeG8408C/CdV8c71ZatkgKQle0iHAgp4I6Y3Hg1+2tBDUfuWU89oVioC5VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245833; c=relaxed/relaxed;
	bh=EEqHZxi1KrNgfQiPVBTuNTbDu78RJozQ4vGwzEKaEy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYtByk5MJmzsDZOdWmJD3eAkKA4P5v80R1woZUYvXB5mQvBdmphkgiK0//phjYr/srNzSLQ9ISIQVPwOPnivy7HjgNTv+zA8R9IsHNO5/wx4YPsICIJuYonnuZP7hZoeap99UcxaijxAebHh5bVrOauGZEFRHBvMaPfNOZY1PPCZ9uubyLcAyyLwUYRYRlIxRL9PUIG0oPvI6VqF9VbZVc0OF3HFlll6s9fPF05XRC06hfaKqNZaDUtzg339wktgtc6+WLSu9O9OIO+2NUBTvAgawUibdOLnSR3mXgmUh3ZZ8Acx2JR3oFyj++p0YhnYCxEXvfMzPQ46oYKz+UxsLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iMQOCeye; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iMQOCeye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3Y29f5z3bps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1BC944357;
	Mon, 12 Jan 2026 19:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32846C16AAE;
	Mon, 12 Jan 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245801;
	bh=jJvi3oRvsSqQATN4nKRbSiVsFU5R9KYuCOE+SKfl3jE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMQOCeyeqHFoWDrkaKFAaWbq6Fb/zXU54onwz2J8yL/esdgXjUEMqJXLLsFJRF04R
	 VFto64arPPmT75ndJyPrLDNUFnejCIySLkR3CEwWS7fb8kcQ9ykcVaCABqer3PeKwF
	 4J1/KYbKvThzi7RJ7LanIPEii0m2gP/GiJ4AWHCJ2bf7VgybaQwSL781G5hr7ZqqRe
	 Nwd5GfZCh27dQLc+pIXSbtsz8WoApF+jj7aJS7fncV9YXV4pdY/Hozs3zVy7lhnL98
	 p4L5Z9iYRnMc9t2l9XJjP7yuF5IU/Rx4wEAisPCEEKxTzwNFJSP2wVr4CBbCQqde8O
	 yXWWj8rqnU/TQ==
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
Subject: [PATCH v2 07/35] crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
Date: Mon, 12 Jan 2026 11:20:05 -0800
Message-ID: <20260112192035.10427-8-ebiggers@kernel.org>
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

Instead of crypto_ft_tab[0] from aes_generic.c, use aes_enc_tab from
lib/crypto/aes.c.  These contain the same data, so the result is the
same.  This will allow aes_generic.c to eventually be removed.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
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


