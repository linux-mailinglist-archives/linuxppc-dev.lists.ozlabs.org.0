Return-Path: <linuxppc-dev+bounces-9860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65AAEC762
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jun 2025 15:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTtTj745Sz30DL;
	Sat, 28 Jun 2025 23:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751117145;
	cv=none; b=Btsn4a7y0GPpPym6QI69qaZGa+zlG3ptKQdoLZbIG0SsFvSnUrKrPwxqYrplixaYd0+1hiZKRPMD1T/t3wezhxD3Od1DfxKCwz/N//s0h0qakBcPNNHocUXnHnedbv2u6q3WJMlZl39MXdWpvKHTshFevSWXOTYDsdpHx7vvwnw/69WDKGOGSTYxQWrOZ+pAmtcf07iJzU4AZbtIbxF0rcMiRSojv60tmO9O9wCMZjL1e4rGmM1VAKWSwtJ5rKbK7aKNRb8WoHnEwS8FcRfSyKL1aZMESPkbYtXRQGNRjIYpNxaKexCu8aYypKbY8vDFHgPagcBdfp6XTOV3YW+IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751117145; c=relaxed/relaxed;
	bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Czo8MqtdkJeR0Rs9TrkX1aPl/JW98DiSNISgnK615GDjdOiWEJIO2X6kqb2kwteT+i1rc6GCj4W2mK3XW5p9062El5XgqfSz8lnv1d9gmnV6Iuf/ueg7CcGLZiNwQpj7Y6jQYRF00OslgRo92Q/JSmbI8ExOoFFss2Aty8znmxzdCp+YaB8fLS+z2TecnhpjcyhZQH3mflaE9HhrxvHz0Hy1Dsfp0O8PH+Wt8zZoNq9DeqUqBLyxu0AqPenZ35J56Q6pnVMYvUXHgqrDs+83chs7SRu2+B2jFjEUNAkTil9zbFphChaBV4S6Hff1RH0V9uC319sYJN8kxWbJigzwVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EwS/gb+y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EwS/gb+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTtTg5JC4z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 23:25:42 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3474216e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751117135; x=1751721935; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=EwS/gb+yS/bLssHclwDuA2c4O9Ow0wrJy6PcYoCuJkG2NLVAVgGlHqb3Cbc6gjsEk/
         cwm0LOzOAk7dOHd1ucOgR37vY6A424uDZDvg5HXZ1cOw3TZcmuQXSeGgeJLclLF0pjc6
         aJDm9c+QF9Dd6MExRNje5EMNz9mm1f6xa8FwiBSekrsuEQgEZasYd8aqC1lkngFl/GIt
         NHy51J4eMfQpgKZYhj5qeqA8Py35YZiT+iAgBDYuG1QlQFQksstEQrdSEZVYEv+Vks67
         t9fasIOTIdcDufYwR+I+yhuqq4+NhYy+AgRStREWfbEdNfE1vCffFsuRZQX50xP4rwCH
         eJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751117135; x=1751721935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=MMpAhbt9ToE/FTlO9DlbwtyOEwK6eldDnEuvbcD2he8IF2DAtd2ZuLY1H2gZRqXqZA
         eFsgVRWBmFaTNZNUmEXAswp4t+IAHMDOMXFmQTLxESX/QcbG7p8jioaLtHnvfkXPZO0r
         oPq8VlyDtqBkJWoEIcr4zDWH8SR9TWozUzmHFyqDpSEQaWgh1VFMtTw0hJoDCxpmlA1G
         aTvgauxSfTA2UoHGajjUoiGG6ccazxSy4OFOPtWOZFwitueSRLwP72O4Zu30ECPTurPy
         XZ1DU7LwStBJblLyGypXAf2QIluACFJVgwIL2uRqfSYJrAyHXy4A0aanJUORA56VwUh+
         vGrA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ENxg44kw0CNt9HiI1X8QIs1E+eIDtpjD8rI3TKiX6rNOV+MPhWOOAPwbEqT07xsp9I39h3PloL7rIq4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUvvWNQD+jyQ1prQEDXpq50vYMW01kzYAKSVjce9LfNpja45G2
	YA+QKXZvFXRMWxZSBxMtv4TPTBNrUP227SkP9Ur/EgPqAEL7lYcaYdQK+uhM+B3384B00vJKztb
	P8sGPEK9udoKAY8ZUh3JgtqbkT+u5Rqk=
X-Gm-Gg: ASbGncsLFhbf+waAoLXTKaf8Bo+/Rb3UMT6JEN1PzKr3YJ8cXu0ubSBQ+FhaH/CRMFg
	Ds5oI/po7/3f2VLOuEfHPGkJTlXfRrQat7D9XI4PNW2erQZXpvT9Dr72Kr2/EcOLN1bdY+Bcghy
	afm0snCsefSfuT7eZamRrFkV7yTHRwuU2fl5ewpo4rGM1ILnQ=
X-Google-Smtp-Source: AGHT+IGcgqdYgD7HxbDyPqcYV3Heu4fL1zBBGlE2pOeLSvkf48pz8fpRePfbVo/DnCDwvNyc5box4+f/veOvw14SJEw=
X-Received: by 2002:a05:6512:401e:b0:553:d1b0:1f1f with SMTP id
 2adb3069b0e04-5550b817bf9mr2031982e87.21.1751117135042; Sat, 28 Jun 2025
 06:25:35 -0700 (PDT)
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
In-Reply-To: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 28 Jun 2025 18:25:17 +0500
X-Gm-Features: Ac12FXz_1yZEfUGAygYOxkSS_g1GpWf3Y2t1PdPyYRlgb0h3dTvUyL8mVDVK8Qk
Message-ID: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Andrey Konovalov <andreyknvl@gmail.com>
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

On Sat, Jun 28, 2025 at 3:57=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
> <snovitoll@gmail.com> wrote:
> >
> > This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
> > interfaces by extending the existing kasan_enabled() infrastructure to
> > work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
> >
> > Currently, kasan_enabled() only works for HW_TAGS mode using a static k=
ey,
> > while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
> > constant) or rely on architecture-specific kasan_arch_is_ready()
> > implementations with custom static keys and global variables.
> >
> > This leads to:
> > - Code duplication across architectures
> > - Inconsistent runtime behavior between KASAN modes
> > - Architecture-specific readiness tracking
> >
> > After this series:
> > - All KASAN modes use the same kasan_flag_enabled static key
> > - Consistent runtime enable/disable behavior across modes
> > - Simplified architecture code with unified kasan_init_generic() calls
> > - Elimination of arch specific kasan_arch_is_ready() implementations
> > - Unified vmalloc integration using kasan_enabled() checks
> >
> > This addresses the bugzilla issue [1] about making
> > kasan_flag_enabled and kasan_enabled() work for Generic mode,
> > and extends it to provide true unification across all modes.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
>
> Hi Sabyrzhan,
>
> Thank you for working on this!
>
> One aspect that is missing from the patches is moving the
> kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
> not explicitly mentioned in the issue, but this is what the "adding
> __wrappers" part is about).
>
> Another thing that needs careful consideration is whether it's
> possible to combine kasan_arch_is_ready() and kasan_enabled() into the
> same check logically at all. There's one issue mentioned in [1]:

Hello,
I've removed kasan_arch_is_ready() at all in this series:
[PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled

Is it not what's expected by unification?

>
> > In kasan_cache_create() we unconditionally allocate a metadata buffer,
> > but the kasan_init_slab_obj() call to initialise it is guarded by
> > kasan_enabled(). But later parts of the code only check the presence of
> > the buffer before using it, so bad things happen if kasan_enabled()
> > later turns on (I was getting some error about invalid lock state).
>
> And there might be other callbacks that should be executed even before
> kasan_init_...() completes. But then for the HW_TAGS mode, if
> kasan_enabled() is off, then we don't want to execute any callbacks.
>
> So maybe we do actually need a separate static key for
> kasan_arch_is_ready(). But even if so, it still makes sense to move
> kasan_arch_is_ready() into the __wrappers for the affected callbacks.
>
> Thanks!
>
> [1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0=
EA8RAtyr-KgkHdg@mail.gmail.com/

