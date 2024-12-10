Return-Path: <linuxppc-dev+bounces-3924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1B9EB8D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 18:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y75xX2qWqz2xVq;
	Wed, 11 Dec 2024 04:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733853344;
	cv=none; b=XquTuF0WLZrW6vo4HBnmo+ArH8Vr6P+SfnL7KAaSUL1FuKyrhfl3s0F2wJjzqQZNNDqS5S9fFKIyejIMeKAJp0ElFV7++4aVfcCahAdcJYFFZUuGvyR6pYlN7P1cHF0fYWE5tQAewEhEkZAQw829Zot9wmUu6UVj5Ugsdwk6vBFV08bhweiugJGLSX8povwL+TR6tRw4eSWuUHvpJ6dW/DJ7OjTEWLg5oloAulF3lLUy3OWPE9nnX9P81Z7RmL40SrLa7FwgeChOOuiGK78jSQg0QYd/6JsYSpK0qiEzjbdqYrrreq7bMyqyqiph9MXxLIY3QQwfpCSUwUA8syCRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733853344; c=relaxed/relaxed;
	bh=R0WaAW3kh+VqyYkynbg5Bnnaq2ujjkmV+I+q8jKp9mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fH1LBQaJksvfrxDsPCrfQFKB542ChS+3GcSpa1j6BtoDxSHUYejIuYlq232yuqXTgd9wP2HYsLeNnkONv+8o4WLEjQpAVwQbRhb1V8YkptQCByiuZX3nmjs0yg9fitHgFSwZ27fS4Okjplie/qACQFAd3g1nGfpeBACyXvkv9IHgN4dspj8NRF+m+2eX/ZzoEe6qYX/7P0WRaD/PrHVufJgDKotH2gWVO6y5EyY9Sdrm/EcyUqXIKSj6Kx4qn4LdvDmAFQ5o2pHYBnYE30/vlzGkm6smqGjrgYrUQ3QVFSM925N3HRvYDSzME6Ioj8SMixqJMV8rz/qwhEckdbQtHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KJZ+e65H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KJZ+e65H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y75xV71Bsz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 04:55:42 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21625b4f978so3905ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 09:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733853339; x=1734458139; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0WaAW3kh+VqyYkynbg5Bnnaq2ujjkmV+I+q8jKp9mU=;
        b=KJZ+e65H5HuXI0tOn5n73MlTDfY2EO+DEZaFcov/eu+pWjmEMr/CkfqR/8Phw+p7GA
         9pp7ZuhNxjjVzo6RPRsDugrqEJ/Az0PYx5Xv86XJkaUdxV3ZB3115sLYe03gWNqgx6TM
         OOnp4ymbhgfGgqtHetF3CIpXjqmzbdukPposCLDYarwR4TTjZuKIaTD0ejW3IWSP8hbJ
         vLOksdO2EQOoMETCinVddheN/CL+BGc83Xi5s0uwWyKJVIsEQToWJ6YQQ8yasBmQ1IG5
         yBOxvnFqN1S/oEXkmloRdBAY3CtG8XSeCXlRemAHY6u9tvsAdTExQuZHf5Mk/IAgPA6U
         ijAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853339; x=1734458139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0WaAW3kh+VqyYkynbg5Bnnaq2ujjkmV+I+q8jKp9mU=;
        b=II/PBxCHxbwEd+GdlCnV9QAj1532WTUaN+hLUZnntUv24GwAicznQrVcmuH2JWpHLv
         un2OL9HH0nyzuG89h1QqiTh6qakWYon7MdnxDjA3TFQY1VblbZjkH1p+FpWpJ174Ox28
         RwONS/VY8+TYepXbp1YN7f2nlEq2eRaj/h0K8TeX0KPedModsjcEu92wcEcnmEl1jHdQ
         BrPFI6VaPGN38iqqcU5/9QdHDJ20KwbudM9lzX2ol3GekvzXFAQubaixJrUyYBZlb3Yk
         HOS+oMsLRn1qWNhnLlynJbRB9bhtAoilqkswRxIJ09NYv/sCEcx+vXI8KF7x8M2Q+Qdg
         jlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7wFYmHgwHqf9kewGjmZGL0rQTqRuXOzIXDBj9L8GYncpFr/n+/8kkwho+NFZQLg9ajfuKmGhRC/WTgqU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8ZwFQEbIZOYiqVjNnn1JGqQZO0jdpUDhKb7MD+SiHiiCBb/g4
	u3DgekCOCd5y5XOhLMl4VyOtW+mPutVLrjQEQDGqzo5McANTCDJHAaPYSsjHzJNNQObY7K/1Ogt
	jPmt3HKnE0xxMqYhPmI2fRNkCB9DvqDXXQZFO
X-Gm-Gg: ASbGncuOaQFtqhnnN0ZXHExJ/CtxdJPqxwnErmQLgVp6Q/qArss7KaXLOwbiPQqqkt8
	in5QwIrvA0w+lfXWMFizjYtozQINTHIKeN4CvGwzbzswAe4norZZktwUL2QwExkhD
X-Google-Smtp-Source: AGHT+IGLvX826EUtDFzCMbe4Z82/rCvZNBH+2oBWnGrvdZr1UuD+ncWShG6UN2y8G42XtPREcypqHTRZ438FncSXyng=
X-Received: by 2002:a17:903:144b:b0:215:79b5:aa7e with SMTP id
 d9443c01a7336-21674d58706mr2897555ad.13.1733853339077; Tue, 10 Dec 2024
 09:55:39 -0800 (PST)
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
 <20241210024119.2488608-2-kaleshsingh@google.com> <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
In-Reply-To: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 10 Dec 2024 09:55:27 -0800
Message-ID: <CAC_TJvc5SU_khaBf7NS1VvD+d5PJ4X1DwKWbO92j-dZ+rEuc9A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Yang Shi <shy828301@gmail.com>
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
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 9, 2024 at 7:27=E2=80=AFPM Yang Shi <shy828301@gmail.com> wrote=
:
>
> On Mon, Dec 9, 2024 at 6:41=E2=80=AFPM Kalesh Singh <kaleshsingh@google.c=
om> wrote:
> >
> > Consolidate the hint searches from both direcitons (topdown and
> > bottomup) into generic_mmap_hint().
> >
> > No functional change is introduced.
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  include/linux/sched/mm.h |  4 ++++
> >  mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
> >  2 files changed, 31 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index 928a626725e6..edeec19d1708 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct =
mm_struct *mm,
> >                                            unsigned long flags,
> >                                            vm_flags_t vm_flags);
> >
> > +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> > +                               unsigned long len, unsigned long pgoff,
> > +                               unsigned long flags);
> > +
> >  unsigned long
> >  generic_get_unmapped_area(struct file *filp, unsigned long addr,
> >                           unsigned long len, unsigned long pgoff,
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index df9154b15ef9..e97eb8bf4889 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_=
area_info *info)
> >         return addr;
> >  }
> >
> > +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> > +                               unsigned long len, unsigned long pgoff,
> > +                               unsigned long flags)
> > +{
> > +       struct mm_struct *mm =3D current->mm;
> > +       struct vm_area_struct *vma, *prev;
> > +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, f=
lags);
> > +
> > +       if (!addr)
> > +               return 0;
> > +
> > +       addr =3D PAGE_ALIGN(addr);
> > +       vma =3D find_vma_prev(mm, addr, &prev);
> > +       if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &&
> > +           (!vma || addr + len <=3D vm_start_gap(vma)) &&
> > +           (!prev || addr >=3D vm_end_gap(prev)))
> > +               return addr;
> > +
> > +       return 0;
> > +}
> > +
> >  /* Get an address range which is currently unmapped.
> >   * For shmat() with addr=3D0.
> >   *
> > @@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsign=
ed long addr,
> >                           unsigned long flags, vm_flags_t vm_flags)
> >  {
> >         struct mm_struct *mm =3D current->mm;
> > -       struct vm_area_struct *vma, *prev;
> >         struct vm_unmapped_area_info info =3D {};
> >         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, f=
lags);
> >
> > @@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsig=
ned long addr,
> >         if (flags & MAP_FIXED)
> >                 return addr;
>
> It seems you also can move the MAP_FIXED case into generic_mmap_hint(), r=
ight?

I think that could be done too. we'll need a new name :) Let me take a
look at it ...

-- Kalesh

>
> >
> > -       if (addr) {
> > -               addr =3D PAGE_ALIGN(addr);
> > -               vma =3D find_vma_prev(mm, addr, &prev);
> > -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr=
 &&
> > -                   (!vma || addr + len <=3D vm_start_gap(vma)) &&
> > -                   (!prev || addr >=3D vm_end_gap(prev)))
> > -                       return addr;
> > -       }
> > +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> > +       if (addr)
> > +               return addr;
> >
> >         info.length =3D len;
> >         info.low_limit =3D mm->mmap_base;
> > @@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
> >                                   unsigned long len, unsigned long pgof=
f,
> >                                   unsigned long flags, vm_flags_t vm_fl=
ags)
> >  {
> > -       struct vm_area_struct *vma, *prev;
> >         struct mm_struct *mm =3D current->mm;
> >         struct vm_unmapped_area_info info =3D {};
> >         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, f=
lags);
> > @@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *fil=
p, unsigned long addr,
> >                 return addr;
> >
> >         /* requesting a specific address */
> > -       if (addr) {
> > -               addr =3D PAGE_ALIGN(addr);
> > -               vma =3D find_vma_prev(mm, addr, &prev);
> > -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr=
 &&
> > -                               (!vma || addr + len <=3D vm_start_gap(v=
ma)) &&
> > -                               (!prev || addr >=3D vm_end_gap(prev)))
> > -                       return addr;
> > -       }
> > +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> > +       if (addr)
> > +               return addr;
> >
> >         info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
> >         info.length =3D len;
> > --
> > 2.47.0.338.g60cca15819-goog
> >
> >

