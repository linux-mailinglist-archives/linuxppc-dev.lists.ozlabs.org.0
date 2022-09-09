Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D735B2E2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP4V40p01z3c4N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:36:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hvHDJXze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hvHDJXze;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP4TM4GFpz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:35:33 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id u9so1472085ejy.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 22:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iKtMZqEmWh/uOJlnBrz/o9nLRRcm+y0ShmM6Cw5Oj3U=;
        b=hvHDJXzeg8xYCDKb+/rAZR5ICCFFFx2xZDALOYiE1PwdJWDxrYXIy0t27pJ7m/eIpH
         MagO32z5mpuuN+g9fbiQTrO+6i59vDnWN0cXY0qYev7uBMF1dVMudPSJdFvgE2wkwMCM
         g7shnn9Uage1SVrUOUWBOb9NQ/ZjR1C7lRqazGwQ7mypTZFU+C/nqMnwVxpzO9tWZPcW
         /ZquZXc4faG7ecmdINGjO9jd53zNjaKmZkMPv9GfV0tXT1O0aeXgs0/lr/+S9r1/YExY
         j5oIHGLdePHLVDtlLPQqr69eLV72oee1cseVKQ3vvAipO/6Q97hY5qL2keoTwmNODKX8
         8/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iKtMZqEmWh/uOJlnBrz/o9nLRRcm+y0ShmM6Cw5Oj3U=;
        b=dvNnDAKutWp/FAuNhYnm7TneM7aPCmHcLOHtOlysDuFfSdRFLyVfh29FC+DazE4hrt
         hwxntuYyhYyQ1Qe3VAn/6UsjrNujKOhjeWtoikJlLdB6Gfyqg/4VT5W2CW4QOf1Q0YUK
         MmCi9f+5NYxYpJMuXsXc1rjnvjlNtri7M8FPxmUMYD97hlwy1bn5eoVoWdy2SIttPOV1
         wjxrbXzRgJ1gQJRZR1vgXnVr7oB11uHufKxFX9VLKFaxdAfC4Kgh6CAC04PuxTyJ2ZBA
         01FNAUfoppz2LF7Xtd5PhWBClRGTKDWir4NlXMoMR2lUAv7jZBhr6lphQ+xykihpckQz
         xAuQ==
X-Gm-Message-State: ACgBeo1nVJeszvrGxEksSbPiztcNqYoqGXP3z6QwJ97ADGFiP6C+TuiE
	VocKfCjBJE8UKZgXgXht4SGUEHlmDtQ07j448Mw=
X-Google-Smtp-Source: AA6agR6JZfAKBjf++aguLXWLEQgxCfz4d3Ba9m5LFI8F6x6GXBxNnly5aN+m0EJ9UC1aMq5P5xgnel0y+Gcxxj0EpfA=
X-Received: by 2002:a17:907:2c67:b0:779:7327:c890 with SMTP id
 ib7-20020a1709072c6700b007797327c890mr1874976ejc.702.1662701729394; Thu, 08
 Sep 2022 22:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
In-Reply-To: <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Sep 2022 17:35:18 +1200
Message-ID: <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 5:24 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > on x86, batched and deferred tlb shootdown has lead to 90%
> > performance increase on tlb shootdown. on arm64, HW can do
> > tlb shootdown without software IPI. But sync tlbi is still
> > quite expensive.
> >
> > Even running a simplest program which requires swapout can
> > prove this is true,
> >  #include <sys/types.h>
> >  #include <unistd.h>
> >  #include <sys/mman.h>
> >  #include <string.h>
> >
> >  int main()
> >  {
> >  #define SIZE (1 * 1024 * 1024)
> >          volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
> >                                           MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> >
> >          memset(p, 0x88, SIZE);
> >
> >          for (int k = 0; k < 10000; k++) {
> >                  /* swap in */
> >                  for (int i = 0; i < SIZE; i += 4096) {
> >                          (void)p[i];
> >                  }
> >
> >                  /* swap out */
> >                  madvise(p, SIZE, MADV_PAGEOUT);
> >          }
> >  }
> >
> > Perf result on snapdragon 888 with 8 cores by using zRAM
> > as the swap block device.
> >
> >  ~ # perf record taskset -c 4 ./a.out
> >  [ perf record: Woken up 10 times to write data ]
> >  [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
> >  ~ # perf report
> >  # To display the perf.data header info, please use --header/--header-only options.
> >  # To display the perf.data header info, please use --header/--header-only options.
> >  #
> >  #
> >  # Total Lost Samples: 0
> >  #
> >  # Samples: 60K of event 'cycles'
> >  # Event count (approx.): 35706225414
> >  #
> >  # Overhead  Command  Shared Object      Symbol
> >  # ........  .......  .................  .............................................................................
> >  #
> >     21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
> >      8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
> >      6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
> >      6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
> >      5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
> >      3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
> >      3.49%  a.out    [kernel.kallsyms]  [k] memset64
> >      1.63%  a.out    [kernel.kallsyms]  [k] clear_page
> >      1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
> >      1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
> >      1.23%  a.out    [kernel.kallsyms]  [k] xas_load
> >      1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock
> >
> > ptep_clear_flush() takes 5.36% CPU in the micro-benchmark
> > swapping in/out a page mapped by only one process. If the
> > page is mapped by multiple processes, typically, like more
> > than 100 on a phone, the overhead would be much higher as
> > we have to run tlb flush 100 times for one single page.
> > Plus, tlb flush overhead will increase with the number
> > of CPU cores due to the bad scalability of tlb shootdown
> > in HW, so those ARM64 servers should expect much higher
> > overhead.
> >
> > Further perf annonate shows 95% cpu time of ptep_clear_flush
> > is actually used by the final dsb() to wait for the completion
> > of tlb flush. This provides us a very good chance to leverage
> > the existing batched tlb in kernel. The minimum modification
> > is that we only send async tlbi in the first stage and we send
> > dsb while we have to sync in the second stage.
> >
> > With the above simplest micro benchmark, collapsed time to
> > finish the program decreases around 5%.
> >
> > Typical collapsed time w/o patch:
> >  ~ # time taskset -c 4 ./a.out
> >  0.21user 14.34system 0:14.69elapsed
> > w/ patch:
> >  ~ # time taskset -c 4 ./a.out
> >  0.22user 13.45system 0:13.80elapsed
> >
> > Also, Yicong Yang added the following observation.
> >       Tested with benchmark in the commit on Kunpeng920 arm64 server,
> >       observed an improvement around 12.5% with command
> >       `time ./swap_bench`.
> >               w/o             w/
> >       real    0m13.460s       0m11.771s
> >       user    0m0.248s        0m0.279s
> >       sys     0m12.039s       0m11.458s
> >
> >       Originally it's noticed a 16.99% overhead of ptep_clear_flush()
> >       which has been eliminated by this patch:
> >
> >       [root@localhost yang]# perf record -- ./swap_bench && perf report
> >       [...]
> >       16.99%  swap_bench  [kernel.kallsyms]  [k] ptep_clear_flush
> >
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Nadav Amit <namit@vmware.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> > Tested-by: Xin Hao <xhao@linux.alibaba.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  .../features/vm/TLB/arch-support.txt          |  2 +-
> >  arch/arm64/Kconfig                            |  1 +
> >  arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
> >  arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
> >  4 files changed, 40 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> >
> > diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> > index 1c009312b9c1..2caf815d7c6c 100644
> > --- a/Documentation/features/vm/TLB/arch-support.txt
> > +++ b/Documentation/features/vm/TLB/arch-support.txt
> > @@ -9,7 +9,7 @@
> >      |       alpha: | TODO |
> >      |         arc: | TODO |
> >      |         arm: | TODO |
> > -    |       arm64: | TODO |
> > +    |       arm64: |  ok  |
> >      |        csky: | TODO |
> >      |     hexagon: | TODO |
> >      |        ia64: | TODO |
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 571cc234d0b3..09d45cd6d665 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -93,6 +93,7 @@ config ARM64
> >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> >       select ARCH_SUPPORTS_NUMA_BALANCING
> >       select ARCH_SUPPORTS_PAGE_TABLE_CHECK
> > +     select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >       select ARCH_WANT_DEFAULT_BPF_JIT
> >       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> > diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
> > new file mode 100644
> > index 000000000000..fedb0b87b8db
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/tlbbatch.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ARCH_ARM64_TLBBATCH_H
> > +#define _ARCH_ARM64_TLBBATCH_H
> > +
> > +struct arch_tlbflush_unmap_batch {
> > +     /*
> > +      * For arm64, HW can do tlb shootdown, so we don't
> > +      * need to record cpumask for sending IPI
> > +      */
> > +};
> > +
> > +#endif /* _ARCH_ARM64_TLBBATCH_H */
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index 412a3b9a3c25..23cbc987321a 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -254,17 +254,24 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
> >       dsb(ish);
> >  }
> >
> > -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> > +
> > +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> >                                        unsigned long uaddr)
> >  {
> >       unsigned long addr;
> >
> >       dsb(ishst);
> > -     addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
> > +     addr = __TLBI_VADDR(uaddr, ASID(mm));
> >       __tlbi(vale1is, addr);
> >       __tlbi_user(vale1is, addr);
> >  }
> >
> > +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> > +                                      unsigned long uaddr)
> > +{
> > +     return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> > +}
> > +
> >  static inline void flush_tlb_page(struct vm_area_struct *vma,
> >                                 unsigned long uaddr)
> >  {
> > @@ -272,6 +279,23 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
> >       dsb(ish);
> >  }
> >
> > +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > +{
> > +     return true;
> > +}
>
> Always defer and batch up TLB flush, unconditionally ?

My understanding is we actually don't need tlbbatch for a machine with one
or two cores as the tlb flush is not expensive. even for a system with four
cortex-a55 cores, i didn't see obvious cost. it was less than 1%.
when we have 8 cores, we see the obvious cost of tlb flush. for a server with
100 crores, the cost is incredibly huge.

But, we can hardly write source code to differentiate machines according to
how many cores a machine has, especially when cores can be hot-plugged.

>
> > +
> > +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> > +                                     struct mm_struct *mm,
> > +                                     unsigned long uaddr)
> > +{
> > +     __flush_tlb_page_nosync(mm, uaddr);
> > +}
> > +
> > +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > +{
> > +     dsb(ish);
> > +}
>
> Adding up __flush_tlb_page_nosync() without a corresponding dsb(ish) and
> then doing once via arch_tlbbatch_flush() will have the same effect from
> an architecture perspective ?

The difference is we drop the cost of lots of single tlb flush. we
only need to sync
when we have to sync. dsb(ish) guarantees the completion of previous
multiple tlb
flush instructions.

>
> > +
> >  /*
> >   * This is meant to avoid soft lock-ups on large TLB flushing ranges and not
> >   * necessarily a performance improvement.

Thanks
Barry
