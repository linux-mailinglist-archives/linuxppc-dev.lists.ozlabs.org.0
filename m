Return-Path: <linuxppc-dev+bounces-3897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0813E9EA699
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 04:27:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6kgc6rNTz2ykT;
	Tue, 10 Dec 2024 14:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733801244;
	cv=none; b=C1xfMpu526/6C3t3VEeImBRxWogWNbox8BT15OUg15yCVG2TTgGCMhNHaEtO75/Fzggo46Sv6CBfp5QTbZxhkRd9rROm5wQ8pzjMaQS/KVC9LLDMFblLwDxXMNfjrw/93jP0pfPxJa5N312gyuRU744Iwc3h7nzreInIaAkxsDZ99lVvUfMi+Z9t2a2V6x6RgGC59j9ZhPeu6D78WoItbbUr4X96IaKOwLwTJ/viXhrmxZunAQGJO67XHtX6/YzK9fWkU9DzvmjcXVSu9XZUWfpRGIP2qtAbrBJ7TBD28Xt6xlzS2KbfbyOLwftl/Mu9MvvWYDYlLoRWU86mtWN2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733801244; c=relaxed/relaxed;
	bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsJkzRLlOFcbTwmglCgAV8NFkVNYQelC/d8543pqPDldAcDtYfNoNclzbgPabkgb4vY084TAr3tV97YTMfkNJSPJjUkhI4svflU7VaoeWU0ssUYryeE3he2OI4t5gk/fiEyXz6uHdfFnvUN6FMGqXd9HcsZxJI7Cf4spUy0FLGyg4KPFpAFA+VJK+zhEDwVE2bc2B3g9uAZhAGSVTfcRODJLxCKoYvQ2gr0g7yVhugUaVfvv/h28rYVExjBxjZuQ6eaT5dK7XLDFwFbzcG7RCy5k6u8gE62DEQJyBJtqC+Oq63OGXmL9w3JcBCIETJKTqMZ9bzM7ssFcje5mqOQatg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PpMpdJ1z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PpMpdJ1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6kgZ6FHFz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 14:27:21 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3d74363cbso4918685a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 19:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801236; x=1734406036; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=PpMpdJ1zVAP2t/75w43V4A5xg2DO0PLLss07emHXpIM/XhV7aCYVQAyrWzi31P5uoO
         ota6qOdVQNiWvAedXgquZfpmlXH02UTvf/7/R0FM7Sle+qc4AuMsr8i5jx8g7UH+jEYy
         fPXIxn4dx3xzaGjrCy+DAiQtlUFA8PCEfwXH+XDKQLL0cDohmde+OdwLx1TvueeFrkTE
         KDtQNLd2Ia72TYUiywSDVx5PcxEoTY+fzkl+q9ZfBmw/PIAe58MvHABTMYWW3Awbh7Pc
         ycSXBLV8On6F1CKmJJI/DOL5foYqesN4WD4k8heccV5b3NHRKiYyhnxMLs2Oi6YfH+nh
         nmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801236; x=1734406036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=AHzL4CPjAc8b1rRnPGU2yjsCsFrby/q3rEOO1Yo98nDRU6XG0Ek0BZC+PBDjJAZUhE
         vsej0baxg7qQfPhm4YfHPKXivikzFgNfUBYJ5AFWM/yqCbt40nqfm96S0Bstf44a3mlX
         Ptr9K2sx7On2oS9MtZ5H/+kZAvbsKZbNAQvqN3YAVA6E7PxBwODCAJ0gTOklBjjw1uYK
         5eK1lEjvjqNGtqMnxKtqI8At6bXnV9+8NkFvwU9gpMd33pBZAifHSjkJm2mzyKuHCHMl
         XrX/37eYC8AH/WoeIZBx+cTUzPqw+2Fz0mZrlXii2nmAeIw0MxS/dJS4+IRx4meeGkKx
         8P2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+rmI26BJ1nLeRnFfzHzCLWIiJwvb9KeMLw0mXE8aDb/Rh2k87N7bHU/150+Wel+Ciy234s72zjE876W4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtK6JmfPOswKVZVgRDwd4h0fKhCmgJRVKGcaDhdSAFhiKjB+7A
	M+mdxveZcHWiVqQxtcakT+SkcoFEIonwSVzE2LpXvSl6jWfaETp1Czz1DiZCo/Nd/zogzvY9Uls
	yoL96PSnbzDKYgFA0BCyAKhB0VzU=
X-Gm-Gg: ASbGncuWR9kgkON+uK0vdKEay6bDBv++zVwB+WU0uE9KNlGClXr4Kp14Y3KZBlupwVg
	ijhw3SGK+oeCxUxLAc/J3RyKQjqKzLGRZqF4jWg==
X-Google-Smtp-Source: AGHT+IHf2Fi/42HQsEiQo6WzNdGmDcvEV4I1TbpQP4oAJiq1u3pQn+R3NnSbM/I4gmKvXuY9eOlF5eGp3h/ZPgrcEvo=
X-Received: by 2002:a05:6402:278f:b0:5d0:fc80:c4d1 with SMTP id
 4fb4d7f45d1cf-5d41852f140mr3377986a12.14.1733801235781; Mon, 09 Dec 2024
 19:27:15 -0800 (PST)
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
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-2-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:27:04 -0800
Message-ID: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
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
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 9, 2024 at 6:41=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Consolidate the hint searches from both direcitons (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  include/linux/sched/mm.h |  4 ++++
>  mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
>  2 files changed, 31 insertions(+), 18 deletions(-)
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
> index df9154b15ef9..e97eb8bf4889 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
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
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> @@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>         if (flags & MAP_FIXED)
>                 return addr;

It seems you also can move the MAP_FIXED case into generic_mmap_hint(), rig=
ht?

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
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
> @@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> @@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp,=
 unsigned long addr,
>                 return addr;
>
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

