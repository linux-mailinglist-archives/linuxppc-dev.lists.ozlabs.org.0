Return-Path: <linuxppc-dev+bounces-10603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16AB1A789
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:44:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7r2kddz3c05;
	Tue,  5 Aug 2025 02:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325864;
	cv=none; b=Lt6ehKCm5GVUlNmtdN0ialOuw7k1mGAV15hNWlPLdnh8AzhOVPdwXRr9fVWnib4ZldFVWokJqH/eUPoEhOm2GshbIPUf9p9V73rNdbYXkc4EUTYuy7HMAigjwwR8CXh323eySAkIJYBlOwyAuybSIkomEqjcAvzbB6nW0N9m05JYAUa9hk7MegpNY0RNQYtzqpMkkuFqAHjJ80RZjHkm6VyxuptMosGzHb8sSvVYl3tVrd9ylwhQaoWLDPu+MJs7C9icSQnzqPSRkhMCfJ6nE7zp0CQNfcLroqp7g2UrePQeF0+H7rBc2EA0LETaiQflCUs0jMZAOZuUl5sYRUQDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325864; c=relaxed/relaxed;
	bh=x16roF4dRKgBemcnwQGoCZUUDlqpTSykFJ5j6CJcv6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hdchdx7sUw4H6gkAETpFid4l2GC9h1bCQJUQbEDVbFsQl7eaDlVGbS7yabhp757qzLICXCK3pWtPiyy+VOcXouJXEnN7JyZbRc/7Rn5FNs7a9/phS89bDtPW11zgGGeV5m79cR4gkfcMh+Hlq/949MW7zrFllpFTEw6vFRYPcLPFusa/rrKJmAywQUTT8Cc5S4pCGyCxqfu5bwEq8Xyf0CiyxR/diOW0TKx2pDEEGsozSjaYPsZQhHJOXRcTWSf9rsDwvmJBJ/sZSrDnwQSlObC5XJywSlU19gQbQ4G8RM3CMqO/f3PGAueZMdeGYuaxKF1yPx6Eum9XRLI+GiIXRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KkGJbQNv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KkGJbQNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7m6sMQz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADD4861135;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51806C4CEF6;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=9IKARCNAQ4YGYQ7SSuIzeAqk93nxRP2HUWwtsuviko8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkGJbQNvVuFgTNWRpqKUhWNVLN6UmFEjJz8RkC64Hx/hCKoEdADxAMt9NxqAzpnUi
	 8t5Zz4Q9j49fJ5VOfghaKYwVbLvdfiXYWH4ixk7Rm1FwlQ7dhOuEKDCHwl5MuTZSqJ
	 z7G1DMLhD1Qs/8+RIjmgRrDdS2xUYLzvRauKo9huR/eh9m/r8JJ/iqLQytoZpRK9dN
	 k3yMzLg211OPOsbt2kbnW+ZoGC9BJQNQ9XlEfg/XoQuuOmHiScT1RpqJWdR2Ar+NBQ
	 AbTC3JkAe5B901HkVoP3G2lFY7RSFn81iVArXPv55mDzcrJ5y2K1o1m8Pnw6wrmGJr
	 74IU4NrAevjxQ==
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
Subject: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:07 -0700
Message-Id: <20250804164417.1612371-11-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3218; i=kees@kernel.org; h=from:subject; bh=9IKARCNAQ4YGYQ7SSuIzeAqk93nxRP2HUWwtsuviko8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkcZTyv6Wnb80X1b3/rkW+dXCf9+ZaQptMfMsM6vz ndp1+q6jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInYbWRkeP5KhYM7b9Xyqrr3 z85yOl8+Z7iH46OtRd3CiL7lLBmXexj+aZ73f5a+LuKbjLj3Kt/zDy9erdv/eeHmDLkmidArC13 kGQE=
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

Add missing __attribute_const__ annotations to M68K's implementations
of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
pure mathematical functions that always return the same result for
the same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/m68k/include/asm/bitops.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 14c64a6f1217..139ec9289ff2 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -465,7 +465,7 @@ static inline int find_next_bit(const unsigned long *vaddr, int size,
  * ffz = Find First Zero in word. Undefined if no zero exists,
  * so code should check against ~0UL first..
  */
-static inline unsigned long ffz(unsigned long word)
+static inline unsigned long __attribute_const__ ffz(unsigned long word)
 {
 	int res;
 
@@ -488,7 +488,7 @@ static inline unsigned long ffz(unsigned long word)
  */
 #if (defined(__mcfisaaplus__) || defined(__mcfisac__)) && \
 	!defined(CONFIG_M68000)
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	__asm__ __volatile__ ("bitrev %0; ff1 %0"
 		: "=d" (x)
@@ -496,7 +496,7 @@ static inline unsigned long __ffs(unsigned long x)
 	return x;
 }
 
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	if (!x)
 		return 0;
@@ -518,7 +518,7 @@ static inline int ffs(int x)
  *	the libc and compiler builtin ffs routines, therefore
  *	differs in spirit from the above ffz (man ffs).
  */
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	int cnt;
 
@@ -528,7 +528,7 @@ static inline int ffs(int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	return ffs(x) - 1;
 }
@@ -536,7 +536,7 @@ static inline unsigned long __ffs(unsigned long x)
 /*
  *	fls: find last bit set.
  */
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	int cnt;
 
@@ -546,7 +546,7 @@ static inline int fls(unsigned int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __fls(unsigned long x)
+static inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	return fls(x) - 1;
 }
-- 
2.34.1


