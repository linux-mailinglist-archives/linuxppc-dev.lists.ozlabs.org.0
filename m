Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3951479E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 10:00:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483tQ85WxxzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 20:00:16 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483tNK6K4CzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 19:58:41 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00O8wVx7016348;
 Fri, 24 Jan 2020 02:58:31 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00O8wU1T016347;
 Fri, 24 Jan 2020 02:58:30 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 24 Jan 2020 02:58:30 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/2] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
Message-ID: <20200124085830.GT3191@gate.crashing.org>
References: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
 <87d0b9iez3.fsf@mpe.ellerman.id.au>
 <f4196f83-82ac-4df0-8c15-267a2c6c07ba@c-s.fr>
 <74cb4227-1a24-6fe1-2df4-3d4b069453c4@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74cb4227-1a24-6fe1-2df4-3d4b069453c4@c-s.fr>
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

On Fri, Jan 24, 2020 at 07:03:36AM +0000, Christophe Leroy wrote:
> >Le 24/01/2020 à 06:46, Michael Ellerman a écrit :
> >>
> >>If I do this it seems to work, but feels a little dicey:
> >>
> >>    asm ("" : "=r" (r1));
> >>    sp = r1 & (THREAD_SIZE - 1);
> >
> >
> >Or we could do add in asm/reg.h what we have in boot/reg.h:
> >
> >register void *__stack_pointer asm("r1");
> >#define get_sp()    (__stack_pointer)
> >
> >And use get_sp()
> >
> 
> It works, and I guess doing it this way is acceptable as it's exactly 
> what's done for current in asm/current.h with register r2.

That is a *global* register variable.  That works.  We still need to
document a bit better what it does exactly, but this is the expected
use case, so that will work.

> Now I (still) get:
> 
> 	sp = get_sp() & (THREAD_SIZE - 1);
>  b9c:	54 24 04 fe 	clrlwi  r4,r1,19
> 	if (unlikely(sp < 2048)) {
>  ba4:	2f 84 07 ff 	cmpwi   cr7,r4,2047
> 
> Allthough GCC 8.1 what doing exactly the same with the form CLANG don't 
> like:
> 
> 	register unsigned long r1 asm("r1");
> 	long sp = r1 & (THREAD_SIZE - 1);
>  b84:	54 24 04 fe 	clrlwi  r4,r1,19
> 	if (unlikely(sp < 2048)) {
>  b8c:	2f 84 07 ff 	cmpwi   cr7,r4,2047

Sure, if it did what you expected, things will usually work out fine ;-)

(Pity that the compiler didn't come up with
    rlwinm. r4,r1,0,19,20
    bne bad
Or are the low bits of r4 used later again?)


Segher
