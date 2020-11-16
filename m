Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8682B4BD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:57:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZZxm0pzhzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 03:57:32 +1100 (AEDT)
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
 header.s=casper.20170209 header.b=sCjdaAN7; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZZvM3sXBzDqH5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 03:55:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qwpmaY+3FLIw2My8lpkirBu6QWcmDVtCZWX9oSsd5pI=; b=sCjdaAN7YgUfR5Na4/L2rwidiM
 15tIgEAD8fxyHNfjXSLVkszMh4VTvOdC4da0kQq33F5KN4YSPiZ1pNJ9L3rNDo7hadHux4HVGEMek
 gK6TmC0vH1duDtKuQzo1ZYcV7W6fvsORpiGDSkx6N/FLHn6JtiFfK079qdGhTFdukuBnFzojnMJEG
 soexUqk6dXlXrsFdSZ0FCimGpoCbHwE4Er09GJ3Cs7tnhIyuNpJXdhi3Fp9CJDQA/FmtXMCTtp2Bh
 YPYI07+Be6K6ArB4N8yV3nsqZFzjHUdnpniYgtCJxv2v3RU7k1q3I0QDvlbvjYpcQLy1IaBJccdYa
 3w3WYxuw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehmU-0006C5-2F; Mon, 16 Nov 2020 16:55:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3D864301959;
 Mon, 16 Nov 2020 17:55:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 28BB820282DFC; Mon, 16 Nov 2020 17:55:04 +0100 (CET)
Date: Mon, 16 Nov 2020 17:55:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
Message-ID: <20201116165504.GH3121392@hirez.programming.kicks-ass.net>
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
> 
> Anyway, the changelog should probably replace:

ARM64 does too.

> > This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate TLB
> > page sizes.
> 
> with something more like:
> 
> This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate page
> table mapping sizes.

Sure.
