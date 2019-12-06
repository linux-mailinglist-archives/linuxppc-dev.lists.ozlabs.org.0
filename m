Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327A1159B9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:43:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V8Kg2gcmzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 10:43:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V8H02lCjzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 10:41:00 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xB6NeZ43027638;
 Fri, 6 Dec 2019 17:40:35 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xB6NeYbA027637;
 Fri, 6 Dec 2019 17:40:34 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 6 Dec 2019 17:40:34 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191206234034.GW3152@gate.crashing.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
 <20191203183531.GT24609@gate.crashing.org>
 <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Dec 05, 2019 at 07:37:24PM -0600, Frank Rowand wrote:
> On 12/3/19 12:35 PM, Segher Boessenkool wrote:
> > Btw.  Some OFs mangle the phandles some way, to make it easier to catch
> > people using it as an address (and similarly, mangle ihandles differently,
> > so you catch confusion between ihandles and phandles as well).  Like a
> > simple xor, with some odd number preferably.  You should assume *nothing*
> > about phandles, they are opaque identifiers.
> 
> For arm32 machines that use dtc to generate the devicetree, which is a
> very large user base, we certainly can make assumptions about phandles.

I was talking about OF.  Phandles are explicitly defined to be opaque
tokens.  If there is an extra meaning to them in flattened device trees,
well, the kernel should then only depend on that there, not for more
general phandles.  Where is this documented btw?

> Especially because the complaints about the overhead of phandle based
> lookups have been voiced by users of this specific set of machines.
> 
> For systems with a devicetree that does not follow the assumptions, the
> phandle cache should not measurably increase the overhead of phandle
> based lookups.

It's an extra memory access and extra code to execute, for not much gain
(if anything).  While with a reasonable hash function it will be good
for everyone.

> If you have measurements of a system where implementing the phandle
> cache increased the overhead,

Are you seriously saying you think this code can run in zero time and
space on most systems?

> and the additional overhead is a concern
> (such as significantly increasing boot time) then please share that
> information with us.  Otherwise this is just a theoretical exercise.

The point is that this code could be easily beneficial for most (or all)
users, not just those that use dtc-constructed device trees.  It is
completely obvious that having a worse cache hash function results in
many more lookups.  Whether that results in something expressed as
milliseconds on tiny systems or microseconds on bigger systems is
completely beside the point.


Segher
