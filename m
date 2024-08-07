Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803C94B1AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:57:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UQHeIcLS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMv22PlCz30TQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UQHeIcLS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfG6M5bzVz30TF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 02:36:58 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso194a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 09:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723048615; x=1723653415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riQD75FfkBgpWAyyMoow6+qKy3h+tMgO/92cdmCWWQI=;
        b=UQHeIcLSGSzwUch7NnN0rqI4ZKxzcNOXPpBVI6qZUcdeodawYsvqgQxFEqwdcVuZEB
         mPPznCNkFKV8DrOOxmY9jgi8swPyNWMeEN06EF1DOxk47AVQ/tb/DHrzMI3TB88iGP6q
         UEMRiXRAR3VJax7CpJ/F06XquMKPzymjNC2hynMjcUFi0ZDGsSkaoBs/56+Gsx38S+iI
         Y+rRHbdQ0PD5YxIUfn+SZW7969AAe+oBXaag8C2pTtUuEz1rSenL2yXT19I6on1Y/bgC
         y30mOw3u40r/uWIcYrti9Hrety8qOaZsmPNMFjev4q0m2zpoU+t+yeE+apR4DyRbc/eb
         5SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048615; x=1723653415;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riQD75FfkBgpWAyyMoow6+qKy3h+tMgO/92cdmCWWQI=;
        b=cI9Sp1vH2EtaDXD/rOMFhSVeKqErt9Pib98RV6P2P9+LwvxAP0kiCLirA5vfaCwyWs
         ZyXiu2NvycoyskPEC+kp4vnj+eAeT4JfOkL7J2pj+pko5lCZioolbWpOGasT+Ht2s0qb
         wBJuhriQI+LQM/NliSlDS9ZeoZC2g16j4gVIzIu0ZlBiYJT41CzmHMiqcAADgDYm/T2i
         rxFCnCt9weoJGi/2WJWtIYwGPh8FennYdEFZcIelXoYzyKC8uDoSuYynydgM7NBG9Z78
         8yioRy7BsdGnCPmBwIkqqL25PSYumn9MNN0Xv9IYShQtDkT9HI4UsS0VKlkCiTFMsbWc
         w+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUXcoSOXu5o0t+oQZWcfTi59jfcedL6Kx27GU4evNc/ybAwH/gH8a4raqWa8WdQ07y61mMFP1X6ujnfH/JnZ9HBlQJ0Uhl0XFtWUUGHng==
X-Gm-Message-State: AOJu0YzSqXuoe5J9EE5xonXrdZEdUARCYTS5WrYVRasGFpqBBDabhMDV
	sKh2m0yrjG3ir4mBr4p8XX+ilvvezzD5Fi/3QTngKAwR9dF97ko/9wEXr8ooz1wAE3mKHxqQX1h
	2fSLqAExs2Dii6cb5QSGiDTAM+MAzWWNBPz4C
X-Google-Smtp-Source: AGHT+IEMT0D00wZxgbaS7ZlbUaOKZqS0NKAbIqfEmp+OaUjtXLa3vZXToggQQb/YiJn08GHRZeA2XEFihcr0CJ0C2WY=
X-Received: by 2002:a05:6402:27c7:b0:5a7:7f0f:b70b with SMTP id
 4fb4d7f45d1cf-5bba25bee88mr279090a12.0.1723048614852; Wed, 07 Aug 2024
 09:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com> <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
In-Reply-To: <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
From: Jeff Xu <jeffxu@google.com>
Date: Wed, 7 Aug 2024 09:36:15 -0700
Message-ID: <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jeff Xu <jeffxu@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 08 Aug 2024 06:54:21 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024 at 8:56=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Jeff Xu <jeffxu@google.com> [240807 11:44]:
> > On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
> > >
> > > Add a close() callback to the VDSO special mapping to handle unmappin=
g
> > > of the VDSO. That will make it possible to remove the arch_unmap() ho=
ok
> > > entirely in a subsequent patch.
> > >
> > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > ---
> > >  arch/powerpc/include/asm/mmu_context.h |  4 ----
> > >  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
> > >  2 files changed, 17 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/in=
clude/asm/mmu_context.h
> > > index 37bffa0f7918..9b8c1555744e 100644
> > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct *mm)=
;
> > >  static inline void arch_unmap(struct mm_struct *mm,
> > >                               unsigned long start, unsigned long end)
> > >  {
> > > -       unsigned long vdso_base =3D (unsigned long)mm->context.vdso;
> > > -
> > > -       if (start <=3D vdso_base && vdso_base < end)
> > > -               mm->context.vdso =3D NULL;
> > >  }
> > >
> > >  #ifdef CONFIG_PPC_MEM_KEYS
> > > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> > > index 7a2ff9010f17..220a76cae7c1 100644
> > > --- a/arch/powerpc/kernel/vdso.c
> > > +++ b/arch/powerpc/kernel/vdso.c
> > > @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_special_m=
apping *sm, struct vm_area_str
> > >         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
> > >  }
> > >
> > > +static void vdso_close(const struct vm_special_mapping *sm, struct v=
m_area_struct *vma)
> > > +{
> > > +       struct mm_struct *mm =3D vma->vm_mm;
> > > +
> > > +       /*
> > > +        * close() is called for munmap() but also for mremap(). In t=
he mremap()
> > > +        * case the vdso pointer has already been updated by the mrem=
ap() hook
> > > +        * above, so it must not be set to NULL here.
> > > +        */
> > > +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> > > +               return;
> > > +
> > > +       mm->context.vdso =3D NULL;
> > > +}
> > > +
> > >  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> > >                              struct vm_area_struct *vma, struct vm_fa=
ult *vmf);
> > >
> > > @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec __ro_=
after_init =3D {
> > >  static struct vm_special_mapping vdso32_spec __ro_after_init =3D {
> > >         .name =3D "[vdso]",
> > >         .mremap =3D vdso32_mremap,
> > > +       .close =3D vdso_close,
> > IIUC, only CHECKPOINT_RESTORE requires this, and
> > CHECKPOINT_RESTORE is in init/Kconfig, with default N
> >
> > Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?
> >
>
> No, these can be unmapped and it needs to be cleaned up.  Valgrind is
> one application that is known to unmap the vdso and runs into issues on
> platforms that do not handle the removal correctly.
>
Maybe Valgrind needs that exactly for checkpoint restore ? [1]

"CRIU fails to restore applications that have unmapped the vDSO
segment. One such
application is Valgrind."

Usually when the kernel accepts new functionality, the patch needs to
state the user case.
The only user case I found for .mremap and .close so far is the CRIU case.

[1] https://github.com/checkpoint-restore/criu/issues/488

Thanks
-Jeff

> Thanks,
> Liam
