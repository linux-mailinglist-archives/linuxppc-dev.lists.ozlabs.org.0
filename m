Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3B6FEC01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 08:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH2gT2psFz3fXk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 16:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.182; helo=mail-qt1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH2fx6D5Kz3cJg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 16:53:45 +1000 (AEST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3ef2f81a96cso82431941cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 23:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788021; x=1686380021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MblyuSVWD0Rw/dgsETYZNoTE8y2XjkYZe4ysDLt2Njg=;
        b=Zv9QuYH/VXQ1nA2XxQDperua3acvSXIftE+sX6cAz9Jp6BPtZqUdV2Oqrbl3tqDet/
         VIZ7ETg7OxGvv2U8GKaJlQb0HTeFITuCrMZFV+3VFGxaJNY48ujw5BQmWsOtkuJSfc11
         0LPuBmFUmTt6pZ/CEtgOv+aof0HbGkWP06Ht8cN71xprsWZoR/gpgXQRjqQVvl2O0mK5
         D3RdU8SZREFJxf8BLHm40LT/jiftDpxOk91/a9QzJbg4pl+pnuo5Rw/0nqrslnmidkUd
         mTO41MHwbr9yHkX3gF3uD+seaeXeM0GUbA+SNfx4FepauGK5yWotGpNipMxZApLiiKtx
         BUvg==
X-Gm-Message-State: AC+VfDyuzJ6YbAxL2ITf9ZHkKwIZQkTC+na64AM8itIYIg7N8d1S0gUu
	KzEEtzAXIn6L27P4cIub6Tj84fevei9e6Q==
X-Google-Smtp-Source: ACHHUZ7TYXjpJABY/3t1l+pCSqSCB0SieL2bVu+nusuV0xJZdA08qXzg/i5MrZbrPTsRPGsrW682jQ==
X-Received: by 2002:ac8:5708:0:b0:3ef:3af7:1c39 with SMTP id 8-20020ac85708000000b003ef3af71c39mr28939830qtw.27.1683788021274;
        Wed, 10 May 2023 23:53:41 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id a17-20020ac86111000000b003e4c6b2cc35sm2025899qtm.24.2023.05.10.23.53.40
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:53:41 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7575fc62c7aso547133085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 23:53:40 -0700 (PDT)
X-Received: by 2002:a25:aaa6:0:b0:b9d:a27c:3fc9 with SMTP id
 t35-20020a25aaa6000000b00b9da27c3fc9mr17668190ybi.33.1683787999800; Wed, 10
 May 2023 23:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <237c8410-ce61-94c-4260-7318ad6a4f3@google.com> <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
 <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
In-Reply-To: <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 08:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Subject: Re: [PATCH 05/23] m68k: allow pte_offset_map[_lock]() to fail
To: Hugh Dickins <hughd@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogen
 d@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hugh,

On Thu, May 11, 2023 at 4:58=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> On Wed, 10 May 2023, Geert Uytterhoeven wrote:
> > On Wed, May 10, 2023 at 6:48=E2=80=AFAM Hugh Dickins <hughd@google.com>=
 wrote:
> > > In rare transient cases, not yet made possible, pte_offset_map() and
> > > pte_offset_map_lock() may not find a page table: handle appropriately=
.
> > >
> > > Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
> > > at label out, followed by one local_irq_restore() for all.
> >
> > That's a bug fix, which should be a separate patch?
>
> No, that's not a bug fix for the current tree, since m68k does not
> offer CONFIG_HIGHPTE, so pte_unmap() is never anything but a no-op
> for m68k (see include/linux/pgtable.h).
>
> But I want to change pte_unmap() to do something even without
> CONFIG_HIGHPTE, so have to fix up any such previously harmless
> omissions in this series first.

OK.

> > > --- a/arch/m68k/include/asm/mmu_context.h
> > > +++ b/arch/m68k/include/asm/mmu_context.h
> > > @@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct =
*task)
> > >         p4d_t *p4d;
> > >         pud_t *pud;
> > >         pmd_t *pmd;
> > > -       pte_t *pte;
> > > +       pte_t *pte =3D NULL;
> > >         unsigned long mmuar;
> > >
> > >         local_irq_save(flags);
> > > @@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struc=
t *task)
> > >
> > >         pte =3D (mmuar >=3D PAGE_OFFSET) ? pte_offset_kernel(pmd, mmu=
ar)
> > >                                      : pte_offset_map(pmd, mmuar);
> > > -       if (pte_none(*pte) || !pte_present(*pte))
> > > +       if (!pte || pte_none(*pte) || !pte_present(*pte))
> > >                 goto bug;
> >
> > If the absence of a pte is to become a non-abnormal case, it should
> > probably jump to "end" instead, to avoid spamming the kernel log.
>
> I don't think so (but of course it's hard for you to tell, without
> seeing all completed series of series).  If pmd_none(*pmd) can safely
> goto bug just above, and pte_none(*pte) goto bug here, well, the !pte
> case is going to be stranger than either of those.
>
> My understanding of this function, load_ksp_mmu(), is that it's dealing
> at context switch with a part of userspace which very much needs to be
> present: whatever keeps that from being swapped out or migrated at
> present, will be sure to keep the !pte case away - we cannot steal its
> page table just at random (and a THP on m68k would be surprising too).
>
> Though there is one case I can think of which will cause !pte here,
> and so goto bug: if the pmd entry has got corrupted, and counts as
> pmd_bad(), which will be tested (and cleared) in pte_offset_map().
> But it is okay to report a bug in that case.
>
> I can certainly change this to goto end instead if you still prefer,
> no problem; but I'd rather keep it as is, if only for me to be proved
> wrong by you actually seeing spam there.

OK, makes sense.

> > > @@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struc=
t *task)
> > >  bug:
> > >         pr_info("ksp load failed: mm=3D0x%p ksp=3D0x08%lx\n", mm, mmu=
ar);
> > >  end:
> > > +       if (pte && mmuar < PAGE_OFFSET)
> > > +               pte_unmap(pte);
> >
> > Is this also a bugfix, not mentioned in the patch description?
>
> I'm not sure whether you're referring to the pte_unmap() which we
> already discussed above, or you're seeing something else in addition;
> but I don't think there's a bugfix here, just a rearrangement because
> we now want lots of cases to do the pte_unmap() and local_irq_restore().

I was referring to the addition of pte_unmap().
As per your explanation above, this is not a bugfix.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
