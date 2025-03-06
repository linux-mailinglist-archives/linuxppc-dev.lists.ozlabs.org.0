Return-Path: <linuxppc-dev+bounces-6768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB8A55310
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 18:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7xHZ0Kggz3bwL;
	Fri,  7 Mar 2025 04:29:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741282169;
	cv=none; b=Zavh9QGtwzbJ95G1wUK0n7wBeAsjKqX3w4rKjKpQwGv/8me5ZajtAOjCrHpwrlS4WGRn6hWK76s99rKWnOP5boDodC7z0KrBFiuCJrzUc96RO698K9lone/UzmarO26UlALnY03YsnV1eTzYXDYHxIdhJ0QRXEAXifDeLyWS19+alugoNZtX9kq92TnNIEbhvbKWNBHxHNk6DQVh7aQaeFYiiU6UZu1c0/Kuoat2yrsVhJ8+1kBhep/1sPzoaqpkyEIg43bXbbTNUUeMLO6t/+s2pa+788LDBNw53CNXwOfhnNRrLG8uL0MDLYWAaUBUdTNzvH4wmBibzt3I/PI+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741282169; c=relaxed/relaxed;
	bh=F3GPRBnBVmbxhI0dCIq/9TZYTROumSbSHyzxyoeisCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEdserH4a30xgoT5UqE+iiZrvhcKT+DvkgH3NDcchFl5aPvwf8UlvdBp5fv1r/FgmJ5cjHadXS50xQaC3EAajRKUmBBCRi1ZhRls7vPKZglhtUHZcmjU/p9TWfj9A1fFkNs8ZJCMppqZH4ypIrv5ByMMCirVkaKs6W2oQnUwwazrDR1fRdkNN30IELsjgrup2/tS/1t3rX89U9LihYGlnBlooXAGBk6kDWyijVs8ZZT8SJrsO6sR3P1/Pr3EjAJnkqkHlo3hDOf04d6vJlFj0rxK3Qmfwm3tmNSFdzqMORCh4NV/YffO9pv6LeerxsCCiR3EnDoIkU+H7VKunwO1jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MG1dQJTq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MG1dQJTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7xHW6qlHz3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 04:29:27 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30bbdc29334so8667041fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282164; x=1741886964; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3GPRBnBVmbxhI0dCIq/9TZYTROumSbSHyzxyoeisCA=;
        b=MG1dQJTqCOuUnV2UmRuec0XGNoEKrmPDoKOO/dAk8EF8Ix0YFvEn35OoZZJkJwUHxK
         xh4B7R61rYAtKxq/kcMcPHY2dn1EJRFj9hP94uR5+JxcC5+RIBMBLWsH7GC0dTl2y9HU
         sypiBM4hIKMh91ciycjVuxJNy6LaD64sqRsvktts3Bddkfqo/iHAZ6KixcLmxxlvV9t8
         asVp1zJ1t1LXqmDt8hIaUjHAN31zoMNNW7x7DB30t9+ZMik3EPuTzdfP+T4pbprHcSoE
         SkW+eIMBM3Nekr/o7LVCU3/1pia/h4EFGNjhXfWUahgEulp2Jx7q8apFmDbpTOUhsFwq
         MUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282164; x=1741886964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3GPRBnBVmbxhI0dCIq/9TZYTROumSbSHyzxyoeisCA=;
        b=Szdqh3FNZUqabHxwTWGaj2zd2HKEuSXYxaZJqdr2cWDKrJcyVQ+MltXOV1JE+ULSwC
         3AchUGmaR7gXiMHJa2Nu1gYIwmBxcXhdBj3fktayvrSgGyMqDhXyTGIzpz1/pWUZVIPW
         62LH0igi2DY94jZtDNAI1tMNHPqhwOr2M+d1GUNIqJLXPDlgCkJIoLNxwNuhJvJ65kC6
         zbQCoM4qzdL1JiAxXCLswUG89R2RplPjhH+KtTdUG440MsWIUjetH3jnSNJpf+dwAulq
         swW1+tay2yTQ++dN1LWOTB7iv5zp7hdqPvNFPzqxWxjLSKxRRxKaGpKX9+i66xbX4z12
         0Qkg==
X-Forwarded-Encrypted: i=1; AJvYcCW/RJRmGcGKiEspdVqE0VSVeSZUHif6yyunDeKqHMdARUFfsyFb0Xq+dXGZY2IM6p5uYmPIf0Gb/abhJFk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxrnTb9wcS9CACnrHB9SDdrOxv3kFT1AYNH8reaxXBlQwu2sER
	5qbrR6RRum91WZnPsrFWNO6RZ4JEJ+APKusgoWP2m5DLMR9cXoTfWo6QQDL5/TbsYTb0a5nLKYl
	ew0FBEc/1eJrh8okpn2IcekGZTE4=
X-Gm-Gg: ASbGncu3qLhcDNnkBFyUxcjtC63Yn420/aFLrr6WVONvYdx7SP1Uwef+8ahQ2tzD0V1
	dNiuDXg8eMYFjl8vC2Sv/zVloVsw8USEjDGnmo3HbWJL/njREYe3ZdZ1nU4PL4TLP8bRiueom2C
	CN+34z5gBfm8bZrteBAr4dw0urPrAmRaBtXDSIkZX5kg==
X-Google-Smtp-Source: AGHT+IH/YlWmoRHr1Ii2Pc5mZeyT1wbsTGHyOyWkV+/j74OqiWKiPVXIMNv8fKZgc+JSddo0OQ9fxbaIyeYzSitv60o=
X-Received: by 2002:a2e:a595:0:b0:307:2b3e:a4a9 with SMTP id
 38308e7fff4ca-30bd7a70812mr37072751fa.20.1741282163283; Thu, 06 Mar 2025
 09:29:23 -0800 (PST)
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
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-2-5db840301730@gmail.com> <Z8nQ0vCNgz4lEJEj@pathway.suse.cz>
In-Reply-To: <Z8nQ0vCNgz4lEJEj@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Mar 2025 12:28:47 -0500
X-Gm-Features: AQ5f1Jo7c5afgFz2OUPXMWBao9ERbtEDe2_OPEz4cK8LEr1rzbF43Frduj4rlVE
Message-ID: <CAJ-ks9k8GON_x3doHi6XCNrQLfiva6obrQ7A6Sn+qUgdXLUuhQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] printf: break kunit into test cases
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 6, 2025 at 11:44=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2025-02-21 15:34:31, Tamir Duberstein wrote:
> > Move all tests into `printf_test_cases`. This gives us nicer output in
> > the event of a failure.
> >
> > Combine `plain_format` and `plain_hash` into `hash_pointer` since
> > they're testing the same scenario.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  lib/tests/printf_kunit.c | 331 +++++++++++++++++----------------------=
--------
> >  1 file changed, 121 insertions(+), 210 deletions(-)
> >
> > diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
> > index 287bbfb61148..013df6f6dd49 100644
> > --- a/lib/tests/printf_kunit.c
> > +++ b/lib/tests/printf_kunit.c
> > @@ -38,13 +38,8 @@ static unsigned int total_tests;
> >  static char *test_buffer;
> >  static char *alloced_buffer;
> >
> > -static struct kunit *kunittest;
> > -
> > -#define tc_fail(fmt, ...) \
> > -     KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
> > -
> > -static void __printf(4, 0)
> > -do_test(int bufsize, const char *expect, int elen,
> > +static void __printf(5, 0)
> > +do_test(struct kunit *kunittest, int bufsize, const char *expect, int =
elen,
> >       const char *fmt, va_list ap)
> >  {
> >       va_list aq;
> > @@ -58,59 +53,64 @@ do_test(int bufsize, const char *expect, int elen,
> [...]
> >
> >       if (memcmp(test_buffer, expect, written)) {
> > -             tc_fail("vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expe=
cted '%.*s'",
> > -                     bufsize, fmt, test_buffer, written, expect);
> > +             KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wr=
ote '%s', expected '%.*s'",
> > +                        bufsize, fmt, test_buffer, written, expect);
> >               return;
> >       }
> >  }
> >
> > -static void __printf(3, 4)
> > -__test(const char *expect, int elen, const char *fmt, ...)
> > +static void __printf(4, 0)
>
> This should be:
>
> static void __printf(4, 5)
>
> The 2nd parameter is zero when the variable list of parameters is
> passed using va_list.

Yeah, thanks for the catch. I fixed this locally after you observed
the same on the scanf-kunit series.

> > +__test(struct kunit *kunittest, const char *expect, int elen, const ch=
ar *fmt, ...)
> >  {
> >       va_list ap;
> >       int rand;
> >       char *p;
>
> > @@ -247,89 +225,44 @@ plain_format(void)
> >  #define ZEROS ""
> >  #define ONES ""
> >
> > -static int
> > -plain_format(void)
> > -{
> > -     /* Format is implicitly tested for 32 bit machines by plain_hash(=
) */
> > -     return 0;
> > -}
> > -
> >  #endif       /* BITS_PER_LONG =3D=3D 64 */
> >
> > -static int
> > -plain_hash_to_buffer(const void *p, char *buf, size_t len)
> > +static void
> > +plain_hash_to_buffer(struct kunit *kunittest, const void *p, char *buf=
, size_t len)
> >  {
> > -     int nchars;
> > -
> > -     nchars =3D snprintf(buf, len, "%p", p);
> > -
> > -     if (nchars !=3D PTR_WIDTH)
> > -             return -1;
> > +     KUNIT_ASSERT_EQ(kunittest, snprintf(buf, len, "%p", p), PTR_WIDTH=
);
> >
> >       if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) =3D=3D 0) {
> >               kunit_warn(kunittest, "crng possibly not yet initialized.=
 plain 'p' buffer contains \"%s\"",
> >                       PTR_VAL_NO_CRNG);
> > -             return 0;
> >       }
> > -
> > -     return 0;
> >  }
> >
> > -static int
> > -plain_hash(void)
> > -{
> > -     char buf[PLAIN_BUF_SIZE];
> > -     int ret;
> > -
> > -     ret =3D plain_hash_to_buffer(PTR, buf, PLAIN_BUF_SIZE);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (strncmp(buf, PTR_STR, PTR_WIDTH) =3D=3D 0)
> > -             return -1;
> > -
> > -     return 0;
> > -}
> > -
> > -/*
> > - * We can't use test() to test %p because we don't know what output to=
 expect
> > - * after an address is hashed.
> > - */
> >  static void
> > -plain(void)
> > +hash_pointer(struct kunit *kunittest)
> >  {
> > -     int err;
> > +     if (no_hash_pointers)
> > +             kunit_skip(kunittest, "hash pointers disabled");
> >
> > -     if (no_hash_pointers) {
> > -             kunit_warn(kunittest, "skipping plain 'p' tests");
> > -             return;
> > -     }
> > +     char buf[PLAIN_BUF_SIZE];
> >
> > -     err =3D plain_hash();
> > -     if (err) {
> > -             tc_fail("plain 'p' does not appear to be hashed");
> > -             return;
> > -     }
> > +     plain_hash_to_buffer(kunittest, PTR, buf, PLAIN_BUF_SIZE);
> >
> > -     err =3D plain_format();
> > -     if (err) {
> > -             tc_fail("hashing plain 'p' has unexpected format");
> > -     }
> > +     /*
> > +      * We can't use test() to test %p because we don't know what outp=
ut to expect
> > +      * after an address is hashed.
> > +      */
>
> The code does not longer print a reasonable error message on failure.
> I would extend the comment to make it easier to understand the
> meaning. Also I would use the imperative style. Something like:
>
>         /*
>          * The hash of %p is unpredictable, therefore test() cannot be us=
ed.
>          * Instead, verify that the first 32 bits are zeros on a 64-bit s=
ystem,
>          * and confirm the non-hashed value is not printed.
>          */

I'll make this change. Note that this comment isn't changing here, it
only appears to be because its indentation changed.

> > +
> > +     KUNIT_EXPECT_MEMEQ(kunittest, buf, ZEROS, strlen(ZEROS));
> > +     KUNIT_EXPECT_MEMNEQ(kunittest, buf+strlen(ZEROS), PTR_STR, PTR_WI=
DTH);
>
> This looks wrong. It should be either:
>
>         KUNIT_EXPECT_MEMNEQ(kunittest, buf, PTR_STR, PTR_WIDTH);
>
> or
>
>         KUNIT_EXPECT_MEMNEQ(kunittest,
>                             buf + strlen(ZEROS),
>                             PTR_STR + strlen(ZEROS),
>                             PTR_WIDTH - strlen(ZEROS));
>
> I would use the 1st variant. It is easier and it works the same way
> as the original check.

Ah, I see. Done as you ask.

>
> Anyway, it is a great clean up of the pointer tests. I have wanted to do =
it
> since a long time but I never found time.

Thanks!

> >  }
> >
> >  static void
> > -test_hashed(const char *fmt, const void *p)
> > +test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
> >  {
> >       char buf[PLAIN_BUF_SIZE];
> > -     int ret;
> >
> > -     /*
> > -      * No need to increase failed test counter since this is assumed
> > -      * to be called after plain().
> > -      */
> > -     ret =3D plain_hash_to_buffer(p, buf, PLAIN_BUF_SIZE);
> > -     if (ret)
> > -             return;
> > +     plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
> >
> >       test(buf, fmt, p);
> >  }
> > @@ -739,11 +664,9 @@ flags(void)
> >                                                       (unsigned long) g=
fp);
> >       gfp |=3D __GFP_HIGH;
> >       test(cmp_buffer, "%pGg", &gfp);
> > -
> > -     kfree(cmp_buffer);
>
> I belive that the kfree() should stay. Otherwise, the test leaks memory
> in every run.

This memory is now allocated using `kunit_kmalloc`:

>  * kunit_kmalloc() - Like kmalloc() except the allocation is *test manage=
d*.
> [...]
>  * See kmalloc() and kunit_kmalloc_array() for more information.

`kunit_kmalloc_array`:

> * Just like `kmalloc_array(...)`, except the allocation is managed by the=
 test case
> * and is automatically cleaned up after the test case concludes. See kuni=
t_add_action()
> * for more information.

So this kfree is not necessary.

>
> >  }
> >
> > -static void fwnode_pointer(void)
> > +static void fwnode_pointer(struct kunit *kunittest)
> >  {
> >       const struct software_node first =3D { .name =3D "first" };
> >       const struct software_node second =3D { .name =3D "second", .pare=
nt =3D &first };
>
> Otherwise, it looks good to me.
>
> Best Regards,
> Petr

