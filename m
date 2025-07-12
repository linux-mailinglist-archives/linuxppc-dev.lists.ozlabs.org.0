Return-Path: <linuxppc-dev+bounces-10204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F6B02D9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8L2ZqBz3bb2;
	Sun, 13 Jul 2025 09:26:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362786;
	cv=none; b=gEK4yW2oKu0t1NNFjahpQIVKRinGHbR4KJHpcPeCTobzz7nT9LXkgrLbOd5ZobmdJwRLZb1J6MXXkx8a51otSRsDzaL73QbdmLda0CZ5M3K0Z51y7zUmOcd6MlzOZNmtN4a8Iv3ICdyAmliAuMwr7uSU2mdX3UJuRHFwIKwEodWYROtdBYLWSmPx3ZyMB1rdy1OKvenbg6qHCMiwgMwB9P3AhGSRD202p43upWOuf/ajcF8gzEMKUSTllfQUmTGEn1d/Ob3YE7gC6dWQ6iUDxFG+WIPSXpc8IJIUJUYLA6mIBRSV4rCMoXy1HzZ5Lo967g2tIy0go+apx3+gkmJPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362786; c=relaxed/relaxed;
	bh=sBXmGPyzm39EayQQByHvaKGoY+wt76BzZ26phBx0Vfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgFzxRAFraacb14rPxNDoIK4k9UtGPEWLTQ/uhcSHsFBtgNyUoHwS+BiCV59LT0JegN/75PE6YGem7GsY0n9aMYsIaZbjGG9HDPsp3Zw878zQ4Dnk9YVdGEO9L2v9JXZw4GdOqFcLW20nWrLSNLI7Evi8OS/q9U34U4hkUsARYnXC/2qAhcr6IvqIYkEmr87tZIPHcH2jHD0L1AzUAxl+9V6NJ8eKOg5ER5UKFe0XdPlNjqikQWT6GNVCv7eBhfEIXYGphMIvdyjpMz5mE7Qmh8O3W+3tFdz3USNgE0TBFDBNvZJ4yp6eQITrCzjpurtsa92tENxrEY3WxA7IG1wAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLdhoQ9O; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLdhoQ9O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8J0Rxxz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF9160007;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F89CC4CEF1;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362780;
	bh=8Vb27gWyZe63wNRoxap9QiheYDb0OlWgd9TqwRTjPok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLdhoQ9O/rEdQQwDfB++qTeJwUvBRaf0giyFlD0IE9HPCHMIxwRbbPZX6O9u0CZjm
	 1S7td9m5IXWuVpnSg/lTQZoSA8mLrhcxCEDqQskG1J2oHW5dy7RINPivna14fk/R8B
	 gWAVbX+5VllXd3iKDgmQQHr9MQexHmWBc6Z7aOQc4C9Fwh4fK6K91WkCXRGU1rSLYk
	 6jWE5tjg5pnd6IcAkotb4VGlAL+H2SxWbnMZRfBajfIAsz67vR45SAVVWMThixpDBx
	 g4AqUUXLUdKDs0Wb0sr/Mv7RDTWACPNNTvEudIe/btKC3CDRVi5U5opkfD1yPWVEvt
	 DswyfbkvbZOAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/26] crypto: x86/sha1 - Rename conflicting symbol
Date: Sat, 12 Jul 2025 16:22:52 -0700
Message-ID: <20250712232329.818226-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Rename x86's sha1_update() to sha1_update_x86(), since it conflicts with
the upcoming sha1_update() library function.

Note: the affected code will be superseded by later commits that migrate
the arch-optimized SHA-1 code into the library.  This commit simply
keeps the kernel building for the initial introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/sha1_ssse3_glue.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
index 0a912bfc86c51..826579a7473c4 100644
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ b/arch/x86/crypto/sha1_ssse3_glue.c
@@ -32,11 +32,11 @@ static const struct x86_cpu_id module_cpu_ids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, module_cpu_ids);
 
-static inline int sha1_update(struct shash_desc *desc, const u8 *data,
+static inline int sha1_update_x86(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, sha1_block_fn *sha1_xform)
 {
 	int remain;
 
 	/*
@@ -67,11 +67,11 @@ asmlinkage void sha1_transform_ssse3(struct sha1_state *state,
 				     const u8 *data, int blocks);
 
 static int sha1_ssse3_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_ssse3);
+	return sha1_update_x86(desc, data, len, sha1_transform_ssse3);
 }
 
 static int sha1_ssse3_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -111,11 +111,11 @@ asmlinkage void sha1_transform_avx(struct sha1_state *state,
 				   const u8 *data, int blocks);
 
 static int sha1_avx_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_avx);
+	return sha1_update_x86(desc, data, len, sha1_transform_avx);
 }
 
 static int sha1_avx_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -188,11 +188,11 @@ static inline void sha1_apply_transform_avx2(struct sha1_state *state,
 }
 
 static int sha1_avx2_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_apply_transform_avx2);
+	return sha1_update_x86(desc, data, len, sha1_apply_transform_avx2);
 }
 
 static int sha1_avx2_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -232,11 +232,11 @@ asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
 				  int rounds);
 
 static int sha1_ni_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_ni_transform);
+	return sha1_update_x86(desc, data, len, sha1_ni_transform);
 }
 
 static int sha1_ni_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
-- 
2.50.1


