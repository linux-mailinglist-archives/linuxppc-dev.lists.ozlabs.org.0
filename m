Return-Path: <linuxppc-dev+bounces-10361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D4B0E363
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 20:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmlw21gfSz2yhb;
	Wed, 23 Jul 2025 04:21:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753208498;
	cv=none; b=ckVtc3zo8gWympGeRqkVCt3MpZQhAgBr12rGo5X26X8H9KnhUB3Idw7kxOoD8ECfzRY/ajPNxHNO0xtzCi0/96PU/ol/42gfREF0mrjB5sCLDIW0PQdkGOb2B5hBvkUu8PaVa2l6BGvfCEbqkIWqm0K55FRChd9rVgKmetuHWoXzvHvKE0UXlNWQUw7sRFJEFjCw6pSafBocyOlAPQ4+I2VH2bGp0en4BDYGgIWtnBKrbgAfcC/yii6opuqLWAZRFj+1tsykM6FnIkA6VVkIfSTwz2xwH63FB5leXW6uvkOf4RZMcT4WaTbmrc0Nci2s5pJGHiCXGgT1EChKkKSnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753208498; c=relaxed/relaxed;
	bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LI4lMV7V/TncVF+3Eng6EO8s7tvwIQnB/PB6O7KGMBh6/Xoxf4+gwBveTGR+zI9KJITLA6smic47rn0rv5w1O5JKR4wRbd4HCi9NWeh+C/vnHC7kmt57r6CFKRxy94bEFyh4eTcwlxoFvoYO9ekYx/EGGiLrieUXz423ZqFHH/VSLFf8KQbRJM4wqznD0RMW/9PiOz6Ia5MvUKfWC1lFOGzeLACBlMrAfxL6I5da9CYifg8apPUeYP0Xj607AfiXwMpbHLEdavUCPuVurkeUTmcOw6jaKfj5KWhZIFcrqmPr0AHOntnoGE/+Xe18gIhEajsaoOxyJj9hb5z8v1Nz5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkXaSPc6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkXaSPc6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmlw02fVpz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 04:21:35 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553e5df44f8so5268784e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753208491; x=1753813291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=PkXaSPc64nE5w5doP8LvDYfDlEvyqduGkp+LCjhFFH2zAFGDsaOjCRgHXWELFouFJg
         7j2tAefjNYk06rnPvh/SieZsRaIPbYlIaRVXsZ9CITAftdJzDLkDiI8UD331JUWPtEJA
         m87r/sMS4Vu+3vecZt5hVDrK0nlp5vbKzRlbLhWaJ2HVnp6jjbJaPQs2s8VorF3LZVLr
         q2UzMnwIgRGr1mMJ1/3tqG8DA89RtntpLG0IT/4hl5x/Fpd3E0kdmwaUDAbbDlD8XHUw
         NIAmp+JviwLFMuSM7kyaBlMNS12IwX/NGw0Uu1mWjWZ859xwQhrXzN7D6uAS1vKz3d8W
         Te/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208491; x=1753813291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=PpvYBV+aeQMMr7m9C1DTNgJgAjjsQ7VStDW/HSEyrB1h7KqCU5f973/GPSVGLgaXXS
         uWDx/nxJJNXP83e5sqczdTw+oUr0U+kEqIpYZMTdASS9/aKjEXDnFKlzLXfAywDKgtcS
         TZgsV1djs4swMeqGRrvK3/hKrPRSciKuzkDNlbUMEu/de1lLetaXwn5SF/lf09YgfFLD
         AuQEGuU4t8wzZbbpPXz2t2ol4kzEFPH9AtyR/HMngXu+f+EMxDmBcCdOKdlKoD5y4SwS
         nFlkQ3b15hKsxnCm2NgSYc7xBmHx9tDZjc/PshmyIyG7HWpb2HKeB83wEdfu15uH/cPu
         vQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUasgc9QmwDpNB0nhJl6dJU9BSH2duA1siNv9I1aPAjP8itQ4vBjYMqH2BJbL3LVQRes6cOYlVUwfI/BvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywcb76pC5zzVSN/1rTOc5NuhRKlLj6kZmVrAfUJRodlY9bRjmi2
	jCIw28ZtdmOmobveRDFr+MOmyHumZcUrMEERRMY9eUB+mgYGijypH8FKOW7p0zwTXaQp0R2FBqT
	EPG+htm3gr+zXdZmQjoqr30BLO5u7yYQ=
X-Gm-Gg: ASbGncvpmzwZIcJKE8S+kMMyPcwKwvQg1zjGhyX7nJFbUtkW3eZkFc+yifk9vGB6jWN
	LmRQvjT5etNv/dsCf6DZGWabvISi1t7mqHtc4igXHboLGINnOJAyu7nQFk6m0toovKXyvU9WPQ6
	GMUecT/gtT0A1FXJMTk2yQO5k21KwQ+EZTXmTle0DrD8cZ73vN4eq7fACcYbYTeemNKm47TsOfv
	1DWC7Q=
X-Google-Smtp-Source: AGHT+IHgqZRO4CHZDXwO8i4qviF6GOSHLcIqgaK9MAu32BIYgiKkWD327bPslpy0X0mdn5DHRJd+TcwlCu2XTW4y0IA=
X-Received: by 2002:a05:6512:4021:b0:553:2190:fef8 with SMTP id
 2adb3069b0e04-55a513998a5mr31899e87.7.1753208490745; Tue, 22 Jul 2025
 11:21:30 -0700 (PDT)
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
References: <20250717142732.292822-1-snovitoll@gmail.com> <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
In-Reply-To: <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 23:21:13 +0500
X-Gm-Features: Ac12FXzOVMCIvnTEhZltt3TS4XKarYeDIkGkWcMAqG0GgJ62pPTw9Xni6fYiOgs
Message-ID: <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
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

On Tue, Jul 22, 2025 at 3:59=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>
> > =3D=3D=3D Testing with patches
> >
> > Testing in v3:
> >
> > - Compiled every affected arch with no errors:
> >
> > $ make CC=3Dclang LD=3Dld.lld AR=3Dllvm-ar NM=3Dllvm-nm STRIP=3Dllvm-st=
rip \
> >       OBJCOPY=3Dllvm-objcopy OBJDUMP=3Dllvm-objdump READELF=3Dllvm-read=
elf \
> >       HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTAR=3Dllvm-ar HOSTLD=3Dld.lld=
 \
> >       ARCH=3D$ARCH
> >
> > $ clang --version
> > ClangBuiltLinux clang version 19.1.4
> > Target: x86_64-unknown-linux-gnu
> > Thread model: posix
> >
> > - make ARCH=3Dum produces the warning during compiling:
> >       MODPOST Module.symvers
> >       WARNING: modpost: vmlinux: section mismatch in reference: \
> >               kasan_init+0x43 (section: .ltext) -> \
> >               kasan_init_generic (section: .init.text)
> >
> > AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
> > is placed in own section ".kasan_init", which calls kasan_init_generic(=
)
> > which is marked with "__init".
> >
> > - Booting via qemu-system- and running KUnit tests:
> >
> > * arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results=
.
> > * x86_64 (GENERIC): no regression, no errors
> >
>
> It would be interesting to see whether ARCH_DEFER_KASAN=3Dy arches work.
> These series add static key into __asan_load*()/_store*() which are calle=
d
> from everywhere, including the code patching static branches during the s=
witch.
>
> I have suspicion that the code patching static branches during static key=
 switch
> might not be prepared to the fact the current CPU might try to execute th=
is static
> branch in the middle of switch.

AFAIU, you're referring to this function in mm/kasan/generic.c:

static __always_inline bool check_region_inline(const void *addr,

      size_t size, bool write,

      unsigned long ret_ip)
{
        if (!kasan_shadow_initialized())
                return true;
...
}

and particularly, to architectures that selects ARCH_DEFER_KASAN=3Dy, which=
 are
loongarch, powerpc, um. So when these arch try to enable the static key:

1. static_branch_enable(&kasan_flag_enabled) called
2. Kernel patches code - changes jump instructions
3. Code patching involves memory writes
4. Memory writes can trigger any KASAN wrapper function
5. Wrapper calls kasan_shadow_initialized()
6. kasan_shadow_initialized() calls static_branch_likely(&kasan_flag_enable=
d)
7. This reads the static key being patched --- this is the potential issue?

The current runtime check is following in tis v3 patch series:

#ifdef CONFIG_ARCH_DEFER_KASAN
...
static __always_inline bool kasan_shadow_initialized(void)
{
        return static_branch_likely(&kasan_flag_enabled);
}
...
#endif

I wonder, if I should add some protection only for KASAN_GENERIC,
where check_region_inline() is called (or for all KASAN modes?):

#ifdef CONFIG_ARCH_DEFER_KASAN
...
static __always_inline bool kasan_shadow_initialized(void)
{
        /* Avoid recursion (?) during static key patching */
        if (static_key_count(&kasan_flag_enabled.key) < 0)
                return false;
        return static_branch_likely(&kasan_flag_enabled);
}
...
#endif

Please suggest where the issue is and if I understood the problem.
I might try to run QEMU on powerpc with KUnits to see if I see any logs.

