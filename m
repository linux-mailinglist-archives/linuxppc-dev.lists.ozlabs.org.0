Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F02B4BD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:59:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZb052fjKzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 03:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=lEeB7IzB; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZZxZ1HdTzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 03:57:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vVmVS+ZLD4y6jfU+uTyXnLUroIERo1h2ZpfnRA9jMKc=; b=lEeB7IzByDr301YPeJ40VBxNvA
 CtrkOR9QCt3ARajDnOfqwNHdM5ieJEShyAB05oqrbEOfSoQmGLpyInWcjIUwCdHS+CqhwQNX5AFwq
 sJM6ZL685xdaGd3dj8fB3568d9YRcoWUa2yyw1rxpN0qQZlcPqAPr9p1DaHZEuYsUN/0onJJ8g5/p
 zviV3Oo9s73aXyrWzOa2FmL8zFShtC7st/xxEwPa1/MTcren+Z34TdPqL+13orQGhyGCwwxNuiPA7
 HCZiTKZh+47wdY6GZ+pKgqrivXu3IKb6KDlxju1SqLdbkEsg+QyQv1NVGga/0MnXPI52fdzgXIK4Q
 qZRj+aSA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehoS-0006Im-E5; Mon, 16 Nov 2020 16:57:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6DF3F301959;
 Mon, 16 Nov 2020 17:57:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5976F20282DFC; Mon, 16 Nov 2020 17:57:07 +0100 (CET)
Date: Mon, 16 Nov 2020 17:57:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
Message-ID: <20201116165707.GI3121392@hirez.programming.kicks-ass.net>
References: <20201113111901.743573013@infradead.org>
 <20201116154357.bw64c5ie2kiu5l4x@box>
 <20201116155404.GD29991@casper.infradead.org>
 <eeec67f6-ea05-1115-f249-b6cdcf2c5e2c@intel.com>
 <20201116163213.GG29991@casper.infradead.org>
 <3f2239fe-367a-16de-fcb5-543d39f34c22@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f2239fe-367a-16de-fcb5-543d39f34c22@intel.com>
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
Cc: mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 catalin.marinas@arm.com, eranian@google.com, sparclinux@vger.kernel.org,
 will@kernel.org, mingo@kernel.org, kan.liang@linux.intel.com,
 linux-arch@vger.kernel.org, ak@linux.intel.com, aneesh.kumar@linux.ibm.com,
 Matthew Wilcox <willy@infradead.org>, jolsa@redhat.com, npiggin@gmail.com,
 acme@kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 08:36:36AM -0800, Dave Hansen wrote:
> On 11/16/20 8:32 AM, Matthew Wilcox wrote:
> >>
> >> That's really the best we can do from software without digging into
> >> microarchitecture-specific events.
> > I mean this is perf.  Digging into microarch specific events is what it
> > does ;-)
> 
> Yeah, totally.

Sure, but the automatic promotion/demotion of TLB sizes is not visible
if you don't know what you startd out with.

> But, if we see a bunch of 4k TLB hit events, it's still handy to know
> that those 4k TLB hits originated from a 2M page table entry.  This
> series just makes sure that perf has the data about the page table
> mapping sizes regardless of what the microarchitecture does with it.

This. 
