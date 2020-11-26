Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B82C5727
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 15:33:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChgGL5r0jzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 01:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ZNRZ5ap4; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdqV21d9zDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:28:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ari7OxjV4+Br2gS6ab2HYMH0icZaForhuiN0IThPPRE=; b=ZNRZ5ap4VyQbiLbNa1RUTGJwN5
 pR0gi5S50T2EEZPWjQfdgNR9UuBWj6ykPj8qNUMYU04BN4J3JnYaSre8Ic/lx0nh12yVbfwwof/rC
 gKhkpYICZMheAiORuQvHe3xlNt6r91V6ChC4GqnN/na/SmgBQJpV0HkiUubvvG6DcaFmvvQRy0bOz
 HbeaIHCFEzSbmLUOutek9CKHtdSPJ+pmvNZs1wNKu/0fQgwRQGRp7vaTdQU5r0PVNpbB76liiLBrI
 ozNke1HR4/CGq0eiV6ZLqwDlRnU04p26lsTwI08fJvp8rAfTT4b8e5ozvpD+KhRdgnFemuuBGHwaY
 gbS2ukCg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kiHJL-0005zK-E4; Thu, 26 Nov 2020 13:27:47 +0000
Date: Thu, 26 Nov 2020 13:27:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 3/6] perf/core: Fix arch_perf_get_page_size()
Message-ID: <20201126132747.GS4327@casper.infradead.org>
References: <20201126120114.071913521@infradead.org>
 <20201126121121.164675154@infradead.org>
 <20201126123458.GO4327@casper.infradead.org>
 <20201126124207.GM3040@hirez.programming.kicks-ass.net>
 <20201126125606.GR4327@casper.infradead.org>
 <20201126130619.GI2414@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126130619.GI2414@hirez.programming.kicks-ass.net>
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

On Thu, Nov 26, 2020 at 02:06:19PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 26, 2020 at 12:56:06PM +0000, Matthew Wilcox wrote:
> > On Thu, Nov 26, 2020 at 01:42:07PM +0100, Peter Zijlstra wrote:
> > > +	pgdp = pgd_offset(mm, addr);
> > > +	pgd = READ_ONCE(*pgdp);
> > 
> > I forget how x86-32-PAE maps to Linux's PGD/P4D/PUD/PMD scheme, but
> > according to volume 3, section 4.4.2, PAE paging uses a 64-bit PDE, so
> > whether a PDE is a PGD or a PMD, we're only reading it with READ_ONCE
> > rather than the lockless-retry method used by ptep_get_lockless().
> > So it's potentially racy?  Do we need a pmdp_get_lockless() or
> > pgdp_get_lockless()?
> 
> Oh gawd... this isn't new here though, right? Current gup_fast also gets
> that wrong, if it is in deed wrong.
> 
> I suppose it's a race far more likely today, with THP and all, than it
> ever was back then.

Right, it's not new.  I wouldn't block this patchset for that fix.
Just want to get the problem on your radar ;-)  I just never reviewed
the gup fast codepath before, and this jumped out at me.
