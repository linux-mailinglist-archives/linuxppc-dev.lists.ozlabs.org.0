Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4EE36895E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRDF314X7z302V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 09:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FRDDj0GDBz2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 09:30:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13MNQIqN024107;
 Thu, 22 Apr 2021 18:26:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13MNQHZC024104;
 Thu, 22 Apr 2021 18:26:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 22 Apr 2021 18:26:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH 1/2] powerpc/sstep: =?utf-8?Q?A?=
 =?utf-8?Q?dd_emulation_support_for_=E2=80=98setb=E2=80=99?= instruction
Message-ID: <20210422232616.GI27473@gate.crashing.org>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <20210422191334.GE27473@gate.crashing.org>
 <20210422221618.GA30594@lt-gp.iram.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422221618.GA30594@lt-gp.iram.es>
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
Cc: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Apr 23, 2021 at 12:16:18AM +0200, Gabriel Paubert wrote:
> On Thu, Apr 22, 2021 at 02:13:34PM -0500, Segher Boessenkool wrote:
> > On Fri, Apr 16, 2021 at 05:44:52PM +1000, Daniel Axtens wrote:
> > > Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
> > > > +			if ((regs->ccr) & (1 << (31 - ra)))
> > > > +				op->val = -1;
> > > > +			else if ((regs->ccr) & (1 << (30 - ra)))
> > > > +				op->val = 1;
> > > > +			else
> > > > +				op->val = 0;
> > 
> > It imo is clearer if written
> > 
> > 			if ((regs->ccr << ra) & 0x80000000)
> > 				op->val = -1;
> > 			else if ((regs->ccr << ra) & 0x40000000)
> > 				op->val = 1;
> > 			else
> > 				op->val = 0;
> > 
> > but I guess not everyone agrees :-)
> 
> But this can be made jump free :-):
> 
> 	int tmp = regs->ccr << ra;
> 	op->val = (tmp >> 31) | ((tmp >> 30) & 1);

The compiler will do so automatically (or think of some better way to
get the same result); in source code, what matters most is readability,
or clarity in general (also clarity to the compiler).

(Right shifts of negative numbers are implementation-defined in C,
fwiw -- but work like you expect in GCC).

> (IIRC the srawi instruction sign-extends its result to 64 bits).

If you consider it to work on 32-bit inputs, yeah, that is a simple way
to express it.

> > > CR field:      7    6    5    4    3    2    1    0
> > > bit:          0123 0123 0123 0123 0123 0123 0123 0123
> > > normal bit #: 0.....................................31
> > > ibm bit #:   31.....................................0
> > 
> > The bit numbers in CR fields are *always* numbered left-to-right.  I
> > have never seen anyone use LE for it, anyway.
> > 
> > Also, even people who write LE have the bigger end on the left normally
> > (they just write some things right-to-left, and other things
> > left-to-right).
> 
> Around 1985, I had a documentation for the the National's 32032
> (little-endian) processor family, and all the instruction encodings were
> presented with the LSB on the left and MSB on the right.

Ouch!  Did they write "regular" numbers with the least significant digit
on the left as well?

> BTW on these processors, the immediate operands and the offsets (1, 2 or
> 4 bytes) for the addressing modes were encoded in big-endian byte order,
> but I digress. Consistency is overrated ;-)

Inconsistency is the spice of life, yeah :-)


Segher
