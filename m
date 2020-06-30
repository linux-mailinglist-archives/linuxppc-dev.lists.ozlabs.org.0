Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1020F99B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 18:38:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x95w3HcRzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 02:38:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49x90V3wN7zDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 02:33:46 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 05UGXQQP021824;
 Tue, 30 Jun 2020 11:33:26 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 05UGXOLS021820;
 Tue, 30 Jun 2020 11:33:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 30 Jun 2020 11:33:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
Message-ID: <20200630163324.GW3598@gate.crashing.org>
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au> <875zb98i5a.fsf@mpe.ellerman.id.au>
 <311c3471-cad7-72d5-a5e6-04cf892c5e41@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <311c3471-cad7-72d5-a5e6-04cf892c5e41@csgroup.eu>
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

On Tue, Jun 30, 2020 at 04:55:05PM +0200, Christophe Leroy wrote:
> Le 30/06/2020 à 03:19, Michael Ellerman a écrit :
> >Michael Ellerman <mpe@ellerman.id.au> writes:
> >>Because it uses the "m<>" constraint which didn't work on GCC 4.6.
> >>
> >>https://github.com/linuxppc/issues/issues/297
> >>
> >>So we should be able to pick it up for v5.9 hopefully.
> >
> >It seems to break the build with the kernel.org 4.9.4 compiler and
> >corenet64_smp_defconfig:
> 
> Looks like 4.9.4 doesn't accept "m<>" constraint either.

The evidence contradicts this assertion.

> Changing it to "m" make it build.

But that just means something else is wrong.

> >+ make -s CC=powerpc64-linux-gnu-gcc -j 160
> >In file included from /linux/include/linux/uaccess.h:11:0,
> >                  from /linux/include/linux/sched/task.h:11,
> >                  from /linux/include/linux/sched/signal.h:9,
> >                  from /linux/include/linux/rcuwait.h:6,
> >                  from /linux/include/linux/percpu-rwsem.h:7,
> >                  from /linux/include/linux/fs.h:33,
> >                  from /linux/include/linux/huge_mm.h:8,
> >                  from /linux/include/linux/mm.h:675,
> >                  from /linux/arch/powerpc/kernel/signal_32.c:17:
> >/linux/arch/powerpc/kernel/signal_32.c: In function 
> >'save_user_regs.isra.14.constprop':
> >/linux/arch/powerpc/include/asm/uaccess.h:161:2: error: 'asm' operand has 
> >impossible constraints
> >   __asm__ __volatile__(     \
> >   ^
> >/linux/arch/powerpc/include/asm/uaccess.h:197:12: note: in expansion of 
> >macro '__put_user_asm'
> >     case 4: __put_user_asm(x, ptr, retval, "stw"); break; \
> >             ^
> >/linux/arch/powerpc/include/asm/uaccess.h:206:2: note: in expansion of 
> >macro '__put_user_size_allowed'
> >   __put_user_size_allowed(x, ptr, size, retval);  \
> >   ^
> >/linux/arch/powerpc/include/asm/uaccess.h:220:2: note: in expansion of 
> >macro '__put_user_size'
> >   __put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
> >   ^
> >/linux/arch/powerpc/include/asm/uaccess.h:96:2: note: in expansion of 
> >macro '__put_user_nocheck'
> >   __put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >   ^
> >/linux/arch/powerpc/kernel/signal_32.c:120:7: note: in expansion of macro 
> >'__put_user'
> >    if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
> >        ^

Can we see what that was after the macro jungle?  Like, the actual
preprocessed code?

Also, what GCC version *does* work on this?


Segher
