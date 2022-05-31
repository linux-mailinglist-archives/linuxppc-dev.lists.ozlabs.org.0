Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109E539987
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 00:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCRnL1JYgz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 08:30:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCRmx4rKyz2yh9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 08:30:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24VMRGnF032143;
	Tue, 31 May 2022 17:27:16 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 24VMRFu2032141;
	Tue, 31 May 2022 17:27:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 31 May 2022 17:27:15 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-ID: <20220531222715.GT25951@gate.crashing.org>
References: <20220531065936.3674348-1-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531065936.3674348-1-mpe@ellerman.id.au>
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, May 31, 2022 at 04:59:36PM +1000, Michael Ellerman wrote:
> More problematically it doesn't compile at all with GCC 12, due to the
> fact that it returns the char buffer declared inside the macro:

It returns a pointer to a buffer on stack.  It is not valid C to access
that buffer after the function has returned (and indeed it does not
work, in general).

> A simpler solution is to just print the value as an unsigned long. For
> normal instructions the output is identical. For prefixed instructions
> the value is printed as a single 64-bit quantity, whereas previously the
> low half was printed first. But that is good enough for debug output,
> especially as prefixed instructions will be rare in practice.

Prefixed insns might be somewhat rare currently, but it will not stay
that way.

It is not hard to fix the problem here?  The only tricky part is that
ppc_inst_as_ulong swaps the two halves for LE, for as far as I can see
no reason at all :-(

If it didn't it would be easy to detect prefixed insns (because they
then are guaranteed to be > 0xffffffff), and it is easy to print them
with a space between the two opcodes, with a utility function:

void print_insn_bytes_nicely(unsigned long insn)
{
	if (insn > 0xffffffff)
		printf("%08x ", insn >> 32);
	printf("%08x", insn & 0xffffffff);
}

or something like that.


Segher
