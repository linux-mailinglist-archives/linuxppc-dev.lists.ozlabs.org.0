Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA033A30
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:50:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hpdm6nxKzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQ/b11C8"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hp0J1ZHQzDqK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 07:21:51 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id x25so16629772eds.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 14:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mDmSeoJUhGrEtos9TXtgY/7zbEqsIvl9K5n7SoOuM0Q=;
 b=XQ/b11C8narXjTlhkZ1MB7tWYfM3tn0gmctbAqj3Rg65oTPOPd5SHeIFfV4+pTgR06
 H2yUQs+GBXTI5/pQ11GhtJSYOg13gCScGhp5Uw4kkyuuOGYt2F8pO4q/wP7TqotREBPc
 91e2hzzlvI3jTc6Z7b/WV/1ytW/7sSbPDcIpe9KhAfWyMGiA57S7aTr5cRiMnKok7aog
 vWuu1tjLrXDviSm0kHoQBVanBMljxHAaqcY7ozxKezrnJVSUuVb4Q6bWbsKWwYjxxekA
 3shYVDSVWHN9XLsu1dh1Z3t+e/B6spVRthobIhqAdP0+bOyU/uJFUcEFcRXticxtZ4Ct
 /ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mDmSeoJUhGrEtos9TXtgY/7zbEqsIvl9K5n7SoOuM0Q=;
 b=uT/1a0uqz+Y2ACzui9BQy3guLw5Erpk26hZ0ZKjmPpQr+Wk3gp8XUB338hWuTff+dB
 69fNfOazWo9QOFVRpgvUZTWfn5nKginuF0aj618XQCHKyt48aGVROSRksdhZBZHP3LYH
 S5k/v+7NHFeSwyfpsnVnct6yY+F3VHqYP571qNsexPmQrQKf9cCYmbkJZpTfaj+khQQ7
 t98nkBmG1Ns+j2qurEdp0+s31mUbp2kmx8t1qnff8bKPGE5D0niIi1lo+O9mWThR8frn
 AxAKHl9tS6vmmygIUi5J7JycyI/ulvj7r8gJSaKNqLkmxo9Pg6ImL1AUEMDqQxqMoVmM
 DuUQ==
X-Gm-Message-State: APjAAAWo41kvAv2Got0TzKTA2tjTTLyBjUxbj/50kXbzsGQ/sajTmk/5
 +M2ft7t9UA8eRQfXp2btAow=
X-Google-Smtp-Source: APXvYqyaKi12rIWxwu+9xuJ+SjF9E6cYt6eiwEWk3oV6ngFX6Zl36r7DH7SlPfRLKG6EtJguaiB+Vw==
X-Received: by 2002:a17:906:fcda:: with SMTP id
 qx26mr24558965ejb.92.1559596907853; 
 Mon, 03 Jun 2019 14:21:47 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id s57sm4311051edd.54.2019.06.03.14.21.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 14:21:46 -0700 (PDT)
Date: Mon, 3 Jun 2019 21:21:46 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 00/11] mm/memory_hotplug: Factor out memory block
 devicehandling
Message-ID: <20190603212146.7hdha6wrlxtkxxxr@master>
References: <20190527111152.16324-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-1-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:45:39 +1000
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Oscar Salvador <osalvador@suse.com>,
 Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, Rich Felker <dalias@libc.org>,
 Arun KS <arunks@codeaurora.org>, Chintan Pandya <cpandya@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>,
 Baoquan He <bhe@redhat.com>, Logan Gunthorpe <logang@deltatee.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Jun Yao <yaojun8558363@gmail.com>, "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Rob Herring <robh@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Banman <andrew.banman@hpe.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMHO, there is some typo.

s/devicehandling/device handling/

On Mon, May 27, 2019 at 01:11:41PM +0200, David Hildenbrand wrote:
>We only want memory block devices for memory to be onlined/offlined
>(add/remove from the buddy). This is required so user space can
>online/offline memory and kdump gets notified about newly onlined memory.
>
>Let's factor out creation/removal of memory block devices. This helps
>to further cleanup arch_add_memory/arch_remove_memory() and to make
>implementation of new features easier - especially sub-section
>memory hot add from Dan.
>
>Anshuman Khandual is currently working on arch_remove_memory(). I added
>a temporary solution via "arm64/mm: Add temporary arch_remove_memory()
>implementation", that is sufficient as a firsts tep in the context of

s/firsts tep/first step/

>this series. (we don't cleanup page tables in case anything goes
>wrong already)
>
>Did a quick sanity test with DIMM plug/unplug, making sure all devices
>and sysfs links properly get added/removed. Compile tested on s390x and
>x86-64.
>
>Based on next/master.
>
>Next refactoring on my list will be making sure that remove_memory()
>will never deal with zones / access "struct pages". Any kind of zone
>handling will have to be done when offlining system memory / before
>removing device memory. I am thinking about remove_pfn_range_from_zone()",
>du undo everything "move_pfn_range_to_zone()" did.

what is "du undo"? I may not get it.

>
>v2 -> v3:
>- Add "s390x/mm: Fail when an altmap is used for arch_add_memory()"
>- Add "arm64/mm: Add temporary arch_remove_memory() implementation"
>- Add "drivers/base/memory: Pass a block_id to init_memory_block()"
>- Various changes to "mm/memory_hotplug: Create memory block devices
>  after arch_add_memory()" and "mm/memory_hotplug: Create memory block
>  devices after arch_add_memory()" due to switching from sections to
>  block_id's.
>
>v1 -> v2:
>- s390x/mm: Implement arch_remove_memory()
>-- remove mapping after "__remove_pages"
>
>David Hildenbrand (11):
>  mm/memory_hotplug: Simplify and fix check_hotplug_memory_range()
>  s390x/mm: Fail when an altmap is used for arch_add_memory()
>  s390x/mm: Implement arch_remove_memory()
>  arm64/mm: Add temporary arch_remove_memory() implementation
>  drivers/base/memory: Pass a block_id to init_memory_block()
>  mm/memory_hotplug: Allow arch_remove_pages() without
>    CONFIG_MEMORY_HOTREMOVE
>  mm/memory_hotplug: Create memory block devices after arch_add_memory()
>  mm/memory_hotplug: Drop MHP_MEMBLOCK_API
>  mm/memory_hotplug: Remove memory block devices before
>    arch_remove_memory()
>  mm/memory_hotplug: Make unregister_memory_block_under_nodes() never
>    fail
>  mm/memory_hotplug: Remove "zone" parameter from
>    sparse_remove_one_section
>
> arch/arm64/mm/mmu.c            |  17 +++++
> arch/ia64/mm/init.c            |   2 -
> arch/powerpc/mm/mem.c          |   2 -
> arch/s390/mm/init.c            |  18 +++--
> arch/sh/mm/init.c              |   2 -
> arch/x86/mm/init_32.c          |   2 -
> arch/x86/mm/init_64.c          |   2 -
> drivers/base/memory.c          | 134 +++++++++++++++++++--------------
> drivers/base/node.c            |  27 +++----
> include/linux/memory.h         |   6 +-
> include/linux/memory_hotplug.h |  12 +--
> include/linux/node.h           |   7 +-
> mm/memory_hotplug.c            |  44 +++++------
> mm/sparse.c                    |  10 +--
> 14 files changed, 140 insertions(+), 145 deletions(-)
>
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
