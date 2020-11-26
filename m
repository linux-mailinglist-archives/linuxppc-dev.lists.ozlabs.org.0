Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B70042C551F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:17:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChdbP5VnWzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=Lw6hAfjP; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdLl2B8NzDqBS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:06:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vWy2uVCVHBnrbbz4T9jkHvT2JpJLs0e2xYDM8OJOhBs=; b=Lw6hAfjPDtWO3vimDZtY1m8XyC
 00uoIq50O8sIFFWmkHIPvCzOm9l5Ak0REO4uPn/bffe1rzsVCMbeM3jyrYQNZf6K8oB5NNEtBUtZn
 PQExLFvY1UXCnvO6QhiAyTWvyn3HrOQQz14rnj+qNfezyNty8Yv5NX0piJYgDhWwWzGvxFRyge2UC
 Pmp40Y9h/xGuT8HHJTP4lPeN/8I773CmHi0WWFmfSwm0HbofpDYElV4OtNHOroG1p5qVFDBfnEwBP
 MxuKUj259aaEOTEAIR+i7RQApABVchScWdQWGMqxU0jp/tySoP79afuH5g/GVy+NAkj3TeQlJXYYD
 5kZhH14Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyb-0007yR-O0; Thu, 26 Nov 2020 13:06:21 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2C1D33059DE;
 Thu, 26 Nov 2020 14:06:20 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E5BAD201E691E; Thu, 26 Nov 2020 14:06:19 +0100 (CET)
Date: Thu, 26 Nov 2020 14:06:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 3/6] perf/core: Fix arch_perf_get_page_size()
Message-ID: <20201126130619.GI2414@hirez.programming.kicks-ass.net>
References: <20201126120114.071913521@infradead.org>
 <20201126121121.164675154@infradead.org>
 <20201126123458.GO4327@casper.infradead.org>
 <20201126124207.GM3040@hirez.programming.kicks-ass.net>
 <20201126125606.GR4327@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126125606.GR4327@casper.infradead.org>
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
Cc: mark.rutland@arm.com, aneesh.kumar@linux.ibm.com,
 linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 alexander.shishkin@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 davem@davemloft.net, dave.hansen@intel.com, ak@linux.intel.com,
 eranian@google.com, sparclinux@vger.kernel.org, jolsa@redhat.com,
 mingo@kernel.org, kirill.shutemov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 26, 2020 at 12:56:06PM +0000, Matthew Wilcox wrote:
> On Thu, Nov 26, 2020 at 01:42:07PM +0100, Peter Zijlstra wrote:
> > +	pgdp = pgd_offset(mm, addr);
> > +	pgd = READ_ONCE(*pgdp);
> 
> I forget how x86-32-PAE maps to Linux's PGD/P4D/PUD/PMD scheme, but
> according to volume 3, section 4.4.2, PAE paging uses a 64-bit PDE, so
> whether a PDE is a PGD or a PMD, we're only reading it with READ_ONCE
> rather than the lockless-retry method used by ptep_get_lockless().
> So it's potentially racy?  Do we need a pmdp_get_lockless() or
> pgdp_get_lockless()?

Oh gawd... this isn't new here though, right? Current gup_fast also gets
that wrong, if it is in deed wrong.

I suppose it's a race far more likely today, with THP and all, than it
ever was back then.
