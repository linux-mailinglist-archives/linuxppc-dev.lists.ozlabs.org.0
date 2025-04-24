Return-Path: <linuxppc-dev+bounces-7947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2910CA99CCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBd4TKKz305P;
	Thu, 24 Apr 2025 10:23:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454185;
	cv=none; b=je2NPUUpDVGd+/YYMsUMzEXP3mGyEHI1y4r+Yo107wzUe7Grh9+Wfo5EPWRn0Czoe7nNIvIxdz/s1qLbv9yMP8+O2Z5fEcCh/0vR4wSNvaRF9XNcScjSVLX3b1O2G5S4YmdqzPJbmVMyFijVv8Ks9pPoqmqXahm8F5oigGiI4oQnKgK0FszJBcRCILl/wNszz//J2GbEuAREJd4IiXqOUh/d2lS73VVZeIW4TczCBE2cOuvZtmkK3V0ql+vDrnomzIyZbDfnEvCkkhlJmEGiHRadG29WF/F8ma5RHAfbv8aXVzutYQi7znseG6ETC/gk6lZoRbz1UlsGZUDrIlWKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454185; c=relaxed/relaxed;
	bh=WOQ2mFTnrJdrV2RsZTbpPy4bcWl6SKGQirtlmhVtn60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4edpegdh7ITHtXkNAjcuZAIQhZlnpzxKdrW3jhzNMf/KxduzQZkvLnXG7SnpAZQxFa1KU+GWTNPYMFLXfrkbRb6/oaH1TtXtGcRM3WYF8x86hblTKOPcj9y0gt282Chl9ecNqbJ7NS6+IshVPAMWt1NjCWNmMqY4RZUfjx7hJHRUxnKgnksJDCC2acxp26ZvKAI7zwyJJJq3orxdqvDobCtDTTGIOxrwRKTgnh9PCS+6Yf/sAFM/jPvAGV9wfdstxM0Em05N+ikS4+AuO1mQMXHxfAkV6UGiyj7Ghn/VdhHlIC77DJt1iNQXTPrTDP71MSkWmUFl60WN8eDWq8QsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZFdXsDN; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZFdXsDN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBZ5K1dz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2B2368457;
	Thu, 24 Apr 2025 00:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7537C4CEEF;
	Thu, 24 Apr 2025 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454177;
	bh=ZFBOXAIbORWsFAkzzgFaWt+AYhGJY5943TVvjBEK2bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZFdXsDNHKDVjYnFQcjwii87znh/fjcZYuk8V0+Dilis2HhxXx5CUtgSKZ8IIhVJY
	 uC4QZdK4HYKw+UdierpVnbqCT9PnW2AHOK0qjhITnQQ6HbRWqKY9+lVEnfUMoW/pQI
	 VcxJj1XLtYkfjcP1TKjYXDDOwVzx27aq6ui14XTc5el7CuZ3ltvh5vxjRhtmEnlHfU
	 sozbTANfyT9UNJhMA8vB/sk61/Z8le4TuYgx3kgj4SRGHo6Mij4yQZK42dQASUypxE
	 kI9LQfRwMoLgojv4Km69eD4kAOuH7ZHsbQbibujuJFHHQZuB5UM0QikYsgdEEKK6uU
	 Af2BDEoPXC6pw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 2/7] arm64/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:33 -0700
Message-ID: <20250424002038.179114-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/Makefile                            | 4 ++--
 arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/arm64/lib/{crc32.S => crc32-core.S}           | 0
 arch/arm64/lib/{crc32-glue.c => crc32.c}           | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm64/lib/{crc32.S => crc32-core.S} (100%)
 rename arch/arm64/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 4d49dff721a84..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -12,14 +12,14 @@ CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
-crc32-arm64-y := crc32.o crc32-glue.o
+crc32-arm64-y := crc32.o crc32-core.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm64.o
-crc-t10dif-arm64-y := crc-t10dif-glue.o crc-t10dif-core.o
+crc-t10dif-arm64-y := crc-t10dif.o crc-t10dif-core.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif.c
similarity index 100%
rename from arch/arm64/lib/crc-t10dif-glue.c
rename to arch/arm64/lib/crc-t10dif.c
diff --git a/arch/arm64/lib/crc32.S b/arch/arm64/lib/crc32-core.S
similarity index 100%
rename from arch/arm64/lib/crc32.S
rename to arch/arm64/lib/crc32-core.S
diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32.c
similarity index 100%
rename from arch/arm64/lib/crc32-glue.c
rename to arch/arm64/lib/crc32.c
-- 
2.49.0


