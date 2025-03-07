Return-Path: <linuxppc-dev+bounces-6809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13222A56D96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:25:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8WqY4pSMz3cVD;
	Sat,  8 Mar 2025 03:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741364745;
	cv=none; b=BfFwj7VmStFtCHPXZ3CfBp0mr+xLMOhjBX9QEwhxciEKqzdrMqN9h39W3uz1+u1igMm72mDnlVCF7gjCRe4WP8T5Z6zycdi/RwpufFjtybbTrtssz7SEyLhLWfk3OK63CrqJ0bYtCGdW7QzkYQt/0MwXQjlfQU//HVhmUs0y9R/oa7/xYJ4NNL8ar9EXXc54vlit0pNhYnu1e2BIn4MinILJha3F71UArmi1nuuhLGq1R+0QcJiElCD4PtInigx0lN9a6kWj6qu/Ff5X5Ej8frOGa+tOGwWmUyUew7cq8lu9wvfVBh7L6fX0IHH1iYIQL7g+lZqhpuRiNYIovU13yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741364745; c=relaxed/relaxed;
	bh=GniiXwrf8dME3pfrOSLg2j3Gf/5JWPlw9dqX608bhBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRRhKZUi8iZAn52vjolgfr7yb2m4HcX2rkcp8D6Zhxkk2Ge9L3PJaDOorEPCHPZeJvkuTB86CzV7YB/oEp1DpWPvMoMcCiO00XEnSraVk4c5DgxFbalJPz+9NuNsNIVYIG15ZguMi6wGT4QI1KvdDVuG40PibYH6ZtMJUsst9bcK7Ikjs4vaQQ5DzH+5Iv23ohjAU1PmQD6oHUhKkXSHjWSixVb4CaXopd+MqdmXZWikiLIlBTCMmyFVZUwzHgnAwqgZTrdthZwOaDl+HzLq7ey1gkO6lq7gdYoOOb3GSdCJ9oiYiBW4n/6PEmjJNXmAsdddgck5PUst/xZHH4lryw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GZDR/q6V; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GZDR/q6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WqX1S8fz3cTw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:25:44 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso4982451fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364741; x=1741969541; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GniiXwrf8dME3pfrOSLg2j3Gf/5JWPlw9dqX608bhBE=;
        b=GZDR/q6VnPozNB7HG3gCxfDWZAWBfYhGuUNaSpEWnIDKKPx7O0hDT9A/Fb7Jg/9ywQ
         CoVUJg0060Okw6insXolYXRHyD0nNjvMvqocbVa1dWXpo+rflNlFNcO4uewIGYYAKvBL
         Ul4curFUQBNzDLVbjjjkW+4v60xIRcso8PvV6nQp7qax7LLOyGBJXDcGMYbSwnPOBIU/
         dnEvuAQn3T7d771oyacvWENdHi6UF5XZYkIUV5YOlCpEGKxlMu+3GRmrF2Pp54g/aQ/e
         UJ75E0eWb644KECJ96axfMGitgmlBTbtgVf8zOnbJu4NScCJgqI4+47FAxC3VT+cSLiF
         jdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364741; x=1741969541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GniiXwrf8dME3pfrOSLg2j3Gf/5JWPlw9dqX608bhBE=;
        b=PqmiTskCrswE12Mbm4y+kYu5GQE8QlnhLcH9c7OPiFDNpldZv3YkWTM76q/Wv8mwiC
         AEXHPQ3f0cFb9Rij3ojo2Nf614PTUvYgY2ZML9vMiwqpAZUFMKhX9SZ3bsBNYowC1Qve
         DkAjiS+pZFAa9ZWf015lSVAUdAIpdCIxlSiAUsRag8u9Iv25K3bVhHHyFKaflz9zVyYs
         UJK2D3oRU3tYB9qjZQxxWCjaN+XOBTqdXqkS7HTyIPAngaJ0bkoyvKWUgWo18SAyUaWL
         EDgsq2ZuY1Km/mZFKZjmWcH1OsxuTmQPp2WQtzVaxZbzucF2uChCYTjjJmRehLAah8kl
         KmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnc9wPhmiBAtPvL5LWY4VfGtYAf7VJErg73N+XVi+pSmTiZuK6wO49RqV+R3ULOHGf7ClpI1yES3+4K6o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywlvr1UNsgFtGJtwZPhVNeSczIwn/KKlBWBhM9NBNj20uqqmBkx
	IECK/G9v57NGoFhyo5OjmKG3QigHCDtu9PZiGkBDzqSY9PXWYEzRA9HvLT+tqb1vUtj02X1ptXq
	H6Xg9ayYJ/Caiw97UZjjsKdS5mn0=
X-Gm-Gg: ASbGncsNXpHfY86U69AEfKjnt78POQrEm5QwLs5nI8BtNt8+SmtTRiJ1lHlcAOMrTgk
	5kdNuK6su9LNEAcn5W5cXAgyDRL7NDtNCxzTny63i0Y6p8NBI1hPm3xKQWfuvvBbM7pPhKPETz0
	NBK/rGRg3+RD5rTfzOavhuhajYesY033SyY8qYzW11Qclx8PrIeE1ScseZBX87
X-Google-Smtp-Source: AGHT+IEVB3KglQh/9Sn2MMnIIn4pSiWyREt2/PrZgQihsBRdaIE1s+RXe6lakVpGzZy3kRntdwBmJuURZ+hTf4hVYmI=
X-Received: by 2002:a2e:bc16:0:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-30bf44ed6f9mr12793991fa.2.1741364740761; Fri, 07 Mar 2025
 08:25:40 -0800 (PST)
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
 <20250221-printf-kunit-convert-v5-2-5db840301730@gmail.com> <Z8scO-LsAWxdYIfJ@pathway.suse.cz>
In-Reply-To: <Z8scO-LsAWxdYIfJ@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:25:04 -0500
X-Gm-Features: AQ5f1JpnB54iyHb2NlPpIPbsEeQBbd1J-Q5YzDRd9TuRGbggczJShE8KVb5vftU
Message-ID: <CAJ-ks9mb5pz4KWN_N-wd0k932bfhSjQuFEsXDrBxj9+RHSNWGA@mail.gmail.com>
Subject: Re: crng init: was: Re: [PATCH v5 2/3] printf: break kunit into test cases
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

On Fri, Mar 7, 2025 at 11:18=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2025-02-21 15:34:31, Tamir Duberstein wrote:
> > Move all tests into `printf_test_cases`. This gives us nicer output in
> > the event of a failure.
> >
> > Combine `plain_format` and `plain_hash` into `hash_pointer` since
> > they're testing the same scenario.
> >
> > --- a/lib/tests/printf_kunit.c
> > +++ b/lib/tests/printf_kunit.c
> > @@ -178,7 +179,7 @@ test_number(void)
> >  }
> >
> >  static void
> > -test_string(void)
> > +test_string(struct kunit *kunittest)
> >  {
> >       test("", "%s%.0s", "", "123");
> >       test("ABCD|abc|123", "%s|%.3s|%.*s", "ABCD", "abcdef", 3, "123456=
");
> > @@ -215,29 +216,6 @@ test_string(void)
> >  #define ZEROS "00000000"     /* hex 32 zero bits */
> >  #define ONES "ffffffff"              /* hex 32 one bits */
> >
> > -static int
> > -plain_format(void)
> > -{
> > -     char buf[PLAIN_BUF_SIZE];
> > -     int nchars;
> > -
> > -     nchars =3D snprintf(buf, PLAIN_BUF_SIZE, "%p", PTR);
> > -
> > -     if (nchars !=3D PTR_WIDTH)
> > -             return -1;
> > -
> > -     if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) =3D=3D 0) {
> > -             kunit_warn(kunittest, "crng possibly not yet initialized.=
 plain 'p' buffer contains \"%s\"",
> > -                     PTR_VAL_NO_CRNG);
> > -             return 0;
> > -     }
> > -
> > -     if (strncmp(buf, ZEROS, strlen(ZEROS)) !=3D 0)
> > -             return -1;
> > -
> > -     return 0;
> > -}
> > -
> >  #else
> >
> >  #define PTR_WIDTH 8
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
>
> I have simulated the not-yet-initialized crng and got:
>
> [   80.109760] printf_kunit: module verification failed: signature and/or=
 required key missing - tainting kernel
> [   80.114218] KTAP version 1
> [   80.114743] 1..1
> [   80.116124]     KTAP version 1
> [   80.116752]     # Subtest: printf
> [   80.117239]     # module: printf_kunit
> [   80.117256]     1..28
> [   80.120924]     ok 1 test_basic
> [   80.121495]     ok 2 test_number
> [   80.122741]     ok 3 test_string
> [   80.123498]     # hash_pointer: crng possibly not yet initialized. pla=
in 'p' buffer contains "(____ptrval____)"
> [   80.124044]     # hash_pointer: EXPECTATION FAILED at lib/tests/printf=
_kunit.c:256
>                    Expected buf =3D=3D "00000000", but
>                        buf =3D=3D
>                        <28><5f><5f><5f><5f><70><74><72>
>                        "00000000" =3D=3D
>                        <30><30><30><30><30><30><30><30>
> [   80.125888]     not ok 4 hash_pointer
> [   80.129831]     ok 5 null_pointer
> [   80.130253]     ok 6 error_pointer
> [   80.131221]     # invalid_pointer: crng possibly not yet initialized. =
plain 'p' buffer contains "(____ptrval____)"
> [   80.132168]     ok 7 invalid_pointer
> [   80.135149]     ok 8 symbol_ptr
> [   80.136016]     ok 9 kernel_ptr
> [   80.136868]     ok 10 struct_resource
> [   80.137768]     ok 11 struct_range
> [   80.138613]     ok 12 addr
> [   80.139370]     ok 13 escaped_str
> [   80.140054]     ok 14 hex_string
> [   80.140601]     ok 15 mac
> [   80.141162]     ok 16 ip4
> [   80.141670]     ok 17 ip6
> [   80.142221]     ok 18 uuid
> [   80.143090]     ok 19 dentry
> [   80.143963]     ok 20 struct_va_format
> [   80.144523]     ok 21 time_and_date
> [   80.145043]     ok 22 struct_clk
> [   80.145589]     ok 23 bitmap
> [   80.146087]     ok 24 netdev_features
> [   80.146572]     ok 25 flags
> [   80.146980]     # errptr: crng possibly not yet initialized. plain 'p'=
 buffer contains "(____ptrval____)"
> [   80.147412]     ok 26 errptr
> [   80.148548]     ok 27 fwnode_pointer
> [   80.149086]     ok 28 fourcc_pointer
> [   80.149090]     # printf: ran 448 tests
> [   80.149099] # printf: pass:27 fail:1 skip:0 total:28
> [   80.149102] # Totals: pass:27 fail:1 skip:0 total:28
> [   80.149106] not ok 1 printf
>
> =3D> One test failed even though vspritf() worked as expected.
>
>    The "EXPECTATION FAILED" message was a bit tricky because
>    it printed "<28><5f><5f><5f><5f><70><74><72>" instead of "(____ptrval_=
___)".
>
>    Two tests succeeded even after a warning message which would make peop=
le
>    to investigate it.
>
> I suggest to rather skip the test in this case. Something like:
>
>         if (strncmp(buf, PTR_VAL_NO_CRNG, PTR_WIDTH) =3D=3D 0) {
>                 kunit_skip(kunittest,
>                            "crng possibly not yet initialized. plain 'p' =
buffer contains \"%s\"\n",
>                            PTR_VAL_NO_CRNG);
>         }
>
>
> It produces:
>
> [  140.555055] KTAP version 1
> [  140.555413] 1..1
> [  140.555796]     KTAP version 1
> [  140.556115]     # Subtest: printf
> [  140.556450]     # module: printf_kunit
> [  140.556459]     1..28
> [  140.557757]     ok 1 test_basic
> [  140.558072]     ok 2 test_number
> [  140.558693]     ok 3 test_string
> [  140.559278]     ok 4 hash_pointer # SKIP crng possibly not yet initial=
ized. plain 'p' buffer contains "(____ptrval____)"
> [  140.560949]     ok 5 null_pointer
> [  140.561257]     ok 6 error_pointer
> [  140.561880]     ok 7 invalid_pointer # SKIP crng possibly not yet init=
ialized. plain 'p' buffer contains "(____ptrval____)"
> [  140.564159]     ok 8 symbol_ptr
> [  140.565248]     ok 9 kernel_ptr
> [  140.566346]     ok 10 struct_resource
> [  140.567642]     ok 11 struct_range
> [  140.569141]     ok 12 addr
> [  140.570395]     ok 13 escaped_str
> [  140.571407]     ok 14 hex_string
> [  140.572337]     ok 15 mac
> [  140.573572]     ok 16 ip4
> [  140.574712]     ok 17 ip6
> [  140.575743]     ok 18 uuid
> [  140.577164]     ok 19 dentry
> [  140.578248]     ok 20 struct_va_format
> [  140.579400]     ok 21 time_and_date
> [  140.580507]     ok 22 struct_clk
> [  140.581706]     ok 23 bitmap
> [  140.582739]     ok 24 netdev_features
> [  140.583808]     ok 25 flags
> [  140.585274]     ok 26 errptr # SKIP crng possibly not yet initialized.=
 plain 'p' buffer contains "(____ptrval____)"
> [  140.588403]     ok 27 fwnode_pointer
> [  140.592141]     ok 28 fourcc_pointer
> [  140.592758]     # printf: ran 408 tests
> [  140.593219] # printf: pass:25 fail:0 skip:3 total:28
> [  140.593706] # Totals: pass:25 fail:0 skip:3 total:28
> [  140.594280] ok 1 printf
>
> Best Regards,
> Petr

Thanks for testing! I didn't know how to do that. Changed to
kunit_skip as you suggested.

