Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DC1E5086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XP8x1ZDqzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 07:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=alexander.duyck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lk/1i9OD; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XP760f1qzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 07:27:29 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id 18so25622866iln.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qt1Mul8KqCpRASljdw4+T2e5cAgm9DFXJi0Zu76Fifo=;
 b=Lk/1i9ODwRn8NFZPKwkFUvH4pwFFT3OsdKCUn4JM5bCAqX4gVkdlHfqqwoOdtv+Ruz
 C16rjr73Zi8/rLigpq55sQ2hpVpRGTm/zI0/FXGjaht1yDydzANY5DxD29WK9SeQkO+3
 ZkV4vgk+AzI9hClzECQs7hirLVcqHTQ0LcN/Sr1ucGccSSYuPvNoYk0uhCW1TnEqvALX
 GgA+xcJbvO0bkbi8SfRIEEpdyb2hI6JC3LsbJuN4zIarXadMjgek1tBcTQvDWsIC8VgH
 MI7TghjySqDSI7R1y/BTy94avGTA/I5X217KMd8HBpiW4Y5LYLZlqmlYDCixGbbMwcfX
 lnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qt1Mul8KqCpRASljdw4+T2e5cAgm9DFXJi0Zu76Fifo=;
 b=K0kknF2vliLfjtjfn9xYnDZmteP4igOp55dFOWSMK/ZKBmBQXHk5eWvBiWogK5+FRE
 Ma8sWO1ZuFVTnS7YSKWfhEyhv+1XsTgZWP7/TMubfb2lZgYy0vk04ITtE0EzDEw2eQU5
 KjVaBtUhdOHc8tdn/C31b4Dcya8D0ZdOqfAaGt6mYnqAraPUZPztoh/k8kgj54EPkPTE
 Z5wDwL3RHpeSWw5i+S1D/8za7W9K3zaCPeREi/5R1gfTqXWkS5nldDjQQzWe1f4kiC7h
 u4vUyyNFgSSp78ImlF16WUpN2luhxlwf9aKHRGwZ4fB8mUs25oCFdiwioYEf1YL1DL5s
 muEQ==
X-Gm-Message-State: AOAM5327AiI9Mxm4kKnczjsf9RVug7epVh6HbGZR2hrURN/CGpqOGVA2
 8D4NSCF1VSm+qfIf2kUGLMAT9bmwdM4WcnWNiG8=
X-Google-Smtp-Source: ABdhPJyFHNWLZhiyPwSxpttmcpH6F6nQy403W21Ub5Mxl4ERQoXnSo5CQa8WUb4oEksJiKTonOasELLRe73HFcOjlaY=
X-Received: by 2002:a92:5f46:: with SMTP id t67mr274324ilb.64.1590614846260;
 Wed, 27 May 2020 14:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
 <20200527173608.2885243-7-daniel.m.jordan@oracle.com>
In-Reply-To: <20200527173608.2885243-7-daniel.m.jordan@oracle.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 27 May 2020 14:27:15 -0700
Message-ID: <CAKgT0UcT7JuJcM3iG2ZhMDj32wz4KTgH2sv-jdyfhR0_jy85iA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] mm: parallelize deferred_init_memmap()
To: Daniel Jordan <daniel.m.jordan@oracle.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Steven Sistare <steven.sistare@oracle.com>,
 Pavel Machek <pavel@ucw.cz>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Zi Yan <ziy@nvidia.com>,
 Robert Elliott <elliott@hpe.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dan Williams <dan.j.williams@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 27, 2020 at 10:37 AM Daniel Jordan
<daniel.m.jordan@oracle.com> wrote:
>
> Deferred struct page init is a significant bottleneck in kernel boot.
> Optimizing it maximizes availability for large-memory systems and allows
> spinning up short-lived VMs as needed without having to leave them
> running.  It also benefits bare metal machines hosting VMs that are
> sensitive to downtime.  In projects such as VMM Fast Restart[1], where
> guest state is preserved across kexec reboot, it helps prevent
> application and network timeouts in the guests.
>
> Multithread to take full advantage of system memory bandwidth.
>
> The maximum number of threads is capped at the number of CPUs on the
> node because speedups always improve with additional threads on every
> system tested, and at this phase of boot, the system is otherwise idle
> and waiting on page init to finish.
>
> Helper threads operate on section-aligned ranges to both avoid false
> sharing when setting the pageblock's migrate type and to avoid accessing
> uninitialized buddy pages, though max order alignment is enough for the
> latter.
>
> The minimum chunk size is also a section.  There was benefit to using
> multiple threads even on relatively small memory (1G) systems, and this
> is the smallest size that the alignment allows.
>
> The time (milliseconds) is the slowest node to initialize since boot
> blocks until all nodes finish.  intel_pstate is loaded in active mode
> without hwp and with turbo enabled, and intel_idle is active as well.
>
>     Intel(R) Xeon(R) Platinum 8167M CPU @ 2.00GHz (Skylake, bare metal)
>       2 nodes * 26 cores * 2 threads = 104 CPUs
>       384G/node = 768G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --   4089.7 (  8.1)         --   1785.7 (  7.6)
>        2% (  1)       1.7%   4019.3 (  1.5)       3.8%   1717.7 ( 11.8)
>       12% (  6)      34.9%   2662.7 (  2.9)      79.9%    359.3 (  0.6)
>       25% ( 13)      39.9%   2459.0 (  3.6)      91.2%    157.0 (  0.0)
>       37% ( 19)      39.2%   2485.0 ( 29.7)      90.4%    172.0 ( 28.6)
>       50% ( 26)      39.3%   2482.7 ( 25.7)      90.3%    173.7 ( 30.0)
>       75% ( 39)      39.0%   2495.7 (  5.5)      89.4%    190.0 (  1.0)
>      100% ( 52)      40.2%   2443.7 (  3.8)      92.3%    138.0 (  1.0)
>
>     Intel(R) Xeon(R) CPU E5-2699C v4 @ 2.20GHz (Broadwell, kvm guest)
>       1 node * 16 cores * 2 threads = 32 CPUs
>       192G/node = 192G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --   1988.7 (  9.6)         --   1096.0 ( 11.5)
>        3% (  1)       1.1%   1967.0 ( 17.6)       0.3%   1092.7 ( 11.0)
>       12% (  4)      41.1%   1170.3 ( 14.2)      73.8%    287.0 (  3.6)
>       25% (  8)      47.1%   1052.7 ( 21.9)      83.9%    177.0 ( 13.5)
>       38% ( 12)      48.9%   1016.3 ( 12.1)      86.8%    144.7 (  1.5)
>       50% ( 16)      48.9%   1015.7 (  8.1)      87.8%    134.0 (  4.4)
>       75% ( 24)      49.1%   1012.3 (  3.1)      88.1%    130.3 (  2.3)
>      100% ( 32)      49.5%   1004.0 (  5.3)      88.5%    125.7 (  2.1)
>
>     Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz (Haswell, bare metal)
>       2 nodes * 18 cores * 2 threads = 72 CPUs
>       128G/node = 256G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --   1680.0 (  4.6)         --    627.0 (  4.0)
>        3% (  1)       0.3%   1675.7 (  4.5)      -0.2%    628.0 (  3.6)
>       11% (  4)      25.6%   1250.7 (  2.1)      67.9%    201.0 (  0.0)
>       25% (  9)      30.7%   1164.0 ( 17.3)      81.8%    114.3 ( 17.7)
>       36% ( 13)      31.4%   1152.7 ( 10.8)      84.0%    100.3 ( 17.9)
>       50% ( 18)      31.5%   1150.7 (  9.3)      83.9%    101.0 ( 14.1)
>       75% ( 27)      31.7%   1148.0 (  5.6)      84.5%     97.3 (  6.4)
>      100% ( 36)      32.0%   1142.3 (  4.0)      85.6%     90.0 (  1.0)
>
>     AMD EPYC 7551 32-Core Processor (Zen, kvm guest)
>       1 node * 8 cores * 2 threads = 16 CPUs
>       64G/node = 64G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --   1029.3 ( 25.1)         --    240.7 (  1.5)
>        6% (  1)      -0.6%   1036.0 (  7.8)      -2.2%    246.0 (  0.0)
>       12% (  2)      11.8%    907.7 (  8.6)      44.7%    133.0 (  1.0)
>       25% (  4)      13.9%    886.0 ( 10.6)      62.6%     90.0 (  6.0)
>       38% (  6)      17.8%    845.7 ( 14.2)      69.1%     74.3 (  3.8)
>       50% (  8)      16.8%    856.0 ( 22.1)      72.9%     65.3 (  5.7)
>       75% ( 12)      15.4%    871.0 ( 29.2)      79.8%     48.7 (  7.4)
>      100% ( 16)      21.0%    813.7 ( 21.0)      80.5%     47.0 (  5.2)
>
> Server-oriented distros that enable deferred page init sometimes run in
> small VMs, and they still benefit even though the fraction of boot time
> saved is smaller:
>
>     AMD EPYC 7551 32-Core Processor (Zen, kvm guest)
>       1 node * 2 cores * 2 threads = 4 CPUs
>       16G/node = 16G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --    716.0 ( 14.0)         --     49.7 (  0.6)
>       25% (  1)       1.8%    703.0 (  5.3)      -4.0%     51.7 (  0.6)
>       50% (  2)       1.6%    704.7 (  1.2)      43.0%     28.3 (  0.6)
>       75% (  3)       2.7%    696.7 ( 13.1)      49.7%     25.0 (  0.0)
>      100% (  4)       4.1%    687.0 ( 10.4)      55.7%     22.0 (  0.0)
>
>     Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz (Haswell, kvm guest)
>       1 node * 2 cores * 2 threads = 4 CPUs
>       14G/node = 14G memory
>
>                    kernel boot                 deferred init
>                    ------------------------    ------------------------
>     node% (thr)    speedup  time_ms (stdev)    speedup  time_ms (stdev)
>           (  0)         --    787.7 (  6.4)         --    122.3 (  0.6)
>       25% (  1)       0.2%    786.3 ( 10.8)      -2.5%    125.3 (  2.1)
>       50% (  2)       5.9%    741.0 ( 13.9)      37.6%     76.3 ( 19.7)
>       75% (  3)       8.3%    722.0 ( 19.0)      49.9%     61.3 (  3.2)
>      100% (  4)       9.3%    714.7 (  9.5)      56.4%     53.3 (  1.5)
>
> On Josh's 96-CPU and 192G memory system:
>
>     Without this patch series:
>     [    0.487132] node 0 initialised, 23398907 pages in 292ms
>     [    0.499132] node 1 initialised, 24189223 pages in 304ms
>     ...
>     [    0.629376] Run /sbin/init as init process
>
>     With this patch series:
>     [    0.231435] node 1 initialised, 24189223 pages in 32ms
>     [    0.236718] node 0 initialised, 23398907 pages in 36ms
>
> [1] https://static.sched.com/hosted_files/kvmforum2019/66/VMM-fast-restart_kvmforum2019.pdf
>
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Tested-by: Josh Triplett <josh@joshtriplett.org>
> ---
>  mm/Kconfig      |  6 +++---
>  mm/page_alloc.c | 46 ++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c1acc34c1c358..04c1da3f9f44c 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -750,13 +750,13 @@ config DEFERRED_STRUCT_PAGE_INIT
>         depends on SPARSEMEM
>         depends on !NEED_PER_CPU_KM
>         depends on 64BIT
> +       select PADATA
>         help
>           Ordinarily all struct pages are initialised during early boot in a
>           single thread. On very large machines this can take a considerable
>           amount of time. If this option is set, large machines will bring up
> -         a subset of memmap at boot and then initialise the rest in parallel
> -         by starting one-off "pgdatinitX" kernel thread for each node X. This
> -         has a potential performance impact on processes running early in the
> +         a subset of memmap at boot and then initialise the rest in parallel.
> +         This has a potential performance impact on tasks running early in the
>           lifetime of the system until these kthreads finish the
>           initialisation.
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d64f3027fdfa6..1d47016849531 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -68,6 +68,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/nmi.h>
>  #include <linux/psi.h>
> +#include <linux/padata.h>
>
>  #include <asm/sections.h>
>  #include <asm/tlbflush.h>
> @@ -1814,6 +1815,26 @@ deferred_init_maxorder(u64 *i, struct zone *zone, unsigned long *start_pfn,
>         return nr_pages;
>  }
>
> +static void __init
> +deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
> +                          void *arg)
> +{
> +       unsigned long spfn, epfn;
> +       struct zone *zone = arg;
> +       u64 i;
> +
> +       deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, start_pfn);
> +
> +       /*
> +        * Initialize and free pages in MAX_ORDER sized increments so that we
> +        * can avoid introducing any issues with the buddy allocator.
> +        */
> +       while (spfn < end_pfn) {
> +               deferred_init_maxorder(&i, zone, &spfn, &epfn);
> +               cond_resched();
> +       }
> +}
> +
>  /* Initialise remaining memory on a node */
>  static int __init deferred_init_memmap(void *data)
>  {
> @@ -1823,7 +1844,7 @@ static int __init deferred_init_memmap(void *data)
>         unsigned long first_init_pfn, flags;
>         unsigned long start = jiffies;
>         struct zone *zone;
> -       int zid;
> +       int zid, max_threads;
>         u64 i;
>
>         /* Bind memory initialisation thread to a local node if possible */
> @@ -1863,13 +1884,26 @@ static int __init deferred_init_memmap(void *data)
>                 goto zone_empty;
>
>         /*
> -        * Initialize and free pages in MAX_ORDER sized increments so
> -        * that we can avoid introducing any issues with the buddy
> -        * allocator.
> +        * More CPUs always led to greater speedups on tested systems, up to
> +        * all the nodes' CPUs.  Use all since the system is otherwise idle now.
>          */
> +       max_threads = max(cpumask_weight(cpumask), 1u);
> +
>         while (spfn < epfn) {
> -               deferred_init_maxorder(&i, zone, &spfn, &epfn);
> -               cond_resched();
> +               unsigned long epfn_align = ALIGN(epfn, PAGES_PER_SECTION);
> +               struct padata_mt_job job = {
> +                       .thread_fn   = deferred_init_memmap_chunk,
> +                       .fn_arg      = zone,
> +                       .start       = spfn,
> +                       .size        = epfn_align - spfn,
> +                       .align       = PAGES_PER_SECTION,
> +                       .min_chunk   = PAGES_PER_SECTION,
> +                       .max_threads = max_threads,
> +               };
> +
> +               padata_do_multithreaded(&job);
> +               deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn,
> +                                                   epfn_align);
>         }
>  zone_empty:
>         /* Sanity check that the next zone really is unpopulated */

So I am not a huge fan of using deferred_init_mem_pfn_range_in zone
simply for the fact that we end up essentially discarding the i value
and will have to walk the list repeatedly. However I don't think the
overhead will be that great as I suspect there aren't going to be
systems with that many ranges. So this is probably fine.

Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
