Return-Path: <linuxppc-dev+bounces-10126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACBAFA206
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 23:38:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZP4r4NPWz2y06;
	Sun,  6 Jul 2025 07:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751751500;
	cv=none; b=kg6gjuWlOPhac9TZJNP6yvFb2AWERTUnv9/1hAeGaPiuSh8bruFn0DYDbHzwd1LF98p+VP/CFGchtCNP9jvd+P319M3M4ZA7U4Q2rfpDKa4fd4dIzcOndsljNGVdbd9HHwoN/NAPCf1k1ZrYMCcltioAmzVVcfDej/1LUsV/W89CL8F/DvO2Ci2OySDKOmYULkR3axyIEe+tpa76K/aYxb6M+YFgIzsXEVuj2HhBe3OhlpJCN/1W9u3R8tuj/15486E1wXduCWEtK8QTjgIhCwKe2bugFaLXcvSqoj0UFwj5ErZxIM64LDLi4j0IpKw7sPbmcLSnLNu7ap7zZBzGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751751500; c=relaxed/relaxed;
	bh=mZ0lsKMgODJyRyk9xL5lvypoh7UYScneWRMbFoGZh0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2H/hi4mvL8VQOuhrwmlPnauuYB1vfTlblnwIZ9NWj9ARQQA6L0tFSSnufsM+nhUWYbU/Xrq0K/qqXKsaj/k2/jB81MQjKACBEfyW6ETVDBIUx8Ny02TttNh3rpHiIG+THn+MfrS54FsDiVietfYO5MtW40NRnJwvRo1VX8AbZnTwMlgT3/TnxDTJstFjvikeroxfPGr+/pST2cwjddNtqCJserrzQjbgYF7cSmAq1o2vJezHaohciZdYbcsErI31QW39TbnMRWOPd9+YRtVNHQZDLuz7RrADgKAhkhF6tKP3SUG1DI9lVatgGe10iSDjrCGAMHyCL6dMnju7P2iMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZP4p3PF6z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 07:38:17 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 565LbfR5180467;
	Sat, 5 Jul 2025 16:37:42 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 565Lbbv7180466;
	Sat, 5 Jul 2025 16:37:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 5 Jul 2025 16:37:37 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Andre Almeida <andrealmeid@igalia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <aGmbIbifTv0Tl01k@gate>
References: <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
 <20250624131714.GG17294@gate.crashing.org>
 <20250624175001.148a768f@pumpkin>
 <20250624182505.GH17294@gate.crashing.org>
 <20250624220816.078f960d@pumpkin>
 <83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
 <20250626220148.GR17294@gate.crashing.org>
 <20250705193332.251e0b1f@pumpkin>
 <aGmH_Y4248gRRpoq@gate>
 <20250705220538.1bbe5195@pumpkin>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705220538.1bbe5195@pumpkin>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Jul 05, 2025 at 10:05:38PM +0100, David Laight wrote:
> On Sat, 5 Jul 2025 15:15:57 -0500
> Segher Boessenkool <segher@kernel.crashing.org> wrote:
> 
> ...
> > The isel machine instruction is super expensive on p8: it is marked as
> > first in an instruction group, and has latency 5 for the GPR sources,
> > and 8 for the CR field source.
> > 
> > On p7 it wasn't great either, it was actually converted to a branch
> > sequence internally!
> 
> Ugg...
> 
> You'd think they'd add instructions that can be implemented.
> It isn't as though isel is any harder than 'add with carry'.

It is though!  isel was the first instruction that takes both GPR inputs
and a CR field input.  We now have more, the ISA 3.0 (p9) setb insn,
and esp. the extremely useful ISA 3.1 (p10) set[n]bc[r] insns -- well,
those don't take any GPR inputs actually, but like isel their output is
a GPR :-)

> Not that uncommon, IIRC amd added adox/adcx (add carry using the
> overflow/carry flag and without changing any other flags) as very

We have a similar "addex" insn since p9, which allows to use the OV
bit instead of the CA bit, and prepares to allow an extra three possible
bits as carry bits, too.  Using it you can run multiple carry chains
in parallel using insns very close to the traditional stuff.

The compiler still doesn't ever generate this, it is mostly useful
for handcoded assembler routines.

The carry bits are stored in the XER register, the "fixed-point
exception register", while results from comparison instructions are
stored in the CR, which holds eight four-bit CR fields, which you can
use in conditional jumps, or in isel and the like, or in the crlogical
insns (which can do any logic function on two CR field inputs and store
in a third, just like the logical insns on GPRs that also have the full
complement of 14 two source functions).

> slow instructions. Intel invented them without making jcxz (dec %cx
> and jump non-zero) fast - so you can't (easily) put them in a loop.
> Not to mention all the AVX512 fubars. 

Sounds lovely :-)

> Conditional move is more of a problem with a mips-like cpu where
> alu ops read two registers and write a third.

Like most Power implementations as well.

> You don't want to do a conditional write because it messes up
> the decision of whether to forward the alu result to the following
> instruction.
> So I think you might need to do 'cmov odd/even' and read the LSB
> from a third copy (or third read port) of the registers indexed
> by what would normally be the 'output' register number.
> Then tweak the register numbers early in the pipeline so that the
> result goes to one of the 'input' registers rather than the normal
> 'output' one.
> Not really that hard - could add to the cpu I did in 1/2 a day :-)

On p9 and later both GPR (or constant) inputs are fed into the execution
unit as well as some CR bit, and it just writes to a GPR.  Easier for
the hardware, easier for the compiler, and easier for the programmer!
Win-win-win.  The kind of tradeoffs I like best :-)


Segher

