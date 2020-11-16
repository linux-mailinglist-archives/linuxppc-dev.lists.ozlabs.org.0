Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 811022B4A40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:05:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZYn51fWwzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 03:04:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZYXq204HzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 02:54:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=esjCI1Ilt4rqIh2c5OoP0ZOCK5VTOQGHZkmINdOilPQ=; b=Q4mgMpkplmuw95hgWTQ6+BlRj0
 uOfRZMIJHzav9IdLwC9ckIxRZH15e/Co1SsDhx71QrzehPvueZMdwLuZ1KZdknOau65FGGiiVET/F
 k674UDf+BX9XAXwfweBX6RrGb0wnMobgxyGVWhWn2Igd8Tfpv+W+jOzeWYomchIgV22oso25aWqqo
 8820PqyIy+Vmqd565DZP4wURtlwH9RRPLr4G+rnDcvKr4srwnvbQFIzjlO0edrn/+Eb4WrTGIaBjx
 2VoTGfBHrYd9go23OLiaxnKfyx91LfkAAaXVjufE8rjE7o8sfYcW364KBUVgKn9VzLoiOq1tan+Ij
 7Hb74+tg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kegpQ-0001xk-GD; Mon, 16 Nov 2020 15:54:04 +0000
Date: Mon, 16 Nov 2020 15:54:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
Message-ID: <20201116155404.GD29991@casper.infradead.org>
References: <20201113111901.743573013@infradead.org>
 <20201116154357.bw64c5ie2kiu5l4x@box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116154357.bw64c5ie2kiu5l4x@box>
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
 catalin.marinas@arm.com, eranian@google.com, dave.hansen@intel.com,
 sparclinux@vger.kernel.org, will@kernel.org, mingo@kernel.org,
 kan.liang@linux.intel.com, linux-arch@vger.kernel.org, ak@linux.intel.com,
 aneesh.kumar@linux.ibm.com, alexander.shishkin@linux.intel.com,
 jolsa@redhat.com, npiggin@gmail.com, acme@kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 06:43:57PM +0300, Kirill A. Shutemov wrote:
> On Fri, Nov 13, 2020 at 12:19:01PM +0100, Peter Zijlstra wrote:
> > Hi,
> > 
> > These patches provide generic infrastructure to determine TLB page size from
> > page table entries alone. Perf will use this (for either data or code address)
> > to aid in profiling TLB issues.
> 
> I'm not sure it's an issue, but strictly speaking, size of page according
> to page table tree doesn't mean pagewalk would fill TLB entry of the size.
> CPU may support 1G pages in page table tree without 1G TLB at all.
> 
> IIRC, current Intel CPU still don't have any 1G iTLB entries and fill 2M
> iTLB instead.

It gets even more complicated with CPUs with multiple levels of TLB
which support different TLB entry sizes.  My CPU reports:

TLB info
 Instruction TLB: 2M/4M pages, fully associative, 8 entries
 Instruction TLB: 4K pages, 8-way associative, 64 entries
 Data TLB: 1GB pages, 4-way set associative, 4 entries
 Data TLB: 4KB pages, 4-way associative, 64 entries
 Shared L2 TLB: 4KB/2MB pages, 6-way associative, 1536 entries

I'm not quite sure what the rules are for evicting a 1GB entry in the
dTLB into the s2TLB.  I've read them for so many different processors,
I get quite confused.  Some CPUs fracture them; others ditch them entirely
and will look them up again if needed.

I think the architecture here is fine, but it'll need a little bit of
finagling to maybe pass i-vs-d to the pXd_leaf_size() routines, and x86
will need an implementation of pud_leaf_size() which interrogates the
TLB info to find out what size TLB entry will actually be used.
