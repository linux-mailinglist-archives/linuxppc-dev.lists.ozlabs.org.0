Return-Path: <linuxppc-dev+bounces-4058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867D9EFD02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 21:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8NpH2MpSz30Qb;
	Fri, 13 Dec 2024 07:08:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734034135;
	cv=none; b=FbI83lS5IeZTTst5NQX/pgUtZNu0PXqF75sTDesY2e4PdZhnojQj+3rOln3a37I8H5IgW55nL0fKzGLI5+YVlPHSRHQ53bcW757sMTLA/xuUNXkZRFFW/tTx4r0VLamMuhi9I+LImtjbiNf3jH8fjgHWLnIseugGNyw4md5NiU5T20lalhfWTS83k9wpZ2fO6wIrG5hQN8wiejZckPJRBGSyGE/c2uWTVL6VwR50uQd8XI36XQvy9taaiaigPtiCmiWlOL2mxGtIf+6oU1M4q8n7pXoLcGkUWJrIhQbMm1xf5xibaHFMasZx5DADu6J/DBZf5Uf2RWp0gY6+b6JaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734034135; c=relaxed/relaxed;
	bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9IbFNU4miYItrTcB8FacotyVKdt+X7GhiVbTpG6cuODtW8sJZTRPR50l5gwq/yLraoU21JEBj+msVAOecU5s1In81XfTa+8snI7NLv8C6aT5ybA2K1Hug7agawSPsR0oKOEFM+FVKRVLbv3v5NwhqYGareeSFkL7rCo+mZa0dAQYG+2UBeGPc+COy0l+uv/aEDe1UeOzww6hvhiTFL4gFeMZIe2HoE4iwRiJjumeUuVh122nhSKQkU5q6I3e/vK0/QoJvBAVT4gOFZ45UlFd8UHCJqkISX+5nFcOBPnExUke4Si6LszsnA6lYGE/KLjNQG+6e+z0npX2/Tp6GYB+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X72DBlYk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X72DBlYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8NpD58lKz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 07:08:51 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa6a618981eso158185466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034127; x=1734638927; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=X72DBlYkQKIqIMxUn0ptZcnWvIiJ5CbyD8vHttdYkG7TFVRcl7fOFOw9c4ZplfUU9h
         mPCQIyQn0b020T6BgoaCqrtlVNaheG5yepLkYhvGmQjwO8PtkDCvektSrxWwfkFgIkvQ
         tiMaysOYmp7NWn/QXuf1e56WxTvqaF/4KQ6FNgOIoCFhIEGzqCLfQCX2DoHZsBBDcZ08
         kci7qoFJb6DVtpR9jggpUx5yOl/+mmjLolCBUHtf8zpYbjksRojBBP9AkxtpBUqrvFxK
         dWV0sMCzll/LteTeJGEr/TYBrcGALoab9Jfz6jTqMwN2FP1i8QUjxYtNBI9wLnjs7MX7
         cZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034127; x=1734638927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=ADjtTe5XdlPlp++4jqeHBmWnhFrzGR4Tc0URrSs3OMhVgS+ZlM8XQAUlChip2BAxwx
         OKTXLkZbrOEdCibfMNwTv4gO6M8Js4gk6wmBBl5C6+DSNxmHI+SbI9yWnhdWivpy74fJ
         tL6LQFyW4y+oz+6YDN8RG1ORcfOocojZf0aBmqWGS4YwyfTkU1wBpw21Eb0edqTnnpiO
         ccigPviWhlWosFFXCqwosaIDP6KFEwThs0t6tl5A0N4e850/6kc9wiwxXOuxkd4d90CR
         JR4458jsNY7Db0IfODE+mdwIrW16fu2JJxzC2znZkmbaN2r6anhrdQzpAl9kPE/nhvrV
         Pq6w==
X-Forwarded-Encrypted: i=1; AJvYcCUlAdwtJdY60qaBI/V6n4lM8UxJUA4I92YhsskWVx/YX5/5DlQKiBmHbRv32wk3SxPwgEQD3nC6DBXUqvc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YynO2zvUsO3mEr1vfhdkUeUI0nBcv7iBbwrPm7gVnq6dHhJYIg4
	aDCo8nBwokIaWodAj/gENzY6JHwhw+T94qqGU1rwh+1GmlCj2vvE1RClPx3yZUEhGoJA63ZyMki
	zJ1JyPEXUoHKFlTEfdgpulAhymhc=
X-Gm-Gg: ASbGncuce2Y2xThBzkkaZLjJ+mdKIaXPVFBlqdKLc3JQUAFv/eCI76sbg/dPxBRWfD0
	gaeElx1wfmjDrcHShSY6Snb52/AGNf8JZ1trzGKbS
X-Google-Smtp-Source: AGHT+IFBjZrg88OqeWBDO1jTyqFkrRhdvj/sM97FkFYUxtUn8pc+yCVr/hdiAj5KO+SOUnoKUqWUM88SK7LqY4tEHG8=
X-Received: by 2002:a17:907:3e9f:b0:aa6:64be:ff2d with SMTP id
 a640c23a62f3a-aab778c168emr3388966b.4.1734034126714; Thu, 12 Dec 2024
 12:08:46 -0800 (PST)
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
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-2-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:08:35 -0800
Message-ID: <CAHbLzkovqMsjti1g_G4dFj2mb4hneBPtR2eGTxTZmC717455-A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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

On Wed, Dec 11, 2024 at 3:28=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Consolidate the hint searches from both directions (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just=
 a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().

Reviewed-by: Yang Shi <shy828301@gmail.com>

>
>  include/linux/sched/mm.h |  4 +++
>  mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
>  2 files changed, 50 insertions(+), 30 deletions(-)
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..edeec19d1708 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm=
_struct *mm,
>                                            unsigned long flags,
>                                            vm_flags_t vm_flags);
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags);
> +
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>                           unsigned long len, unsigned long pgoff,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index df9154b15ef9..382b4eac5406 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +/*
> + * Look up unmapped area at the requested hint addr
> + *
> + * NOTE: MAP_FIXED is also handled here since it's a special case of
> + * enforcing the hint address.
> + *
> + * Returns:
> + *    ERR_VALUE: If the requested mapping is not valid
> + *    0: If there isn't a sufficiently large hole at the hint addr.
> + *    addr: If sufficient VA space is available at the hint address;
> + *          or MAP_FIXED was specified.
> + */
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       /* requested length too big for entire address space */
> +       if (len > mmap_end - mmap_min_addr)
> +               return -ENOMEM;
> +
> +       if (flags & MAP_FIXED)
> +               return addr;
> +
> +       if (!addr)
> +               return 0;
> +
> +       addr =3D PAGE_ALIGN(addr);
> +       vma =3D find_vma_prev(mm, addr, &prev);
> +       if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &&
> +           (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +           (!prev || addr >=3D vm_end_gap(prev)))
> +               return addr;
> +
> +       /* Fallback to VA space search */
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsign=
ed long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
>                 return addr;
>
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                   (!vma || addr + len <=3D vm_start_gap(vma)) &&
> -                   (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> -
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
>         info.high_limit =3D mmap_end;
> @@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       /* requested length too big for entire address space */
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> -               return addr;
> -
>         /* requesting a specific address */
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                               (!vma || addr + len <=3D vm_start_gap(vma=
)) &&
> -                               (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
>         info.length =3D len;
> --
> 2.47.0.338.g60cca15819-goog
>
>

