Return-Path: <linuxppc-dev+bounces-10609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA819B1A7EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7t6dDBz3c6f;
	Tue,  5 Aug 2025 02:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325866;
	cv=none; b=oBncSvjouczTcq09LJQa6pXvN+tDBRqXZ+jL9/YmY3LNeqOB0toR7+Oh8Hlz4at/9rpg3svTueAcbJcJzisGwowiOA6wPe6MFKNn76OkmGvJIthLnYJf7Ncyvmwb/UbGgzj8IvkL5eC8SqB0JhZ7i+6BCetE1NQ/73TdLGukwuQwhHpTQ5vzAfA/T9Yaqm9bvr3e5XMNQSqSkwlErEZALDIi/nUEfZdjYfZ0Ip2gMGba3XN4ZzRwLNxcnjTsZsTmeeQrQx7QmhKaLYyyOvZq6i8Z25h3jxsFTV3hVWWPbWM/NFg1InfO0TzGxoWKKypRBw2svhomfCt2vDTL7eYQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325866; c=relaxed/relaxed;
	bh=RgwOaX/7myenJpw//Y8tmbPV8obytXNfAgIjFeT2wZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4oWJkVxOKNg3TJPvVWXxlKN7QXjcoUG6Eo0GCAQi5ytVbscA70AdDWb69EMHjLAgcckplU/YCvENLW7Icududw5jSElmYE7MgUvpwOK62R5abVfV4mJ5c04PfTI8NG6myhzbUTTKGqNw9u+h2qKLCM3qVnVD7Pf2i1muNScvKHsf7BDEr2XTxsOxNA28jumUWN+IAOaREsJGwrGCHYa7nFGh/j1l2VmbOz8IpnZ/iW5RFWi7iU4Ck4b9kdbVt81YJXoG4Sa/9O2uV59x2rnYWCrLVm3PDT4suH94anLleuLwT0ZrZeOfssBk3/EpBIzUJAojYyEOM5f0l3f+hskXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GROEzo0L; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GROEzo0L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7n2K13z3bpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B2824524C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C3EC4CEF7;
	Mon,  4 Aug 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325857;
	bh=VbqzFFZFobB7kkMuGpRYRdOZTcP62BCCuXda9NlZ/Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GROEzo0Lk1ZsfeiO0JcyeztscMMNwzmm9+gJ1U/EYaNzg4Y1I9YztXPW4KVquUcK5
	 W1K5xmL/UiItHuLKr7g7rVctCPykcFOWlbjwT/5GKF4IR51MZgfwEqS7sU43da6u8g
	 reQLveK36NSdF1lZOl6oCtDuIGJJLu+fUI30lmFxJfQ+8ZRKDBZhwM3u0epPf8Aups
	 YbSGTxe9YC4kSDibdvDhM9woUdKWTVutzTqXCwPcCu0R/bYFliwQt3Y30D0OcRNc1L
	 VrFaejLOI8CKjQUVofmE1a2gjth5Cd5PXSHYoS6bdeeUlAe5H/iZRgF3cNlXedvEDY
	 YrD4mtIeYiNEQ==
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
Subject: [PATCH 02/17] bitops: Add __attribute_const__ to generic ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:58 -0700
Message-Id: <20250804164417.1612371-2-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7306; i=kees@kernel.org; h=from:subject; bh=VbqzFFZFobB7kkMuGpRYRdOZTcP62BCCuXda9NlZ/Xk=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHod3ax3aZ7G1tNvmkOGJx9qa4vfF3JjywveGBNjO+ X/n4OtlHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABPZsICR4cE598PfnU503XBf /ub6WsFMhYK5i9d8+uG5at3nr/ULGW8wMpzpCr5noSqbsj3Ev6bHTCzs+tI3exR3iLkwvJ8tVl3 LzgwA
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

Add missing __attribute_const__ annotations to generic implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested with x86_64 defconfig using GCC 14.2.0, which should validate
the implementations when used by ARM, ARM64, LoongArch, Microblaze,
NIOS2, and SPARC32 architectures.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 include/asm-generic/bitops/__ffs.h         | 2 +-
 include/asm-generic/bitops/__fls.h         | 2 +-
 include/asm-generic/bitops/builtin-__ffs.h | 2 +-
 include/asm-generic/bitops/builtin-__fls.h | 2 +-
 include/asm-generic/bitops/builtin-fls.h   | 2 +-
 include/asm-generic/bitops/ffs.h           | 2 +-
 include/asm-generic/bitops/fls.h           | 2 +-
 include/asm-generic/bitops/fls64.h         | 4 ++--
 include/linux/bitops.h                     | 2 +-
 lib/clz_ctz.c                              | 8 ++++----
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/asm-generic/bitops/__ffs.h b/include/asm-generic/bitops/__ffs.h
index 2d08c750c8a7..3a899c626fdc 100644
--- a/include/asm-generic/bitops/__ffs.h
+++ b/include/asm-generic/bitops/__ffs.h
@@ -10,7 +10,7 @@
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned int generic___ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned int generic___ffs(unsigned long word)
 {
 	unsigned int num = 0;
 
diff --git a/include/asm-generic/bitops/__fls.h b/include/asm-generic/bitops/__fls.h
index e974ec932ec1..35f33780ca6c 100644
--- a/include/asm-generic/bitops/__fls.h
+++ b/include/asm-generic/bitops/__fls.h
@@ -10,7 +10,7 @@
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned int generic___fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned int generic___fls(unsigned long word)
 {
 	unsigned int num = BITS_PER_LONG - 1;
 
diff --git a/include/asm-generic/bitops/builtin-__ffs.h b/include/asm-generic/bitops/builtin-__ffs.h
index cf4b3d33bf96..d3c3f567045d 100644
--- a/include/asm-generic/bitops/builtin-__ffs.h
+++ b/include/asm-generic/bitops/builtin-__ffs.h
@@ -8,7 +8,7 @@
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned int __ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned int __ffs(unsigned long word)
 {
 	return __builtin_ctzl(word);
 }
diff --git a/include/asm-generic/bitops/builtin-__fls.h b/include/asm-generic/bitops/builtin-__fls.h
index 6d72fc8a5259..7770c4f1bfcd 100644
--- a/include/asm-generic/bitops/builtin-__fls.h
+++ b/include/asm-generic/bitops/builtin-__fls.h
@@ -8,7 +8,7 @@
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned int __fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned int __fls(unsigned long word)
 {
 	return (sizeof(word) * 8) - 1 - __builtin_clzl(word);
 }
diff --git a/include/asm-generic/bitops/builtin-fls.h b/include/asm-generic/bitops/builtin-fls.h
index c8455cc28841..be707da8c7cd 100644
--- a/include/asm-generic/bitops/builtin-fls.h
+++ b/include/asm-generic/bitops/builtin-fls.h
@@ -9,7 +9,7 @@
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
 }
diff --git a/include/asm-generic/bitops/ffs.h b/include/asm-generic/bitops/ffs.h
index 4c43f242daeb..5ff2b7fbda6d 100644
--- a/include/asm-generic/bitops/ffs.h
+++ b/include/asm-generic/bitops/ffs.h
@@ -10,7 +10,7 @@
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from ffz (man ffs).
  */
-static inline int generic_ffs(int x)
+static inline __attribute_const__ int generic_ffs(int x)
 {
 	int r = 1;
 
diff --git a/include/asm-generic/bitops/fls.h b/include/asm-generic/bitops/fls.h
index 26f3ce1dd6e4..8eed3437edb9 100644
--- a/include/asm-generic/bitops/fls.h
+++ b/include/asm-generic/bitops/fls.h
@@ -10,7 +10,7 @@
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static __always_inline int generic_fls(unsigned int x)
+static __always_inline __attribute_const__ int generic_fls(unsigned int x)
 {
 	int r = 32;
 
diff --git a/include/asm-generic/bitops/fls64.h b/include/asm-generic/bitops/fls64.h
index 866f2b2304ff..b5f58dd261a3 100644
--- a/include/asm-generic/bitops/fls64.h
+++ b/include/asm-generic/bitops/fls64.h
@@ -16,7 +16,7 @@
  * at position 64.
  */
 #if BITS_PER_LONG == 32
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	__u32 h = x >> 32;
 	if (h)
@@ -24,7 +24,7 @@ static __always_inline int fls64(__u64 x)
 	return fls(x);
 }
 #elif BITS_PER_LONG == 64
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	if (x == 0)
 		return 0;
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 9be2d50da09a..ea7898cc5903 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -267,7 +267,7 @@ static inline int parity8(u8 val)
  * The result is not defined if no bits are set, so check that @word
  * is non-zero before calling this.
  */
-static inline unsigned int __ffs64(u64 word)
+static inline __attribute_const__ unsigned int __ffs64(u64 word)
 {
 #if BITS_PER_LONG == 32
 	if (((u32)word) == 0UL)
diff --git a/lib/clz_ctz.c b/lib/clz_ctz.c
index fb8c0c5c2bd2..8778ec44bf63 100644
--- a/lib/clz_ctz.c
+++ b/lib/clz_ctz.c
@@ -15,28 +15,28 @@
 #include <linux/kernel.h>
 
 int __weak __ctzsi2(int val);
-int __weak __ctzsi2(int val)
+int __weak __attribute_const__ __ctzsi2(int val)
 {
 	return __ffs(val);
 }
 EXPORT_SYMBOL(__ctzsi2);
 
 int __weak __clzsi2(int val);
-int __weak __clzsi2(int val)
+int __weak __attribute_const__ __clzsi2(int val)
 {
 	return 32 - fls(val);
 }
 EXPORT_SYMBOL(__clzsi2);
 
 int __weak __clzdi2(u64 val);
-int __weak __clzdi2(u64 val)
+int __weak __attribute_const__ __clzdi2(u64 val)
 {
 	return 64 - fls64(val);
 }
 EXPORT_SYMBOL(__clzdi2);
 
 int __weak __ctzdi2(u64 val);
-int __weak __ctzdi2(u64 val)
+int __weak __attribute_const__ __ctzdi2(u64 val)
 {
 	return __ffs64(val);
 }
-- 
2.34.1


