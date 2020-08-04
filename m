Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4623C082
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:08:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLm5l0Hm6zDqC3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:08:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=v4l5acpz; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLm3j600mzDqC3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 06:06:24 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 17so889189pfw.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNm8W6rpYM06BBGBIHZxcMjdzZ3vakXrlXurbxLdgkc=;
 b=v4l5acpzSQAfpQHj1mfUVMR3p5sYyrw5mOo48jHfFk0RTIu1O9uHerBR9X6iqyjRME
 jpuyZUa5ksd0zx3yIUS1JV4PNrR+Ci6JB9Yiqv914mGAbQpinU+OcDkb3wb5U3IcmAkE
 +z3r71HrcS68ERoiCC+g/GVSr0G//Sry7KTWGhvunwYoC76KLfIu0xebOB7N/oBdHvoE
 kvxn8aDuMtop9CYR/dqBjlKopgBJ+9bq0ulQvn+MhzjpQvpiGgk0gB7qT+ZEJW/2bBT7
 ftYbtYibZk1eE5Nez0MLw5pbzDM8YEcwr/pth2mY6N88/dFxTj7Z9s0eU16+k9y7i7qu
 kT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNm8W6rpYM06BBGBIHZxcMjdzZ3vakXrlXurbxLdgkc=;
 b=GQ7PYBOvHxctFEC1v1xMoL2bI/lLyBabQFfnpP/i7Fvz9vQv7NZ+UN3YTi+2gXmhM8
 xSixgKcn5Jt/TROVoT7Nqk3dbPaD7wORklcb/TfwP6DqP1Cfx8qS6JpHiS8kzRMDm7Qm
 C889I5vxH/ZQstyGFawmspiwzB3kmMvlErfV5G+rTHgnkM4SO3Y+2eIiRwIT24RDOcOJ
 EdPdxoYWSRkIkFdKPW062h3x1u8u0xlTMwzHmnVNq9Ni+pRWje6c9Tin+Eo/2Rpf06h4
 oQpez55hIdOjmIkFGf+KHZVsrxqq9M+hG3rL7ZVCnlEOCCT7pGi09zo6BIAGmhH+vO1Z
 aALw==
X-Gm-Message-State: AOAM530XSs/PW/f3HI0CNDnfa5BJ67Rhh/XHvRndPE0qAqeYUq048yXw
 Z1ALGrWlpm91u5S4fHV/v9jIxz+LvQgSCtPiulS22g==
X-Google-Smtp-Source: ABdhPJwDxyLCJxo7OkSto+sYTNQG5C6S3G+O7SAk1MPu1yxc8iqCFPqvVOnR/cM9XZ52e6+sDqLchsL5zLZPTJ6SMvc=
X-Received: by 2002:a62:7b89:: with SMTP id w131mr49836pfc.284.1596571581073; 
 Tue, 04 Aug 2020 13:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-8-brendanhiggins@google.com>
 <202006261423.0BC9D830@keescook>
In-Reply-To: <202006261423.0BC9D830@keescook>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Aug 2020 13:06:10 -0700
Message-ID: <CAFd5g46sH+J9Un-2BTYMjruZ6bd+T35MsR2rCAKeVERV_JSoCw@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] kunit: test: create a single centralized
 executor for all tests
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 2:29 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:12PM -0700, Brendan Higgins wrote:
> > From: Alan Maguire <alan.maguire@oracle.com>
> >
> > Add a centralized executor to dispatch tests rather than relying on
> > late_initcall to schedule each test suite separately. Centralized
> > execution is for built-in tests only; modules will execute tests when
> > loaded.
> >
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> > Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > Co-developed-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  include/kunit/test.h | 67 +++++++++++++++++++++++++++++---------------
> >  lib/kunit/Makefile   |  3 +-
> >  lib/kunit/executor.c | 28 ++++++++++++++++++
> >  lib/kunit/test.c     |  2 +-
> >  4 files changed, 76 insertions(+), 24 deletions(-)
> >  create mode 100644 lib/kunit/executor.c
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 47e61e1d53370..f3e86c3953a2b 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -224,7 +224,7 @@ size_t kunit_suite_num_test_cases(struct kunit_suite *suite);
> >  unsigned int kunit_test_case_num(struct kunit_suite *suite,
> >                                struct kunit_case *test_case);
> >
> > -int __kunit_test_suites_init(struct kunit_suite **suites);
> > +int __kunit_test_suites_init(struct kunit_suite * const * const suites);
> >
> >  void __kunit_test_suites_exit(struct kunit_suite **suites);
> >
> > @@ -237,34 +237,57 @@ void __kunit_test_suites_exit(struct kunit_suite **suites);
> >   * Registers @suites_list with the test framework. See &struct kunit_suite for
> >   * more information.
> >   *
> > - * When builtin, KUnit tests are all run as late_initcalls; this means
> > - * that they cannot test anything where tests must run at a different init
> > - * phase. One significant restriction resulting from this is that KUnit
> > - * cannot reliably test anything that is initialize in the late_init phase;
> > - * another is that KUnit is useless to test things that need to be run in
> > - * an earlier init phase.
> > - *
> > - * An alternative is to build the tests as a module.  Because modules
> > - * do not support multiple late_initcall()s, we need to initialize an
> > - * array of suites for a module.
> > - *
> > - * TODO(brendanhiggins@google.com): Don't run all KUnit tests as
> > - * late_initcalls.  I have some future work planned to dispatch all KUnit
> > - * tests from the same place, and at the very least to do so after
> > - * everything else is definitely initialized.
> > + * If a test suite is built-in, module_init() gets translated into
> > + * an initcall which we don't want as the idea is that for builtins
> > + * the executor will manage execution.  So ensure we do not define
> > + * module_{init|exit} functions for the builtin case when registering
> > + * suites via kunit_test_suites() below.
> >   */
> > -#define kunit_test_suites(suites_list...)                            \
> > -     static struct kunit_suite *suites[] = {suites_list, NULL};      \
> > -     static int kunit_test_suites_init(void)                         \
> > +#ifdef MODULE
> > +#define kunit_test_suites_for_module(__suites)                               \
> > +     static int __init kunit_test_suites_init(void)                  \
> >       {                                                               \
> > -             return __kunit_test_suites_init(suites);                \
> > +             return __kunit_test_suites_init(__suites);              \
> >       }                                                               \
> > -     late_initcall(kunit_test_suites_init);                          \
> > +     module_init(kunit_test_suites_init);                            \
> > +                                                                     \
> >       static void __exit kunit_test_suites_exit(void)                 \
> >       {                                                               \
> > -             return __kunit_test_suites_exit(suites);                \
> > +             return __kunit_test_suites_exit(__suites);              \
> >       }                                                               \
> >       module_exit(kunit_test_suites_exit)
> > +#else
> > +#define kunit_test_suites_for_module(__suites)
> > +#endif /* MODULE */
> > +
> > +#define __kunit_test_suites(unique_array, unique_suites, ...)                       \
> > +     static struct kunit_suite *unique_array[] = { __VA_ARGS__, NULL };     \
> > +     kunit_test_suites_for_module(unique_array);                            \
> > +     static struct kunit_suite **unique_suites                              \
> > +     __used __section(.kunit_test_suites) = unique_array
> > +
> > +/**
> > + * kunit_test_suites() - used to register one or more &struct kunit_suite
> > + *                    with KUnit.
> > + *
> > + * @suites: a statically allocated list of &struct kunit_suite.
> > + *
> > + * Registers @suites with the test framework. See &struct kunit_suite for
> > + * more information.
> > + *
> > + * When builtin,  KUnit tests are all run via executor; this is done
> > + * by placing the array of struct kunit_suite * in the .kunit_test_suites
> > + * ELF section.
> > + *
> > + * An alternative is to build the tests as a module.  Because modules do not
> > + * support multiple initcall()s, we need to initialize an array of suites for a
> > + * module.
> > + *
> > + */
> > +#define kunit_test_suites(...)                                               \
> > +     __kunit_test_suites(__UNIQUE_ID(array),                         \
> > +                         __UNIQUE_ID(suites),                        \
> > +                         __VA_ARGS__)
> >
> >  #define kunit_test_suite(suite)      kunit_test_suites(&suite)
> >
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index 724b94311ca36..c49f4ffb6273a 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -3,7 +3,8 @@ obj-$(CONFIG_KUNIT) +=                        kunit.o
> >  kunit-objs +=                                test.o \
> >                                       string-stream.o \
> >                                       assert.o \
> > -                                     try-catch.o
> > +                                     try-catch.o \
> > +                                     executor.o
> >
> >  ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
> >  kunit-objs +=                                debugfs.o
> > diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> > new file mode 100644
> > index 0000000000000..7015e7328dce7
> > --- /dev/null
> > +++ b/lib/kunit/executor.c
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <kunit/test.h>
> > +
> > +/*
> > + * These symbols point to the .kunit_test_suites section and are defined in
> > + * include/asm-generic/vmlinux.lds.h, and consequently must be extern.
> > + */
> > +extern struct kunit_suite * const * const __kunit_suites_start[];
> > +extern struct kunit_suite * const * const __kunit_suites_end[];
>
> I would expect these to be in include/asm-generic/sections.h but I guess
> it's not required.

I don't have strong opinions either way, but I think this is less
clutter since KUnit is the only one that uses it.

> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!
