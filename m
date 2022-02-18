Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D94BB588
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 10:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0RBq3wcQz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 20:25:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sq4m3Dgo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sq4m3Dgo; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0RB92kmsz30Qq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 20:25:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47CCD61C7A
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D89CC340F4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645176319;
 bh=mMLLIykgh57Awf38lSwA8MWwDlZ8x8pcozF3MLrCnRg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sq4m3Dgo4gWgyVxTrIGW8PCTX4ye2wRDjntiwC1sV2Amlm/vMu+XNB1jESk+7PC32
 tszy9JzCEY//ujCoLQCrsK92mKLzyEge1dx2/R4Gy1Zs0d5yf4whvYuOVqPTNxWR/r
 4ncpylgSrdkiul2GiTrokXQ/sO85JURvv1y8jJjsuPhN9iM1KwRfv4GXsplWwm+9Zd
 LFcxiC4igD16VDiYF4b0rJqvVLEWrlWKePZZD32oLexgu9HQ+BYu0O7M2xb0MJHzsn
 jc0QSiHCRLZeSy1oiVnISFhpiIbzWbAorl6JRhqGcUfaow+2BCXUqm16W0MmplZW4/
 usLkIxy/wG5/A==
Received: by mail-wm1-f44.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso8126381wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:25:19 -0800 (PST)
X-Gm-Message-State: AOAM532gKnpfqMWhnX/MnUfIe+lDVrEQaFdQ6r5cELHoUbZ6IRXsJP+3
 AaE+dYl6kcPSE3pBbWsCQWYzuzbIDsooXlwKOzI=
X-Google-Smtp-Source: ABdhPJwrWpJqc0egLA12RwkumDKsH10yWoelsJ0RehwMogjvxHhR3UEotiD7Fxqib+HetrYJWhy8e0u55+IMdrLJwD4=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr9729968wms.82.1645176306970; Fri, 18
 Feb 2022 01:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
 <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 10:24:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] m68k: fix access_ok for coldfire
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 10:00 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> >  /* We let the MMU do all checking */
> > -static inline int access_ok(const void __user *addr,
> > +static inline int access_ok(const void __user *ptr,
> >                             unsigned long size)
> >  {
> > +       unsigned long limit = TASK_SIZE;
> > +       unsigned long addr = (unsigned long)ptr;
> > +
> >         /*
> >          * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
> >          * for TASK_SIZE!
> > +        * Removing this helper is probably sufficient.
> >          */
>
> Shouldn't the above comment block be removed completely,
> as this is now implemented below?

Yes, obviously. Fixed now.

> > -       return 1;
> > +       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
> > +               return 1;

I just noticed this should have the same change that I made for the
generic version, changed it now to

+       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES) ||
+           !IS_ENABLED(CONFIG_MMU))

This is gone again after the cleanup patch, when the generic version
is used instead.

> > +       return (size <= limit) && (addr <= (limit - size));
> >  }
>
> Any pesky compilers that warn (or worse with -Werror) about
> "condition always true" for TASK_SIZE = 0xFFFFFFFFUL?

No, using a local variable avoids this warning.

        Arnd
