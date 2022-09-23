Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793415E85BD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 00:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ6500bbHz3dqY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 08:19:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ64b1jQJz304J
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 08:18:54 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28NMFiAQ005463;
	Fri, 23 Sep 2022 17:15:44 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28NMFhVm005462;
	Fri, 23 Sep 2022 17:15:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 23 Sep 2022 17:15:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in irq_soft_mask_{set,return}
Message-ID: <20220923221543.GN25951@gate.crashing.org>
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo> <20220923121829.GL25951@gate.crashing.org> <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 24, 2022 at 02:26:52AM +1000, Nicholas Piggin wrote:
> I still don't see what clauses guarantees asm("%0" ::"r"(foo)) to give
> 13. It doesn't say access via inline assembly is special,

But it is.  It is for all register variables, local and global.  I agree
this isn't documented clearly.  For local register variables this is the
*only* thing guaranteed; for global register vars there is more (it
changes the ABI, there are safe/restore effects, that kind of thing).

Never it is guaranteed that all accesses through this variable will use
the register directly: this fundamentally cannot work on all archs, and
also not at -O0.  More in general it doesn't work if some basic
optimisations are not done, be it because of a compiler deficiency, or a
straight out bug, or maybe it is a conscious choice in some cases.

> I think if it was obviously guaranteed then this might be marginally
> better than explicit r13 in the asm
> 
>        asm volatile(
>                "stb %0,%2(%1)"
>                :
>                : "r" (mask),
> 	         "r" (local_paca),
>                  "i" (offsetof(struct paca_struct, irq_soft_mask))
>                : "memory");

(Please use "n" instead of "i".  Doesn't matter here, but it does in
many other places.)


Segher
