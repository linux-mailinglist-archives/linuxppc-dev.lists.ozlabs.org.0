Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E156D13C709
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 16:11:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yW566fYgzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:11:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=dvyukov@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qNEZxBFu; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVmv5JV8zDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:57:51 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id o18so7473205qvf.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NmZV6ZNor/aMnsybdf9Y2H14ROOnyA+MZIhvgXeb7nw=;
 b=qNEZxBFuHgepbe5MkJcZ7SkeuRPDFbFExzWM7bIuACkIF5m5dMo/797c91mMptly0B
 H1NngPZ41XCxD8QWCrw30X/lbuDzQBMZORa9RsrpkNUxmhxF8mVOJM3Iu48ojLFwy2oj
 rgj/YU8/6+O/sa1Rin0saBAlu/uDpYTFqOUMijbptMGw8Chuj8Y4qqqvqogM4Y/Nzqxw
 kP9GsVEvGI49TJu2rxXKSwnO247ImhbDgM2Ock70tZcMK9SK0cYHNUyOphF5uw3GGTGm
 Q9xaW5zpK3ns4vUceei3zbtYEdwPxPrMOzbi715D13qacQeEfHfpauCiP6+nDd9CGVVi
 pIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NmZV6ZNor/aMnsybdf9Y2H14ROOnyA+MZIhvgXeb7nw=;
 b=Y+OF2FeERWdJ9V9nWHzo85EyXldWde/2EQId3oXJbOFM/SOTPHGIBRl/tp8FmFZr5n
 s16qSpOMTdoDXStM1HpVfvQ+s+mPNq+eTETD8QVxkyYi2xcf6Q3XKfMdPK1AgNJ9ISZM
 uaX5l+nd1yoyWjWtzvjnjNSqaGUOrrwWaypfA+Z2mqk9UBrwKV6lshXaw+6xygGL10U+
 XTBcwBroBtcl/PXLQzg1goUFyTeSsJxMidXoJ4e5j/Utpz18XzIDxBxsG2an+ZPGc79M
 ZWHHasYlsEeQiUNDC6utAUbMDq1y5EgeUYEoH0inhiAX9wwxAZZ85uYY5FydbVMpRRy0
 22fA==
X-Gm-Message-State: APjAAAXJNJyYONf+tUhg2JzzqQt397SnHTq1pbJqIkq+YwS7HHDdBgyS
 cRjj9PI47pGTQVzMNK0RSpxBNEx4aMrlMZ/iLD/oeA==
X-Google-Smtp-Source: APXvYqyKKbAOAcnL7Ua+91DRPLDRYsfrRxk/SORt5Ys3Ow6z9DMzw2d9BbANbyIsA0so+DK528HCnAlI3w20Lsm0ysg=
X-Received: by 2002:ad4:4810:: with SMTP id g16mr25308035qvy.22.1579100267932; 
 Wed, 15 Jan 2020 06:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20200115063710.15796-1-dja@axtens.net>
 <20200115063710.15796-2-dja@axtens.net>
 <CACT4Y+bAuaeHOcTHqp-=ckOb58fRajpGYk4khNzpS7_OyBDQYQ@mail.gmail.com>
 <917cc571-a25c-3d3e-547c-c537149834d6@c-s.fr>
In-Reply-To: <917cc571-a25c-3d3e-547c-c537149834d6@c-s.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 15 Jan 2020 15:57:36 +0100
Message-ID: <CACT4Y+Y-qPLzn2sur5QnS2h4=Qb2B_5rFxwMKuzhe-hwsReGqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: stop tests being eliminated as dead code with
 FORTIFY_SOURCE
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 15, 2020 at 3:47 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Le 15/01/2020 =C3=A0 15:43, Dmitry Vyukov a =C3=A9crit :
> > On Wed, Jan 15, 2020 at 7:37 AM Daniel Axtens <dja@axtens.net> wrote:
> >>
> >> 3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE=
:
> >> memchr, memcmp and strlen.
> >>
> >> When FORTIFY_SOURCE is on, a number of functions are replaced with
> >> fortified versions, which attempt to check the sizes of the operands.
> >> However, these functions often directly invoke __builtin_foo() once th=
ey
> >> have performed the fortify check. The compiler can detect that the res=
ults
> >> of these functions are not used, and knows that they have no other sid=
e
> >> effects, and so can eliminate them as dead code.
> >>
> >> Why are only memchr, memcmp and strlen affected?
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Of string and string-like functions, kasan_test tests:
> >>
> >>   * strchr  ->  not affected, no fortified version
> >>   * strrchr ->  likewise
> >>   * strcmp  ->  likewise
> >>   * strncmp ->  likewise
> >>
> >>   * strnlen ->  not affected, the fortify source implementation calls =
the
> >>                 underlying strnlen implementation which is instrumente=
d, not
> >>                 a builtin
> >>
> >>   * strlen  ->  affected, the fortify souce implementation calls a __b=
uiltin
> >>                 version which the compiler can determine is dead.
> >>
> >>   * memchr  ->  likewise
> >>   * memcmp  ->  likewise
> >>
> >>   * memset ->   not affected, the compiler knows that memset writes to=
 its
> >>                 first argument and therefore is not dead.
> >>
> >> Why does this not affect the functions normally?
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> In string.h, these functions are not marked as __pure, so the compiler
> >> cannot know that they do not have side effects. If relevant functions =
are
> >> marked as __pure in string.h, we see the following warnings and the
> >> functions are elided:
> >>
> >> lib/test_kasan.c: In function =E2=80=98kasan_memchr=E2=80=99:
> >> lib/test_kasan.c:606:2: warning: statement with no effect [-Wunused-va=
lue]
> >>    memchr(ptr, '1', size + 1);
> >>    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/test_kasan.c: In function =E2=80=98kasan_memcmp=E2=80=99:
> >> lib/test_kasan.c:622:2: warning: statement with no effect [-Wunused-va=
lue]
> >>    memcmp(ptr, arr, size+1);
> >>    ^~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/test_kasan.c: In function =E2=80=98kasan_strings=E2=80=99:
> >> lib/test_kasan.c:645:2: warning: statement with no effect [-Wunused-va=
lue]
> >>    strchr(ptr, '1');
> >>    ^~~~~~~~~~~~~~~~
> >> ...
> >>
> >> This annotation would make sense to add and could be added at any poin=
t, so
> >> the behaviour of test_kasan.c should change.
> >>
> >> The fix
> >> =3D=3D=3D=3D=3D=3D=3D
> >>
> >> Make all the functions that are pure write their results to a global,
> >> which makes them live. The strlen and memchr tests now pass.
> >>
> >> The memcmp test still fails to trigger, which is addressed in the next
> >> patch.
> >>
> >> Cc: Daniel Micay <danielmicay@gmail.com>
> >> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> >> Cc: Alexander Potapenko <glider@google.com>
> >> Cc: Dmitry Vyukov <dvyukov@google.com>
> >> Fixes: 0c96350a2d2f ("lib/test_kasan.c: add tests for several string/m=
emory API functions")
> >> Signed-off-by: Daniel Axtens <dja@axtens.net>
> >> ---
> >>   lib/test_kasan.c | 30 +++++++++++++++++++-----------
> >>   1 file changed, 19 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> >> index 328d33beae36..58a8cef0d7a2 100644
> >> --- a/lib/test_kasan.c
> >> +++ b/lib/test_kasan.c
> >> @@ -23,6 +23,14 @@
> >>
> >>   #include <asm/page.h>
> >>
> >> +/*
> >> + * We assign some test results to these globals to make sure the test=
s
> >> + * are not eliminated as dead code.
> >> + */
> >> +
> >> +int int_result;
> >> +void *ptr_result;
> >
> > These are globals, but are not static and don't have kasan_ prefix.
> > But I guess this does not matter for modules?
> > Otherwise:
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >
>
> I think if you make them static, GCC will see they aren't used and will
> eliminate everything still ?

static volatile? :)
