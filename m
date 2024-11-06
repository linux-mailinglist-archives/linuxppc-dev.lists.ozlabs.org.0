Return-Path: <linuxppc-dev+bounces-2913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F29BEC79
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk55q753Lz3bbp;
	Thu,  7 Nov 2024 00:05:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730898303;
	cv=none; b=MFQZ4w+a00R/ILrwoYjCZFDFrzvCnl9lvbAiRMdvZ8Ymv+EDHqVun0N7PkTvNpMcJa/tQXMDDvsplEgLd6PLRvdXSKDfhJm1b+qehFTMLTXPjxrtJhRUyEojlZeA4XWE7UzIN+oyTM4chldFwtXOEgOvhp0DQ4W4pZA3nPqwVPNXoadeMuQMf9Ll7Sed1kQy13Zbj+CnlU+VVpODpgQ8XzxBAMjqXdNyd2javR/+k1GM1dKbZnSORZyYHiRc1uciCcjiG2Hk89jJKGV7TSzh4WJBea65WArBzxkVT320C8uG71Y7qjUZQ6ae2IB19I0oi4M70BxTGiqIqlbOJNQpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730898303; c=relaxed/relaxed;
	bh=gWi3uhGcloOwTYgGQh/KqDPknZHDL95CKVUKUmrlZBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlZMeLbRC72eq8zoHQs/rCq9tVS7lYkMRL71iylUXBsueiF7YcePUBdnoO8j/Uq0f9rM4A9VUW6VueNsWe+5pjaPPrp77EaoHUu0gChYuSIs64ZphqHLA0B65vCcGGGYUhbfpyRCMRQ14Ic6Tz8xFbW5o1MT+ezWdrOul9GzGMqKwxGHe/yfIu20JEhZV/rwVl8wYttdtjRFWJTHsdyX0ymcSJZR+gHuyqlGQ8MAIvEDyQbwdue8F+UzxMul+St98EoifAEJZ2rjSOBOIAY09mk1ecUriMLC1PHe6NTDnCwaSVjA/flnePTEjwMxgWuEj3LPvVbsZ13/Qqd3iS4+Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZbvhujQB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZbvhujQB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk55p6GYBz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:05:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730898300;
	bh=gWi3uhGcloOwTYgGQh/KqDPknZHDL95CKVUKUmrlZBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbvhujQB4eB1WiNH7s6IozVLIgYkcsc6iL3gC5Q5EBcvgpng+ZVtGaNW0pdllbGRG
	 TLO9yIjsYUaXePmT0nEPbK6RD72GnRhVcvRxHYMNkjRQMTfKc2RE3P82xU9qVs63+P
	 eA6u/F29xflAqJkoRsQskTJHx5dVir8smRwRHAKOboAJJ0oJ0ui7kjafMvawjJ4sfF
	 rsc1aer4ol58BN1PwpKuBFEHjw9da7wsXu00LuY8cq+8OF5SR8dqupkKd3BhgudiGA
	 5iuQ1w9gtKaI+vFcnKM+Pvrz+GJk93nkLiCa5+39sKqxjfJc20Do0CEZGvAmJECiK+
	 E+01GxxokfjkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk55m2JRrz4xR5;
	Thu,  7 Nov 2024 00:05:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kselftest@vger.kernel.org>
Subject: [PATCH 3/5] selftests/powerpc: Fix 32-bit BE build errors on Ubuntu 24.04
Date: Thu,  7 Nov 2024 00:04:51 +1100
Message-ID: <20241106130453.1741013-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106130453.1741013-1-mpe@ellerman.id.au>
References: <20241106130453.1741013-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Starting with Ubuntu 24.04, building the selftests with the big endian
compiler (which defaults to 32-bit) fails with errors:

  stack_expansion_ldst.c:178:37: error: format '%lx' expects argument
  of type 'long unsigned int', but argument 2 has type 'rlim_t' {aka 'long long unsigned int'}
  subpage_prot.c:214:38: error: format '%lx' expects argument of type
  'long unsigned int', but argument 3 has type 'off_t' {aka 'long long int'}

Prior to 24.04 rlim_t was long unsigned int, and off_t was long int.

Cast to unsigned long long and long long before passing to printf to
avoid the errors.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c | 2 +-
 tools/testing/selftests/powerpc/mm/subpage_prot.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
index ed9143990888..9c0d343d7137 100644
--- a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
+++ b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
@@ -175,7 +175,7 @@ static int test(void)
 
 	page_size = getpagesize();
 	getrlimit(RLIMIT_STACK, &rlimit);
-	printf("Stack rlimit is 0x%lx\n", rlimit.rlim_cur);
+	printf("Stack rlimit is 0x%llx\n", (unsigned long long)rlimit.rlim_cur);
 
 	printf("Testing loads ...\n");
 	test_one_type(LOAD, page_size, rlimit.rlim_cur);
diff --git a/tools/testing/selftests/powerpc/mm/subpage_prot.c b/tools/testing/selftests/powerpc/mm/subpage_prot.c
index 3ae77ba93208..8cf9fd5fed1c 100644
--- a/tools/testing/selftests/powerpc/mm/subpage_prot.c
+++ b/tools/testing/selftests/powerpc/mm/subpage_prot.c
@@ -211,8 +211,8 @@ int test_file(void)
 		perror("failed to map file");
 		return 1;
 	}
-	printf("allocated %s for 0x%lx bytes at %p\n",
-	       file_name, filesize, fileblock);
+	printf("allocated %s for 0x%llx bytes at %p\n",
+	       file_name, (long long)filesize, fileblock);
 
 	printf("testing file map...\n");
 
-- 
2.47.0


