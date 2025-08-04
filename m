Return-Path: <linuxppc-dev+bounces-10611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F460B1A7FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7v5vD3z3c7M;
	Tue,  5 Aug 2025 02:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325867;
	cv=none; b=Tws+3O4kn+8IakXqCG1ttA9rGdnBygHN4AUlzBZ9NyDuFFUlX+TTmYBCYmgjNNLyQcrNyjDMEabho9KrWlZ/RXKISkVKpXmE58MSYDpTiTGFLPqX5U1G55BC7i5J3VkZ79ioCVXSUIut+ZTs+pjDXOurFZ/uD1KpQpbw3Yg/M5PDqW55Z6jM2sSzJbt3ZMX0GZ6rtw92i+bN6IjbQEmnRmlEURw/oggDiRhbwiah5QR+c/85+QMC6PA8gRvQONd5ujFIlL1nuz2nK7QJ/CWZ9oIv6rEgGpxVXW8pqbk4zOkmQDICT7OQPcsvBL/VJR/ldAzAo0bwMQ0ynzr1ovmLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325867; c=relaxed/relaxed;
	bh=1XpBLGoAx6v7MlqS3bDmUctLxdfXNIJxJiFjJTBMxpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLYd0rMRtNf4SvVDFibVR+JCFmyZ5DRFJMbEfDJHaC0lV1H0QoH72raAUJlzxgWBZUFxGd5w/39fm2+AU/0qb/FRgxgEgPFnGj2hi51KXmLbCA6fwIgezHIthLzc7n9PPeFuxDp5ZetApNQ4GTqJfaJzOnvc2/C6kryrocQ14VZgeMPbObYocRQaXHw5dcNg0X9jdNScfYsvByfj74GjZe0B7dT+vjlbDVweIzAlSYuimqmgQXFNRS5w0l6Ce2vUg94+1diktdHqQK+UpRHz0W7hKNkVgrN5GSDsLbEOKO7YMHgcxXNZbl9fVkYHQJWIxc3QftvT8Z8aHlGSKf+cUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uoz8nJLp; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uoz8nJLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7s5pjrz3c5N
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AFEA45E85;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FE0C116C6;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=WqXHH+IfirIk9LkIKK7Nl4nbWfgsz7d0eW6zTgrbVtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uoz8nJLpEg7RJxFDS0SaUDuM3JC3++G29Vs6O3SIq0AlyDw/PtKWwF1Ek74YZtizN
	 ekkMeDZWxmiNkJ5aPmGW7zltBAJVWret0M3QxnUJdR3SxNof1VjZ4TmJar71HRDHcq
	 B+zcU7Vys78NH8p6reQ5SGIWBT2pUfK39dgXZLf/Ay+nfJf8ARpm2byEo1d/BEtLra
	 cRvm5KLXsLdsqhKT3FSA6mH91RMS9AEoSb+vpfE2AY0ZiMOdTviO7cCLtBrLdWkl3F
	 1gHFyE6a5/HGEDwdrlrj5ZEst307NwD/hZQKvss84KcsXukQxuTCU7N4W3s7jh1DJ+
	 UJV5giwhSkI8g==
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
Subject: [PATCH 10/17] openrisc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:06 -0700
Message-Id: <20250804164417.1612371-10-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965; i=kees@kernel.org; h=from:subject; bh=WqXHH+IfirIk9LkIKK7Nl4nbWfgsz7d0eW6zTgrbVtU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkflff/nrZrjf/rkzv6m+Qd3bffrennIcv+d+/X3C wSz1gr/6ShlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZiImC7DP/OJ8fypE74U3uRN eLGrj6P1bbxeg8jxiBUOnz7942gyYmH473XulIbBzg0OV94+C85feW9dXFGt1vywDWGtj4yvTa+ O4gMA
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

Add missing __attribute_const__ annotations to OpenRISC's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=openrisc defconfig with GCC or1k-linux 15.1.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/openrisc/include/asm/bitops/__ffs.h | 2 +-
 arch/openrisc/include/asm/bitops/__fls.h | 2 +-
 arch/openrisc/include/asm/bitops/ffs.h   | 2 +-
 arch/openrisc/include/asm/bitops/fls.h   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/bitops/__ffs.h b/arch/openrisc/include/asm/bitops/__ffs.h
index 1e224b616fdf..4827b66530b2 100644
--- a/arch/openrisc/include/asm/bitops/__ffs.h
+++ b/arch/openrisc/include/asm/bitops/__ffs.h
@@ -11,7 +11,7 @@
 
 #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
 
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	int ret;
 
diff --git a/arch/openrisc/include/asm/bitops/__fls.h b/arch/openrisc/include/asm/bitops/__fls.h
index 9658446ad141..637cc76fe4b7 100644
--- a/arch/openrisc/include/asm/bitops/__fls.h
+++ b/arch/openrisc/include/asm/bitops/__fls.h
@@ -11,7 +11,7 @@
 
 #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
 
-static inline unsigned long __fls(unsigned long x)
+static inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	int ret;
 
diff --git a/arch/openrisc/include/asm/bitops/ffs.h b/arch/openrisc/include/asm/bitops/ffs.h
index b4c835d6bc84..536a60ab9cc3 100644
--- a/arch/openrisc/include/asm/bitops/ffs.h
+++ b/arch/openrisc/include/asm/bitops/ffs.h
@@ -10,7 +10,7 @@
 
 #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
 
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	int ret;
 
diff --git a/arch/openrisc/include/asm/bitops/fls.h b/arch/openrisc/include/asm/bitops/fls.h
index 6b77f6556fb9..77da7639bb3e 100644
--- a/arch/openrisc/include/asm/bitops/fls.h
+++ b/arch/openrisc/include/asm/bitops/fls.h
@@ -11,7 +11,7 @@
 
 #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
 
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	int ret;
 
-- 
2.34.1


