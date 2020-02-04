Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2C15140A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 02:48:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BSJk45PszDqQ0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 12:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=IWzFutDt; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BSH66WDTzDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 12:46:57 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D90E20732;
 Tue,  4 Feb 2020 01:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580780815;
 bh=L7qyiSaKYCSiXFTQrei6zHPTHLJYHqYmnQdeCSNYJUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IWzFutDti1oCSWF1rKXWbGepy5r6blJTGBSX9wsjZ0oqHgkfm4NxusQXKFZZqkXS4
 NPCAIbBhdT0BVAZ8ppji0sqcwu4XIHKjpjrvicl1df/vB4ckh6YRbrrE3EDakSdqrT
 RtE2FA9knl1TQs3a2jK8E9n8CkAtByewbWYTl5bY=
Date: Mon, 3 Feb 2020 17:46:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 00/10] mm/memory_hotplug: Shrink zones before
 removing memory
Message-Id: <20200203174653.74630ef5744c68be55374b0d@linux-foundation.org>
In-Reply-To: <f7ed4448-8f41-599d-4689-914eeaf84d6d@redhat.com>
References: <20191006085646.5768-1-david@redhat.com>
 <ac27f0e1-26e9-dfc1-3ee1-cbee7ad847bf@redhat.com>
 <20191203133633.GA2600@linux>
 <20200130204043.29e21049775e3a637db733e0@linux-foundation.org>
 <f7ed4448-8f41-599d-4689-914eeaf84d6d@redhat.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Pankaj Gupta <pagupta@redhat.com>,
 Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, Rich Felker <dalias@libc.org>,
 Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Tony Luck <tony.luck@intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve Capper <steve.capper@arm.com>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 31 Jan 2020 10:18:34 +0100 David Hildenbrand <david@redhat.com> wrote:

> On 31.01.20 05:40, Andrew Morton wrote:
> > On Tue, 3 Dec 2019 14:36:38 +0100 Oscar Salvador <osalvador@suse.de> wrote:
> > 
> >> On Mon, Dec 02, 2019 at 10:09:51AM +0100, David Hildenbrand wrote:
> >>> @Michal, @Oscar, can some of you at least have a patch #5 now so we can
> >>> proceed with that? (the other patches can stay in -next some time longer)
> >>
> >> Hi, 
> >>
> >> I will be having a look at patch#5 shortly.
> >>
> >> Thanks for the reminder
> > 
> > Things haven't improved a lot :(
> > 
> > mm-memmap_init-update-variable-name-in-memmap_init_zone.patch
> > mm-memory_hotplug-poison-memmap-in-remove_pfn_range_from_zone.patch
> > mm-memory_hotplug-we-always-have-a-zone-in-find_smallestbiggest_section_pfn.patch
> > mm-memory_hotplug-dont-check-for-all-holes-in-shrink_zone_span.patch
> > mm-memory_hotplug-drop-local-variables-in-shrink_zone_span.patch
> > mm-memory_hotplug-cleanup-__remove_pages.patch
> > 
> > The first patch has reviews, the remainder are unloved.
> 
> Trying hard not to rant about the review mentality on this list, but I'm
> afraid I can't totally bite my tongue ... :)
> 
> Now, this is an uncomfortable situation for you and me. You have to ping
> people about review and patches are stuck in your tree. I have a growing
> list of patches that are somewhat considered "done", but well,
> not-upstream-at-all. I have patches that are long in RHEL and were
> properly tested, but could get dropped any time because -ENOREVIEW.
> 
> Our process nowadays seems to be, to only upstream what has an ACK/RB
> (fixes/features/cleanups).

Yes, we've been doing this for a couple of years now.  I make an
exception for Vitaly's zswap patches because he appears to be the only
person who knows the code (since Harry's internship ended).

I think this is the first time we've hit a significant logjam. 
Presumably the holiday season contributed to this.

It isn't clear to me that we've gained much from this policy.  But
until this cycle I've seen little harm.

> I can understand this is desirable (yet, I am
> not sure if this makes sense with the current take-and-not-give-back
> review mentality on this list).
> 
> Although it will make upstreaming stuff *even harder* and *even slower*,
> maybe we should start to only queue patches that have an ACK/RB, so they
> won't get blocked by this later on? At least that makes your life easier
> and people won't have to eventually follow up on patches that have been
> in linux-next for months.

The merge rate would still be the review rate, but the resulting merges
would be of less tested code.

> Note: the result will be that many of my patches will still not get
> reviewed, won't get queued/upstreamed, I will continuously ping and
> resend, I will lose interest because I have better things to do, I will
> lose interest in our code quality, I will lose interest to review.
> 
> (side note: some people might actually enjoy me sending less cleanup
> patches, so this approach might be desirable for some ;) )
> 
> One alternative is to send patches upstream once they have been lying
> around in linux-next for $RANDOM number of months, because they
> obviously saw some testing and nobody started to yell at them once
> stumbling over them on linux-mm.

Yes, I think that's the case with these patches and I've sent them to
Linus.  Hopefully Michel will be able to find time to look them over in
the next month or so.

