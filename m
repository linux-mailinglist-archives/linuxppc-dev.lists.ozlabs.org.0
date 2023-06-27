Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC2740432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 21:57:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f28I8lHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrFqZ4xDRz30XZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f28I8lHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrFpd04LNz301R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 05:56:38 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5704ddda6dfso54929917b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687895796; x=1690487796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdquro6/1dmVZnYjtrQgFcMxkU4TUJVZmkWoLqAkDfs=;
        b=f28I8lHAi89ozlaNg/BctKdKMs3ZV6m8KXjBDM6pClsFtWadf95y0x4g3i//E8BwZz
         W+z8+saIIFbmoUgBUaIpSnUEoRcLDnuqLYQnOFRS+j34fc48uptWzZzEtuGsHAJp24eW
         schrHDJX1LmM4MqcKy9Kl1+LnP3eq11QJcl+8rxobGaBQBGKgLHNc4OHDPWjyNPyHr8O
         3NCVuR4QFNH+Qpn6H6NXaags2ruLb1/5mkhPFAz5CmyBZqkztlzk4kjRiIcxN74282q0
         ok16c0PiSUSoXbXu9Py6nAmtPZ8zTkEwR31ZaDkNSc5taFwAdZNAWg6IT3kt5o5vZVZ6
         A8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687895796; x=1690487796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdquro6/1dmVZnYjtrQgFcMxkU4TUJVZmkWoLqAkDfs=;
        b=TR6hQPGaw5vfvl05k+v8seTjMXpZ9GXeBH9jxvtyFbp49JNZJ0fdlB9/E5IYwQodZK
         iNbQ9L4yjyqDWwmyuVVYhLdD7Ndco5f0dJo7Q4mLgxVyc/mUDLdWwW2wvcsgcvH7+qwe
         HQK9X2HBqaStm1uRgGDWFDszXn/mLEpfoWIzlbUJUF+MnmJLZ47xQafj/RGIiaZDACkB
         Xtp8GUkOUFC3LUdyM/b8NFnBAiJhDsgEXiSajUJRxkJrD9IomoNSdXLJPq9XloGBxr6v
         oi7zppV6YA4EkSThN16/si6fcZ4GDMh44SdD65ZDh6ws45JW1T/rDF7C0MCcEL7ZTUs+
         okTA==
X-Gm-Message-State: AC+VfDwc4VjZrCOk3P2CBM+AgJRuJL4PvEXpvME/znJ/Z+lbpUAhBdlq
	G66mhSeThQuMITN8e/xO7hD0DB49jihkiPb87ro=
X-Google-Smtp-Source: ACHHUZ5reIcGnTN97W0IND8v2qM1C2Qu4uLolES6NdKMr/CmT1WqgUFXujo/fo7+ykti4Dwr2zsHLXj/ugW36Uy1oLg=
X-Received: by 2002:a0d:de45:0:b0:576:e678:21d6 with SMTP id
 h66-20020a0dde45000000b00576e67821d6mr4351768ywe.12.1687895796450; Tue, 27
 Jun 2023 12:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com> <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net> <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
In-Reply-To: <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 12:56:25 -0700
Message-ID: <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 27, 2023 at 12:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 6/27/23 12:10, Guenter Roeck wrote:
> > On 6/27/23 10:42, Vishal Moola wrote:
> >> On Mon, Jun 26, 2023 at 10:47=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>
> >>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote=
:
> >>>> Part of the conversions to replace pgtable constructor/destructors w=
ith
> >>>> ptdesc equivalents.
> >>>>
> >>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> >>>
> >>> This patch causes all nios2 builds to fail.
> >>
> >> It looks like you tried to apply this patch on its own. This patch dep=
ends
> >> on patches 01-12 of this patchset to compile properly. I've cross-comp=
iled
> >> this architecture and it worked, but let me know if something fails
> >> when its applied on top of those patches (or the rest of the patchset)=
.
> >
> >
> > No, I did not try to apply this patch on its own. I tried to build yest=
erday's
> > pending-fixes branch of linux-next.
> >
>
> A quick check shows that the build fails with next-20230627. See log belo=
w.

Ah it looks like this one slipped into -next on its own somehow? Stephen, p=
lease
drop this patch from -next; it shouldn't be in without the rest of the
patchset which
I intend to have Andrew take through the mm tree.

> Guenter
>
> ---
>
> $ git describe
> next-20230627
> $ git describe --match 'v*'
> v6.4-12601-g53cdf865f90b
>
> Build reference: v6.4-12601-g53cdf865f90b
> Compiler version: nios2-linux-gcc (GCC) 11.4.0
> Assembler version: GNU assembler (GNU Binutils) 2.40
>
> Building nios2:allnoconfig ... failed
> --------------
> Error log:
> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> In file included from mm/memory.c:86:
> mm/memory.c: In function 'free_pte_range':
> arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of fu=
nction 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=
=3Dimplicit-function-declaration]
>     33 |                 pagetable_pte_dtor(page_ptdesc(pte));           =
        \
>        |                 ^~~~~~~~~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of fu=
nction 'page_ptdesc' [-Werror=3Dimplicit-function-declaration]
>     33 |                 pagetable_pte_dtor(page_ptdesc(pte));           =
        \
>        |                                    ^~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of fu=
nction 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Wer=
ror=3Dimplicit-function-declaration]
>     34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte))=
);      \
>        |                 ^~~~~~~~~~~~~~~~~~~~~~
> include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free=
_tlb'
>    666 |                 __pte_free_tlb(tlb, ptep, address);             =
\
>        |                 ^~~~~~~~~~~~~~
> mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
>    194 |         pte_free_tlb(tlb, token, addr);
>        |         ^~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:243: mm/memory.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:477: mm] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile:2022: .] Error 2
> make: *** [Makefile:226: __sub-make] Error 2
