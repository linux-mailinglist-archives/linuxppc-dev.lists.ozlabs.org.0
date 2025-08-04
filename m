Return-Path: <linuxppc-dev+bounces-10601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B845AB1A772
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7q3F2pz3bmC;
	Tue,  5 Aug 2025 02:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325863;
	cv=none; b=I2/qaKjqysDIi75a728fa/1GNG96Sne9lZ2jhvks+1kHILraWZlqbDgHcY1TCBM5hMG5NE+LETnVNaa1Zwp2w9Y26BVOgMwdT4G7cbbO29h1Y+bH0Tp8x8C5CQNVnPf34o0R8eaS/Letz+X5Wm3P7HEO6exQCkj8HDhDaPqBigaVaLKgNOwnJK4NtfkkNG/BECnRzKlnfuKk6q6HQLgpr6576gnXsYUArBqRb1QxUqMjisMoxsHtwYBnMbkeeJXXYXaNxTkSxsJHtCN717mNU7Cd9Q9cvqYLG1HFnc98aIEZJXPEbLbeIquTpGztAtdRGVwIGV0qfefpBGsWxIBRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325863; c=relaxed/relaxed;
	bh=aecGV9vGcDEwi4B/VTPJfGWOVYg/UwXxu1rNEJJYeTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gwIjyglUh1UxpIowvy7r6HVsKwJ2BN6gAPlAYpmMika/fVr6eXM5K+0qZGr2L+HeeMjFkvsDd1VF3XmBox54MAyFlOfc3QbMSIIA1R8+9VlMEo+lw7pCXMgWat0ZY0zkefh7C37PuciazTe+vyZ+lp5ADz472g/4xFR75myMFTXP4LfWs3pI/2iK0mJ6sqzoxnK0JB2TSI+ZzNl56QzysL1rgKs3Mx9EficgaURSjrJmKYw86NlR1sPV5je8ko6tiZ0tXP9gdDDV+pgMMgoHVoBfUamoBijxkTdna7xAQn5fQTB+A0tN7xmrJuC98+e+AAVVlYE/SdAVFHvf+bukRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWE8VRfr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWE8VRfr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7m6j4Bz3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F99D6111C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6F4C16AAE;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=nxTQvOzC/JSvvXmGiwbBm389+tS3ydnEWu5ZjeE7uO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWE8VRfr3OxYP3UO+d3IFdSlRFDUjVi2yt4abZfHzx8WHNZlmjZv+iW6tbZ1hMSed
	 GMUdeyWXa93Rj3Q0kqxys9JnrtcHbS7zYtwpkZQRdwxgfGOKtH22uDHP/aPOYqk0zt
	 gx8OrUhDzIOeYz/3ozZ66IT6SxVrbTOHmxAgWe1j9r7DVA49oSHPmCapszzzdVlvT5
	 0rVKK5k/1PP3orjyxoddlYJAHhNu+cSVguk1WJNaR/vlpIK6zkQ5yksGOZcLTjvx5d
	 +wES39FcF9VH0Zhaow4jkVDyWjetCNzprRgTQ6VOL3WnhLNsY4nqYgtVeNxI1xrh5K
	 6EfQRLAP2s92A==
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
Subject: [PATCH 08/17] hexagon: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:04 -0700
Message-Id: <20250804164417.1612371-8-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819; i=kees@kernel.org; h=from:subject; bh=nxTQvOzC/JSvvXmGiwbBm389+tS3ydnEWu5ZjeE7uO8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkdOvim1XYmPabvy37zFTXdO+twPi7p8b1vSfFm/q OnG5olrO0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZiJ8/wv6jRWDiHOXGy6K77 d0Jm7Hwj/e9RpO9Ez+OX9qfOXmB1yp7hr+z2vC+XouyPGE0/r/25u2hG61q+7x8rzLzfsxpPfBd xmwEA
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

Add missing __attribute_const__ annotations to Hexagon's implementations
of fls(), ffs(), __ffs(), __fls(), and ffz() functions. These are
pure mathematical functions that always return the same result for
the same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=hexagon defconfig with Clang 21.0.0git (LLVM=1).

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/hexagon/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/include/asm/bitops.h b/arch/hexagon/include/asm/bitops.h
index 160d8f37fa1a..b23cb13833af 100644
--- a/arch/hexagon/include/asm/bitops.h
+++ b/arch/hexagon/include/asm/bitops.h
@@ -200,7 +200,7 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
  *
  * Undefined if no zero exists, so code should check against ~0UL first.
  */
-static inline long ffz(int x)
+static inline long __attribute_const__ ffz(int x)
 {
 	int r;
 
@@ -217,7 +217,7 @@ static inline long ffz(int x)
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	int r;
 
@@ -238,7 +238,7 @@ static inline int fls(unsigned int x)
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from the above ffz (man ffs).
  */
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	int r;
 
@@ -260,7 +260,7 @@ static inline int ffs(int x)
  * bits_per_long assumed to be 32
  * numbering starts at 0 I think (instead of 1 like ffs)
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	int num;
 
@@ -278,7 +278,7 @@ static inline unsigned long __ffs(unsigned long word)
  * Undefined if no set bit exists, so code should check against 0 first.
  * bits_per_long assumed to be 32
  */
-static inline unsigned long __fls(unsigned long word)
+static inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	int num;
 
-- 
2.34.1


