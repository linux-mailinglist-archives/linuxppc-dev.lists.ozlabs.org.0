Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35B33E302
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 01:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Wmj37nQz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 11:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=o4lxg0zx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o4lxg0zx; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0WmG6dxsz2yy6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 11:50:37 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x19so38818526ybe.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rHtctz7Y3KXrB9p0wFpCMeVJtMqrvBaFojqFhU6v/v4=;
 b=o4lxg0zx31lIKSSPFfZB7fNZtb4pLgzp/Neza+hmYoRZ4U7y7sRvChgQSm1AvmGf0+
 6MolpWuAQNWyceeOP7BOlkQEIbhlH+/bdjqOaw6TmIRf162v0Z0kchO/UQS+b8sRrJK3
 qAUxJr/QeXgmO2HtDKme4JpFmdTZUgMiut+5k/5avhWkbiT6OopyxiDAXGIte0jAaeRT
 6eytp9bjSz0/O08YmfgTfMS1pE39bSuTWXEGcrRHUURFl3XkzpSlD5dTT3eym7Il300U
 q5Oer4zjG0Vwdt8Qw3TDeuQfGAGO0wTQqDYHBnFwoO3/QtAdwIT99aP7LUD2W632DCj4
 OxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rHtctz7Y3KXrB9p0wFpCMeVJtMqrvBaFojqFhU6v/v4=;
 b=QKcara64/fbtKUQaaKuoKGx/zg8+z8arFZzfRXbQ/cznlzGtJMMvoiJGD7xyw02+VK
 n4MiFZg0Rufhl1ONJJFnVtWUlZt4ssMnqsvOYfmVQQjwi3YIbVYERgHZbZlOHwiXBQLX
 ns5J9LZeGhvmfIDW+VPqw08dxcEj3lbT0SQ/Q5lGb9zKPj4NuVww5Nstoe9Ba4szl8Ev
 hCQZ0mFZs08ZYClCjTwXys6BmeO+uYKj04zkQ2WGbPgtUfIXltAIhRrrWFPrelFhxxJz
 ehA5h+ZtsWiXP2ugwPiQucyE5sUvQ5G2YJlS2Wno5Uxb4P/6M9TAtEEWR+tc/4HBYg4b
 /CVw==
X-Gm-Message-State: AOAM5301FndZkDyt+5jIpSZ3+z4G1JNu3uWJ8GVyWwIWaETfTMH7bWLn
 YKOPYYLW4rdmfhlPJiflhh4lYfjnR4iz9v9/10B3vU9R03qeRiEu
X-Google-Smtp-Source: ABdhPJzjrYKKZ8dlHxxjKRUsx3QVnA0HUuHmGLPehwTjXawLVXbNejSbsmDcYzB5MpAjHnBFdBC8bVIp+CyJfcj2A6c=
X-Received: by 2002:a25:e6d1:: with SMTP id d200mr1885644ybh.265.1615942234417; 
 Tue, 16 Mar 2021 17:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-3-jniethe5@gmail.com>
 <6d04f7c6-8950-2666-13cc-d2f7bf788952@csgroup.eu>
In-Reply-To: <6d04f7c6-8950-2666-13cc-d2f7bf788952@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 17 Mar 2021 11:50:22 +1100
Message-ID: <CACzsE9rXBLGxYxUQgDxU42h-6dOPXy8fW+pxa452f-Y7Yjq4mg@mail.gmail.com>
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
Before the patch kprobes is allocating W+X pages. This can be seen in
the kernel log with those debug options on.
After the patch kprobes  no longer allocate W+X pages.
I will reword it to more clear.
>
> "there will be one ...", does it mean after the patch ?
No, before, after there will be none.
>
> > Add an arch specific insn page allocator which returns RO pages if
> > STRICT_KERNEL_RWX is enabled. This page is only written to with
> > patch_instruction() which is able to write RO pages.
>
> "an" or "the" arch specific insn page allocator ?
Hmm, will go with "the arch specific insn page allocator for powerpc".
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
