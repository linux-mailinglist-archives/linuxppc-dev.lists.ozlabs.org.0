Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DB36370E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 19:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNcs06VGbz3bqX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 03:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FNcrg3Y6Bz3000
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 03:49:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13IHknVD022627;
 Sun, 18 Apr 2021 12:46:49 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13IHkmbE022624;
 Sun, 18 Apr 2021 12:46:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 18 Apr 2021 12:46:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
Message-ID: <20210418174648.GN26583@gate.crashing.org>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
 <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 18, 2021 at 06:24:29PM +0200, Christophe Leroy wrote:
> Le 17/04/2021 à 22:17, Randy Dunlap a écrit :
> >Should the code + Kconfigs/Makefiles handle that kind of
> >kernel config or should ALTIVEC always mean PPC_FPU as well?
> 
> As far as I understand, Altivec is completely independant of FPU in Theory. 

And, as far as the hardware is concerned, in practice as well.

> So it should be possible to use Altivec without using FPU.

Yup.

> However, until recently, it was not possible to de-activate FPU support on 
> book3s/32. I made it possible in order to reduce unneccessary processing on 
> processors like the 832x that has no FPU.

The processor has to implement FP to be compliant to any version of
PowerPC, as far as I know?  So that is all done by emulation, including
all the registers?  Wow painful.

> As far as I can see in cputable.h/.c, 832x is the only book3s/32 without 
> FPU, and it doesn't have ALTIVEC either.

602 doesn't have double-precision hardware, also no 64-bit FP registers.
But that CPU was never any widely used :-)

> So we can in the future ensure that Altivec can be used without FPU 
> support, but for the time being I think it is OK to force selection of FPU 
> when selecting ALTIVEC in order to avoid build failures.

It is useful to allow MSR[VEC,FP]=1,0 but yeah there are no CPUs that
have VMX (aka AltiVec) but that do not have FP.  I don't see how making
that artificial dependency buys anything, but maybe it does?

> >I have patches to fix the build errors with the config as
> >reported but I don't know if that's the right thing to do...

Neither do we, we cannot see those patches :-)


Segher
