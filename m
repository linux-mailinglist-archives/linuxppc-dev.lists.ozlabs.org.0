Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2871902F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mXNH02HQzDr10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 11:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=almasrymina@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GwlYf85E; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mX6C5wxNzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 11:23:29 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id k9so4185794oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nT6jCQDEDbGNVEIn/LnERb00hoLuYmjeNAiNp5nTKYM=;
 b=GwlYf85ESUp/DlVF7x/wlBGNQEeIAYZZv0wplHKftWadCwEoQf9BFPhxGWJUqpavRR
 3pmPVVdZhXhaG+L+i+aPxIDvGtRh9WgAbSZOlUfWyKyBM+5kp9AIlJioRFZm5vnG6DPt
 a2n1+mqvcCxm8nGSAWgoacptEWH6H3LNIUKcMWv73rOxP3xA5b4LifNMbIIkM0FUS+HK
 VgnGw7p2CpgsjhWNYQR9zD1lmZOMmGmjIf7S8sttMruE+zU8pvt3myw/LJekVkqUjJ4A
 AvujDnaja2ledhfx4wosGI/SYCr0Z6GqKMnNkusprc3N9MJHrP8+gGju1xr6QG5bpgh1
 zekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nT6jCQDEDbGNVEIn/LnERb00hoLuYmjeNAiNp5nTKYM=;
 b=C5HzdTve0KilQpzce4Q0cyRNEeDZuj1kH1oQGz/C6bzUSuKwJAnCk1LXNWbJI0yaQ7
 Hf8UOa8bZL0m0IUk+Sk8z49xWVwdEUxgdsu/I3+M94Kc/LtwKzfXPGW+hXIU0I7q/Fr5
 4vyOLzt2fXv1yimfxQw4frzST3JEL66iVqWCAjyLtUZ/TSSDpWudIq2mHwIe+WHvVwnD
 U2lsO1tTvRTdGBgE5Q/XQtgAyW1ybneRJ8fvg0xRxT7vrRBOWLUftdfFQY02QpEu2G54
 tmLsoqYNxhvrAbdR9UCKVzXpHehopGHKHfhFLnQ7d1HXPEdqe0zk9uU2xD2k0/vLPK6G
 x0Xw==
X-Gm-Message-State: ANhLgQ07d4agKZd+XStftqN3yCClTnPUjtf6+ZMTkNCFMLPWVDG/xa+j
 sG7jVxye1Qw69879WBevseYOeMwa/dH5KCwNYCkCxQ==
X-Google-Smtp-Source: ADFU+vv2AfwnU57S8AACvd8xl8oCuLz4H6mlZ0SvtJJCSGZGnACkdbmOtsu6ApbR+iSoN014+vCe3BJOk7b5zrbzxWE=
X-Received: by 2002:aca:d705:: with SMTP id o5mr1241248oig.67.1585009406681;
 Mon, 23 Mar 2020 17:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-4-mike.kravetz@oracle.com>
 <CAHS8izN1Q+yiZq8zcU8hoojafcQ19W7XQx-HyFm3Ud8hSvN1Nw@mail.gmail.com>
 <54fd7234-bdd9-de78-9351-16706bae2c08@oracle.com>
In-Reply-To: <54fd7234-bdd9-de78-9351-16706bae2c08@oracle.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 23 Mar 2020 17:23:15 -0700
Message-ID: <CAHS8izMsg5fNCKtLsaNWv0GDFFtHUTW=JHRy9uOm6SC9sBQ=NA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Mar 2020 11:28:47 +1100
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:17 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 3/23/20 5:01 PM, Mina Almasry wrote:
> > On Wed, Mar 18, 2020 at 3:07 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >>
> >> The routine hugetlb_add_hstate prints a warning if the hstate already
> >> exists.  This was originally done as part of kernel command line
> >> parsing.  If 'hugepagesz=' was specified more than once, the warning
> >>         pr_warn("hugepagesz= specified twice, ignoring\n");
> >> would be printed.
> >>
> >> Some architectures want to enable all huge page sizes.  They would
> >> call hugetlb_add_hstate for all supported sizes.  However, this was
> >> done after command line processing and as a result hstates could have
> >> already been created for some sizes.  To make sure no warning were
> >> printed, there would often be code like:
> >>         if (!size_to_hstate(size)
> >>                 hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)
> >>
> >> The only time we want to print the warning is as the result of command
> >> line processing.  So, remove the warning from hugetlb_add_hstate and
> >> add it to the single arch independent routine processing "hugepagesz=".
> >> After this, calls to size_to_hstate() in arch specific code can be
> >> removed and hugetlb_add_hstate can be called without worrying about
> >> warning messages.
> >>
> >> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> >> ---
> >>  arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
> >>  arch/powerpc/mm/hugetlbpage.c |  3 +--
> >>  arch/riscv/mm/hugetlbpage.c   |  2 +-
> >>  arch/sparc/mm/init_64.c       | 19 ++++---------------
> >>  arch/x86/mm/hugetlbpage.c     |  2 +-
> >>  mm/hugetlb.c                  | 10 +++++++---
> >>  6 files changed, 18 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> >> index 4aa9534a45d7..050809e6f0a9 100644
> >> --- a/arch/arm64/mm/hugetlbpage.c
> >> +++ b/arch/arm64/mm/hugetlbpage.c
> >> @@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
> >>         clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
> >>  }
> >>
> >> -static void __init add_huge_page_size(unsigned long size)
> >> -{
> >> -       if (size_to_hstate(size))
> >> -               return;
> >> -
> >> -       hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> >> -}
> >> -
> >>  static int __init hugetlbpage_init(void)
> >>  {
> >>  #ifdef CONFIG_ARM64_4K_PAGES
> >> -       add_huge_page_size(PUD_SIZE);
> >> +       hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE_SHIFT);
> >>  #endif
> >> -       add_huge_page_size(CONT_PMD_SIZE);
> >> -       add_huge_page_size(PMD_SIZE);
> >> -       add_huge_page_size(CONT_PTE_SIZE);
> >> +       hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(PMD_SIZE) - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_SHIFT);
> >>
> >>         return 0;
> >>  }
> >> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> >> index 166960ba1236..f46464ba6fb4 100644
> >> --- a/arch/powerpc/mm/hugetlbpage.c
> >> +++ b/arch/powerpc/mm/hugetlbpage.c
> >> @@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
> >>         if (!arch_hugetlb_valid_size(size))
> >>                 return -EINVAL;
> >>
> >> -       if (!size_to_hstate(size))
> >> -               hugetlb_add_hstate(shift - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(shift - PAGE_SHIFT);
> >>         return 0;
> >>  }
> >>
> >> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> >> index bdf89d7eb714..beaa91941db8 100644
> >> --- a/arch/riscv/mm/hugetlbpage.c
> >> +++ b/arch/riscv/mm/hugetlbpage.c
> >> @@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
> >>  static __init int gigantic_pages_init(void)
> >>  {
> >>         /* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
> >> -       if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
> >> +       if (IS_ENABLED(CONFIG_64BIT))
> >>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> >>         return 0;
> >>  }
> >> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> >> index 5c29203fd460..8f619edc8f8c 100644
> >> --- a/arch/sparc/mm/init_64.c
> >> +++ b/arch/sparc/mm/init_64.c
> >> @@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
> >>  }
> >>
> >>  #ifdef CONFIG_HUGETLB_PAGE
> >> -static void __init add_huge_page_size(unsigned long size)
> >> -{
> >> -       unsigned int order;
> >> -
> >> -       if (size_to_hstate(size))
> >> -               return;
> >> -
> >> -       order = ilog2(size) - PAGE_SHIFT;
> >> -       hugetlb_add_hstate(order);
> >> -}
> >> -
> >>  static int __init hugetlbpage_init(void)
> >>  {
> >> -       add_huge_page_size(1UL << HPAGE_64K_SHIFT);
> >> -       add_huge_page_size(1UL << HPAGE_SHIFT);
> >> -       add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
> >> -       add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
> >> +       hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
> >>
> >>         return 0;
> >>  }
> >> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
> >> index dd3ed09f6c23..8a3f586e1217 100644
> >> --- a/arch/x86/mm/hugetlbpage.c
> >> +++ b/arch/x86/mm/hugetlbpage.c
> >> @@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
> >>  static __init int gigantic_pages_init(void)
> >>  {
> >>         /* With compaction or CMA we can allocate gigantic pages at runtime */
> >> -       if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
> >> +       if (boot_cpu_has(X86_FEATURE_GBPAGES))
> >>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> >>         return 0;
> >>  }
> >> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >> index cd4ec07080fb..cc85b4f156ca 100644
> >> --- a/mm/hugetlb.c
> >> +++ b/mm/hugetlb.c
> >> @@ -3116,8 +3116,7 @@ static int __init hugetlb_init(void)
> >>                 }
> >>
> >>                 default_hstate_size = HPAGE_SIZE;
> >> -               if (!size_to_hstate(default_hstate_size))
> >> -                       hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> >> +               hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> >>         }
> >>         default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
> >>         if (default_hstate_max_huge_pages) {
> >> @@ -3155,7 +3154,6 @@ void __init hugetlb_add_hstate(unsigned int order)
> >>         unsigned long i;
> >>
> >>         if (size_to_hstate(PAGE_SIZE << order)) {
> >> -               pr_warn("hugepagesz= specified twice, ignoring\n");
> >>                 return;
> >>         }
> >>         BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
> >> @@ -3231,6 +3229,12 @@ static int __init hugepagesz_setup(char *s)
> >>                 return 0;
> >>         }
> >>
> >> +       if (size_to_hstate(size)) {
> >> +               pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n",
> >> +                       saved_s);
> >> +               return 0;
> >> +       }
> >> +
> >
> > Not too familiar with the code but I'm a bit confused by this print.
> > AFAICT this prints the warning when hugepagesz= refers to a hugepage
> > that is already added via hugetlb_add_hstate, but there is a default
> > hstate added here without the user specifying hugepagesz, no?
>
> Correct.
>
> >                                                               Does
> > that mean the warning prints if you specify this size?
>
> The code which adds the default hstate (in hugetlb_init) runs after this
> code which is reading/processing command line options.  So, the case you
> are concerned with will not happen.
>
> Thanks for taking a look,
> --
> Mike Kravetz
>
> > 'HugeTLB: hugepage size already supported: xxxxx' or
> > 'HugeTLB: hugepage size xxxx specified twice or is default size, ignoring.'
> >
> > Or don't print anything if it's the default size.
> >
> >>         hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> >>         return 1;
> >>  }
> >> --
> >> 2.24.1

Acked-By: Mina Almasry <almasrymina@google.com>
