Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62139E9BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 00:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzT483TVNz30H2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 08:46:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GyQxI81d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GyQxI81d; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz8Jc0CYKz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 20:10:38 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id t9so13441630pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZHzx0rL9MdAUadCCLA+prC/o2aIaqUC2dlN2cCjZK0k=;
 b=GyQxI81dpz627gL97yPLABKwMlomoMsx6E+8IPCqZ6gIe4l9PEojvjhArY5suseGr2
 33fSExAOzvtfeGoyCixLMGsBCNCgt35fQi4ys4Nk/fhEU+QjL33s9bNmGM8J9p5uuKXY
 RR+Uz4U3K6Wy93phgNtHRMxhbPjRaqRfnW1i1BFk3WmFynPosUf/xFH7dzbc0EtnS4+Z
 Z+3ero8E8S7BwH6az7lew9Cg4/hjymqGxFb957kn6WSjW+QvJKFTLadqZeTReuyl6MnZ
 2tN6+WWL4QbZzEpUZ/TBN8sHjDAeAIj8vlOyY0NaqjiXlDmgEruLigcrAOF9krUqxMIf
 0hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZHzx0rL9MdAUadCCLA+prC/o2aIaqUC2dlN2cCjZK0k=;
 b=fWY1EGSWQ2iOzKtblMessP2NGUvNCHne/ZSZxbiYdqGUdwT7RDBvWfqwNBKtZ1fDtr
 g2n4FXLYHVloqWrU6J9KP82N4BR2s2Wardb12bQpkbEHgb5zFuatkx6SkOqsoFI8g9kD
 +LjsmLB4pFGObXk9tW6PoT0Kl92q6GlXZQKSSNjp+Xv+xkCgpzMrXIlQLGBJETMRMaEx
 aXyd9bAiMzyODGrP9V/Pyrsm24X+LTiB7OJfN3roqfLITDQvDIvuSBAgNRmW+fETNCWx
 EfweW2Vuxx3CLiJ0+z4rnYKWh/0k3mwo/J9f9jgU9UNpjuJ/VPxYJ+8ib60PcCrYHWeB
 rGGQ==
X-Gm-Message-State: AOAM532auHwRLBECqsYi5QWHqjgWxq0lpK8b8KY8xOKQVyqbdJa8H2gk
 1XXOelAyt6nrKul2MdYL3s2DtuW5mqzOZ9dYH14=
X-Google-Smtp-Source: ABdhPJxU3/30U9ZjhaW3RrNdBqW01I9VN2uCYqVO6cYMMCTHtI1kwgJ8wo69LzT+7mwiTGdIRqhJ1GQUYIkeRFANpcA=
X-Received: by 2002:a63:7702:: with SMTP id s2mr17155353pgc.106.1623060633019; 
 Mon, 07 Jun 2021 03:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:67d0:0:0:0:0 with HTTP; Mon, 7 Jun 2021 03:10:32
 -0700 (PDT)
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
From: Nick Piggin <npiggin@gmail.com>
Date: Mon, 7 Jun 2021 20:10:32 +1000
Message-ID: <CAPa8GCAmgUyqqAcuLC7KxDvDepkqhhvVcwgSGJh92PT+LoMQcw@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Speedup mremap on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000007ae6bc05c42a40ce"
X-Mailman-Approved-At: Tue, 08 Jun 2021 08:45:37 +1000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000007ae6bc05c42a40ce
Content-Type: text/plain; charset="UTF-8"

On Monday, 7 June 2021, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> wrote:

>
> This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
> the platform to support updating higher-level page tables without
> updating page table entries. This also needs to invalidate the Page Walk
> Cache on architecture supporting the same.
>
> Changes from v6:
> * Update ppc64 flush_tlb_range to invalidate page walk cache.


I'd really rather not do this, I'm not sure if micro bench mark captures
everything.

Page tables coming from L2/L3 probably aren't the primary purpose or
biggest benefit of intermediate level caches.

The situation on POWER with nest mmu (coherent accelerators) is magnified.
They have huge page walk cashes to make up for the fact they don't have
data caches for walking page tables which makes the invalidation more
painful in terms of subsequent misses, but also latency to invalidate (can
be order of microseconds whereas a page invalidate is a couple of orders of
magnitude faster).

Yes it is a deficiency of the ppc invalidation architecture, we are aware
and would like to improve it but for now those is what we have.

Thanks,
Nick


> * Add patches to fix race between mremap and page out
> * Add patch to fix build error with page table levels 2
>
> Changes from v5:
> * Drop patch mm/mremap: Move TLB flush outside page table lock
> * Add fixes for race between optimized mremap and page out
>
> Changes from v4:
> * Change function name and arguments based on review feedback.
>
> Changes from v3:
> * Fix build error reported by kernel test robot
> * Address review feedback.
>
> Changes from v2:
> * switch from using mmu_gather to flush_pte_tlb_pwc_range()
>
> Changes from v1:
> * Rebase to recent upstream
> * Fix build issues with tlb_gather_mmu changes
>
>
> Aneesh Kumar K.V (11):
>   mm/mremap: Fix race between MOVE_PMD mremap and pageout
>   mm/mremap: Fix race between MOVE_PUD mremap and pageout
>   selftest/mremap_test: Update the test to handle pagesize other than 4K
>   selftest/mremap_test: Avoid crash with static build
>   mm/mremap: Convert huge PUD move to separate helper
>   mm/mremap: Don't enable optimized PUD move if page table levels is 2
>   mm/mremap: Use pmd/pud_poplulate to update page table entries
>   powerpc/mm/book3s64: Fix possible build error
>   mm/mremap: Allow arch runtime override
>   powerpc/book3s64/mm: Update flush_tlb_range to flush page walk cache
>   powerpc/mm: Enable HAVE_MOVE_PMD support
>
>  .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
>  arch/powerpc/include/asm/tlb.h                |   6 +
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |   8 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c          |  70 +++++++----
>  arch/powerpc/platforms/Kconfig.cputype        |   2 +
>  include/linux/rmap.h                          |  13 +-
>  mm/mremap.c                                   | 104 +++++++++++++--
>  mm/page_vma_mapped.c                          |  43 ++++---
>  tools/testing/selftests/vm/mremap_test.c      | 118 ++++++++++--------
>  9 files changed, 251 insertions(+), 115 deletions(-)
>
> --
> 2.31.1
>
>

--0000000000007ae6bc05c42a40ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, 7 June 2021, Aneesh Kumar K.V &lt;<a href=3D"mailto:anee=
sh.kumar@linux.ibm.com">aneesh.kumar@linux.ibm.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires<br>
the platform to support updating higher-level page tables without<br>
updating page table entries. This also needs to invalidate the Page Walk<br=
>
Cache on architecture supporting the same.<br>
<br>
Changes from v6:<br>
* Update ppc64 flush_tlb_range to invalidate page walk cache.</blockquote><=
div><br></div><div>I&#39;d really rather not do this, I&#39;m not sure if m=
icro bench mark captures everything.</div><div><br></div><div>Page tables c=
oming from L2/L3 probably aren&#39;t the primary purpose or biggest benefit=
 of intermediate level caches.</div><div><br></div><div>The situation on PO=
WER with nest mmu (coherent accelerators) is magnified. They have huge page=
 walk cashes to make up for the fact they don&#39;t have data caches for wa=
lking page tables which makes the invalidation more painful in terms of sub=
sequent misses, but also latency to invalidate (can be order of microsecond=
s whereas a page invalidate is a couple of orders of magnitude faster).</di=
v><div><br></div><div>Yes it is a deficiency of the ppc invalidation archit=
ecture, we are aware and would like to improve it but for now those is what=
 we have.</div><div><br></div><div>Thanks,</div><div>Nick</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
* Add patches to fix race between mremap and page out<br>
* Add patch to fix build error with page table levels 2<br>
<br>
Changes from v5:<br>
* Drop patch mm/mremap: Move TLB flush outside page table lock<br>
* Add fixes for race between optimized mremap and page out<br>
<br>
Changes from v4:<br>
* Change function name and arguments based on review feedback.<br>
<br>
Changes from v3:<br>
* Fix build error reported by kernel test robot<br>
* Address review feedback.<br>
<br>
Changes from v2:<br>
* switch from using mmu_gather to flush_pte_tlb_pwc_range() <br>
<br>
Changes from v1:<br>
* Rebase to recent upstream<br>
* Fix build issues with tlb_gather_mmu changes<br>
<br>
<br>
Aneesh Kumar K.V (11):<br>
=C2=A0 mm/mremap: Fix race between MOVE_PMD mremap and pageout<br>
=C2=A0 mm/mremap: Fix race between MOVE_PUD mremap and pageout<br>
=C2=A0 selftest/mremap_test: Update the test to handle pagesize other than =
4K<br>
=C2=A0 selftest/mremap_test: Avoid crash with static build<br>
=C2=A0 mm/mremap: Convert huge PUD move to separate helper<br>
=C2=A0 mm/mremap: Don&#39;t enable optimized PUD move if page table levels =
is 2<br>
=C2=A0 mm/mremap: Use pmd/pud_poplulate to update page table entries<br>
=C2=A0 powerpc/mm/book3s64: Fix possible build error<br>
=C2=A0 mm/mremap: Allow arch runtime override<br>
=C2=A0 powerpc/book3s64/mm: Update flush_tlb_range to flush page walk cache=
<br>
=C2=A0 powerpc/mm: Enable HAVE_MOVE_PMD support<br>
<br>
=C2=A0.../include/asm/book3s/64/<wbr>tlbflush-radix.h=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0arch/powerpc/include/asm/tlb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0arch/powerpc/mm/book3s64/<wbr>radix_hugetlbpage.c=C2=A0 |=C2=A0 =C2=
=A08 +-<br>
=C2=A0arch/powerpc/mm/book3s64/<wbr>radix_tlb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 70 +++++++----<br>
=C2=A0arch/powerpc/platforms/<wbr>Kconfig.cputype=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0include/linux/rmap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
=C2=A0mm/mremap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 104 =
+++++++++++++--<br>
=C2=A0mm/page_vma_mapped.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 43 ++++---<br>
=C2=A0tools/testing/selftests/vm/<wbr>mremap_test.c=C2=A0 =C2=A0 =C2=A0 | 1=
18 ++++++++++--------<br>
=C2=A09 files changed, 251 insertions(+), 115 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote>

--0000000000007ae6bc05c42a40ce--
