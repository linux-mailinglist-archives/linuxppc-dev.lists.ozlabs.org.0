Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AF67D3C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 19:08:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2pc60x2gz3fKH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 05:08:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2pbZ3mcPz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 05:08:09 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30QI5rrM030369;
	Thu, 26 Jan 2023 12:05:53 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30QI5qYL030368;
	Thu, 26 Jan 2023 12:05:52 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 26 Jan 2023 12:05:52 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: arch/powerpc/kernel/head_85xx.o: warning: objtool: .head.text+0x1a6c: unannotated intra-function call
Message-ID: <20230126180552.GO25951@gate.crashing.org>
References: <202301161955.38kK6ksW-lkp@intel.com> <b2273730-f885-7658-7ec4-12fb5bfc515b@linux.ibm.com> <1674631223.9e09lbzzb6.naveen@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1674631223.9e09lbzzb6.naveen@linux.ibm.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Sathvika Vasireddy <sv@linux.ibm.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Jan 25, 2023 at 12:57:35PM +0530, Naveen N. Rao wrote:
> Sathvika Vasireddy wrote:
> >--- a/arch/powerpc/kvm/booke.c
> >+++ b/arch/powerpc/kvm/booke.c
> >@@ -917,7 +917,9 @@ static void kvmppc_fill_pt_regs(struct pt_regs *regs)
> >         asm("mr %0, 1" : "=r"(r1));
> >         asm("mflr %0" : "=r"(lr));
> >         asm("mfmsr %0" : "=r"(msr));
> >+       asm(".pushsection .discard.intra_function_calls; .long 999f; 
> >.popsection; 999:");
> >         asm("bl 1f; 1: mflr %0" : "=r"(ip));
> 
> I don't think you can assume that there won't be anything in between two 
> asm statements.

It would be a false assumption.  There is nothing that stops the
compiler from moving, duplicating, or even removing these statements
(removing only if no outputs from the asm are required of course).

> Does it work if you combine both the above asm 
> statements into a single one?
> 
> Even if that works, I don't think it is good to expand the macro here.  
> That asm statement looks to be trying to grab the current nip. I don't 
> know enough about that code, and someone who knows more about KVM may be 
> able to help, but it looks like we should be able to simply set 'ip' to 
> the address of kvmppc_fill_pt_regs()?

Such things are much better as actual assembler code (like, a .s file).
You have to be certain the compiler doesn't transform this in unexpected
ways, like, copy and move it to all callers for example.  You need the
mfmsr to remain somewhat in place for example.

A big reason to not want inline asm for things like this is you need so
very many operands in a single asm that way; it becomes very hard to
write, esp. if you want it to be correct code as well.  That is a good
hint there are better way to do this ;-)


Segher
