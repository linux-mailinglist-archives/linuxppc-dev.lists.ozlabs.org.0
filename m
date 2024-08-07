Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3C94B1AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:56:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TYvsiEn3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMtG5XPYz30TQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:56:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TYvsiEn3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfDy12wB6z2xQL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:44:40 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso36838a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723045475; x=1723650275; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgojAL76gtXcG5WMdxnB/FzxmrNqVGWIbcYNJ79HH/I=;
        b=TYvsiEn3RroORg9MO3u5hnANOaBM0amy0hXESKxeoPPxPrULb/tZeywFAvwYE5WXFW
         +DEMQzE5vZVnuYrE/n4lNWjdcAzMGWJqIBq2AV/NtdAKXUAzhoh6yR+YbNcTSJg0TSrK
         TOLWjxLMaHH0o4nVvk+2+3XVJP5XPT6OwZFtgwI4bV9GDe4irRIomePdI9W1SAwA+sKQ
         +hH4zh1POi7tPBaMx7hDwZZxUmvivdkwLXYayevePGWjkYS+yWNTFNA2flKls3s89aS+
         ygO7Wm/JUV+FchxKZu6TJuJE2XXiFo+Ox9wk921EJBp+rwbhmM70i15r7nhh+DcbO+vR
         uxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045475; x=1723650275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgojAL76gtXcG5WMdxnB/FzxmrNqVGWIbcYNJ79HH/I=;
        b=J5sOuNiMTHBF7SYZMp7yrbH9kt2q+Qy0pPXazED/CElMw2xtgS2ZtMR0xgZIznc/w9
         4geOybcWeD6aoVW3+EpTqNY7GFoJUnmkgx1Z+K4ILSZ+gZrNNxXfj7PCwJVHkM3AhU/O
         I/PHMrTRq47wjsUCJIR1HMQjKA4r2x0Po+JirqPHuayQQJlYzRQnus0p9kj+TRgHJHVa
         jJv4YsRPUSgPTTblOkhOEsQC3H9ao0KAyjktyTAKFN2BSzpjOxZVsA/P5GSDF05QerLc
         o5IOhcikqLtTejOBEGyE1xQQiHA8QMe5CQmosROYSlp99II/DX7MuvDDQ2PYupjFy3Pi
         Xi2w==
X-Forwarded-Encrypted: i=1; AJvYcCW6Y6gVVoupMWhxce3RB4eRLtS9aIha4MoIYSNyLhMvrlTy0098q5xdgbCdGWxDUgc/frX8OQMx8HHzOQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBgt5ObiphQjxRWGnho1aRDMQHZno3Ia55BLcAEm6gqZbk6BiX
	t4Ber8jmmj6JJKG3Ektr4d3RNpqWNhhKzq2fWCqr31clTMRLY3E6/cfR+labWqEgKuQoTYoZ19H
	Vr2VzMe7encPaAxgKfM34I9Z8OtE59gJE8LG5
X-Google-Smtp-Source: AGHT+IFAd+Y2q73KAR99q5jxhm5yDjlmQ2pPZj6irk4D1k87HYzP34Wk4BrB5n4Gw2L328GhKntkCHZgbPn3JLSGDmI=
X-Received: by 2002:a05:6402:84c:b0:59f:9f59:9b07 with SMTP id
 4fb4d7f45d1cf-5bba28bb22amr213813a12.4.1723045474408; Wed, 07 Aug 2024
 08:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
In-Reply-To: <20240807124103.85644-2-mpe@ellerman.id.au>
From: Jeff Xu <jeffxu@google.com>
Date: Wed, 7 Aug 2024 08:43:57 -0700
Message-ID: <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 08 Aug 2024 06:54:21 +1000
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, linux-mm@kvack.org, oliver.sang@intel.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> Add a close() callback to the VDSO special mapping to handle unmapping
> of the VDSO. That will make it possible to remove the arch_unmap() hook
> entirely in a subsequent patch.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/mmu_context.h |  4 ----
>  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
> index 37bffa0f7918..9b8c1555744e 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct *mm);
>  static inline void arch_unmap(struct mm_struct *mm,
>                               unsigned long start, unsigned long end)
>  {
> -       unsigned long vdso_base =3D (unsigned long)mm->context.vdso;
> -
> -       if (start <=3D vdso_base && vdso_base < end)
> -               mm->context.vdso =3D NULL;
>  }
>
>  #ifdef CONFIG_PPC_MEM_KEYS
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index 7a2ff9010f17..220a76cae7c1 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_special_mappi=
ng *sm, struct vm_area_str
>         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
>  }
>
> +static void vdso_close(const struct vm_special_mapping *sm, struct vm_ar=
ea_struct *vma)
> +{
> +       struct mm_struct *mm =3D vma->vm_mm;
> +
> +       /*
> +        * close() is called for munmap() but also for mremap(). In the m=
remap()
> +        * case the vdso pointer has already been updated by the mremap()=
 hook
> +        * above, so it must not be set to NULL here.
> +        */
> +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> +               return;
> +
> +       mm->context.vdso =3D NULL;
> +}
> +
>  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>                              struct vm_area_struct *vma, struct vm_fault =
*vmf);
>
> @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec __ro_afte=
r_init =3D {
>  static struct vm_special_mapping vdso32_spec __ro_after_init =3D {
>         .name =3D "[vdso]",
>         .mremap =3D vdso32_mremap,
> +       .close =3D vdso_close,
IIUC, only CHECKPOINT_RESTORE requires this, and
CHECKPOINT_RESTORE is in init/Kconfig, with default N

Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?

Thanks
Best regards,
-Jeff

>  };
>
>  static struct vm_special_mapping vdso64_spec __ro_after_init =3D {
>         .name =3D "[vdso]",
>         .mremap =3D vdso64_mremap,
> +       .close =3D vdso_close,
>  };
>
>  #ifdef CONFIG_TIME_NS
> --
> 2.45.2
>
