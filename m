Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51D1B1612
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 21:42:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495cYX0lXFzDqtY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 05:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SGUjdIGc; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495cWq5B79zDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 05:41:22 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id l19so8878246lje.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2l71BXESRMVZaog60N632QcNtn1RLZhkN10c7KV873A=;
 b=SGUjdIGc0NzdTIccHzsf7n7fl2lCU8m0WmuBQvva6nXnCETcqGsNI8UGF3WQCa5QPP
 46a6qbi4W2A/3pf+uHmYD+pqX60/53YJwMs5wSkkCjHIHnhUv/OcrOdjYjVwFrqHrsGI
 LbEhEP+vVxT1hxgGbOjfp5sV7UwWSTCSz7CzC7PbgIOdqfZ4D4sjVxIfSBQat6ZUli+a
 qa9REduBLytNHJOTAEcI9W6Zhuy01qusIKY6Vjvv7J2yQyLd4e9iPDoDeGVK/w7/16b/
 3IE+Rr5FLIPzkimLAJDyV+qSELQgKYryzNsV/kvfdvKCQftVMco0jSQgQ0fnwm0YApnQ
 Qg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2l71BXESRMVZaog60N632QcNtn1RLZhkN10c7KV873A=;
 b=cVcRu4XMVdB5CD54tmib5cRAd80212d2CiLyudEwh3bhECe+pI5LuxMouCwnWbulwl
 zxVHOTaPADLWVeDQAYnXolZb/8b7e3V183t2wCaU0QQ3YiCwSEGwpzkM/042Fedegr+/
 RdbOg+CxVBk8s2mUFUAxg2NulSUiUxD9n/XRPPeopKA9elMaEbsQwlQ4Yav8rHjP14cj
 doNMNGIutXWOgWyUTV3jcK2Gt6+hZoMhcTU32KwU6O1T9I8BCzk+fh9Yrh/UU7EeuAxV
 DYJDtxWA2AbB5YnAhzCUvIAPkizs4720rbWapocs51HeO91AkS9+C37DbHRE72qWMcO2
 lyHA==
X-Gm-Message-State: AGi0PuZfH1XA08QDzPTMn80WsTLa2F3pk8RR4IVVqUYKGmLNgi0y70mk
 w/PFKO8pm0AaHjEeR/othohYQhZFyIMvnyD8NsISZw==
X-Google-Smtp-Source: APiQypI2gK//YEp6YVbgwTm4k+wnVZZ/iGHVGrqFsiNhRq6u3vM+M+1e1iwmrTKmDRc1k1kiyjmzBeruQcOKYL6X1kk=
X-Received: by 2002:a05:651c:30b:: with SMTP id
 a11mr10981389ljp.164.1587411674963; 
 Mon, 20 Apr 2020 12:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <20200417185049.275845-4-mike.kravetz@oracle.com>
In-Reply-To: <20200417185049.275845-4-mike.kravetz@oracle.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 20 Apr 2020 21:41:04 +0200
Message-ID: <CADYN=9Koefrq9H1Y82Q8nMNbeyN4tzhEfvDu5u=sVFjFZCYorA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
To: Mike Kravetz <mike.kravetz@oracle.com>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Apr 2020 at 20:52, Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> The routine hugetlb_add_hstate prints a warning if the hstate already
> exists.  This was originally done as part of kernel command line
> parsing.  If 'hugepagesz=' was specified more than once, the warning
>         pr_warn("hugepagesz= specified twice, ignoring\n");
> would be printed.
>
> Some architectures want to enable all huge page sizes.  They would
> call hugetlb_add_hstate for all supported sizes.  However, this was
> done after command line processing and as a result hstates could have
> already been created for some sizes.  To make sure no warning were
> printed, there would often be code like:
>         if (!size_to_hstate(size)
>                 hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)
>
> The only time we want to print the warning is as the result of command
> line processing.  So, remove the warning from hugetlb_add_hstate and
> add it to the single arch independent routine processing "hugepagesz=".
> After this, calls to size_to_hstate() in arch specific code can be
> removed and hugetlb_add_hstate can be called without worrying about
> warning messages.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> Acked-by: Mina Almasry <almasrymina@google.com>

When I build an arm64 kernel on today's next-20200420 and ran that in
qemu I got the following output [1]:

...
[  311.326817][    T1] kobject: 'drivers' ((____ptrval____)):
kobject_add_internal: parent: 'coresight', set: '<NULL>'
[  311.331513][    T1] kobject: 'drivers' ((____ptrval____)): kobject_uevent_env
[  311.334514][    T1] kobject: 'drivers' ((____ptrval____)):
kobject_uevent_env: filter function caused the event to drop!
[  311.340127][    T1] bus: 'coresight': registered
[  311.342228][    T1] initcall coresight_init+0x0/0x64 returned 0
after 27343 usecs
[  311.349740][    T1] calling  debug_traps_init+0x0/0xa4 @ 1
[  311.352138][    T1] initcall debug_traps_init+0x0/0xa4 returned 0
after 0 usecs
[  311.355550][    T1] calling  reserve_memblock_reserved_regions+0x0/0x374 @ 1
[  311.364913][    T1] initcall
reserve_memblock_reserved_regions+0x0/0x374 returned 0 after 7812
usecs
[  311.368937][    T1] calling  aarch32_alloc_vdso_pages+0x0/0x1d0 @ 1
[  311.371819][    T1] initcall aarch32_alloc_vdso_pages+0x0/0x1d0
returned 0 after 0 usecs
[  311.375608][    T1] calling  vdso_init+0x0/0x52c @ 1
[  311.378092][    T1] initcall vdso_init+0x0/0x52c returned 0 after 0 usecs
[  311.381386][    T1] calling  arch_hw_breakpoint_init+0x0/0x178 @ 1
[  311.384007][    T1] hw-breakpoint: found 6 breakpoint and 4
watchpoint registers.
[  311.388120][    T1] initcall arch_hw_breakpoint_init+0x0/0x178
returned 0 after 3906 usecs
[  311.391924][    T1] calling  asids_update_limit+0x0/0x110 @ 1
[  311.394390][    T1] ASID allocator initialised with 65536 entries
[  311.397427][    T1] initcall asids_update_limit+0x0/0x110 returned
0 after 3906 usecs
[  311.400749][    T1] calling  hugetlbpage_init+0x0/0x7c @ 1
[  311.403581][    T1] Unexpected kernel BRK exception at EL1
[  311.405771][    T1] Internal error: ptrace BRK handler: f20003e8
[#1] PREEMPT SMP
[  311.408759][    T1] Modules linked in:
[  311.410514][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G
        T 5.7.0-rc2-next-20200420-03722-ge4ba9b47e4ed #1
[  311.415175][    T1] Hardware name: linux,dummy-virt (DT)
[  311.417466][    T1] pstate: 80400005 (Nzcv daif +PAN -UAO)
[  311.419887][    T1] pc : hugetlb_add_hstate+0x68/0x4f0
[  311.422171][    T1] lr : hugetlb_add_hstate+0x68/0x4f0
[  311.424354][    T1] sp : ffff000069c07c60
[  311.426124][    T1] x29: ffff000069c07c60 x28: ffff00006a7f8058
[  311.428754][    T1] x27: 0000000000000000 x26: ffffa00013f56950
[  311.431376][    T1] x25: ffffa000141b8000 x24: ffff00006a7f8040
[  311.433987][    T1] x23: 1fffe0000d380fae x22: 00000000fffffff8
[  311.436574][    T1] x21: 0000000100000000 x20: ffffa000141b8000
[  311.439167][    T1] x19: ec632d51be3d2507 x18: 0000000000001a68
[  311.441763][    T1] x17: 00000000000013e0 x16: 0000000000001a94
[  311.444386][    T1] x15: 0000000000001a68 x14: 6573752036303933
[  311.447034][    T1] x13: 2072657466612030 x12: 00000000000025b0
[  311.449639][    T1] x11: 00000000f1f1f1f1 x10: 0000000041b58ab3
[  311.452238][    T1] x9 : ffffa000139a833c x8 : 1ffff40002bf2c23
[  311.454849][    T1] x7 : ffff940002bf2c23 x6 : ffffa00015f9611b
[  311.457480][    T1] x5 : ffff00006a7f8040 x4 : 0000000000000000
[  311.460124][    T1] x3 : ffffa000139fd98c x2 : 00000000fffffff8
[  311.462737][    T1] x1 : ffff00006a7f8040 x0 : 0000000000000000
[  311.465322][    T1] Call trace:
[  311.466818][    T1]  hugetlb_add_hstate+0x68/0x4f0
[  311.468934][    T1]  hugetlbpage_init+0x34/0x7c
[  311.470934][    T1]  do_one_initcall+0x480/0xa40
[  311.472996][    T1]  kernel_init_freeable+0x7a0/0x968
[  311.475224][    T1]  kernel_init+0x20/0x1f8
[  311.477078][    T1]  ret_from_fork+0x10/0x18
[  311.479053][    T1] Code: 972762be 7100fedf 54000069 97276197 (d4207d00)
[  311.482106][    T1] _warn_unseeded_randomness: 18 callbacks suppressed
[  311.482255][    T1] random: get_random_bytes called from
print_oops_end_marker+0x48/0x80 with crng_init=0
[  311.482321][    T1] ---[ end trace 60df362baad50718 ]---
[  311.491423][    T1] Kernel panic - not syncing: Fatal exception
[  311.494038][    T1] ---[ end Kernel panic - not syncing: Fatal exception ]---

If I revert this patch I can't see the problem anymore...

Any idea what happens?

This is the kernel.config [1] I'm using, its from an allmodconfig kernel build

Cheers,
Anders
[1] https://people.linaro.org/~anders.roxell/output-next-20200420.log
[2] https://builds.tuxbuild.com/U7ufblLydTsSvle27GSPAA/kernel.config


> ---
>  arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
>  arch/powerpc/mm/hugetlbpage.c |  3 +--
>  arch/riscv/mm/hugetlbpage.c   |  2 +-
>  arch/sparc/mm/init_64.c       | 19 ++++---------------
>  arch/x86/mm/hugetlbpage.c     |  2 +-
>  mm/hugetlb.c                  |  9 ++++++---
>  6 files changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index f706b821aba6..21fa98b51e00 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
>         clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
>  }
>
> -static void __init add_huge_page_size(unsigned long size)
> -{
> -       if (size_to_hstate(size))
> -               return;
> -
> -       hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> -}
> -
>  static int __init hugetlbpage_init(void)
>  {
>  #ifdef CONFIG_ARM64_4K_PAGES
> -       add_huge_page_size(PUD_SIZE);
> +       hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>  #endif
> -       add_huge_page_size(CONT_PMD_SIZE);
> -       add_huge_page_size(PMD_SIZE);
> -       add_huge_page_size(CONT_PTE_SIZE);
> +       hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
>
>         return 0;
>  }
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 2c3fa0a7787b..4d5ed1093615 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
>         if (!arch_hugetlb_valid_size((unsigned long)size))
>                 return -EINVAL;
>
> -       if (!size_to_hstate(size))
> -               hugetlb_add_hstate(shift - PAGE_SHIFT);
> +       hugetlb_add_hstate(shift - PAGE_SHIFT);
>         return 0;
>  }
>
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 4e5d7e9f0eef..932dadfdca54 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  static __init int gigantic_pages_init(void)
>  {
>         /* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
> -       if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
> +       if (IS_ENABLED(CONFIG_64BIT))
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>         return 0;
>  }
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 4618f96fd30f..ae819a16d07a 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
>  }
>
>  #ifdef CONFIG_HUGETLB_PAGE
> -static void __init add_huge_page_size(unsigned long size)
> -{
> -       unsigned int order;
> -
> -       if (size_to_hstate(size))
> -               return;
> -
> -       order = ilog2(size) - PAGE_SHIFT;
> -       hugetlb_add_hstate(order);
> -}
> -
>  static int __init hugetlbpage_init(void)
>  {
> -       add_huge_page_size(1UL << HPAGE_64K_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
> +       hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
>
>         return 0;
>  }
> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
> index 937d640a89e3..cf5781142716 100644
> --- a/arch/x86/mm/hugetlbpage.c
> +++ b/arch/x86/mm/hugetlbpage.c
> @@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  static __init int gigantic_pages_init(void)
>  {
>         /* With compaction or CMA we can allocate gigantic pages at runtime */
> -       if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
> +       if (boot_cpu_has(X86_FEATURE_GBPAGES))
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>         return 0;
>  }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index b2d276408cec..0e6eb755ae94 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3222,8 +3222,7 @@ static int __init hugetlb_init(void)
>                 }
>
>                 default_hstate_size = HPAGE_SIZE;
> -               if (!size_to_hstate(default_hstate_size))
> -                       hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> +               hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>         }
>         default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
>         if (default_hstate_max_huge_pages) {
> @@ -3268,7 +3267,6 @@ void __init hugetlb_add_hstate(unsigned int order)
>         unsigned long i;
>
>         if (size_to_hstate(PAGE_SIZE << order)) {
> -               pr_warn("hugepagesz= specified twice, ignoring\n");
>                 return;
>         }
>         BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
> @@ -3343,6 +3341,11 @@ static int __init hugepagesz_setup(char *s)
>                 return 0;
>         }
>
> +       if (size_to_hstate(size)) {
> +               pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n", s);
> +               return 0;
> +       }
> +
>         hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
>         return 1;
>  }
> --
> 2.25.2
>
