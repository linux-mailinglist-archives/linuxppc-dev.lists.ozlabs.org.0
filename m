Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3233E307
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 01:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0WqG6HPqz3bn7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 11:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mRjOTL5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mRjOTL5m; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Wpq6YgPz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 11:52:51 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id p193so38801813yba.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NxUM1sZEZv9FwlXPXL8prqm9a8Jk0oulO59saQnUY3o=;
 b=mRjOTL5mEMMiBIEHvV0MrOeastuk3K5i6m+oK4RkkFfZXU00ITBxyEA7/1uH/rngXY
 fpd2dCI6AKixc0CQy/z0N6PZmQX3zyHhgLohP9XP28R3CTZWF3TnpROGz20qQ2trDcIP
 QH4FNbFiS8uAV4bg2TuNNB2bid5ZpF8UA8G6zcJ1DowhXmGzhAJxSr824Oq5hkO5LRkU
 pLCrzavc7x60O65P+HnlB+UQPcSnwEqd6wWFgYlQrRWTDnt2StXGErfewmsISiba+N0v
 qZydInYp73dP1V6wGQ8TEiMyzyP1YcT0gGm4a7cslVKM3WHNt2H+OxfUw86eUk5jI4Lo
 YV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NxUM1sZEZv9FwlXPXL8prqm9a8Jk0oulO59saQnUY3o=;
 b=CenXb+M4iwW/oqmh2/kY0M95L2pPCsHc8v2ZjG0RpZqp+iHh5d91sZkjKOhJ8J4FZP
 Wk2X6v9SMZKhkDKfg8jAjYEElrD+3TQ6NPYTZQULv8W6avJM7uOoYzszGS4nwpAs+RWu
 wvkg8olMhW2Frh4woTc561/sNt7jGCN494ew+IN4tU2s25DTDqtWarjlDfsEPj8wR6U2
 AExJDhKjg8vhsNB9sX+BFlgc6CEQyvl41tqLr/6Rp1Xb9a2YwHolHHgV6HxqEZE45HjW
 /Jv25bGWgwVarPYraGTKmkWc5p/LC7W5dxencJAKTcUf4PB+iAToL74FiySLETekllnx
 k7bA==
X-Gm-Message-State: AOAM5301pfjsFQEa8O3Gr1r8fnjiVu1Ivfp1X3aAgJv/Azap//WGL1tj
 IPDxJgPnpJfMej5l4lApho/Zi1duVZ+f769FO8Y=
X-Google-Smtp-Source: ABdhPJw3VbvPeiqZz4d5aSGxt7KJ/mw/kfy5on6mgisGOZdWlntu+Iy+u2ff9REcY+WuXNA/E+hWTvlYsMFkEtwVfiM=
X-Received: by 2002:a25:ca88:: with SMTP id a130mr1919089ybg.414.1615942368318; 
 Tue, 16 Mar 2021 17:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-3-jniethe5@gmail.com>
 <6d04f7c6-8950-2666-13cc-d2f7bf788952@csgroup.eu>
In-Reply-To: <6d04f7c6-8950-2666-13cc-d2f7bf788952@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 17 Mar 2021 11:52:37 +1100
Message-ID: <CACzsE9pM7ysy8DnjzBuOVmKHgPHrN6cBD2+3_Dz_-vKqOf0LXw@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] powerpc/kprobes: Mark newly allocated probes as RO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, ajd@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 5:44 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/03/2021 =C3=A0 04:17, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > With CONFIG_STRICT_KERNEL_RWX=3Dy and CONFIG_KPROBES=3Dy, there will be=
 one
> > W+X page at boot by default.  This can be tested with
> > CONFIG_PPC_PTDUMP=3Dy and CONFIG_PPC_DEBUG_WX=3Dy set, and checking the
> > kernel log during boot.
> >
>
> This text is confusing. I don't understand what is the status before the =
patch, and what is the
> status after.
>
> "there will be one ...", does it mean after the patch ?
>
> > Add an arch specific insn page allocator which returns RO pages if
> > STRICT_KERNEL_RWX is enabled. This page is only written to with
> > patch_instruction() which is able to write RO pages.
>
> "an" or "the" arch specific insn page allocator ?
>
> >
> > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > [jpn: Reword commit message, switch from vmalloc_exec(), add
> >        free_insn_page()]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v9: - vmalloc_exec() no longer exists
> >      - Set the page to RW before freeing it
> > ---
> >   arch/powerpc/kernel/kprobes.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobe=
s.c
> > index 01ab2163659e..bb7e4d321988 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -25,6 +25,8 @@
> >   #include <asm/sections.h>
> >   #include <asm/inst.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/set_memory.h>
> > +#include <linux/vmalloc.h>
> >
> >   DEFINE_PER_CPU(struct kprobe *, current_kprobe) =3D NULL;
> >   DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> > @@ -103,6 +105,26 @@ kprobe_opcode_t *kprobe_lookup_name(const char *na=
me, unsigned int offset)
> >       return addr;
> >   }
> >
> > +void *alloc_insn_page(void)
> > +{
> > +     void *page =3D vmalloc(PAGE_SIZE);
>
> Can't do that on book3s/32, see https://github.com/linuxppc/linux/commit/=
6ca05532 and
> https://github.com/linuxppc/linux/commit/7fbc22ce
>
> Should do:
>         return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, =
GFP_KERNEL,
>                                     PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS=
, NUMA_NO_NODE,
>                                     __builtin_return_address(0));
>
>
> To keep it simple, you'll probably need to define MODULES_VADDR and MODUL=
ES_END as resp
> VMALLOC_START and VMALLOC_END when they are not defined, maybe in asm/pgt=
able.h
Thank you, I had overlooked that. I will do it like that in the next revisi=
on.
>
> > +
> > +     if (!page)
> > +             return NULL;
> > +
> > +     set_memory_ro((unsigned long)page, 1);
> > +     set_memory_x((unsigned long)page, 1);
> > +
> > +     return page;
> > +}
> > +
> > +void free_insn_page(void *page)
> > +{
> > +     set_memory_nx((unsigned long)page, 1);
> > +     set_memory_rw((unsigned long)page, 1);
> > +     vfree(page);
> > +}
> > +
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >       int ret =3D 0;
> >
