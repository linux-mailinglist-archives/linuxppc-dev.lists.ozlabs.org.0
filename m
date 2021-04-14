Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB535F9B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL8S858m8z3bwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 03:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FL8Rp5xqhz304X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 03:22:29 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13EHK42L023677;
 Wed, 14 Apr 2021 12:20:04 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13EHK3HZ023672;
 Wed, 14 Apr 2021 12:20:03 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 14 Apr 2021 12:20:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
Message-ID: <20210414172003.GX26583@gate.crashing.org>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <20210412215428.GM26583@gate.crashing.org>
 <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
 <20210413215803.GT26583@gate.crashing.org>
 <1618365589.67fxh7cot9.astroid@bobo.none>
 <20210414122409.GV26583@gate.crashing.org>
 <daacce9f-1900-1034-980b-be5a58d6be09@csgroup.eu>
 <20210414151921.GW26583@gate.crashing.org>
 <efcabc9410cf4d03b203749a02e5a935@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efcabc9410cf4d03b203749a02e5a935@AcuMS.aculab.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 03:32:04PM +0000, David Laight wrote:
> From: Segher Boessenkool
> > Sent: 14 April 2021 16:19
> ...
> > > Could the kernel use GCC builtin atomic functions instead ?
> > >
> > > https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html
> > 
> > Certainly that should work fine for the simpler cases that the atomic
> > operations are meant to provide.  But esp. for not-so-simple cases the
> > kernel may require some behaviour provided by the existing assembler
> > implementation, and not by the atomic builtins.
> > 
> > I'm not saying this cannot work, just that some serious testing will be
> > needed.  If it works it should be the best of all worlds, so then it is
> > a really good idea yes :-)
> 
> I suspect they just add an extra layer of abstraction that makes it
> even more difficult to verify and could easily get broken by a compiler
> update (etc).

I would say it uses an existing facility, instead of creating a kernel-
specific one.

> The other issue is that the code needs to be correct with compiled
> with (for example) -O0.
> That could very easily break anything except the asm implementation
> if additional memory accesses and/or increased code size cause grief.

The compiler generates correct code.  New versions of the compiler or
old, -O0 or not, under any phase of the moon.

Of course sometimes the compiler is broken, but there are pre-existing
ways of dealing with that, and there is no reason at all to think this
would break more often than random other code.


Segher
