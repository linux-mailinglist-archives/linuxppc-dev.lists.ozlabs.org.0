Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C148F368900
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 00:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRBr45xdDz301g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 08:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=FKdPkzsf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.150; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=FKdPkzsf; dkim-atps=neutral
X-Greylist: delayed 619 seconds by postgrey-1.36 at boromir;
 Fri, 23 Apr 2021 08:27:08 AEST
Received: from mx01.puc.rediris.es (outbound6mad.lav.puc.rediris.es
 [130.206.19.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRBqc4DR3z2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 08:27:07 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx01.puc.rediris.es  with ESMTP id 13MMGRPi005826-13MMGRPk005826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 23 Apr 2021 00:16:27 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id 65BAAC4DEE3;
 Fri, 23 Apr 2021 00:16:26 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id ED4F7C1A25F;
 Fri, 23 Apr 2021 00:16:25 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id He-OWa-w0KdH; Fri, 23 Apr 2021 00:16:25 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id C098EC4DEE3;
 Fri, 23 Apr 2021 00:16:23 +0200 (CEST)
Date: Fri, 23 Apr 2021 00:16:18 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] powerpc/sstep: =?utf-8?Q?A?=
 =?utf-8?Q?dd_emulation_support_for_=E2=80=98setb=E2=80=99?= instruction
Message-ID: <20210422221618.GA30594@lt-gp.iram.es>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <20210422191334.GE27473@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422191334.GE27473@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=Kf4/sJHzrq+xNadIEPH/sB7I765GgxANtaQbGxvzZDY=;
 b=FKdPkzsfKeRnRLhVF5a0e/72JqmkJmqllWm5tCe8NW+YRZABEdGYdmmxB4SZVnxUJOXvSvsT+DBZ
 OHRwSoAjXXgMgB0jbhYF+zNuRJNUjz7PmjVFvJ782ZmKEba+uvkwr4LXFETkJL3kJE9lqjEAOoH1
 7uN6mv5OhlpE0+e4EvGxF9ekd6XDHgPFxTOeozQ2sfbPagpo8qZZnsRqSYqLtGtPsE0p9uE632Qd
 aqTPOIgbp3ulznfC28ANaEKc07+2g+EjV8mvkkG4w5JgC9M9LxRgNvOSidPDC5uKOoVCISbaI7PK
 yeNQfvP6nfhpFfcbxz1vWMcb6jcK6aM5Cz8xOw==
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


	Hi,

On Thu, Apr 22, 2021 at 02:13:34PM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Apr 16, 2021 at 05:44:52PM +1000, Daniel Axtens wrote:
> > Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
> > Ok, if I've understood correctly...
> > 
> > > +			ra = ra & ~0x3;
> > 
> > This masks off the bits of RA that are not part of BTF:
> > 
> > ra is in [0, 31] which is [0b00000, 0b11111]
> > Then ~0x3 = ~0b00011
> > ra = ra & 0b11100
> > 
> > This gives us then,
> > ra = btf << 2; or
> > btf = ra >> 2;
> 
> Yes.  In effect, you want the offset in bits of the CR field, which is
> just fine like this.  But a comment would not hurt.
> 
> > Let's then check to see if your calculations read the right fields.
> > 
> > > +			if ((regs->ccr) & (1 << (31 - ra)))
> > > +				op->val = -1;
> > > +			else if ((regs->ccr) & (1 << (30 - ra)))
> > > +				op->val = 1;
> > > +			else
> > > +				op->val = 0;
> 
> It imo is clearer if written
> 
> 			if ((regs->ccr << ra) & 0x80000000)
> 				op->val = -1;
> 			else if ((regs->ccr << ra) & 0x40000000)
> 				op->val = 1;
> 			else
> 				op->val = 0;
> 
> but I guess not everyone agrees :-)
> 

But this can be made jump free :-):

	int tmp = regs->ccr << ra;
	op->val = (tmp >> 31) | ((tmp >> 30) & 1);

(IIRC the srawi instruction sign-extends its result to 64 bits).



> > CR field:      7    6    5    4    3    2    1    0
> > bit:          0123 0123 0123 0123 0123 0123 0123 0123
> > normal bit #: 0.....................................31
> > ibm bit #:   31.....................................0
> 
> The bit numbers in CR fields are *always* numbered left-to-right.  I
> have never seen anyone use LE for it, anyway.
> 
> Also, even people who write LE have the bigger end on the left normally
> (they just write some things right-to-left, and other things
> left-to-right).

Around 1985, I had a documentation for the the National's 32032
(little-endian) processor family, and all the instruction encodings were
presented with the LSB on the left and MSB on the right.

BTW on these processors, the immediate operands and the offsets (1, 2 or
4 bytes) for the addressing modes were encoded in big-endian byte order,
but I digress. Consistency is overrated ;-)

	Gabriel


> 
> > Checkpatch does have one complaint:
> > 
> > CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'regs->ccr'
> > #30: FILE: arch/powerpc/lib/sstep.c:1971:
> > +			if ((regs->ccr) & (1 << (31 - ra)))
> > 
> > I don't really mind the parenteses: I think you are safe to ignore
> > checkpatch here unless someone else complains :)
> 
> I find them annoying.  If there are too many parentheses, it is hard to
> see at a glance what groups where.  Also, a suspicious reader might
> think there is something special going on (with macros for example).
> 
> This is simple code of course, but :-)
> 
> > If you do end up respinning the patch, I think it would be good to make
> > the maths a bit clearer. I think it works because a left shift of 2 is
> > the same as multiplying by 4, but it would be easier to follow if you
> > used a temporary variable for btf.
> 
> It is very simple.  The BFA instruction field is closely related to the
> BI instruction field, which is 5 bits, and selects one of the 32 bits in
> the CR.  If you have "BFA00 BFA01 BFA10 BFA11", that gives the bit
> numbers of all four bits in the selected CR field.  So the "& ~3" does
> all you need.  It is quite pretty :-)
> 
> 
> Segher
 

