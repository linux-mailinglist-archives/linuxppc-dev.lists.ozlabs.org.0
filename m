Return-Path: <linuxppc-dev+bounces-10614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C06B1A808
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7x1HQkz3c8D;
	Tue,  5 Aug 2025 02:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325869;
	cv=none; b=BvNKEWltg9A7TXXDa34ohoxEW98XJRB7loScauw7uiohjGPvV27XAucK4dYQaU+0TT5jCIOpBBm3z0omdwsrkoPDykBNWAi/b4k/EbFbSIqTG/n4/qXmu6tQGwmXJ4uvzobRziC4EaAYAyjKepQKdl+x++/keWHlHtHUkWksBLwLW3LniafgPqXHtU1nP1226j/KSwaskVIs/G9SRUCCi+zFvatZiIL7c2ShC8RoQxG6Nu28HX/xDCYrDlMFDSEwIBqElIDi1oYZgSGEy5BJH8VOlgYmFUhuXhsjWIEzr9szCm0R0duPjhKAQLZ5+3CHsJlprWqrs7TkkrL+IjFVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325869; c=relaxed/relaxed;
	bh=Z4eoEoPzEzlOIJTjrtUbqxQHIZFyXvuJXh8pE6FK4as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQHjaPjwMzYrrZMkHkDlr3+lmdT6svJcMNyGH3g6SQHj2UON+ADDvHAGGdaJCCtKnewLI4s1bG6Q396B9eY7/UEQEPEPfpUnhZlqaRq0zPBCd/JK4zg36PFfTGKVttNELNS8dQK+PbyuHW0+gwQOvM/FrMtCfV0BxCrmUptd1EtEQi/rTw+3rku5VmSvXBBl6M8pkJGT/vE5R/y9vLBHTx9f+kK79ko061D7aRXjUWVhYDgLEbaYlmNaFDLIhInS9hZ2IPIxz24HNpfdZnLM+RzMRJdzsgv2/jPyLgQosPYz+k5aQ5ih8o7mQCTeKD6+pk5rSLmwOMgq5rVmTEr1Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kp6LgWva; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kp6LgWva;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7v2P0Mz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC74545E9C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0DBC4AF10;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=qBtLAFX1ElqeAeYMLqY5b/htKgZsKDyJ9FsgsyXOP0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kp6LgWvaC+JEEdzd/Dg6N32Ddbu8okhan2FNusfuPzb/+mtKpY00kgSWLtUB4lxZ1
	 agtCgKlv4oPcKNTUENwcnN6oQnfWaK/BRy+DAFo22YYX44R2rTwP1fiKy6SCrbsb29
	 EoH8nLBo3UHb53nqW0BCFrF5MIJ1VL7X8xHr0PRPBwAGzOPvBlVtBYlONnhLX0NU/R
	 cK2lZhvuTQErOUUkr8caoNuFPryzEl5+oaCkyeDKm5zxVDNUriO3vJeouVSjaZvAln
	 bH9HkpexT8y9oby0emLBvnqwbpd3PL7GU/mNyh1h70wfClsRQO3uTF05s6DLQjTWLl
	 ZFTlkXCUPL+YA==
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
Subject: [PATCH 16/17] sparc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:12 -0700
Message-Id: <20250804164417.1612371-16-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=kees@kernel.org; h=from:subject; bh=qBtLAFX1ElqeAeYMLqY5b/htKgZsKDyJ9FsgsyXOP0Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHsdU/+bmO7Fhxa1ih00tOXKbpp0476zeIfi8Yf2pN V/3MW9O6yhlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZiI0H2G/5UJfWucumQV/e+3 bQ+5Mrn3SsqlxOfneU8K1R0s3fBtqwkjw+5N+nqci535gz/LNFgwPl81b+K/bhn9NKvtdwS9tVa L8AMA
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

Add missing __attribute_const__ annotations to sparc64's implementations
of ffs(), __ffs(), fls(), and __fls() functions. These are pure
mathematical functions that always return the same result for the
same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=sparc defconfig with GCC sparc64-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/sparc/include/asm/bitops_64.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/include/asm/bitops_64.h b/arch/sparc/include/asm/bitops_64.h
index 005a8ae858f1..2c7d33b3ec2e 100644
--- a/arch/sparc/include/asm/bitops_64.h
+++ b/arch/sparc/include/asm/bitops_64.h
@@ -23,8 +23,8 @@ void set_bit(unsigned long nr, volatile unsigned long *addr);
 void clear_bit(unsigned long nr, volatile unsigned long *addr);
 void change_bit(unsigned long nr, volatile unsigned long *addr);
 
-int fls(unsigned int word);
-int __fls(unsigned long word);
+int __attribute_const__ fls(unsigned int word);
+int __attribute_const__ __fls(unsigned long word);
 
 #include <asm-generic/bitops/non-atomic.h>
 
@@ -32,8 +32,8 @@ int __fls(unsigned long word);
 
 #ifdef __KERNEL__
 
-int ffs(int x);
-unsigned long __ffs(unsigned long);
+int __attribute_const__ ffs(int x);
+unsigned long __attribute_const__ __ffs(unsigned long);
 
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/sched.h>
-- 
2.34.1


