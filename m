Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372530A7F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 13:50:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTnph5CbLzDqBg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 23:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=m7ji0VO1; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTnhp1QYLzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 23:44:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iS8iy+q7Izh8AM4pbDoHtBgYLQUACj4slse1odTb8Xw=; b=m7ji0VO1MSn1lX6BI0jJ/Yb9pR
 9LbSnyqEyG+WShVFDi6LLpOxh725y4TN5ZOzvkdZzaqe2VLLrMyA0w5DmjmAmnD9zsr9kHInq0sjB
 ii38K9XKQhFn7sOI40UlVOovRxxAgm9h9jejp9eCBLKegUodvH0TprmeRQ27HIdL/dZ9Y9TeAXH+T
 AH4kD9PgJxscyRe30c+nsFbhAUZbIF86CVRIvrNnDHqiAHo82ZC5vwPaZdUNJSPPkp0ldDsBPBc8P
 BJXcBzycInlMsr0+a7N0JA8WObI/EMjH6YDE79gmnKGPIcRn4F4Lq0ejsbhou5qIjm5vd3EqnQ2UW
 /oN5DJpg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6YZH-00Dm54-Iu; Mon, 01 Feb 2021 12:44:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7D8C9303A02;
 Mon,  1 Feb 2021 13:44:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 65B2620C8E303; Mon,  1 Feb 2021 13:44:34 +0100 (CET)
Date: Mon, 1 Feb 2021 13:44:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
Message-ID: <YBf3sl3M+j3hJRoM@hirez.programming.kicks-ass.net>
References: <20210131001132.3368247-1-namit@vmware.com>
 <1612063149.2awdsvvmhj.astroid@bobo.none>
 <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 31, 2021 at 07:57:01AM +0000, Nadav Amit wrote:
> > On Jan 30, 2021, at 7:30 PM, Nicholas Piggin <npiggin@gmail.com> wrote:

> > I'll go through the patches a bit more closely when they all come 
> > through. Sparc and powerpc of course need the arch lazy mode to get 
> > per-page/pte information for operations that are not freeing pages, 
> > which is what mmu gather is designed for.
> 
> IIUC you mean any PTE change requires a TLB flush. Even setting up a new PTE
> where no previous PTE was set, right?

These are the HASH architectures. Their hardware doesn't walk the
page-tables, but it consults a hash-table to resolve page translations.

They _MUST_ flush the entries under the PTL to avoid ever seeing
conflicting information, which will make them really unhappy. They can
do this because they have TLBI broadcast.

There's a few more details I'm sure, but those seem to have slipped from
my mind.
