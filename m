Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED6906B0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 13:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dsezFuET;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0L1B0Myjz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 21:34:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dsezFuET;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0L0Q6RScz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 21:34:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718278451;
	bh=1z2hwHmg3zI5iDN7nSTa67ma/S6hUmgaCaCPmbI3jNE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dsezFuET6MQptgoIk4Rz2FdLfx112u9Qx789Kb6J4Llwv43suNMkBgJJQYDjUaf9q
	 9PMwVN7VPdH247bgCo1MtVFVRMvX9fR6R77cwc5faN800byW7JZ3yd4LEAg1R352Za
	 GU2G8AD91GMmg4rc9l/tuhy8UCB4yoFI1Fii2QrtjRvJM9MTy3xamznmntrzLqAHHb
	 HhxI6DCtBAo9qAO13nYTcavzOmCFWaiRW3wb1ls8xA1LodFnSv8bpxNI+KoAEzNxvw
	 ndZyvDgLKpZ/Uwiu7IVXY9PytAJ77PvqQwUHX+Wx4c7Ia/Euss5oBGDBynHlU7wdUY
	 63G7z56OX18aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0L0L4qfsz4wcJ;
	Thu, 13 Jun 2024 21:34:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] Skip offline cores when enabling SMT on PowerPC
In-Reply-To: <20240612185046.1826891-1-nysal@linux.ibm.com>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
Date: Thu, 13 Jun 2024 21:34:10 +1000
Message-ID: <875xudoz4d.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> From: "Nysal Jan K.A" <nysal@linux.ibm.com>
>
> After the addition of HOTPLUG_SMT support for PowerPC [1] there was a
> regression reported [2] when enabling SMT.

This implies it was a kernel regression. But it can't be a kernel
regression because previously there was no support at all for the sysfs
interface on powerpc.

IIUIC the regression was in the ppc64_cpu userspace tool, which switched
to using the new kernel interface without taking into account the way it
behaves.

Or are you saying the kernel behaviour changed on x86 after the powerpc
HOTPLUG_SMT was added?

> On a system with at least
> one offline core, when enabling SMT, the expectation is that no CPUs
> of offline cores are made online.
>
> On a POWER9 system with 4 cores in SMT4 mode:
> $ ppc64_cpu --info
> Core   0:    0*    1*    2*    3*
> Core   1:    4*    5*    6*    7*
> Core   2:    8*    9*   10*   11*
> Core   3:   12*   13*   14*   15*
>
> Turn only one core on:
> $ ppc64_cpu --cores-on=1
> $ ppc64_cpu --info
> Core   0:    0*    1*    2*    3*
> Core   1:    4     5     6     7
> Core   2:    8     9    10    11
> Core   3:   12    13    14    15
>
> Change the SMT level to 2:
> $ ppc64_cpu --smt=2
> $ ppc64_cpu --info
> Core   0:    0*    1*    2     3
> Core   1:    4     5     6     7
> Core   2:    8     9    10    11
> Core   3:   12    13    14    15
>
> As expected we see only two CPUs of core 0 are online
>
> Change the SMT level to 4:
> $ ppc64_cpu --smt=4
> $ ppc64_cpu --info
> Core   0:    0*    1*    2*    3*
> Core   1:    4*    5*    6*    7*
> Core   2:    8*    9*   10*   11*
> Core   3:   12*   13*   14*   15*
>
> The CPUs of offline cores are made online. If a core is offline then
> enabling SMT should not online CPUs of this core.

That's the way the ppc64_cpu tool behaves, but it's not necessarily what
other arches want.

> An arch specific
> function topology_is_core_online() is proposed to address this.
> Another approach is to check the topology_sibling_cpumask() for any
> online siblings. This avoids the need for an arch specific function
> but is less efficient and more importantly this introduces a change
> in existing behaviour on other architectures.

It's only x86 and powerpc right?

Having different behaviour on the only two arches that support the
interface does not seem like a good result.

> What is the expected behaviour on x86 when enabling SMT and certain cores
> are offline? 

AFAIK no one really touches SMT on x86 other than to turn it off for
security reasons.

cheers

> [1] https://lore.kernel.org/lkml/20230705145143.40545-1-ldufour@linux.ibm.com/
> [2] https://groups.google.com/g/powerpc-utils-devel/c/wrwVzAAnRlI/m/5KJSoqP4BAAJ
>
> Nysal Jan K.A (2):
>   cpu/SMT: Enable SMT only if a core is online
>   powerpc/topology: Check if a core is online
>
>  arch/powerpc/include/asm/topology.h | 13 +++++++++++++
>  kernel/cpu.c                        | 12 +++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
>
> base-commit: c760b3725e52403dc1b28644fb09c47a83cacea6
> -- 
> 2.35.3
