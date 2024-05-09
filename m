Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82538C1998
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 00:49:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xviCrML7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb6d93J4Rz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 08:49:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xviCrML7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb6cL4rr3z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 08:48:18 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so13884995e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715294886; x=1715899686; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIWDSYU6OuwVNwMdVt3NyqDL4ZMH/MF1rCPe+F0j3bE=;
        b=xviCrML7ESvDtoWp0uIQAcq2Lf6yxlva9cI4jml+H4GBKGRZbbjCnvSwg+C4CLGFNF
         uletr/QPahnYNu8Tx1ETbqF3bdNv+OFY3sHMklvP5io07FHT3VfFCX12sxxHy9IooxJm
         NA4R4G0eVKo8/Q/Xp5K46eL1xaAZkHuGXUb+rGAZno3YhsquUaggZaU4RX2ry7qMxl0B
         qHimuR9mxC+sCKFfCVtuao3cjHtPx9YI4LnBXjQQYW/D8D9HD0JB9Hk4TDBBx7E+UNyB
         LO+5A6nIf4jtRsOXTfGX1zgDyHlhmsUo7l+bxH0vHPicBA5Ty4IFpuRKgccEWO3wbJO9
         7xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715294886; x=1715899686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIWDSYU6OuwVNwMdVt3NyqDL4ZMH/MF1rCPe+F0j3bE=;
        b=Zu2L1M5v36/qL3K9s1DNbTBQe/69AIm7qcF5dIoFe2hAG/9CB+31DA/D12xFnr5LR2
         Q7PP+OkApDw5g4TeVN152BAfkQ8gEsWIcoijSGWWMycRBELarpx4ckxKribTvQMNxDN5
         SuR7vc85162JnZqTR+Rsvc0xa4FERlW6D6PC/iMMO6Nk4KP+SjxtxEMGU0rkUfs5+F7E
         lFA8Y8xy4z8FxPC+E+W2jFV+irQWRf104weXLmnMFRpFSzIK765pHaFWVkVZ8mFF1BUX
         +BeFjB+mVAydVAgMERopqjQsmKZCpFptsa37uTStKVLMrFEYjFgrK8LLWUBmQ1EmKBPI
         Pawg==
X-Forwarded-Encrypted: i=1; AJvYcCV+opYl2HXk3pWY1nRSW08JK+L/Li35/PnXG0Gnt0VFPHKQhJOmaKFGMj/P+e2roA1JDmJ9VTMJRXHHZ36dZP1lpLsWlwJgYhFi5htY2A==
X-Gm-Message-State: AOJu0Yzw+mcArQCPwgqpwMZjRiqPHaIu26bZK3/AUl8kW4yVd6A84amU
	U5vI3N07a2F3K0HVJNWWSwizmrSbfRHdacz32kwKvehykaTMlSXdmMie7zzfZBySF0UfaU/3ZBs
	xRRcMfci4wNSFYIjKNMNne8wD2ICj7Xm1OC2R
X-Google-Smtp-Source: AGHT+IGJ/kKXUorUaZZLbLqtiS22JS9DgQC8DqDR6SQS2KcbUYgiLFSj2QMhwsrOQuNMZTIT+bZq0i18Q89RY9Bdtlc=
X-Received: by 2002:a5d:5f4e:0:b0:350:4da3:db43 with SMTP id
 ffacd0b85a97d-3504da3dde7mr436361f8f.35.1715294886227; Thu, 09 May 2024
 15:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240509203907.504891-1-axelrasmussen@google.com>
 <20240509203907.504891-2-axelrasmussen@google.com> <d04a838b-848d-405d-9317-40282cd58c36@nvidia.com>
In-Reply-To: <d04a838b-848d-405d-9317-40282cd58c36@nvidia.com>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 9 May 2024 15:47:29 -0700
Message-ID: <CAJHvVciOwHNFBfhQhaQLwaby0VojNNw6Mx1kJ38dgc4cQgEksA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/fault: don't print logs for simulated poison errors
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 9, 2024 at 2:30=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> On 5/9/24 1:39 PM, Axel Rasmussen wrote:
> > For real MCEs, various architectures print log messages when poisoned
> > memory is accessed (which results in a SIGBUS). These messages can be
> > important for users to understand the issue.
> >
> > On the other hand, we have the userfaultfd UFFDIO_POISON operation,
> > which can "simulate" memory poisoning. That particular process will get
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
> >   arch/parisc/mm/fault.c   | 7 +++++--
> >   arch/powerpc/mm/fault.c  | 6 ++++--
> >   arch/x86/mm/fault.c      | 6 ++++--
> >   include/linux/mm_types.h | 5 +++++
> >   mm/hugetlb.c             | 3 ++-
> >   mm/memory.c              | 2 +-
> >   6 files changed, 21 insertions(+), 8 deletions(-)
> >
>
> This completely fixes the uffd-unit-test behavior, I just did a quick
> test run to be sure as well.
>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks John!

And, no problem about the other patch, they aren't functionally
dependent, I just hoped to save Andrew dealing with the small merge
conflict. :) I'll base a v2 on mm-unstable directly and that should
clear everything up.

>
> thanks,
> --
> John Hubbard
> NVIDIA
>
>
> > diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> > index c39de84e98b0..e5370bcadf27 100644
> > --- a/arch/parisc/mm/fault.c
> > +++ b/arch/parisc/mm/fault.c
> > @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned =
long code,
> >   #ifdef CONFIG_MEMORY_FAILURE
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
> >    * @VM_FAULT_HWPOISON_LARGE:        Hit poisoned large page. Index en=
coded
> >    *                          in upper bits
> >    * @VM_FAULT_SIGSEGV:               segmentation fault
> > + * @VM_FAULT_HWPOISON_SIM    Hit poisoned, PTE marker; this indicates =
a
> > + *                           simulated poison (e.g. via usefaultfd's

I'll also fix this small typo in a v2. :P

> > + *                              UFFDIO_POISON), not a "real" hwerror.
> >    * @VM_FAULT_NOPAGE:                ->fault installed the pte, not re=
turn page
> >    * @VM_FAULT_LOCKED:                ->fault locked the returned page
> >    * @VM_FAULT_RETRY:         ->fault blocked, must retry
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
>
>
