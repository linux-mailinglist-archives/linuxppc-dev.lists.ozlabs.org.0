Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997364D0BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 21:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXRLM1YJZz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 07:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXRKj3DZHz3bZk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 07:09:44 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BEK8gVw016969;
	Wed, 14 Dec 2022 14:08:42 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BEK8gVq016968;
	Wed, 14 Dec 2022 14:08:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Dec 2022 14:08:42 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221214200842.GP25951@gate.crashing.org>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de> <20221213002613.GG25951@gate.crashing.org> <20221213100045.xebrbdcniwpopbnq@lug-owl.de> <20221214090025.f3k3juinxfhhnr6u@lug-owl.de> <20221214183632.reqfqdhtatog2vmu@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214183632.reqfqdhtatog2vmu@lug-owl.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Dec 14, 2022 at 07:36:32PM +0100, Jan-Benedict Glaw wrote:
> So we have these remaining build issues:
> 
> linux-powerpc-cell_defconfig           bad asm (arch/powerpc/boot/pseries-head.S)
> linux-powerpc-mvme5100_defconfig       bad asm (arch/powerpc/kernel/epapr_hcalls.S)
> linux-powerpc-asp8347_defconfig        bad asm (arch/powerpc/kernel/pmc.c)
> linux-powerpc-ppc6xx_defconfig         bad asm (arch/powerpc/kernel/pmc.c)
> linux-powerpc-ppc64e_defconfig         bad asm (arch/powerpc/kernel/vdso/gettimeofday.S)
> linux-powerpc-corenet64_smp_defconfig  bad asm (arch/powerpc/kernel/vdso/gettimeofday.S)
> 
> I do *not* have CROSS32_COMPILE=... set for my builds. Maybe that
> could cure at least the issues within the ./boot and ./kernel/vdso
> directories?

I never set that, -m32 does the trick, every powerpc compiler is
biarch :-)

> Let's try that...  But I guess that won't help for the
> other two remaining files (arch/powerpc/kernel/{epapr_hcalls.S,pmc.c).

Not likely no.  Can you show the error of those again?

> linux-powerpc-pseries_defconfig         sstep (out of array bounds)
> linux-powerpc-powernv_defconfig         sstep
> linux-powerpc-ppc64_defconfig           sstep
> linux-powerpc-pseries_le_defconfig      sstep
> linux-powerpc-ppc64le_defconfig         sstep
> linux-powerpc-ppc64le_guest_defconfig   sstep
> linux-powerpc-ppc64_guest_defconfig     sstep
> linux-powerpc-powernv_be_defconfig      sstep
> 
> My first guess on these is that it's a wrong warning. The union's
> `u8 b[2 * sizeof(double)]` seems to be large enough.

A false positive, yes.  Which is *not* wrong.  What is wrong is using
-Werror in any unknown environment.  I have a stack of patches I use for
all my kernel builds, and half of those are eradicating harmful -Werror
instances.

> linux-powerpc-akebono_defconfig         ahci (BUILD_BUG_ON failed: sizeof(_s) > sizeof(long))
> linux-powerpc-xes_mpc85xx_defconfig     ahci
> linux-powerpc-ge_imp3a_defconfig        ahci
> linux-powerpc-mpc85xx_defconfig         ahci
> linux-powerpc-mpc85xx_smp_defconfig     ahci
> linux-powerpc-corenet32_smp_defconfig   ahci
> linux-powerpc-mpc86xx_defconfig         ahci
> linux-powerpc-mpc86xx_smp_defconfig     ahci
> 
> I've seen the AHCI issue on other (non-powerpc) builds as well,
> haven't looked into this so I won't guess about whether this is a real
> bug or a compiler issue.

It is a real bug afaics.


Segher
