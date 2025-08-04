Return-Path: <linuxppc-dev+bounces-10599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C3B1A74D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7p0ZVxz3brV;
	Tue,  5 Aug 2025 02:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325861;
	cv=none; b=oRSlNiAEDaCJLjzir3SIAPKev+hwobQ++DBuWGeUMCA0N/oUFNQY6jsZ+Zdg1kZjEptStl2TfTgdoJN6iW9TanBM8M6MAqAB9XcrsfzFmy0iWXAsVx3m9sdYi1LNWZXVBJQ0tgE1c/yxD+vqC+urEb8VwETBcNqVhWFjHIHMan6hczgJIT11L9RaBuzD9yRs7N63O9pHBmVR5aKnMyFX1o7GmT6yZkZguObTIdxXK9SJlyFHoaEP7xk/I6laY2ltdo+Wtejb5TIV78TLVa2Fd7lhJQU87RNQMOxOOnL++kVQSjMZDqh5IdhI8X5OPTrk4tH6Nwwl0ZDVKHfGj30sMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325861; c=relaxed/relaxed;
	bh=4DzcTI7U3A6UKOU2FYtNcPE5SCReEdDDUBLV3ejEM4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V+eqwdpBm2rymTFz+4I+W+yJNkvrNjemOeg6hTDu5wWxoNaPOrECn0Uv6vkWrUOZS00prHkN2BVXGKW/Go5PdxQX93ce5dZGJYjhGVlW6p9i0S9Nqbxm/XK2wISIvKTNnCO2jJwAX1B/ynaJRo31UXk4PRIVgCqzZjPyUw5/VxG4Dm4eckf1QlKt84KoUk5b0fBzhdKo43MPxdskJ1xx6Y4dhjwZh7L6xyuztbH9tboRpw3JdJu7/8+cMPJOLI6UVSZssCssl5rWoZiY7sP7eHW1581GcGtDoe1zWzvGNZC09Z8Jo6Xc72O6f5W8HBeY2850Fl5eec31aTICjVY8jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ctp3G9Ag; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ctp3G9Ag;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7m6cP6z3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5B615C5C4F;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA43C4AF09;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=Lvi+SOjPyvnPy8ciTq59tLtKnNheCboKdQcwuoaKmUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctp3G9AgiSCKLRp3GaS8h8tJ0qd2GiWi29AWYoW9OphEKR9uxRpx+tVuZ37fpfpsL
	 IIiqsW+BqW+QyimiyTxqwluC3gBj0itLpMcnGvSkUJW+Jtvtu0G8zJm4JEpeAv07ho
	 5p6x/9qjLA5BPlYqTiJ+ItnXGdxvcaVtNEU6C921kzwAdklU0oJOrywzY/43+qATyc
	 qkCMHpUPQU7oHixjqmmc6E/rz2akCtU5V8u3ok+s8qmQdwYEwufDL+M7FaTtHByKcC
	 AuS5qqztdOQXGV87h2P9OWbRhnDlzJPeEZsfRqWu0o2aRbkYyxMYY+FjPb1Q+fYa9A
	 LXmNT4G4CjwRQ==
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
Subject: [PATCH 14/17] s390: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:10 -0700
Message-Id: <20250804164417.1612371-14-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996; i=kees@kernel.org; h=from:subject; bh=Lvi+SOjPyvnPy8ciTq59tLtKnNheCboKdQcwuoaKmUM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkdP80i3EZa0WqNV8fMHixWbmEZHeZVc662+q3+e/ xLYYFLfUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBGxaIa/knsDtxWE2YZe7I7U 3WXadmPtRbMlWjOOFS4Pyt5xp698FyPDCXntuf8OrPNQnv7aqHOTUcK6qfbFbx5JC57KYzE7e+8 jOwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add missing __attribute_const__ annotations to S390's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=s390 defconfig with GCC s390x-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/s390/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/include/asm/bitops.h b/arch/s390/include/asm/bitops.h
index a5ca0a947691..fbcc3e1cc776 100644
--- a/arch/s390/include/asm/bitops.h
+++ b/arch/s390/include/asm/bitops.h
@@ -179,7 +179,7 @@ static inline unsigned char __flogr(unsigned long word)
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	return __flogr(-word & word) ^ (BITS_PER_LONG - 1);
 }
@@ -191,7 +191,7 @@ static inline unsigned long __ffs(unsigned long word)
  * This is defined the same way as the libc and
  * compiler builtin ffs routines (man ffs).
  */
-static inline int ffs(int word)
+static inline __attribute_const__ int ffs(int word)
 {
 	unsigned long mask = 2 * BITS_PER_LONG - 1;
 	unsigned int val = (unsigned int)word;
@@ -205,7 +205,7 @@ static inline int ffs(int word)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static inline unsigned long __fls(unsigned long word)
+static inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	return __flogr(word) ^ (BITS_PER_LONG - 1);
 }
@@ -221,7 +221,7 @@ static inline unsigned long __fls(unsigned long word)
  * set bit if value is nonzero. The last (most significant) bit is
  * at position 64.
  */
-static inline int fls64(unsigned long word)
+static inline __attribute_const__ int fls64(unsigned long word)
 {
 	unsigned long mask = 2 * BITS_PER_LONG - 1;
 
@@ -235,7 +235,7 @@ static inline int fls64(unsigned long word)
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static inline int fls(unsigned int word)
+static inline __attribute_const__ int fls(unsigned int word)
 {
 	return fls64(word);
 }
-- 
2.34.1


