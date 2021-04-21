Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC13664C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ88k2Qk7z30D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mzqbLV7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mzqbLV7i; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ88H0fmLz2xYb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:22:53 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 82so45809525yby.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 22:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iSbVU2V2KlZYBib7kF9wWJnnbWlfSncdeHXWKO6mFas=;
 b=mzqbLV7iHItHXVjD6BwHJrgl9xVdywWlhos6w3GFu8JnSqaE6M0WvQlBfoyDBy2Mgl
 bJBAMvcXgr/XiT62FGccGX66KFygPJfl+4ogekSjwSqXlYIvR9HlmkyiryM6n3zD1tJX
 87eXN1mOHV1FOfsBP1bCLJeMO2Rk5gFVe52vOANUOo7MaYNIc8ufyQkKRN55dlTCJXZn
 PmuBpRVNm9cGUFI2uwl0HsyXgz9pZwaQ9RuwCaEbLM9zHR2ZAuRCd31aUkMOF419jRGp
 CWjc7dLiiBWQwu0uBLsfUfZ05rWA9B+eQbAilQst3H2I6R9QdR0VfGzTFrVt4oYso2in
 p77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iSbVU2V2KlZYBib7kF9wWJnnbWlfSncdeHXWKO6mFas=;
 b=fg2VBjhbdBSdMEkg3rGRTBpYWmFoTMYt2SEkgw512NDjAKCs7OOJySLS/7w/jsX9q2
 GY0GQtOrvHunPXDJuczZjkOCosBBKJslwJTFqLPPAcRL6y5J/S9t0jXZqJBETrQDEuo8
 BNyqTSd6WUzby5/i6e0KA8xxcl5fi91S81KeBabKtPYE3LM3ezv4TWoIvigIUqj99Xaj
 BOULdgbQC4m0XJa39d8E9qxzDsXtkD09bwtxKuXKXb7WQCQ2PIAi2JK9t74R7nwWDgqT
 VXR8djL4Acsn5p6AGoc6Khv41YsJyrcRvHykr5YwwzoRZT7wNu+GJmYB8cTEjIsv5Qjh
 Qbkw==
X-Gm-Message-State: AOAM532/IMCe8t0piywpi/Y39rPG6Jb3czPmum4V9QQBA82DKv9m3qcN
 Pr1m9evMhXvdvngj6O11Cj4cBDKTlzs0jdTjWKs=
X-Google-Smtp-Source: ABdhPJyPvT/aDPRx7sdUr5SXMb22Jy1Uw+55Rj/CXIyO84VbSrG3Xvm1HKMenpMH8LMex1fJeGSSVWP8vdhVvGUUG4o=
X-Received: by 2002:a5b:b01:: with SMTP id z1mr6314168ybp.342.1618982571945;
 Tue, 20 Apr 2021 22:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-4-jniethe5@gmail.com>
 <c4977cfb-6d9d-063e-b74b-ba0ffd9feaeb@csgroup.eu>
 <CACzsE9oNQuymvv5FRUvzQ9uiytvFOcke5RsXA_urfKS1mtMnLg@mail.gmail.com>
 <8e0e850d-79b5-03ab-56c7-3d92ec72c7dc@csgroup.eu>
In-Reply-To: <8e0e850d-79b5-03ab-56c7-3d92ec72c7dc@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 15:22:39 +1000
Message-ID: <CACzsE9rZinwdvwQj-HU5XwiaYETOcDj+avVLAhfZUsz8hOPAJQ@mail.gmail.com>
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

On Wed, Apr 21, 2021 at 3:14 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 21/04/2021 =C3=A0 04:46, Jordan Niethe a =C3=A9crit :
> > On Fri, Apr 2, 2021 at 12:36 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 30/03/2021 =C3=A0 06:51, Jordan Niethe a =C3=A9crit :
> >>> If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
> >>> VMALLOC_END respectively. This reduces the need for special cases. Fo=
r
> >>> example, powerpc's module_alloc() was previously predicated on
> >>> MODULES_VADDR being defined but now is unconditionally defined.
> >>>
> >>> This will be useful reducing conditional code in other places that ne=
ed
> >>> to allocate from the module region (i.e., kprobes).
> >>>
> >>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >>> ---
> >>> v10: New to series
> >>> ---
> >>>    arch/powerpc/include/asm/pgtable.h | 5 +++++
> >>>    arch/powerpc/kernel/module.c       | 5 +----
> >>
> >> You probably also have changes to do in kernel/ptdump.c
> >>
> >> In mm/book3s32/mmu.c and mm/kasan/kasan_init_32.c as well allthough th=
at's harmless here.
> >>
> >>>    2 files changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/includ=
e/asm/pgtable.h
> >>> index 4eed82172e33..014c2921f26a 100644
> >>> --- a/arch/powerpc/include/asm/pgtable.h
> >>> +++ b/arch/powerpc/include/asm/pgtable.h
> >>> @@ -167,6 +167,11 @@ struct seq_file;
> >>>    void arch_report_meminfo(struct seq_file *m);
> >>>    #endif /* CONFIG_PPC64 */
> >>>
> >>> +#ifndef MODULES_VADDR
> >>> +#define MODULES_VADDR VMALLOC_START
> >>> +#define MODULES_END VMALLOC_END
> >>> +#endif
> >>> +
> >>>    #endif /* __ASSEMBLY__ */
> >>>
> >>>    #endif /* _ASM_POWERPC_PGTABLE_H */
> >>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/modul=
e.c
> >>> index a211b0253cdb..f1fb58389d58 100644
> >>> --- a/arch/powerpc/kernel/module.c
> >>> +++ b/arch/powerpc/kernel/module.c
> >>> @@ -14,6 +14,7 @@
> >>>    #include <asm/firmware.h>
> >>>    #include <linux/sort.h>
> >>>    #include <asm/setup.h>
> >>> +#include <linux/mm.h>
> >>>
> >>>    static LIST_HEAD(module_bug_list);
> >>>
> >>> @@ -87,13 +88,9 @@ int module_finalize(const Elf_Ehdr *hdr,
> >>>        return 0;
> >>>    }
> >>>
> >>> -#ifdef MODULES_VADDR
> >>>    void *module_alloc(unsigned long size)
> >>>    {
> >>> -     BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> >>> -
> >>
> >> The above check is needed somewhere, if you remove it from here you ha=
ve to perform the check
> >> somewhere else.
> >
> > This also introduces this warning:
> > fs/proc/kcore.c:626:52: warning: self-comparison always evaluates to
> > false [-Wtautological-compare]
> >    626 |  if (MODULES_VADDR !=3D VMALLOC_START && MODULES_END !=3D VMAL=
LOC_END) {
> > I might leave this patch out of this series and use an #ifdef for now
> > and make this change separately as a follow up.
>
> x86/32 at least does the same (see
> https://elixir.bootlin.com/linux/v5.12-rc8/source/arch/x86/include/asm/pg=
table_32_areas.h#L47)
>
> They probably also get the warning, so I think would shouldn't bother.
> One day someone will fix fs/proc/kcore.c , that's not a powerpc problem.
Yeah you are right. I'll add the BUILD_BUG_ON() check to
asm/task_size_32.h and keep the patch.
>
> >
> >>
> >>>        return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_EN=
D, GFP_KERNEL,
> >>>                                    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_P=
ERMS, NUMA_NO_NODE,
> >>>                                    __builtin_return_address(0));
> >>>    }
> >>> -#endif
> >>>
