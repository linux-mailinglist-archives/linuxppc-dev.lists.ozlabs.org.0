Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5388D557A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:36:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ai1TMFBK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1LT4F91z3fn3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:36:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ai1TMFBK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=cuiyunhui@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vqh1y3qQ4z30ft
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 19:35:32 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-24cbb884377so357212fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717061728; x=1717666528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=Ai1TMFBKTs1+km2qRCXCSRsBF/nMJvRowWjZ6rEfXGL1asVGmdiSJ0q8PHR2WP4Iiq
         /eDdbzBCh+JynWE7qAw6HAJDk+Kj0DY7wlsGBRRx10kHR0rT4p8wrDWZqOIjrLXkndh6
         BbdfEkU+YaCf+Cuh1jti3eQfWQCG+4U8tFdaKYgP/KpcB9h/yNBClYDFzcR4VuuXukwy
         9WgDjGRz2qJKJ3A3EBeJYGYX9shNSvoaPwqxqUHEe0Fhu2vRxaRQpOl07QTWsS5RK6zW
         tGvvqL0UFZImXAV/EKxPfU9ORm9y/aEXuSni4HJaBkD1eaefL9pNF26ok6Jnf88cw6VB
         9k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717061728; x=1717666528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=e6/h480k4WLl6t/DXRmH80c3dLzq8Wj7pMctlTPu4o94XyAq86lOth+RLUC2sXbW45
         ujGnEieuv7V98K+6xBa+klDBKitdQV72Pvb5tqJaZqESM1EuxSLhiB5hdvDEluQinTCW
         lp3Z7s70R69tkTfOxOo18GpDh2YwyI0VA9Sn39bjxuUy42qRDxLV6QArOhZa4cheonvs
         PsincPlqAU+/t8qGEjHETWC777CebxcioU/IgbulH0Gf78qnabvBLJ/Mx1zJH+5pynuq
         fEy3hovXSuPo0Wacwv0hym7JVJPiH5KJNn86xv5I9qSaRP+atcMpH+6dg3L7mbG/udT8
         iFvg==
X-Forwarded-Encrypted: i=1; AJvYcCXaSEeBjFYGHDA9KrLbBYZJ/gnTeHeHiOz35KdNUbkmmzjzE4jwLcxrvwVd9DqJ6NgcwuYMcP+p5IJFSEkppi1nl09ptkk9sH1P14IIaQ==
X-Gm-Message-State: AOJu0YzAnQffJVgDZYIRQVYLLWsekpa63igpdoz2VaQ0dcAnralB2D07
	llTo8F6TP9BnJ5iHH9N8EzWpw8kuk/0SGODso4XNMOFK10Rcm+CITq5grVq6JFuavyLvaJyXJ+u
	Rd3JnxTLPADr9Ixq++UdKU1BRrXaY+SvI0tvhvg==
X-Google-Smtp-Source: AGHT+IGQo/4+Bcec7GR4w4t9VuGgDnfgRuIzi4gbmVB9EXNZxFk4++tYC42KZVEUtna/+lcQBmHO84N93cneyoHhbbs=
X-Received: by 2002:a05:6871:3329:b0:24c:ac96:ac78 with SMTP id
 586e51a60fabf-25060de9e8amr1722957fac.44.1717061727430; Thu, 30 May 2024
 02:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com> <20240131155929.169961-5-alexghiti@rivosinc.com>
In-Reply-To: <20240131155929.169961-5-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 30 May 2024 17:35:16 +0800
Message-ID: <CAEEQ3wnmCr5NTEFo3wTN_zWse2DPkE6ieVUk_=Vv7A-UzDCCvQ@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive
 sfence.vma for new userspace mappings with Svvptc
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alex,

On Thu, Feb 1, 2024 at 12:04=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> The preventive sfence.vma were emitted because new mappings must be made
> visible to the page table walker but Svvptc guarantees that xRET act as
> a fence, so no need to sfence.vma for the uarchs that implement this
> extension.
>
> This allows to drastically reduce the number of sfence.vma emitted:
>
> * Ubuntu boot to login:
> Before: ~630k sfence.vma
> After:  ~200k sfence.vma
>
> * ltp - mmapstress01
> Before: ~45k
> After:  ~6.3k
>
> * lmbench - lat_pagefault
> Before: ~665k
> After:   832 (!)
>
> * lmbench - lat_mmap
> Before: ~546k
> After:   718 (!)
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
>  arch/riscv/mm/pgtable.c          | 13 +++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 0c94260b5d0c..50986e4c4601 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -473,6 +473,9 @@ static inline void update_mmu_cache_range(struct vm_f=
ault *vmf,
>                 struct vm_area_struct *vma, unsigned long address,
>                 pte_t *ptep, unsigned int nr)
>  {
> +       asm_volatile_goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA=
_EXT_SVVPTC, 1)
> +                         : : : : svvptc);
> +
>         /*
>          * The kernel assumes that TLBs don't cache invalid entries, but
>          * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
> @@ -482,12 +485,23 @@ static inline void update_mmu_cache_range(struct vm=
_fault *vmf,
>          */
>         while (nr--)
>                 local_flush_tlb_page(address + nr * PAGE_SIZE);
> +
> +svvptc:
> +       /*
> +        * Svvptc guarantees that xRET act as a fence, so when the uarch =
does
> +        * not cache invalid entries, we don't have to do anything.
> +        */
> +       ;
>  }

From the perspective of RISC-V arch, the logic of this patch is
reasonable. The code of mm comm submodule may be missing
update_mmu_cache_range(), for example: there is no flush TLB in
remap_pte_range() after updating pte.
I will send a patch to mm/ to fix this problem next.


Thanks,
Yunhui
