Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34159217C69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 03:01:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1gwn0qTHzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:01:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B1gtt3RsjzDqwT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 10:59:34 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0680xMRN027976;
 Tue, 7 Jul 2020 19:59:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0680xMwM027975;
 Tue, 7 Jul 2020 19:59:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 7 Jul 2020 19:59:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Failure to build librseq on ppc
Message-ID: <20200708005922.GW3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Jul 07, 2020 at 03:17:10PM -0400, Mathieu Desnoyers wrote:
> I'm trying to build librseq at:
> 
> https://git.kernel.org/pub/scm/libs/librseq/librseq.git
> 
> on powerpc, and I get these errors when building the rseq basic
> test mirrored from the kernel selftests code:
> 
> /tmp/ccieEWxU.s: Assembler messages:
> /tmp/ccieEWxU.s:118: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:118: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:121: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:121: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:626: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:626: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:629: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:629: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:735: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:735: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:738: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:738: Error: junk at end of line: `,8'
> /tmp/ccieEWxU.s:741: Error: syntax error; found `,', expected `('
> /tmp/ccieEWxU.s:741: Error: junk at end of line: `,8'
> Makefile:581: recipe for target 'basic_percpu_ops_test.o' failed

You'll have to show the actual failing machine code, and with enough
context that we can relate this to the source code.

-save-temps helps, or use -S instead of -c, etc.

> I am using this compiler:
> 
> gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12)
> Target: powerpc-linux-gnu
> 
> So far, I got things to build by changing "m" operands to "Q" operands.
> Based on https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Constraints
> it seems that "Q" means "A memory operand addressed by just a base register."

Yup.

> I suspect that lwz and stw don't expect some kind of immediate offset which
> can be kept with "m", and "Q" fixes this. Is that the right fix ?
> 
> And should we change all operands passed to lwz and stw to a "Q" operand ?

No, lwz and stw exactly *do* take an immediate offset.

It sounds like the compiler passed memory addressed by indexed
addressing, instead.  Which is fine for "m", and also fine for those
insns... well, you need lwzx and stwx.

So perhaps you have code like

  int *p;
  int x;
  ...
  asm ("lwz %0,%1" : "=r"(x) : "m"(*p));

where that last line should actually read

  asm ("lwz%X1 %0,%1" : "=r"(x) : "m"(*p));

?


Segher
