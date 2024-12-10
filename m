Return-Path: <linuxppc-dev+bounces-3927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C999EBA37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 20:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y78G23sRLz302P;
	Wed, 11 Dec 2024 06:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733859610;
	cv=none; b=QhQN3iFIRH7YsM3m5A3qWoTQwVmMJG+ExxtChNA6KxRvegHiv3H1hIo62Rp6TyXaBdJT2/Dx68Ea837c4idD9Gydm+YbbP+BK7Ig0CvQ7oQPpYkWvBL+YipuOVG0QmBk05YexyJ4q2oo/+puLcZdbR+aQxVGaMrqz2/AAfSUI2wb0WEaDncuWsppC04KpqXKvMBtk+2nEXCuJtYXf5gaw2g9hewLooNHsOt+NR8aQiQf5GDLQ1aMwRo9Mpss1IyEhwZFtSCU9mESHJpnPQGe/jAdWvCxuCe966idoYaZC0Rn5qF5Crp1TTAkY6HrA77WRdymEsXVwhyw9d/ckpwUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733859610; c=relaxed/relaxed;
	bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5wg/i9IyMpKtQoWSBnuP2ASUdAFu8KG0/rns2Jk4MDovim3pbC/SeDxvBST/Bl585gRtESNXYFSZV0Be4Ufl6I3w30LptqzBYKTtmlf7r2d+NPR+90d/NPYpdr2sqzVocGW9LVm4RLWx2i5U1RsyxqmZ7hN4QRcnLGZ7F6V0Rq0UestSShh0aTKo0ZFf1OsFw2bU0nJpZ48+WE0ZAGuckVOpzBapMz0THtjdsPGQNxUnu2VSElwvt50ypueGX5tyYyuGwgUyPfbxM1hfhicbR8I2n+k1NgmFYoHzmMaIfhbo5QCDXAHVXpTFFYh2lYxjQlo4TCd3KvHgKdtvWxIQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O7rWxlsl; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O7rWxlsl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y78Fz1m9Fz3023
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 06:40:06 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso3654429a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 11:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733859600; x=1734464400; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=O7rWxlslWSsw7OlbTL+I4KS7k0TAOTHCJDePnHYrm+e2MA+431zSf4OC6B+sCCZTCl
         OJKdeHe27qvcq/qfG8IkobSfQZUSaknQXjiuMB6NGVAjuzvxfrQe5mDBHJsMmRTdOP2V
         ng8nrJ2RNEfpXXIoAPW/H0zZRSYQTrI0yOcpaVjoD4ULCNbPku7iLTHCjFGEeYjtJe8K
         9b3Kb5O9Vfn8O1Q7FtrVAZXACT8CY+SvdHdi8HxJKpG76biV5qBd9pGBNQnFVnCa389K
         BDOHaaaV66nkwpW8O792vrVLYdhqbt4Z5PQaTvt4DS3mFjJ/UqzHS/ByNdGrVLeZ8o17
         irEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859600; x=1734464400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=YGp/aVwualUsow53w9ex5P2Wi39+Ta1fBN+ZJsqnNsSHF5qnh6h9erYa66iZSJZHwS
         //OUTKBx+9JF52eLAks8f/UXd/zGvmkEGCRnGAsUBwv2wbTcrLcrcXPa8VCIZk1K9mX5
         FxG0mX1lOc7J7Q4bjqehwCXVSkHEgfYfsuLUQu/T2g/Fl9cPdn7eWC9s764zi1s9k4rn
         h8faTEVeOjiUk0LZK6RvPK9KWNHIKCy5w1hQZpUZ9t0gmafixOrHe/DkQyHm9WxqWWk/
         7gTYiQIqXE8I8WNF5V7D8CUgXHlAZZK3ptXaSQimHcTRSOMtRLMJFJMZTsiTvQXXB7Bb
         W7tg==
X-Forwarded-Encrypted: i=1; AJvYcCUUn2aYIg4qKEhYnIoV2aXL61a++y33EujPczgpSmsrdW+XlwXAogejo9oQ7WtQUc8G7InuR/n7Cz44JCU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw01/WFSI1dX5df0xVszgHKqxlr2EsSTNHbGhnZZ5aYhTQSg9St
	KWABLvNHBZttYky0Q1p4amMBjP/qlPvC8MeNDVFpbHRa+IJaD0BOoYHHtfXtxjZHBnnjzAQSg9t
	3eC0TDobefzudpaA2HAry3rXGyw0=
X-Gm-Gg: ASbGncsXUsY4kzbXAmfad0RUNKPo3Zx6d/INTxlwwHQ8fWkJ0mKTMX1O4tnWWF4aEB7
	3slnUUO5FmKSEGhnteafMY5oEUPRZKp8ScRz9wA==
X-Google-Smtp-Source: AGHT+IGn1TGMw5Q3ZRvX4tSkpBgSMsKO1aElzvBulPGolgowmhm7A7II8tzVQjdTXusigtkhjHD3HA/xYigxPDvvUCI=
X-Received: by 2002:a05:6402:5299:b0:5d0:c9e6:30bc with SMTP id
 4fb4d7f45d1cf-5d4330814d0mr38059a12.10.1733859599911; Tue, 10 Dec 2024
 11:39:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
 <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
In-Reply-To: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 10 Dec 2024 11:39:48 -0800
Message-ID: <CAHbLzkqbH_AR2jy_6LZ7KSh6bcf4L5B51Mq9DwYtdBcVz1Lu6w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 10, 2024 at 9:34=E2=80=AFAM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wro=
te:
> >
> > On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google=
.com> wrote:
> > >
> > > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for=
 THP")
> > > fallsback to PAGE_SIZE alignment instead of THP alignment
> > > for anonymous mapping as long as a hint address is provided by the us=
er
> > > -- even if we weren't able to allocate the unmapped area at the hint
> > > address in the end.
> > >
> > > This was done to address the immediate regression in anonymous mappin=
gs
> > > where the hint address were being ignored in some cases; due to commi=
t
> > > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries"=
).
> > >
> > > It was later pointed out that this issue also existed for file-backed
> > > mappings from file systems that use thp_get_unmapped_area() for their
> > > .get_unmapped_area() file operation.
> > >
> > > The same fix was not applied for file-backed mappings since it would
> > > mean any mmap requests that provide a hint address would be only
> > > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > > the hint address or not.
> > >
> > > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > > address and fallback to THP alignment if that fails.
> >
> > Thanks for taking time to try to fix this.
> >
> > >
> > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > ---
> > >  mm/huge_memory.c | 15 ++++++++-------
> > >  mm/mmap.c        |  1 -
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 137abeda8602..f070c89dafc9 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         loff_t off_align =3D round_up(off, size);
> > >         unsigned long len_pad, ret, off_sub;
> > >
> > > +       /*
> > > +        * If allocation at the address hint succeeds; respect the hi=
nt and
> > > +        * don't try to align to THP boundary.
> > > +        */
> > > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > > +       if (addr)
> > > +               return addr;
> > > +
>
> Hi Yang,
>
> Thanks for the comments.
>
> >
> > IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> > arch_get_unmapped_area_topdown() again. So we will actually look up
> > maple tree twice. It sounds like the second hint address search is
> > pointless. You should be able to set addr to 0 before calling
> > mm_get_unmapped_area_vmflags() in order to skip the second hint
> > address search.
>
> You are right that it would call into arch_mmap_hint() twice but it
> only attempts the lookup once since on the second attempt addr =3D=3D 0.

Aha, yeah, I missed addr is going to be reset if arch_mmap_hint()
fails to find a suitable area.

>
> Thanks,
> Kalesh
> >
> > >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> > >                 return 0;
> > >
> > > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         if (IS_ERR_VALUE(ret))
> > >                 return 0;
> > >
> > > -       /*
> > > -        * Do not try to align to THP boundary if allocation at the a=
ddress
> > > -        * hint succeeds.
> > > -        */
> > > -       if (ret =3D=3D addr)
> > > -               return addr;
> > > -
> > >         off_sub =3D (off - ret) & (size - 1);
> > >
> > >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 59bf7d127aa1..6bfeec80152a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned l=
ong addr, unsigned long len,
> > >         if (get_area) {
> > >                 addr =3D get_area(file, addr, len, pgoff, flags);
> > >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > > -                  && !addr /* no hint */
> > >                    && IS_ALIGNED(len, PMD_SIZE)) {
> > >                 /* Ensures that larger anonymous mappings are THP ali=
gned. */
> > >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, le=
n,
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
> > >

