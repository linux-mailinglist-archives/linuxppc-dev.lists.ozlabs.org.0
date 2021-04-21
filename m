Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5B43663C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ4X819GHz30D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vAEPh5KZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vAEPh5KZ; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ4Wk39kkz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:39:30 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id g38so45448071ybi.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DV9H/Wp3R17uwsFqNkPH4uav9Mv1wcCE4FDQnUwtg6Q=;
 b=vAEPh5KZnBc5fY1LwKAsM3He53rRRrgDD5zgEQWI0tm6USr1YsmNRHVOli4fW5Qrj/
 w4LIR5b5Hk/20TKYfTiumXtK6IWhvzOBRVJJL6wgxCSoUjJnbeIx6UY+8UPSJ5Kfjl78
 vPCyfY1ychMdbu1Wt9fQvK6ASLtfatyuuAQ73Ve6Fa95562fPNUjZJnrotVzmU0zRJUk
 eLEKcJIzUJUGZ4YOdTXaGlA4IVrZqk7cJ8znFwzODTnci2SVyhbOCmbS38FGpvQWOB4i
 h93jEoRsxpBfnIWGp6BeK5GfWqkGiupaGPEMNm5uahOrJUH41NTknUTemdo9W2v5SUxt
 kNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DV9H/Wp3R17uwsFqNkPH4uav9Mv1wcCE4FDQnUwtg6Q=;
 b=FjFEyQuMKJK2hDtbnbQQLu9jcYeU2KFiFbTaDK2a+b2WePdW2I/ER2wIz+g8RjAnGc
 BY697aJU5zpahErm/mbftRp88ET2GWZZUUXLy5/2qzabcVUyiAUsGwK4w6gYKN2F1ENn
 BrUPwRFm/fq0bYUvWxUIM7r8553gi+VNXtA/4MirSzEmZk/qK4dL1RP+4HINMX1sS+na
 f0Sd5PZ8b+UHpifXjHvndgyPHqvlxTASANcFMHlS09VFQFI8vmfPUJ5nJ4UbpIidzXLQ
 IxLIz75rkhGTrRyIOqcMPZTroyjSrjRGj2aO5pt0R4ocPKtoF7Yrk39QKV/DJbRC3LFm
 XFSg==
X-Gm-Message-State: AOAM5339rGUfOYNE9D5P/L/rwtSXm0Cb6Nz78Z0l3C8O7A5DKIhZoSvL
 f/0Hw2ex5OiUoQFHXDAok8P0qKf0PASNKsMP7Dc=
X-Google-Smtp-Source: ABdhPJxFxIfR928NaNfeOm5u/IFF2INUMz136VfkMWvHnfYnk7KZYojl8z61Tc2UU+CggDwXHljuOaTLpWUbOg76lX4=
X-Received: by 2002:a05:6902:532:: with SMTP id
 y18mr28599676ybs.377.1618972766862; 
 Tue, 20 Apr 2021 19:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-5-jniethe5@gmail.com>
 <d61a1b2f-4a22-fb43-e8fe-a7612431c4ad@csgroup.eu>
In-Reply-To: <d61a1b2f-4a22-fb43-e8fe-a7612431c4ad@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 12:39:15 +1000
Message-ID: <CACzsE9p4cOmdXKvcgBRDFT=CEQkrvJoJ+LEDU4E5FGBpdoXJxA@mail.gmail.com>
Subject: Re: [PATCH v10 04/10] powerpc/kprobes: Mark newly allocated probes as
 ROX
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 4:05 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/03/2021 =C3=A0 06:51, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > Add the arch specific insn page allocator for powerpc. This allocates
> > ROX pages if STRICT_KERNEL_RWX is enabled. These pages are only written
> > to with patch_instruction() which is able to write RO pages.
> >
> > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > [jpn: Reword commit message, switch to __vmalloc_node_range()]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v9: - vmalloc_exec() no longer exists
> >      - Set the page to RW before freeing it
> > v10: - use __vmalloc_node_range()
> > ---
> >   arch/powerpc/kernel/kprobes.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobe=
s.c
> > index 01ab2163659e..3ae27af9b094 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -25,6 +25,7 @@
> >   #include <asm/sections.h>
> >   #include <asm/inst.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/vmalloc.h>
> >
> >   DEFINE_PER_CPU(struct kprobe *, current_kprobe) =3D NULL;
> >   DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> > @@ -103,6 +104,19 @@ kprobe_opcode_t *kprobe_lookup_name(const char *na=
me, unsigned int offset)
> >       return addr;
> >   }
> >
> > +void *alloc_insn_page(void)
> > +{
> > +     if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> > +             return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, =
MODULES_END,
> > +                             GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RES=
ET_PERMS,
> > +                             NUMA_NO_NODE, __builtin_return_address(0)=
);
> > +     } else {
> > +             return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, =
MODULES_END,
> > +                             GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RE=
SET_PERMS,
> > +                             NUMA_NO_NODE, __builtin_return_address(0)=
);
> > +     }
> > +}
> > +
>
> What about
>
> void *alloc_insn_page(void)
> {
>         pgprot_t prot =3D IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ? PAGE_KER=
NEL_ROX : PAGE_KERNEL_EXEC;
>
>         return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, MODULES_=
END,
>                         GFP_KERNEL, prot, VM_FLUSH_RESET_PERMS,
>                         NUMA_NO_NODE, __builtin_return_address(0));
> }
Yes, that is better.
>
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >       int ret =3D 0;
> >
