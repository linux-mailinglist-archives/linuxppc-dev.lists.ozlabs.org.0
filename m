Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2322C25D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:35:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkZY1GJ7zDqB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:35:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkMN2VfXzDrTQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:25:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=U0DhRYX0; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkMM2M5lz9sSn; Fri, 24 Jul 2020 19:25:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCkML709Xz9sTR; Fri, 24 Jul 2020 19:25:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582734;
 bh=vCGU+gOWB/YZEqlPlPGoQ5FWWYVeper93AigHoMP2yM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U0DhRYX0HLkwPBRdyhMqonCmKugrnjrLH0ZOKIKlQ2p92nxkjjMmcQ6XwOLiu/3QF
 xcT4vD1jzRH39+bbHwEIizY7xunSPbFSnsSjA1UsoPB4NFhUlSAg5lhEKwoxAhZSoq
 9z37DpTQ8iCUdOdTeTYXSCM+Sw34hpu3xvzK7PeV4Ac+JO7Kh3TQ72WcCVkTKZyYST
 jDtAHbBy97KRtx+ENsbMhYEc00Fviz8d0eiEq0Akpg6sFxoHW1JsB5gS43iZ5Xu0Fc
 txeT4Z3a5h4Zx3C+QccnSBEoTmby4vq3Q+ZqZ/271CHyaTsX+ATOy+cZjt0SQToO/M
 NxAjQBTYpOZsw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 5/5] selftests/powerpc: Remove powerpc special cases from
 stack expansion test
Date: Fri, 24 Jul 2020 19:25:28 +1000
Message-Id: <20200724092528.1578671-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724092528.1578671-1-mpe@ellerman.id.au>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the powerpc code behaves the same as other architectures we
can drop the special cases we had.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../powerpc/mm/stack_expansion_ldst.c         | 41 +++----------------
 1 file changed, 5 insertions(+), 36 deletions(-)

v2: no change just rebased.

diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
index 8dbfb51acf0f..ed9143990888 100644
--- a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
+++ b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
@@ -56,13 +56,7 @@ int consume_stack(unsigned long target_sp, unsigned long stack_high, int delta,
 #else
 		asm volatile ("mov %%rsp, %[sp]" : [sp] "=r" (stack_top_sp));
 #endif
-
-		// Kludge, delta < 0 indicates relative to SP
-		if (delta < 0)
-			target = stack_top_sp + delta;
-		else
-			target = stack_high - delta + 1;
-
+		target = stack_high - delta + 1;
 		volatile char *p = (char *)target;
 
 		if (type == STORE)
@@ -162,41 +156,16 @@ static int test_one(unsigned int stack_used, int delta, enum access_type type)
 
 static void test_one_type(enum access_type type, unsigned long page_size, unsigned long rlim_cur)
 {
-	assert(test_one(DEFAULT_SIZE, 512 * _KB, type) == 0);
+	unsigned long delta;
 
-	// powerpc has a special case to allow up to 1MB
-	assert(test_one(DEFAULT_SIZE, 1 * _MB, type) == 0);
-
-#ifdef __powerpc__
-	// This fails on powerpc because it's > 1MB and is not a stdu &
-	// not close to r1
-	assert(test_one(DEFAULT_SIZE, 1 * _MB + 8, type) != 0);
-#else
-	assert(test_one(DEFAULT_SIZE, 1 * _MB + 8, type) == 0);
-#endif
-
-#ifdef __powerpc__
-	// Accessing way past the stack pointer is not allowed on powerpc
-	assert(test_one(DEFAULT_SIZE, rlim_cur, type) != 0);
-#else
 	// We should be able to access anywhere within the rlimit
+	for (delta = page_size; delta <= rlim_cur; delta += page_size)
+		assert(test_one(DEFAULT_SIZE, delta, type) == 0);
+
 	assert(test_one(DEFAULT_SIZE, rlim_cur, type) == 0);
-#endif
 
 	// But if we go past the rlimit it should fail
 	assert(test_one(DEFAULT_SIZE, rlim_cur + 1, type) != 0);
-
-	// Above 1MB powerpc only allows accesses within 4224 bytes of
-	// r1 for accesses that aren't stdu
-	assert(test_one(1 * _MB + page_size - 128, -4224, type) == 0);
-#ifdef __powerpc__
-	assert(test_one(1 * _MB + page_size - 128, -4225, type) != 0);
-#else
-	assert(test_one(1 * _MB + page_size - 128, -4225, type) == 0);
-#endif
-
-	// By consuming 2MB of stack we test the stdu case
-	assert(test_one(2 * _MB + page_size - 128, -4224, type) == 0);
 }
 
 static int test(void)
-- 
2.25.1

