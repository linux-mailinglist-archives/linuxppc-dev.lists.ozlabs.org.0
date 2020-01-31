Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4514EA70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 11:05:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488CWm2RS8zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 21:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488CVF2s88zDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 21:03:46 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id b17so7994690wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 02:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OPsHxJ/qrNw2BAodGghsankc2sSPSX/p9KvFZKbsCyY=;
 b=cKdRZUm4k8gPxOLblNxNN18koLBuWhu0ooTgoipEhTVlVDngT6a1sCILq0Fi4SRI2R
 76ZFGLq4fJYjIIuJ2NwqmOKj97exKfpBAvVtOxUVX+ijnZLIMaf88N6u3z7zQyj242wb
 +igrFvj+0Phi0kWW8rbD/5cGMKK7gdmJDhjfnnNsI7kSrMsdH2/tELAh6190eIKxInM0
 +vZWThOhwbt5pb/xG3e2qDwsOBAYK8c0slK1t66hJOrRQ6VL37nA/n+l0vEZPTpvJrbQ
 sQZH21/opdsLW5uO9n4crGLG4G8mrZV0SabIBNdRDQMmUbvO/cSlqHB+X9eeJJVl32T3
 R7ag==
X-Gm-Message-State: APjAAAUyv+MHWb2fkIyjaXam7EQZliK0YDjOgA3VDWn542wbVDe+0BLh
 YQ3NEXWCHiVS7ZN5F64fSUw=
X-Google-Smtp-Source: APXvYqzLpwtZkdrzGqTPGoiYvY04l7YoTAkF1ULJLn3qG79xKaRmqXLPztVVPxRu9W90SrfOXGU8Zw==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr11974379wmb.137.1580465023231; 
 Fri, 31 Jan 2020 02:03:43 -0800 (PST)
Received: from localhost (ip-37-188-238-177.eurotel.cz. [37.188.238.177])
 by smtp.gmail.com with ESMTPSA id q11sm11424808wrp.24.2020.01.31.02.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 02:03:42 -0800 (PST)
Date: Fri, 31 Jan 2020 11:03:41 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 00/10] mm/memory_hotplug: Shrink zones before removing
 memory
Message-ID: <20200131100341.GB24244@dhcp22.suse.cz>
References: <20191006085646.5768-1-david@redhat.com>
 <ac27f0e1-26e9-dfc1-3ee1-cbee7ad847bf@redhat.com>
 <20191203133633.GA2600@linux>
 <20200130204043.29e21049775e3a637db733e0@linux-foundation.org>
 <f7ed4448-8f41-599d-4689-914eeaf84d6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ed4448-8f41-599d-4689-914eeaf84d6d@redhat.com>
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
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
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
 Wei Yang <richardw.yang@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
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
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 31-01-20 10:18:34, David Hildenbrand wrote:
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

I am afraid this is less about mentality than the lack of man power.
This is not a new problem. We have much more code producers than
reviewers.

In this particular case the review is expected from me and I am
sorry that my bandwith doesn't scale with the email traffic in my inbox.
I do very much appreciate the amount of work you are doing in the
hotplug area but we need more reviewers here.

> Now, this is an uncomfortable situation for you and me. You have to ping
> people about review and patches are stuck in your tree. I have a growing
> list of patches that are somewhat considered "done", but well,
> not-upstream-at-all. I have patches that are long in RHEL and were
> properly tested, but could get dropped any time because -ENOREVIEW.
> 
> Our process nowadays seems to be, to only upstream what has an ACK/RB
> (fixes/features/cleanups). I can understand this is desirable (yet, I am
> not sure if this makes sense with the current take-and-not-give-back
> review mentality on this list).
> 
> Although it will make upstreaming stuff *even harder* and *even slower*,
> maybe we should start to only queue patches that have an ACK/RB, so they
> won't get blocked by this later on? At least that makes your life easier
> and people won't have to eventually follow up on patches that have been
> in linux-next for months.

I wouldn't mind if patched got merged to mmotm less pro-actively at all.
People tend to care less to follow up on patches that are in the queue
already from my past experience. And also it encourages to generate more
code than review.

This is certainly not a black or white of course. Some areas have barely
anybody for a review except for the person actively writing code in that
area so this really needs the case by case approach.

Anyway this is not a new discussion or a new problem we are facing. I
believe that part of the problem is that the MM subsystem doesn't really
have official maintainers so there is nobody really responsible for
particular parts of the subsystem. Sure Andrew is merging patches based
on the review feedback or his gut feeling but I am afraid this is not
enough.
-- 
Michal Hocko
SUSE Labs
