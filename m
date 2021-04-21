Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BB3663CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:47:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ4hz2XXQz30Cr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:47:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PrXsSBsw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PrXsSBsw; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ4hW3j3yz2xZj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:47:04 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id k73so39186968ybf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hCOEHkyYiU1pYfAGmp5ap331/eNu+fbhApw4+t6/Jhs=;
 b=PrXsSBsw0GI1Tm1/wqHrPS6VeHZYaZ4tMMl17Y1C/DU8uKhub9hyGWNbJj9yrOCP98
 ylzt+E/jbX8Ll1YMJu0zccWUiSE1Dq54vsDJoKTHi+QBfDJC6Mak2hJVYYEbPXOB9oco
 PYYdfpr+6NizbWXM2ZElI9NBq7LxgmR7y5CvXYRVPhaZY6FR/zS9h7LOe0yxNRoaFMTL
 04H5yegoVM0O5qlzxRoW30QyXlkRUx3931S6+T71OR9c6lH3gcaKlFHm6bAcbYYK41eH
 7GURIWMSYiACrRa9h4IUJxKfrq41sBStdlVrOMtdj7Cuue91cbhpWrsahFc3IfPbXGyv
 S+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hCOEHkyYiU1pYfAGmp5ap331/eNu+fbhApw4+t6/Jhs=;
 b=X/DaJrG41IIjpLBhPnyTygNRX+0q2eqX3aCa+BZh7glHuOdDGr1E6qH/gPviceHbB2
 zz6OpczqZco2bw2BC6LnNjWqEdUXvJpIjiwl7sZh9z+W6nbRM6eX5p21VLGnPxokRLqX
 ykGbhSIVtf3oi9l7mKmOczXaLpQXC23brgMSihuU3prCBcQt/rFkI8Bdxx9LEEiTcU7U
 n5R95ZgWq5UyJ42PmwIN+8fcXPIUQRBVVr547AlozWBhAjFTZEwmiWPCUUoSOCYRGgay
 WRGXgZsdFez8b66aSr+pmgH1hPdvdfWzPvOs13caU+wFrmpS036C0RVJM3GkKbBplVyH
 00NQ==
X-Gm-Message-State: AOAM532ZromuelfAqXmfZYpHYNx9zfrz437kA3V8Hvx4DYITMREah5B8
 a+xph8Q3YpwKMNPhpiin0lijQoerhBnR0LOvwIQ=
X-Google-Smtp-Source: ABdhPJzIAR6EpgVJp7OxJNgq/V9oUvkaHxObHWIuK8wtlTdic6fuoJlMuoOimfJriGwe8HUp67cmxAOnZuie4vuUysg=
X-Received: by 2002:a5b:106:: with SMTP id 6mr19942962ybx.414.1618973221682;
 Tue, 20 Apr 2021 19:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-4-jniethe5@gmail.com>
 <c4977cfb-6d9d-063e-b74b-ba0ffd9feaeb@csgroup.eu>
In-Reply-To: <c4977cfb-6d9d-063e-b74b-ba0ffd9feaeb@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 12:46:50 +1000
Message-ID: <CACzsE9oNQuymvv5FRUvzQ9uiytvFOcke5RsXA_urfKS1mtMnLg@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] powerpc: Always define MODULES_{VADDR,END}
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

On Fri, Apr 2, 2021 at 12:36 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/03/2021 =C3=A0 06:51, Jordan Niethe a =C3=A9crit :
> > If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
> > VMALLOC_END respectively. This reduces the need for special cases. For
> > example, powerpc's module_alloc() was previously predicated on
> > MODULES_VADDR being defined but now is unconditionally defined.
> >
> > This will be useful reducing conditional code in other places that need
> > to allocate from the module region (i.e., kprobes).
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: New to series
> > ---
> >   arch/powerpc/include/asm/pgtable.h | 5 +++++
> >   arch/powerpc/kernel/module.c       | 5 +----
>
> You probably also have changes to do in kernel/ptdump.c
>
> In mm/book3s32/mmu.c and mm/kasan/kasan_init_32.c as well allthough that'=
s harmless here.
>
> >   2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/=
asm/pgtable.h
> > index 4eed82172e33..014c2921f26a 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -167,6 +167,11 @@ struct seq_file;
> >   void arch_report_meminfo(struct seq_file *m);
> >   #endif /* CONFIG_PPC64 */
> >
> > +#ifndef MODULES_VADDR
> > +#define MODULES_VADDR VMALLOC_START
> > +#define MODULES_END VMALLOC_END
> > +#endif
> > +
> >   #endif /* __ASSEMBLY__ */
> >
> >   #endif /* _ASM_POWERPC_PGTABLE_H */
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.=
c
> > index a211b0253cdb..f1fb58389d58 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -14,6 +14,7 @@
> >   #include <asm/firmware.h>
> >   #include <linux/sort.h>
> >   #include <asm/setup.h>
> > +#include <linux/mm.h>
> >
> >   static LIST_HEAD(module_bug_list);
> >
> > @@ -87,13 +88,9 @@ int module_finalize(const Elf_Ehdr *hdr,
> >       return 0;
> >   }
> >
> > -#ifdef MODULES_VADDR
> >   void *module_alloc(unsigned long size)
> >   {
> > -     BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > -
>
> The above check is needed somewhere, if you remove it from here you have =
to perform the check
> somewhere else.

This also introduces this warning:
fs/proc/kcore.c:626:52: warning: self-comparison always evaluates to
false [-Wtautological-compare]
  626 |  if (MODULES_VADDR !=3D VMALLOC_START && MODULES_END !=3D VMALLOC_E=
ND) {
I might leave this patch out of this series and use an #ifdef for now
and make this change separately as a follow up.

>
> >       return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, =
GFP_KERNEL,
> >                                   PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERM=
S, NUMA_NO_NODE,
> >                                   __builtin_return_address(0));
> >   }
> > -#endif
> >
