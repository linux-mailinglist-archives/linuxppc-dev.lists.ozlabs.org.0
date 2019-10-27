Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D56FE6501
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 20:09:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471S8234KRzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 06:09:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 471S614FPJzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 06:07:35 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9RJ7Apj017967;
 Sun, 27 Oct 2019 14:07:10 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x9RJ79gY017964;
 Sun, 27 Oct 2019 14:07:09 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 27 Oct 2019 14:07:09 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
Message-ID: <20191027190709.GZ28442@gate.crashing.org>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
 <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
 <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
 <alpine.DEB.2.21.1910262026340.10190@nanos.tec.linutronix.de>
 <20191026230609.GY28442@gate.crashing.org>
 <8e4d0b82-a7a1-b7f1-308e-df871b32d317@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e4d0b82-a7a1-b7f1-308e-df871b32d317@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 27, 2019 at 10:21:25AM +0100, Christophe Leroy wrote:
> Le 27/10/2019 à 01:06, Segher Boessenkool a écrit :
> >The hand-optimised asm code will pretty likely win handsomely, whatever
> >you do.  Especially on cores like the 885 (no branch prediction, single
> >issue, small caches, etc.: every instruction counts).
> >
> >Is there any reason to replace this hand-optimised code?  It was written
> >for exacty this reason?  These functions are critical and should be as
> >fast as possible.
> 
> Well, all this started with COARSE clocks not being supported by PPC32 
> VDSO. I first submitted a series with a set of optimisations including 
> the implementation of COARSE clocks 
> (https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=126779)
> 
> Then after a comment received on patch 4 of the series from Santosh 
> Sivaraj asking for a common implementation of it for PPC32 and PPC64, I 
> started looking into making the whole VDSO source code common to PPC32 
> and PPC64. Most functions are similar. Time functions are also rather 
> similar but unfortunately don't use the same registers. They also don't 
> cover all possible clocks. And getres() is also buggy, see series 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=110321

That is all nice work :-)

> So instead of reworking the existing time functions, I started 
> investigating whether we could plug powerpc to the generic 
> implementation. One drawback of PPC is that we need to setup an ASM 
> trampoline to handle the SO bit as it can't be handled from C directly, 
> can it ?

There is no way to say what CR bits to return.  The ABI requires some of
those bits to be preserved, and some are volatile.  System calls use a
different ABI, one the compiler knows nothing about, so you cannot even
show system calls as calls to the compiler.

> How critical are these functions ? Although we have a slight degration 
> with the C implementation, they are still way faster than the 
> corresponding syscall.

"Slight":

	With current powerpc/32 ASM VDSO:

	gettimeofday:    vdso: 750 nsec/call
	clock-getres-realtime:    vdso: 382 nsec/call
	clock-gettime-realtime:    vdso: 928 nsec/call
	clock-getres-monotonic:    vdso: 382 nsec/call
	clock-gettime-monotonic:    vdso: 1033 nsec/call

	Once switched to C implementation:

	gettimeofday:    vdso: 1533 nsec/call
	clock-getres-realtime:    vdso: 853 nsec/call
	clock-gettime-realtime:    vdso: 1570 nsec/call
	clock-getres-monotonic:    vdso: 835 nsec/call
	clock-gettime-monotonic:    vdso: 1605 nsec/call


---> Those that are not more than two times slower are almost that. <---


This also needs measurements on more representative PowerPC cores, say
some G3 or G4; and on modern CPUs (Power7/8/9).

It also needs context with those measurements: what CPU core is it?
Running at what frequency clock?

> Another thing I was wondering, is it worth using the 64 bit timebase on 
> PPC32 ? As far as I understand, the timebase is there to calculate a 
> linear date update since last VDSO datapage update. How often is the 
> VDSO datapage updated ? On the 885 clocked at 132Mhz, the timebase is at 
> 8.25 Mhz, which means it needs more than 8 minutes to loop over 32 bits.

On most PowerPC cores the time base is incremented significantly faster.
Usual speeds for older cores are 50MHz to 100MHz, and for newer cores ten
times that.  Recommended frequency is currently 512MHz, so you'll wrap the
low 32 bits in 8s or so on those, and in about a minute on many powermac
etc. machines already.  How can you know this long hasn't passed since the
last time you read the high half of the time base?  Without reading that
high part?

The current (assembler) code already optimises converting this to some
other scale quite well, better than a compiler can (see __do_get_tspec).


Segher
