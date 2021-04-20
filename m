Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890636512E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 06:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPVRP128lz309k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 14:03:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WAzcjt4G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WAzcjt4G; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPVQy2cwNz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:03:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPVQt5v9Kz9vDw;
 Tue, 20 Apr 2021 14:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618891401;
 bh=ykDn0c4Pei/ni8JeosESXjK9PStd/mFtGxVh8YrZKPo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WAzcjt4GF5woknj0LOcFLLaZXQt4dxoP7XPsbd7Tfc1ZG1omi42FFMVoV9nSFqQho
 Nm9HeadCpbCSiKDCzKxPEin83TkkOVRNfkkriIZRvLAzVPgdswB9tsavwJleQekRLX
 enavKzaRFnyMjr49Bu8x4BXaAh50ERXzYbqbZnasQSQJjlRWT8GT0o8YyeWj7yNT8H
 SAQkKiu9Z5cM3IrONxJBmovgdEC2V3CpOs3qXHVGyk37PLNqcK3YziP+GQJMOP3Um8
 uEqVHGZl6+7aGF0tu9EUML9m1weR+PZkuPR+Wlqofl74HscYVDBxO8zGG3CBwzRoKJ
 ca8b0iHu4Cymg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, brouer@redhat.com
Subject: Re: [PATCH 0/2] Change struct page layout for page_pool
In-Reply-To: <20210416230724.2519198-1-willy@infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
Date: Tue, 20 Apr 2021 14:03:18 +1000
Message-ID: <874kg1d2m1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com,
 linux-snps-arc@lists.infradead.org, netdev@vger.kernel.org,
 ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, mgorman@suse.de, mcroce@linux.microsoft.com,
 mhocko@kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> The first patch here fixes two bugs on ppc32, and mips32.  It fixes one
> bug on arc and arm32 (in certain configurations).  It probably makes
> sense to get it in ASAP through the networking tree.  I'd like to see
> testing on those four architectures if possible?

Sorry I don't have easy access to any hardware that fits the bill. At
some point I'll be able to go to the office and setup a machine that (I
think) can test these paths, but I don't have an ETA on that.

You and others seem to have done lots of analysis on this though, so I
think you should merge the fixes without waiting on ppc32 testing.

cheers


>
> The second patch enables new functionality.  It is much less urgent.
> I'd really like to see Mel & Michal's thoughts on it.
>
> I have only compile-tested these patches.
>
> Matthew Wilcox (Oracle) (2):
>   mm: Fix struct page layout on 32-bit systems
>   mm: Indicate pfmemalloc pages in compound_head
>
>  include/linux/mm.h       | 12 +++++++-----
>  include/linux/mm_types.h |  9 ++++-----
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  4 files changed, 29 insertions(+), 16 deletions(-)
>
> -- 
> 2.30.2
