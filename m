Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3D1B2B12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:23:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966l51HnszDqHP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4965nK0BgFzDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:39:46 +1000 (AEST)
Date: Tue, 21 Apr 2020 10:39:41 -0400
From: Rich Felker <dalias@libc.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200421143941.GJ11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 'Nicholas Piggin' <npiggin@gmail.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 12:28:25PM +0000, David Laight wrote:
> From: Nicholas Piggin
> > Sent: 20 April 2020 02:10
> ...
> > >> Yes, but does it really matter to optimize this specific usage case
> > >> for size? glibc, for instance, tries to leverage the syscall mechanism
> > >> by adding some complex pre-processor asm directives.  It optimizes
> > >> the syscall code size in most cases.  For instance, kill in static case
> > >> generates on x86_64:
> > >>
> > >> 0000000000000000 <__kill>:
> > >>    0:   b8 3e 00 00 00          mov    $0x3e,%eax
> > >>    5:   0f 05                   syscall
> > >>    7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
> > >>    d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
> 
> Hmmm... that cmp + jae is unnecessary here.

It's not.. Rather the objdump was just mistakenly done without -r so
it looks like a nop jump rather than a conditional tail call to the
function that sets errno.

> It is also a 32bit offset jump.
> I also suspect it gets predicted very badly.

I doubt that. This is a very standard idiom and the size of the offset
(which is necessarily 32-bit because it has a relocation on it) is
orthogonal to the condition on the jump.

FWIW a syscall like kill takes global kernel-side locks to be able to
address a target process by pid, and the rate of meaningful calls you
can make to it is very low (since it's bounded by time for target
process to act on the signal). Trying to optimize it for speed is
pointless, and even size isn't important locally (although in
aggregate, lots of wasted small size can add up to more pages = more
TLB entries = ...).

> > >>   13:   c3                      retq
> > >>
> > >> While on musl:
> > >>
> > >> 0000000000000000 <kill>:
> > >>    0:	48 83 ec 08          	sub    $0x8,%rsp
> > >>    4:	48 63 ff             	movslq %edi,%rdi
> > >>    7:	48 63 f6             	movslq %esi,%rsi
> > >>    a:	b8 3e 00 00 00       	mov    $0x3e,%eax
> > >>    f:	0f 05                	syscall
> > >>   11:	48 89 c7             	mov    %rax,%rdi
> > >>   14:	e8 00 00 00 00       	callq  19 <kill+0x19>
> > >>   19:	5a                   	pop    %rdx
> > >>   1a:	c3                   	retq
> > >
> > > Wow that's some extraordinarily bad codegen going on by gcc... The
> > > sign-extension is semantically needed and I don't see a good way
> > > around it (glibc's asm is kinda a hack taking advantage of kernel not
> > > looking at high bits, I think), but the gratuitous stack adjustment
> > > and refusal to generate a tail call isn't. I'll see if we can track
> > > down what's going on and get it fixed.
> 
> A suitable cast might get rid of the sign extension.
> Possibly just (unsigned int).

No, it won't. The problem is that there is no representation of the
fact that the kernel is only going to inspect the low 32 bits (by
declaring the kernel-side function as taking an int argument). The
external kill function receives arguments by the ABI, where the upper
bits of int args can contain junk, and the asm register constraints
for syscalls use longs (or rather an abstract syscall-arg type). It
wouldn't even work to have macro magic detect that the expressions
passed are ints and use hacks to avoid that, since it's perfectly
valid to pass an int to a syscall that expects a long argument (e.g.
offset to mmap), in which case it needs to be sign-extended.

The only way to avoid this is encoding somewhere the syscall-specific
knowledge of what arg size the kernel function expects. That's way too
much redundant effort and too error-prone for the incredibly miniscule
size benefit you'd get out of it.

Rich
