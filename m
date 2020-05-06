Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044571C7D2E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 00:20:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HWJ907PtzDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 08:20:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49HWFb1FyGzDqv6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 08:18:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 046MI3xQ029691;
 Wed, 6 May 2020 17:18:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 046MI1Hs029690;
 Wed, 6 May 2020 17:18:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 6 May 2020 17:18:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200506221801.GW31009@gate.crashing.org>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
 <20200505153245.GN31009@gate.crashing.org>
 <87pnbhdgkw.fsf@mpe.ellerman.id.au>
 <20200506175849.GT31009@gate.crashing.org>
 <bd336b0f-9cf7-e2ce-e0a8-1891599638d1@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd336b0f-9cf7-e2ce-e0a8-1891599638d1@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 06, 2020 at 08:10:57PM +0200, Christophe Leroy wrote:
> Le 06/05/2020 à 19:58, Segher Boessenkool a écrit :
> >>  #define __put_user_asm_goto(x, addr, label, op)			\
> >>  	asm volatile goto(					\
> >>-		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
> >>+		"1:	" op "%X1 %0,%1	# put_user\n"		\
> >>  		EX_TABLE(1b, %l2)				\
> >>  		:						\
> >>-		: "r" (x), "m<>" (*addr)				\
> >>+		: "r" (x), "m" (*addr)				\
> >>  		:						\
> >>  		: label)
> >
> >Like that.  But you will have to do that to *all* places we use the "<>"
> >constraints, or wait for more stuff to fail?  And, there probably are
> >places we *do* want update form insns used (they do help in some loops,
> >for example)?
> >
> 
> AFAICT, git grep "m<>" provides no result.

Ah, okay.

> However many places have %Ux:

<snip>

Yes, all of those are from when "m" still meant what "m<>" is now.  For
seeing how many update form insns can be generated (and how much that
matters), these all should be fixed, at a minimum.


Segher
