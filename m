Return-Path: <linuxppc-dev+bounces-10615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AAFB1A809
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7x4jTJz3c8s;
	Tue,  5 Aug 2025 02:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325869;
	cv=none; b=J1JuHUn+KdYvmNeMLARPALzwjRNzOXG01Oqs/s2Ae2eAbFAdHn5RIguek0CfR/OsGHLyKLuOJTqIAjbAOhtcnO5seelhisamJXwXBFogCHOPXr1pYkQ0gYCYlNO8KKZZd1sRFUr9BVINJ4lNRZf2CyLe+1waooOp8b42/fMtMEDqnbTC8GqVhR8Z+QGHhzY3ycYZg5S/Ocs+z4a5w4mdoPM1A6Acfzvn4HTx9TCIBSA/ANiVSCAL3IzvX4N5f1WhtkeR9mScgIyti8HrucTCDDPD+U4b/c8xe8pfOwaBhfSXw8TdIYqL5r0o4N5Zv7dtcXWCmQ1nPU//OKLfVe7scg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325869; c=relaxed/relaxed;
	bh=mCsXQccHr2+NTUOGjpY1/Ej4ZxrbvCwAWXyh2LEz/sA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pq3urnnOMh7gqEaEK2zVQAGsd2olUM8rPn6ZelXWA0Q7B2T73XilxUUfbY4VS1X84DmXyaY6KJiyUG6GIGeWQWviXDgStpv8wIWD7nJRok4CsYIXqn+l4NcQD/+nKcmmwhYLugfLdoOtgvQPEfLq2+s1q/JkYaFrKEBK8LSO8HTp9Pmb/+0GlLAGmyFeSPyxKqRsuoFsDI8+UqmhB+nePSieH1coA9Ldqq9/tcObx0Ezp3fb4UsmojitHj0EU4mHXROrHIRlKYw6H2sWfWnM6Rh4SrFNCIowQJP+W9Yn6Sa4oWBKcSvwaYU9KJGKvhvY4o9SvZECyxiMUfULx9zgdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ge6UnzC7; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ge6UnzC7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7v2PjKz3c75
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF5A45E8F;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B5C113D0;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge6UnzC7RCLcQnB7l193lH28keaIzGG1YTTZUZMK4Velt+wX4iI+WLWhEq0f25glZ
	 EPQLcMekI7Qvor+gIO2PqW0/4OjdTkyLrHQ5EPHMRDAjBoA2HTeFoRsl6GXh/qJLgj
	 MF69H6fg2iDs2LL0gkx86SD4N/8EocNjtjMQgdHiqj44NY5Vqw8hA1wJB61jHXHHZm
	 v7W+8ZuG2nchNWjSRwa024Wv2ZapjnQQXpX6J88aI+CFwRDSUXs6ltLrZGcmXmcDWo
	 nS5iD0eGBf/ejiqGM9Qvn3UKnMrG6ib6iJFT4D42SgAa35HMf3R2+MzKIuOWsemar9
	 YnJC/kBSRhIUg==
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
Subject: [PATCH 13/17] parisc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:09 -0700
Message-Id: <20250804164417.1612371-13-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=kees@kernel.org; h=from:subject; bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkef/nFELezMN7cjNvMWx9sJHzw1i22t5cePF+sdU /Nld6080lHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjARL1mG/37Hr0ifUD5qKhpw fXet6D0J8bNfnog1bb1+l1/U9sh+7yBGhhm3b15IzvrjxfGP78CVyJl/F691fSu1dqHll4/JXsq 5jVwA
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

Add missing __attribute_const__ annotations to PARISC's implementations of
ffs(), __ffs(), and fls() functions. These are pure mathematical functions
that always return the same result for the same input with no side effects,
making them eligible for compiler optimization.

Build tested ARCH=parisc defconfig with GCC hppa-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/parisc/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bitops.h
index 0ec9cfc5131f..bd1280a8a5ec 100644
--- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -123,7 +123,7 @@ static __inline__ int test_and_change_bit(int nr, volatile unsigned long * addr)
  * cycles for each mispredicted branch.
  */
 
-static __inline__ unsigned long __ffs(unsigned long x)
+static __inline__ __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	unsigned long ret;
 
@@ -161,7 +161,7 @@ static __inline__ unsigned long __ffs(unsigned long x)
  * This is defined the same way as the libc and compiler builtin
  * ffs routines, therefore differs in spirit from the above ffz (man ffs).
  */
-static __inline__ int ffs(int x)
+static __inline__ __attribute_const__ int ffs(int x)
 {
 	return x ? (__ffs((unsigned long)x) + 1) : 0;
 }
@@ -171,7 +171,7 @@ static __inline__ int ffs(int x)
  * fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static __inline__ int fls(unsigned int x)
+static __inline__ __attribute_const__ int fls(unsigned int x)
 {
 	int ret;
 	if (!x)
-- 
2.34.1


