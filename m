Return-Path: <linuxppc-dev+bounces-10685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A6B1BF9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 06:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxctb5l8Bz30W5;
	Wed,  6 Aug 2025 14:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754454967;
	cv=none; b=bzoO0aEaFV6sW1FSVpZx+PM8MgnDuFzwoRcCwaEv0pGnLIAkm/SJGjHxEnigRACGsP7o0y55XGdlLEarQ1HR2gRjNOnUHr9XytTf+5W13EMFP+iAY1VLDUqr/ALkiVmxvZJVBliZVfhlszR6tWa0J5p/c4E9sw3sX6Y3hAX2wKrxKop4e14gwScJgu8fUHpUO5FrBpzx4QgKiqnKz88ui8JoO6IB+qr0GGWGWuzene3nG4hutdI19LgbpNRcb1B85UneqdwBBMYdwT8I459PGzz6ApKOFwfWxjLLFm1pTgtZAaPINvlAQwr4ADRCRpspaBeeYkQ840o+OYQezQQz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754454967; c=relaxed/relaxed;
	bh=dyl+4iOlTi/aeKebUp39F24cwHyqM1kxjjt1F2AMIE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFouH7dcz5YSNBqNNW2fZtrZwrw6DvNjbKgdOVG2GZ5U1VZ+mWXvjpnwvyN9Dk3wz5jWgVYWOxNoxQBewdE0E963B50z2VhJ+g1Q7u7RXY2OKs7quuB93UiYgtN+eAgStgzwvodC8pP+nTEjpP6PKTsGzdKabT6zbVD/qmfwd8fvSmnoEVPOlNcjbH5ifEl9ff1Cv8Zg0aQDoMMzCSBsjm6y6ULi6npnd+I4hh83i0vJgQ7GtpEAFkw8re/4w64x/XgVbKiU1HnZdVK/ztJ7QlHC8Yt39PUfbOE7bfmNEb8m4SiDL2SePc1Lt9KjQqEPXBO6ys/Y4/cIQAvMBocNtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eI+B9c8s; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eI+B9c8s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxctT3GS2z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 14:36:00 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3322e4ac12cso43156391fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 21:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754454955; x=1755059755; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyl+4iOlTi/aeKebUp39F24cwHyqM1kxjjt1F2AMIE8=;
        b=eI+B9c8sufnh9vKTZihhG6AiMCFT2UwVql3YNO8ZOLoBD/WzrgAqvZMwC6MlyUBsPz
         qMebGR7Ka44UKz1fZnN4yMwsWaWQTU8hDxqFfwU1izxctVH6/97RCpnxVws1BPICA9xO
         5idO/e9pwsH/UuaKpuGWwSfIFWd0kIEkujI4rm2MbE5ZDEflO6dk9I95RAUsNRDOgagl
         +vl3AMAiL8oy0z3PvRUVev5MXxk4gttSRPGhpN8bZXz0LS73Qu8fO1XgVTedOb8JR/hG
         O42vi/Sj8I7DCAbUFmLC8SO90YvxENdpBNbz7u0W2+AO9VMI3I53AdbnX/0o2U+1bU63
         gaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754454955; x=1755059755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyl+4iOlTi/aeKebUp39F24cwHyqM1kxjjt1F2AMIE8=;
        b=ntqPtZJ/LaZGCMA9e0nmdQK/8p9LxHIUJqxxJok/MHlkR2YX1s7lu+GaLfp2qBnw7p
         7bXgrd2OlncDTmGFTutWWCGWwXenHRzVdyE4TsccpUKv+MfVYdOgXLx+SD2shSLcawbT
         vm658YeaycO39j58ttmHUydyUFAQAJKnxhlEiNNf6mVMPkYRqAWa7Y1G8P/axIp7Ag9x
         cotpPfD9mMg+ScAHuER4PietUZRg9jNSuJfKTY4V9vbwINSqqu087JbjHAXciTWsmJ7n
         Fkw3lA4hqP73HxMGfU/GfHY87/XvvBpDl5prLAa/ra+/It8ItdE5vwZzzluELUVTw3ia
         59iA==
X-Forwarded-Encrypted: i=1; AJvYcCXbHme/72tj1ftrgUjkwR5wbVvM467i0RGz/5u3a1Z3xXxVRdLIrl0V1wYcVmTwKUhx1hcc8IbiRL30xns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyf5WaWMCnypw/H/dB/7GMX5+6N/am/Yswm6F736bUlZG5nbvaR
	/l7qBLfjdZ3UR5NSnqUaHTf6g3NK3N33rk17PhdMwS75FvY0ZII4X+TUsc1wprzTJ48bL1U9eHr
	N6J5/C3XCM/WGqWhazGqH6vjCibkWW64=
X-Gm-Gg: ASbGncvfpCwh1k0Tg777Ek3RjByY4ALdPpXWHvmf0Ma252ghpIYjYismhiufxSo9hYJ
	ePkoQ7Jr28abkOO8qB1Ox2QY0wS5lBE2oWmkAJhf935yzV2JdjLKHAjzjHT3I3y2/+hc6u87HTF
	MG56kEl79GJ9lD1WxmCZequDFVh8UiVhyZR9gz/Z7Di7Y/VIimEmd239hWMNjOyH2jZXDMdZcko
	IVTjq4=
X-Google-Smtp-Source: AGHT+IELREFbM69cWDMgkv0oAyeZWfUsogtR626ngafWyGyn4A7prZJUgwVT4kX8m1x5U9hUnIU0ztH0bEfAmGCquxc=
X-Received: by 2002:a05:651c:f0e:b0:32c:e253:20cc with SMTP id
 38308e7fff4ca-3338128c651mr2551171fa.11.1754454955157; Tue, 05 Aug 2025
 21:35:55 -0700 (PDT)
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
References: <20250805142622.560992-1-snovitoll@gmail.com> <20250805142622.560992-7-snovitoll@gmail.com>
 <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
In-Reply-To: <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 6 Aug 2025 09:35:38 +0500
X-Gm-Features: Ac12FXwBfBQD8yoFidSr60fw7LigvE8ZBweRU29uoAzLmmdybvheO1FdbNA_5DM
Message-ID: <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 5, 2025 at 10:19=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> >
> > diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> > index 9083bfdb773..8d14c8fc2cd 100644
> > --- a/arch/um/Kconfig
> > +++ b/arch/um/Kconfig
> > @@ -5,6 +5,7 @@ menu "UML-specific options"
> >  config UML
> >       bool
> >       default y
> > +     select ARCH_DEFER_KASAN
>
> select ARCH_DEFER_KASAN if STATIC_LINK

As pointed out in commit 5b301409e8bc("UML: add support for KASAN
under x86_64"),

: Also note that, while UML supports both KASAN in inline mode
(CONFIG_KASAN_INLINE)
: and static linking (CONFIG_STATIC_LINK), it does not support both at
the same time.

I've tested that for UML,
ARCH_DEFER_KASAN works if STATIC_LINK && KASAN_OUTLINE
ARCH_DEFER_KASAN works if KASAN_INLINE && !STATIC_LINK

ARCH_DEFER_KASAN if STATIC_LINK, and KASAN_INLINE=3Dy by default from defco=
nfig
crashes with SEGFAULT here (I didn't understand what it is, I think
the main() constructors
is not prepared in UML):

 =E2=96=BA 0       0x609d6f87 strlen+43
   1       0x60a20db0 _dl_new_object+48
   2       0x60a24627 _dl_non_dynamic_init+103
   3       0x60a25f9a __libc_init_first+42
   4       0x609eb6b2 __libc_start_main_impl+2434
   5       0x6004a025 _start+37

Since this is the case only for UML, AFAIU, I don't think we want to change
conditions in lib/Kconfig.kasan. Shall I leave UML Kconfig as it is? e.g.

select ARCH_DEFER_KASAN

>
> >       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> >       select ARCH_HAS_CACHE_LINE_SIZE
> >       select ARCH_HAS_CPU_FINALIZE_INIT
> > diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> > index f97bb1f7b85..81bcdc0f962 100644
> > --- a/arch/um/include/asm/kasan.h
> > +++ b/arch/um/include/asm/kasan.h
> > @@ -24,11 +24,6 @@
> >
> >  #ifdef CONFIG_KASAN
> >  void kasan_init(void);
> > -extern int kasan_um_is_ready;
> > -
> > -#ifdef CONFIG_STATIC_LINK
> > -#define kasan_arch_is_ready() (kasan_um_is_ready)
> > -#endif
> >  #else
> >  static inline void kasan_init(void) { }
> >  #endif /* CONFIG_KASAN */

