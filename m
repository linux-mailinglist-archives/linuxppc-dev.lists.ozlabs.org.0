Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFBA53CA3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF2px1NZ1z3bm9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF2pS1BKnz3bks
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:52:15 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 253Cn6T7022427;
	Fri, 3 Jun 2022 07:49:06 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 253Cn5Tt022424;
	Fri, 3 Jun 2022 07:49:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 3 Jun 2022 07:49:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-ID: <20220603124905.GD25951@gate.crashing.org>
References: <20220531065936.3674348-1-mpe@ellerman.id.au> <20220531222715.GT25951@gate.crashing.org> <87fskopsui.fsf@mpe.ellerman.id.au> <20220601162023.GW25951@gate.crashing.org> <CACzsE9qZ0OTv07Tw8OM+K_Md904ZzW6mfnu-qb8OSwznWCgufQ@mail.gmail.com> <20220602084654.GZ25951@gate.crashing.org> <CACzsE9o8wQj+cCqQmWefKttqHtJ2PpmDULbaiCH=DK3Cj6i1ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACzsE9o8wQj+cCqQmWefKttqHtJ2PpmDULbaiCH=DK3Cj6i1ow@mail.gmail.com>
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

Hi!

On Fri, Jun 03, 2022 at 03:03:05PM +1000, Jordan Niethe wrote:
> On Thu, Jun 2, 2022 at 6:49 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > On Thu, Jun 02, 2022 at 01:01:04PM +1000, Jordan Niethe wrote:
> > > > What about the more fundamental thing?  Have the order of the two halves
> > > > of a prefixed insn as ulong not depend on endianness?  It really is two
> > > > opcodes, and the prefixed one is first, always, even in LE.
> > > The reason would be the value of as ulong is then used to write a
> > > prefixed instruction to
> > > memory with std.
> > > If both endiannesses had the halves the same one of them would store
> > > the suffix in front of the prefix.
> >
> > You cannot do such a (possibly) unaligned access from C though, not
> > without invoking undefined behaviour.  The compiler usually lets you get
> > away with it, but there are no guarantees.  You can make sure you only
> > ever do such an access from assembler code of course.
> 
> Would using inline assembly to do it be ok?

You cannot refer to the instruction words as one 8-byte integer in
memory (with "m" or similar), since such a thing is not valid C.  You
can input the address of it to the inline asm of course, and use a
clobber "memory", or also give it the actual memory as input, but as
bytes or words or such, with something like
  "m"(*(const u32 (*)[2]) ptr)

> > Swapping the two halves of a register costs at most one insn.  It is
> > harmful premature optimisation to make this single cycle advantage
> > override more important consideration (almost everything else :-) )
> 
> I'm not sure I follow. We are not doing this as an optimisation, but
> out of the necessity of writing
> the prefixed instruction to memory in a single instruction so that we
> don't end up with half an
> instruction in the kernel image.

Ah.  That does not necessitate having this different for LE at all
though!  The function that does the patching has to do it as one
atomic memory access (which an ld only is because prefixed insns cannot
cross 64-byte address boundaries btw), but that does not mean the kernel
has to use the packing into one u64 it needs for that anywhere else,
certainly not if that just complicates matters!


Segher
