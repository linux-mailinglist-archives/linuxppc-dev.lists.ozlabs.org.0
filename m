Return-Path: <linuxppc-dev+bounces-10606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB6B1A7C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7s5PdCz3bp7;
	Tue,  5 Aug 2025 02:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325865;
	cv=none; b=Lz1qtpII1sckD4k3CLGa96bG+CPt2RNn+P8R9JLDAEH8Nw5KjkRS7BamVRPNXONCNhk5N9cSW1Vgm1q/Es7dM/e/PVmBEUghpNlCPsHib782yo8B4yU2GBop6RXVGhfHEXrmLi5NWelM3ufaTvdPXjlJtWLyVhbYYDDmlYuSZFJWEe7mjkRissY7DOqCUIlh+mKEPIxvY39mVHec1DiwWBDfUpt97EDwtovNHCoIdTgtqZm36jPgdZF+D1Juj2127Jxc3tNgABB6QvQzWEhJCemXR+s61DM4AoFN4DdYk9FouqpsqrPFBq61Tn3ys4NnS7M6G130qJY+52JLF5BsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325865; c=relaxed/relaxed;
	bh=BersUBGnCvdU/k2yfDEzoiXvTLKkKSsvuC5ybRPqcys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SOuX9UkUlAIL2CxIuo48mqh525RpxHO9MatGWB+pBhZQMBT/ocTmRKlurSNLqWJDrHb/9x722RgK1qpXvq3XzU38kMFthT6E/wPGD4nfT0cYo26J5HlpmG2aBrmlVa4qjbPQufLAFZcR0SlbFoM/C4ezvcNSazut4GDNG+E8FP9RW94WTmD9WwUSSB46fGtOP5+cHsPaqVNXDAD68It5wOQZWL34YrPiemeixGWkfU4fSrEmBuBu88TSmgUWBu+yrMPN9cpnyiU0R8BmkvoRZ3GorVqMCy7CpQLkAZ0JFDGcxfjpgegqyfjyv7azYUNw0KrmvFBum/j2zEQjQf2awQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7b8ufEv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7b8ufEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n1YtZz3bpM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C1BC45E3C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B233C116D0;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=guvy9CFz34iD95VNx9U+nwzbEodayv2bp++BoAV7Co8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7b8ufEvWKC7zComlRM7+u4PtyfPEWo/yjTdeYkDlJsbVyvwHAovh35m4D3uuSVye
	 gHJqZVdqWNTwtanGfltzgxGVOtOstQHMiweKxm56tiOvOzLvR44JZYdUL8B5L1htI+
	 DGDKHooxzEKRzUaDUXP7yWLGj/TWeVyVHYMQzEghCsXqPhdeduMIDPn11gl9swH7a+
	 HEINXXtYK9TpmhXZNMHyNCftjjwDDURfQsMuyzWDTs0oBX4SY+zy7mK7Jgke/vDeg3
	 U7w0bqTMAqEajLuIcJFHYSbSneQKkmY/yNhbGerF4hTMOq3OpZ4VDdx/o1lJJPBczx
	 s7evE8jRDh0cw==
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
Subject: [PATCH 06/17] sh: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:02 -0700
Message-Id: <20250804164417.1612371-6-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=kees@kernel.org; h=from:subject; bh=guvy9CFz34iD95VNx9U+nwzbEodayv2bp++BoAV7Co8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkfmP9t48PLcGkVp7XKfZ3/uTi7Rm+jids/QLcX+v ovoKoOHHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNRZ2T4Z1zh+zj++LvqmA3l LWq5U/2rD36e5VuY8uHfOu9mze9iixn+5z/fPemPk/mc5Lc7HA/9vMSTdJhT49XaZfdm+L/0SFt yjQUA
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

Add missing __attribute_const__ annotations to SH's implementations of
__ffs() and ffz() functions. These are pure mathematical functions that
always return the same result for the same input with no side effects,
making them eligible for compiler optimization.

Build tested ARCH=sh defconfig with GCC sh4-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/sh/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/bitops.h b/arch/sh/include/asm/bitops.h
index 10ceb0d6b5a9..aba3aa96a50e 100644
--- a/arch/sh/include/asm/bitops.h
+++ b/arch/sh/include/asm/bitops.h
@@ -24,7 +24,7 @@
 #include <asm-generic/bitops/non-atomic.h>
 #endif
 
-static inline unsigned long ffz(unsigned long word)
+static inline unsigned long __attribute_const__ ffz(unsigned long word)
 {
 	unsigned long result;
 
@@ -44,7 +44,7 @@ static inline unsigned long ffz(unsigned long word)
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	unsigned long result;
 
-- 
2.34.1


