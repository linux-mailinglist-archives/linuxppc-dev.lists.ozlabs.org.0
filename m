Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A7A44A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 15:47:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LHhk6vqxzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 23:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.195; helo=mail-qk1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LHdg0zxMzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 23:44:36 +1000 (AEST)
Received: by mail-qk1-f195.google.com with SMTP id f10so8701780qkg.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKQ0PtOpimerpfwUZQ0AVI+0q4zKx7NSCWvGQeyvj/E=;
 b=XML+sEM4C8opCgY6qG6upsT0hD1y3vDZWYMLtEvt9sRcK/ICprX6n+fjT0fl0lpb1l
 ZqHnllKPudPM4cAoIT+mxqXtm6HYHazfFywSz7X9WDWLjw+LcSUD7pmkjKmxY/4oMtpy
 h4uf5htUnR5f8F5vYmS2i9jI/JhHDGWWkN/ENlhIx6RUHP29zH7RmMfRAJh9WCOg+ci6
 LKDaAxJi6Q6oF9wT638q+P/In33cFdCQJmG/F6D7zGCzlPuGcctbAfGBtY/kqV7lgCTW
 VzlvQkZ+W+KNvbheFJhS2ZmoGGl8tq0l58ovuGm77GVpfzWuyKfOflpiHULudlqIG7du
 4VGg==
X-Gm-Message-State: APjAAAW4vUGLPdK3hg2A5tEM/S2ymS88I2PUNV0mTOvAm/YZTJvyU0jN
 uN1KvIn+qHbW9BbqAL8wDMh+5UvZFtC5bn+47o4=
X-Google-Smtp-Source: APXvYqzvQKLXv/QwTv79vw4xcoOPJdykiLQM5oAmOnHzltxqMEZES/cELbHD1aJ5HyP17Gf0brtSiNR2jm5vufNd1Ww=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr20263217qka.3.1567259072836; 
 Sat, 31 Aug 2019 06:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <bb6d25c6baae315d05b571d8c508f0e8fa90027c.1567188299.git.msuchanek@suse.de>
 <20190830194651.31043-1-msuchanek@suse.de>
 <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
 <20190831083849.GA24644@infradead.org>
In-Reply-To: <20190831083849.GA24644@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 31 Aug 2019 15:44:15 +0200
Message-ID: <CAK8P3a2xDT1FC-vA3S55_TYt_g+wZHHg4cCGLdWd=Sk7Hmg-bA@mail.gmail.com>
Subject: Re: [PATCH] Revert "asm-generic: Remove unneeded
 __ARCH_WANT_SYS_LLSEEK macro"
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian@brauner.io>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, Michal Suchanek <msuchanek@suse.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Chris Zankel <chris@zankel.net>, Nitesh Kataria <nitesh.kataria@linaro.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 31, 2019 at 10:39 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Aug 30, 2019 at 09:54:43PM +0200, Arnd Bergmann wrote:
> > > -#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> > > +#ifdef __ARCH_WANT_SYS_LLSEEK
> > >  SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high,
> > >                 unsigned long, offset_low, loff_t __user *, result,
> > >                 unsigned int, whence)
> >
> > However, only reverting the patch will now break all newly added
> > 32-bit architectures that don't define __ARCH_WANT_SYS_LLSEEK:
> > at least nds32 and riscv32 come to mind, not sure if there is another.
> >
> > I think the easiest way however would be to combine the two checks
> > above and make it
> >
> > #if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT) ||
> > defined(__ARCH_WANT_SYS_LLSEEK)
> >
> > and then only set __ARCH_WANT_SYS_LLSEEK for powerpc.
>
> I'd much rather introduce a CONFIG_SYS_LLSEEK Kconfig symbol, selected
> by CONFIG_64BIT and CONFIG_COMPAT by default, plus manually by powerpc.

The reason we currently use  __ARCH_WANT_SYS_* for all the other conditional
system calls is that these macros can be put into the uapi file for use by
include/uapi/asm/unistd.h, which is not possible with CONFIG_*
symbols.

This is not a problem for llseek, but it would be slightly inconsistent.

Nitesh is trying to convert include/uapi/asm/unistd.h into syscall.tbl format,
after that is done, we can probably change all the __ARCH_WANT_SYS_*
into config symbols.

       Arnd
