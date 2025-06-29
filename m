Return-Path: <linuxppc-dev+bounces-9863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CBAED036
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jun 2025 22:05:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVgJk5LG3z2yfx;
	Mon, 30 Jun 2025 06:05:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751227542;
	cv=none; b=Z9Duun2M+/WMcwf3DoOdP2upzHaVkCff3iwukIRkrntCgwg/B4CPejUDSi4icer6bj6a70c9AbSMMkXv9fu+a/WnWBVARDNh8UhlZ9ovKMppm26XGS5fuspL+ZFLAZNOq+/jehORZ3CgHwWY1RLsNWQDvS2MdELyKIB1V9IVspikyPYoGkneKrcm5CKZFHfjP/js7sdevxThzm6ZY5w+Q0cS5DCGxerswioj3Y1Vo3xxwyzCm8iyork0G5Mh1u756FTjHxvjLJ2NGvzDMMMfSfPLR2WPSbCDDA3rzwNwU7+GdThbQankbzKPp4wf3dkkpgKBXVxga5t37ftWPEQftg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751227542; c=relaxed/relaxed;
	bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdHyw3A3YsmdASes09oPb8Q/3f9fPTmYO4vnIiDIKAWbEjfvR/Z4d9GNDNIDEn85ZBvwyxUxObbTJ9t5zFwo9pRIIU3QjlM6ncwLCtcRsOy4cce8wwIjrdYg9jlGcwQj09w0Xp6FRPJ1Jz9yNv9zJRS6p1+dcVHYhnanksP6jBgktNhrImeEuggqGASAa8hDI+Nx+4UpbnwItF72h2905U5ILLA1IQhYogkfpWSCGELVdv4qjVG7FsUicFglMR4pUUpa4TQpfj8RwpUk30DGWZVSeEA6LOXQ5ZzGrHSvbNAOmQP2hSuXsz2tjIo+USLkS4c8r/JKwLYlF84uormVnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cbmxv5b8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cbmxv5b8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVgJh4qT9z2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:05:39 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1297293f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jun 2025 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751227534; x=1751832334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=cbmxv5b8F22Q+Ovk/Vgd5+4aEBMFV/mfty120ZrCJ3qxwrEXVHiv0Ka7RNrzsRg9S9
         RpVCZZlFgKatmEQ7DIgu9FqFVQI9nOyzTqbMDnQVlXC9gf8gEKI/o7ZxgTdU9PqeROkK
         dpFoE5RtNMaHAp8EC5lbBMF/7p/PF0Cx527JJ9cLfoqsd9OCK4QJUUXpWgA3U5BhoEaK
         YyTW9QYAK/lWsuRAaVULh0/OWmypc5Nj1WuS5x2LF4DxIjw/fMd9rwJpf6WsmRkUKuLi
         4SCyCuWoRS38pkwKbatXJiYSBUclag+w+z76LHChlxHoKY3z5cqJwxxbTHuRTEqE1tAu
         WhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751227534; x=1751832334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=u1OVR+VG3p47ywe25c1yareravsRn/4gYpNg7EeU9Ix+C8Kyv202UhKgSf1ypsoL6v
         +/V3/CsuTXIyO9ar4PmJihQWTRHWroC+qC6hwgeHgHDZJRA+uVU+vFbm5r+bwoz+XYTe
         d1cLy6qqhImvqFRJ+w5hoprSWIkoQbWayL1vX225Fp6BjqIRbQ4e/yFbIiBUJvlFY6YQ
         ouIS00UZwwS1oH16CsC3b+lMO7Niuf4tWJnjKaKRrUrwMq7v/dmpBnckaOjHrQDevnr6
         MROvOymD09qsdeDeOhk58FDtH9hgfAEAAQFkN0TY+ieS832KRJpj0yfPuUodhJ9eNy6S
         Z+2A==
X-Forwarded-Encrypted: i=1; AJvYcCUfX/ss2gEu9cylNd8XK9o+uvMu7pYM+2QdOCzFGrSmgmrZVvTV0uGEc/xsxx0BIUiwoUYkKrRInv4lwhk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxL1lI/mesY1pQZAB70QTMQHSFDKiHPKjrq1zU/94YDOvvqcuTw
	5mvT/DECK9a8l3fF8g2h0ElhUVKruAx0b7KRehg/0Rutrp3ZsfQd+mrlkkhLTTIetGF91a1Qxs3
	FSgKFlJoPriOoerSZptIuH6yFJoigwkA=
X-Gm-Gg: ASbGncvo5I9Y7GjBatuXTWbfFZIU+E0lTZl1/aX8ESKwUYWHRzDbpCF8eaNLQmFYAkv
	GNVSdkihnBnLFCADgrZQtbKYCgYvJpqwt+v81jnTeB7RbHqeRo1/yZJ4Hv3pFE8GgbY6zSlgh1g
	Ch1mixK/5NlUgiH+NFlO1oBYfVzXGnFTNQUgUf5SHEreJl0YMeWmYA5Ag=
X-Google-Smtp-Source: AGHT+IG9Jnr7utU7Trd4lqTg8GWi9uRNVbru2WXxMPFleBJfH4kInx+LP9kDmy2SL/eaM5dKaQqnO/o2Ok4MjECqA8k=
X-Received: by 2002:a5d:59c7:0:b0:3a4:fc3f:ed28 with SMTP id
 ffacd0b85a97d-3a8fee64fafmr10710844f8f.29.1751227533501; Sun, 29 Jun 2025
 13:05:33 -0700 (PDT)
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
References: <20250626153147.145312-1-snovitoll@gmail.com> <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
In-Reply-To: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 29 Jun 2025 22:05:22 +0200
X-Gm-Features: Ac12FXwSsH6fvJE1vEp59zDWu481tFenq-ukDXNa3gyvAGzFlMqgNHF8VfcuM6Y
Message-ID: <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 28, 2025 at 3:25=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 3:57=E2=80=AFPM Andrey Konovalov <andreyknvl@gmai=
l.com> wrote:
> >
> > On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
> > <snovitoll@gmail.com> wrote:
> > >
> > > This patch series unifies the kasan_arch_is_ready() and kasan_enabled=
()
> > > interfaces by extending the existing kasan_enabled() infrastructure t=
o
> > > work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
> > >
> > > Currently, kasan_enabled() only works for HW_TAGS mode using a static=
 key,
> > > while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-tim=
e
> > > constant) or rely on architecture-specific kasan_arch_is_ready()
> > > implementations with custom static keys and global variables.
> > >
> > > This leads to:
> > > - Code duplication across architectures
> > > - Inconsistent runtime behavior between KASAN modes
> > > - Architecture-specific readiness tracking
> > >
> > > After this series:
> > > - All KASAN modes use the same kasan_flag_enabled static key
> > > - Consistent runtime enable/disable behavior across modes
> > > - Simplified architecture code with unified kasan_init_generic() call=
s
> > > - Elimination of arch specific kasan_arch_is_ready() implementations
> > > - Unified vmalloc integration using kasan_enabled() checks
> > >
> > > This addresses the bugzilla issue [1] about making
> > > kasan_flag_enabled and kasan_enabled() work for Generic mode,
> > > and extends it to provide true unification across all modes.
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> >
> > Hi Sabyrzhan,
> >
> > Thank you for working on this!
> >
> > One aspect that is missing from the patches is moving the
> > kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
> > not explicitly mentioned in the issue, but this is what the "adding
> > __wrappers" part is about).
> >
> > Another thing that needs careful consideration is whether it's
> > possible to combine kasan_arch_is_ready() and kasan_enabled() into the
> > same check logically at all. There's one issue mentioned in [1]:
>
> Hello,
> I've removed kasan_arch_is_ready() at all in this series:
> [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
>
> Is it not what's expected by unification?

I guess the issue description diverged a bit from what needs to be
done, sorry about that.

The core 2 things I wanted to address with the unification are:

1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
implementation and move these checks into include/linux/kasan.h (and
add __wrappers when required).

2. Avoid architectures redefining the same kasan_enabled global
variable/static key.

Initially, I thought that s/kasan_arch_is_ready/kasan_enabled + simply
moving the calls into affected include/linux/kasan.h functions would
be enough. But then, based on [1], turns out it's not that simple.

So now, I think we likely still need two separate checks/flags:
kasan_enabled() that controls whether KASAN is enabled at all and
kasan_arch_is_ready() that gets turned on by kasan_init() when shadow
is initialized (should we rename it to kasan_shadow_initialized()?).
But then we can still move kasan_arch_is_ready() into
include/linux/kasan.h and use the proper combination of checks for
each affected function before calling __wrappers. And we can still
remove the duplicated flags/keys code from the arch code.

[1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0EA=
8RAtyr-KgkHdg@mail.gmail.com/

