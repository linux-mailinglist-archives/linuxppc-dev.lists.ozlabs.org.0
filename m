Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56646E245D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycvb5SmMz3fbn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:37:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNY5PhIa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycct1CzMz3fR0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNY5PhIa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycct0PFnz4xMy;
	Fri, 14 Apr 2023 23:25:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478702;
	bh=8NXwAwwR68xrzwxkAxZGk+wkScfTgxD6myOTANAfAaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NNY5PhIazBPJnNv4NDJT7HXHBwnhG09o0y9BAx6qxkdwgZcCoUz1mWrnBGYAYFdhI
	 UYvHqYtC9yx6vRXUiTtAMUWY48jfDD5TdQfj3KMKrVJJ/nrN3TRnJ4u5L7OTP3ggUO
	 hqYPNA1KkxutSIWE1ZnYO+M9OqxzUYsrgV4cmMLLhnKKHnYqz8KSs8ZDVpV+jUcxn3
	 EMT7OmkSQtHr3A4yoPtEzN1jIP9MGnALga6QrRQuenRC6LcJB9+KdKNQBXMfK0Nfql
	 YXpkr0YRUgNBPQvVTUYIlemC6DHHJaKhEqz4Api7vxWlijVXzC1dG8fGGNzNNrXumv
	 Vr6dxr6PXkBqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 18/32] powerpc/configs/64s: Enable KUNIT and most tests
Date: Fri, 14 Apr 2023 23:24:01 +1000
Message-Id: <20230414132415.821564-18-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All built as modules, so the tests only happen when the modules are
loaded, not affecting normal boot time.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 946307c54afa..8d4231fd878a 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -397,12 +397,14 @@ CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_RODATA_TEST=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_FUNCTION_TRACER=y
+CONFIG_LOCK_TORTURE_TEST=m
 CONFIG_STACK_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
@@ -412,3 +414,44 @@ CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_BOOTX_TEXT=y
+CONFIG_KUNIT=m
+CONFIG_KUNIT_ALL_TESTS=m
+CONFIG_LKDTM=m
+CONFIG_TEST_MIN_HEAP=m
+CONFIG_TEST_DIV64=m
+CONFIG_BACKTRACE_SELF_TEST=m
+CONFIG_TEST_REF_TRACKER=m
+CONFIG_RBTREE_TEST=m
+CONFIG_REED_SOLOMON_TEST=m
+CONFIG_INTERVAL_TREE_TEST=m
+CONFIG_PERCPU_TEST=m
+CONFIG_ATOMIC64_SELFTEST=m
+CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
+CONFIG_STRING_SELFTEST=m
+CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_PRINTF=m
+CONFIG_TEST_SCANF=m
+CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
+CONFIG_TEST_XARRAY=m
+CONFIG_TEST_MAPLE_TREE=m
+CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_IDA=m
+CONFIG_TEST_BITOPS=m
+CONFIG_TEST_VMALLOC=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_BLACKHOLE_DEV=m
+CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_SYSCTL=m
+CONFIG_LINEAR_RANGES_TEST=m
+CONFIG_TEST_UDELAY=m
+CONFIG_TEST_STATIC_KEYS=m
+CONFIG_TEST_KMOD=m
+CONFIG_TEST_MEMCAT_P=m
+CONFIG_TEST_MEMINIT=m
+CONFIG_TEST_FREE_PAGES=m
+CONFIG_MEMTEST=y
-- 
2.39.2

