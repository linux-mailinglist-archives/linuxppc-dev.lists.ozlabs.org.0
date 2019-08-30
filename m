Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7FA3EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrLb1PvHzDq9L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:15:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrJf0HpBzDr2P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:13:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1BD59ACC3;
 Fri, 30 Aug 2019 20:13:18 +0000 (UTC)
Date: Fri, 30 Aug 2019 22:13:15 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Revert "asm-generic: Remove unneeded
 __ARCH_WANT_SYS_LLSEEK macro"
Message-ID: <20190830221315.4b3b8a74@kitsune.suse.cz>
In-Reply-To: <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
References: <bb6d25c6baae315d05b571d8c508f0e8fa90027c.1567188299.git.msuchanek@suse.de>
 <20190830194651.31043-1-msuchanek@suse.de>
 <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, linux-xtensa@linux-xtensa.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 21:54:43 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Aug 30, 2019 at 9:46 PM Michal Suchanek <msuchanek@suse.de> wrote:
> >
> > This reverts commit caf6f9c8a326cffd1d4b3ff3f1cfba75d159d70b.
> >
> > Maybe it was needed after all.
> >
> > When CONFIG_COMPAT is disabled on ppc64 the kernel does not build.
> >
> > There is resistance to both removing the llseek syscall from the 64bit
> > syscall tables and building the llseek interface unconditionally.
> >
> > Link: https://lore.kernel.org/lkml/20190828151552.GA16855@infradead.org/
> > Link: https://lore.kernel.org/lkml/20190829214319.498c7de2@naga/
> >
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>  
> 
> This seems like the right idea in principle.
> 
> > index 5bbf587f5bc1..2f3c4bb138c4 100644
> > --- a/fs/read_write.c
> > +++ b/fs/read_write.c
> > @@ -331,7 +331,7 @@ COMPAT_SYSCALL_DEFINE3(lseek, unsigned int, fd, compat_off_t, offset, unsigned i
> >  }
> >  #endif
> >
> > -#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> > +#ifdef __ARCH_WANT_SYS_LLSEEK
> >  SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high,
> >                 unsigned long, offset_low, loff_t __user *, result,
> >                 unsigned int, whence)  
> 
> However, only reverting the patch will now break all newly added
> 32-bit architectures that don't define __ARCH_WANT_SYS_LLSEEK:
> at least nds32 and riscv32 come to mind, not sure if there is another.

AFAICT nds32 never had the syscall. Its headers were added without
__ARCH_WANT_SYS_LLSEEK before the define was removed.

The new architecture csky should be handled.

> 
> I think the easiest way however would be to combine the two checks
> above and make it
> 
> #if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT) ||
> defined(__ARCH_WANT_SYS_LLSEEK)
> 
> and then only set __ARCH_WANT_SYS_LLSEEK for powerpc.

Yes, that limits the use of __ARCH_WANT_SYS_LLSEEK, does not require
resurrecting the old headers, and may fix some architectures like nds32
that forgot to add it.

Thanks

Michal
