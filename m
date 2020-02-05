Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D015314A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 13:55:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CM4W6R14zDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 23:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CM1M3CdYzDq8X
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 23:53:09 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 015CppFf030570;
 Wed, 5 Feb 2020 06:51:51 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 015Cpn3x030569;
 Wed, 5 Feb 2020 06:51:49 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 5 Feb 2020 06:51:49 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 10/10] mm/memory_hotplug: Cleanup __remove_pages()
Message-ID: <20200205125149.GS22482@gate.crashing.org>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-11-david@redhat.com> <20200204094652.GE6494@linux>
 <5d698f94-af18-0714-bc97-14b6c520572c@redhat.com>
 <20200204131353.GJ22482@gate.crashing.org>
 <0e2f700c-b01b-8c16-99c2-2648967fc203@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e2f700c-b01b-8c16-99c2-2648967fc203@redhat.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Wei Yang <richardw.yang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 04, 2020 at 02:38:51PM +0100, David Hildenbrand wrote:
> On 04.02.20 14:13, Segher Boessenkool wrote:
> > On Tue, Feb 04, 2020 at 01:41:06PM +0100, David Hildenbrand wrote:
> >> It's a pattern commonly used in compilers and emulators to calculate the
> >> number of bytes to the next block/alignment. (we're missing a macro
> >> (like we have ALIGN_UP/IS_ALIGNED) for that - but it's hard to come up
> >> with a good name (e.g., SIZE_TO_NEXT_ALIGN) .

> > You can just write the easy to understand
> > 
> >   ...  ALIGN_UP(x) - x  ...
> 
> you mean
> 
> ALIGN_UP(x, PAGES_PER_SECTION) - x
> 
> but ...
> 
> > which is better *without* having a separate name.  Does that not
> > generate good machine code for you?
> 
> 1. There is no ALIGN_UP. "SECTION_ALIGN_UP(x) - x" would be possible

Erm, you started it ;-)

> 2. It would be wrong if x is already aligned.
> 
> e.g., let's use 4096 for simplicity as we all know that value by heart
> (for both x and the block size).
> 
> a) -(4096 | -4096) -> 4096
> 
> b) #define ALIGN_UP(x, a) ((x + a - 1) & -(a))
> 
> ALIGN_UP(4096, 4096) - 4096 -> 0
> 
> Not as easy as it seems ...

If you always want to return a number >= 1, it it simply
  ALIGN_UP(x + 1) - x
(and replace 1 by any other minimum size required).  This *also* is
easy to read, without having to have any details (and quirks :-/ )
of those utility functions memorised.


Segher
