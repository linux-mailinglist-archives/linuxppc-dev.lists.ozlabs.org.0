Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090116C58
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:40:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBLQ1vnrzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 06:39:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="YRealVS9"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBHJ6K88zDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 06:37:10 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id v17so8201872otp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z5b4zkXTkfpWqCiSB1RgkAhgkwdMX71/E3FP2qDv8Ro=;
 b=YRealVS9Md1Jy2ldrqKzh/vua5vtH9R9hKTSLWZ5p948y/VVUigYm8/fTzWVYdJrLS
 zqbQsSvYrj1RhZQpSlxgTdTrdH2Zcj4h5FdzSiA30CaaWUY22QyfYSFRJFEfdwBwmNxX
 jmWAQGnHoTO58kTw9bJG0CS77dWEknwuUgQ10RKpBtGZdJBxzTZpiaPA/BXwcDLgRB0Y
 ypoJ4JuiXAGKuD425JMucEXhpY+iddsqzh7s66QEyJ/04j7Yz7eT9fT03b5NmrcDmE0I
 A1CPUFRjoysFvAT+gSsrGulOZ9FWi/FxEiGsahRZRiFZVYln05+etYoXT4LzNQxNj+Cy
 QW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5b4zkXTkfpWqCiSB1RgkAhgkwdMX71/E3FP2qDv8Ro=;
 b=AKLB8cfH8RmTsGMa95f82/5ekJVHzPVbWDHlCnJepSFJAlQbuMDL+nlXWXGMaRnqew
 5jjamb10mux67N+tvNJx3E7uV8OKAKEavVNztRSYREA/INatq6EnOcqPS5xu4HOMcjFC
 bPirLIVuWHTgv7puM72S6SIW6vQpsDDx9sBTkOhvQNgVwzAjXQQLQmio5+HyvKbVrtMM
 fabQn91ECH7kEYQL5Tcy1QO0FzieNKztm45TEIpO0hPzvX0ZBeVoXIjB5TmP/8vHk2Pj
 8QUD4/4BuybiTLPsSlEINnEPDfXppcW/+aPH+wYZUvuzx+/n755HHCdbwYobDenILPlz
 waOA==
X-Gm-Message-State: APjAAAXj7cKWiEybHzFkjxucpnXHD9RcU4lnGo3lOcT5Fo0qXEApW88l
 1opVFZuumeIYtabY3qOytI55HjrX76/MGxIM43hnzg==
X-Google-Smtp-Source: APXvYqxO7g7RJJ/ttlGXNE6d39oOgVmNZnUt9QkVRoOGG+esA9T1LY329N+RzaKz6GerbpavAiuJgB9UwuUQhGczlN4=
X-Received: by 2002:a9d:19ed:: with SMTP id
 k100mr24473505otk.214.1557261427346; 
 Tue, 07 May 2019 13:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <CAPcyv4gxwhsiZ8Hjm4cNbjmLXV2m4s=t14ZoH0uf8AADP2nOtA@mail.gmail.com>
 <6f69e615-2b4a-ff31-5d2a-e1711c564f9b@redhat.com>
 <ad971f57-5f09-c056-beef-6a7b63311106@redhat.com>
In-Reply-To: <ad971f57-5f09-c056-beef-6a7b63311106@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 13:36:55 -0700
Message-ID: <CAPcyv4gvwXDP7ZVBpxtEZJSNiHC_zoHEy1HzUk3FgpS5O5s1Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] mm/memory_hotplug: Factor out memory block device
 handling
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux MM <linux-mm@kvack.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, Rich Felker <dalias@libc.org>,
 Arun KS <arunks@codeaurora.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@kernel.org>, Qian Cai <cai@lca.pw>,
 linux-s390 <linux-s390@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
 Logan Gunthorpe <logang@deltatee.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Oscar Salvador <osalvador@suse.de>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Andrew Banman <andrew.banman@hpe.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 12:38 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 07.05.19 21:21, David Hildenbrand wrote:
> > On 07.05.19 21:04, Dan Williams wrote:
> >> On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> We only want memory block devices for memory to be onlined/offlined
> >>> (add/remove from the buddy). This is required so user space can
> >>> online/offline memory and kdump gets notified about newly onlined memory.
> >>>
> >>> Only such memory has the requirement of having to span whole memory blocks.
> >>> Let's factor out creation/removal of memory block devices. This helps
> >>> to further cleanup arch_add_memory/arch_remove_memory() and to make
> >>> implementation of new features easier. E.g. supplying a driver for
> >>> memory block devices becomes way easier (so user space is able to
> >>> distinguish different types of added memory to properly online it).
> >>>
> >>> Patch 1 makes sure the memory block size granularity is always respected.
> >>> Patch 2 implements arch_remove_memory() on s390x. Patch 3 prepares
> >>> arch_remove_memory() to be also called without CONFIG_MEMORY_HOTREMOVE.
> >>> Patch 4,5 and 6 factor out creation/removal of memory block devices.
> >>> Patch 7 gets rid of some unlikely errors that could have happened, not
> >>> removing links between memory block devices and nodes, previously brought
> >>> up by Oscar.
> >>>
> >>> Did a quick sanity test with DIMM plug/unplug, making sure all devices
> >>> and sysfs links properly get added/removed. Compile tested on s390x and
> >>> x86-64.
> >>>
> >>> Based on git://git.cmpxchg.org/linux-mmots.git
> >>>
> >>> Next refactoring on my list will be making sure that remove_memory()
> >>> will never deal with zones / access "struct pages". Any kind of zone
> >>> handling will have to be done when offlining system memory / before
> >>> removing device memory. I am thinking about remove_pfn_range_from_zone()",
> >>> du undo everything "move_pfn_range_to_zone()" did.
> >>>
> >>> v1 -> v2:
> >>> - s390x/mm: Implement arch_remove_memory()
> >>> -- remove mapping after "__remove_pages"
> >>>
> >>>
> >>> David Hildenbrand (8):
> >>>   mm/memory_hotplug: Simplify and fix check_hotplug_memory_range()
> >>>   s390x/mm: Implement arch_remove_memory()
> >>>   mm/memory_hotplug: arch_remove_memory() and __remove_pages() with
> >>>     CONFIG_MEMORY_HOTPLUG
> >>>   mm/memory_hotplug: Create memory block devices after arch_add_memory()
> >>>   mm/memory_hotplug: Drop MHP_MEMBLOCK_API
> >>
> >> So at a minimum we need a bit of patch staging guidance because this
> >> obviously collides with the subsection bits that are built on top of
> >> the existence of MHP_MEMBLOCK_API. What trigger do you envision as a
> >> replacement that arch_add_memory() use to determine that subsection
> >> operations should be disallowed?
> >>
> >
> > Looks like we now have time to sort it out :)
> >
> >
> > Looking at your series
> >
> > [PATCH v8 08/12] mm/sparsemem: Prepare for sub-section ranges
> >
> > is the "single" effectively place using MHP_MEMBLOCK_API, namely
> > "subsection_check()". Used when adding/removing memory.
> >
> >
> > +static int subsection_check(unsigned long pfn, unsigned long nr_pages,
> > +             unsigned long flags, const char *reason)
> > +{
> > +     /*
> > +      * Only allow partial section hotplug for !memblock ranges,
> > +      * since register_new_memory() requires section alignment, and
> > +      * CONFIG_SPARSEMEM_VMEMMAP=n requires sections to be fully
> > +      * populated.
> > +      */
> > +     if ((!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP)
> > +                             || (flags & MHP_MEMBLOCK_API))
> > +                     && ((pfn & ~PAGE_SECTION_MASK)
> > +                             || (nr_pages & ~PAGE_SECTION_MASK))) {
> > +             WARN(1, "Sub-section hot-%s incompatible with %s\n", reason,
> > +                             (flags & MHP_MEMBLOCK_API)
> > +                             ? "memblock api" : "!CONFIG_SPARSEMEM_VMEMMAP");
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> >  }
> >
> >
> > (flags & MHP_MEMBLOCK_API)) && ((pfn & ~PAGE_SECTION_MASK) || (nr_pages
> > & ~PAGE_SECTION_MASK)))
> >
> > sounds like something the caller (add_memory()) always has to take care
> > of. No need to check. The one imposing this restriction is the only caller.
> >
> > In my opinion, that check/function can go completely.
> >
> > Am I missing something / missing another user?
> >
>
> In other word, this series moves the restriction out of
> arch_add_memory() and therefore you don't need subsection_check() at all
> anymore. At least if I am not missing something :)

Ah, ok. Only direct arch_add_memory() users need to be worried about
subsection hotplug and the add_memory_resource() + __remove_memory()
paths are already protected by check_hotplug_memory_range(). Ok, I can
get on board with the removal.

Let me go ahead and review this series so Andrew can get it pulled in
and I can rebase.
