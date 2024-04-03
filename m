Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B88963F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:20:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=V90oPW+t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Y3j6DCYz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:20:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=V90oPW+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Y304dvPz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:19:39 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-60a0a1bd04eso64700467b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712121576; x=1712726376; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOCPtamLjLlH08r18iAQXT/wFMDp/bp5k+lkBS2A+NA=;
        b=V90oPW+tpBLybSBGsiknVNsR5/n+Kph3QIDwCW0GrcSGP7L0hPTPT2RUb4Q8kl3K4X
         dicqFWIIwNJrPJeeZ9sV9SLebrt32szTlyBcHA2bWEJsP7r3RVjOOpXvAmsLBwERe2B4
         wI8gSPNFGOJT+2MEtwndZlxKyPEPiw3s1x5Dmhg8kRJJdv3Uen+s36zCv2HJ8wH6qi8c
         SBNrVu57d4dicZIngPovSwzR8LeKzG5YsJdYUH0+9A0LPUo2MbHGFwRUswRv3+UWD39X
         0f3GQtxPAmwI4SZPVjz5RroFjuHBc4XU06AzpqElWOTm3+iLTuV8SBzYavTbLhh5Ju/5
         3MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712121576; x=1712726376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOCPtamLjLlH08r18iAQXT/wFMDp/bp5k+lkBS2A+NA=;
        b=Zk3IP5jAfb/JEHlHWE+mNZFBQohFyerF+owphuHDzRVFAn0Ekx31fxsVesxUg7arT5
         UM3nSnVH2ZRqEMCKiIA8YpQS73rcN2wtLToznX5tkkc1tsIrUS7WsgCAVyEtpvetqfay
         s7q0odQ5O9VwkH2Y4Cig8IpVopOjd/39YIXtOtJgr8MjSh11PyBReREATvH7FHJE+6cM
         xeVoKiZl0fjv49OtCwxdGXifPb9K4e4yJG6YJGuvOGhIzp43t+s6xm5igmquRo9hVyzQ
         fa93+9PO9ueOE8nsqE4ubSVdHuXV2oxtJYADkC0NGj1q6O8tPNIBYl3mBZQ+6JrZJrbr
         S0YA==
X-Forwarded-Encrypted: i=1; AJvYcCXw1QJfdhVkgpH/1l9R9KEdoOL0hS59pgDeAMqPUp1Fb6JbdHiXuiL7j4PBlB7yclnv9KyKst7KXd3gttprE+i79fYP1hdoCkOi9BFr5g==
X-Gm-Message-State: AOJu0Yy8j35TCwgRUasbHY9Dg3Nre0McxRzs26B0UsG4lbSQ+V8jJIfM
	RJ0Z+mD+qZTZoqIiMwnAHMTBu1Hn6UglXD2GDR69nWZCHRkKRv4A05W8UM4iRKE9w+RLP7ewVY0
	TvxuDsT7snJxWmO7M0CQOQqC3QM0b2FpZK55a
X-Google-Smtp-Source: AGHT+IEJD8vOOP43KF1PpQ1T71ZD6SCj2BgL2gMSdVC5sN3CPZR49WeMv1XyVA8LGXp+Tn6qsT8p7RXANK7YyUBgKFY=
X-Received: by 2002:a05:6902:521:b0:dcc:54d0:85e2 with SMTP id
 y1-20020a056902052100b00dcc54d085e2mr12598047ybs.24.1712121576118; Tue, 02
 Apr 2024 22:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-3-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:19:25 -0700
Message-ID: <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
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
> bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
> no need to lock_mm_and_find_vma() and check vm_flags again, the latency
> time reduce 34% in lmbench 'lat_sig -P 1 prot lat_sig'.

The change makes sense to me. Per-VMA lock is enough to keep
vma->vm_flags stable, so no need to retry with mmap_lock.

>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  arch/arm64/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 9bb9f395351a..405f9aa831bd 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -572,7 +572,9 @@ static int __kprobes do_page_fault(unsigned long far,=
 unsigned long esr,
>
>         if (!(vma->vm_flags & vm_flags)) {
>                 vma_end_read(vma);
> -               goto lock_mmap;
> +               fault =3D VM_FAULT_BADACCESS;
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);

nit: VMA_LOCK_SUCCESS accounting here seems correct to me but
unrelated to the main change. Either splitting into a separate patch
or mentioning this additional fixup in the changelog would be helpful.

> +               goto done;
>         }
>         fault =3D handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LO=
CK, regs);
>         if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> --
> 2.27.0
>
