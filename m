Return-Path: <linuxppc-dev+bounces-10607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FBB1A7D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7s6GYcz3c5W;
	Tue,  5 Aug 2025 02:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325865;
	cv=none; b=Hq0xalywpZXymVCRGolqsN99/7xe+vYMsQ0P+Alx5HuTm4sNo3ZRk1QfNSBZKb07c7ycCmewEEqDBFIY/R/pojgaN+KpwG7muf0EAg0n4Dkva8Ip9537plhpFGVgcD6P5E0yLoJPXjiRJ0mrplhHGr2H2qV5U1XKAraLRVWkpy+ogvtY0PHRsU4F82bl4rsI3luUcNjrwMsgk9a/1kIQVyvWBmJMxvJwFiY7PbY2SO47zFCOxXbkPgwXhbUTnGyzh+KNdVyi08eFfHzPCOaSZTnIbZkocWQtC/EyugsikZ7QOvluERuqCV5nzrH2kL9DZLXRcu43jbfOLjLEJl23Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325865; c=relaxed/relaxed;
	bh=8yojL5jftPopQmiTfKHDYo/Q+EOYkhC/6lngTgIqs2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kM4l1OtNZ96UEUpnR/5+PdyfE43dXaLaxNlx7NwJ7FG5rZaeos0JhkSM4u3sNG+buSfdehAAeGN/ny2IEA9elXlPh2S7/sYp1Sk6vvriR3nx8ZwxBlBr97GcYdUoVE6GH+l9KQwNCNEoA6+XTPEuBlqzy1WlvC0JeKVj1F4e2Krc0kdOq0PuvldXhR1jonBEeYLJ9DKClKtKHBK6C/NMpR8JpauV9YSAsCUlQNDYjIOW40ST3m4Z0BY+gZqxeZr/ZdNC1iwRSfhjROVu/71aMF2GhTO3vzcHYO6YxSDap8lIbfkcuyEmfDpuEWukXyyIC+RjLmWhwFNfeu+RtT2NEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iCRKQ61m; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iCRKQ61m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n1kW2z3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3517F45D64;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BABC4CEFC;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=f1BJyviPYJxx8kFp/yukIUneK3tevM8t3j60E+6mJ1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCRKQ61mm01MZTvc3CPPe2Ki/UrPAJKulntT266Ebe8TeWDAN/PSv0m32mZuiBkpN
	 lk/deOYVzRLtSp7i6p4G7JOZzGDwuaAryUY11pGGbT30Ubny4bRA9VoK9foPrUhkFy
	 5Kdb9YBAUZfg0XipfrZDkRGYNiY8gnoYygkru433UuRkZYLKddHKgD3V1i3NRUr65E
	 jI3qDVxgAjgs0faGOdEZKxTlRUMVWRKKtbD/zPFJkkQmhZoOks1gC8mF1Wrrb6/rxq
	 Brmye/Z8DZwW8aMN1Lsr/FFUXXIYCbg+wC0d/XKLVlJHJdrQIxU0buKqimdXSNKiTB
	 sP5NLdQ1qXfMw==
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
Subject: [PATCH 03/17] csky: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:59 -0700
Message-Id: <20250804164417.1612371-3-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=kees@kernel.org; h=from:subject; bh=f1BJyviPYJxx8kFp/yukIUneK3tevM8t3j60E+6mJ1Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkf4pKfxelzOuX/uzqPPOxs0l05ZFhCiyao9Jeqci 3ziSXXxjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIks2MXIsEItKTpFNdpgi2AC T4VsWqPxkidZFV7pHLJyKvtDK1pbGBmmVyyW697n81XsnYVwT1DQGWaXqglTVk1a8WJH3VlBbyE GAA==
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

Add missing __attribute_const__ annotations to C-SKY's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=csky defconfig with GCC csky-linux 15.1.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/csky/include/asm/bitops.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
index 72e1b2aa29a0..80d67eee6e86 100644
--- a/arch/csky/include/asm/bitops.h
+++ b/arch/csky/include/asm/bitops.h
@@ -9,7 +9,7 @@
 /*
  * asm-generic/bitops/ffs.h
  */
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	if (!x)
 		return 0;
@@ -26,7 +26,7 @@ static inline int ffs(int x)
 /*
  * asm-generic/bitops/__ffs.h
  */
-static __always_inline unsigned long __ffs(unsigned long x)
+static __always_inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	asm volatile (
 		"brev %0\n"
@@ -39,7 +39,7 @@ static __always_inline unsigned long __ffs(unsigned long x)
 /*
  * asm-generic/bitops/fls.h
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	asm volatile(
 		"ff1 %0\n"
@@ -52,7 +52,7 @@ static __always_inline int fls(unsigned int x)
 /*
  * asm-generic/bitops/__fls.h
  */
-static __always_inline unsigned long __fls(unsigned long x)
+static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	return fls(x) - 1;
 }
-- 
2.34.1


