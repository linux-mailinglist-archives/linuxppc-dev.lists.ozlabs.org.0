Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 917944B5AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyF9L1Cr1z3cVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:47:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TI55dNwj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TI55dNwj; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyF8c5311z2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 06:46:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64773B81257
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 19:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5B0C340E9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 19:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644867980;
 bh=kZ0Ha+ZttRWbRYErkpKyuJC1dyK+QrO2i6Uu5KgHMvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TI55dNwjd34X3cSV/R8wDeTsb/jSwyQlCZyHL8eu7Ic1oIyOUVL+4rSQVgDcoP8Sj
 1PVP/2FxK28M6D6pl5spQ8ViEdjm0asBiIQ3QaGMRSNGXtdQwYM0C1pyauS+768E7z
 /7ozMU3ZgPrBst3JRTF6f4wLTGM0Y2MXaeKVBAVqNtdt1rwDh6l/uj/fP+2o65aVwU
 DK4OU3Cu8+XjClTput1qYc3H4kir+aqyouyEftPTymyGX5nkytf3U4k4kODfZt5krg
 f2J2BVoV77x29P9gcslC02lh0sSCMwpso6r1gtaCVIUlvY0e+uOPgwPCjSsCIMFRg4
 daQLLHhhTNb0g==
Received: by mail-ej1-f47.google.com with SMTP id jg20so14721181ejc.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 11:46:20 -0800 (PST)
X-Gm-Message-State: AOAM530HLNICShRRuO7Y6/EoQHyybjfeabWMPPpto2vQe8qbWbWxYqVw
 mB9iiCkZYI/aRhZXkE/7RGwXRctumV1dVHk4bGc=
X-Google-Smtp-Source: ABdhPJyfeYwWpAfp1t9O1z8BIiteD6oMiQUhUFLNHvAQyjgPbxD0FyJauHtAzbL5TNr8UyIGWRM1U9VPuoeyXIyyYo0=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr445399wrp.219.1644867968239; 
 Mon, 14 Feb 2022 11:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
In-Reply-To: <YgqLFYqIqkIsNC92@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:45:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To: Christoph Hellwig <hch@infradead.org>
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
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 6:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:42PM +0100, Arnd Bergmann wrote:
> > +#define __range_not_ok(addr, size, limit)    (!__access_ok(addr, size))
> > +#define __chk_range_not_ok(addr, size, limit)        (!__access_ok((void __user *)addr, size))
>
> Can we just kill these off insted of letting themm obsfucate the code?

As Al pointed out, they turned out to be necessary on sparc64, but the only
definitions are on sparc64 and x86, so it's possible that they serve a similar
purpose here, in which case changing the limit from TASK_SIZE to
TASK_SIZE_MAX is probably wrong as well.

So either I need to revert the original definition as I did on sparc64, or
they can be removed completely. Hopefully Al or the x86 maintainers
can clarify.

         Arnd
