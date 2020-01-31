Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D403514E7F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 05:42:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4884M66qtlzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 15:42:10 +1100 (AEDT)
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
 header.s=default header.b=KTJ86Ltz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4884KY4KqpzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 15:40:48 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450982082E;
 Fri, 31 Jan 2020 04:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580445646;
 bh=I1bprH72sBDpBLlNpiBikRkPHYR7/BghqHOcxjCEAK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KTJ86Ltz5/4t5M/elu56oUoQxaYD2kUaKl59LcSNvFiS/2A372D2zgeGhW6X45eXW
 /ApHeOMbSoMhUe88x8B3tdfdiXr1CvDwgTN5PemK83Kuzog8w7sw/PDR2kBEmiWZUU
 q0KsnusYGXqcjKS0a3zPncUGHPr1Z3Mmr6OW+hRY=
Date: Thu, 30 Jan 2020 20:40:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v6 00/10] mm/memory_hotplug: Shrink zones before
 removing memory
Message-Id: <20200130204043.29e21049775e3a637db733e0@linux-foundation.org>
In-Reply-To: <20191203133633.GA2600@linux>
References: <20191006085646.5768-1-david@redhat.com>
 <ac27f0e1-26e9-dfc1-3ee1-cbee7ad847bf@redhat.com>
 <20191203133633.GA2600@linux>
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
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, Rich Felker <dalias@libc.org>,
 Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, linux-sh@vger.kernel.org,
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
 Tony Luck <tony.luck@intel.com>, Mel Gorman <mgorman@techsingularity.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve Capper <steve.capper@arm.com>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Dec 2019 14:36:38 +0100 Oscar Salvador <osalvador@suse.de> wrote:

> On Mon, Dec 02, 2019 at 10:09:51AM +0100, David Hildenbrand wrote:
> > @Michal, @Oscar, can some of you at least have a patch #5 now so we can
> > proceed with that? (the other patches can stay in -next some time longer)
> 
> Hi, 
> 
> I will be having a look at patch#5 shortly.
> 
> Thanks for the reminder

Things haven't improved a lot :(

mm-memmap_init-update-variable-name-in-memmap_init_zone.patch
mm-memory_hotplug-poison-memmap-in-remove_pfn_range_from_zone.patch
mm-memory_hotplug-we-always-have-a-zone-in-find_smallestbiggest_section_pfn.patch
mm-memory_hotplug-dont-check-for-all-holes-in-shrink_zone_span.patch
mm-memory_hotplug-drop-local-variables-in-shrink_zone_span.patch
mm-memory_hotplug-cleanup-__remove_pages.patch

The first patch has reviews, the remainder are unloved.
