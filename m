Return-Path: <linuxppc-dev+bounces-6810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE7A56DAB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Wtf0ZnLz3cV1;
	Sat,  8 Mar 2025 03:28:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741364905;
	cv=none; b=hEJIlGhPPie0XtL9bHymJfW+2p8XV8SLc2pI1lvRsAEJqzD1axpwJwHK+bF/9jxtyzPJTGW40l04IGWAeywoi4QPbvsVBPFOJRPxgkQ7pf/yrkpz7mIxGHidoNa0Cn6hJfdS8Evhhhbqv4nhYSYzuqJYJZMyUvdx2gouz7VDRUe9k7+tdQz3l8AY1mS+jbUiLRy4B5pTmkalMQ5cQRUdpq+RVZcbSY3AShljWhD1Q4iLsDfnmYOiLS93D9PweDaFXJsZoqB/p+lL4ZNJgR5lyvp7Z1baT3qVr7x+QjF2wGdj9bz+EzkkK3enmsKMnVHwS56bH63BdDsioJ10Tz0Hqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741364905; c=relaxed/relaxed;
	bh=9LDrfNP0P1DLF6th+Id2FgZJU1V1LRDhdOalVdghfLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxZwoVNW625fm9uVidjil9wpcQLphwbl+zB2JxskwkhQy3ikjoLX5aAjTKGQLxbYHcpulDBYW/YeUZAbLGacgwko1NeTrqp4WznictvV5UrLuDYCNg96PZlm2OlmM7O9JuH10dv2R7m72f+yNCYbzImI2seZStgkku3L2rNkXVKW3oZ9gxB5Frc99awD8r7RAsNx/1gf6IDON0dweouf5hPjZlwUAlBkaYZT2DYKzaGzXkKqFIbqTurBMLhkLMT0tjQbBhNT99Uyez+iCAE8+jj1lzSXRpxoIW8UUuI6DO+zcwVsM0zvR2s9GwCr9IFTJg4gbIW+WIXz8XRwX83OtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eGgnvkQU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eGgnvkQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Wtd0G9Fz3cTw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:28:24 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-307bc125e2eso22157721fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364901; x=1741969701; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LDrfNP0P1DLF6th+Id2FgZJU1V1LRDhdOalVdghfLk=;
        b=eGgnvkQUBuf1oGL2fhYfFlGcmbeoV7cLnBUZDMJF/N9AK+lugmq6oSYawm/J7evVyL
         vTYTIxhDZl3SVPwB9o95iK1OF239aaOvkYyAMBcTWN8Oblh8E+ReklFAZb3H4gE6BTKa
         wEwxjaJ/2/t5+FSFA3qKWLzHJNDl85l7wUJWGSzLQ6lYXLVylIYTgyhsk6pBNfp9Ex2s
         9wHK1DTt872hGy+8KgAKoolgWfGWhCtaP4XDu1Qt5r6514pIJbI92Prc3psyKtxPLvBa
         iOsPcPeREdrJyAgkLeADSDARb82ZyYDqPt/QgbJSW+5nJj+iwPrjVQ56W8ag67y03F4Q
         gpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364901; x=1741969701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LDrfNP0P1DLF6th+Id2FgZJU1V1LRDhdOalVdghfLk=;
        b=EKNgtL0FlI7kcLZUHnG0FhF8AJImeOuvi0lhXFOPZmwtmaI0/i0QmRwCDuWvx/heLL
         x4UCjhom7piSXvZhDZL1GODG6U7w/Cz6g7zfgAy8dnlG0EEpcAEjPiAaX6Ojb2TWd96N
         FdOriSWFFPVTsn8qHHuMfTEhAtr+vg3N7gTMgrMShRk5Ybf2epYI/zEZKX1RpsMxVpiF
         /PvIpIhkBjjg9jf6oNxXhV2Nco9ET/h/h2jUv525HbsJhMj45ToEvvFl+rvQnCSIuRBP
         DxZHTQHI4IlKahBpTWr290NEzl2unntZRLEVXNZF8Y0SpnZC2BkrviiRLCO/ZWGXE/wM
         bKag==
X-Forwarded-Encrypted: i=1; AJvYcCWmSZNr0iASXMvcUrMud0Ca1L84jZoVyS+UV35biG1hdKp6Y3pcn/xhJ7jxjG5ix+TespaHmFxMy5Wjjwc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxc+so6zNbv8jAhPoY+kney7llR2jpnLdunIgqyL9tDykI7JSyj
	tjF1ae4TZE+SQC9A7vywXicuAP1hSyy9kja8BYwhKEq5077Q0xQeve/EbkBtjoCOmxVPe/9TmSv
	5Y33A0GyNxgg1TeCvNGAksKQQShY=
X-Gm-Gg: ASbGncuQO2pLN3uOaO5uLIFWqFvOKPSOXXobARyZYD2vvVhX6f6hqDGn/ZhbldOflbX
	1IfJpKt3w0W2wWIHKpIzItHy9bU9XgDw7e7J8IT5SjzwGrMtzfFUKmfMUsbejZjYHNUFCnvldZ3
	OzL1JkfB7Vy8N8uywnwrKiZDL5W65H88BLEpR3+80cpK8KeltF29vbssshrDAq
X-Google-Smtp-Source: AGHT+IHx1kUvjF00AHJ9J3L5ITEytbdRfQvXtFGFxoLSrqiRjEGD72zbGCOCsERKFlZxWvUyGiVWpVwdMG0d68/WjgE=
X-Received: by 2002:a05:651c:1502:b0:30b:d187:622b with SMTP id
 38308e7fff4ca-30bf452957cmr18814461fa.18.1741364900897; Fri, 07 Mar 2025
 08:28:20 -0800 (PST)
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
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <Z8sYOm4qovtdOSI7@pathway.suse.cz>
In-Reply-To: <Z8sYOm4qovtdOSI7@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:27:44 -0500
X-Gm-Features: AQ5f1JqgJJnekMi4RiL3kK2pqFYWGaUWb_12GtlPRw-AyLWVF2WVbXCe9PmZGXQ
Message-ID: <CAJ-ks9k5wLpeg7JFL-T6SYN62y7FWeQDbS9Q34TC-zY-dyM3HQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
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

On Fri, Mar 7, 2025 at 11:01=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2025-03-06 09:25:43, Tamir Duberstein wrote:
> > On Thu, Mar 6, 2025 at 7:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> w=
rote:
> > >
> > > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > > Convert the printf() self-test to a KUnit test.
> > > >
> > > > In the interest of keeping the patch reasonably-sized this doesn't
> > > > refactor the tests into proper parameterized tests - it's all one b=
ig
> > > > test case.
> > > >
> > > > --- a/lib/test_printf.c
> > > > +++ b/lib/tests/printf_kunit.c
> > > > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int el=
en,
> > > >       va_end(aq);
> > > >
> > > >       if (ret !=3D elen) {
> > > > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d,=
 expected %d\n",
> > > > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d,=
 expected %d",
> > >
> > > 1. It looks a bit strange that the 1st patch replaces pr_warn() with
> > >    tc_fail() which hides KUNIT_FAIL().
> > >
> > >    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
> > >
> > >    It looks like a non-necessary churn.
> > >
> > >    It would be better to avoid the temporary "tc_fail" and swith to
> > >    KUNIT_FAIL() already in this patch.
> > >
> > >    I did not find any comment about this in the earier versions of th=
e
> > >    patchset.
> > >
> > >    Is it just a result of the evolution of the patchset or
> > >    is there any motivation for this?
> >
> > The motivation was to keep the width of the macro the same in this
> > first patch for ease of review, particularly in the 7 instances where
> > the invocation wraps to a second line. If you prefer I go straight to
> > KUNIT_FAIL, I can make that change.
>
> I see. It might have been useful when the patch removed the trailing '\n'=
.
> But you are going to add it back. So there won't be any hidden change.
> So I would prefer to go straight to KUNIT_FAIL().

=F0=9F=91=8D I've restored all the newlines and added a few previously miss=
ing ones.

> > > > @@ -842,13 +836,15 @@ test_pointer(void)
> > > >       fourcc_pointer();
> > > >  }
> > > >
> > > > -static void __init selftest(void)
> > > > +static void printf_test(struct kunit *test)
> > > >  {
> > > >       alloced_buffer =3D kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL)=
;
> > > >       if (!alloced_buffer)
> > > >               return;
> > >
> > > I would use here:
> > >
> > >         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
> > >
> > > And move the same change for the other kmalloc() location from
> > > the 2nd patch.
> >
> > I didn't do that here because I was trying to keep this patch as small
> > as possible, and I wrote that in the commit message.
> >
> > As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
> > back to an error return in the 2nd patch because this code moves into
> > `suite_init`, which is called with `struct kunit_suite` rather than
> > `struct kunit_test`, and KUnit assertion macros do not work with the
> > former (and for good reason, because failures in suite setup cannot be
> > attributed to a particular test case).
>
> I see. KUNIT_ASSERT_NOT_NULL() can't be used in the .suite_exit() callbac=
k.
>
> > So I'd prefer to leave this as is.
>
> I agree to leave this as is.

=F0=9F=91=8D

