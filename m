Return-Path: <linuxppc-dev+bounces-10608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C1B1A7E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7t2Xtjz3c6P;
	Tue,  5 Aug 2025 02:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325866;
	cv=none; b=TtIfNYEW5SjTNfOBVRPbGFvSXMQ3gwnnBowh9oFBOgIGyW6rC8ob1QnsRX385IdVo6A6kP+Ol96+YZ/RaynJ1zNEdp4poCi3hi4+yBblJz/Vo3f5ct0yje4qGeuHpohXtnYMPVNp2b7pXawWt7xhbQGj/+aTlHtQhlRYy+OswoFjNvouDzHJOHieAc7lNS6A19ZG4ovwqRX2KWDWyYuiJwR//HdYFbGPmiL4K8kv5y54BKrIv8X8DiI7MsjWuiQsOhH5EzxQayy5oIZ8Ye6NEZ3/9v1+irdzyZFHsDS+OFvaHL+YYDMdn6nyRU1/ZNrDqUycCXgClQSmCBMb7C38xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325866; c=relaxed/relaxed;
	bh=Kpq1/OD8bs4if6qpXIYU8IHl5rcbcQYkkWyupNdd6mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CU187+GfGg/z8Jd2Kk6r/euhDYnULZZJ1vgb5lriGNz5ye0267yvqvUJf9O8C2WjCHzMcpfO7xy7i+gLx3EYF8A0J+1a6O3V1Fxk//GTNqEgKi3j1+FGaG4pG6VuJhrz1al/U9d+ngKt0CCjV/IKoKqaV0CslXRDcHZIaRvexTm/QpKX9h1l2Y1zwg7l+z1Qcq/+x8O5EW8mxTzCAvDbcv+zTBI2yBOnRnT6HAqAXUxHHja2St+EsjZC8b2PdFJpu3zHdepjeFpGyrc/Uu2xXcltVUYncxA6ogHnmrfjYRQJk+Z7bKHJhrRVOWHRNZiNsK1kCHLhpRDPKgtcrWvdiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZNX2f+uk; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZNX2f+uk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n2NcFz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F16845DAE;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E879C4CEFF;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=adGs1kuuk4zPQI9OS9eVOvJux65kSL76tPiJyL+ncj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNX2f+ukbjZ1j6eu9fz/+prTtT0vGsnjndcPXpFpG7P0Ia1Ril8Zf05ioP7FLpyo+
	 Mm2+aQHENVj0SHKpUPkPNDfgX5KBmrxkUcMnELWwkSRO5YI2iFCS8V36kFAf3sXzwz
	 zIvsdeC0pDzY9IKgCqH+xjQqPw2s+/XGMq9xJey9eoC5Sun/SfxY85adcWU/9qVD5I
	 Eh9+V8XR+/ZCwx0FSYMbTtEWnpevQ2WhcEQ/mvJoIbxn3Y2oVc+jESY8sptZ+6Y1E7
	 hXKnvnLGQgbuK3ouTYEW2vnpMJujCrVf4XcvM08Nb1q67D1mup4HnPed6XG6GGawWY
	 izdWDqT9JS+RA==
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
Subject: [PATCH 04/17] x86: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:00 -0700
Message-Id: <20250804164417.1612371-4-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=kees@kernel.org; h=from:subject; bh=adGs1kuuk4zPQI9OS9eVOvJux65kSL76tPiJyL+ncj8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkdcn9HKVsXGsIr7AKdfgqSU+aeIrz0tzpYr9wkum fXBvsyko5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgF4CbnMTJ099c09f3590OhLee3 kxnL/7s7bxwLjPFLUap6/mJdAGsII8MONcmt6pUnOeTOCVhKzbgjGJmr7T41n6lg2nSB8PZMR24 A
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

Add missing __attribute_const__ annotations to x86's implementations of
variable__ffs(), variable_ffz(), __fls(), variable_ffs(), and fls() functions.
These are pure mathematical functions that always return the same result for the same
input with no side effects, making them eligible for compiler optimization.

Build tested ARCH=x86_64 defconfig with GCC gcc 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/x86/include/asm/bitops.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index eebbc8889e70..a835f891164d 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -246,7 +246,7 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
 					  variable_test_bit(nr, addr);
 }
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
 	asm("tzcnt %1,%0"
 		: "=r" (word)
@@ -265,7 +265,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 	 (unsigned long)__builtin_ctzl(word) :	\
 	 variable__ffs(word))
 
-static __always_inline unsigned long variable_ffz(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable_ffz(unsigned long word)
 {
 	return variable__ffs(~word);
 }
@@ -287,7 +287,7 @@ static __always_inline unsigned long variable_ffz(unsigned long word)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned long __fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	if (__builtin_constant_p(word))
 		return BITS_PER_LONG - 1 - __builtin_clzl(word);
@@ -301,7 +301,7 @@ static __always_inline unsigned long __fls(unsigned long word)
 #undef ADDR
 
 #ifdef __KERNEL__
-static __always_inline int variable_ffs(int x)
+static __always_inline __attribute_const__ int variable_ffs(int x)
 {
 	int r;
 
@@ -355,7 +355,7 @@ static __always_inline int variable_ffs(int x)
  * set bit if value is nonzero. The last (most significant) bit is
  * at position 32.
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	int r;
 
@@ -400,7 +400,7 @@ static __always_inline int fls(unsigned int x)
  * at position 64.
  */
 #ifdef CONFIG_X86_64
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	int bitpos = -1;
 
-- 
2.34.1


