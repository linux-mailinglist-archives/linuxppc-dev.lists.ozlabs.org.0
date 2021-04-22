Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F268D368702
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 21:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR6b76v69z30HP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FR6Zp3VXMz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 05:15:45 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13MJDZXa001050;
 Thu, 22 Apr 2021 14:13:35 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13MJDYFS001035;
 Thu, 22 Apr 2021 14:13:34 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 22 Apr 2021 14:13:34 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH 1/2] powerpc/sstep: =?utf-8?Q?A?=
 =?utf-8?Q?dd_emulation_support_for_=E2=80=98setb=E2=80=99?= instruction
Message-ID: <20210422191334.GE27473@gate.crashing.org>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875z0mfzbf.fsf@linkitivity.dja.id.au>
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
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Apr 16, 2021 at 05:44:52PM +1000, Daniel Axtens wrote:
> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
> Ok, if I've understood correctly...
> 
> > +			ra = ra & ~0x3;
> 
> This masks off the bits of RA that are not part of BTF:
> 
> ra is in [0, 31] which is [0b00000, 0b11111]
> Then ~0x3 = ~0b00011
> ra = ra & 0b11100
> 
> This gives us then,
> ra = btf << 2; or
> btf = ra >> 2;

Yes.  In effect, you want the offset in bits of the CR field, which is
just fine like this.  But a comment would not hurt.

> Let's then check to see if your calculations read the right fields.
> 
> > +			if ((regs->ccr) & (1 << (31 - ra)))
> > +				op->val = -1;
> > +			else if ((regs->ccr) & (1 << (30 - ra)))
> > +				op->val = 1;
> > +			else
> > +				op->val = 0;

It imo is clearer if written

			if ((regs->ccr << ra) & 0x80000000)
				op->val = -1;
			else if ((regs->ccr << ra) & 0x40000000)
				op->val = 1;
			else
				op->val = 0;

but I guess not everyone agrees :-)

> CR field:      7    6    5    4    3    2    1    0
> bit:          0123 0123 0123 0123 0123 0123 0123 0123
> normal bit #: 0.....................................31
> ibm bit #:   31.....................................0

The bit numbers in CR fields are *always* numbered left-to-right.  I
have never seen anyone use LE for it, anyway.

Also, even people who write LE have the bigger end on the left normally
(they just write some things right-to-left, and other things
left-to-right).

> Checkpatch does have one complaint:
> 
> CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'regs->ccr'
> #30: FILE: arch/powerpc/lib/sstep.c:1971:
> +			if ((regs->ccr) & (1 << (31 - ra)))
> 
> I don't really mind the parenteses: I think you are safe to ignore
> checkpatch here unless someone else complains :)

I find them annoying.  If there are too many parentheses, it is hard to
see at a glance what groups where.  Also, a suspicious reader might
think there is something special going on (with macros for example).

This is simple code of course, but :-)

> If you do end up respinning the patch, I think it would be good to make
> the maths a bit clearer. I think it works because a left shift of 2 is
> the same as multiplying by 4, but it would be easier to follow if you
> used a temporary variable for btf.

It is very simple.  The BFA instruction field is closely related to the
BI instruction field, which is 5 bits, and selects one of the 32 bits in
the CR.  If you have "BFA00 BFA01 BFA10 BFA11", that gives the bit
numbers of all four bits in the selected CR field.  So the "& ~3" does
all you need.  It is quite pretty :-)


Segher
