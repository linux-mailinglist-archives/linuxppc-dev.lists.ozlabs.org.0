Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D320FE99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 23:20:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xHLq4t3vzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 07:20:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49xHK81XMZzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 07:18:35 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 05ULIIPG003747;
 Tue, 30 Jun 2020 16:18:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 05ULIHW0003746;
 Tue, 30 Jun 2020 16:18:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 30 Jun 2020 16:18:17 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
Message-ID: <20200630211817.GZ3598@gate.crashing.org>
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au> <875zb98i5a.fsf@mpe.ellerman.id.au>
 <311c3471-cad7-72d5-a5e6-04cf892c5e41@csgroup.eu>
 <20200630163324.GW3598@gate.crashing.org>
 <f8819fa4-94e3-4bf9-4b60-c57d2804e529@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8819fa4-94e3-4bf9-4b60-c57d2804e529@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi again,

Thanks for your work so far!

On Tue, Jun 30, 2020 at 06:53:39PM +0000, Christophe Leroy wrote:
> On 06/30/2020 04:33 PM, Segher Boessenkool wrote:
> >>>+ make -s CC=powerpc64-linux-gnu-gcc -j 160
> >>>In file included from /linux/include/linux/uaccess.h:11:0,
> >>>                  from /linux/include/linux/sched/task.h:11,
> >>>                  from /linux/include/linux/sched/signal.h:9,
> >>>                  from /linux/include/linux/rcuwait.h:6,
> >>>                  from /linux/include/linux/percpu-rwsem.h:7,
> >>>                  from /linux/include/linux/fs.h:33,
> >>>                  from /linux/include/linux/huge_mm.h:8,
> >>>                  from /linux/include/linux/mm.h:675,
> >>>                  from /linux/arch/powerpc/kernel/signal_32.c:17:
> >>>/linux/arch/powerpc/kernel/signal_32.c: In function
> >>>'save_user_regs.isra.14.constprop':
> >>>/linux/arch/powerpc/include/asm/uaccess.h:161:2: error: 'asm' operand has
> >>>impossible constraints
> >>>   __asm__ __volatile__(     \
> >>>   ^
> >>>/linux/arch/powerpc/include/asm/uaccess.h:197:12: note: in expansion of
> >>>macro '__put_user_asm'
> >>>     case 4: __put_user_asm(x, ptr, retval, "stw"); break; \
> >>>             ^
> >>>/linux/arch/powerpc/include/asm/uaccess.h:206:2: note: in expansion of
> >>>macro '__put_user_size_allowed'
> >>>   __put_user_size_allowed(x, ptr, size, retval);  \
> >>>   ^
> >>>/linux/arch/powerpc/include/asm/uaccess.h:220:2: note: in expansion of
> >>>macro '__put_user_size'
> >>>   __put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> >>>   ^
> >>>/linux/arch/powerpc/include/asm/uaccess.h:96:2: note: in expansion of
> >>>macro '__put_user_nocheck'
> >>>   __put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >>>   ^
> >>>/linux/arch/powerpc/kernel/signal_32.c:120:7: note: in expansion of macro
> >>>'__put_user'
> >>>    if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
> >>>        ^
> >
> >Can we see what that was after the macro jungle?  Like, the actual
> >preprocessed code?
> 
> Sorry for previous misunderstanding
> 
> Here is the code:
> 
> #define __put_user_asm(x, addr, err, op)			\
> 	__asm__ __volatile__(					\
> 		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
> 		"2:\n"						\
> 		".section .fixup,\"ax\"\n"			\
> 		"3:	li %0,%3\n"				\
> 		"	b 2b\n"					\
> 		".previous\n"					\
> 		EX_TABLE(1b, 3b)				\
> 		: "=r" (err)					\
> 		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))

Yeah I don't see it.  I'll have to look at compiler debug dumps, but I
don't have any working 4.9 around, and I cannot reproduce this with
either older or newer compilers.

It is complainig that constrain_operands just does not work *at all* on
this "m<>" constraint apparently, which doesn't make much sense.

I'll try later when I have more time, sorry :-/


Segher
