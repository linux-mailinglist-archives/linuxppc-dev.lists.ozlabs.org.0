Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EF478CAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 14:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFr1S51LNz3cbR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 00:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JFr0q5FF5z3cN7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 00:48:26 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1BHDZQmf021580;
 Fri, 17 Dec 2021 07:35:26 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1BHDZJZQ021573;
 Fri, 17 Dec 2021 07:35:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 17 Dec 2021 07:35:18 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
Message-ID: <20211217133518.GR614@gate.crashing.org>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
 <20211216185620.GP614@gate.crashing.org>
 <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonas Bonn <jonas@southpole.se>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Stafford Horne <shorne@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@kernel.org>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17, 2021 at 12:34:53PM +0000, David Laight wrote:
> From: Segher Boessenkool
> > Sent: 16 December 2021 18:56
> ...
> > > The only remaining problem here is reinterpreting a char* pointer to a
> > > u32*, e.g., for accessing the IP address in an Ethernet frame when
> > > NET_IP_ALIGN == 2, which could suffer from the same UB problem again,
> > > as I understand it.
> > 
> > The problem is never casting a pointer to pointer to character type, and
> > then later back to an appriopriate pointer type.
> > These things are both required to work.
> 
> I think that is true of 'void *', not 'char *'.

No, see 6.3.2.3/7.  Both are allowed (and behave the same in fact).

> 'char' is special in that 'strict aliasing' doesn't apply to it.
> (Which is actually a pain sometimes.)

That has nothing to do with it.  Yes, you can validly access any memory
as a character type, but that has nothing to do with what pointer casts
are allowed and which are not.

> > The problem always is accessing something as if it
> > was something of another type, which is not valid C.  This however is
> > exactly what -fno-strict-aliasing allows, so that works as well.
> 
> IIRC the C language only allows you to have pointers to valid data items.
> (Since they can only be generated by the & operator on a valid item.)

Not so.  For example you are explicitly allowed to have pointers one
past the last element of an array (and do arithmetic on that!), and of
course null pointers are a thing.

C allows you to make up pointers from integers as well.  This is
perfectly fine to do.  Accessing anything via such pointers might well
be not standard C, of course.

> Indirecting any other pointer is probably UB!

If a pointer points to an object, indirecting it gives an lvalue of that
object.  It does not matter how you got that pointer, all that matters
is that it points at a valid object.

> This (sort of) allows the compiler to 'look through' casts to find
> what the actual type is (or might be).
> It can then use that information to make optimisation choices.
> This has caused grief with memcpy() calls that are trying to copy
> a structure that the coder knows is misaligned to an aligned buffer.

This is 6.5/7.

Alignment is 6.2.8 but it doesn't actually come into play at all here.

> So while *(unaligned_ptr *)char_ptr probably has to work.

Only if the original pointer points to an object that is correct
(including correctly aligned) for such an lvalue.

> If the compiler can see *(unaligned_ptr *)(char *)int_ptr it can
> assume the alignment of the 'int_ptr' and do a single aligned access.

It is undefined behaviour to have an address in int_ptr that is not
correctly aligned for whatever type it points to.


Segher
