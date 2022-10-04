Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEB5F3CCC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 08:36:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhSfT1qJZz3dsr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 17:36:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=apjnRLGM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=apjnRLGM;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhSZd5yqbz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 17:33:29 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d10so12335770pfh.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Z2WK+wlDbtY/C0uGfFoDk9EIHilR5NLBt+oI60VmnUQ=;
        b=apjnRLGMPZL8pBtCKL095i7yoKKQVhaqXtX6qC/Xd2jKkrBDxM3H84Gkxb0WKHBZVV
         MDSIC2epEkJ6WJLkhtRIdzB56iLpn4+2ILZPXKHNsJ5n18KZJ1bodjKc6aNgcTK8K9hY
         G650urgoW056ehs6I25AIbfvKGPguCINYEHGRD4zYG3oC4CFmKC+VDU+nBpxfW7JutVD
         z9wP3qcNPB4JDk0gPsLfSLSNi6N7a5tDR30SsNiIU/0p2Rn06Rl3/p+SnPjphg+mvehV
         ro+HnKuvsYUZLm3GHU9jt2RKj2PIHnIs/mF9L2c0p1kH9Hri1Kcf8z9xTBb4g5KGzHjU
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z2WK+wlDbtY/C0uGfFoDk9EIHilR5NLBt+oI60VmnUQ=;
        b=kRLkbPz/I1fOKOSBRyggtFb6lu4fi1KFUnmSvDXwTlQiZnQRFtO6KRExNDsxEAezXn
         vRJnp5nHOqmV3gNg4Em/D1Ke1PMMeowZfd7YHeBM0hZ64nlgsKWNyyWiYYPe8pvIp8Cq
         CioymsQkg8SqJoIwCmA9Inh/AgKJ+HVQDYDWfFOLuuXCFsX9no5YkWr+r/4AGxWSphTO
         AK3i4CDoKGVtCn/xWqlZCtJ6sj8K8XGuhNLUzlLeQxpiyK5SElQHgKkZC8yWZSyGF582
         kzD4bAhH+S+E+HHeE0F1aNcln1GBGPqopKT95mdGPDhjo8ozT/WQZZICS8k/cJBXGJwQ
         Is3Q==
X-Gm-Message-State: ACrzQf2L7fUg6QlB+DhilLPp3PxPaKqLvLx7WSfehOhP+zN5I9IEyHjn
	M8oxxMLGmc9/HwFF664YTxJbJQJZzu4=
X-Google-Smtp-Source: AMsMyM7CJBZHT64mLwlP3q7AMio8FRpN4kA/992lfSLMx6EXkWvS7pHXOHP9EIM/3a+qdcFMCVE04w==
X-Received: by 2002:a63:b545:0:b0:43c:2ad9:b00 with SMTP id u5-20020a63b545000000b0043c2ad90b00mr21923516pgo.535.1664865207032;
        Mon, 03 Oct 2022 23:33:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id s17-20020aa78bd1000000b0056160437e88sm3701782pfd.20.2022.10.03.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:33:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/3] Remove HAVE_VIRT_CPU_ACCOUNTING_GEN option
Date: Tue,  4 Oct 2022 16:33:06 +1000
Message-Id: <20221004063306.511154-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221004063306.511154-1-npiggin@gmail.com>
References: <20221004063306.511154-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This option was created in commit 554b0004d0ec4 ("vtime: Add
HAVE_VIRT_CPU_ACCOUNTING_GEN Kconfig") for architectures to indicate
they support the 64-bit cputime_t required for VIRT_CPU_ACCOUNTING_GEN.

The cputime_t type has since been removed, so this doesn't have any
meaning. Remove it.

Cc: linux-arch@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig           | 11 -----------
 arch/arm/Kconfig       |  1 -
 arch/csky/Kconfig      |  1 -
 arch/loongarch/Kconfig |  1 -
 arch/mips/Kconfig      |  1 -
 arch/xtensa/Kconfig    |  1 -
 init/Kconfig           |  1 -
 kernel/time/Kconfig    |  2 --
 8 files changed, 19 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 5dbf11a5ba4e..54c73e22c526 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -829,17 +829,6 @@ config HAVE_VIRT_CPU_ACCOUNTING_IDLE
 config ARCH_HAS_SCALED_CPUTIME
 	bool
 
-config HAVE_VIRT_CPU_ACCOUNTING_GEN
-	bool
-	default y if 64BIT
-	help
-	  With VIRT_CPU_ACCOUNTING_GEN, cputime_t becomes 64-bit.
-	  Before enabling this option, arch code must be audited
-	  to ensure there are no races in concurrent read/write of
-	  cputime_t. For example, reading/writing 64-bit cputime_t on
-	  some 32-bit arches may require multiple accesses, so proper
-	  locking is needed to protect against concurrent accesses.
-
 config HAVE_IRQ_TIME_ACCOUNTING
 	bool
 	help
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 87badeae3181..47f3a23564e8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -119,7 +119,6 @@ config ARM
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_REL
 	select NEED_DMA_MAP_STATE
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 3cbc2dc62baf..8102d0d3f3b3 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -72,7 +72,6 @@ config CSKY
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_CONTEXT_TRACKING_USER
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 26aeb1408e56..201b5d4e5c25 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -97,7 +97,6 @@ config LOONGARCH
 	select HAVE_SETUP_PER_CPU_AREA if NUMA
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_TIF_NOHZ
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
 	select MMU_GATHER_MERGE_VMAS if MMU
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ec21f8999249..f67291d8e09c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -90,7 +90,6 @@ config MIPS
 	select HAVE_SPARSE_SYSCALL_NR
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN if 64BIT || !SMP
 	select IRQ_FORCED_THREADING
 	select ISA if EISA
 	select MODULES_USE_ELF_REL if MODULES
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 12ac277282ba..18053fe9ec38 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -47,7 +47,6 @@ config XTENSA
 	select HAVE_PERF_EVENTS
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select PERF_USE_VMALLOC
diff --git a/init/Kconfig b/init/Kconfig
index 94ce5a46a802..bb6d7f0d80fe 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -490,7 +490,6 @@ config VIRT_CPU_ACCOUNTING_NATIVE
 config VIRT_CPU_ACCOUNTING_GEN
 	bool "Full dynticks CPU time accounting"
 	depends on HAVE_CONTEXT_TRACKING_USER
-	depends on HAVE_VIRT_CPU_ACCOUNTING_GEN
 	depends on GENERIC_CLOCKEVENTS
 	select VIRT_CPU_ACCOUNTING
 	select CONTEXT_TRACKING_USER
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index a41753be1a2b..ed480ba6cf35 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -121,8 +121,6 @@ config NO_HZ_FULL
 	# We need at least one periodic CPU for timekeeping
 	depends on SMP
 	depends on HAVE_CONTEXT_TRACKING_USER
-	# VIRT_CPU_ACCOUNTING_GEN dependency
-	depends on HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select NO_HZ_COMMON
 	select RCU_NOCB_CPU
 	select VIRT_CPU_ACCOUNTING_GEN
-- 
2.37.2

