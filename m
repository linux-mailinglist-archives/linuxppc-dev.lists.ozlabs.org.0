Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E91627429B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 17:31:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=r0WnIICq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsMr65zyJz3c3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 01:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=r0WnIICq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsMqB5L3Pz3bTC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:31:01 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-57725e1c24bso7826187b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688052658; x=1690644658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL6wKBophCJT750RGEYyX1lE9eIiUgZcFU/NnUJTEDA=;
        b=r0WnIICqLcQpC2z4k1OXqjdIHwbyPvk1Z8ri5rmK+ckoNK18AT6VPUSbdQmfmsx18M
         wpL4jWqQfgb/a0s8JMpZaBrgwnhJIf1ZGhC2od40BCjr+QlmX2ql2nZl1ck/r7A8cgTa
         n0RD9fpWUbCghdSpcnZNAOfA8ihWS+0uQ7L4MUsNXxfZoEYZsiYCuttP18dSP3+DAvuQ
         Y0KT2h9YNtynUz89d0/QqugdvmBW+mUOFFNQLmfN9qfC1rZIqrqRPTUQIPAJEt1tnlQX
         FC34JywB7aEarHByxfMPXtMTg/OEGYqBC8nbWMkvV1YAG76K9xeVTkeqDCIyr7z2EoiU
         15Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052658; x=1690644658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VL6wKBophCJT750RGEYyX1lE9eIiUgZcFU/NnUJTEDA=;
        b=LyxsrHJV4EUmHa/NUe+Y8XiPVmXYnIYghDVLZ6ojQVIMtnFmsAAYOrgWaHwZsTfnbo
         YGbHUxbHPJwFZviZ3ZGmZw4dNL56Ajex6R7yJTpUkheDOR473t47j03MdFc50NQX5NTJ
         rdnfj//s5E2Z1QTmMDGwTpKoWgIgvURBtoFVvXNjPNOOI8O+NZ6LLsJoYjAymmu6ftUU
         41f7SO4Wk1YL1MqBg19bOKSUFFeZsBOEB6JfgKZfayZsvCk8CqKh9lw6qBUKxP7BsJ4J
         ypTQ5DX/cDpeMQLc7IaaltfOnOSu2nj9NxEgu3bNNWvgLoc7S/jvCoktJxI09MJ95RAd
         npig==
X-Gm-Message-State: ABy/qLYJS+aAJywhm2Ed0Jl0HXssgbEwS7oE+jWwwUL6teM4mIF9T/li
	RJApbOi4ZhObGxZOCHFfN3yZQ7f3ySrCykmsK2FsHA==
X-Google-Smtp-Source: APBJJlHpQCyFxGZ2wEWn3k5zfeZwCJEObRUSbe49PZI26MJdi9kBQNmWxonB8vDszBerZkC/zLjl3GPQlhEj+vvvXB0=
X-Received: by 2002:a25:f603:0:b0:c11:565:debb with SMTP id
 t3-20020a25f603000000b00c110565debbmr322761ybd.17.1688052657580; Thu, 29 Jun
 2023 08:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
In-Reply-To: <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 29 Jun 2023 08:30:45 -0700
Message-ID: <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling first
To: Jiri Slaby <jirislaby@kernel.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 29, 2023 at 7:40=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> Hi,
>
> On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
> > Attempt VMA lock-based page fault handling first, and fall back to the
> > existing mmap_lock-based handling if that fails.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >   arch/x86/Kconfig    |  1 +
> >   arch/x86/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 37 insertions(+)
> >
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index a825bf031f49..df21fba77db1 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -27,6 +27,7 @@ config X86_64
> >       # Options that are inherently 64-bit kernel only:
> >       select ARCH_HAS_GIGANTIC_PAGE
> >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > +     select ARCH_SUPPORTS_PER_VMA_LOCK
> >       select ARCH_USE_CMPXCHG_LOCKREF
> >       select HAVE_ARCH_SOFT_DIRTY
> >       select MODULES_USE_ELF_RELA
> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > index a498ae1fbe66..e4399983c50c 100644
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -19,6 +19,7 @@
> >   #include <linux/uaccess.h>          /* faulthandler_disabled()      *=
/
> >   #include <linux/efi.h>                      /* efi_crash_gracefully_o=
n_page_fault()*/
> >   #include <linux/mm_types.h>
> > +#include <linux/mm.h>                        /* find_and_lock_vma() */
> >
> >   #include <asm/cpufeature.h>         /* boot_cpu_has, ...            *=
/
> >   #include <asm/traps.h>                      /* dotraplinkage, ...    =
       */
> > @@ -1333,6 +1334,38 @@ void do_user_addr_fault(struct pt_regs *regs,
> >       }
> >   #endif
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     if (!(flags & FAULT_FLAG_USER))
> > +             goto lock_mmap;
> > +
> > +     vma =3D lock_vma_under_rcu(mm, address);
> > +     if (!vma)
> > +             goto lock_mmap;
> > +
> > +     if (unlikely(access_error(error_code, vma))) {
> > +             vma_end_read(vma);
> > +             goto lock_mmap;
> > +     }
> > +     fault =3D handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LO=
CK, regs);
> > +     vma_end_read(vma);
> > +
> > +     if (!(fault & VM_FAULT_RETRY)) {
> > +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> > +             goto done;
> > +     }
> > +     count_vm_vma_lock_event(VMA_LOCK_RETRY);
>
> This is apparently not strong enough as it causes go build failures like:
>
> [  409s] strconv
> [  409s] releasep: m=3D0x579e2000 m->p=3D0x5781c600 p->m=3D0x0 p->status=
=3D2
> [  409s] fatal error: releasep: invalid p state
> [  409s]
>
> [  325s] hash/adler32
> [  325s] hash/crc32
> [  325s] cmd/internal/codesign
> [  336s] fatal error: runtime: out of memory

Hi Jiri,
Thanks for reporting! I'm not familiar with go builds. Could you
please explain the error to me or point me to some documentation to
decipher that error?
Thanks,
Suren.

>
> There are many kinds of similar errors. It happens in 1-3 out of 20
> builds only.
>
> If I revert the commit on top of 6.4, they all dismiss. Any idea?
>
> The downstream report:
> https://bugzilla.suse.com/show_bug.cgi?id=3D1212775
>
> > +
> > +     /* Quick path to respond to signals */
> > +     if (fault_signal_pending(fault, regs)) {
> > +             if (!user_mode(regs))
> > +                     kernelmode_fixup_or_oops(regs, error_code, addres=
s,
> > +                                              SIGBUS, BUS_ADRERR,
> > +                                              ARCH_DEFAULT_PKEY);
> > +             return;
> > +     }
> > +lock_mmap:
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >       /*
> >        * Kernel-mode access to the user address space should only occur
> >        * on well-defined single instructions listed in the exception
> > @@ -1433,6 +1466,9 @@ void do_user_addr_fault(struct pt_regs *regs,
> >       }
> >
> >       mmap_read_unlock(mm);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +done:
> > +#endif
> >       if (likely(!(fault & VM_FAULT_ERROR)))
> >               return;
> >
>
> thanks,
> --
> js
> suse labs
>
