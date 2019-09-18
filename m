Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A4B6859
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 18:41:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YQjW0Jg8zF3Q9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 02:41:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YQgF1qHZzF3K1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 02:39:36 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x8IGdKX3020595;
 Wed, 18 Sep 2019 11:39:20 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x8IGdJjs020591;
 Wed, 18 Sep 2019 11:39:19 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 18 Sep 2019 11:39:19 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
Message-ID: <20190918163919.GH9749@gate.crashing.org>
References: <d0b002c96cfc069a1bc7bafcac28defe5d7d3643.1568821668.git.christophe.leroy@c-s.fr>
 <5fb4aedadbd28b9849cf2fabe13392fb3b5cd3ed.1568821668.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fb4aedadbd28b9849cf2fabe13392fb3b5cd3ed.1568821668.git.christophe.leroy@c-s.fr>
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

Hi Christophe,

On Wed, Sep 18, 2019 at 03:48:20PM +0000, Christophe Leroy wrote:
> call_do_irq() and call_do_softirq() are quite similar on PPC32 and
> PPC64 and are simple enough to be worth inlining.
> 
> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.

But you hardcode the calling sequence in inline asm, which for various
reasons is not a great idea.

> +static inline void call_do_irq(struct pt_regs *regs, void *sp)
> +{
> +	register unsigned long r3 asm("r3") = (unsigned long)regs;
> +
> +	asm volatile(
> +		"	"PPC_STLU"	1, %2(%1);\n"
> +		"	mr		1, %1;\n"
> +		"	bl		%3;\n"
> +		"	"PPC_LL"	1, 0(1);\n" : "+r"(r3) :
> +		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
> +		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
> +		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
> +}

I realise the original code had this...  Loading the old stack pointer
value back from the stack creates a bottleneck (via the store->load
forwarding it requires).  It could just use
  addi 1,1,-(%2)
here, which can also be written as
  addi 1,1,%n2
(that is portable to all architectures btw).


Please write the  "+r"(r3)  on the next line?  Not on the same line as
the multi-line template.  This make things more readable.


I don't know if using functions as an "i" works properly...  It probably
does, it's just not something that you see often :-)


What about r2?  Various ABIs handle that differently.  This might make
it impossible to share implementation between 32-bit and 64-bit for this.
But we could add it to the clobber list worst case, that will always work.


So anyway, it looks to me like it will work.  Nice cleanup.  Would be
better if you could do the call to __do_irq from C code, but maybe we
cannot have everything ;-)

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
