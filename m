Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E2655BA46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:07:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqLJ4fqDz3fK3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:07:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GccUzW7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDz6nccz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GccUzW7P;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDz69ybz4xZB;
	Tue, 28 Jun 2022 00:02:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338579;
	bh=n972RqDdtUF1wnMJ49cH9ffQnEfMeQsJ2j290oiyojQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GccUzW7PDNdT9U9P1NSk4lQAjMLjHNCM8bucdd4bRY75o7Dd/EHh474sLnQPIGMSC
	 FVsDQy0LnTLhS1qaUIDFYdG8wAowLBtaZsz812oHtZ6S0XyhuxHfOU/7kGaQtxVI+X
	 tLjh0ZcxjqFPL+/JLrpbp2MqKNlbrcxccefuXt38jbDCp2mYqtmM4Xs0LnE75wu4r9
	 AuIDp8wM2HMCYBCNr3hezFIOAC2JiomyL0tWQ8t6wy0ZKa+QaNpvCVA67fgHnONWuM
	 BaGrBfQO0Z20BV9wLcy1tb0JMW6uVhFoIdB4gcZf4x0Y08hZSITM4MrED355KwH48X
	 Uvl/ZsVEk8DVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 09/13] selftests/powerpc/ptrace: Build the ptrace-gpr test as 32-bit when possible
Date: Tue, 28 Jun 2022 00:02:35 +1000
Message-Id: <20220627140239.2464900-9-mpe@ellerman.id.au>
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

The ptrace-gpr test can now be built 32-bit, so do that if that's the
compiler default rather than forcing a 64-bit build.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/ptrace/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index 8611b0670587..3434a624ed77 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -11,7 +11,6 @@ TM_TESTS += ptrace-tm-vsx
 TESTS_64 := $(TM_TESTS)
 TESTS_64 += core-pkey
 TESTS_64 += perf-hwbreak
-TESTS_64 += ptrace-gpr
 TESTS_64 += ptrace-hwbreak
 TESTS_64 += ptrace-perf-hwbreak
 TESTS_64 += ptrace-pkey
@@ -19,7 +18,9 @@ TESTS_64 += ptrace-syscall
 TESTS_64 += ptrace-tar
 TESTS_64 += ptrace-vsx
 
-TEST_GEN_PROGS := $(TESTS_64)
+TESTS += ptrace-gpr
+
+TEST_GEN_PROGS := $(TESTS) $(TESTS_64)
 
 LOCAL_HDRS += $(patsubst %,$(selfdir)/powerpc/ptrace/%,$(wildcard *.h))
 
-- 
2.35.3

