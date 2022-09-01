Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4225A8B27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 04:02:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ47V5Qmsz3bk0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 12:02:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dOtg9Uks;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ46x1ffbz2xH0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 12:02:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dOtg9Uks;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJ46x0kyBz4xDH;
	Thu,  1 Sep 2022 12:02:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661997737;
	bh=Ay6D7ccrVj97IQBvkYrJvhZe9pUEOpAoZjWvhMPw6qE=;
	h=From:To:Subject:Date:From;
	b=dOtg9UksR9X95BXEI6ISrjaq/8Es3icN8wwyv6kPXbR9ia7Kse157Zir3miBm2ByG
	 gmqqKloGX3Mu0Ni8nmepdZ9QA89mzLr/4w//6o9SXebIUIkN7reiROq+rSvuLD3kt/
	 49YLjLTIImvS11jqieqTQlpZB9LwQFSMeT1gMtuRvGDJTWN2Olx6WEEljVAeD1hKQs
	 WNDzLR8nDwBNUjBqw4wO4PbX0eD5y8WGX7YF+0nsHMYWaX/n8fwlep+L3mk8QqRxYl
	 iJXuScBY3JooJNXI/U6BmuOV7ds6GOKrwChcLxGsSUSJr8l6MdebiwIsFaYRO2lO0a
	 pnRj5ff68af7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Skip 4PB test on 4K PAGE_SIZE systems
Date: Thu,  1 Sep 2022 12:02:15 +1000
Message-Id: <20220901020215.254097-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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

Systems using the hash MMU with a 4K page size don't support 4PB address
space, so skip the test because the bug it tests for can't be triggered.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c b/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c
index 927bfae99ed9..7da515f1da72 100644
--- a/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c
+++ b/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c
@@ -112,6 +112,8 @@ static int test(void)
 	// This tests a hash MMU specific bug.
 	FAIL_IF(using_hash_mmu(&hash_mmu));
 	SKIP_IF(!hash_mmu);
+	// 4K kernels don't support 4PB address space
+	SKIP_IF(sysconf(_SC_PAGESIZE) < 65536);
 
 	page_size = sysconf(_SC_PAGESIZE);
 
-- 
2.37.2

