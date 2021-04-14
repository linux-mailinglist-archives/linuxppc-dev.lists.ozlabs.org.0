Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26C35F765
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 17:21:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL5mb0D3Cz3bqG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 01:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FL5mG6nq0z30C1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 01:21:34 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13EFJM4R012182;
 Wed, 14 Apr 2021 10:19:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13EFJLFh012181;
 Wed, 14 Apr 2021 10:19:21 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 14 Apr 2021 10:19:21 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
Message-ID: <20210414151921.GW26583@gate.crashing.org>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <20210412215428.GM26583@gate.crashing.org>
 <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
 <20210413215803.GT26583@gate.crashing.org>
 <1618365589.67fxh7cot9.astroid@bobo.none>
 <20210414122409.GV26583@gate.crashing.org>
 <daacce9f-1900-1034-980b-be5a58d6be09@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daacce9f-1900-1034-980b-be5a58d6be09@csgroup.eu>
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 02:42:51PM +0200, Christophe Leroy wrote:
> Le 14/04/2021 � 14:24, Segher Boessenkool a �crit�:
> >On Wed, Apr 14, 2021 at 12:01:21PM +1000, Nicholas Piggin wrote:
> >>Would be nice if we could let the compiler deal with it all...
> >>
> >>static inline unsigned long lr(unsigned long *mem)
> >>{
> >>         unsigned long val;
> >>
> >>         /*
> >>          * This doesn't clobber memory but want to avoid memory 
> >>          operations
> >>          * moving ahead of it
> >>          */
> >>         asm volatile("ldarx     %0, %y1" : "=r"(val) : "Z"(*mem) : 
> >>         "memory");
> >>
> >>         return val;
> >>}
> >
> >(etc.)
> >
> >That can not work reliably: the compiler can put random instructions
> >between the larx and stcx. this way, and you then do not have guaranteed
> >forward progress anymore.  It can put the two in different routines
> >(after inlining and other interprocedural optimisations), duplicate
> >them, make a different number of copies of them, etc.
> >
> >Nothing of that is okay if you want to guarantee forward progress on all
> >implementations, and also not if you want to have good performance
> >everywhere (or anywhere even).  Unfortunately you have to write all
> >larx/stcx. loops as one block of assembler, so that you know exactly
> >what instructions will end up in your binary.
> >
> >If you don't, it will fail mysteriously after random recompilations, or
> >have performance degradations, etc.  You don't want to go there :-)
> >
> 
> Could the kernel use GCC builtin atomic functions instead ?
> 
> https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html

Certainly that should work fine for the simpler cases that the atomic
operations are meant to provide.  But esp. for not-so-simple cases the
kernel may require some behaviour provided by the existing assembler
implementation, and not by the atomic builtins.

I'm not saying this cannot work, just that some serious testing will be
needed.  If it works it should be the best of all worlds, so then it is
a really good idea yes :-)


Segher
