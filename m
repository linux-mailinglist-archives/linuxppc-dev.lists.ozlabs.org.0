Return-Path: <linuxppc-dev+bounces-7759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F6A92797
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZm4g5Xz3c3v;
	Fri, 18 Apr 2025 04:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914432;
	cv=none; b=fYV15TkwGBEfUSKrhq/kId8y+v+wHPhA4u/W+VADxob8u5kbB1tzEz7IIawiq4QxIp/5pEJEqZ3EnImf2mzacalagqy2Oyo4qRKNVK7A7dL7WtuR2VNQQz35NgHL9SzzkB1lOuA08ElF1yp6Mbqz88UbY/HEnCJY+zohwdBP62K8dm5v9g6hy5/yQhVxENgTgvOg8rIxef++1pdqLaXm+xxXTvVTSlI/8rzGXWcKQscOwLyyx/Zou3pD01LSz9/j4W/mU9GR5xVtqSC967f5shgYx0qYYkH2mLJLQqYyLL/M4rnl8LzcFQ7OhthCsCsUctP+c+kN4zRqOIFhMe+OVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914432; c=relaxed/relaxed;
	bh=jcNHp2epOabkH8yILScYNVvhgUraxaC387z1kAfFxfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtD61vWeAB/7Yqs9qYN1fUI5nVrNuYNGTrFqX++nZSNZlWag/U883uwijSuJeKmNkNlHYeZlm9J5d++JvDf0nn6sbCZwaQUy9Py7hALuGO2psFiE064HyITD79d/2C0kMQCIxpdBe7pVFPX99lcrVifngYhkcu54UOulBHoAhl25MYC6UzdJWwrh4lIwLTa6M/rxY1muc/SYO54s1HptVXha9eE8JjAnO4eApFDYS5Fk4ipB9WAqcrZcxgWWGhX01XB9YKzFAjGkhEWZTwrMeSiLUdo0mH9rAtWXOdnR4sFxMdBG8i0GO0mpIrIXyzM5mCHzCUZkwmMiKsQ50dghgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AFhVlWou; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AFhVlWou;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZm0DQlz3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C89925C5891;
	Thu, 17 Apr 2025 18:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4896C4CEEA;
	Thu, 17 Apr 2025 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914429;
	bh=HKEB5CqVerYhbkmnvqnNR7Xh56F9rN2hh/iDbljsXuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFhVlWouUAmT3oifbDC+56pvMoGbq3FY6auILxK/3y+GGXU9nFHxZj0X5SEwDgEEk
	 T+ccHR5spJaee/HwVRv1dOo83XOvLhiSwFu/ZyfvGtx9Cav2juDd7HX7GikHSe/ccP
	 hWmKDT8BcVhVOxFN4YDpxwXLQcPC7eScDGK+7l9ukCTpZCMlK2y2KGjIEHXUe0X9VR
	 jrxGnVNXY2YNjK/wyvvl8J0QkBQ+pmwDf1g5Zy9dHi61wXTC62p1hrLvCW9e1L7kid
	 OjBfoPqlDrgy0LarysHtGUVrGcRRgnaapoSgW3grxNYCCNKc7CS83yehP469AttXlm
	 O/mSVmlUaBuFQ==
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
Subject: [PATCH 04/15] crypto: loongarch - source arch/loongarch/crypto/Kconfig without CRYPTO
Date: Thu, 17 Apr 2025 11:26:12 -0700
Message-ID: <20250417182623.67808-5-ebiggers@kernel.org>
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

Source arch/loongarch/crypto/Kconfig regardless of CRYPTO, so that if
library functions are ever added to there they can be built without
pulling in the generic crypto infrastructure.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/Kconfig | 1 +
 crypto/Kconfig         | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 067c0b994648..8ad6cbd8676f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -737,6 +737,7 @@ source "kernel/power/Kconfig"
 source "drivers/acpi/Kconfig"
 source "drivers/cpufreq/Kconfig"
 
 endmenu
 
+source "arch/loongarch/crypto/Kconfig"
 source "arch/loongarch/kvm/Kconfig"
diff --git a/crypto/Kconfig b/crypto/Kconfig
index a5225c6d0488..de71e9c9f2ad 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if LOONGARCH
-source "arch/loongarch/crypto/Kconfig"
-endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
-- 
2.49.0


