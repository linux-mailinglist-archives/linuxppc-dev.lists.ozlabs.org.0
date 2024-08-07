Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6194B1B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:58:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gDHkHMnx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMvn45Thz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:58:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gDHkHMnx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfLvC1llGz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 06:12:38 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so1124a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723061551; x=1723666351; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvY4WNMX9mr7YEzp2nAVsZDMNnesPE1WwMojffdPXT4=;
        b=gDHkHMnxzxqIJSszkN+NXpbPswg/NrEX4zeimmORDCOpsm1Ve2ojy4+8QNjq8k4cVW
         pfUpVQcF0skeGuvi5OAg7tfpdItd4+FUbHrSuOayqU5Ar9YDyDICnk1MMdmxIPBuPzeg
         zzJo+yXJV6p6bKfJwd7Q6tDra9K662r00OlwZTnXMciSCwd84nbFp4vb1FhfUbWnHbox
         4cI+25e3ycaOXnzPxbOQqhxVCvah2lN3F2WzDXtjoqRwW3h1FR+2O0aJAOM0U6G0sMig
         KqzSqQ/4Tjc5np9ONqIBUXz2dI5P3F4MpyIwhE5nrXQy+PtA7ptOR1DI/JHPoKDSnzVM
         0q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723061551; x=1723666351;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvY4WNMX9mr7YEzp2nAVsZDMNnesPE1WwMojffdPXT4=;
        b=ikUn89gdMWxf2PNq451NWw9YncdITys7a5RymrVEtbcuuXNDzs7ozEHa6HckL2QwEO
         7/6z/wCl4DJuprmlVdm+GtzuweN8Z80wqA4+UXlzesGfVUMni+OPwO8QYNzaZ0pu8SYJ
         5oc9Qj3LneNgP5J+tsy3E5+FWxPncLIXNnbuJInUPCAZbYVNh7JtPW71cLrpgESEq6AO
         bhkz6X5X0CgkeAqiV8TKOX0nFcCtS4hAD+2Va+qILo9b0pu7Vas/CY0ECZ10cnbSvLAj
         f8mFMzw5wz9vVEwXrntNXMPybMYrK2wl5ZT+JwKDPU80MeQk5NxI+13uNvsfaqEKVGpX
         l2yg==
X-Forwarded-Encrypted: i=1; AJvYcCVon6PeccG3U4ZZCvthKG9BZMHNUQraJG6I3RfbMHbxNvednadmfvnl04sHKBd0mrc5cJGV/XPanPrq99trwPFAX6giFhuOwEadv9D0Tg==
X-Gm-Message-State: AOJu0YxgZ568UB7Eyrhj+A1/O/VLxApnh25otbZHhIpnGsM5PC/AZsvD
	vBfE99GlyYMWP4jrumwlZTIGsvWwRde6c9TFbFC3Zt+NuGzINH05GIhkBTovvwUMNTJ9RfLyte6
	K3bRnMaYPsdqtEjgRf5Fg/hiUnEhwkWbB/ARj
X-Google-Smtp-Source: AGHT+IE38TOrV9hTuWKKpab+jZbRWPVtmS9t5KG98LB429cOAjV7X9Y2P7QbhgL6lm1OLWDDVlwoXeVHofbFpIlzReA=
X-Received: by 2002:a05:6402:51d2:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5bbb179b52amr112a12.7.1723061550380; Wed, 07 Aug 2024 13:12:30
 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com> <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
In-Reply-To: <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
From: Jeff Xu <jeffxu@google.com>
Date: Wed, 7 Aug 2024 13:11:51 -0700
Message-ID: <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
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

On Wed, Aug 7, 2024 at 10:11=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Jeff Xu <jeffxu@google.com> [240807 12:37]:
> > On Wed, Aug 7, 2024 at 8:56=E2=80=AFAM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > >
> > > * Jeff Xu <jeffxu@google.com> [240807 11:44]:
> > > > On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@ellerm=
an.id.au> wrote:
> > > > >
> > > > > Add a close() callback to the VDSO special mapping to handle unma=
pping
> > > > > of the VDSO. That will make it possible to remove the arch_unmap(=
) hook
> > > > > entirely in a subsequent patch.
> > > > >
> > > > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > > > ---
> > > > >  arch/powerpc/include/asm/mmu_context.h |  4 ----
> > > > >  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
> > > > >  2 files changed, 17 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerp=
c/include/asm/mmu_context.h
> > > > > index 37bffa0f7918..9b8c1555744e 100644
> > > > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > > > @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct =
*mm);
> > > > >  static inline void arch_unmap(struct mm_struct *mm,
> > > > >                               unsigned long start, unsigned long =
end)
> > > > >  {
> > > > > -       unsigned long vdso_base =3D (unsigned long)mm->context.vd=
so;
> > > > > -
> > > > > -       if (start <=3D vdso_base && vdso_base < end)
> > > > > -               mm->context.vdso =3D NULL;
> > > > >  }
> > > > >
> > > > >  #ifdef CONFIG_PPC_MEM_KEYS
> > > > > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vds=
o.c
> > > > > index 7a2ff9010f17..220a76cae7c1 100644
> > > > > --- a/arch/powerpc/kernel/vdso.c
> > > > > +++ b/arch/powerpc/kernel/vdso.c
> > > > > @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_speci=
al_mapping *sm, struct vm_area_str
> > > > >         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_sta=
rt);
> > > > >  }
> > > > >
> > > > > +static void vdso_close(const struct vm_special_mapping *sm, stru=
ct vm_area_struct *vma)
> > > > > +{
> > > > > +       struct mm_struct *mm =3D vma->vm_mm;
> > > > > +
> > > > > +       /*
> > > > > +        * close() is called for munmap() but also for mremap(). =
In the mremap()
> > > > > +        * case the vdso pointer has already been updated by the =
mremap() hook
> > > > > +        * above, so it must not be set to NULL here.
> > > > > +        */
> > > > > +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> > > > > +               return;
> > > > > +
> > > > > +       mm->context.vdso =3D NULL;
> > > > > +}
> > > > > +
> > > > >  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm=
,
> > > > >                              struct vm_area_struct *vma, struct v=
m_fault *vmf);
> > > > >
> > > > > @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec _=
_ro_after_init =3D {
> > > > >  static struct vm_special_mapping vdso32_spec __ro_after_init =3D=
 {
> > > > >         .name =3D "[vdso]",
> > > > >         .mremap =3D vdso32_mremap,
> > > > > +       .close =3D vdso_close,
> > > > IIUC, only CHECKPOINT_RESTORE requires this, and
> > > > CHECKPOINT_RESTORE is in init/Kconfig, with default N
> > > >
> > > > Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?
> > > >
> > >
> > > No, these can be unmapped and it needs to be cleaned up.  Valgrind is
> > > one application that is known to unmap the vdso and runs into issues =
on
> > > platforms that do not handle the removal correctly.
> > >
> > Maybe Valgrind needs that exactly for checkpoint restore ? [1]
>
> Maybe, and maybe there are 100 other applications unmapping the vdso for
> some other reason?
>
When PPC added arch_munamp, it was for CRIU, wasn't it ? That was the origi=
nal
intention.

Maybe there are more apps that have started unmapping vdso, it might
be interesting
to know those use cases before widely opening this without kernel config.

> >
> > "CRIU fails to restore applications that have unmapped the vDSO
> > segment. One such
> > application is Valgrind."
> >
> > Usually when the kernel accepts new functionality, the patch needs to
> > state the user case.
>
> This isn't new functionality, the arch_unmap() existed before and this
> is moving the functionality.  We can't just disable it because we assume
> we know it's only used once.
>
> I had planned to do this sort of patch set in a follow up to my patch
> set [1], so I was deep into looking at this before the mseal()
> regression - which I expected to happen and have been advocating to
> avoid extra walks... This would be fixed by my patch set by reducing the
> walk count.
>
I would rather leave mseal() in-loop check discussion to the other
email thread :-)

> > The only user case I found for .mremap and .close so far is the CRIU ca=
se.
> >
>
> In fact, this is broken on other archs for valgrind since they unmap the
> vdso and then crash [2].  There has been a fix in the works for a while,
> which I stepped in during the patch set [1], which can be seen here
> [3].  In the discussion, the issue with Valgrind is raised and a generic
> solution to solve for more than just ppc is discussed.  The solution
> avoids crashing if vdso is unmapped and that seems like the sane
> direction of this work.
>
> We also have users unmapping vdsos here [4] too.
This is a strange code. If the use case about clock_gettime is legit, then
kerne can provide an option to not unload vdso during elf loading.

>
> Why would we leave a dangling pointer in the mm struct based on a
> compile flag?
>
> [1] https://lore.kernel.org/linux-mm/20240717200709.1552558-18-Liam.Howle=
tt@oracle.com/
> [2] https://lore.kernel.org/lkml/87imd5h5kb.fsf@mpe.ellerman.id.au/
> [3] https://lore.kernel.org/all/20210611180242.711399-17-dima@arista.com/
> [4] https://github.com/insanitybit/void-ship
>
