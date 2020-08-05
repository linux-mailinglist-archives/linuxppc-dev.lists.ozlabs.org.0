Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ADD23CB5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 16:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMD5S5TQZzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 00:09:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4BMCyj5ySXzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 00:03:41 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 075E392I022366;
 Wed, 5 Aug 2020 09:03:09 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 075E37YK022365;
 Wed, 5 Aug 2020 09:03:07 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 5 Aug 2020 09:03:07 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v10 2/5] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
Message-ID: <20200805140307.GO6753@gate.crashing.org>
References: <cover.1596611196.git.christophe.leroy@csgroup.eu>
 <348528c33cd4007f3fee7fe643ef160843d09a6c.1596611196.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <348528c33cd4007f3fee7fe643ef160843d09a6c.1596611196.git.christophe.leroy@csgroup.eu>
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
Cc: nathanl@linux.ibm.com, linux-arch@vger.kernel.org,
 vincenzo.frascino@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Aug 05, 2020 at 07:09:23AM +0000, Christophe Leroy wrote:
> Provide vdso_shift_ns(), as the generic x >> s gives the following
> bad result:
> 
>   18:	35 25 ff e0 	addic.  r9,r5,-32
>   1c:	41 80 00 10 	blt     2c <shift+0x14>
>   20:	7c 64 4c 30 	srw     r4,r3,r9
>   24:	38 60 00 00 	li      r3,0
> ...
>   2c:	54 69 08 3c 	rlwinm  r9,r3,1,0,30
>   30:	21 45 00 1f 	subfic  r10,r5,31
>   34:	7c 84 2c 30 	srw     r4,r4,r5
>   38:	7d 29 50 30 	slw     r9,r9,r10
>   3c:	7c 63 2c 30 	srw     r3,r3,r5
>   40:	7d 24 23 78 	or      r4,r9,r4
> 
> In our case the shift is always <= 32. In addition,  the upper 32 bits
> of the result are likely nul. Lets GCC know it, it also optimises the
> following calculations.
> 
> With the patch, we get:
>    0:	21 25 00 20 	subfic  r9,r5,32
>    4:	7c 69 48 30 	slw     r9,r3,r9
>    8:	7c 84 2c 30 	srw     r4,r4,r5
>    c:	7d 24 23 78 	or      r4,r9,r4
>   10:	7c 63 2c 30 	srw     r3,r3,r5

See below.  Such code is valid on PowerPC for all shift < 64, and a
future version of GCC will do that (it is on various TODO lists, it is
bound to happen *some* day ;-), but it won't help you yet of course).


> +/*
> + * The macros sets two stack frames, one for the caller and one for the callee
> + * because there are no requirement for the caller to set a stack frame when
> + * calling VDSO so it may have omitted to set one, especially on PPC64
> + */

If the caller follows the ABI, there always is a stack frame.  So what
is going on?


> +/*
> + * powerpc specific delta calculation.
> + *
> + * This variant removes the masking of the subtraction because the
> + * clocksource mask of all VDSO capable clocksources on powerpc is U64_MAX
> + * which would result in a pointless operation. The compiler cannot
> + * optimize it away as the mask comes from the vdso data and is not compile
> + * time constant.
> + */

It cannot optimise it because it does not know shift < 32.  The code
below is incorrect for shift equal to 32, fwiw.

> +static __always_inline u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
> +{
> +	return (cycles - last) * mult;
> +}
> +#define vdso_calc_delta vdso_calc_delta
> +
> +#ifndef __powerpc64__
> +static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
> +{
> +	u32 hi = ns >> 32;
> +	u32 lo = ns;
> +
> +	lo >>= shift;
> +	lo |= hi << (32 - shift);
> +	hi >>= shift;


> +	if (likely(hi == 0))
> +		return lo;

Removing these two lines shouldn't change generated object code?  Or not
make it worse, at least.

> +	return ((u64)hi << 32) | lo;
> +}


What does the compiler do for just

static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
	return ns >> (shift & 31);
}

?


Segher
