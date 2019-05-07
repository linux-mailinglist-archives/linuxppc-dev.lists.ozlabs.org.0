Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745B16ADE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 21:06:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z8G72c49zDqL2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 05:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="X2+ZQdZ3"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z8Dc5LK0zDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 05:04:42 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id i8so6287807oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LNbESQrObZxBB/LE+wWHLIjxgekRF8A+W3warHaag5A=;
 b=X2+ZQdZ3QZjS6d5t5fCH13GepkH6SjaBJAihzeJ4GXjAXyRZSRTGPpBRLypEAsjGIW
 cm7WMvIKqpUHcSWqUhAr15RzuVhsm9xYIgVOzdG6jAuLjuYexnOs5AT+7PvBNweZTrhS
 XJb86bUc/0uEatfh0rES11f0xEgfRlp6FYf7Ve/cMp6EGhSSST6O5ilOXRP6cikBWOSN
 9TpRFPw3ofec2FWb107b0EzNCm6ELKgNFaaPSlE16j08So405N7h8iDEKKbEv/MGWkdC
 BO21f77OIMvR2dKsAyl5SpSrRWJ18aMWN5G9g8VLqySe7ZytZ6AbMkSrq4jv7t/OUdIa
 hgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LNbESQrObZxBB/LE+wWHLIjxgekRF8A+W3warHaag5A=;
 b=QVcAsIJb7ncZfV5QVpAMRkH0E5/5nCPlrx30ZNZF4eROLLey+BEAIuDjY0qPMqn9pQ
 WbwmU5wizQkQouy2veWJzcbLdhf+3OwQoR0/j8njeEpjdBGnm8HgpAeDCeAgDqIBL6dT
 91LVRDc9V0a2PWsHYeDr2Xcs5BM5mVhC8KQ51ade0lT0qY8bzlpbpWynYB67qOfrCOSV
 SuNFAFxvYu2V0J2BkNpgYM0jV2cGROKaOzogerSDlwPasqHaWx+67HV+YeA+KjPXd+iG
 QFsdcelCpzTb+5l/+cZoTqcA45+xB9lcijQ0dpCJzCLygqNdOUaGqizbjAq8aA7oDsDp
 liMg==
X-Gm-Message-State: APjAAAXKRz2heKeEStZR6KvOfKXz306UZGLvtZpsogaUbUiOptl2XcS+
 A1SnRgoe3labuNsoy/+SC3E2wN0ooIpNJIKBm4mfsQ==
X-Google-Smtp-Source: APXvYqwy1LirnerPqPYkGArLlzfXeDDofdcMt5S845Oc+1dy47VZIK6kvPHjm+20DQyjEymtJKZaVdZYEtVIUkJ7mqQ=
X-Received: by 2002:a9d:19ed:: with SMTP id
 k100mr24122234otk.214.1557255879316; 
 Tue, 07 May 2019 12:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
In-Reply-To: <20190507183804.5512-1-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 12:04:28 -0700
Message-ID: <CAPcyv4gxwhsiZ8Hjm4cNbjmLXV2m4s=t14ZoH0uf8AADP2nOtA@mail.gmail.com>
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

On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>
> We only want memory block devices for memory to be onlined/offlined
> (add/remove from the buddy). This is required so user space can
> online/offline memory and kdump gets notified about newly onlined memory.
>
> Only such memory has the requirement of having to span whole memory blocks.
> Let's factor out creation/removal of memory block devices. This helps
> to further cleanup arch_add_memory/arch_remove_memory() and to make
> implementation of new features easier. E.g. supplying a driver for
> memory block devices becomes way easier (so user space is able to
> distinguish different types of added memory to properly online it).
>
> Patch 1 makes sure the memory block size granularity is always respected.
> Patch 2 implements arch_remove_memory() on s390x. Patch 3 prepares
> arch_remove_memory() to be also called without CONFIG_MEMORY_HOTREMOVE.
> Patch 4,5 and 6 factor out creation/removal of memory block devices.
> Patch 7 gets rid of some unlikely errors that could have happened, not
> removing links between memory block devices and nodes, previously brought
> up by Oscar.
>
> Did a quick sanity test with DIMM plug/unplug, making sure all devices
> and sysfs links properly get added/removed. Compile tested on s390x and
> x86-64.
>
> Based on git://git.cmpxchg.org/linux-mmots.git
>
> Next refactoring on my list will be making sure that remove_memory()
> will never deal with zones / access "struct pages". Any kind of zone
> handling will have to be done when offlining system memory / before
> removing device memory. I am thinking about remove_pfn_range_from_zone()",
> du undo everything "move_pfn_range_to_zone()" did.
>
> v1 -> v2:
> - s390x/mm: Implement arch_remove_memory()
> -- remove mapping after "__remove_pages"
>
>
> David Hildenbrand (8):
>   mm/memory_hotplug: Simplify and fix check_hotplug_memory_range()
>   s390x/mm: Implement arch_remove_memory()
>   mm/memory_hotplug: arch_remove_memory() and __remove_pages() with
>     CONFIG_MEMORY_HOTPLUG
>   mm/memory_hotplug: Create memory block devices after arch_add_memory()
>   mm/memory_hotplug: Drop MHP_MEMBLOCK_API

So at a minimum we need a bit of patch staging guidance because this
obviously collides with the subsection bits that are built on top of
the existence of MHP_MEMBLOCK_API. What trigger do you envision as a
replacement that arch_add_memory() use to determine that subsection
operations should be disallowed?
