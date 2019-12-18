Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A3125305
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 21:18:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dRCC1vRnzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 07:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LHrb6p+0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dR945RPvzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 07:16:08 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 857B52176D;
 Wed, 18 Dec 2019 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576700166;
 bh=72GdXtYxFBvJVwR5VB7dRffOmREfJyQl/Jzhr5XSzJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LHrb6p+0jIBpxBhzaLr/plO8NRxeqdrxmRg8kgj3GwNUwA8IBxs9sotd6puBVEcx9
 FfJzC1Eur7dCKq91VQ7+sRk/CgZhK+3a6gblwiOnh/QtBz2ykb5oixG62lAmSAPAmn
 10siaDVAeFZLKt6tWbQ8Z8kTKlouGLaDGXQJZWKM=
Date: Wed, 18 Dec 2019 12:16:04 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 05/10] mm/memory_hotplug: Shrink zones when offlining
 memory
Message-Id: <20191218121604.520927a74bbe65d47669b32a@linux-foundation.org>
In-Reply-To: <4a3d7420-2d11-a37c-0e82-2096fbf7bca6@redhat.com>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-6-david@redhat.com>
 <f75caf18-ff5f-8a29-7069-8ce783389644@redhat.com>
 <20191130152159.258fa331542fc693e24723eb@linux-foundation.org>
 <4a3d7420-2d11-a37c-0e82-2096fbf7bca6@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org,
 Yu Zhao <yuzhao@google.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 x86@kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Ira Weiny <ira.weiny@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Tony Luck <tony.luck@intel.com>,
 Steve Capper <steve.capper@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Dec 2019 18:08:04 +0100 David Hildenbrand <david@redhat.com> wrote:

> On 01.12.19 00:21, Andrew Morton wrote:
> > On Sun, 27 Oct 2019 23:45:52 +0100 David Hildenbrand <david@redhat.com> wrote:
> > 
> >> I think I just found an issue with try_offline_node(). 
> >> try_offline_node() is pretty much broken already (touches garbage 
> >> memmaps and will not considers mixed NIDs within sections), however, 
> >> relies on the node span to look for memory sections to probe. So it 
> >> seems to rely on the nodes getting shrunk when removing memory, not when 
> >> offlining.
> >>
> >> As we shrink the node span when offlining now and not when removing, 
> >> this can go wrong once we offline the last memory block of the node and 
> >> offline the last CPU. We could still have memory around that we could 
> >> re-online, however, the node would already be offline. Unlikely, but 
> >> possible.
> >>
> >> Note that the same is also broken without this patch in case memory is 
> >> never onlined. The "pfn_to_nid(pfn) != nid" can easily succeed on the 
> >> garbage memmap, resulting in  no memory being detected as belonging to 
> >> the node. Also, resize_pgdat_range() is called when onlining memory, not 
> >> when adding it. :/ Oh this is so broken :)
> >>
> >> The right fix is probably to walk over all memory blocks that could 
> >> exist and test if they belong to the nid (if offline, check the 
> >> block->nid, if online check all pageblocks). A fix we can then move in 
> >> front of this patch.
> >>
> >> Will look into this this week.
> > 
> > And this series shows almost no sign of having been reviewed.  I'll hold
> > it over for 5.6.
> > 
> 
> Hi Andrew, any chance we can get the (now at least reviewed - thx Oscar)
> fix in patch #5 into 5.5? (I want to do the final stable backports for
> the uninitialized memmap stuff)

Sure, I queued it for the next batch of 5.5 fixes.
