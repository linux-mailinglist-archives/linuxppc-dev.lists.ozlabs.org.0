Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 807ED13C664
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 15:45:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVVy3yVHzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=dvyukov@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HAmEbppX; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVST2Ht9zDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:43:28 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id t129so15805238qke.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 06:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dsov92auA7/G12RJ9hsAhzPgLmMj5NcPBeP6nNJDSO0=;
 b=HAmEbppXjeEjGFlyjzVhaLxJPK6Qu2TL7zFYWoJ+6xa7AMU7f8xGwf2Pzg99BRj++8
 RvmJHwFmUUh4S5athIHqzOwqDZLEUhNxjEiQK9XVd4nrV+B01TTnZczJQE2bcpTekpw2
 n6L4wFGMG6zO9x9aZT8ci6v9mM1zpqges4LhDd2kBEXpAdu0q+goONUh4uissEOW2n+j
 lQV7502daTXdwVDVOYsLIP6os+IibkP+OYMirLgI8gSuMWPKe5QQEzEWvHUksVAROFZT
 1LXCscvvcXbfvLyI4Nyo67cA34Y4T379odeXBQ7uz+eoJnT6eXfPRTE9U0o/5NY+5b3d
 EYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dsov92auA7/G12RJ9hsAhzPgLmMj5NcPBeP6nNJDSO0=;
 b=FxZCATPn25e3V2OGRuH/eJ2gLeAy+AX5MBwqiJehAeEfmlJACNXYB8Q7vVxLUfcCty
 FDX2JcLJtZ07rzXmSnw6X1y4aKJTa+f+Qn3xmewaoafDeRPgX0eYzCl9rZT4+mc7tRgZ
 cO5bsZKpFLyhGWB85kSuk9PvQ2y9BshkZaqfAC3xHvMkEzBscLehZDrGO3gOjJEE/par
 Rx0lFjLdaY0kleFrl92DtbaEVpYZM5G43KILyk2JY6TKbxBEyVHuIgkEbdlOZKAjp3ru
 D5Gs6cBKTkD1Fs2HY0Aa7xNK7NJMP/gMxEcJqWEANZN6trXvW/wMzUiELUsxBT5ssBOT
 pH/A==
X-Gm-Message-State: APjAAAUOhBmEQPCi2NlhthKKgVf7mQcqv8zJqQn6F3rXsjXuScmK7bhw
 UG+sHEbyspEZAdcEVn7jPRuAVDIHehoVb5rFQ6x6Fw==
X-Google-Smtp-Source: APXvYqyUwMjABHutPLZrK97jNVFWLT7TfwkGKBtOm4Z15o33FBoKxwGilBQv+LujNRvkTq3H/64pu/pRwGwVkNNWReE=
X-Received: by 2002:a05:620a:1136:: with SMTP id
 p22mr28110133qkk.8.1579099404892; 
 Wed, 15 Jan 2020 06:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20200115063710.15796-1-dja@axtens.net>
 <20200115063710.15796-2-dja@axtens.net>
In-Reply-To: <20200115063710.15796-2-dja@axtens.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 15 Jan 2020 15:43:12 +0100
Message-ID: <CACT4Y+bAuaeHOcTHqp-=ckOb58fRajpGYk4khNzpS7_OyBDQYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: stop tests being eliminated as dead code with
 FORTIFY_SOURCE
To: Daniel Axtens <dja@axtens.net>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 15, 2020 at 7:37 AM Daniel Axtens <dja@axtens.net> wrote:
>
> 3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE:
> memchr, memcmp and strlen.
>
> When FORTIFY_SOURCE is on, a number of functions are replaced with
> fortified versions, which attempt to check the sizes of the operands.
> However, these functions often directly invoke __builtin_foo() once they
> have performed the fortify check. The compiler can detect that the result=
s
> of these functions are not used, and knows that they have no other side
> effects, and so can eliminate them as dead code.
>
> Why are only memchr, memcmp and strlen affected?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Of string and string-like functions, kasan_test tests:
>
>  * strchr  ->  not affected, no fortified version
>  * strrchr ->  likewise
>  * strcmp  ->  likewise
>  * strncmp ->  likewise
>
>  * strnlen ->  not affected, the fortify source implementation calls the
>                underlying strnlen implementation which is instrumented, n=
ot
>                a builtin
>
>  * strlen  ->  affected, the fortify souce implementation calls a __built=
in
>                version which the compiler can determine is dead.
>
>  * memchr  ->  likewise
>  * memcmp  ->  likewise
>
>  * memset ->   not affected, the compiler knows that memset writes to its
>                first argument and therefore is not dead.
>
> Why does this not affect the functions normally?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> In string.h, these functions are not marked as __pure, so the compiler
> cannot know that they do not have side effects. If relevant functions are
> marked as __pure in string.h, we see the following warnings and the
> functions are elided:
>
> lib/test_kasan.c: In function =E2=80=98kasan_memchr=E2=80=99:
> lib/test_kasan.c:606:2: warning: statement with no effect [-Wunused-value=
]
>   memchr(ptr, '1', size + 1);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> lib/test_kasan.c: In function =E2=80=98kasan_memcmp=E2=80=99:
> lib/test_kasan.c:622:2: warning: statement with no effect [-Wunused-value=
]
>   memcmp(ptr, arr, size+1);
>   ^~~~~~~~~~~~~~~~~~~~~~~~
> lib/test_kasan.c: In function =E2=80=98kasan_strings=E2=80=99:
> lib/test_kasan.c:645:2: warning: statement with no effect [-Wunused-value=
]
>   strchr(ptr, '1');
>   ^~~~~~~~~~~~~~~~
> ...
>
> This annotation would make sense to add and could be added at any point, =
so
> the behaviour of test_kasan.c should change.
>
> The fix
> =3D=3D=3D=3D=3D=3D=3D
>
> Make all the functions that are pure write their results to a global,
> which makes them live. The strlen and memchr tests now pass.
>
> The memcmp test still fails to trigger, which is addressed in the next
> patch.
>
> Cc: Daniel Micay <danielmicay@gmail.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Fixes: 0c96350a2d2f ("lib/test_kasan.c: add tests for several string/memo=
ry API functions")
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  lib/test_kasan.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index 328d33beae36..58a8cef0d7a2 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -23,6 +23,14 @@
>
>  #include <asm/page.h>
>
> +/*
> + * We assign some test results to these globals to make sure the tests
> + * are not eliminated as dead code.
> + */
> +
> +int int_result;
> +void *ptr_result;

These are globals, but are not static and don't have kasan_ prefix.
But I guess this does not matter for modules?
Otherwise:

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> +
>  /*
>   * Note: test functions are marked noinline so that their names appear i=
n
>   * reports.
> @@ -603,7 +611,7 @@ static noinline void __init kasan_memchr(void)
>         if (!ptr)
>                 return;
>
> -       memchr(ptr, '1', size + 1);
> +       ptr_result =3D memchr(ptr, '1', size + 1);
>         kfree(ptr);
>  }
>
> @@ -618,8 +626,7 @@ static noinline void __init kasan_memcmp(void)
>         if (!ptr)
>                 return;
>
> -       memset(arr, 0, sizeof(arr));
> -       memcmp(ptr, arr, size+1);
> +       int_result =3D memcmp(ptr, arr, size + 1);
>         kfree(ptr);
>  }
>
> @@ -642,22 +649,22 @@ static noinline void __init kasan_strings(void)
>          * will likely point to zeroed byte.
>          */
>         ptr +=3D 16;
> -       strchr(ptr, '1');
> +       ptr_result =3D strchr(ptr, '1');
>
>         pr_info("use-after-free in strrchr\n");
> -       strrchr(ptr, '1');
> +       ptr_result =3D strrchr(ptr, '1');
>
>         pr_info("use-after-free in strcmp\n");
> -       strcmp(ptr, "2");
> +       int_result =3D strcmp(ptr, "2");
>
>         pr_info("use-after-free in strncmp\n");
> -       strncmp(ptr, "2", 1);
> +       int_result =3D strncmp(ptr, "2", 1);
>
>         pr_info("use-after-free in strlen\n");
> -       strlen(ptr);
> +       int_result =3D strlen(ptr);
>
>         pr_info("use-after-free in strnlen\n");
> -       strnlen(ptr, 1);
> +       int_result =3D strnlen(ptr, 1);
>  }
>
>  static noinline void __init kasan_bitops(void)
> @@ -724,11 +731,12 @@ static noinline void __init kasan_bitops(void)
>         __test_and_change_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
>
>         pr_info("out-of-bounds in test_bit\n");
> -       (void)test_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
> +       int_result =3D test_bit(BITS_PER_LONG + BITS_PER_BYTE, bits);
>
>  #if defined(clear_bit_unlock_is_negative_byte)
>         pr_info("out-of-bounds in clear_bit_unlock_is_negative_byte\n");
> -       clear_bit_unlock_is_negative_byte(BITS_PER_LONG + BITS_PER_BYTE, =
bits);
> +       int_result =3D clear_bit_unlock_is_negative_byte(BITS_PER_LONG +
> +               BITS_PER_BYTE, bits);
>  #endif
>         kfree(bits);
>  }
> --
> 2.20.1
>
