Return-Path: <linuxppc-dev+bounces-10610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF05B1A7F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7v58sjz3bpx;
	Tue,  5 Aug 2025 02:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325867;
	cv=none; b=Mb8fLbz+eGf2Gz46EcWQ4bpeW9ji3E5LFICb1pliCcmQZujFovgBj5GQKR2xOOUy68hzMaSpoUjevEv7ruxuJuCulZ3/iFMw34GynIWRQGgqWm54wscSoU6uEgx28rSv9Y9OL9rUnsqUTTrTU6uIcc9Y+NAjEBQvIUU3ETdE074+p8dIPPBVri0eJyAlK8HwBCY4/JKfENwAWeEI/AK6QwL7QfB4ff2YqI11HMpU2nkx2YzJhNNFTsDb8Sjjoq1pUVp1OyVAMCc76G1LEpmTDoqZMhHJqzPBFuRze7CQxJ6N++4fsqonYx4qCvf3J4+IZuZfKOmMjLbd3xg1M68YmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325867; c=relaxed/relaxed;
	bh=PLHxyLclsVMWSDEBrhqOBbteaHHIBQxBl5UynLdCKkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IGfpTv7YPUPAD9b5z/yN+vPdVmlEGDaicv91ttyO9f9dib1vaUMJ/qLN5BF1gx5jU71+xDVKT98LpFPXkNG4wa0MBmiRHPjDGSX9xgx9IMI1qiW2P0ye66ijAKIKVaMr2vrh6tTiMJuz60O3jxqWNzF5tnBKwNEGwt5SwMVoCnO2PzeJTCKAiwIYuhf74gTpdOG1aNLmDoFiUhUJyWUB9xudNHCyqOFO7GEW8F33mbQ0h3XpLNj5al3//fvWt+G77JmEF3fFynJ/cVCu9QG65cEziMIRYQpoU+MWpINx+365tzcKVDC04JNYoyGST6LAfmr3nkwGZUIQQyU6AKy3Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0wr+SOQ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0wr+SOQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n4G2Fz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0C40A55A54;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B7BC4AF0C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0wr+SOQrJ8Pb1HYn23m4nYGmmpz1RDCR0ieEPGyaoZStf9uxSKkOeJ+ht08w8Btg
	 Mk16Oj5DcqMKz/MiKi8tHWrMk13bxl6FmvWQLkLC9rcpfJZE6u8Pgf6DcugDDacw/n
	 Gt1m4MotOXAbpwe1NUuHL8wW+JPWgcHeXq2UruCVO8Nxp4xDsYHY6mP6CA6UJep8Gi
	 4v4XsgZvc5nHH0fLusjDc2D7xmP4pPA5nbCjn3spw2vXn4Kuax1rC1vilgHcaGL1u5
	 +BXbkvga5yhWQsopUPn8srq6zLvG798XxT0hdKDu652cFd9q5dF1ACGM650jF2MJx2
	 QaBmx5wtzTV7A==
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
Subject: [PATCH 09/17] riscv: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:05 -0700
Message-Id: <20250804164417.1612371-9-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=kees@kernel.org; h=from:subject; bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkemZM9qPHqPbYffitvpiduXcnN//Wz59H7Src5ro iuN53c7dZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzk8wJGhkbFJarr3qZFnVMK ivFlq+MtkmgR9Xud8jxCoklDa6WcBcNf2d0LPUQOnJ4w6cfNbUl3P7lbnX7u8W9y56Vbs2y2ORi cYgEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
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

Add missing __attribute_const__ annotations to RISC-V's implementations of
variable__ffs(), variable__fls(), and variable_ffs() functions. These are pure
mathematical functions that always return the same result for the same
input with no side effects, making them eligible for compiler optimization.

Build tested ARCH=riscv defconfig with GCC riscv64-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2b..77880677b06e 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -45,7 +45,7 @@
 #error "Unexpected BITS_PER_LONG"
 #endif
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -74,7 +74,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 	 (unsigned long)__builtin_ctzl(word) :	\
 	 variable__ffs(word))
 
-static __always_inline unsigned long variable__fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -103,7 +103,7 @@ static __always_inline unsigned long variable__fls(unsigned long word)
 	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
 	 variable__fls(word))
 
-static __always_inline int variable_ffs(int x)
+static __always_inline __attribute_const__ int variable_ffs(int x)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
-- 
2.34.1


