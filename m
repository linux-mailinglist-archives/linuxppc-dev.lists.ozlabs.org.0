Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AAA4B6D38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 14:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyhV36HNRz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 00:18:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=en41RouE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=en41RouE; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyhTK4kHXz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 00:17:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB2A3B81977
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 13:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE23C340F2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644931038;
 bh=yV4ORJd5b6IZao4Zu1H2u9bAD/0nkvfeGMC8j+boEO0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=en41RouE/EA/f7wz63guGOJgQDzTzpSHu1gIzDlk0eh3+3mMTSAf00BnXMZlARt6s
 lMs/qZOv6PL6+MghQnSbA+7NV4vESrRm3svOh5B/rWCfo6LLtIapnoPyUEXNUCVUxZ
 SM5/eNjHSVB0faWLDASH4Z3RBCxDND/GXUOk0wBzYzTo35C9/bozc9mrIpu4PzzP4L
 vdJ0tSnn6vVBCH3McB/vLyXMNRN/hK/qgW/7ElOPsieLxNJU0DX0VVdQVgbX81UPGp
 543MNrYS2T69bw5l7VfHlP0ByvGETR6i+fo7tz93ZNH2MLTYoNKcSPZjc3aKvb3lb/
 rnqKGi4/pbe3g==
Received: by mail-wm1-f52.google.com with SMTP id n8so6477497wms.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 05:17:18 -0800 (PST)
X-Gm-Message-State: AOAM530ett0Lji73Bv7dZAPKZFwwFfcwzgFS+WwSv15SQYrzlUV/mIVC
 7pbhm1o9Aycg+mzfBcNlHqz6lrOVn8ud8jig4jE=
X-Google-Smtp-Source: ABdhPJzhbiTSvbv50mQWSJ7smaLZnr2q978YJ0F6+MeQ3SrwEp5s0NrkvRE5+WnWUVexqYiFblH5E9BGGqHgxsxWGyI=
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr3088436wmq.98.1644931026534; 
 Tue, 15 Feb 2022 05:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-6-arnd@kernel.org>
 <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 14:16:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
Subject: Re: [PATCH 05/14] uaccess: add generic __{get,put}_kernel_nofault
To: Al Viro <viro@zeniv.linux.org.uk>
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
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 1:31 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:43PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > All architectures that don't provide __{get,put}_kernel_nofault() yet
> > can implement this on top of __{get,put}_user.
> >
> > Add a generic version that lets everything use the normal
> > copy_{from,to}_kernel_nofault() code based on these, removing the last
> > use of get_fs()/set_fs() from architecture-independent code.
>
> I'd put the list of those architectures (AFAICS, that's alpha, ia64,
> microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa) into commit
> message - it's not that hard to find out, but...

done.

> And AFAICS, you've missed nios2 - see
> #define __put_user(x, ptr) put_user(x, ptr)
> in there.  nds32 oddities are dealt with earlier in the series, this
> one is not...

Ok, fixed my bug in nios2 __put_user() as well now. This one is not nearly
as bad as nds32, at least without my patches it should work as expected.

Unfortunately I also noticed that __get_user() on microblaze and nios2
is completely broken for 64-bit arguments, where these copy eight bytes
into a four byte buffer. I'll try to come up with a fix for this as well then.

         Arnd
