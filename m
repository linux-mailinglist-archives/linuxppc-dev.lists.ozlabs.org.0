Return-Path: <linuxppc-dev+bounces-10612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCABB1A800
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7w0ZVcz3c7b;
	Tue,  5 Aug 2025 02:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325867;
	cv=none; b=VD4gqRLbbz/fbkjl+amGyKDzDQGUXgrgczhjU/N6ntn5B/Q/IqZ7hDnnAVfOGkMazbh0mWXorW/259zVeCtaY8PxKrTlbXgRpRuEwgonN4YPxfjcl9ICBm5+U2mYRrkXcTx0sPaMVEHSUf02hU2Tm297Jv3XwN141QYOm1GiVKwFmrHnUw9Np3d6pvsliiXHv49gH8WuYAsYDMn3A+0JKOly7GJNlGHsh6C4zZUcnLpe89r7/nv9hcg6RMSnY3kQeGfOT2imnzpLKrVamppJtVBT3VYItnRVrp7tv8Osgxu9YCtan6m40nQzxwpjV/CIGOK1rXQMOHOiZd7hwOaALA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325867; c=relaxed/relaxed;
	bh=r5tO1wFnnBdrg+ZCS0ui1kQPXER9VKsktHPMhflDEvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c+PG63zX0Dns7LkmUjMVHlnMpZqCp15tvQJiaOaUBU+At2O/9EVot01YMYK7BdB3IuP23jIyeVTDGcFtATSPUyu8AYrqrySUQzQ2cyP47t0Z2T8MA9hoarLOyGLlEihfIfpghm+4eyLB46UOaqNx//I10RiTSFQ+0AfPyt9PMfPdKbYWOqgtarzPY9MTYIhoa/W/WTu9MH44Z6tKVsrWmyamjEAoAGXqJo1cTEL98+MQjIQeNkE+p2v3Hu15dAch8nVOYOlEt48u1fkP/9Kzeqn+NLDHcOD1OvBe/60Yglpmoybi1Ntp1PZlW7QDEYIFK2I7WBOW8KLRDWKU064v8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V8su36dz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V8su36dz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7s5YY3z3c5M
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FCA145E89;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557BFC19422;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=3HtYht3o5b53HlW3hmmaVS1l68Fq+Byhwo7/QFnsV8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8su36dz8wLeATBiw+fLXUhOrWYvB0J2NFju0ulT3yX9bH3I4brsk1bfIPOwMtl4M
	 eUdlQo6ZAufcuJ508hVz4gfoq3F3K0NaNBhUI39fozig9HtwiVIhUGFAxBVlIHjavx
	 dlf5V9cU0uGCk2uQOYlzN0s30pv/X2w1LMbTVx6rbh/tujJoBv2E/x6rjwgPDf4RAL
	 WgADCxDgFlafZg+p0CJETlCNY4boSlI5JQCzG5Rc0pHbrftG9aN/2N2mn7r2AzIlix
	 US1fliCniVnKsIeSvSJNltImuRoFdZvNSuevHgga/082pXz8xl7Spx/2XIW3pDNRLi
	 Tj/NQpbrTOeCw==
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
Subject: [PATCH 12/17] mips: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:08 -0700
Message-Id: <20250804164417.1612371-12-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=kees@kernel.org; h=from:subject; bh=3HtYht3o5b53HlW3hmmaVS1l68Fq+Byhwo7/QFnsV8I=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkd9Czh7JOPuiXLZd7+tXh0+UvAmMXjmUpsPrqFNd emffkyY2FHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjCR0IeMDKtMbV93TbymIV3y RUjmeV9k6+Ycm98bV/GzP/x1wf6SQwEjw9LvUaanzu14nd9/YYIdr+mme3uzdviENGY4hmxRS95 ymhcA
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

Add missing __attribute_const__ annotations to MIPS's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=mips defconfig with GCC mipsel-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/mips/include/asm/bitops.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 89f73d1a4ea4..42f88452c920 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -327,7 +327,7 @@ static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *
  * Return the bit position (0..63) of the most significant 1 bit in a word
  * Returns -1 if no 1 bit exists
  */
-static __always_inline unsigned long __fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	int num;
 
@@ -393,7 +393,7 @@ static __always_inline unsigned long __fls(unsigned long word)
  * Returns 0..SZLONG-1
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned long __ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	return __fls(word & -word);
 }
@@ -405,7 +405,7 @@ static __always_inline unsigned long __ffs(unsigned long word)
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	int r;
 
@@ -458,7 +458,7 @@ static inline int fls(unsigned int x)
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from the below ffz (man ffs).
  */
-static inline int ffs(int word)
+static inline __attribute_const__ int ffs(int word)
 {
 	if (!word)
 		return 0;
-- 
2.34.1


