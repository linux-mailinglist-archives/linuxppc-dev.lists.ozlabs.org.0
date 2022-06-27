Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90855BA41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqK16fVkz3fCf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:06:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nshnNZis;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDz050sz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nshnNZis;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDw3WFPz4xLX;
	Tue, 28 Jun 2022 00:02:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338576;
	bh=9I/Ufeg6ZpmNhZJ/VWsUrmlZIUdCqelfr9av5KPilHE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nshnNZisfVtB5mTKpQKZ5XL2jPHHmxTQ8rLMM8wGQntvQXkfvc8bSitm0qDr/naFJ
	 pobGV604tpJPAszduF/YgijaweFDZ08sKBwNxEpRYGXJaTapxg3wwLrzIReWUnU/fV
	 Czqy/iNe0m5a0nNdYbrWoWDh+gtnqirQ2Yw/kWnM6XB7N617KAoE6tirinDGwIdxve
	 2zzDizuyySroICVQ0djEgebVCR7aJcmbOuzwQje0mqZKO3o+JUU811Gplvgd6fDYNv
	 HRXci19jvz+pJ1unB2GYYZue0iOUXfNeqeTxuEr8Q74T/BCIHAAaG0bv63Yt9qRSY/
	 uOoK1iBjW7c9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 03/13] selftests/powerpc/ptrace: Split CFLAGS better
Date: Tue, 28 Jun 2022 00:02:29 +1000
Message-Id: <20220627140239.2464900-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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

Currently all ptrace tests are built 64-bit and with TM enabled.

Only the TM tests need TM enabled, so split those out into a separate
variable so that can be specified precisely.

Split the rest of the tests into a variable, and add -m64 to CFLAGS for
those tests, so that in a subsequent patch some tests can be made to
build 32-bit.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/ptrace/Makefile | 33 ++++++++++++++++---
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index 0b0652d88b1b..8611b0670587 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -1,15 +1,38 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_GEN_PROGS := ptrace-gpr ptrace-tm-gpr ptrace-tm-spd-gpr \
-              ptrace-tar ptrace-tm-tar ptrace-tm-spd-tar ptrace-vsx ptrace-tm-vsx \
-              ptrace-tm-spd-vsx ptrace-tm-spr ptrace-hwbreak ptrace-pkey core-pkey \
-              perf-hwbreak ptrace-syscall ptrace-perf-hwbreak
+
+TM_TESTS := ptrace-tm-gpr
+TM_TESTS += ptrace-tm-spd-gpr
+TM_TESTS += ptrace-tm-spd-tar
+TM_TESTS += ptrace-tm-spd-vsx
+TM_TESTS += ptrace-tm-spr
+TM_TESTS += ptrace-tm-tar
+TM_TESTS += ptrace-tm-vsx
+
+TESTS_64 := $(TM_TESTS)
+TESTS_64 += core-pkey
+TESTS_64 += perf-hwbreak
+TESTS_64 += ptrace-gpr
+TESTS_64 += ptrace-hwbreak
+TESTS_64 += ptrace-perf-hwbreak
+TESTS_64 += ptrace-pkey
+TESTS_64 += ptrace-syscall
+TESTS_64 += ptrace-tar
+TESTS_64 += ptrace-vsx
+
+TEST_GEN_PROGS := $(TESTS_64)
 
 LOCAL_HDRS += $(patsubst %,$(selfdir)/powerpc/ptrace/%,$(wildcard *.h))
 
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-CFLAGS += -m64 -I../../../../../usr/include -I../tm -mhtm -fno-pie
+TM_TESTS := $(patsubst %,$(OUTPUT)/%,$(TM_TESTS))
+TESTS_64 := $(patsubst %,$(OUTPUT)/%,$(TESTS_64))
+
+$(TESTS_64): CFLAGS += -m64
+$(TM_TESTS): CFLAGS += -I../tm -mhtm
+
+CFLAGS += -I../../../../../usr/include -fno-pie
 
 $(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
 
-- 
2.35.3

