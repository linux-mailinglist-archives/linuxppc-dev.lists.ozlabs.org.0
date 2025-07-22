Return-Path: <linuxppc-dev+bounces-10357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1AB0DD24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 16:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmfK66Qsxz2yb9;
	Wed, 23 Jul 2025 00:09:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753193370;
	cv=none; b=ZUpD2uNWFxUjY7CX83gh93f53ksnbr93PeRcf87HTaojRQhAaKuueW9VdR3ujtkFzLS84RjWtULR5HEeU3ATrrVfIBouIyRgVWNyRX1v+S1eTyi+zcDgSo6fEMFWXFwqHpPgZMxHhmeCRBSt2iAI2upfwW9WfWFNLuE5aB15nIByTAQNrEhNORKLHIPF0MFeSN4w9tIzVoL2X3IfLzx8sNPADd9e3OmsO1Gxhj+K4xv3ri5i+5+ihKMvDwlGXHEAP8injeJ7Tal7dOF/NdAs4KiqgLoyqGd9jnNe+ICmUckveZdGNCD/Y0xp5Lm1CDeHpPlQVpAZzJKValWbNgNFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753193370; c=relaxed/relaxed;
	bh=Z72Y4lywtzmWJK50j4gaS5KcylDNvYHYQchCkK6Shzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgKrtE9a9GNrcqCYcpXI68ChpkFZDJSIO7dlntjjZqnmuSCLAkFUi/L/EIXnXBJPvm3qdVuiUHyBqpcfqvitpzRnQM0dsD57PHo3xyiryg40NxAbFbhw2/y7VdpuvLH92qHWhmazMZuR2cRjHjW61NLfQlf/Cum5VV8HsuJRoBDZwS3G0a8/xuaadub1PowQQoe46CCWnPztrwq9HjqllYRpPtkYOFE9FoUon3AOJ/JMh8hoL1OOGD35j6rdFg+rAFZT9DqaieDGqsZa+GdNoq71bDTwphEFQTQVAQSxEncRry1ZPkxd20sWv6lAT5OyxtxLI0gO/8yMNn7zRix9ZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FP1EVpya; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FP1EVpya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmfK53SyCz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 00:09:28 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-32f1df58f21so56308181fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753193365; x=1753798165; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z72Y4lywtzmWJK50j4gaS5KcylDNvYHYQchCkK6Shzo=;
        b=FP1EVpyaHL1AjU1NGMJ1LOyhPcBSmu/ql5qupO+cI9ND0YQG0+/ve3U43wirhiTqSm
         F44NM1lj/Z6TT29oJ1dL9uQXPizK0YyAOjre0B8ZzNiIoNn3hJ3NPN8A1dQDW41iAjFx
         ktgmV/ole6Vu4UzLvp+cG/w3T9caRNOTScbNel58vRVMeWeTPvoLoHbxgfa8cHvbXCtA
         8c6JhZTkQlX5pn/o6uc2kqsTnrDuBbFXDlyci+TDNrIDMyVAw0KkMaJPcCp6DMBizmsU
         NUIrfITEv3bhqFL6SWzDw1XksAcDjjTTG7vTJyRP6MX/78xOXI3Nzsa4tYhSZU3vbloF
         TmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193365; x=1753798165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z72Y4lywtzmWJK50j4gaS5KcylDNvYHYQchCkK6Shzo=;
        b=LH9e0KdiJ1OX3InSUpdc+9MtHKQBpNdzjB9TJQUIDm4Z4wjELVQA9e+jav+gV0b94H
         1nxW1bIIYzlX+HDogKTSuVjYGwJnqO6JGrG9Zc76sB3t/Z5bIar1UwYwdZ0ktGyjHQdQ
         Ho4xAVQJU7c67Ens6amjbJneZZMZLrpLqNAnJhPFNQpAB3AfSpn6ZFtI6Ao0C+TUtI/K
         Cu0ivAhOE3yGAma+fNfv1hTp12tsHOZWxP6gEWn607k92IhAKeA+mYw4O/hrmyCze0Jo
         9ZnbYUgxFrx63CsFehswVcnGmjZYDaqJ5eT8kiFmtCGGeS1vyvEg6V4YcXcaujjyGj5j
         BZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVJp97TN7c2Eik06hj/wbmjuffe/r1wE8h6xDaXOwVwQ3VfcKZ/wucdQ0Q0eZnmncy/5Jwbcs4F6OD1erY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrXuCmyQzEqF+OcEXnAizjbiMYx9Z3I8GydSXiNnJMMAjERVy5
	Z5rntdGOEXRsNBCiVbIDHkw7DFTaZuYrXPVaoBPFP3Fa4lSqT/+FvaoCAvCpn4erbmN301KitKx
	0pfiAxVguyKIMxCB86KEZvq4jcCLcIbc=
X-Gm-Gg: ASbGncspsphToSmASWMcIU98O86ixB7AHfvWIxU3j+isWNcsN3x19Vmzie6M3v8RRI0
	5Wqaomx2PRITjU3gOZdxLNz380zQxYULWA76JwIrtq73XZuXKnUB2o72jSWWCoVW7IG7aSl87+1
	K+3DSyodmqisioZ3zMiBejtqez6cHgLfvWg1VrO4+JEYSKXvzwi91EoqD5npmJ8ocLVTGzyiBQQ
	A/OkGc=
X-Google-Smtp-Source: AGHT+IHxVK00NMC1GHSpVq/sT2EfSuq7omX6wX24xSvgGhrc9yg0F8isqB5neLuF1et0yPorDOiVEfN1u9rtptu/xSU=
X-Received: by 2002:a05:651c:4110:b0:32a:885b:d0f with SMTP id
 38308e7fff4ca-3308f5e2852mr36383791fa.24.1753193364861; Tue, 22 Jul 2025
 07:09:24 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-8-snovitoll@gmail.com>
 <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
In-Reply-To: <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 19:09:07 +0500
X-Gm-Features: Ac12FXxpDsEYsUfFuRK9xdlLStcuqGTW4Nrf9JrgjFdTiyEs4CW8gE7SGsQYdo4
Message-ID: <CACzwLxgjKz-bc1w4SvGu-EeoMvK9Dh=2WpB-A_zC-u7H38QqVg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and
 call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 22, 2025 at 4:00=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>
> > diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/includ=
e/asm/kasan.h
> > index 62f139a9c87..0e50e5b5e05 100644
> > --- a/arch/loongarch/include/asm/kasan.h
> > +++ b/arch/loongarch/include/asm/kasan.h
> > @@ -66,7 +66,6 @@
> >  #define XKPRANGE_WC_SHADOW_OFFSET    (KASAN_SHADOW_START + XKPRANGE_WC=
_KASAN_OFFSET)
> >  #define XKVRANGE_VC_SHADOW_OFFSET    (KASAN_SHADOW_START + XKVRANGE_VC=
_KASAN_OFFSET)
> >
> > -extern bool kasan_early_stage;
> >  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
> >
> >  #define kasan_mem_to_shadow kasan_mem_to_shadow
> > @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
> >  #define kasan_shadow_to_mem kasan_shadow_to_mem
> >  const void *kasan_shadow_to_mem(const void *shadow_addr);
> >
> > -#define kasan_arch_is_ready kasan_arch_is_ready
> > -static __always_inline bool kasan_arch_is_ready(void)
> > -{
> > -     return !kasan_early_stage;
> > -}
> > -
> >  #define addr_has_metadata addr_has_metadata
> >  static __always_inline bool addr_has_metadata(const void *addr)
> >  {
> > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_i=
nit.c
> > index d2681272d8f..cf8315f9119 100644
> > --- a/arch/loongarch/mm/kasan_init.c
> > +++ b/arch/loongarch/mm/kasan_init.c
> > @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata _=
_aligned(PAGE_SIZE);
> >  #define __pte_none(early, pte) (early ? pte_none(pte) : \
> >  ((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_page)))
> >
> > -bool kasan_early_stage =3D true;
> > -
> >  void *kasan_mem_to_shadow(const void *addr)
> >  {
> > -     if (!kasan_arch_is_ready()) {
> > +     if (!kasan_enabled()) {
>
> This doesn't make sense, !kasan_enabled() is compile-time check which is =
always false here.

I should've used `!kasan_shadow_initialized()` check here which provides
the needed runtime behavior that kasan_early_stage used to provide.
Will do in v4. Thanks!

>
> >               return (void *)(kasan_early_shadow_page);
> >       } else {
> >               unsigned long maddr =3D (unsigned long)addr;

