Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DD82B4B3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:34:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZZQg1XmSzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 03:34:03 +1100 (AEDT)
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
 header.s=casper.20170209 header.b=MJkQpTrW; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZZNr0jJhzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 03:32:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iB0y9J1IMDI66YKSWITVEM2aiz/Z5fCZJNJJPMLMkso=; b=MJkQpTrW56osExBi/dMXVJnpIw
 NIlim9BCJT5F5tgyRdOgmQc+boPZNK9p2apNt7gPcoXA8jA0ovSWzSY10zPEiqSr3+oMaxVZb70AP
 oE1d8y1M8GC1BVl1Wrgr8+EiIX5BHNeGxGVFYf5OwmuUoHZ5G+9NE3FNqws2aN4aXapXlr3S1WyFf
 MbxONtk+/fXp/gZ91aXIK4qBADADnY8JNHkvgF+q4Ey3/9x69E8S246Qfv4I+hyERDvT2eZjzBth0
 O8m5XecVDdfXHdAapE9jDEwN00NEgE6m/+zq3aerrhQasuizLEzJYlqT7tFfNyF4+14x1giM/kFn9
 KoCNtN9w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kehQL-0004lE-3b; Mon, 16 Nov 2020 16:32:13 +0000
Date: Mon, 16 Nov 2020 16:32:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
Message-ID: <20201116163213.GG29991@casper.infradead.org>
References: <20201113111901.743573013@infradead.org>
 <20201116154357.bw64c5ie2kiu5l4x@box>
 <20201116155404.GD29991@casper.infradead.org>
 <eeec67f6-ea05-1115-f249-b6cdcf2c5e2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeec67f6-ea05-1115-f249-b6cdcf2c5e2c@intel.com>
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
Cc: mark.rutland@arm.com, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, eranian@google.com, sparclinux@vger.kernel.org,
 will@kernel.org, mingo@kernel.org, kan.liang@linux.intel.com,
 linux-arch@vger.kernel.org, ak@linux.intel.com, aneesh.kumar@linux.ibm.com,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com, npiggin@gmail.com,
 acme@kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 08:28:23AM -0800, Dave Hansen wrote:
> On 11/16/20 7:54 AM, Matthew Wilcox wrote:
> > It gets even more complicated with CPUs with multiple levels of TLB
> > which support different TLB entry sizes.  My CPU reports:
> > 
> > TLB info
> >  Instruction TLB: 2M/4M pages, fully associative, 8 entries
> >  Instruction TLB: 4K pages, 8-way associative, 64 entries
> >  Data TLB: 1GB pages, 4-way set associative, 4 entries
> >  Data TLB: 4KB pages, 4-way associative, 64 entries
> >  Shared L2 TLB: 4KB/2MB pages, 6-way associative, 1536 entries
> 
> It's even "worse" on recent AMD systems.  Those will coalesce multiple
> adjacent PTEs into a single TLB entry.  I think Alphas did something
> like this back in the day with an opt-in.

I debated mentioning that ;-)  We can detect in software whether that's
_possible_, but we can't detect whether it's *done* it.  I heard it
sometimes takes several faults on the 4kB entries for the CPU to decide
that it's beneficial to use a 32kB TLB entry.  But this is all rumour.

> Anyway, the changelog should probably replace:
> 
> > This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate TLB
> > page sizes.
> 
> with something more like:
> 
> This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate page
> table mapping sizes.
> 
> That's really the best we can do from software without digging into
> microarchitecture-specific events.

I mean this is perf.  Digging into microarch specific events is what it
does ;-)
