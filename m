Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412EB8C19BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 01:03:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tSEi/AR9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb6yN5kjqz3chF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 09:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tSEi/AR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb6xd62Mpz3cWX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 09:03:16 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34e667905d2so935088f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715295792; x=1715900592; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPbSvLzfel2aidHv4944fpA4agv4jm4lmrU+rS2yRC4=;
        b=tSEi/AR9Dq/R5AkRTE66ykBe/iiRwEQUA5wg/9QpBU5wZiA4xC+Z4Ld39YpskIYjUF
         kJQqC6Kitb5UgWxZihMEWzl/U0cki97KsCpSO423eDNR7N83LX1x8RSuT4JmanzD0CKk
         +OqrXxBg6TdrKdKCvLh9VWhsGIMsasdVYXPas+XWzaA98uzUFQxSzbvM2EPaNn6CTbf4
         bATb7PDjCTptwRd4CCNk2CHogU9gufD1vj9Vc4yNcIxAERH5Hf60KVl8ATOPyCJ0h6r0
         KLUGQHogqfXRrx5gBtKrIJNANe4O1k2wC++FpBiq4eXjUj7rKlsmj9SqkwLr/vHAD61p
         /LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715295792; x=1715900592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPbSvLzfel2aidHv4944fpA4agv4jm4lmrU+rS2yRC4=;
        b=fDYHWri1DDR8DJo0/8NvhscrO/AhLOWBStpx0Gc15QS0O/TodJQykAKtqUYz2sVqUG
         nzhxP6zrEvWZ/zPBPFDp+O261K6dbK1jX1lb/eHCTeY1/W3IotLOjJ3ZktlPCeLnVkn3
         R1Klc1bARrMs1aM6rjjQ/nC4n1ts72bVac4V3PpmOqhmkfmOy9GFtvLcwg78qcEMpBdj
         X2Zx/wRuzkS83HX3I0FpkUhG43Lp3Yhf0hjNYVFLIB5hmY0bqCHGz/oDVZJozFSGjnsk
         7a0C8dpqwFUnDQsbYD0yTAcRNofYvjZ6db+wcZsXniLd5o/XqNrW+gopE/OBxJWX36Qf
         UaAg==
X-Forwarded-Encrypted: i=1; AJvYcCXOCgCiRwKDz427DGYx3GEkOgehrIN4Un27mVoDKkoFImVqT1VWu/k0t+H/TKIQ60JhEc2ieg94oZUnQAiUJWBtI0gHAhQ6qCDiqE8OgQ==
X-Gm-Message-State: AOJu0YzgWga3cLc5lb95BOFmcqS85GTzpMc4bDIkklFrdeIvoPYyBENI
	LqsN9ywoCJWawH2Lgw5vgTgUgqMo04QoGdkvhiOPdUByaabunW9tdSfXLHbbTuFy/9tlsax/91O
	uLJ2jfWlF3HMn2YMYxc+rUy6zECv1ThUwDbd3
X-Google-Smtp-Source: AGHT+IFhmWSmgHAekjGKzRtk8e+YHHuEDjTnB0xuUIijeYWCpcIdqwfIqifcfRX9laqU/XyPu9INnEX+SjRuGN5KTmg=
X-Received: by 2002:a05:6000:e43:b0:34e:21cd:dbf3 with SMTP id
 ffacd0b85a97d-3504a73ec96mr677219f8f.36.1715295792241; Thu, 09 May 2024
 16:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240509203907.504891-1-axelrasmussen@google.com>
 <20240509203907.504891-2-axelrasmussen@google.com> <Zj06qh2U0wTwAZLK@x1n>
In-Reply-To: <Zj06qh2U0wTwAZLK@x1n>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 9 May 2024 16:02:33 -0700
Message-ID: <CAJHvVcj1+GQoweAU0X=0Q-jx2ZC1yUsm1GsCQLsFRQ8fCzNWNw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/fault: don't print logs for simulated poison errors
To: Peter Xu <peterx@redhat.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 9, 2024 at 2:05=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, May 09, 2024 at 01:39:07PM -0700, Axel Rasmussen wrote:
> > For real MCEs, various architectures print log messages when poisoned
> > memory is accessed (which results in a SIGBUS). These messages can be
> > important for users to understand the issue.
> >
> > On the other hand, we have the userfaultfd UFFDIO_POISON operation,
> > which can "simulate" memory poisoning. That particular process will get
>
> It also coveres swapin errors as we talked before, so not always SIM.
>
> I was thinking we should also do that report for swapin errors, however
> then I noticed it wasn't reported before the replacement of pte markers,
> in commit 15520a3f04, since 2022:
>
> @@ -3727,8 +3731,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>                         put_page(vmf->page);
>                 } else if (is_hwpoison_entry(entry)) {
>                         ret =3D VM_FAULT_HWPOISON;
> -               } else if (is_swapin_error_entry(entry)) {
> -                       ret =3D VM_FAULT_SIGBUS;
>                 } else if (is_pte_marker_entry(entry)) {
>                         ret =3D handle_pte_marker(vmf);
>                 } else {
>
> So I am guessing it could be fine to just turn this report off to syslog.
> There will be a back-and-forth on this behavior, but hopefully this is ev=
en
> rarer than hwpoison so nobody will notice.
>
> With that, the idea looks valid to me, but perhaps a rename is needed.
> Maybe _QUIESCE or _SILENT?

Ah, I had forgotten about the swapin error case.

I think it still makes sense to silence the log in that case; if we
consider a scenario like disk error, it could seem weird to get an MCE
message for that, since the physical memory is fine and it wouldn't
show up in mcelog or similar.

I like _SILENT, I'll do the rename and update my comments to better
explain in v2.

>
> > SIGBUS on access to the memory, but this effect is tied to an MM, rathe=
r
> > than being global like a real poison event. So, we don't want to log
> > about this case to the global kernel log; instead, let the process
> > itself log or whatever else it wants to do. This avoids spamming the
> > kernel log, and avoids e.g. drowning out real events with simulated
> > ones.
> >
> > To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
> > is expected to be set *in addition to* one of the existing
> > VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
> > exclusive).
> >
> > Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> > ---
> >  arch/parisc/mm/fault.c   | 7 +++++--
> >  arch/powerpc/mm/fault.c  | 6 ++++--
> >  arch/x86/mm/fault.c      | 6 ++++--
> >  include/linux/mm_types.h | 5 +++++
> >  mm/hugetlb.c             | 3 ++-
> >  mm/memory.c              | 2 +-
> >  6 files changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> > index c39de84e98b0..e5370bcadf27 100644
> > --- a/arch/parisc/mm/fault.c
> > +++ b/arch/parisc/mm/fault.c
> > @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned =
long code,
> >  #ifdef CONFIG_MEMORY_FAILURE
> >               if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) =
{
> >                       unsigned int lsb =3D 0;
> > -                     printk(KERN_ERR
> > +
> > +                     if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                             pr_err(
> >       "MCE: Killing %s:%d due to hardware memory corruption fault at %0=
8lx\n",
> > -                     tsk->comm, tsk->pid, address);
> > +                             tsk->comm, tsk->pid, address);
> > +                     }
> >                       /*
> >                        * Either small page or large page may be poisone=
d.
> >                        * In other words, VM_FAULT_HWPOISON_LARGE and
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 53335ae21a40..ac5e8a3c7fba 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigne=
d long address,
> >       if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
> >               unsigned int lsb =3D 0; /* shutup gcc */
> >
> > -             pr_err("MCE: Killing %s:%d due to hardware memory corrupt=
ion fault at %lx\n",
> > -                     current->comm, current->pid, address);
> > +             if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                     pr_err("MCE: Killing %s:%d due to hardware memory=
 corruption fault at %lx\n",
> > +                             current->comm, current->pid, address);
> > +             }
> >
> >               if (fault & VM_FAULT_HWPOISON_LARGE)
> >                       lsb =3D hstate_index_to_shift(VM_FAULT_GET_HINDEX=
(fault));
> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > index e4f3c7721f45..16d077a3ad14 100644
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long erro=
r_code, unsigned long address,
> >               struct task_struct *tsk =3D current;
> >               unsigned lsb =3D 0;
> >
> > -             pr_err_ratelimited(
> > +             if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> > +                     pr_err_ratelimited(
> >       "MCE: Killing %s:%d due to hardware memory corruption fault at %l=
x\n",
> > -                     tsk->comm, tsk->pid, address);
> > +                             tsk->comm, tsk->pid, address);
> > +             }
> >               if (fault & VM_FAULT_HWPOISON_LARGE)
> >                       lsb =3D hstate_index_to_shift(VM_FAULT_GET_HINDEX=
(fault));
> >               if (fault & VM_FAULT_HWPOISON)
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 5240bd7bca33..7f8fc3efc5b2 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
> >   * @VM_FAULT_HWPOISON_LARGE: Hit poisoned large page. Index encoded
> >   *                           in upper bits
> >   * @VM_FAULT_SIGSEGV:                segmentation fault
> > + * @VM_FAULT_HWPOISON_SIM    Hit poisoned, PTE marker; this indicates =
a
> > + *                           simulated poison (e.g. via usefaultfd's
> > + *                              UFFDIO_POISON), not a "real" hwerror.
> >   * @VM_FAULT_NOPAGE:         ->fault installed the pte, not return pag=
e
> >   * @VM_FAULT_LOCKED:         ->fault locked the returned page
> >   * @VM_FAULT_RETRY:          ->fault blocked, must retry
> > @@ -1245,6 +1248,7 @@ enum vm_fault_reason {
> >       VM_FAULT_HWPOISON       =3D (__force vm_fault_t)0x000010,
> >       VM_FAULT_HWPOISON_LARGE =3D (__force vm_fault_t)0x000020,
> >       VM_FAULT_SIGSEGV        =3D (__force vm_fault_t)0x000040,
> > +     VM_FAULT_HWPOISON_SIM   =3D (__force vm_fault_t)0x000080,
> >       VM_FAULT_NOPAGE         =3D (__force vm_fault_t)0x000100,
> >       VM_FAULT_LOCKED         =3D (__force vm_fault_t)0x000200,
> >       VM_FAULT_RETRY          =3D (__force vm_fault_t)0x000400,
> > @@ -1270,6 +1274,7 @@ enum vm_fault_reason {
> >       { VM_FAULT_HWPOISON,            "HWPOISON" },   \
> >       { VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },     \
> >       { VM_FAULT_SIGSEGV,             "SIGSEGV" },    \
> > +     { VM_FAULT_HWPOISON_SIM,        "HWPOISON_SIM" },       \
> >       { VM_FAULT_NOPAGE,              "NOPAGE" },     \
> >       { VM_FAULT_LOCKED,              "LOCKED" },     \
> >       { VM_FAULT_RETRY,               "RETRY" },      \
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 65456230cc71..2b4e0173e806 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, st=
ruct vm_area_struct *vma,
> >                               pte_marker_get(pte_to_swp_entry(entry));
> >
> >                       if (marker & PTE_MARKER_POISONED) {
> > -                             ret =3D VM_FAULT_HWPOISON_LARGE |
> > +                             ret =3D VM_FAULT_HWPOISON_SIM |
> > +                                   VM_FAULT_HWPOISON_LARGE |
> >                                     VM_FAULT_SET_HINDEX(hstate_index(h)=
);
> >                               goto out_mutex;
> >                       }
> > diff --git a/mm/memory.c b/mm/memory.c
> > index d2155ced45f8..29a833b996ae 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fau=
lt *vmf)
> >
> >       /* Higher priority than uffd-wp when data corrupted */
> >       if (marker & PTE_MARKER_POISONED)
> > -             return VM_FAULT_HWPOISON;
> > +             return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
> >
> >       if (pte_marker_entry_uffd_wp(entry))
> >               return pte_marker_handle_uffd_wp(vmf);
> > --
> > 2.45.0.118.g7fe29c98d7-goog
> >
>
> --
> Peter Xu
>
