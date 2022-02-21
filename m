Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C334BDA84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 16:23:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2R094bWqz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 02:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Missing IP4:
 193.174.2.0/24) smtp.helo=elvis.franken.de (client-ip=193.175.24.41;
 helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de;
 receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K2Qzg08L8z2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 02:23:09 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nMAWk-00025w-00; Mon, 21 Feb 2022 16:23:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 22D4EC25F8; Mon, 21 Feb 2022 16:21:30 +0100 (CET)
Date: Mon, 21 Feb 2022 16:21:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
Message-ID: <20220221152130.GA17373@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
 <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
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

On Mon, Feb 21, 2022 at 03:31:23PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 21, 2022 at 2:24 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> > >
> > > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > > index db9a8e002b62..d7c89dc3426c 100644
> >
> > this doesn't work. For every access above maximum implemented virtual address
> > space of the CPU an address error will be issued, but not a TLB miss.
> > And address error isn't able to handle this situation.
> 
> Ah, so the __ex_table entry only catches TLB misses?

no, but there is no __ex_table handling in address error hanlder (yet).

> Does this mean it also traps for kernel memory accesses, or do those
> work again?

it will trap for every access.


> If the addresses on mips64 are separate like on
> sparc64 or s390, the entire access_ok() step could be replaced
> by a fixup code in the exception handler. I suppose this depends on
> CONFIG_EVA and you still need a limit check at least when EVA is
> disabled.

only EVA has seperate address spaces for kernel/user.

> > Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> > for the 32bit case ?
> >
> 
> For 32-bit, the __UA_LIMIT is a compile-time constant, so the check
> ends up being trivial. On all other architectures, the same thing can
> be done after the set_fs removal, so I was hoping it would work here
> as well.

ic

> I suspect doing the generic (size <= limit) && (addr <= (limit - size))
> check on mips64 with the runtime limit ends up slightly slower
> than the current code that checks a bit mask instead. If you like,
> I'll update it this way, otherwise I'd need help in form of a patch
> that changes the exception handling so __get_user/__put_user
> also return -EFAULT for an address error.

that's what the patch does. For aligned accesses the patch should
do the right thing, but it breaks unaligned get_user/put_user.
Checking if the trapping vaddr is between end of CPU VM space and
TASK_MAX_SIZE before exception handling should do the trick. I'll
send a patch, if this works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
