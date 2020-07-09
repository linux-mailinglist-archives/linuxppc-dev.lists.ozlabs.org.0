Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7432194DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:12:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2GnV510hzDqrM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:11:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B2GlN0QjszDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 10:10:07 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0690A4Nl019193;
 Wed, 8 Jul 2020 19:10:04 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0690A3IQ019192;
 Wed, 8 Jul 2020 19:10:03 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 8 Jul 2020 19:10:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Failure to build librseq on ppc
Message-ID: <20200709001003.GB3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org>
 <841816533.1735.1594211583710.JavaMail.zimbra@efficios.com>
 <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
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

On Wed, Jul 08, 2020 at 10:00:01AM -0400, Mathieu Desnoyers wrote:
> >> So perhaps you have code like
> >> 
> >>  int *p;
> >>  int x;
> >>  ...
> >>  asm ("lwz %0,%1" : "=r"(x) : "m"(*p));
> > 
> > We indeed have explicit "lwz" and "stw" instructions in there.
> > 
> >> 
> >> where that last line should actually read
> >> 
> >>  asm ("lwz%X1 %0,%1" : "=r"(x) : "m"(*p));
> > 
> > Indeed, turning those into "lwzx" and "stwx" seems to fix the issue.
> > 
> > There has been some level of extra CPP macro coating around those instructions
> > to
> > support both ppc32 and ppc64 with the same assembly. So adding %X[arg] is not
> > trivial.
> > Let me see what can be done here.
> 
> I did the following changes which appear to generate valid asm.
> See attached corresponding .S output.
> 
> I grepped for uses of "m" asm operand in Linux powerpc code and noticed it's pretty much
> always used with e.g. "lwz%U1%X1". I could find one blog post discussing that %U is about
> update flag, and nothing about %X. Are those documented ?

Historically, no machine-specific output modifiers were documented.
For GCC 10 i added a few (in
https://gcc.gnu.org/onlinedocs/gcc-10.1.0/gcc/Machine-Constraints.html#Machine-Constraints
), but not all (that user code should use!) yet.

> Although it appears to generate valid asm, I have the feeling I'm relying on undocumented
> features here. :-/

It is supported for 30 years or so now.  GCC itself uses this a *lot*
internally as well.  It works, and it will work forever.

> -#define STORE_WORD     "std "
> -#define LOAD_WORD      "ld "
> -#define LOADX_WORD     "ldx "
> +#define STORE_WORD(arg)        "std%U[" __rseq_str(arg) "]%X[" __rseq_str(arg) "] "    /* To memory ("m" constraint) */
> +#define LOAD_WORD(arg) "lwd%U[" __rseq_str(arg) "]%X[" __rseq_str(arg) "] "    /* From memory ("m" constraint) */

That cannot work (you typoed "ld" here).

Some more advice about this code, pretty generic stuff:

The way this all uses r17 will likely not work reliably.

The way multiple asm statements are used seems to have missing
dependencies between the statements.

Don't try to work *against* the compiler.  You will not win.

Alternatively, write assembler code, if that is what you actually want
to do?  Not C code.

And done macro-mess this, you want to be able to debug it, and you need
other people to be able to read it!


Segher
