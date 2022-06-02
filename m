Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D653B565
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 10:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDKTy0BPRz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 18:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDKTT4MLHz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 18:50:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2528kuTS021724;
	Thu, 2 Jun 2022 03:46:56 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2528ktuW021722;
	Thu, 2 Jun 2022 03:46:55 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 2 Jun 2022 03:46:55 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-ID: <20220602084654.GZ25951@gate.crashing.org>
References: <20220531065936.3674348-1-mpe@ellerman.id.au> <20220531222715.GT25951@gate.crashing.org> <87fskopsui.fsf@mpe.ellerman.id.au> <20220601162023.GW25951@gate.crashing.org> <CACzsE9qZ0OTv07Tw8OM+K_Md904ZzW6mfnu-qb8OSwznWCgufQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACzsE9qZ0OTv07Tw8OM+K_Md904ZzW6mfnu-qb8OSwznWCgufQ@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 02, 2022 at 01:01:04PM +1000, Jordan Niethe wrote:
> > What about the more fundamental thing?  Have the order of the two halves
> > of a prefixed insn as ulong not depend on endianness?  It really is two
> > opcodes, and the prefixed one is first, always, even in LE.
> The reason would be the value of as ulong is then used to write a
> prefixed instruction to
> memory with std.
> If both endiannesses had the halves the same one of them would store
> the suffix in front of the prefix.

You cannot do such a (possibly) unaligned access from C though, not
without invoking undefined behaviour.  The compiler usually lets you get
away with it, but there are no guarantees.  You can make sure you only
ever do such an access from assembler code of course.

Swapping the two halves of a register costs at most one insn.  It is
harmful premature optimisation to make this single cycle advantage
override more important consideration (almost everything else :-) )


Segher
