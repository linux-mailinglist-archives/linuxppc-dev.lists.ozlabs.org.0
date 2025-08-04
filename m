Return-Path: <linuxppc-dev+bounces-10605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96781B1A799
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7r3mSXz3bnc;
	Tue,  5 Aug 2025 02:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325864;
	cv=none; b=do7PIZCGa7JD/uBNVPf6fcWlpSP27YUVUfaWLaSzk2Dm5jaNjYXcP9HlHKcFSThu7+a9fMSCSc/rRtkTjzqjz3c7PjyD60eAhsSJivyb+gLCWxr7UlU6540u7RqE2TxGc9BZKy0rHi/JFBCt8ZNRa8yW8m7GoDUbU+hbJMwMXdDlUlhXiNl/9m/U/T/ledcFJZdZBTl5+vy1lCcSEFnP7JGPcwLXuHrcWvXmzNYHCAhOOhtw6THJx3TF/FcXEjhGDSTxNmN2GPSC4ai4DVaa85vffqAH78zh8YbIU7LLqpII8NCEMc1AhT4UkGt2mTKFSPYvemq8iSxrvD0qZ7pLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325864; c=relaxed/relaxed;
	bh=jTx/7l3fNcYFF30YY7x8bm978LMbrKlRG8ff4Jh4rkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ncg1fmR/AUNwBJ3cgvYuwmcy5zHVw59KwzSTqqxMDiYJWV8J68DWnTB0w1oQ6/w5qt7CM3O3pCAbqAd44XL7b0xbyXT2dclcqhiyjOC69EzyBkfN3dvgni4CfyauU5NffwSLf6/P5ef2j5f04WAIDrUscQOB7EuV6AjgDLRgPiv7rgGCiYk5D9FwChk1sXpaE7ThhjVXGbTCxV58SU3ouRZM6VtxEeqgjd1p+jIDdiwg6meO28yrxuta15qMh5VuPLi9dIeVnFcgfLDX8ZR7fA9MooKY6G8znVkxuiGe+WuDnMVmBFQbJ6zcSd8Z5NDq4MJ/F3uRSZiBtC1iPLXqtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DFYJDn3i; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DFYJDn3i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n0FwXz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6774745E60;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AB4C113CF;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=752sQmjr+WkEQIQTz2YsThA0XswYRbPSJznITLPZ8n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFYJDn3iT6d1HFBeZ+4JC6ama4tupJDc2NxZKYp8ACnJ1iL3GmdJ4nU9J6Gxpz6zV
	 ggkLZE5g33xSNghuW+/4AldAgkpmoHzVtp05Mm0Tk77p9FwqmOTo5KhNYbg7IGPo42
	 Zaxz1NYG/MDOHO+D0u6LkCfsfIaxlPUFpaI3es/IGEblVRHWsEmsmx5qlouLXGxOO/
	 jZURCEO+cG1tK5otFXKDXMarJRlXurVor/Uk6n4hK/Tfhs4SPDSIBIKjGx1Re9Gru2
	 RayDn4/9xO/y4REx1nhEGhNAedTHIr/vlsv5X97wp/q8FQQMD03LxVviKNDFWQcU2I
	 jhO6Ld2SN/XqA==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 07/17] alpha: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:03 -0700
Message-Id: <20250804164417.1612371-7-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=kees@kernel.org; h=from:subject; bh=752sQmjr+WkEQIQTz2YsThA0XswYRbPSJznITLPZ8n0=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkeW55xweCLlqOjVdbHHOVIuePb3nVd3fpROS5YTs nc5WMrUUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJEFFxkZZtwvav769fajq9di vywovGGe9+SBsdj3hDVaNi73rnRVSzAy/N3mv2O7ocl6bb0KjjvftqjJnWeQndM4JzZ/d2XXEZZ 33AA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add missing __attribute_const__ annotations to Alpha's implementations
of __ffs(), ffs(), fls64(), __fls(), fls(), and ffz() functions. These
are pure mathematical functions that always return the same result for
the same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=alpha defconfig with GCC alpha-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/alpha/include/asm/bitops.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index 3e33621922c3..76e4343c090f 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -328,7 +328,7 @@ static inline unsigned long ffz_b(unsigned long x)
 	return sum;
 }
 
-static inline unsigned long ffz(unsigned long word)
+static inline unsigned long __attribute_const__ ffz(unsigned long word)
 {
 #if defined(CONFIG_ALPHA_EV6) && defined(CONFIG_ALPHA_EV67)
 	/* Whee.  EV67 can calculate it directly.  */
@@ -348,7 +348,7 @@ static inline unsigned long ffz(unsigned long word)
 /*
  * __ffs = Find First set bit in word.  Undefined if no set bit exists.
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 #if defined(CONFIG_ALPHA_EV6) && defined(CONFIG_ALPHA_EV67)
 	/* Whee.  EV67 can calculate it directly.  */
@@ -373,7 +373,7 @@ static inline unsigned long __ffs(unsigned long word)
  * differs in spirit from the above __ffs.
  */
 
-static inline int ffs(int word)
+static inline __attribute_const__ int ffs(int word)
 {
 	int result = __ffs(word) + 1;
 	return word ? result : 0;
@@ -383,14 +383,14 @@ static inline int ffs(int word)
  * fls: find last bit set.
  */
 #if defined(CONFIG_ALPHA_EV6) && defined(CONFIG_ALPHA_EV67)
-static inline int fls64(unsigned long word)
+static inline __attribute_const__ int fls64(unsigned long word)
 {
 	return 64 - __kernel_ctlz(word);
 }
 #else
 extern const unsigned char __flsm1_tab[256];
 
-static inline int fls64(unsigned long x)
+static inline __attribute_const__ int fls64(unsigned long x)
 {
 	unsigned long t, a, r;
 
@@ -403,12 +403,12 @@ static inline int fls64(unsigned long x)
 }
 #endif
 
-static inline unsigned long __fls(unsigned long x)
+static inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	return fls64(x) - 1;
 }
 
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	return fls64(x);
 }
-- 
2.34.1


