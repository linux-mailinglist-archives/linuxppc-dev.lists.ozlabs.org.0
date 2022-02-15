Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D8E4B655A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 09:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyYh43ccgz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=su/tgX/P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=su/tgX/P; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyYgM0qfyz3bTS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:10:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 432F6615E7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA26AC36AE2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644912633;
 bh=SSSBFam0X7wa1ZiCw7Mbgc9666G5ScJGR2eDM1GsaRo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=su/tgX/Pf6DAuOvSKjs8FDN0CfBLee9I1b0B8T0UBjC2jO9pqn8CKB0Eq1FtCb4n/
 MDIGy89SMZjU5pR1c4liC7lJMIrwvZj+ONXiRlVtgLONOfDPOXzAAKaJzo9kxFOo5d
 wJrHUyScBcsRvgh+GY7F24Ke+exUGcssydi/sOoS/BOTxuSw0hwE/zZeYG2LgvUsRe
 c5Yn8cvAFAENKVz0Ku/EfwqJgn1ISH/jSi36pAiyPWcpPzOpN59HOJkjeUaLNubz4g
 +dTXaxYMCsUp0FF+CC2g2ryAiR/Pn6VDL/RtVIY3JFUOjC5sMuaH64woDgGkbMpGtg
 mq5H8fq/oyzHw==
Received: by mail-ej1-f44.google.com with SMTP id p14so18234770ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 00:10:33 -0800 (PST)
X-Gm-Message-State: AOAM531i1dU/1HnCUKCA9LmrbNKKVBVywCOeD9zPTNU33osQrw4rV5Jr
 CZxTJKQjfXFb/TE+Z0cq0XftJuAdDpzHBJdyVhU=
X-Google-Smtp-Source: ABdhPJykY+dvL+1GXmktnHDS2zXI387Vsr5YXEveY1d8rit1tT/hQTTS9CD1dDWxxX5ce3jmiS7RoOoUcfODSGZmbh0=
X-Received: by 2002:a5d:58d1:: with SMTP id o17mr2237862wrf.407.1644912621613; 
 Tue, 15 Feb 2022 00:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
 <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
 <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
In-Reply-To: <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 09:10:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
Subject: Re: [PATCH 14/14] uaccess: drop set_fs leftovers
To: Helge Deller <deller@gmx.de>
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
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
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
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 8:46 AM Helge Deller <deller@gmx.de> wrote:
>
> On 2/15/22 04:03, Al Viro wrote:
> > On Mon, Feb 14, 2022 at 05:34:52PM +0100, Arnd Bergmann wrote:
> >> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
> >> index b5835325d44b..2f4a1b1ef387 100644
> >> --- a/arch/parisc/include/asm/futex.h
> >> +++ b/arch/parisc/include/asm/futex.h
> >> @@ -99,7 +99,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> >>      /* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
> >>       * our gateway page, and causes no end of trouble...
> >>       */
> >> -    if (uaccess_kernel() && !uaddr)
> >> +    if (!uaddr)
> >>              return -EFAULT;
> >
> >       Huh?  uaccess_kernel() is removed since it becomes always false now,
> > so this looks odd.
> >
> >       AFAICS, the comment above that check refers to futex_detect_cmpxchg()
> > -> cmpxchg_futex_value_locked() -> futex_atomic_cmpxchg_inatomic() call chain.
> > Which had been gone since commit 3297481d688a (futex: Remove futex_cmpxchg
> > detection).  The comment *and* the check should've been killed off back
> > then.
> >       Let's make sure to get both now...
>
> Right. Arnd, can you drop this if() and the comment above it?

Done.

       Arnd
