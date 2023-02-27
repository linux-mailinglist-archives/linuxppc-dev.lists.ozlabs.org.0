Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF26A44F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 15:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQNYC143hz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 01:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.175; helo=mail-qt1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQNXc1c8xz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 01:43:26 +1100 (AEDT)
Received: by mail-qt1-f175.google.com with SMTP id d7so6763779qtr.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 06:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtpzGlheMp9cWEjldclbCx07Trvxzhn2kfeNTxmqNPE=;
        b=vQ4kzIfjkiBmA44kLOjboj9ynIx1MzYfiaoI+RCCxpJL53tlfYpfDOxpf94MDDg0bp
         vDzus+3y3oIgC+YbaG3iosjaP+RRhxcdOAbFuQfcwNyupcOk9wUvoEzZEr6augqN8v1s
         n8G+vpDq4xTGLX6rManLLChUqyg16fT4LFd3oNajrAVAPPtEP3KA8sM2B5shZWIxfQlh
         Xbyi/SslX7KUNA5ffCcubsgY4ZO469Kf+IqqByBGvFBcNsD4bPOHF18zxfuRDdTCLWk4
         fAO7M5RdRPlTYnclkiIMMIOOU8XUAG/kHlgBLcY1BQ1LH5nfcN/slFQ1C13Uo1ui8F9x
         WZeA==
X-Gm-Message-State: AO0yUKWQvuE/N0A8GJ5NDTCUysQ1uh/ka6gzWGlYblqFcPaGUW1YBTGn
	bRKfiEDHKH+YnM6HnNWa5YF/QT6Zehv/Og==
X-Google-Smtp-Source: AK7set9PJR/czC0dajbf9719yT12TShmdS0pG5ypNZHV6200haH64MMx45x27Fi9jPZ5JgD5TiX3nw==
X-Received: by 2002:a05:622a:1904:b0:3bf:b896:ff72 with SMTP id w4-20020a05622a190400b003bfb896ff72mr24221068qtc.68.1677509002886;
        Mon, 27 Feb 2023 06:43:22 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm4747366qts.30.2023.02.27.06.43.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:43:22 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536bbef1c5eso181363807b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 06:43:21 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr10571733ywk.5.1677509001567; Mon, 27 Feb
 2023 06:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20230113171026.582290-1-david@redhat.com> <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com> <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
In-Reply-To: <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Feb 2023 15:43:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
Message-ID: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David,

On Mon, Feb 27, 2023 at 2:31 PM David Hildenbrand <david@redhat.com> wrote:
> On 26.02.23 21:13, Geert Uytterhoeven wrote:
> > On Fri, Jan 13, 2023 at 6:16 PM David Hildenbrand <david@redhat.com> wrote:
> >> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
> >> from the type. Generic MM currently only uses 5 bits for the type
> >> (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.
> >>
> >> The shift by 2 when converting between PTE and arch-specific swap entry
> >> makes the swap PTE layout a little bit harder to decipher.
> >>
> >> While at it, drop the comment from paulus---copy-and-paste leftover
> >> from powerpc where we actually have _PAGE_HASHPTE---and mask the type in
> >> __swp_entry_to_pte() as well.
> >>
> >> Cc: Michal Simek <monstr@monstr.eu>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Thanks for your patch, which is now commit b5c88f21531c3457
> > ("microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") in
> >
>
> Right, it went upstream, so we can only fixup.
>
> >>   arch/m68k/include/asm/mcf_pgtable.h   |  4 +--
> >
> > What is this m68k change doing here?
> > Sorry for not noticing this earlier.
>
> Thanks for the late review, still valuable :)
>
> That hunk should have gone into the previous patch, looks like I messed
> that up when reworking.
>
> >
> > Furthermore, several things below look strange to me...
> >
> >>   arch/microblaze/include/asm/pgtable.h | 45 +++++++++++++++++++++------
> >>   2 files changed, 37 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
> >> index 3f8f4d0e66dd..e573d7b649f7 100644
> >> --- a/arch/m68k/include/asm/mcf_pgtable.h
> >> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> >> @@ -46,8 +46,8 @@
> >>   #define _CACHEMASK040          (~0x060)
> >>   #define _PAGE_GLOBAL040                0x400   /* 68040 global bit, used for kva descs */
> >>
> >> -/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
> >> -#define _PAGE_SWP_EXCLUSIVE    0x080
> >> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >> +#define _PAGE_SWP_EXCLUSIVE    CF_PAGE_NOCACHE
> >
> > CF_PAGE_NOCACHE is 0x80, so this is still bit 7, thus the new comment
> > is wrong?
>
> You're right, it's still bit 7 (and we use LSB-0 bit numbering in that
> file). I'll send a fixup.

OK.

> >>   /*
> >>    * Externally used page protection values.
> >> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
> >> index 42f5988e998b..7e3de54bf426 100644
> >> --- a/arch/microblaze/include/asm/pgtable.h
> >> +++ b/arch/microblaze/include/asm/pgtable.h
> >> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
> >>    * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
> >>    * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
> >>    * zone.
> >> - * - PRESENT *must* be in the bottom two bits because swap cache
> >> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
> >> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
> >> - * is cleared in the TLB miss handler before the TLB entry is loaded.
> >> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
> >> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
> >> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
> >> + * before the TLB entry is loaded.
> >
> > So the PowerPC 4xx comment is still here?
>
> I only dropped the comment above __swp_type(). I guess you mean that we
> could also drop the "Because 4xx doesn't support SMP anyway, M is
> irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not

Yes, that's what I meant.

> sure about the "Bit 30 is cleared in the TLB miss handler" comment, if
> that can similarly be dropped.

No idea, didn't check. But if it was copied from PPC, chances are
high it's no longer true....

> >>    * - All other bits of the PTE are loaded into TLBLO without
> >>    *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
> >>    * software PTE bits.  We actually use bits 21, 24, 25, and
> >> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
> >>   #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
> >>   #define _PMD_PRESENT   PAGE_MASK
> >>
> >> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> >
> > _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> > wrong?
>
> In the example, I use MSB-0 bit numbering (which I determined to be
> correct in microblaze context eventually, but I got confused a couple a
> times because it's very inconsistent). That should be MSB-0 bit 24.

Thanks, TIL microblaze uses IBM bit numbering...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
