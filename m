Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0A896427
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jxh/jZQD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8YNb1JQpz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jxh/jZQD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8YMt4Yktz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:34:18 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso5712297276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122456; x=1712727256; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMhJUAqYdUyXE6Qj5LLiAEui3/1WTCPuc8rsDHLD3M0=;
        b=Jxh/jZQDh4UJlfMBhKyULK6EDJKIWNnnseR+HxYk+sqW5scJsdYxdTF8SnyQePAK1l
         Y0X9yM2+Kzeh1PQtQm4vIHvyO8ri4yafxO9NXM16LTjzmhE6JKAX2g8ZjNOX4Qcw1M2y
         bAc4bac7phQrtRruRq8XnnjzJciqt3Nzf+fjyLT6EWaFlGN3XlPsW8e+VsFf5holvZwk
         UjHm3ej6zKTxEqOioHP/UwnUInPfVNjqkccDn4feyvYVaXHXnXNeGTZd+h9eqBTfu2XO
         AmskGGGvz0vvFwLWWxVD/h4TaWWYiM801kDBL5QRPYhJsMJSZC5X/1LRrB8ucOYOmmDD
         vsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122456; x=1712727256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMhJUAqYdUyXE6Qj5LLiAEui3/1WTCPuc8rsDHLD3M0=;
        b=Tdmls6r8tZEnf02haJymJ4AXZDk2eVtZUcGdIrFEnbyv2YYdQf4CJabUvulJFSX8ud
         aYQLL2AVZQhODpxbpzMC/IzihASDteRY9cWTE0qCMzgeOqtjkoJoQdy36lwZ12JvilsG
         h8DghXzAZU9oBUH3o7+jkV9z/6ezkTFAHhMbakUap+pB45Q0RGuz8h7qmBGU2eoBOwHo
         uOEZ2RZHNCt8MN/JOCUWldx1o67Xw4SeOhmeO8VJK+bx9WMV2d5y2qNV0vc6VURq8MRg
         pZWKcwBObiDiiUOTubOVtn1THPY5BKsLWQ4P9SVjU3arlT/2Fv/ywE6if90gEzQeFlJO
         hF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoxoR4JaXhyjhhKhh2IcNgy8m3SQdluj1JCkhd6i9Br2wTSC+XKn1TqeibmkvaDoSu83DlNteVlncMLVNNNdMVx4MiDysYqsWqA+xxsg==
X-Gm-Message-State: AOJu0YzyfxPItRZ5YBj5K2obOHwd4gnsWh8eFhj3eOoRLEYzBdHvZMqX
	x5pI9LUgRbSBK8g2t4ELAcr9RSvKfXaBKp7sbboxbQe6zLTer1MMOZz5vS94q873JTlSQYfK/iz
	V2xLHcp4pLBiYilx+lJQxa5ZCXxpqYh9oYTdR
X-Google-Smtp-Source: AGHT+IFHtHI+kOgQbA0jN0HDYS831HEs6w0y5y/YrI4Iocm+EMqRSzcSDQggfc1RbHP4jEbfZEvpbo6dJNCJOpQwGVo=
X-Received: by 2002:a25:a28a:0:b0:dcd:3575:db79 with SMTP id
 c10-20020a25a28a000000b00dcd3575db79mr1551217ybi.6.1712122456055; Tue, 02 Apr
 2024 22:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-5-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-5-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:34:02 -0700
Message-ID: <CAJuCfpGhF9xLhJ1_fWKRirVdeT2C0QCMsWht2sB62q3ZaWA2wQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] powerpc: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andy Lutomirski <luto@kernel.org>, akpm@linux-foundation.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 2, 2024 at 12:53=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
>
> The vm_flags of vma already checked under per-VMA lock, if it is a
> bad access, directly handle error and return, there is no need to
> lock_mm_and_find_vma() and check vm_flags again.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Code-wise looks correct to me and almost identical to x86 change but
someone with more experience with this architecture should review.

> ---
>  arch/powerpc/mm/fault.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 53335ae21a40..215690452495 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -71,23 +71,26 @@ static noinline int bad_area_nosemaphore(struct pt_re=
gs *regs, unsigned long add
>         return __bad_area_nosemaphore(regs, address, SEGV_MAPERR);
>  }
>
> -static int __bad_area(struct pt_regs *regs, unsigned long address, int s=
i_code)
> +static int __bad_area(struct pt_regs *regs, unsigned long address, int s=
i_code,
> +                     struct mm_struct *mm, struct vm_area_struct *vma)
>  {
> -       struct mm_struct *mm =3D current->mm;
>
>         /*
>          * Something tried to access memory that isn't in our memory map.=
.
>          * Fix it, but check if it's kernel or user first..
>          */
> -       mmap_read_unlock(mm);
> +       if (mm)
> +               mmap_read_unlock(mm);
> +       else
> +               vma_end_read(vma);
>
>         return __bad_area_nosemaphore(regs, address, si_code);
>  }
>
>  static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long =
address,
> +                                   struct mm_struct *mm,
>                                     struct vm_area_struct *vma)
>  {
> -       struct mm_struct *mm =3D current->mm;
>         int pkey;
>
>         /*
> @@ -109,7 +112,10 @@ static noinline int bad_access_pkey(struct pt_regs *=
regs, unsigned long address,
>          */
>         pkey =3D vma_pkey(vma);
>
> -       mmap_read_unlock(mm);
> +       if (mm)
> +               mmap_read_unlock(mm);
> +       else
> +               vma_end_read(vma);
>
>         /*
>          * If we are in kernel mode, bail out with a SEGV, this will
> @@ -124,9 +130,10 @@ static noinline int bad_access_pkey(struct pt_regs *=
regs, unsigned long address,
>         return 0;
>  }
>
> -static noinline int bad_access(struct pt_regs *regs, unsigned long addre=
ss)
> +static noinline int bad_access(struct pt_regs *regs, unsigned long addre=
ss,
> +                              struct mm_struct *mm, struct vm_area_struc=
t *vma)
>  {
> -       return __bad_area(regs, address, SEGV_ACCERR);
> +       return __bad_area(regs, address, SEGV_ACCERR, mm, vma);
>  }
>
>  static int do_sigbus(struct pt_regs *regs, unsigned long address,
> @@ -479,13 +486,13 @@ static int ___do_page_fault(struct pt_regs *regs, u=
nsigned long address,
>
>         if (unlikely(access_pkey_error(is_write, is_exec,
>                                        (error_code & DSISR_KEYFAULT), vma=
))) {
> -               vma_end_read(vma);
> -               goto lock_mmap;
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               return bad_access_pkey(regs, address, NULL, vma);
>         }
>
>         if (unlikely(access_error(is_write, is_exec, vma))) {
> -               vma_end_read(vma);
> -               goto lock_mmap;
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               return bad_access(regs, address, NULL, vma);
>         }
>
>         fault =3D handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LO=
CK, regs);
> @@ -521,10 +528,10 @@ static int ___do_page_fault(struct pt_regs *regs, u=
nsigned long address,
>
>         if (unlikely(access_pkey_error(is_write, is_exec,
>                                        (error_code & DSISR_KEYFAULT), vma=
)))
> -               return bad_access_pkey(regs, address, vma);
> +               return bad_access_pkey(regs, address, mm, vma);
>
>         if (unlikely(access_error(is_write, is_exec, vma)))
> -               return bad_access(regs, address);
> +               return bad_access(regs, address, mm, vma);
>
>         /*
>          * If for any reason at all we couldn't handle the fault,
> --
> 2.27.0
>
