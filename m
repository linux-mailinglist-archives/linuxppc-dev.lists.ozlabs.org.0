Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B38217E65
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:33:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1mdF4m9RzDr27
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.194;
 helo=mail-pf1-f194.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1mbW0z9PzDqw0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:31:32 +1000 (AEST)
Received: by mail-pf1-f194.google.com with SMTP id z3so10109501pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 21:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w74eNERLG2pgyjUdSRcYW9SUoyc7gG8Z+LPaMqm+zH4=;
 b=nq2uutGielqEygv+Vpjv98RtcEBi+psOwFAzQaUcWpJBsIaFPNhAtVHXPIGG7rAASN
 OkZuRM47bzJhkB3kBUDXkOSOSLcN6z1/Bu8MKI1Cs0L3BSDPqsNkLJ5fX7p7VXuFG1my
 83ScxPJI5O+N34O/lXcoSF4bZQ2O8LVm2xadimjayjdIHPGqRj/MmDMCi0LlQSV/7Jwg
 YronBYyoOmmZ0ePYzgBy3NSDq5Ag8rvYejr8WT26Oh2i1l+uIgZeUDUVf2EL670kYPPo
 3F/86xSHc493ODFhG9lx/qtTmVqKMnqsrowzSzci8qBv+95qGC4Iv4adV8gHJEaG0Lxt
 SXqA==
X-Gm-Message-State: AOAM530UkSlFD8iNZXnKC6bAAvrLynMvo/ZjjtSRVmW4q8j8jOwR7GlU
 d8PeULjKtJC3TqXvx03iX2I=
X-Google-Smtp-Source: ABdhPJxHZU8n57bHyUA87/h7IOAVFo14RjremkjbHa0piNVeEl4DjqKtxGu5JTtc4Tf00fVU/dHDDQ==
X-Received: by 2002:a05:6a00:2c1:: with SMTP id
 b1mr40074651pft.159.1594182690346; 
 Tue, 07 Jul 2020 21:31:30 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id w9sm3745302pja.39.2020.07.07.21.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 21:31:29 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id A30C1400DB; Wed,  8 Jul 2020 04:31:28 +0000 (UTC)
Date: Wed, 8 Jul 2020 04:31:28 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit
 test suites
Message-ID: <20200708043128.GY4332@42.do-not-panic.com>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-2-brendanhiggins@google.com>
 <202006261416.F4EAAE47E3@keescook>
 <CAFd5g47vu5vmrXnS0sLu+hdC2HmYz7GY82sE8rhcHfNkuC1NRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFd5g47vu5vmrXnS0sLu+hdC2HmYz7GY82sE8rhcHfNkuC1NRw@mail.gmail.com>
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
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org, paulus@samba.org,
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
 KUnit Development <kunit-dev@googlegroups.com>, chris@zankel.net,
 monstr@monstr.eu, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alan Maguire <alan.maguire@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:22:11PM -0700, Brendan Higgins wrote:
> On Fri, Jun 26, 2020 at 2:20 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Jun 26, 2020 at 02:09:06PM -0700, Brendan Higgins wrote:
> > > Add a linker section where KUnit can put references to its test suites.
> > > This patch is the first step in transitioning to dispatching all KUnit
> > > tests from a centralized executor rather than having each as its own
> > > separate late_initcall.
> > >
> > > Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> > > Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > > ---
> > >  include/asm-generic/vmlinux.lds.h | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > > index db600ef218d7d..4f9b036fc9616 100644
> > > --- a/include/asm-generic/vmlinux.lds.h
> > > +++ b/include/asm-generic/vmlinux.lds.h
> > > @@ -881,6 +881,13 @@
> > >               KEEP(*(.con_initcall.init))                             \
> > >               __con_initcall_end = .;
> > >
> > > +/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
> >
> > Nit on naming:
> >
> > > +#define KUNIT_TEST_SUITES                                            \
> >
> > I would call this KUNIT_TABLE to maintain the same names as other things
> > of this nature.
> >
> > > +             . = ALIGN(8);                                           \
> > > +             __kunit_suites_start = .;                               \
> > > +             KEEP(*(.kunit_test_suites))                             \
> > > +             __kunit_suites_end = .;
> > > +
> > >  #ifdef CONFIG_BLK_DEV_INITRD
> > >  #define INIT_RAM_FS                                                  \
> > >       . = ALIGN(4);                                                   \
> > > @@ -1056,6 +1063,7 @@
> > >               INIT_CALLS                                              \
> > >               CON_INITCALL                                            \
> > >               INIT_RAM_FS                                             \
> > > +             KUNIT_TEST_SUITES                                       \
> > >       }
> >
> > Nack: this must be in INIT_DATA, not in INIT_DATA_SECTION. Not all
> > architectures use the INIT_DATA_SECTION macro (e.g. arm64), but everything
> > uses INIT_DATA.
> 
> Oh, maybe that would eliminate the need for the other linkerscript
> patches? That would be nice.

Curious, did changing it as Kees suggest fix it for m68k?

  Luis
