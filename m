Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C078373F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 03:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F1xtJhYN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVBDL5qjmz3c1B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 11:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVBCQ0Yf9z2y1f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 11:12:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+oF89Epzp8rU2t09SgoDNvxKdBu+3pJgx9pUxaygLvw=; b=F1xtJhYNk1h4XTTrv3ReqmxINp
	HieC3af3Dt1HbMRvxABAWnREuGbWuCwyJyu3kgI/UdhgQrfgjG4k/9czTB8V6ysaHIw5iqGhorsDR
	JqoPNj03GX8z1Zv5AWoHBUaiO4lK1ul0GbEVgO59JUMFAoF80j1P3CCVv5nnsQfICWeMjAyE2+TOz
	vsLdWt+UdO3JrQ/r2cR4h3YXBt1gcgKoWZfmMIBSXmNvxDIVY7j/RpSnc/R1Q9bk+6KkovLKFcber
	e5YqtoSejVN8bTTsUSg5C7ZD+c3ZUTdPOqgPfNtjRRgLtCWsE6U7iU7evix+U2LrrG20dGlEeycjv
	vkpKvMQg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYFvs-00DRWs-DD; Tue, 22 Aug 2023 01:11:44 +0000
Date: Tue, 22 Aug 2023 02:11:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZOQLUMBB7amLUJLY@casper.infradead.org>
References: <20230822095537.500047f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822095537.500047f7@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 09:55:37AM +1000, Stephen Rothwell wrote:
> In file included from include/trace/trace_events.h:27,
>                  from include/trace/define_trace.h:102,
>                  from fs/xfs/xfs_trace.h:4428,
>                  from fs/xfs/xfs_trace.c:45:
> include/linux/pgtable.h:8:25: error: initializer element is not constant
>     8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)

Ummm.  PowerPC doesn't have a compile-time constant PMD size?

arch/powerpc/include/asm/book3s/64/pgtable.h:#define PMD_SHIFT  (PAGE_SHIFT + PTE_INDEX_SIZE)
arch/powerpc/include/asm/book3s/64/pgtable.h:#define PTE_INDEX_SIZE  __pte_index_size

That's really annoying.  I'll try to work around it.

