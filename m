Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80603362BC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 01:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMX212zgDz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 09:08:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lxU48mq4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMX1W0sWZz309c
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 09:07:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mbIW7FDOiEKRuwEXnsOYQIYqDQHUf6UllHx7WSCAIjI=; b=lxU48mq458bF7JV1aZ6L3Zo2UR
 I585HQrHxlGeweJsLkRKCYSCqoFhHxnYj7gGJ39liWPLTQfWA2ajmWmKMkjA3Z0VTIOSaFEWoqv+g
 ksAAAbmBr7Y58UiFpMY9kGMNAA7SSWLAld8PZaACTYfsZKQ0YTQLayBMcepZBZpoQfoixfm1eQJzi
 9JPDz6/LgxP88bdj+7aikBJTkOBO4kN5ye3LclnZjCY9axF+/s3S+7ev/MqsAbrxEYieXycizyc6g
 hQU35iOkWcVessGC+PK9aR+/kafdQoaygcZji5k3N5WJfQmWMMYu40YcWG69i1HQUBftuOxgDpZpA
 l+QkiMeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXXYb-00AZO9-Jr; Fri, 16 Apr 2021 23:07:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: brouer@redhat.com
Subject: [PATCH 0/2] Change struct page layout for page_pool
Date: Sat, 17 Apr 2021 00:07:22 +0100
Message-Id: <20210416230724.2519198-1-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mips@vger.kernel.org,
 mhocko@kernel.org, linux-mm@kvack.org, mgorman@suse.de,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first patch here fixes two bugs on ppc32, and mips32.  It fixes one
bug on arc and arm32 (in certain configurations).  It probably makes
sense to get it in ASAP through the networking tree.  I'd like to see
testing on those four architectures if possible?

The second patch enables new functionality.  It is much less urgent.
I'd really like to see Mel & Michal's thoughts on it.

I have only compile-tested these patches.

Matthew Wilcox (Oracle) (2):
  mm: Fix struct page layout on 32-bit systems
  mm: Indicate pfmemalloc pages in compound_head

 include/linux/mm.h       | 12 +++++++-----
 include/linux/mm_types.h |  9 ++++-----
 include/net/page_pool.h  | 12 +++++++++++-
 net/core/page_pool.c     | 12 +++++++-----
 4 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.30.2

