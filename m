Return-Path: <linuxppc-dev+bounces-10604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6CB1A78B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7r31Mvz3bnJ;
	Tue,  5 Aug 2025 02:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325864;
	cv=none; b=Nw79pIxu05sAJH2xTSE4WW2JUzsteOaASHGHKC8FryweWjATxgHaTsKDtrxHICNIAkltOqG+aBY6qKlHe5XvPc2spLx0ZmhnPsCVKpOVLzV3DoP9KO/44IlTgbWqqf2Su6tpGiRepr0W8EkNJKjvpp07GU9HIh+japHLEJsG4SsmTFsuzuO+bx9tqvvafK9sWsYrQ3gJNgvX+Gezx4uc1uEgejdKePiDPCxprXCSrrDIMjJhuojucIGl2V3fXmSdphanUQ+oWdEwOiFPQN+OkpgkY2v/NBk7vo5rbJoMLNPPYRy+crrpJ2pnEjIPNxhB1J772chJsaXTZSaEvv6bkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325864; c=relaxed/relaxed;
	bh=6GdDdN7VT4VJP1wlZ/5+7jyDkKIUomWpO71sfM1Pvj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lI6VGKGJ3ZydqAayWxBZ/1eLpvANkVz2Gu74RdBxdEBvbGjInBWCm26XuPX1oEmwfhwoIc61urg5xptuF2TowVPohD+T3hFX+P906TI48b4hKDLYy+Z9wsi7VOe8eMtz9ZUHT6MCdUi2an3Vp70NTELTxqnvkC9j9jtiVAVwPU69dxplw5HJ0lwJx+MLVAe9nKTPT2SpCJG+IyM9q0+a+Mf12YtqkUQMQCvW+fsdzK3FiJ6MIDFmPhrRqYB9kOQlzPAcoEh9T6NxobLB9/eJ7K6jTky5PyklhPxaplMTb22kqk6189DgH9xZt/K7RCxYnqFY7o5eLh+7lngaflrYOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bgcltgsy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bgcltgsy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n0LCQz3bpL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD5A761139;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8802DC4CEFE;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=bi83DBSxTax3RYBhak54pajUvhtkEYIGQUxIvC9PE+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bgcltgsyxoyf/pKF+Tj3hy+i0p+Uv1aCtnom71lmu6zgJmQHg1dJf8V/XnIlHC6pd
	 hAwD0iPYUVHXShTacAvArdMfxY2rrIc7kzQgBeVWZ45s4XF8e2w/jVyaR5nvULRC5+
	 sUciGGOA+pFzVwTxE0KvHX4IhxnVx3dJs4Wnd4ORleV95p6qSQhhsHcakorPshOjz5
	 iOP3HSpjTYkxiRvo64dk+KgzJK3zbqgu/qopxOBJFcbPZR48Q3Yi9RzBKlPO9/3p14
	 ix2M4vSFeoehIGIXuzlmpvsGAPVuJjjrj6bN9GUItM/Rzeuwwb8T1+GYCAcKq1BlZh
	 VR8QPX6SL2SsQ==
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
Subject: [PATCH 15/17] xtensa: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:11 -0700
Message-Id: <20250804164417.1612371-15-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2758; i=kees@kernel.org; h=from:subject; bh=bi83DBSxTax3RYBhak54pajUvhtkEYIGQUxIvC9PE+I=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkeb9bDx/Nw2R6PD5fZFAdkDyyrPvD+T8PfQGlEXi 7KDPivPdJSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEyklofhr0z6rA9SgTnRLP1d iyVVkrKvHem4/UN/SuIUQe4VwRMSyxn+6bhFap9w6BJ9Zbqp022VpEZv9/UHv08EpmQaNBTd/8H NBQA=
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

Add missing __attribute_const__ annotations to Xtensa's implementations
of ffs(), __ffs(), fls(), __fls(), ffz() functions. These are pure
mathematical functions that always return the same result for the
same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=xtensa defconfig with GCC xtensa-linux 15.1.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/xtensa/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index e02ec5833389..f7390b6761e1 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -37,7 +37,7 @@ static inline unsigned long __cntlz (unsigned long x)
  * bit 0 is the LSB of addr; bit 32 is the LSB of (addr+1).
  */
 
-static inline int ffz(unsigned long x)
+static inline int __attribute_const__ ffz(unsigned long x)
 {
 	return 31 - __cntlz(~x & -~x);
 }
@@ -46,7 +46,7 @@ static inline int ffz(unsigned long x)
  * __ffs: Find first bit set in word. Return 0 for bit 0
  */
 
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	return 31 - __cntlz(x & -x);
 }
@@ -57,7 +57,7 @@ static inline unsigned long __ffs(unsigned long x)
  * differs in spirit from the above ffz (man ffs).
  */
 
-static inline int ffs(unsigned long x)
+static inline __attribute_const__ int ffs(unsigned long x)
 {
 	return 32 - __cntlz(x & -x);
 }
@@ -67,7 +67,7 @@ static inline int ffs(unsigned long x)
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static inline int fls (unsigned int x)
+static inline __attribute_const__ int fls (unsigned int x)
 {
 	return 32 - __cntlz(x);
 }
@@ -78,7 +78,7 @@ static inline int fls (unsigned int x)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static inline unsigned long __fls(unsigned long word)
+static inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	return 31 - __cntlz(word);
 }
-- 
2.34.1


