Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61324D5371
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 22:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF1rn3gCVz3bTc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 08:08:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KUljDMOI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KUljDMOI; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF1r94kt9z2xTn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 08:08:23 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id j2so13510430ybu.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AoJgc8/XnE4YrAFvzjMb/nlQIHB+pdKEnLifo5xoa18=;
 b=KUljDMOIzqGE2FBqr8pMlGir6/9goyS8TIVzokE5OtrWG88qLRUHma7TIXBIR0wbL4
 8nfib+aheOPJWl51BWVKggxaz0GQiR8ktsmHcFEQMwQeToyTw05G1HRQiqo/RzDD9k57
 En4tgXG2dUk/hRzydvwYJ/yu3W0kbJRN0rVPdJ+QQsqSHQS2Ff8/SWgvdrxlxX56vTcW
 N0muxSrY70ZKElG4jcyxnhqadPAw3Ri3hti7obESWGVwX8zROBoVseD6KAfajuNbbM61
 Vr15XTpBzvT0AT2wOl6uoPITVVSgXWvScZMoucwPzK9Shcn/0yvOWpuPRMA5+m4S+BtW
 uZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoJgc8/XnE4YrAFvzjMb/nlQIHB+pdKEnLifo5xoa18=;
 b=lmKZyF+bINOa228q/Ntg9B9ZGXRSF/DXfHjk95dShuzh+7PqT4vnHnVXVEjOTRXOHS
 pbUqo2dQDhRkqP/vIbQWlo89UjLCMaOK7DylPRqhPFzwGTOd1kAA7kvedKjQZe2pFwFq
 aAwRg1K/lU/v6f9+8GrdeXiGxBXiu2GofKBhG7FEk4QGkONpQ8Xijuqgop0wF1pAEFL3
 QUpguUqmo0CLf9zSnEg3uMw/MTJrOUYWBmNADlAZykeYy5fOecxi13rDx9ciKY9s5DD3
 NHOxz6pn0iFrPVFOierJenJA3du2XWPHkQKgN+VrMiIIlyF1L0RYWWJOsnRP5gXeah/y
 838A==
X-Gm-Message-State: AOAM530aSUKLPyDBlTNJ0UpreK+tsTyYkmtxceR9JgZa74x37nRkcZcI
 eP4I/f31fiZAG7o+erseaN0hxZB+mj0JNtHMKCYQ2w==
X-Google-Smtp-Source: ABdhPJwHHO2clzc5zDTSYlF0hJici3Nu0+6fZ8h3npgvBuTlFDcMMwLqvfjvJYerGu7PBi0lZV9SbiToj11l5pmbbg8=
X-Received: by 2002:a05:6902:1087:b0:628:788e:8a51 with SMTP id
 v7-20020a056902108700b00628788e8a51mr5327444ybu.242.1646946499750; Thu, 10
 Mar 2022 13:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20220309055118.1551013-1-maskray@google.com>
 <CAKwvOdmMS4=QAoBFvhAdXWaLHOwH2252FX9i_yZyiCOpOt=3Dw@mail.gmail.com>
In-Reply-To: <CAKwvOdmMS4=QAoBFvhAdXWaLHOwH2252FX9i_yZyiCOpOt=3Dw@mail.gmail.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Thu, 10 Mar 2022 13:08:08 -0800
Message-ID: <CAFP8O3+jJf=amTYjm6YQbJKAuK0XRNoG3Gwc6C+E0=CPd46ZAw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Replace ppc64 DT_RELACOUNT usage with
 DT_RELASZ/24
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 11:48 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 8, 2022 at 9:53 PM Fangrui Song <maskray@google.com> wrote:
> >
> > DT_RELACOUNT is an ELF dynamic tag inherited from SunOS indicating the
> > number of R_*_RELATIVE relocations. It is optional but {ld.lld,ld.lld}
> > -z combreloc always creates it (if non-zero) to slightly speed up glibc
> > ld.so relocation resolving by avoiding R_*R_PPC64_RELATIVE type
> > comparison. The tag is otherwise nearly unused in the wild and I'd
> > recommend that software avoids using it.
> >
> > lld>=14.0.0 (since commit da0e5b885b25cf4ded0fa89b965dc6979ac02ca9)
> > underestimates DT_RELACOUNT for ppc64 when position-independent long
> > branch thunks are used. Correcting it needs non-trivial arch-specific
> > complexity which I'd prefer to avoid. Since our code always compares the
> > relocation type with R_PPC64_RELATIVE, replacing every occurrence of
> > DT_RELACOUNT with DT_RELASZ/sizeof(Elf64_Rela)=DT_RELASZ/24 is a correct
> > alternative.
>
> checking that sizeof(Elf64_Rela) == 24, yep: https://godbolt.org/z/bb4aKbo5T
>
> >
> > DT_RELASZ is in practice bounded by an uint32_t. Dividing x by 24 can be
> > implemented as (uint32_t)(x*0xaaaaaaab) >> 4.
>
> Yep: https://godbolt.org/z/x9445ePPv
>
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1581
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > ---
> >  arch/powerpc/boot/crt0.S       | 28 +++++++++++++++++-----------
> >  arch/powerpc/kernel/reloc_64.S | 15 +++++++++------
> >  2 files changed, 26 insertions(+), 17 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> > index feadee18e271..1c96ebe7ef1a 100644
> > --- a/arch/powerpc/boot/crt0.S
> > +++ b/arch/powerpc/boot/crt0.S
> > @@ -8,7 +8,7 @@
> >  #include "ppc_asm.h"
> >
> >  RELA = 7
> > -RELACOUNT = 0x6ffffff9
> > +RELASZ = 8
> >
> >         .data
> >         /* A procedure descriptor used when booting this as a COFF file.
> > @@ -65,7 +65,7 @@ p_base:       mflr    r10             /* r10 now points to runtime addr of p_base */
> >         subf    r11,r11,r12     /* runtime - linktime offset */
> >
> >         /* The dynamic section contains a series of tagged entries.
> > -        * We need the RELA and RELACOUNT entries. */
> > +        * We need the RELA and RELASZ entries. */
> >         li      r9,0
> >         li      r0,0
> >  9:     lwz     r8,0(r12)       /* get tag */
> > @@ -75,18 +75,21 @@ p_base:     mflr    r10             /* r10 now points to runtime addr of p_base */
> >         bne     11f
> >         lwz     r9,4(r12)       /* get RELA pointer in r9 */
> >         b       12f
> > -11:    addis   r8,r8,(-RELACOUNT)@ha
> > -       cmpwi   r8,RELACOUNT@l
> > +11:    cmpwi   r8,RELASZ
> >         bne     12f
> > -       lwz     r0,4(r12)       /* get RELACOUNT value in r0 */
> > +       lwz     r0,4(r12)       /* get RELASZ / 24 in r0 */
> > +       lis     r8,0xaaaa
> > +       ori     r8,r8,0xaaab
> > +       mulhwu  r0,r0,r8
> > +       srwi    r0,r0,4
>
> Both translation units include arch/powerpc/include/asm/ppc_asm.h,
> which happens to define LOAD_REG_IMMEDIATE. Let's reuse that rather
> than open code lis+ori?
>
> >  12:    addi    r12,r12,8
> >         b       9b
> >
> >         /* The relocation section contains a list of relocations.
> >          * We now do the R_PPC_RELATIVE ones, which point to words
> >          * which need to be initialized with addend + offset.
> > -        * The R_PPC_RELATIVE ones come first and there are RELACOUNT
> > -        * of them. */
> > +        * The R_PPC_RELATIVE ones come first and there are at most
> > +         * RELASZ/24 of them. */
> >  10:    /* skip relocation if we don't have both */
> >         cmpwi   r0,0
> >         beq     3f
> > @@ -160,14 +163,17 @@ p_base:   mflr    r10             /* r10 now points to runtime addr of p_base */
> >         bne     10f
> >         ld      r13,8(r11)       /* get RELA pointer in r13 */
> >         b       11f
> > -10:    addis   r12,r12,(-RELACOUNT)@ha
> > -       cmpdi   r12,RELACOUNT@l
> > +10:    cmpdi   r12,RELASZ
> >         bne     11f
> > -       ld      r8,8(r11)       /* get RELACOUNT value in r8 */
> > +       ld      r8,8(r11)       /* get RELASZ / 24 in r8 */
> > +       lis     r0,0xaaaa
> > +       ori     r0,r0,0xaaab
> > +       mulhwu  r8,r8,r0
> > +       srwi    r8,r8,4
> >  11:    addi    r11,r11,16
> >         b       9b
> >  12:
> > -       cmpdi   r13,0            /* check we have both RELA and RELACOUNT */
> > +       cmpdi   r13,0            /* check we have both RELA and RELASZ */
> >         cmpdi   cr1,r8,0
> >         beq     3f
> >         beq     cr1,3f
> > diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
> > index 02d4719bf43a..362be759609f 100644
> > --- a/arch/powerpc/kernel/reloc_64.S
> > +++ b/arch/powerpc/kernel/reloc_64.S
> > @@ -8,7 +8,7 @@
> >  #include <asm/ppc_asm.h>
> >
> >  RELA = 7
> > -RELACOUNT = 0x6ffffff9
> > +RELASZ = 8
> >  R_PPC64_RELATIVE = 22
> >
> >  /*
> > @@ -27,7 +27,7 @@ _GLOBAL(relocate)
> >         add     r10,r10,r12     /* r10 has runtime addr of _stext */
> >
> >         /*
> > -        * Scan the dynamic section for the RELA and RELACOUNT entries.
> > +        * Scan the dynamic section for the RELA and RELASZ entries.
> >          */
> >         li      r7,0
> >         li      r8,0
> > @@ -38,13 +38,16 @@ _GLOBAL(relocate)
> >         bne     2f
> >         ld      r7,8(r11)       /* get RELA pointer in r7 */
> >         b       3f
> > -2:     addis   r6,r6,(-RELACOUNT)@ha
> > -       cmpdi   r6,RELACOUNT@l
> > +2:     cmpdi   r6,RELASZ
> >         bne     3f
> > -       ld      r8,8(r11)       /* get RELACOUNT value in r8 */
> > +       ld      r8,8(r11)       /* get RELA / 24 in r8 */
> > +       lis     r0,0xaaaa
> > +       ori     r0,r0,0xaaab
> > +       mulhwu  r8,r8,r0
> > +       srwi    r8,r8,4
> >  3:     addi    r11,r11,16
> >         b       1b
> > -4:     cmpdi   r7,0            /* check we have both RELA and RELACOUNT */
> > +4:     cmpdi   r7,0            /* check we have both RELA and RELASZ */
> >         cmpdi   cr1,r8,0
> >         beq     6f
> >         beq     cr1,6f
> > --
> > 2.35.1.616.g0bdcbb4464-goog
> >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>

I rebased the patch on
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
master and got a conflict.
Seems that https://lore.kernel.org/linuxppc-dev/20220309061822.168173-1-aik@ozlabs.ru/T/#u
("[PATCH kernel v4] powerpc/64: Add UADDR64 relocation support") fixed
the issue.
It just doesn't change arch/powerpc/boot/crt0.S
