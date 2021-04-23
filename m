Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B9369058
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 12:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRVq85DY3z30Bq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 20:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=eSYwoJRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.150; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=eSYwoJRl; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound6mad.lav.puc.rediris.es
 [130.206.19.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRVpk4JBFz2xYj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 20:27:24 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx01.puc.rediris.es  with ESMTP id 13NAR5Yn009087-13NAR5Yp009087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 23 Apr 2021 12:27:05 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id 11F2BC1A222;
 Fri, 23 Apr 2021 12:27:05 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id 9CDFCC1A22B;
 Fri, 23 Apr 2021 12:27:04 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MGBR3FBtGWpu; Fri, 23 Apr 2021 12:27:04 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id 85EE1C1A222;
 Fri, 23 Apr 2021 12:27:02 +0200 (CEST)
Date: Fri, 23 Apr 2021 12:26:57 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] powerpc/sstep: =?utf-8?Q?A?=
 =?utf-8?Q?dd_emulation_support_for_=E2=80=98setb=E2=80=99?= instruction
Message-ID: <20210423102657.GA22427@lt-gp.iram.es>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <20210422191334.GE27473@gate.crashing.org>
 <20210422221618.GA30594@lt-gp.iram.es>
 <20210422232616.GI27473@gate.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20210422232616.GI27473@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Attachment-Name: setb.c
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=joCu6e9g6ilQIqMvekT2aAzdqjGP3eAVXOJXiZNph1M=;
 b=eSYwoJRlI/v3/r9zDEyjRSS3CMd/Ka5rkNflVxKuHNXg8v+yRBt+kWdSbRG5knuGTXTlUKmebp5G
 XdByIIAdlKN2KifC7OXaVgvtSnML9uXzUJ3cJpvUAgWaeE+BULVlTNPQjKqor4T6RtGSyAWcoK/b
 +w9b4UuUCjocNjcLIQJLfasAR19MfG1g3cdg/NKdXGJEntC0CyDhr1lA4Hd5K67BbFMVoMzNXwtM
 F7nzr+MpZ8Vbkmt4YttvACHJrJAvWTmtkXfErywqz5r6dPYxVBbZgY0ST4r/g6hLamodTJ9MWofL
 UJ15OhlJ+dLuqkE4pmQzD54+SHGuMVNMvfcFcw==
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


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 06:26:16PM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Apr 23, 2021 at 12:16:18AM +0200, Gabriel Paubert wrote:
> > On Thu, Apr 22, 2021 at 02:13:34PM -0500, Segher Boessenkool wrote:
> > > On Fri, Apr 16, 2021 at 05:44:52PM +1000, Daniel Axtens wrote:
> > > > Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
> > > > > +			if ((regs->ccr) & (1 << (31 - ra)))
> > > > > +				op->val = -1;
> > > > > +			else if ((regs->ccr) & (1 << (30 - ra)))
> > > > > +				op->val = 1;
> > > > > +			else
> > > > > +				op->val = 0;
> > > 
> > > It imo is clearer if written
> > > 
> > > 			if ((regs->ccr << ra) & 0x80000000)
> > > 				op->val = -1;
> > > 			else if ((regs->ccr << ra) & 0x40000000)
> > > 				op->val = 1;
> > > 			else
> > > 				op->val = 0;
> > > 
> > > but I guess not everyone agrees :-)
> > 
> > But this can be made jump free :-):
> > 
> > 	int tmp = regs->ccr << ra;
> > 	op->val = (tmp >> 31) | ((tmp >> 30) & 1);
> 
> The compiler will do so automatically (or think of some better way to
> get the same result); in source code, what matters most is readability,
> or clarity in general (also clarity to the compiler).

I just did a test (trivial code attached) and the original code always
produces one conditional branch at -O2, at least with the cross-compiler
I have on Debian (gcc 8.3). I have tested both -m32 and -m64. The 64 bit
version produces an unnecessary "extsw", so I wrote the second version
splitting the setting of the return value which gets rid of it.

The second "if" is fairly simple to optimize and the compiler does it
properly.

Of course with my suggestion the compiler does not produce any branch. 
But it needs a really good comment.


> 
> (Right shifts of negative numbers are implementation-defined in C,
> fwiw -- but work like you expect in GCC).

Well, I'm not worried about it, since I'd expect a compiler that does
logical right shifts on signed valued to break so much code that it
would be easily noticed (also in the kernel).


> 
> > (IIRC the srawi instruction sign-extends its result to 64 bits).
> 
> If you consider it to work on 32-bit inputs, yeah, that is a simple way
> to express it.
> 
> > > > CR field:      7    6    5    4    3    2    1    0
> > > > bit:          0123 0123 0123 0123 0123 0123 0123 0123
> > > > normal bit #: 0.....................................31
> > > > ibm bit #:   31.....................................0
> > > 
> > > The bit numbers in CR fields are *always* numbered left-to-right.  I
> > > have never seen anyone use LE for it, anyway.
> > > 
> > > Also, even people who write LE have the bigger end on the left normally
> > > (they just write some things right-to-left, and other things
> > > left-to-right).
> > 
> > Around 1985, I had a documentation for the the National's 32032
> > (little-endian) processor family, and all the instruction encodings were
> > presented with the LSB on the left and MSB on the right.
> 
> Ouch!  Did they write "regular" numbers with the least significant digit
> on the left as well?

No, they were not that sadistic!

At least instructions were a whole number of bytes, unlike the iAPX432
where jumps needed to encode target addresses down to the bit level.

> 
> > BTW on these processors, the immediate operands and the offsets (1, 2 or
> > 4 bytes) for the addressing modes were encoded in big-endian byte order,
> > but I digress. Consistency is overrated ;-)
> 
> Inconsistency is the spice of life, yeah :-)

;-)

	Gabriel

 
--huq684BweRXVnRxX
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="setb.c"

long setb_cond(int cr, int shift)
{
	long ret;
	if ((cr << shift) & 0x80000000)
		ret = -1;
	else if ((cr << shift) & 0x40000000)
		ret = 1;
	else
		ret = 0;
	return ret;
}

long setb_uncond(int cr, int shift)
{
	int tmp = cr << shift;
	long ret;
	ret = (tmp >> 31) | ((tmp >> 30) & 1);
	return ret;
}

long setb_uncond2(int cr, int shift)
{
	int tmp = cr << shift;
	long ret;
	ret = (tmp >> 31);
	ret |= ((tmp >> 30) & 1);
	return ret;
}

--huq684BweRXVnRxX--
