Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA51B1C2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:51:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495p3r5jfNzDr6t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495p265FSZzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:49:50 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jQiyN-007Fkh-1u; Tue, 21 Apr 2020 02:49:19 +0000
Date: Tue, 21 Apr 2020 03:49:19 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 5/5] uaccess: Rename user_access_begin/end() to
 user_full_access_begin/end()
Message-ID: <20200421024919.GA23230@ZenIV.linux.org.uk>
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
 <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
 <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
 <20200403205205.GK23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403205205.GK23230@ZenIV.linux.org.uk>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Peter Anvin <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[rmk Cc'd]
On Fri, Apr 03, 2020 at 09:52:05PM +0100, Al Viro wrote:

> I can do a 5.7-rc1-based branch with that; depending upon what we end
> up doing for arm and s390 we can always change the calling conventions
> come next cycle ;-/
> 
> My impressions after digging through arm side of things:
> 
> 1) the only instance of nesting I'd found there (so far) is a mistake.
> The rule should be "no fucking nesting, TYVM".

OK, after quite a bit of digging:
	1) everything outside of arm is quite happy with not passing
anything to user_access_end().  s390 is a red herring in that respect.
	2) on arm we definitely can get rid of nesting.  However,
there are some unpleasant sides of the logics in there.  What we have
is an MMU register; everything except for two 2bit fields in it is
constant.  One of those fields is a function of get_fs(), another might
serve an analogue of x86 EFLAGS.AC.  Rules:

	DACR.USER is 0 if CONFIG_SW_DOMAIN_PAN is enabled and we are
*not* in uaccess section; otherwise it's 1.
	DACR.KERNEL is 3 if CONFIG_USE_DOMAINS is enabled and we are
under KERNEL_DS; otherwise it's 1.

[USE_DOMAINS is forced to "yes" on v5 and earlier, configurable on v6+]
[SW_DOMAIN_PAN is forced to "no" on v7 if we want support of huge physical
space, configurable with default to "yes" otherwise]

	On entry into kernel we get into USER_DS state before we get
out of asm glue.  Original settings are restored on return.  That goes
both for ->addr_limit (get_fs() value) and for DACR.KERNEL contents.
DACR.USER ("uaccess allowed") is switched to "disabled" state before
we reach C code and restored on return from kernel.

	The costs are interesting; setting the register is costly, in
the same manner STAC/CLAC is.  Reading it... hell knows; I don't see any
explicit information about that.  As it is, both set_fs() and starting
uaccess block (uaccess_save_and_enable() - the thing that would've
gone into user_access_begin()) do both read and write to register; with
minimal massage we could get rid of reading the damn thing in set_fs().
user_access_end() candidate does a plain write to register, with value
kept around since the beginning of uaccess block.

	*IF* read from that register is cheap, we can trivially get rid
of passing the cookie there - it's a matter of reading the register
and clearing one bit in it before writing it back.  If that is costly,
though...  We can easily calculate it from ->addr_limit, which we already
have in cache at that point, or will need shortly anyway.  In that
case it would probably make sense to do the same to user_access_begin()
and set_fs().  Note that I'm not suggesting to do anything of that sort
in switch_to() - existing mechanism doesn't need any changes, and neither
does the asm glue in entry*.S.

	The only source I'd been able to find speeks of >= 60 cycles
(and possibly much more) for non-pipelined coprocessor instructions;
the list of such does contain loads and stores to a bunch of registers.
However, the register in question (p15/c3) has only store mentioned there,
so loads might be cheap; no obvious reasons for those to be slow.
That's a question to arm folks, I'm afraid...  rmk?

	Note that we can keep the current variant (i.e.
user_access_begin() being just the check for access_ok(), user_access_end()
being empty and uaccess_save_and_enable()/uaccess_restore() done manually
inside the primitives); after all, a lot of architectures don't _have_
anything of that sort.  It's just that decisions regarding the calling
conventions for these primitives will be much harder to change later on...

	Again, arm (32bit one) is the only architectures that has something
of that sort and needs to pass cookie from beginning to the end of uaccess
blocks.  Everything else splits into several classes:

1) has MMU, shared address space for kernel/userland, no stac analogues.
        alpha, arc, csky, hexagon, itanic, nds32, nios32, openrisc, sh,
        sparc32, unicore32, xtensa/MMU, microblaze/MMU, mips/MMU,
        m68k/MMU/COLDFIRE.
No way to do anything other than plain access_ok() for user_access_begin().

2) has MMU, shared address space for kernel/userland, has stac analogue,
possibly with separate "for read" and "for write" variants.  Can live
without passing any cookies.
        arm64, powerpc, riscv, x86
Current variant with changes in this patchset covers those.

3) non-MMU, uses memcpy() for everything, or at least ought to:
        c6x, h8300, m68k/!MMU, xtensa/!MMU(?), microblaze/!MMU(?), mips/!MMU(?),
        arm/!MMU
No memory protection of any sort...

4) sparc-like: MMU, separate address spaces for userland and kernel,
has explicit insns for uaccess + some register(s) to choose what those
insns actually hit.
        sparc64, parisc, m68k/MMU/!COLDFIRE
No stac/clac analogue would make sense.

5) s390: weird one - there is an stac analogue as far the hardware is
        concerned, but it can't be separated from inline asm where
        actual uaccess insns are.  From the kernel POV it's sparc-like.
Nothing that would reasonably map to user_access_begin/user_access_end

6) um: no uaccess, in a sense of dereferencing non-kernel pointers.  What
it does is simulation of page table walk + explicit call of #PF handler
on missing pages + kmap_atomic() to get a kernel alias.
