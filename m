Return-Path: <linuxppc-dev+bounces-406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263B95C3B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 05:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqlt94ywwz2xGC;
	Fri, 23 Aug 2024 13:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724383761;
	cv=none; b=SbE0JadinrjwwTMw8S/t7r7lwxQKspxoyf+RgchemkEX0M8PJ2e5OZwPt/M58msx+f7sN3ZQJhuIWszWK7S/ifmqqPnBTRtLdHnafV5iMN44lBZX8LFPpByod7P+n/5CLim9NCoFFIJywqrkKFMoxL6gSGPJ+17CU56bFIxLO+uWykTSBylbUOX5KM2qGnvljYI6wEuDLaYhek9OlWgS3mX1AKtYTmaBnCxbmKhv7vkbzLn+k2Q6pnaPPwZnCa8FOW7DAmSuWKAkGR/GogGs633iQbatvbuECORv7s9yuYTj81CikqVOh0NA/dan/FEP9rLSwiYWS/uroFmqNKICUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724383761; c=relaxed/relaxed;
	bh=rnru/sj8N5M7bo+WMhfp95Kl1rj+77CQDkMYbzW34+k=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=fz6gkOYvK7DfjyxQnfNeCRRZSbKgmmD2SFuj6VmUdhlNcU6IM3XbtdNTj+w8p2d+sQx/nk8aQBGZu4fEb5KORVDq2j2+wpvLpHu7iPL7/5OqIAVhG2ozBa4xPfn425QNTJbQBkde4hN1xdGHfJ1gmTNDxuhnOVAzV/yGfG/A7Kwkh3CUsnTHMq0ufk6iGfzQngYzGaXzsNd3YzWRFXCUNITgfgfwk35/JWsqrkJpxyuzh8IRA+6T2jsLxFyQgKz/oGO024Iv0GgImZiKcIUjG07j0gGN6onhPw0KHT4DN6r10eWWm5BSBm506dH5ouUnVJOdfKZF/NxB70LiRsbY/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQAGpNRu; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQAGpNRu;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqlt86XYtz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 13:29:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724383760;
	bh=rnru/sj8N5M7bo+WMhfp95Kl1rj+77CQDkMYbzW34+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQAGpNRuvsAl86G87R0L7kCEUiD0KmuqbO9bxT7pGnQFhoQG2/J/FLb50DTAITH/G
	 5CE8OBPv/MePM+QWoSnCwSJYiES8IjJxzldtj9AKs831cn0O6S9dnoNa3exzrhY5lB
	 UXBvrMjQ9WT4kaN+6enil6VLlpyhWCn/tph1utfSs984xqQ28AS49mUe8w6F8irC1S
	 JJpR4sxCudmg3eoOujQ8E3BORWFIMnLTshEgtcVNPzgmc4jFy7y1utoa5d8pRWguzi
	 RJvr1JKzKNNt3cDqEOlCpqUQFlP8DCODe2COUwrCfYVuLILJzA0xvGmchpeaAmtnbZ
	 avaDHgvqjVNKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wqlt81G18z4x87;
	Fri, 23 Aug 2024 13:29:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <aneesh.kumar@kernel.org>
Subject: [PATCH 2/2] powerpc/mm/64s: Restrict THP to Radix or HPT w/64K pages
Date: Fri, 23 Aug 2024 13:29:11 +1000
Message-ID: <20240823032911.1238471-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823032911.1238471-1-mpe@ellerman.id.au>
References: <20240823032911.1238471-1-mpe@ellerman.id.au>
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

Transparent hugepages (THP) are not supported when using the Hash Page
Table (HPT) MMU with 4K pages.

Currently a HPT-only 4K kernel still allows THP to be enabled, which
is misleading.

Add restrictions to the PPC_THP symbol so that if the kernel is
configured with 4K pages and only the HPT MMU (no Radix), then THP is
disabled.

Note that it's still possible to build a combined Radix/HPT kernel with 4K
pages, which does allow THP to be enabled at build time. As such the HPT
code still needs to provide some THP related symbols, to allow the build
to succeed, but those code paths are never run. See the stubs in
arch/powerpc/include/asm/book3s/64/hash-4k.h.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 9536e591c72a..1453ccc900c4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -108,6 +108,7 @@ endchoice
 config PPC_THP
        def_bool y
        depends on PPC_BOOK3S_64
+       depends on PPC_RADIX_MMU || (PPC_64S_HASH_MMU && PAGE_SIZE_64KB)
        select HAVE_ARCH_TRANSPARENT_HUGEPAGE
        select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
        select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
-- 
2.46.0


