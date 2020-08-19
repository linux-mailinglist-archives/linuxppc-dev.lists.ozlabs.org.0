Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8A2492CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:17:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWdr6xNxzDq9n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:17:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBT6f2VzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cWzwY3HW; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBT5nFvz9sPC; Wed, 19 Aug 2020 11:57:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBT4NxRz9sTg; Wed, 19 Aug 2020 11:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802257;
 bh=rNa4O4vXEy6JD2X3ZVrqL1CEBgHUoFIHyMwiNZo7m/o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cWzwY3HWyZqydlMIefGXQpbVFNNWKw0UdTR36zVX5vfNw5ARTT4aeG7xnt0CQvM49
 24PJ2IaTGefopgpC1JOwt+xCPmw1AYvCnEbJB45YYwi+qbZ8E/XyfC7DlDVL1gmFja
 vwHxwvTk2RZRU4pLO7VUjsLw2jb5lf8KowhY2oHzRcQycbkAi11x+qntPowgVkLFfn
 A68JtZOUNVC5nRtsoNnfEB0edlDWKuUgA0CKjS1gkAe0adJ7nTF8cZ4u+z+yjamVTe
 lYoE/hJn8x1+Ohrf6gsNiuxFM82FfGGnRVTxL/akWUdbLWRQ4Hi12OAPA5jKgmOrHy
 eeqxw0FVa250w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 7/9] selftests/powerpc: Skip L3 bank test on older CPUs
Date: Wed, 19 Aug 2020 11:57:25 +1000
Message-Id: <20200819015727.1977134-7-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a test of specific piece of logic in isa207-common.c, which is
only used on Power8 or later. So skip it on older CPUs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/pmu/l3_bank_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/l3_bank_test.c b/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
index a96d512a18c4..a5dfa9bf3b9f 100644
--- a/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
+++ b/tools/testing/selftests/powerpc/pmu/l3_bank_test.c
@@ -20,6 +20,9 @@ static int l3_bank_test(void)
 	char *p;
 	int i;
 
+	// The L3 bank logic is only used on Power8 or later
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	p = malloc(MALLOC_SIZE);
 	FAIL_IF(!p);
 
-- 
2.25.1

