Return-Path: <linuxppc-dev+bounces-10600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48FB1A755
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7p14Xtz3brv;
	Tue,  5 Aug 2025 02:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325861;
	cv=none; b=OoqR755UCEk+eNL1F9Cv6vB9cfOyjl6QyBuMPR3r0YTkhOLfBG8LTFqu/OdwtI5rWomf2KWCEigETomoisZ6imjv4Xd2DwJt75x8+RnbjNY42ZoaWoRA2H6LfHN8/QfK6VN2Jue3m8waBuufWaqZ+RuUp6CWZ2tbxQwwAPv3GrZLbORGpUEbn3jP0XqS6UJBpBuqK6/bThJI5YpxWnBOzxos7wdBYdisLlmDqC8yImG7wqw2YtUhci5S+UErevMcXETT680W0tkPpBXPgK3LTczGIRJ+CwLfaqVdk1Fsmkd8hEEqHf8WWQK6DIg2gBXC8xZHCVWQHzbFbtotq6VK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325861; c=relaxed/relaxed;
	bh=/4OSoANhgsDlGhYfSkvg0Ni8LWM0/cmuGU+uev8Bk7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AS2uupGmWK79qVddFIf/ae4+wY2meCmFYcPkATAMfBMuFWXt06LH9EjIrPj79lUKfWFxCTbjRtj71xGdjE1naoCs71woRSgl8qg6nOlNyJeDAiZ+JI/10JbVDL7V45n/Eid5mTjtZoUnZWgq08IjPQciyjEiu2TJ8xbdllT4HXrD/2u97r8Z7aiWQ90hdl6MPHWMfhbTPF0/DqocRKpiF1/Z9NS+WUIqpLU55duWdeXSgia/XlczRWGAWScJOaKQMhOYjYqBO0jr+xo38V9iWxjLxoOwdLYijEKJQUh4ZHiHeRkhsnzZGKlq3cCuce+KuN6hqDzy9Rxw04HXAtwITw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RKm7fStn; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RKm7fStn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7m6Vfgz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A7235C5AEF;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38944C4CEFA;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=Blko/RG2lvaODf864DzTpEKxwCgrc6vWtsbWwn+kegM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKm7fStnT2f/O9WTNiGO7vEnfTrtD2BjrdbvAqXYGVLzrvGMKRZpwNljrVdV5Yc7F
	 ms/UkNjaUp45VzaxYml1V2nd8lcIp45AXVOtEcUonr/GGOlwTuoYIbgkvoQhFG/wN6
	 WKZh/vtDzYFHTHdBEIoe7UUh+2ifIrTv4JkUwkgI3r31kXpv/+gCV57tdSm5RVB+/O
	 k/FFqo6u0bVzkLRl1/HE6qUBw2RV4HQjdVjWVDfm2DbICcjzwJ+2AIF2V6qq7UvY2s
	 1GPhzwrTFl0I2J3UaB6SO0WN6XerugMXmpU92vxpkjKRJ1CQhkGFuh0FEX4P7zr0Pl
	 YCvaKu3TYXMJw==
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
Subject: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:01 -0700
Message-Id: <20250804164417.1612371-5-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=kees@kernel.org; h=from:subject; bh=Blko/RG2lvaODf864DzTpEKxwCgrc6vWtsbWwn+kegM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkf8q+aJtHjfkMxRZhbRVyTe91hepyc95ULUY4Nmo RcSm190lLIwiHExyIopsgTZuce5eLxtD3efqwgzh5UJZAgDF6cATOTwfUaGT12nXSZdEFMMv1jN WH1s+TYRodUWp2689y1ICF67snCjFiPDy4IrLHkZtyc8f2I0KUiD65L66soy16kWMewJ/B3xN0J 4AA==
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

Add missing __attribute_const__ annotations to PowerPC's implementations of
fls() function. These are pure mathematical functions that always return
the same result for the same input with no side effects, making them eligible
for compiler optimization.

Build tested ARCH=powerpc defconfig with GCC powerpc-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/powerpc/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 671ecc6711e3..0d0470cd5ac3 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -276,7 +276,7 @@ static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
  * fls: find last (most-significant) bit set.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	int lz;
 
@@ -294,7 +294,7 @@ static __always_inline int fls(unsigned int x)
  * 32-bit fls calls.
  */
 #ifdef CONFIG_PPC64
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	int lz;
 
-- 
2.34.1


