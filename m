Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07035E8AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 00:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKfgR1BsVz3c0p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 08:00:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FKfg44Ztlz2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 08:00:31 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13DLw5dB022427;
 Tue, 13 Apr 2021 16:58:05 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13DLw41j022426;
 Tue, 13 Apr 2021 16:58:04 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 13 Apr 2021 16:58:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
Message-ID: <20210413215803.GT26583@gate.crashing.org>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <20210412215428.GM26583@gate.crashing.org>
 <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
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

On Tue, Apr 13, 2021 at 06:33:19PM +0200, Christophe Leroy wrote:
> Le 12/04/2021 à 23:54, Segher Boessenkool a écrit :
> >On Thu, Apr 08, 2021 at 03:33:44PM +0000, Christophe Leroy wrote:
> >>For clear bits, on 32 bits 'rlwinm' can be used instead or 'andc' for
> >>when all bits to be cleared are consecutive.
> >
> >Also on 64-bits, as long as both the top and bottom bits are in the low
> >32-bit half (for 32 bit mode, it can wrap as well).
> 
> Yes. But here we are talking about clearing a few bits, all other ones must 
> remain unchanged. An rlwinm on PPC64 will always clear the upper part, 
> which is unlikely what we want.

No, it does not.  It takes the low 32 bits of the source reg, duplicated
to the top half as well, then rotated, then ANDed with the mask (which
can wrap around).  This isn't very often very useful, but :-)

(One useful operation is splatting 32 bits to both halves of a 64-bit
register, which is just rlwinm d,s,0,1,0).

If you only look at the low 32 bits, it does exactly the same as on
32-bit implementations.

> >>For the time being only
> >>handle the single bit case, which we detect by checking whether the
> >>mask is a power of two.
> >
> >You could look at rs6000_is_valid_mask in GCC:
> >   <https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/rs6000/rs6000.c;h=48b8efd732b251c059628096314848305deb0c0b;hb=HEAD#l11148>
> >used by rs6000_is_valid_and_mask immediately after it.  You probably
> >want to allow only rlwinm in your case, and please note this checks if
> >something is a valid mask, not the inverse of a valid mask (as you
> >want here).
> 
> This check looks more complex than what I need. It is used for both rlw... 
> and rld..., and it calculates the operants.  The only thing I need is to 
> validate the mask.

It has to do exactly the same thing for rlwinm as for all 64-bit
variants (rldicl, rldicr, rldic).

One side effect of calculation the bit positions with exact_log2 is that
that returns negative if the argument is not a power of two.

Here is a simpler way, that handles all cases:  input in "u32 val":

	if (!val)
		return nonono;
	if (val & 1)
		val = ~val;	// make the mask non-wrapping
	val += val & -val;	// adding the low set bit should result in
				// at most one bit set
	if (!(val & (val - 1)))
		return okidoki_all_good;

> I found a way: By anding the mask with the complement of itself rotated by 
> left bits to 1, we identify the transitions from 0 to 1. If the result is a 
> power of 2, it means there's only one transition so the mask is as expected.

That does not handle all cases (it misses all bits set at least).  Which
isn't all that interesting of course, but is a valid mask (but won't
clear any bits, so not too interesting for your specific case :-) )


Segher
