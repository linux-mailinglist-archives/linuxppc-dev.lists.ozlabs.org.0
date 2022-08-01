Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B8586844
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 13:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxGNC24wqz3bl6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 21:38:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oXSrEPe8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxGMY27Xzz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 21:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oXSrEPe8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxGMV6Ch9z4x1L;
	Mon,  1 Aug 2022 21:37:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659353878;
	bh=w12dusBQt5fyNiwiPfIJVhQfBDcNOiml2UvmkPRR2jE=;
	h=From:To:Subject:Date:From;
	b=oXSrEPe8SHxCJBMu2sa+ydm6ctqWZF0McVmw2l5cfFjh4JzL7xwy/Z3d6z/wm2Hsd
	 erctqfNRpAF/2M9feKP0JkfrsxnHGNEm0dMNTVuIFPCH2TBObxeVqZ7HB6dF/OrHv9
	 KrGimK+3U5NFpJRrk7sIWTcehil8Z7GJI5ria0Y5WJpO7GcP4JQBKcXPbZ92FcKay6
	 2OjnZYz/Wnqm1lctDqhc8gc/fNdTvOcoCS9Cp4RaLhiz4SapUfUOuIeG+n++Xs1r7z
	 zC55SgIx00hHNNlwpIISL3z7EfNwaCE6atM+uiX1bXjstIZOYJIVBVA45jaBJCJ2uk
	 ZqszHykAbBY3A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Avoid GCC 12 uninitialised variable warning
Date: Mon,  1 Aug 2022 21:37:46 +1000
Message-Id: <20220801113746.802046-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GCC 12 thinks that `actual` might be used uninitialised. It's not, the
use is guarded by `bad_mmcr2` which is only set to true at the same
point where `actual` is initialised.

  cycles_with_mmcr2_test.c: In function ‘cycles_with_mmcr2’:
  cycles_with_mmcr2_test.c:81:17: error: ‘actual’ may be used uninitialized [-Werror=maybe-uninitialized]
     81 |                 printf("Bad MMCR2 value seen is 0x%lx\n", actual);

Silence the warning by initialising `actual` to zero.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
index 4b45a2e70f62..fc32187d483d 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
@@ -50,6 +50,7 @@ int cycles_with_mmcr2(void)
 	expected[1] = MMCR2_EXPECTED_2;
 	i = 0;
 	bad_mmcr2 = false;
+	actual = 0;
 
 	/* Make sure we loop until we take at least one EBB */
 	while ((ebb_state.stats.ebb_count < 20 && !bad_mmcr2) ||
-- 
2.35.3

