Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F34B675C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 10:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JybBb3dynz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KxuS+MXG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KxuS+MXG; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyb9x2bFNz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 20:18:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70B5F60A76
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 09:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467A4C340EC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916723;
 bh=auvbexz8OfCE17jezkrwExlxQUSMdLXG0OAD2bmLs8A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KxuS+MXGyT93bwm1F3n5t6L7s8XZ6iu0mZ2D3LY2EN+3Aco22AP9qXFro/PV+PSeY
 oMfyI7SeLeoRWWY6znQksIat5oHvm302T+mCH2sk2zICN7+XqbioFmiFAuteTgdeJV
 4nuEvNatRYg8PdTBe3w6oTRo6U6A0KA1oHI4/OosA1NsTPqimvvhu8QynGNL15OP0Y
 MLyigS2ZvbF4zMJOhl/apKzph0CzX2vmpgTqYFyjh78OGsVWUSES12w7IbkXqOxQLP
 Ob6iO5C5zDziXLo/264NyE6eBsxkMrDV5w4YmTy9De7U8ossl4OvwFSxvvQZ2Trahi
 E+BG1Zs709l8Q==
Received: by mail-ed1-f45.google.com with SMTP id z13so12736655edc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 01:18:43 -0800 (PST)
X-Gm-Message-State: AOAM532jHKUbSL9HL6dnB/YNQ/p96fwUcLjuPAz9WagTH0r/5m+NxHQ1
 PjRtII2pQAhFW2U4ttoxBP1rgG6riyVNB0Ak6Ao=
X-Google-Smtp-Source: ABdhPJytLoTfipZUwnG73E442/QjIxHnERGjQ2aeR9o7LjnpbatwjsLI+Mk7641j6VpHXtVWtwvDTIufUdUsOw5At+o=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr2390801wrv.12.1644916711299;
 Tue, 15 Feb 2022 01:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org>
 <YgqK1ihlJvRFHJ9h@infradead.org>
In-Reply-To: <YgqK1ihlJvRFHJ9h@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:18:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] nds32: fix access_ok() checks in get/put_user
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
 "# 3.4.x" <stable@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 6:01 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:41PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The get_user()/put_user() functions are meant to check for
> > access_ok(), while the __get_user()/__put_user() functions
> > don't.
> >
> > This broke in 4.19 for nds32, when it gained an extraneous
> > check in __get_user(), but lost the check it needs in
> > __put_user().
>
> Can we follow the lead of MIPS (which this was originally copied
> from I think) and kill the pointless __get/put_user_check wrapper
> that just obsfucate the code?

I had another look, but I think that would be a bigger change than
I want to have in a fix for stable backports, as nds32 also uses
the _check versions in __{get,put}_user_error.

If we instead clean it up in a separate patch, it should be done for
all eight architectures that do the same thing, but at that point,
the time seems better spent at coming up with a new set of
calling conventions that work with asm-goto.

         Arnd
