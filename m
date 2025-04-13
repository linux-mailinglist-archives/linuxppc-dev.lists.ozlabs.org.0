Return-Path: <linuxppc-dev+bounces-7640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA6A870C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymS1h8dz30LS;
	Sun, 13 Apr 2025 14:55:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520152;
	cv=none; b=aJLqLlKORQKE131+hy+ebGhAn9uCIlBKIu8QBbgB/KWWFtaHI67yC331W1fQHZ0y4vSYLmMWNVADCgAE+vXeEECUuxuYbIo5Qj3sZ9Od3qQskcbrZZruLaJcSe5m4kV+1Rgdlg7IWKsKY3rlXCbODJeOcYRgaoBxvNdyyRxWjNBnIqak9T+8IS01SSoY88pgY+zLQhHRySVo9kQ/9O+rECwiETDBw9EFpyUBFszdxnopCtDCYWyqZoaUTAJ5MYIjtZu5JKusPllsUWi4ynLwgCVavjIJFFDbZsjQ5AURK1pFaLAe9W+VYlmDNHD3ribMB+w6H7DPwg3zYisDizg2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520152; c=relaxed/relaxed;
	bh=7dxNG1C6BKTk+JwpAc0vXAIATHvUqCHfYjRvMQl1234=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFKVmIzOVRP7DNwnL9ghySAHyEVUPOI3t5A022vMglezuMnS5KR+naZeZtF5fh4OcDNwbmdoPM5BAHyBzDUHI5s7Nz7Tv0U+yjwF8B8X1p0tQI31OONLHDQuXcPhORoP+wZRko0EyEtK87VktJp8v0y0hMuodJR7jm+crcVjW408/8QRQ/EyNf2ethQXHtoYJPs98tNxUwL4ccW4ik7fGAIg/NN7VsvmeBprxD5cKDZVqfCtXA86QwxXMzVHH/X9l5cLXzDQnIetF0ZgfHmP/5exbM0kN0Rj8kqWHFD2beYsJ4L7WxA4kyoko6ZSjNnQDxujPHOTHEAmt1QNM50CrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPbt2eYH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPbt2eYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymR1M5Bz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 802F84A377;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED062C4CEE5;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520144;
	bh=Pjh4oxagSvmSLpMze4F+AJtO3zI0zTnD0Z/7n/bgK3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPbt2eYHx4ya3q///NGVA+AfQZlakY1oxpGQeb7fGWngp5KXaZC77Br8qfTNiMxOF
	 a0yRZBbFGdP0Ge1p6UvtaE6HpdagU5RcBH8PHsYZznsnc2E+5GSoTGtWjUf5BOZ38d
	 xl2D4cTxo/C6gD3zEbMcY7RGKWgmJvMhxQeyfrpqf8TkMCykFbw0CDhQ/NqWpVSvKr
	 whrKmS6Y3bYwNpgL8SBOl/zDxkVdM8YcH0r540WTf3WAXoTLcnZtbXa6mDy47x6n5t
	 TXob2tBZQ8oVEVJrwPDVxV28rDMGu4vb5MvlT5HCoNUlqboVAlJNnupjCvQN8jVi1+
	 TFmIPLUmM5/Hg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 8/9] crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
Date: Sat, 12 Apr 2025 21:54:20 -0700
Message-ID: <20250413045421.55100-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

The x86 Poly1305 code never falls back to the generic code, so selecting
CRYPTO_LIB_POLY1305_GENERIC is unnecessary.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 31804dacf9a4..a25765186ba3 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -397,11 +397,10 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_POLY1305_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
-- 
2.49.0


