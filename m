Return-Path: <linuxppc-dev+bounces-407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27E95C3BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 05:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqlt95Nbdz2xHw;
	Fri, 23 Aug 2024 13:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724383761;
	cv=none; b=iCbUhGvzUijNWBOzyY0FHhpwCFvcpLfk/nvcbQR7e6aqmTvLZR8eVKJBkm+KcXuivrnDtebYI8m33gSu+GhBIyOO1oXwZgh/Q81RIErpzQHYM4gzHScaWPNWC0LwqG/E3knZJiLfxXr6EeePQfEI4IhhMfMEY4QKQc0zaAorHrpcYZQkXQX1KUT8dykyXCKwqMkbqNA1RV1LBlVpaWyukCq0TUj2Bn3TTRM/Rx7ZvPgXGI62t3TW2CJfCJm17USU26iTMbS15MqPSYzcWYr2DXPu9oGbKLoswHvmXItlBzsQTIcOF0pb63ggFuOskb3ScWbEZY80mLGSIwtS9ZKoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724383761; c=relaxed/relaxed;
	bh=UwiUf/lE/QN6VmFjJvqIifuS7XG63BjPJntvUyDQ2eI=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=KvtUNEjm4612Vev8qzu2gHKfdtpWGKJLVQZfMTbGtyEWYK/y8l/kvcB8eqvoFKTfkeSrbFt+fKFKdpCOPToEZuJEzYaCVSgvYEsREqErfKZTawnzUGQs0B0i6R1MnNKfJxi4wzXtXnHwaMhF0seSfP5+Q4dsbLmOMmPtP7YfM4W+Y96BYiP1HkDRz7O+eGcq/8kS1Muxs/Vzm5HtVU21kppF0yT6NRfWrR22LTUC9I9mxRlleD3LwasPo5UU71gi4ztzOsYg80M5cV3jQg2uoEbKkzZj7/DgBNUVPObJX4gSMc2VQSyzFZGu2vU+BUK4moLiQvUrzbl2w3Zr+zUPkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e12WwFMu; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e12WwFMu;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqlt86t2Vz2x9j
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 13:29:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724383759;
	bh=UwiUf/lE/QN6VmFjJvqIifuS7XG63BjPJntvUyDQ2eI=;
	h=From:To:Cc:Subject:Date:From;
	b=e12WwFMughRezPXDXk7bf+RTywRwBx9G6Jp8OBOqiR9u9u2nH6HrPoD109dJMewAd
	 0ecOxTzA0RsAUZ8UylTOlt0jk7d1QodM6sLJdjxhTNZZQqvmLodrNUy/TmPxdauRzt
	 iYfz7elNd9Wv2+n6/6uBKIhvBHY/yQ8nbv300pdTUCMtiQaHvFELA/auAB86nYSyNl
	 MhZEmoC5ivVoOVRYTGJNeZz7uIE/N4UG0qo8fNv5xwZ1NvC7XwkWuGKbQjEI3mr1Qu
	 9RPrfsMpVv9Bz8OZdiTvPKutA2FR7IMG8/zJyuanbr12gtmGqck5NrvYov5gWXtNgA
	 dpUczv+L9HtUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wqlt74mpVz4wbr;
	Fri, 23 Aug 2024 13:29:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <aneesh.kumar@kernel.org>
Subject: [PATCH 1/2] powerpc/mm/64s: Move THP reqs into a separate symbol
Date: Fri, 23 Aug 2024 13:29:10 +1000
Message-ID: <20240823032911.1238471-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the Kconfig symbols related to transparent hugepages (THP) under a
separate config symbol, separate from CONFIG_PPC_BOOK3S_64.

The new symbol is automatically enabled if CONFIG_PPC_BOOK3S_64 is
enabled, so there is no behaviour change, except for the existence of
the new PPC_THP symbol.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 4b0d7d4f88f6..9536e591c72a 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -84,11 +84,8 @@ config PPC_BOOK3S_64
 	bool "Server processors"
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
-	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
-	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
-	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select HAVE_MOVE_PMD
@@ -108,6 +105,13 @@ config PPC_BOOK3E_64
 
 endchoice
 
+config PPC_THP
+       def_bool y
+       depends on PPC_BOOK3S_64
+       select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+       select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+       select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+
 choice
 	prompt "CPU selection"
 	help
-- 
2.46.0


