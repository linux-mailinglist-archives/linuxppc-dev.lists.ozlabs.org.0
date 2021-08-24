Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D23F65FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 19:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvG6Q1Kphz2yw3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GvG6203rmz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 03:18:17 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17OHFvAg028670;
 Tue, 24 Aug 2021 12:15:57 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17OHFuD6028666;
 Tue, 24 Aug 2021 12:15:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 Aug 2021 12:15:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/booke: Avoid link stack corruption in several
 places
Message-ID: <20210824171556.GJ1583@gate.crashing.org>
References: <e9fbc285eceb720e6c0e032ef47fe8b05f669b48.1629791751.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9fbc285eceb720e6c0e032ef47fe8b05f669b48.1629791751.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Aug 24, 2021 at 07:56:26AM +0000, Christophe Leroy wrote:
> Use bcl 20,31,+4 instead of bl in order to preserve link stack.

You use $+4 actually, which is clearer than .+4 or just +4 (and I am
surprised that the latter even works btw, I never knew :-) -- either
way it looks like a typo).

> -	bl	invstr				/* Find our address */
> +	bcl	20,31,$+4			/* Find our address */
>  invstr:	mflr	r6				/* Make it accessible */

You can remove the label now.  This isn't true in all cases, but here
you can (all times it is called "invstr").

> @@ -85,7 +85,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
>  	addi	r6,r6,10
>  	slw	r6,r8,r6	/* convert to mask */
>  
> -	bl	1f		/* Find our address */
> +	bcl	20,31,$+4	/* Find our address */
>  1:	mflr	r7

Here, too.

> @@ -1045,7 +1045,7 @@ head_start_47x:
>  	sync
>  
>  	/* Find the entry we are running from */
> -	bl	1f
> +	bcl	20,31,$+4
>  1:	mflr	r23
>  	tlbsx	r23,0,r23
>  	tlbre	r24,r23,0

And here.

> @@ -1132,7 +1132,7 @@ _GLOBAL(switch_to_as1)
>  	bne	1b
>  
>  	/* Get the tlb entry used by the current running code */
> -	bl	0f
> +	bcl	20,31,$+4
>  0:	mflr	r4
>  	tlbsx	0,r4

> @@ -1166,7 +1166,7 @@ _GLOBAL(switch_to_as1)
>  _GLOBAL(restore_to_as0)
>  	mflr	r0
>  
> -	bl	0f
> +	bcl	20,31,$+4
>  0:	mflr	r9
>  	addi	r9,r9,1f - 0b

And these.

> --- a/arch/powerpc/mm/nohash/tlb_low.S
> +++ b/arch/powerpc/mm/nohash/tlb_low.S
> @@ -199,7 +199,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_476_DD2)
>   * Touch enough instruction cache lines to ensure cache hits
>   */
>  1:	mflr	r9
> -	bl	2f
> +	bcl	20,31,$+4
>  2:	mflr	r6
>  	li	r7,32
>  	PPC_ICBT(0,R6,R7)		/* touch next cache line */
> @@ -414,7 +414,7 @@ _GLOBAL(loadcam_multi)
>  	 * Set up temporary TLB entry that is the same as what we're
>  	 * running from, but in AS=1.
>  	 */
> -	bl	1f
> +	bcl	20,31,$+4
>  1:	mflr	r6
>  	tlbsx	0,r8
>  	mfspr	r6,SPRN_MAS1

And these too.

There does not see to be a warning for usused local labels, it would be
useful in this case :-)


Segher
