Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D101BB5E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 07:32:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B9Jm1t7SzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 15:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Be9W6G7H; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B9GL5pJbzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 15:30:34 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id j4so30638078otr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 22:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FjGm/coNzLqx5LqHFEzzOMkWH6twiJJSg/OBcoW+FzY=;
 b=Be9W6G7HJRYZ7WxILPoEoSNKvJYQO5h5f+qOasaQieGoW0zwPz/Q8I+qbn4vNSvgHg
 9J0TlPejj5FCzyOv4u4Nj8fp3zbaiAWprvPj5UbCkDBOwUpYpPJ04fx+NguTxcB6d6mH
 rfqvhgDBB/VdUpDFjqJJKGmFv3o5wEykDjY0ySZ+uIIRyaRjEzCyvcuR2zjwSsLH3oMH
 dcu15mvk1t15IhGroMw4LS+Fm84UjsGSMnxrM88rE7UR0iTDbwfK89j0S8QmAPVqAsep
 fOVX37kBE8EOtlwCBiZou10u1cQZD1B36xpb+Y1sZgqL1nPkBH6wZ2IQ1EEigo2FtdAD
 q/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjGm/coNzLqx5LqHFEzzOMkWH6twiJJSg/OBcoW+FzY=;
 b=Wz3qwu8GV9OcqvMgb0QJtSBIXNdo6n8+6LhKHihVAkDY8mBT0ePlfZXYdMjusCJzAx
 xxzAI5WYetdL869go4RDD/8La2a9/e9FmwOMyUpsL6Xq7noKqEB1ptK3WT7VaScbtXst
 1Oho7pGEvdgZp5AuCkxVqnQgQgo03uZ5elGDd9r8MQCjDMV9SNCtJBJ9rPEwP0h04ulh
 wdewI+4QnTwc+FrUGbRRq2d/WDWbOL/iwPOcyfiWduf5COd6Fo+8Tmd8Ol4UXTVlhpoO
 fROZGaJ3cnuWH8G9R0TUykTzpxJC1uycs205hvBx9hc3MpIw5W6Isnm2KpUBSCKoXUwu
 rkqQ==
X-Gm-Message-State: AGi0PuZFwYRdamUZUfPsVwDImQlgO2FQzDCp8m3vggpWSrbzRltWqxCa
 zyvIR7VWipGluAGtp5XCQw4gz5PSMcHgVmeIl54=
X-Google-Smtp-Source: APiQypJR6GDvizgjwtxEdlw71CmiylrBcW8PTVHOSPk8cF6VTMcxPoLGQBd6jT4PxksWYRnGCMOB9FfyPd7mVYHNWXA=
X-Received: by 2002:aca:d6c1:: with SMTP id n184mr1784838oig.126.1588051831323; 
 Mon, 27 Apr 2020 22:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428015814.15380-1-jniethe5@gmail.com>
 <20200428015814.15380-4-jniethe5@gmail.com>
 <6761670b-545c-0120-48e3-1cadf047a95f@c-s.fr>
In-Reply-To: <6761670b-545c-0120-48e3-1cadf047a95f@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 28 Apr 2020 15:30:20 +1000
Message-ID: <CACzsE9oF4eLH_5JUrSC1XfyWG_QzJ45HK=Rj+XwfxhuVxe5k0g@mail.gmail.com>
Subject: Re: [PATCH v6 03/28] powerpc/xmon: Move breakpoints to text section
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 3:20 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 28/04/2020 =C3=A0 03:57, Jordan Niethe a =C3=A9crit :
> > The instructions for xmon's breakpoint are stored bpt_table[] which is =
in
> > the data section. This is problematic as the data section may be marked
> > as no execute. Move bpt_table[] to the text section.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v6: - New to series. Was part of the previous patch.
> >      - Make BPT_SIZE available in assembly
> > ---
> >   arch/powerpc/kernel/asm-offsets.c |  8 ++++++++
> >   arch/powerpc/xmon/Makefile        |  2 +-
> >   arch/powerpc/xmon/xmon.c          |  6 +-----
> >   arch/powerpc/xmon/xmon_bpts.S     |  9 +++++++++
> >   arch/powerpc/xmon/xmon_bpts.h     | 14 ++++++++++++++
> >   5 files changed, 33 insertions(+), 6 deletions(-)
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> >
> > diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/as=
m-offsets.c
> > index c25e562f1cd9..2401f415f423 100644
> > --- a/arch/powerpc/kernel/asm-offsets.c
> > +++ b/arch/powerpc/kernel/asm-offsets.c
> > @@ -70,6 +70,10 @@
> >   #include <asm/fixmap.h>
> >   #endif
> >
> > +#ifdef CONFIG_XMON
> > +#include "../xmon/xmon_bpts.h"
> > +#endif
> > +
> >   #define STACK_PT_REGS_OFFSET(sym, val)      \
> >       DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
> >
> > @@ -783,5 +787,9 @@ int main(void)
> >       DEFINE(VIRT_IMMR_BASE, (u64)__fix_to_virt(FIX_IMMR_BASE));
> >   #endif
> >
> > +#ifdef CONFIG_XMON
> > +     DEFINE(BPT_SIZE, BPT_SIZE);
> > +#endif
> > +
> >       return 0;
> >   }
> > diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> > index c3842dbeb1b7..515a13ea6f28 100644
> > --- a/arch/powerpc/xmon/Makefile
> > +++ b/arch/powerpc/xmon/Makefile
> > @@ -21,7 +21,7 @@ endif
> >
> >   ccflags-$(CONFIG_PPC64) :=3D $(NO_MINIMAL_TOC)
> >
> > -obj-y                        +=3D xmon.o nonstdio.o spr_access.o
> > +obj-y                        +=3D xmon.o nonstdio.o spr_access.o xmon_=
bpts.o
> >
> >   ifdef CONFIG_XMON_DISASSEMBLY
> >   obj-y                       +=3D ppc-dis.o ppc-opc.o
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index a064392df1b8..f7ce3ea8694c 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -62,6 +62,7 @@
> >
> >   #include "nonstdio.h"
> >   #include "dis-asm.h"
> > +#include "xmon_bpts.h"
> >
> >   #ifdef CONFIG_SMP
> >   static cpumask_t cpus_in_xmon =3D CPU_MASK_NONE;
> > @@ -108,7 +109,6 @@ struct bpt {
> >   #define BP_TRAP             2
> >   #define BP_DABR             4
> >
> > -#define NBPTS        256
> >   static struct bpt bpts[NBPTS];
> >   static struct bpt dabr;
> >   static struct bpt *iabr;
> > @@ -116,10 +116,6 @@ static unsigned bpinstr =3D 0x7fe00008;    /* trap=
 */
> >
> >   #define BP_NUM(bp)  ((bp) - bpts + 1)
> >
> > -#define BPT_SIZE       (sizeof(unsigned int) * 2)
> > -#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
> > -static unsigned int bpt_table[NBPTS * BPT_WORDS];
> > -
> >   /* Prototypes */
> >   static int cmds(struct pt_regs *);
> >   static int mread(unsigned long, void *, int);
> > diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpt=
s.S
> > new file mode 100644
> > index 000000000000..f3ad0ab50854
> > --- /dev/null
> > +++ b/arch/powerpc/xmon/xmon_bpts.S
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#include <asm/ppc_asm.h>
> > +#include <asm/asm-compat.h>
> > +#include <asm/asm-offsets.h>
> > +#include "xmon_bpts.h"
> > +
> > +.global bpt_table
> > +bpt_table:
> > +     .space NBPTS * BPT_SIZE
>
> No alignment required ? Standard alignment (probably 4 bytes ?) is
> acceptable ?
No, I'll add a .balign    4 to be sure.
>
>
> > diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpt=
s.h
> > new file mode 100644
> > index 000000000000..b7e94375db86
> > --- /dev/null
> > +++ b/arch/powerpc/xmon/xmon_bpts.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef XMON_BPTS_H
> > +#define XMON_BPTS_H
> > +
> > +#define NBPTS        256
> > +#ifndef __ASSEMBLY__
> > +#define BPT_SIZE     (sizeof(unsigned int) * 2)
> > +#define BPT_WORDS    (BPT_SIZE / sizeof(unsigned int))
> > +
> > +extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +#endif /* XMON_BPTS_H */
> >
>
> Christophe
