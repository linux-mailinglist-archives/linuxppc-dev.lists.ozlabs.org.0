Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B44FC01
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 16:12:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WvWZ2TkrzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 00:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="XT80z7eL"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WvSs43lxzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 00:10:04 +1000 (AEST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x5NE9i1G026136
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 23:09:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5NE9i1G026136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561298985;
 bh=7DrdzqGtK5Y7N0S66FZgjsMEvNefGAC5fLt9hgMKs4M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XT80z7eLGgOQnrgsK30BjntfvHfVOaknd7EyGUqr6EGIdXf8bWKkk6ZT0juw2Q4cj
 9kR3233maD9iRLPFQ1aaYRFEv1fc03KjZxLQicR4W8WsAf+YtwlBq5HSIWdNJs1wl0
 +5W+O0qseaoSezdRdKbJ2HunH0XqmntmnRjMsHf12tSIRDiVSYgzUOu/BoVcb722rM
 Q2u4JVp5eoPFGaYZxWOo/mjmpe1PMkgtYYzdI2u0GyKp0OqrVSEcigFXg9UfcUCUMn
 EmGQmMSR0zo2sGtpF7wxRW0Pce/PB9x7rnIu9ooVR/+GEpfsRJxLCtqWhDMOKMN8YP
 AN1DMRg4lyrGQ==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id o2so4684929uae.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 07:09:44 -0700 (PDT)
X-Gm-Message-State: APjAAAWGfkJGo/TYFI9Hg5y82xllRajEOdsQmmxr0Ggj4DFIo7ashrvw
 gOUM/GYEIGInq+JKBgUP8BZxzn59tblSFKAcx40=
X-Google-Smtp-Source: APXvYqwLqOxLA12mww6wVSFtva4zQ7F/DVpEIq5zBS5i1DRrlXlbYvKX+Wt0iogyjnmX8slY85KwVV+l5bvhf+llGUg=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr65484522uaf.95.1561298983528; 
 Sun, 23 Jun 2019 07:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <1558444404-12254-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1558444404-12254-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Jun 2019 23:09:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoHtS0aqO9NCvwxAstJQxfeXhaWvh=1MQD3Wje8Pnmtw@mail.gmail.com>
Message-ID: <CAK7LNARoHtS0aqO9NCvwxAstJQxfeXhaWvh=1MQD3Wje8Pnmtw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/mm: mark more tlb functions as __always_inline
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 10:19 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> With CONFIG_OPTIMIZE_INLINING enabled, Laura Abbott reported error
> with gcc 9.1.1:
>
>   arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
>   arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 probably doesn't match constraints
>     104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>         |  ^~~
>   arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible constraint in 'asm'
>
> Fixing _tlbiel_pid() is enough to address the warning above, but I
> inlined more functions to fix all potential issues.
>
> To meet the "i" (immediate) constraint for the asm operands, functions
> propagating "ric" must be always inlined.
>
> Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
> Reported-by: Laura Abbott <labbott@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Ping.
This missed the recent PR, but
I believe this should be fixed.

Thanks.

>
> Changes in v2:
>   - Do not split lines
>
>  arch/powerpc/mm/book3s64/hash_native.c |  2 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c   | 32 ++++++++++++++++----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
> index aaa28fd..c854151 100644
> --- a/arch/powerpc/mm/book3s64/hash_native.c
> +++ b/arch/powerpc/mm/book3s64/hash_native.c
> @@ -60,7 +60,7 @@ static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
>   * tlbiel instruction for hash, set invalidation
>   * i.e., r=1 and is=01 or is=10 or is=11
>   */
> -static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
> +static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
>                                         unsigned int pid,
>                                         unsigned int ric, unsigned int prs)
>  {
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 4d84136..4d3dc10 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -29,7 +29,7 @@
>   * tlbiel instruction for radix, set invalidation
>   * i.e., r=1 and is=01 or is=10 or is=11
>   */
> -static inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
> +static __always_inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
>                                         unsigned int pid,
>                                         unsigned int ric, unsigned int prs)
>  {
> @@ -150,8 +150,8 @@ static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
>         trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
>  }
>
> -static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
> -                               unsigned long ric)
> +static __always_inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
> +                                               unsigned long ric)
>  {
>         unsigned long rb,rs,prs,r;
>
> @@ -167,8 +167,8 @@ static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
>  }
>
>
> -static inline void __tlbiel_va(unsigned long va, unsigned long pid,
> -                              unsigned long ap, unsigned long ric)
> +static __always_inline void __tlbiel_va(unsigned long va, unsigned long pid,
> +                                       unsigned long ap, unsigned long ric)
>  {
>         unsigned long rb,rs,prs,r;
>
> @@ -183,8 +183,8 @@ static inline void __tlbiel_va(unsigned long va, unsigned long pid,
>         trace_tlbie(0, 1, rb, rs, ric, prs, r);
>  }
>
> -static inline void __tlbie_va(unsigned long va, unsigned long pid,
> -                             unsigned long ap, unsigned long ric)
> +static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
> +                                      unsigned long ap, unsigned long ric)
>  {
>         unsigned long rb,rs,prs,r;
>
> @@ -199,8 +199,8 @@ static inline void __tlbie_va(unsigned long va, unsigned long pid,
>         trace_tlbie(0, 0, rb, rs, ric, prs, r);
>  }
>
> -static inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
> -                             unsigned long ap, unsigned long ric)
> +static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
> +                                           unsigned long ap, unsigned long ric)
>  {
>         unsigned long rb,rs,prs,r;
>
> @@ -239,7 +239,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
>  /*
>   * We use 128 set in radix mode and 256 set in hpt mode.
>   */
> -static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
> +static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
>  {
>         int set;
>
> @@ -341,7 +341,7 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
>         asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>
> -static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
> +static __always_inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
>  {
>         int set;
>
> @@ -381,8 +381,8 @@ static inline void __tlbiel_va_range(unsigned long start, unsigned long end,
>                 __tlbiel_va(addr, pid, ap, RIC_FLUSH_TLB);
>  }
>
> -static inline void _tlbiel_va(unsigned long va, unsigned long pid,
> -                             unsigned long psize, unsigned long ric)
> +static __always_inline void _tlbiel_va(unsigned long va, unsigned long pid,
> +                                      unsigned long psize, unsigned long ric)
>  {
>         unsigned long ap = mmu_get_ap(psize);
>
> @@ -413,8 +413,8 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
>                 __tlbie_va(addr, pid, ap, RIC_FLUSH_TLB);
>  }
>
> -static inline void _tlbie_va(unsigned long va, unsigned long pid,
> -                             unsigned long psize, unsigned long ric)
> +static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
> +                                     unsigned long psize, unsigned long ric)
>  {
>         unsigned long ap = mmu_get_ap(psize);
>
> @@ -424,7 +424,7 @@ static inline void _tlbie_va(unsigned long va, unsigned long pid,
>         asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>
> -static inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
> +static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
>                               unsigned long psize, unsigned long ric)
>  {
>         unsigned long ap = mmu_get_ap(psize);
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
