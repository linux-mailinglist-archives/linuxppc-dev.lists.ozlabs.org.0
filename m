Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C723C0AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:20:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLmMp6mr9zDqTN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:20:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Yeb/dQlV; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLmKf2YKtzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 06:18:30 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d1so23908783plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hzRXIsj1+SAs1tNlnSNXJanvh8FrwUG7dToFo76pgso=;
 b=Yeb/dQlVJPeL8Vx7ag5c0XCGsmI6B14mO/wfB4je5mHzE84Aurte2l0bCK6rN6ftOQ
 qiWBFA1NwEV85DMi2taxsi8Cf2xBN87c6islpm8jofcLJzirOXvI2tQaJAy8cqUpO/1g
 Qulj+Oto1t5n+WRVK4IQZIbwf6L1HIEdEsZv6SlQrBJvxGoc0biA8tqDCu43SCCpAlud
 qsYcX4lJa/218bfLRWcJcBpvRmp2yd0tFlo6LZH4rCQ1cM06SsI5jnnPyirAd8egQ1R+
 eVAd5M85sPA6sg0qtIuxiZcwx5qeeL9EdvdCbkdoA8bbdA8NbxhKZUPy20BrdS+dSyx9
 rzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzRXIsj1+SAs1tNlnSNXJanvh8FrwUG7dToFo76pgso=;
 b=LFy/qaLFlAezzqAE/MxUZGZrHXofU5W1uEoRoTBQL/XL+ugy0JMYg2D+or1gxZ+lqR
 lPAViYr/t7CCrA0JHlDzMXuSF1QOiEQplOrriNinJ35l7Wm+p0GtOHLoOoJShgLU5tGO
 417J8c0SGveIamXwbs56GpO8Hkkw3sToYdG84V6/u6s5ks/pFJHtE/jM5/6+lz8tkywO
 uTAcCDcI9nwAgtuZIEpHH0pI5via1rk6UNUNljd5eDoFKUzrTlx+D0tJdI5rWPjRBWAj
 cZd4g5qFptS7OJWn0cwGVpKVLZTSnrFTQeOoJf2v2REG9ZJPOmyNYVC0MHjb61vWlZlF
 fVdQ==
X-Gm-Message-State: AOAM533tCdFAKNHzMdTJDfxFsp9bbTykzFA/kSTJ01YGn9+ju4cr4ZXs
 8V52i2hyvE/oulLje/YQbwlXXAxcPJ9fTz9IIl9RiA==
X-Google-Smtp-Source: ABdhPJxnSyniAwB6YYkeKPYxsQa+/C3NgF4fGYr1Y0yjfcIUeDxlK/6SOOMgIdqAj4vaOhHA3Dvuz8zhsjCp2po3Iwo=
X-Received: by 2002:a17:902:161:: with SMTP id
 88mr21097385plb.325.1596572306459; 
 Tue, 04 Aug 2020 13:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-11-brendanhiggins@google.com>
 <202006261436.DEF4906A5@keescook>
In-Reply-To: <202006261436.DEF4906A5@keescook>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Aug 2020 13:18:15 -0700
Message-ID: <CAFd5g47UYGByhbY+8-EuKDg7HBLGdF9fxsZACXAiTrJZC0kkAw@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] kunit: Add 'kunit_shutdown' option
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

On Fri, Jun 26, 2020 at 2:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:15PM -0700, Brendan Higgins wrote:
> > From: David Gow <davidgow@google.com>
> >
> > Add a new kernel command-line option, 'kunit_shutdown', which allows the
> > user to specify that the kernel poweroff, halt, or reboot after
> > completing all KUnit tests; this is very handy for running KUnit tests
> > on UML or a VM so that the UML/VM process exits cleanly immediately
> > after running all tests without needing a special initramfs.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  lib/kunit/executor.c                | 20 ++++++++++++++++++++
> >  tools/testing/kunit/kunit_kernel.py |  2 +-
> >  tools/testing/kunit/kunit_parser.py |  2 +-
> >  3 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> > index a95742a4ece73..38061d456afb2 100644
> > --- a/lib/kunit/executor.c
> > +++ b/lib/kunit/executor.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > +#include <linux/reboot.h>
> >  #include <kunit/test.h>
> >
> >  /*
> > @@ -11,6 +12,23 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
> >
> >  #if IS_BUILTIN(CONFIG_KUNIT)
> >
> > +static char *kunit_shutdown;
> > +core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
> > +
> > +static void kunit_handle_shutdown(void)
> > +{
> > +     if (!kunit_shutdown)
> > +             return;
> > +
> > +     if (!strcmp(kunit_shutdown, "poweroff"))
> > +             kernel_power_off();
> > +     else if (!strcmp(kunit_shutdown, "halt"))
> > +             kernel_halt();
> > +     else if (!strcmp(kunit_shutdown, "reboot"))
> > +             kernel_restart(NULL);
> > +
> > +}
>
> If you have patches that do something just before the initrd, and then
> you add more patches to shut down immediately after an initrd, people
> may ask you to just use an initrd instead of filling the kernel with
> these changes...
>
> I mean, I get it, but it's not hard to make an initrd that poke a sysctl
> to start the tests...
>
> In fact, you don't even need a initrd to poke sysctls these days.

True, but it is nice to not have to maintain an initramfs for each
architecture that you want to test. Still, I see your point. If we can
find a convenient way to distribute the needed dependencies for
running KUnit on each non-UML architecture then I think I can abandon
this change.

So how about this: I will drop this patch from this patchset and move
it up to the follow up patchset that adds multiarchitecture support to
kunit_tool. There we can address the problem of how to best track the
necessary dependencies including possibly intitramfss.
