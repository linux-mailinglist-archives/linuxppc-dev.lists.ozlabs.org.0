Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3E20BBC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:44:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tr4J2JqvzDqys
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TFElbCjp; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqbQ4QlgzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:22:26 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j12so5146233pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPaM2QLp1Lnyo/tFOjZRrBK9GEiSK4tLpveqTF1QTWw=;
 b=TFElbCjpLxOIFHGP0g+klWMfLi0l2Mun3MxomGTHA0v9jh/9cfSmaHKqFtA4RT6jRm
 4xzaHn3a057w+xMpnbwSdQNls0bvhcqTTFxuifRkxMCIho8BIk5JWH0r+EJJml6d8S5N
 IsXJvYxj2SL3HF4o5D1uBwhALv9jY3C3tWulumPnGm8T4x7r1RmHVZS5Ug2DclvsP0xR
 sFOIwsCxvF6aV1Nj1SOAJunuK7BRTUwezp0PPzwRLdniCcRaiK5RCcSn7cJhUKWnHoFm
 wpmGYvCAqzTEprPMaK7A1ERbYa7IUuNMzW2ZkRudy2BcDJa9pWbc0YGeu0tzrYO4kW1e
 IXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPaM2QLp1Lnyo/tFOjZRrBK9GEiSK4tLpveqTF1QTWw=;
 b=jbMtjEWGlpyql/+mKeLz2YnwsMlTnYdRMu6cJ+LffzicwWnqBaY6q2HAAWLC2TFXXO
 y1FgAOb6vRheVWxw2oV2V/3jXMSnE4gpl780yPnZlo8r4sDWQ9XP8YRM6zYY6SKct1KR
 axkwtPhkn4Puge0OjbsJV506oqZN71bO/pMnpBkQ/KpKSmAwN12YHsK/zHIWbIYI3RMF
 EZVbI/RHAY4pknh/N5jqnnhQurRdE7T2X7aMRlDJREsbagVbJhKdD9FquBoAfBRmCglH
 QQHo4gs8hzpMAfgtDSpaZyh24VaD7rYkHnqlVOfnWOcnk189BJ3f1qAs28ye9/XlvMw2
 ij3w==
X-Gm-Message-State: AOAM532+zOYX5aYLc+emESCJjZw6be5w9A2XWJpA8iwqUUiTxKC7STX5
 KyoaAM7+catCEVjdRVqWggX9Jbd6/Qu7vQzJrFWm2g==
X-Google-Smtp-Source: ABdhPJxiKEYutNObsmIBYphNH4Rjrm9h5SZbvVD0vbhM3XAclfw4B+ryQw8//QlKHbH2sO6uKDOQuVwPIVH3OMEUjA0=
X-Received: by 2002:a63:d501:: with SMTP id c1mr631501pgg.159.1593206542565;
 Fri, 26 Jun 2020 14:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-2-brendanhiggins@google.com>
 <202006261416.F4EAAE47E3@keescook>
In-Reply-To: <202006261416.F4EAAE47E3@keescook>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 26 Jun 2020 14:22:11 -0700
Message-ID: <CAFd5g47vu5vmrXnS0sLu+hdC2HmYz7GY82sE8rhcHfNkuC1NRw@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit test
 suites
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
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org, paulus@samba.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>, chris@zankel.net,
 monstr@monstr.eu, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 2:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:06PM -0700, Brendan Higgins wrote:
> > Add a linker section where KUnit can put references to its test suites.
> > This patch is the first step in transitioning to dispatching all KUnit
> > tests from a centralized executor rather than having each as its own
> > separate late_initcall.
> >
> > Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> > Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index db600ef218d7d..4f9b036fc9616 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -881,6 +881,13 @@
> >               KEEP(*(.con_initcall.init))                             \
> >               __con_initcall_end = .;
> >
> > +/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
>
> Nit on naming:
>
> > +#define KUNIT_TEST_SUITES                                            \
>
> I would call this KUNIT_TABLE to maintain the same names as other things
> of this nature.
>
> > +             . = ALIGN(8);                                           \
> > +             __kunit_suites_start = .;                               \
> > +             KEEP(*(.kunit_test_suites))                             \
> > +             __kunit_suites_end = .;
> > +
> >  #ifdef CONFIG_BLK_DEV_INITRD
> >  #define INIT_RAM_FS                                                  \
> >       . = ALIGN(4);                                                   \
> > @@ -1056,6 +1063,7 @@
> >               INIT_CALLS                                              \
> >               CON_INITCALL                                            \
> >               INIT_RAM_FS                                             \
> > +             KUNIT_TEST_SUITES                                       \
> >       }
>
> Nack: this must be in INIT_DATA, not in INIT_DATA_SECTION. Not all
> architectures use the INIT_DATA_SECTION macro (e.g. arm64), but everything
> uses INIT_DATA.

Oh, maybe that would eliminate the need for the other linkerscript
patches? That would be nice.

Alright, will fix.
