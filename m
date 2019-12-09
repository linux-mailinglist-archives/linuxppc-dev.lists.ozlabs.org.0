Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3670117798
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:43:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WwBP54ZnzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 07:43:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ww8d6tKzzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 07:41:34 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id q9so783102wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 12:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oSbUiS7EP2tldG1YzNxaAsQzPlJ8BCKd2KYUFJ680IM=;
 b=adtAXe8kfwtZWQgI7Hr7JfHel0Cny5q3KD+Dj52cCRfDUpIdWwtudWjh01bGVD2qZG
 /xryL6BzjwiEe3edpt6Dml8cezKEXXybJYAGiGWybqQfE94ohDNu32umbDYweSuuw91n
 0/S6k6JMk6udImM2Cox4iGlhjSeFlryjqVat8Dw83pOSXKSSmIA8Ba6ZVfa1mdDSSwNQ
 6arWu+S/YxiMsR10kzHnJjogsSL7SpJR33OyqM1Q0qSwhi3lV3N1QRv9VTLK4vG7+Qz8
 /ex+fkQBINf/gfyiH+RSp78sD7PkIgJbM1/sBYGuAE7eNJwMHMp/XNs9OMI7o2zf/vm5
 FrkA==
X-Gm-Message-State: APjAAAVr1f28fXrYzkK19rZBpf6zRRZzr3uU3qV2ODlbnjPNcGdyBUUP
 kC2LQj4r/B/jQHGsfureTwk=
X-Google-Smtp-Source: APXvYqyLft4TxSNFH48B5L3G63KfAdrp5DrYOJ1M1gqSEHOOdcj01DiA+cYxABOqwwT0LyX2UQKe5g==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr1018119wmm.24.1575924091072; 
 Mon, 09 Dec 2019 12:41:31 -0800 (PST)
Received: from localhost (ip-37-188-170-11.eurotel.cz. [37.188.170.11])
 by smtp.gmail.com with ESMTPSA id p5sm668853wrt.79.2019.12.09.12.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:41:30 -0800 (PST)
Date: Mon, 9 Dec 2019 21:41:28 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 5/6] mm, memory_hotplug: Provide argument for the
 pgprot_t in arch_add_memory()
Message-ID: <20191209204128.GC7658@dhcp22.suse.cz>
References: <20191209191346.5197-1-logang@deltatee.com>
 <20191209191346.5197-6-logang@deltatee.com>
 <ce50d9da-c60e-05a1-a86b-3bb3629de502@redhat.com>
 <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-ia64@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 09-12-19 13:24:19, Logan Gunthorpe wrote:
> 
> 
> On 2019-12-09 12:23 p.m., David Hildenbrand wrote:
> > On 09.12.19 20:13, Logan Gunthorpe wrote:
> >> devm_memremap_pages() is currently used by the PCI P2PDMA code to create
> >> struct page mappings for IO memory. At present, these mappings are created
> >> with PAGE_KERNEL which implies setting the PAT bits to be WB. However, on
> >> x86, an mtrr register will typically override this and force the cache
> >> type to be UC-. In the case firmware doesn't set this register it is
> >> effectively WB and will typically result in a machine check exception
> >> when it's accessed.
> >>
> >> Other arches are not currently likely to function correctly seeing they
> >> don't have any MTRR registers to fall back on.
> >>
> >> To solve this, add an argument to arch_add_memory() to explicitly
> >> set the pgprot value to a specific value.
> >>
> >> Of the arches that support MEMORY_HOTPLUG: x86_64, s390 and arm64 is a
> >> simple change to pass the pgprot_t down to their respective functions
> >> which set up the page tables. For x86_32, set the page tables explicitly
> >> using _set_memory_prot() (seeing they are already mapped). For sh, reject
> >> anything but PAGE_KERNEL settings -- this should be fine, for now, seeing
> >> sh doesn't support ZONE_DEVICE anyway.
> >>
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Michal Hocko <mhocko@suse.com>
> >> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> >> ---
> >>  arch/arm64/mm/mmu.c            | 4 ++--
> >>  arch/ia64/mm/init.c            | 5 ++++-
> >>  arch/powerpc/mm/mem.c          | 4 ++--
> >>  arch/s390/mm/init.c            | 4 ++--
> >>  arch/sh/mm/init.c              | 5 ++++-
> >>  arch/x86/mm/init_32.c          | 7 ++++++-
> >>  arch/x86/mm/init_64.c          | 4 ++--
> >>  include/linux/memory_hotplug.h | 2 +-
> >>  mm/memory_hotplug.c            | 2 +-
> >>  mm/memremap.c                  | 2 +-
> >>  10 files changed, 25 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 60c929f3683b..48b65272df15 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -1050,7 +1050,7 @@ int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> >>  }
> >>  
> >>  #ifdef CONFIG_MEMORY_HOTPLUG
> >> -int arch_add_memory(int nid, u64 start, u64 size,
> >> +int arch_add_memory(int nid, u64 start, u64 size, pgprot_t prot,
> >>  			struct mhp_restrictions *restrictions)
> > 
> > Can we fiddle that into "struct mhp_restrictions" instead?
> 
> Yes, if that's what people want, it's pretty trivial to do. I chose not
> to do it that way because it doesn't get passed down to add_pages() and
> it's not really a "restriction". If I don't hear any objections, I will
> do that for v2.

I do agree that restriction is not the best fit. But I consider prot
argument to complicate the API to all users even though it is not really
clear whether we are going to have many users really benefiting from it.
Look at the vmalloc API and try to find how many users of __vmalloc do
not use PAGE_KERNEL.

So I can see two options. One of them is to add arch_add_memory_prot
that would allow to have give and extra prot argument or simply call
an arch independent API to change the protection after arch_add_memory.
The later sounds like much less code. The memory shouldn't be in use by
anybody at that stage yet AFAIU. Maybe there even is an API like that.
-- 
Michal Hocko
SUSE Labs
