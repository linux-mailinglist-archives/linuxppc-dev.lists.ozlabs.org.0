Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B257BF85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp7tV0Sk8z3dqD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 07:21:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp7t552Czz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 07:21:15 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26KLJC5e012950;
	Wed, 20 Jul 2022 16:19:12 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26KLJCuN012947;
	Wed, 20 Jul 2022 16:19:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 20 Jul 2022 16:19:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: add BookS wait opcode macro
Message-ID: <20220720211911.GI25951@gate.crashing.org>
References: <20220711031128.151437-1-npiggin@gmail.com> <20220712162903.GO25951@gate.crashing.org> <1658310023.4smrdizxcf.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1658310023.4smrdizxcf.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 20, 2022 at 07:54:54PM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of July 13, 2022 2:29 am:
> > The embedded extensions are no longer part of the PowerPC architecture,
> > so wouldn't it be a better way forward to rename the existing one,
> > instead?  A bit more work now, but less in the future :-)
> 
> And I actually misremembered this too, was off digging and asking
> about it, but the change isn't strictly BookE vs BookS, but rather
> the wait opcode was changed in ISA v3.0, which is a bit of an
> unfortunate landmine.

The current wait opcode is *new* in 3.0, but it has the same mnemonic
as the old one, more formally.

> It seems apparently POWER8 implemented a non-architected instruction
> 'waitasec' that uses this opcode, then I suppose it was decided to
> continue with that opcode in v3.0 when BookE was dropped, for reasons.

The (newer) wait instruction is 0/30 while the old one is 1/30
(secondary opcodes 30 resp. 62), although 0/30 stayed open; maybe there
is more history there already?  Curious.

> In any case, I will rename it. Precedent is divided. We have
> PPC_RAW_TLBIEL_v205 for older tlbiel, and PPC_ISA_3_0_INVALIDATE_ERAT
> for a new ERAT invalidation instruction. I guess making the older
> instruction the exceptional case ends up being better in the long
> term.

Yeah exactly, it's better if the simpler name is the one that newer
code should use: more readable, more writable, and importantly less
room for mistakes :-)

Thanks,


Segher
