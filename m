Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A76A4B7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 20:47:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQWHB0Z7Hz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 06:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.175; helo=mail-qt1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQWGf0Wj9z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 06:46:49 +1100 (AEDT)
Received: by mail-qt1-f175.google.com with SMTP id c18so8010545qte.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 11:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgbfP6t1iEXlYeQDHgpgkGKrmlu/wPbkfmiZJDZsq5c=;
        b=hrxvBGa1/UT0xcKQyvZ5YsHZZGfinszn/3HAst3nLqYpsibhH50RWY9XkblUxQSqFH
         wtUfo9n6RQ7A7bPfZRuvuNr9v2UaH5gLkE3OgkypPuEPLgWbJVg27fq2lFEEMRU6lQk8
         UvylvCXVJZgg+4OzJu3zif85bfGcwgjc4u9YbC7ClsNG3VxJ6tSTSAN3/VPI2CnV/ovR
         sqnF09/0PKtWPxGKNXiPitQyTuDcoAnBM3EU6saQo/umuP/V3rRhGja33e4D4i0sa6uO
         gp/OY1PO2Xs0dkOmusv/oTzleKjcJ+6x1AnW9DppyZcTVxwa1u3PG1m1IdtA6Hrgi0mq
         6INg==
X-Gm-Message-State: AO0yUKVeefbf/8v1zgU0H16g2qmxRew1qMNCo3dH+eKFlDx34ITaK0lx
	Go56ddtl34GmdUOIb4El07uuoduAW8aZ6w==
X-Google-Smtp-Source: AK7set/kOHj2NS+w5mChDrQ9pw6Yj5eBDM+aVWOdvkQPhLIH77KnE/EXT658q2pCYgjfQ1KWSZigRg==
X-Received: by 2002:a05:622a:89:b0:3bf:dbd3:a02e with SMTP id o9-20020a05622a008900b003bfdbd3a02emr804220qtw.45.1677527206605;
        Mon, 27 Feb 2023 11:46:46 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id r23-20020ac85217000000b003b8238114d9sm5170699qtn.12.2023.02.27.11.46.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 11:46:45 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-53852143afcso207907607b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 11:46:45 -0800 (PST)
X-Received: by 2002:a5b:d4e:0:b0:967:f8b2:7a42 with SMTP id
 f14-20020a5b0d4e000000b00967f8b27a42mr7816406ybr.7.1677527205039; Mon, 27 Feb
 2023 11:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113171026.582290-1-david@redhat.com> <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
 <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com> <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
 <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
In-Reply-To: <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Feb 2023 20:46:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
Message-ID: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
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

On Mon, Feb 27, 2023 at 6:01 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>    /*
> >>>>     * Externally used page protection values.
> >>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
> >>>> index 42f5988e998b..7e3de54bf426 100644
> >>>> --- a/arch/microblaze/include/asm/pgtable.h
> >>>> +++ b/arch/microblaze/include/asm/pgtable.h

> >>>>     * - All other bits of the PTE are loaded into TLBLO without
> >>>>     *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
> >>>>     * software PTE bits.  We actually use bits 21, 24, 25, and
> >>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
> >>>>    #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
> >>>>    #define _PMD_PRESENT   PAGE_MASK
> >>>>
> >>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> >>>
> >>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> >>> wrong?
> >>
> >> In the example, I use MSB-0 bit numbering (which I determined to be
> >> correct in microblaze context eventually, but I got confused a couple a
> >> times because it's very inconsistent). That should be MSB-0 bit 24.
> >
> > Thanks, TIL microblaze uses IBM bit numbering...
>
> I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?

Correct, as seen in s370 and PowerPC manuals...

> I recall that I used the comment above "/* Definitions for MicroBlaze.
> */" as an orientation.
>
> 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G

Indeed, that's where I noticed the "unconventional" numbering...

> So ... either we adjust both or we leave it as is. (again, depends on
> what the right thing to to is -- which I don't know :) )

It depends whether you want to match the hardware documentation,
or the Linux BIT() macro and friends...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
