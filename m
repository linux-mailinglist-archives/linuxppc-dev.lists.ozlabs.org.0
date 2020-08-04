Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A214523C079
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLm2d07F4zDqXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BOdgCj/x; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLm0l2n1ZzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 06:03:51 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id f5so5762356pgg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1tyCti51MVo3/kuT1rPkqCk0xB52TNyjHHa6DSwsUNE=;
 b=BOdgCj/xpXMzUyWMGEdpzY6ZsQLT6U1zlPfAPITO0x8Q+IA84yaBeEIndq7bl+FiEy
 rVofD3aSCUoec+wrpHeiogm589AaN3VpZbkBQE7NZqI5FvytwjB1Yp60483xaA3xgLMO
 UBDpAP3zTIiNlOsPu1N3gKftDScSUUWDQ9W6XxffoSYkTrJT2kheOv9byV5yy13NmLug
 UQheG5KFf+dFlxyd3rFo+P3YzwT2ZhDOtcHr1ctJzHc/7NQO06/W4jyKBRbGazVz/3I3
 IJiBkJKghWCr6TKL1uBvZlfxIjBG91lq+/qNadwzNsbGIKychykGD6Lcoc2mCDM5fqhc
 bcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1tyCti51MVo3/kuT1rPkqCk0xB52TNyjHHa6DSwsUNE=;
 b=erZenST2CzZddRKsS0XziRc/cpYkuJiKQTdU7R+U+ln85OkVaK3GsPj2+BvUiNnnON
 ekRO+DGeWnh+VvXkRLBXRjpcbVZqyuyVCD0B6imh8t5WTW1hiJV4IMgZgkD8k1wfZfyG
 w6OQHqs5vIvr5dn78OmjJ59FRhT6FKMDa0fGkRt13jify17o3wPVMoKugZusty9N1E2l
 1yHYgPFJgAFKsCgTD3TJIrP9WEQ9hG3tkSSREjteaCrRjn2ov1asLyokmOvVJUD1kPa2
 SiNamfxQtf84UtidPonpnhfDe1wDI1uCxAXn7BBCWRgeI+aY5yiKQJXM1K992pXOnFZH
 JtKA==
X-Gm-Message-State: AOAM531J+fXNvKuwPfRueEg+Vy5kOZOKDD57UULVHA+dBdsA21UZ/vk3
 DheMbwomaOQenaev2VoLj/7Iz8HIJrgglriPgACkDg==
X-Google-Smtp-Source: ABdhPJy+MBYkgA2v8x4+gwT9U43GgNgeh+L0qXB/DHG00vCnQTifheBrsiLPSxqExmeMgwXHXtu3Iucv1z/JFuZl1PU=
X-Received: by 2002:aa7:9e45:: with SMTP id z5mr54937pfq.166.1596571426459;
 Tue, 04 Aug 2020 13:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-2-brendanhiggins@google.com>
 <202006261416.F4EAAE47E3@keescook>
 <CAFd5g47vu5vmrXnS0sLu+hdC2HmYz7GY82sE8rhcHfNkuC1NRw@mail.gmail.com>
 <20200708043128.GY4332@42.do-not-panic.com>
In-Reply-To: <20200708043128.GY4332@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Aug 2020 13:03:35 -0700
Message-ID: <CAFd5g45vE7CvgEKYNJeLUiyZb=6Ps52nSqQPJ35+EyC7Y3wkdw@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit test
 suites
To: Luis Chamberlain <mcgrof@kernel.org>
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
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alan Maguire <alan.maguire@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 7, 2020 at 9:31 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:22:11PM -0700, Brendan Higgins wrote:
> > On Fri, Jun 26, 2020 at 2:20 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Fri, Jun 26, 2020 at 02:09:06PM -0700, Brendan Higgins wrote:
> > > > Add a linker section where KUnit can put references to its test suites.
> > > > This patch is the first step in transitioning to dispatching all KUnit
> > > > tests from a centralized executor rather than having each as its own
> > > > separate late_initcall.
> > > >
> > > > Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> > > > Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > > > ---
> > > >  include/asm-generic/vmlinux.lds.h | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > > > index db600ef218d7d..4f9b036fc9616 100644
> > > > --- a/include/asm-generic/vmlinux.lds.h
> > > > +++ b/include/asm-generic/vmlinux.lds.h
> > > > @@ -881,6 +881,13 @@
> > > >               KEEP(*(.con_initcall.init))                             \
> > > >               __con_initcall_end = .;
> > > >
> > > > +/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
> > >
> > > Nit on naming:
> > >
> > > > +#define KUNIT_TEST_SUITES                                            \
> > >
> > > I would call this KUNIT_TABLE to maintain the same names as other things
> > > of this nature.
> > >
> > > > +             . = ALIGN(8);                                           \
> > > > +             __kunit_suites_start = .;                               \
> > > > +             KEEP(*(.kunit_test_suites))                             \
> > > > +             __kunit_suites_end = .;
> > > > +
> > > >  #ifdef CONFIG_BLK_DEV_INITRD
> > > >  #define INIT_RAM_FS                                                  \
> > > >       . = ALIGN(4);                                                   \
> > > > @@ -1056,6 +1063,7 @@
> > > >               INIT_CALLS                                              \
> > > >               CON_INITCALL                                            \
> > > >               INIT_RAM_FS                                             \
> > > > +             KUNIT_TEST_SUITES                                       \
> > > >       }
> > >
> > > Nack: this must be in INIT_DATA, not in INIT_DATA_SECTION. Not all
> > > architectures use the INIT_DATA_SECTION macro (e.g. arm64), but everything
> > > uses INIT_DATA.
> >
> > Oh, maybe that would eliminate the need for the other linkerscript
> > patches? That would be nice.

Sorry for the delayed response. I got pulled into some other things.

> Curious, did changing it as Kees suggest fix it for m68k?

It did! There are still some architectures I cannot test due to a lack
of GCC or QEMU support, but it seems to work on everything else now.
