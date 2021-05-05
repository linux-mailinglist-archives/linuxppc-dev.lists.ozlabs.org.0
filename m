Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF83740D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 18:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb2TV5pLYz3f2j
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 02:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CLnSNbjc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CLnSNbjc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb2S63BD1z3dnm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 02:37:26 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 442876142E;
 Wed,  5 May 2021 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232644;
 bh=IjQ16PaiznQ+DmnopLdAcuaE4WZWyIOLV2kE1mYF6KM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CLnSNbjcp66rjDE+2LqH0A+KCLfZasz64p2E1az1qP2Yd7NB2qVojY3SZHg4fWHGs
 X4HWcUPU1sFpbAXJNg1N7xija90G1T56Zz1jKZ9yjMm8s+7nrpat+ayvoHPTU7nrUO
 SPucyMcnOgAjoyb/o99DQprNBIZEDgZqq6H5rYZeC6vNvcwN5c8vHjss1BP2L5/3m7
 wZSYHqsY9kT9O8lWhzCe9w8AFFKQ7awDJNZMwDyKA1eOzgE3f2kXYmZTRxLNRGt1bh
 /wocpCDpNcbb51jE1uSMwY5NGJ2eFFmtktJkrRsPxGyLZ/GuoEw++hYqGkaQq6VNRd
 usi5H+PCx1Csg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 24/85] selftests/powerpc: Fix L1D flushing tests
 for Power10
Date: Wed,  5 May 2021 12:35:47 -0400
Message-Id: <20210505163648.3462507-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

[ Upstream commit 3a72c94ebfb1f171eba0715998010678a09ec796 ]

The rfi_flush and entry_flush selftests work by using the PM_LD_MISS_L1
perf event to count L1D misses.  The value of this event has changed
over time:

- Power7 uses 0x400f0
- Power8 and Power9 use both 0x400f0 and 0x3e054
- Power10 uses only 0x3e054

Rather than relying on raw values, configure perf to count L1D read
misses in the most explicit way available.

This fixes the selftests to work on systems without 0x400f0 as
PM_LD_MISS_L1, and should change no behaviour for systems that the tests
already worked on.

The only potential downside is that referring to a specific perf event
requires PMU support implemented in the kernel for that platform.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Acked-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210223070227.2916871-1-ruscur@russell.cc
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/security/entry_flush.c | 2 +-
 tools/testing/selftests/powerpc/security/flush_utils.h | 4 ++++
 tools/testing/selftests/powerpc/security/rfi_flush.c   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
index 78cf914fa321..68ce377b205e 100644
--- a/tools/testing/selftests/powerpc/security/entry_flush.c
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -53,7 +53,7 @@ int entry_flush_test(void)
 
 	entry_flush = entry_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
index 07a5eb301466..7a3d60292916 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.h
+++ b/tools/testing/selftests/powerpc/security/flush_utils.h
@@ -9,6 +9,10 @@
 
 #define CACHELINE_SIZE 128
 
+#define PERF_L1D_READ_MISS_CONFIG	((PERF_COUNT_HW_CACHE_L1D) | 		\
+					(PERF_COUNT_HW_CACHE_OP_READ << 8) |	\
+					(PERF_COUNT_HW_CACHE_RESULT_MISS << 16))
+
 void syscall_loop(char *p, unsigned long iterations,
 		  unsigned long zero_size);
 
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 7565fd786640..f73484a6470f 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -54,7 +54,7 @@ int rfi_flush_test(void)
 
 	rfi_flush = rfi_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
-- 
2.30.2

