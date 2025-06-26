Return-Path: <linuxppc-dev+bounces-9817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65492AE9F6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 15:53:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSgBP2SSxz30PF;
	Thu, 26 Jun 2025 23:53:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750945997;
	cv=none; b=buG/qcSDvPcwLD+Ypzjo99jrrhEHruNF39U3TYRoswV+0ezL251jhfWGsuScLU7rByH2yErpm6YS0uA/9P5ApCGCg2eKQ19Jzv5Hlx/UsaLha5yrnf1tbOL3gV9gZ34mSjY5dBt10JLpqMvImI6PAXhJpsyaDV8J7uJYtwGWcBIg27KGQEYdExSp1UWMVTecYiONhZj/YODn32YAHkob380krnnDBFcNczA6jmjzrNpMPeRqaR73IhDsYxlw/EFd+QtB92+l6RZaNm+IGyQ0WpnU+MpmDzUy2R5GopkMH3hfzPBjSYaErJU2UYw+rPzr84/5hDWd2Lsg0OFVlkfUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750945997; c=relaxed/relaxed;
	bh=zlpUNKK3G9db+EdwcDWwBbzYx+1GRPZcFPyn0Q/NIe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+4Wh6gy5wIUNkBOjKv+vYI38lwsTn5Np88u0RL/KbYOXuM8d8dTJISb6EpxBean79hZoIte6wIyL1m574Sy53tk46TTMXTExR5wwEDwXkT7fYyuz04W+CMR/vrFXQSmf+Jcj+GB25QY3pPgZF0XhQd8KT4Jhrfg5CKOFtDI0ekiuQEDW7s2czy8O+qDpH2oJHzbyJ6GEeyx93tReS2Oq96WWgz5HM4KcGjz9O3zUBQrxaNCxKmY+OTCIIJ5AW584nxeTG/GoKL1r5GBu4xzypsPQaAq+9KjR6Nqk4EP0PV0RZ9sjALULyecDJivy9O/252sKfaLupo9vJWKAcBO0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z3ehyewo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z3ehyewo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSgBN0WKvz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 23:53:15 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so7478791fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750945992; x=1751550792; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlpUNKK3G9db+EdwcDWwBbzYx+1GRPZcFPyn0Q/NIe0=;
        b=Z3ehyewo7heEWrJdgKuBaia5T/DIINI1J4y9qMm4rswSU1X6t/l/w4EkOA4Of9cgj0
         dQJBEXzjzJ1FA836+2enfKsXlwqOSnpYUzISby0ShCpFxkfO9VxwuEvB3KPYLLsgTcKh
         p2MS2iP7xQj7g/jxjlam455kwzUmXcyFOx3bHuAUII1IQvNQkzSqFn1ycX2GJiPMqU8o
         QmhNmxTi72NI6Z+jwJ/lPtO/3p57PR6wFH+FmbjyjRO5UdNE7IAditsNL6DyfifpvUMM
         K6T729221efi1feSapf/2BSxk9pstDeg/dNllvLVbIWgun+g0teAZ2VhuGOzrlSJTMLH
         ccJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945992; x=1751550792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlpUNKK3G9db+EdwcDWwBbzYx+1GRPZcFPyn0Q/NIe0=;
        b=WqPFOkFhHVxf0qQk5mMibc4TvyT+rBgZkmT4imVeuH6CWbP6sgZ8ltdzDIjNDOY3QK
         Jz1aRLgqq4EKYc+XgEx+dMPjB84C4u7H0gCO98vkBW8nMH9cFRKKXZjmuXPymygtSFpt
         Tu2ngM674z6C6qBfF/v6gd0r/+gl0qbnqtazHntuG1iE8cNUaasK/6SuRgFaxxJy9riS
         TIFSqKGycfRcrYU+PCX7+FoQMOXWmbhFfJkyZaHQl0wzzUYq3ZpIbrvYUTkyNDOVh6Ck
         TzoQJP0lM0x31M179ccL95VqgCpu0mf/zT5P/CaS2LC8S+UggsorNgycoFuM1J7LrTBl
         rHDg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCWwg57mDMtjvMVdRZ5tYO3pNjugwLBHwxuG0CEE+MEJzYNg0o5vRYjg0m64xIu3IMwm+Q5VVS1A733E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfJW3/14CJYLbOmeZ46w2VdE2k2PlLV68hjZc9GBkXvsbKJ9PF
	EM13V44vRFOFhCKesjwKocwGTyLbNZqrjw7Ql7oAJsl4HeXcWoALUbq1Cm59/LTVLwHaipFyzcH
	zxUE8kpO5UtRoCOIotF+rvpTiJX3ZXnM=
X-Gm-Gg: ASbGnculb+BEJlan6PQricw37UGGhlj+x7eJqsMQVBlS5xha/bda19vMMleSpvWzC88
	CzymosrGzag3uE1oYCj3I491UYTynnKIkO3J9BWuIL0zSvG6kpGf9EoFWUm50Cjffh6dKXSacrX
	yknh5jXGLgHYrF8rSLDChh5b3dQlJU20HGOHrgPwTCAw==
X-Google-Smtp-Source: AGHT+IFp5i/0Kq3rabH9rf2kY42MbESDKtULRW6uJMn5QRZ8/Z9H2i8ntSIcRhBigiGO2NXAKYlXjXFM6g03B8Baa18=
X-Received: by 2002:a05:651c:f0b:b0:32b:7284:88 with SMTP id
 38308e7fff4ca-32cc6497155mr12421921fa.7.1750945991880; Thu, 26 Jun 2025
 06:53:11 -0700 (PDT)
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
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-6-snovitoll@gmail.com>
 <20250626132943.GJ1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250626132943.GJ1613200@noisy.programming.kicks-ass.net>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 26 Jun 2025 18:52:53 +0500
X-Gm-Features: Ac12FXynXHan9NKB65s06xjAcLer_ajNs_gE1LBlTEt_pC6nGG6YTexJKgab6gM
Message-ID: <CACzwLxj3WLTK+A7YLcYvg5ZwvQdvoBuZL3bmEF+ELinFZgU=Pg@mail.gmail.com>
Subject: Re: [PATCH 5/9] kasan/loongarch: call kasan_init_generic in kasan_init
To: Peter Zijlstra <peterz@infradead.org>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org, 
	guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org, 
	tiwei.btw@antgroup.com, richard.weiyang@gmail.com, benjamin.berg@intel.com, 
	kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 6:29=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Jun 25, 2025 at 02:52:20PM +0500, Sabyrzhan Tasbolatov wrote:
> > Call kasan_init_generic() which enables the static flag
> > to mark generic KASAN initialized, otherwise it's an inline stub.
> >
> > Replace `kasan_arch_is_ready` with `kasan_enabled`.
> > Delete the flag `kasan_early_stage` in favor of the global static key
> > enabled via kasan_enabled().
> >
> > printk banner is printed earlier right where `kasan_early_stage`
> > was flipped, just to keep the same flow.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218315
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> >  arch/loongarch/include/asm/kasan.h | 7 -------
> >  arch/loongarch/mm/kasan_init.c     | 7 ++-----
> >  2 files changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/includ=
e/asm/kasan.h
> > index 7f52bd31b9d..b0b74871257 100644
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
> >               return (void *)(kasan_early_shadow_page);
> >       } else {
> >               unsigned long maddr =3D (unsigned long)addr;
> > @@ -298,7 +296,7 @@ void __init kasan_init(void)
> >       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_S=
TART),
> >                                       kasan_mem_to_shadow((void *)KFENC=
E_AREA_END));
> >
> > -     kasan_early_stage =3D false;
> > +     kasan_init_generic();
> >
> >       /* Populate the linear mapping */
> >       for_each_mem_range(i, &pa_start, &pa_end) {
> > @@ -329,5 +327,4 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized.\n");
> >  }
>
> This one is weird because its the only arch that does things after
> marking early_state false.
>
> Is that really correct, or should kasan_init_generic() be last, like all
> the other architectures?

It really differs from other arch kasan_init(). I can't verify that
kasan_init_generic()
can be placed at the end of kasan_init() because right after
switching the KASAN flag, there's kasan_enabled() check in
kasan_mem_to_shadow().

In arch/loongarch/mm/kasan_init.c:

void *kasan_mem_to_shadow(const void *addr)
{
        if (!kasan_enabled()) {
                return (void *)(kasan_early_shadow_page);
        } else {
...
}

void __init kasan_init(void)
{
...
        kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_STA=
RT),
        kasan_mem_to_shadow((void *)KFENCE_AREA_END));

        kasan_init_generic();

        /* Populate the linear mapping */
        for_each_mem_range(i, &pa_start, &pa_end) {
....
        kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
}

>
> Also, please move init_task.kasan_depth =3D 0 into the generic thing.
> ARM64 might have fooled you with the wrapper function, but they all do
> this right before that pr_info you're taking out.

Please check "[PATCH 1/9] kasan: unify static kasan_flag_enabled across mod=
es",
where I've replied to Christophe:
https://lore.kernel.org/all/CACzwLxj3KWdy-mBu-te1OFf2FZ8eTp5CieYswF5NVY4qPW=
D93Q@mail.gmail.com/

I can try to put `init_task.kasan_depth =3D 0;` in kasan_init_generic(),
but in ARM64 kasan_init() we'll still need to have this line for
HW_TAGS, SW_TAGS mode.

