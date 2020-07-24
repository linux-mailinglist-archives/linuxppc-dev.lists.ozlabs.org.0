Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124B22C24D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:31:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkVP2mbszDrhS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:31:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkMK4wnyzDrRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:25:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nqPzkLDg; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkMK4Rg5z9sSn; Fri, 24 Jul 2020 19:25:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCkMK3H5rz9sTF; Fri, 24 Jul 2020 19:25:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582733;
 bh=AVUaTO+LsSUOyxIL1KOaTrKKKaNmx2vXjDKN+mztBlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nqPzkLDgg6v5PjB1sy5QwAed8FgPbtUmFKYBrxuFskrWObQQs/p2c+gNBteuMW8f4
 EpTVY02DOksjw5VsQQvRUjRCz8Pwh5kYhQ3xdPqiVRF2dqHbOE0ynB1mkekV+ctdOY
 KBVLxyhH4U+TdiYqt00aIzeVZW8aeDVyg2q89/wrOxyMLhKClbtVPylRUoTaB/l7Cn
 1+P1Qk7+rkYJBh/dDmaa9zr9P3tfbRFaupAD6cgp2ykwdXVxW9UtOqBO9PrRootUUl
 /ggcX9ruW3hZ2RlQDdVlxhBrAe3GTvJYY2CNTQ+7vkHLJSQEmMjq7jePvq02O2DsZ7
 AqaOv2Nx0OWCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 3/5] selftests/powerpc: Update the stack expansion test
Date: Fri, 24 Jul 2020 19:25:26 +1000
Message-Id: <20200724092528.1578671-3-mpe@ellerman.id.au>
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

Update the stack expansion load/store test to take into account the
new allowance of 4224 bytes below the stack pointer.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/mm/stack_expansion_ldst.c        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

v2: Update for change of size to 4224.

diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
index 0587e11437f5..8dbfb51acf0f 100644
--- a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
+++ b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
@@ -186,17 +186,17 @@ static void test_one_type(enum access_type type, unsigned long page_size, unsign
 	// But if we go past the rlimit it should fail
 	assert(test_one(DEFAULT_SIZE, rlim_cur + 1, type) != 0);
 
-	// Above 1MB powerpc only allows accesses within 2048 bytes of
+	// Above 1MB powerpc only allows accesses within 4224 bytes of
 	// r1 for accesses that aren't stdu
-	assert(test_one(1 * _MB + page_size - 128, -2048, type) == 0);
+	assert(test_one(1 * _MB + page_size - 128, -4224, type) == 0);
 #ifdef __powerpc__
-	assert(test_one(1 * _MB + page_size - 128, -2049, type) != 0);
+	assert(test_one(1 * _MB + page_size - 128, -4225, type) != 0);
 #else
-	assert(test_one(1 * _MB + page_size - 128, -2049, type) == 0);
+	assert(test_one(1 * _MB + page_size - 128, -4225, type) == 0);
 #endif
 
 	// By consuming 2MB of stack we test the stdu case
-	assert(test_one(2 * _MB + page_size - 128, -2048, type) == 0);
+	assert(test_one(2 * _MB + page_size - 128, -4224, type) == 0);
 }
 
 static int test(void)
-- 
2.25.1

