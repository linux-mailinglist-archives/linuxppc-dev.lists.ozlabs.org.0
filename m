Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E989644E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 08:00:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fh5AzAgx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8YyP4C4dz3d2c
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 17:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fh5AzAgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Yxd3wCGz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 17:00:04 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dde0b30ebe2so638555276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 23:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712124001; x=1712728801; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxJSXITYZ9pShDuxFQvxpaL2/3sgcxNx/8xBOuQ2iCk=;
        b=fh5AzAgxEDciEhCV+osjgqql/mMRp6pMkQe836tzRnyFZYq2TPcKkkzL90q4p3O23r
         T610yjA5T1USbfXNxoVH9GWyA+x9vm5eY3tpTGUonULzePM+erol6pDll7vAty1AImWV
         sLoYXt11N/XioDbStNEbCcByinI0IODRjrFGrhlM8E8Qko5V24Tj80yxYWP41tu4qhnu
         xXpLEn4D2DN0916k6SnKCYNzJOi0PP8CtYTZVOm8fvtHBXxUw0tLvag8ynAF85MScvHU
         rd9R9Q2U/tInNuNA4m6rON0YT+JRsQXaWDWI6HwxZJHDQJeVQCS1hfmQbd7/dfun2Yu+
         KaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712124001; x=1712728801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxJSXITYZ9pShDuxFQvxpaL2/3sgcxNx/8xBOuQ2iCk=;
        b=OyBLsgsUDhVYdUZWMpXKVBYqNqrpMn2swuaKjwAVlAsmpzz6zFHw9QEb+YkhlndrY7
         te4D3MxhfU1rJSqmNVu3bh8J6sWhXLZvkRxmIRWmBeGmbyI7MByAiErVbSpev9tbgwsh
         cOVG/TnplzXzy+KTW2a7n2ZfTy68r8SqRZp+seORKVzJXlYDYCOGSN35LXiinRIchLaL
         bmV0CmBF0yBRiEGytL7Nn8tw+2/wPE4AizIO2o5e81litYsjhY0RL4GAPM5JIXcwT/io
         bu8B9lgLWmXaPc2hozsnh1dOuXtkX0S4UVPcQUu2CxegAvFYiDyzERYDyXiWSjkHA8Y+
         +HHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCyi06ms8hGumqq2+lsWdOXQk3t4egCm63xdeabdhZa1Emzp7pJYHzaPIehai7E3cILA0cToCUY7cLeryy0Zq3FbZQOnaEtFAFAmlx1A==
X-Gm-Message-State: AOJu0YyIw+ga9QsnJx5XAsN8ObNFtIOiz4tMhFmKk8f84xjGA/2lwxyo
	4bXVrx+LBGgmIlW7Nm7cezP8hu5/rBp+eayaSrH1yIwfRGJBHBGNpwVK+nsRxDtBtfW4NqRsa7K
	8o9CwsiVD/Ww5jMrcJdYi7pt2WBo/ubSfUGgl
X-Google-Smtp-Source: AGHT+IHF6yOPrbaSAup7jCog58WXJbC6NgZDiM+ULwuH0tlVvkyDWba5Ohyci7jQvdo5tO0oB+yC5pt2quv+tZIAonY=
X-Received: by 2002:a25:ef43:0:b0:dcc:4cdc:e98e with SMTP id
 w3-20020a25ef43000000b00dcc4cdce98emr6405675ybm.5.1712124001329; Tue, 02 Apr
 2024 23:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-8-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:59:50 -0700
Message-ID: <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
Subject: Re: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
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

Looks safe to me.
Using (mm !=3D NULL) to indicate that we are holding mmap_lock is not
ideal but I guess that works.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  arch/x86/mm/fault.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index a4cc20d0036d..67b18adc75dd 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -866,14 +866,17 @@ bad_area_nosemaphore(struct pt_regs *regs, unsigned=
 long error_code,
>
>  static void
>  __bad_area(struct pt_regs *regs, unsigned long error_code,
> -          unsigned long address, u32 pkey, int si_code)
> +          unsigned long address, struct mm_struct *mm,
> +          struct vm_area_struct *vma, u32 pkey, int si_code)
>  {
> -       struct mm_struct *mm =3D current->mm;
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
>         __bad_area_nosemaphore(regs, error_code, address, pkey, si_code);
>  }
> @@ -897,7 +900,8 @@ static inline bool bad_area_access_from_pkeys(unsigne=
d long error_code,
>
>  static noinline void
>  bad_area_access_error(struct pt_regs *regs, unsigned long error_code,
> -                     unsigned long address, struct vm_area_struct *vma)
> +                     unsigned long address, struct mm_struct *mm,
> +                     struct vm_area_struct *vma)
>  {
>         /*
>          * This OSPKE check is not strictly necessary at runtime.
> @@ -927,9 +931,9 @@ bad_area_access_error(struct pt_regs *regs, unsigned =
long error_code,
>                  */
>                 u32 pkey =3D vma_pkey(vma);
>
> -               __bad_area(regs, error_code, address, pkey, SEGV_PKUERR);
> +               __bad_area(regs, error_code, address, mm, vma, pkey, SEGV=
_PKUERR);
>         } else {
> -               __bad_area(regs, error_code, address, 0, SEGV_ACCERR);
> +               __bad_area(regs, error_code, address, mm, vma, 0, SEGV_AC=
CERR);
>         }
>  }
>
> @@ -1357,8 +1361,9 @@ void do_user_addr_fault(struct pt_regs *regs,
>                 goto lock_mmap;
>
>         if (unlikely(access_error(error_code, vma))) {
> -               vma_end_read(vma);
> -               goto lock_mmap;
> +               bad_area_access_error(regs, error_code, address, NULL, vm=
a);
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               return;
>         }
>         fault =3D handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LO=
CK, regs);
>         if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> @@ -1394,7 +1399,7 @@ void do_user_addr_fault(struct pt_regs *regs,
>          * we can handle it..
>          */
>         if (unlikely(access_error(error_code, vma))) {
> -               bad_area_access_error(regs, error_code, address, vma);
> +               bad_area_access_error(regs, error_code, address, mm, vma)=
;
>                 return;
>         }
>
> --
> 2.27.0
>
