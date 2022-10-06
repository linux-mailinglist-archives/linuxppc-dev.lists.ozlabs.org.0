Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A45F6EC8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 22:18:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk2n90FG7z3dqk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk2md2qpcz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 07:17:37 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296KFWEI018692;
	Thu, 6 Oct 2022 15:15:32 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 296KFVKS018691;
	Thu, 6 Oct 2022 15:15:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 6 Oct 2022 15:15:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Message-ID: <20221006201531.GT25951@gate.crashing.org>
References: <20220923033004.536127-1-npiggin@gmail.com> <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu> <CN3KCU5GOMF4.3T533MQ4U2SF0@bobo> <33e5c5e7-a25f-36bf-e7a1-8d6849cd4715@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33e5c5e7-a25f-36bf-e7a1-8d6849cd4715@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Oct 06, 2022 at 06:07:32PM +0000, Christophe Leroy wrote:
> Le 23/09/2022 à 08:23, Nicholas Piggin a écrit :
> > I would rather complete prefixed support in the kernel and use pcrel
> > addressing. Actually even if we don't compile with pcrel or prefixed,
> > there are some instructions and we will probably get more that require
> > prefixed, possible we might want to use them in kernel. Some of it is
> > required to handle user mode instructions too. So I think removing
> > it is premature, but I guess it's up for debate.
> 
> Well ok, in fact I only had code_patching in mind.
> 
> Code patching is only for kernel text. Today code patching is used for 
> things like kprobe, ftrace, etc .... which really do not seems to be 
> prepared for prefixed instructions.
> 
> If you are adding -mno-prefixed, it is worth keeping that code which 
> sometimes gives us some headacke ?

-mpcrel requires -mprefixed.  Using PC relative addressing will be a
significant performance benefit.

> Of course if there are plans to get real prefixed instruction in kernel 
> code anytime soon, lets live with it, in that case the support should 
> get completed. But otherwise I think it would be better to get rid of it 
> for now, and implement it completely when we need it in years.

The future is unstoppable, certainly the near future is :-)

> When I see the following, I'm having hard time believing it would work 
> with prefixed instructions in the kernel text:
> 
> 	typedef u32 kprobe_opcode_t;
> 
> 	struct kprobe {
> 	...
> 		/* Saved opcode (which has been replaced with breakpoint) */
> 		kprobe_opcode_t opcode;
> 
> 
> 	void arch_disarm_kprobe(struct kprobe *p)
> 	{
> 		WARN_ON_ONCE(patch_instruction(p->addr, ppc_inst(p->opcode)));
> 	}

Why would it not work?


Segher
