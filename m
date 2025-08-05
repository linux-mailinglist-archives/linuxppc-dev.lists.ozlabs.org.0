Return-Path: <linuxppc-dev+bounces-10676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF26B1BC92
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 00:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxSmN3hMFz30W1;
	Wed,  6 Aug 2025 08:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754433012;
	cv=none; b=JmmiVvO31PaID9OEunt4//bDvepbMs9JaZdC3VmLr9Cz3z2pExRfAqAmw42/4jIUgA13lqsPQh8GOECgK4tkEBFVtiTh0JGXsyUpseYO7+CkCVLsp6BOwgK5VTOZOF2edagtWxEqwJn2/7IthmmR5jeg8jAmyjbQp/nvZ3evrAsCMbbJLNF+hOy8o5H/3MRxSyfBcR+T6SOEQXYe7BapbFy+tafO/rG3s+s1Xd14MjwRVYggYOarKhpq7YPcsAnEnaXP0Kj87TkdMhypby4krrgCzyjgZbOMvIczMmA/xvxJXAoXf4qIc4mBLPKx55dpwp74yN+FPiQC9dQv15yNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754433012; c=relaxed/relaxed;
	bh=KR8tJYulY2d08m4FZpEvsSmEV84go/5qVLMyGP7Jh+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9FvJw77iuJLvjmMjNs2OamD46R3VPeIjQqQkERDIFIdt280u73y0Hhjjce/J/Os3WW3Rugw4imo45XZT8CI4fyEA4/+fYCFHvmD6DGRV5yNGqG47HVTIIkWtWnkMYo1cu9EolcBQZ2fFmCUmMXLz/5IBdJCXvfqUuHyuEwzoA6VqdmyPC1bm/wL8RR4XKoZViAD9YdNV6PwdZ0V2S7lszINXwWE6aF1L+A3H2ZoVb0lp3f4shY1/2hvgMK7A12GcBWpi2G68h/zIxuhJEvUBlh7QlZxVtz/w8h3FKqEJFvEBdX9xbvejsqhasCeL0Na65xvhrS6Z8TKDHDfSB/7DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/HPibEG; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/HPibEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxSmL6PCtz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 08:30:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B090F43577;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1517BC4CEFA;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433008;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/HPibEGVSJ55Kdivcxfl4OtFhQRmH//SQRo23gj/tJjHsIsd0mSraovQNVi/WBKA
	 cY3UZo2uOlhxH8Wyu4EMvmZeA3Wrs/Y05176OMN0ofcWIXSsDAq6vwnjaXPLJLIvt+
	 ewDrV1sjW00zJcNzAT81G6fHrNvoPsTF4EGf2NyJ6HkOUIcv0vvOEVe9wR6yM/Zl0k
	 ZurMIu/XzEApEyKYVjQLRl6Ttg59UYm43evi3Qy5YX+fpbkFu2XmJYf6IqLWcm6+bY
	 Mp7Od81jWSCz7WBPI/STFw11P18reMYBoAJn8ntZCGM1TW633Y2im6rxoGUcKpDISA
	 tCE7HqgIx6VYw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 3/7] mips: cavium-octeon: Move octeon-crypto.c into parent dir
Date: Tue,  5 Aug 2025 15:28:51 -0700
Message-ID: <20250805222855.10362-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>
References: <20250805222855.10362-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since octeon-crypto.c is the only remaining source file in
arch/mips/cavium-octeon/crypto/, move it into its parent directory
arch/mips/cavium-octeon/.  Then remove the directory
arch/mips/cavium-octeon/crypto/, including its Makefile.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/Makefile                     | 2 +-
 arch/mips/cavium-octeon/crypto/Makefile              | 6 ------
 arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c | 0
 3 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)

diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index 2a59265788413..ab84ede0cbe0e 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -9,12 +9,12 @@
 # Copyright (C) 2005-2009 Cavium Networks
 #
 
 obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
 obj-y += dma-octeon.o
+obj-y += octeon-crypto.o
 obj-y += octeon-memcpy.o
 obj-y += executive/
-obj-y += crypto/
 
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
deleted file mode 100644
index b7d03e8a03187..0000000000000
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# OCTEON-specific crypto modules.
-#
-
-obj-y += octeon-crypto.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.c b/arch/mips/cavium-octeon/octeon-crypto.c
similarity index 100%
rename from arch/mips/cavium-octeon/crypto/octeon-crypto.c
rename to arch/mips/cavium-octeon/octeon-crypto.c
-- 
2.50.1


