Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63F11CA48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 11:10:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YV0P1pZHzDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 21:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="to/x3BzM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YTyD5y5qzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 21:08:04 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AC8C22B48;
 Thu, 12 Dec 2019 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576145282;
 bh=8oMGWZ4X5eA0CJO5Djd99i+IOL5EsEg13Vf8WiNVrk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=to/x3BzMP75kgcqYnhNo7MpRT3Yjg7ArR3k/uhqgmx1WmoBWQUC07i/so0ToXoYbR
 bgM7dtoIqrWrzghk3LxH3nXGLy/b9nIIJF7ZvGf1A+SHKFlGKXgyCmtRnc0L8Uo/rN
 CbEdG0AEDN12X1lwHAh9IeDw1TWI2RDws6lqWZpY=
Date: Thu, 12 Dec 2019 10:07:56 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191212100756.GA11317@willie-the-truck>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212080105.GV2844@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 09:01:05AM +0100, Peter Zijlstra wrote:
> On Thu, Dec 12, 2019 at 04:42:13PM +1100, Michael Ellerman wrote:
> > Peter Zijlstra <peterz@infradead.org> writes:
> > > On Fri, Dec 06, 2019 at 11:46:11PM +1100, Michael Ellerman wrote:
> > Some of the generic versions don't generate good code compared to our
> > versions, but that's because READ_ONCE() is triggering stack protector
> > to be enabled.
> 
> Bah, there's never anything simple, is there :/
> 
> > For example, comparing an out-of-line copy of the generic and ppc
> > versions of test_and_set_bit_lock():
> > 
> >    1 <generic_test_and_set_bit_lock>:           1 <ppc_test_and_set_bit_lock>:
> >    2         addis   r2,r12,361
> >    3         addi    r2,r2,-4240
> >    4         stdu    r1,-48(r1)
> >    5         rlwinm  r8,r3,29,3,28
> >    6         clrlwi  r10,r3,26                   2         rldicl  r10,r3,58,6
> >    7         ld      r9,3320(r13)
> >    8         std     r9,40(r1)
> >    9         li      r9,0
> >   10         li      r9,1                        3         li      r9,1
> >                                                  4         clrlwi  r3,r3,26
> >                                                  5         rldicr  r10,r10,3,60
> >   11         sld     r9,r9,r10                   6         sld     r3,r9,r3
> >   12         add     r10,r4,r8                   7         add     r4,r4,r10
> >   13         ldx     r8,r4,r8
> >   14         and.    r8,r9,r8
> >   15         bne     34f
> >   16         ldarx   r7,0,r10                    8         ldarx   r9,0,r4,1
> >   17         or      r8,r9,r7                    9         or      r10,r9,r3
> >   18         stdcx.  r8,0,r10                   10         stdcx.  r10,0,r4
> >   19         bne-    16b                        11         bne-    8b
> >   20         isync                              12         isync
> >   21         and     r9,r7,r9                   13         and     r3,r3,r9
> >   22         addic   r7,r9,-1                   14         addic   r9,r3,-1
> >   23         subfe   r7,r7,r9                   15         subfe   r3,r9,r3
> >   24         ld      r9,40(r1)
> >   25         ld      r10,3320(r13)
> >   26         xor.    r9,r9,r10
> >   27         li      r10,0
> >   28         mr      r3,r7
> >   29         bne     36f
> >   30         addi    r1,r1,48
> >   31         blr                                16         blr
> >   32         nop
> >   33         nop
> >   34         li      r7,1
> >   35         b       24b
> >   36         mflr    r0
> >   37         std     r0,64(r1)
> >   38         bl      <__stack_chk_fail+0x8>
> > 
> > 
> > If you squint, the generated code for the actual logic is pretty similar, but
> > the stack protector gunk makes a big mess. It's particularly bad here
> > because the ppc version doesn't even need a stack frame.
> > 
> > I've also confirmed that even when test_and_set_bit_lock() is inlined
> > into an actual call site the stack protector logic still triggers.
> 
> > If I change the READ_ONCE() in test_and_set_bit_lock():
> > 
> > 	if (READ_ONCE(*p) & mask)
> > 		return 1;
> > 
> > to a regular pointer access:
> > 
> > 	if (*p & mask)
> > 		return 1;
> > 
> > Then the generated code looks more or less the same, except for the extra early
> > return in the generic version of test_and_set_bit_lock(), and different handling
> > of the return code by the compiler.
> 
> So given that the function signature is:
> 
> static inline int test_and_set_bit_lock(unsigned int nr,
> 					volatile unsigned long *p)
> 
> @p already carries the required volatile qualifier, so READ_ONCE() does
> not add anything here (except for easier to read code and poor code
> generation).
> 
> So your proposed change _should_ be fine. Will, I'm assuming you never
> saw this on your ARGH64 builds when you did this code ?

I did see it, but (a) looking at the code out-of-line makes it look a lot
worse than it actually is (so the ext4 example is really helpful -- thanks
Michael!) and (b) I chalked it up to a crappy compiler.

However, see this comment from Arnd on my READ_ONCE series from the other
day:

https://lore.kernel.org/lkml/CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com

In which case, I'm thinking that we should be doing better in READ_ONCE()
for non-buggy compilers which would also keep the KCSAN folks happy for this
code (and would help with [1] too).

Will

[1] https://lkml.org/lkml/2019/11/12/898
