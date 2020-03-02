Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8011764ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 21:28:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WWtt5WW3zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 07:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TtVPOf7/; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WWs24pSQzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 07:26:59 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id j5so613382otn.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AIIkqQo7zK91gPK0T/khXyCzdAorhcx0af+PrY6lk90=;
 b=TtVPOf7/Zd+MjA1DrqOdjjeOsPCeIvAsPhCf8JVYUQ/vI3fOGf9aZUT99fdrqERlok
 HWaHcm3uX4EK4OVCiPp3Qoz999a2x5LGSpJol59KV3BA29uDfju1t8NhfxKwLm/E3wEc
 0aAOEscMcyMDL8Ul14fBfTYiUSW6iykqPYHZwr4sdQwdXBaGGPzAgCDaFY3nPyTt6eat
 la4EwLy7EbTwHZBR4GRznrfdGRZcpWcmZE81G1bhNwVC7kYKYza9XtHhl/3JPAEzikIE
 d3nyrENO7mtliJxAP0hdrgrPn31MWPfnmgVki9AUFTfWpj3NkP7igMxXJN+kx9S/DVtw
 wC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AIIkqQo7zK91gPK0T/khXyCzdAorhcx0af+PrY6lk90=;
 b=qWD4/iheQaOijBYesGlRcF2VumbvNVURQWRPEiItUgACIMfWhTq1yuuqmDi8AN0O54
 JuGGfDk/zUPLhhPnc0AN+p0NAEWQGS0HcE02ZtpLvf8XDao7vgBGEVgIhWxVnvaVJC8K
 +jqVaq1pWssMu9u/84FPw9HKwofZpHOpIskd0jEZ9GMummwZ/sHa17qnuFCA8HjKneeH
 W5l0je0+8gpkbted5tr1v8u81mOpYXjU1C5U3eN0gzh+2QiX6z+R47uE2Ftko+HunoaS
 C1Dz7PDL7/bOlN7Xa5qmAfe+dwQu+9hVfxY5+30xiD/rMRxppHvm4k5jfLvbdmgIcGuC
 asZQ==
X-Gm-Message-State: ANhLgQ0x3mw94xIxSnZssmN4QkhMlc6aL0KYS0FHolQLtUI/oi5tEtVo
 YrwNRR15iUGfBhZ3Boa4rWOFozcrnTlvdqkwv6E+KQ==
X-Google-Smtp-Source: ADFU+vtM2GAaSw8vMmUDUTnqUW6iyb5DdgXAwZZrLRpui5YLwOTFMFcYZkaCyk/a1yVR+beeTbHrLb6w9VX2VeoCXqs=
X-Received: by 2002:a9d:6c9:: with SMTP id 67mr744147otx.363.1583180816418;
 Mon, 02 Mar 2020 12:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-7-logang@deltatee.com>
 <CAPcyv4gR1+NaWzteqNKip=cYk89oEVW18HNao7Xv=JipzzDagw@mail.gmail.com>
 <8b13f6aa-77b7-a47d-1a49-b8e2f800ac9d@deltatee.com>
In-Reply-To: <8b13f6aa-77b7-a47d-1a49-b8e2f800ac9d@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 2 Mar 2020 12:26:45 -0800
Message-ID: <CAPcyv4g3c0rhW0eofG6FFMVNVPiw5fxP7LUpFJ2OYdLCAabZ1Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mm/memory_hotplug: Add pgprot_t to mhp_params
To: Logan Gunthorpe <logang@deltatee.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Linux-sh <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 2, 2020 at 10:55 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-02-29 3:44 p.m., Dan Williams wrote:
> > On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>
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
> >> To solve this, provide a way to specify the pgprot value explicitly to
> >> arch_add_memory().
> >>
> >> Of the arches that support MEMORY_HOTPLUG: x86_64, and arm64 need a simple
> >> change to pass the pgprot_t down to their respective functions which set
> >> up the page tables. For x86_32, set the page tables explicitly using
> >> _set_memory_prot() (seeing they are already mapped). For ia64, s390 and
> >> sh, reject anything but PAGE_KERNEL settings -- this should be fine,
> >> for now, seeing these architectures don't support ZONE_DEVICE.
> >>
> >> A check in __add_pages() is also added to ensure the pgprot parameter was
> >> set for all arches.
> >>
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> >> Acked-by: David Hildenbrand <david@redhat.com>
> >> Acked-by: Michal Hocko <mhocko@suse.com>
> >> ---
> >>  arch/arm64/mm/mmu.c            | 3 ++-
> >>  arch/ia64/mm/init.c            | 3 +++
> >>  arch/powerpc/mm/mem.c          | 3 ++-
> >>  arch/s390/mm/init.c            | 3 +++
> >>  arch/sh/mm/init.c              | 3 +++
> >>  arch/x86/mm/init_32.c          | 5 +++++
> >>  arch/x86/mm/init_64.c          | 2 +-
> >>  include/linux/memory_hotplug.h | 2 ++
> >>  mm/memory_hotplug.c            | 5 ++++-
> >>  mm/memremap.c                  | 6 +++---
> >>  10 files changed, 28 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index ee37bca8aba8..ea3fa844a8a2 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -1058,7 +1058,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>                 flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> >>
> >>         __create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> >> -                            size, PAGE_KERNEL, __pgd_pgtable_alloc, flags);
> >> +                            size, params->pgprot, __pgd_pgtable_alloc,
> >> +                            flags);
> >>
> >>         memblock_clear_nomap(start, size);
> >>
> >> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> >> index 97bbc23ea1e3..d637b4ea3147 100644
> >> --- a/arch/ia64/mm/init.c
> >> +++ b/arch/ia64/mm/init.c
> >> @@ -676,6 +676,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>         unsigned long nr_pages = size >> PAGE_SHIFT;
> >>         int ret;
> >>
> >> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot))
> >> +               return -EINVAL;
> >> +
> >>         ret = __add_pages(nid, start_pfn, nr_pages, params);
> >>         if (ret)
> >>                 printk("%s: Problem encountered in __add_pages() as ret=%d\n",
> >> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> >> index 19b1da5d7eca..832412bc7fad 100644
> >> --- a/arch/powerpc/mm/mem.c
> >> +++ b/arch/powerpc/mm/mem.c
> >> @@ -138,7 +138,8 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
> >>         resize_hpt_for_hotplug(memblock_phys_mem_size());
> >>
> >>         start = (unsigned long)__va(start);
> >> -       rc = create_section_mapping(start, start + size, nid, PAGE_KERNEL);
> >> +       rc = create_section_mapping(start, start + size, nid,
> >> +                                   params->pgprot);
> >>         if (rc) {
> >>                 pr_warn("Unable to create mapping for hot added memory 0x%llx..0x%llx: %d\n",
> >>                         start, start + size, rc);
> >> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> >> index e9e4a7abd0cc..87b2d024e75a 100644
> >> --- a/arch/s390/mm/init.c
> >> +++ b/arch/s390/mm/init.c
> >> @@ -277,6 +277,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>         if (WARN_ON_ONCE(params->altmap))
> >>                 return -EINVAL;
> >>
> >> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot))
> >> +               return -EINVAL;
> >> +
> >>         rc = vmem_add_mapping(start, size);
> >>         if (rc)
> >>                 return rc;
> >> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> >> index e5114c053364..b9de2d4fa57e 100644
> >> --- a/arch/sh/mm/init.c
> >> +++ b/arch/sh/mm/init.c
> >> @@ -412,6 +412,9 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>         unsigned long nr_pages = size >> PAGE_SHIFT;
> >>         int ret;
> >>
> >> +       if (WARN_ON_ONCE(params->pgprot.pgprot != PAGE_KERNEL.pgprot)
> >> +               return -EINVAL;
> >> +
> >>         /* We only have ZONE_NORMAL, so this is easy.. */
> >>         ret = __add_pages(nid, start_pfn, nr_pages, params);
> >>         if (unlikely(ret))
> >> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> >> index e25a4218e6ff..96d8e4fb1cc8 100644
> >> --- a/arch/x86/mm/init_32.c
> >> +++ b/arch/x86/mm/init_32.c
> >> @@ -858,6 +858,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>  {
> >>         unsigned long start_pfn = start >> PAGE_SHIFT;
> >>         unsigned long nr_pages = size >> PAGE_SHIFT;
> >> +       int ret;
> >> +
> >> +       ret = _set_memory_prot(start, nr_pages, params->pgprot);
> >
> > Perhaps a comment since it's not immediately obvious where the
> > PAGE_KERNEL prot was established, and perhaps add a conditional to
> > skip this call in the param->pgprot == PAGE_KERNEL case?
>
> Yes I can add the skip in the PAGE_KERNEL case. Though I'm not sure what
> you are asking for with regards to the comment. Just that pgprot is set
> by the caller usually to PAGE_KERNEL?

No, I'm reacting to this comment in the changelog "For x86_32, set the
page tables explicitly using _set_memory_prot() (seeing they are
already mapped)". You've done some investigation that
x86_32::arch_add_memory() expects the page tables to be already
established. I think that's worth capturing inline in the code for
other people doing cross-arch arch_add_memory() changes.
