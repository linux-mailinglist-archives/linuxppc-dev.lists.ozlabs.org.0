Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACAF110456
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 19:37:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S9hX6Zg7zDqJS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 05:37:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S9fR3GzdzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 05:35:59 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xB3IZXE4022796;
 Tue, 3 Dec 2019 12:35:33 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xB3IZV1r022795;
 Tue, 3 Dec 2019 12:35:31 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 3 Dec 2019 12:35:31 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191203183531.GT24609@gate.crashing.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wobedpit.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Dec 03, 2019 at 03:03:22PM +1100, Michael Ellerman wrote:
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
> I've certainly heard it said that on some OF's the phandle was just ==
> the address of the internal representation, and I guess maybe for SLOF
> that is true.

It is (or was).  In many OFs it is just the effective address of some
node structure.  SLOF runs with translation off normally.

> They seem to vary wildly though, eg. on an Apple G5:

Apple OF runs with translation on usually.  IIRC these are effective
addresses as well.

The OF they have on G5 machines is mostly 32-bit, for compatibility is my
guess (for userland things dealing with addresses from OF, importantly).

>   $ find /proc/device-tree/ -name phandle | xargs lsprop | head -10
>   /proc/device-tree/vsp@0,f9000000/veo@f9180000/phandle ff970848
>   /proc/device-tree/vsp@0,f9000000/phandle ff970360
>   /proc/device-tree/vsp@0,f9000000/veo@f9080000/phandle ff970730
>   /proc/device-tree/nvram@0,fff04000/phandle ff967fb8
>   /proc/device-tree/xmodem/phandle ff9655e8
>   /proc/device-tree/multiboot/phandle ff9504f0
>   /proc/device-tree/diagnostics/phandle ff965550
>   /proc/device-tree/options/phandle ff893cf0
>   /proc/device-tree/openprom/client-services/phandle ff8925b8
>   /proc/device-tree/openprom/phandle ff892458
> 
> That machine does not have enough RAM for those to be 32-bit real
> addresses. I think Apple OF is running in virtual mode though (?), so
> maybe they are pointers?

Yes, I think the default is to have 8MB ram at the top of 4GB (which is
the physical address of the bootrom, btw) for OF.

> And on an IBM pseries machine they're a bit all over the place:
> 
>   /proc/device-tree/cpus/PowerPC,POWER8@40/ibm,phandle 10000040
>   /proc/device-tree/cpus/l2-cache@2005/ibm,phandle 00002005
>   /proc/device-tree/cpus/PowerPC,POWER8@30/ibm,phandle 10000030
>   /proc/device-tree/cpus/PowerPC,POWER8@20/ibm,phandle 10000020
>   /proc/device-tree/cpus/PowerPC,POWER8@10/ibm,phandle 10000010
>   /proc/device-tree/cpus/l2-cache@2003/ibm,phandle 00002003
>   /proc/device-tree/cpus/l2-cache@200a/ibm,phandle 0000200a
>   /proc/device-tree/cpus/l3-cache@3108/ibm,phandle 00003108
>   /proc/device-tree/cpus/l2-cache@2001/ibm,phandle 00002001
>   /proc/device-tree/cpus/l3-cache@3106/ibm,phandle 00003106
>   /proc/device-tree/cpus/ibm,phandle fffffff8
>   /proc/device-tree/cpus/l3-cache@3104/ibm,phandle 00003104
>   /proc/device-tree/cpus/l2-cache@2008/ibm,phandle 00002008
>   /proc/device-tree/cpus/l3-cache@3102/ibm,phandle 00003102
>   /proc/device-tree/cpus/l2-cache@2006/ibm,phandle 00002006
>   /proc/device-tree/cpus/l3-cache@3100/ibm,phandle 00003100
>   /proc/device-tree/cpus/PowerPC,POWER8@8/ibm,phandle 10000008
>   /proc/device-tree/cpus/l2-cache@2004/ibm,phandle 00002004
>   /proc/device-tree/cpus/PowerPC,POWER8@48/ibm,phandle 10000048
>   /proc/device-tree/cpus/PowerPC,POWER8@38/ibm,phandle 10000038
>   /proc/device-tree/cpus/l2-cache@2002/ibm,phandle 00002002
>   /proc/device-tree/cpus/PowerPC,POWER8@28/ibm,phandle 10000028
>   /proc/device-tree/cpus/l3-cache@3107/ibm,phandle 00003107
>   /proc/device-tree/cpus/PowerPC,POWER8@18/ibm,phandle 10000018
>   /proc/device-tree/cpus/l2-cache@2000/ibm,phandle 00002000
>   /proc/device-tree/cpus/l3-cache@3105/ibm,phandle 00003105
>   /proc/device-tree/cpus/l3-cache@3103/ibm,phandle 00003103
>   /proc/device-tree/cpus/l3-cache@310a/ibm,phandle 0000310a
>   /proc/device-tree/cpus/PowerPC,POWER8@0/ibm,phandle 10000000
>   /proc/device-tree/cpus/l2-cache@2007/ibm,phandle 00002007
>   /proc/device-tree/cpus/l3-cache@3101/ibm,phandle 00003101
>   /proc/device-tree/pci@80000002000001b/ibm,phandle 2000001b

Some (the 1000xxxx) look like addresses as well.

> > So the hash array has 64 entries out which only 8 are populated. Using
> > hash_32() populates 29 entries.

> On the G5 it's similarly inefficient:
> [    0.007379] OF: of_populate_phandle_cache(242) Used entries: 31, hashed: 111

> And some output from a "real" pseries machine (IBM OF), which is
> slightly better:
> [    0.129467] OF: of_populate_phandle_cache(242) Used entries: 39, hashed: 81

> So yeah using hash_32() is quite a bit better in both cases.

Yup, no surprise there.  And hash_32 is very cheap to compute.

> And if I'm reading your patch right it would be a single line change to
> switch, so that seems like it's worth doing to me.

Agreed!

Btw.  Some OFs mangle the phandles some way, to make it easier to catch
people using it as an address (and similarly, mangle ihandles differently,
so you catch confusion between ihandles and phandles as well).  Like a
simple xor, with some odd number preferably.  You should assume *nothing*
about phandles, they are opaque identifiers.


Segher
