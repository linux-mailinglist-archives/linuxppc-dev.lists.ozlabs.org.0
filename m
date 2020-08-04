Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEC23BB3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 15:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLbTG6QC0zDqbk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 23:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLbNY0YgfzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 23:35:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dZztpu/E; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLbNM3dGzz9sTK;
 Tue,  4 Aug 2020 23:35:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596548115;
 bh=JaGiTjL11VXw6s5vCa+krpoX0kAtWTLuTx4q2RQUDOg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dZztpu/E7QMgTUczLMOVpSvH02ai/ngbz2JswJxxeu8acVFoF1wvct/nmaAOBFl5n
 WbuX7uLi8duzVDVOKTvhJdBDau6p3wtvsTrYYznQIt8j4ILE0edPqj2WOR9HG+sa5d
 dGgzmWZXQ3GxTS7SysmiPIzNu3xSPhnfsQX1/Vkh7DI44xkCGAqylF1nKyGyjW7/pr
 EyalBEQzn5/UPc+O5707JRN0QXZYFPYxyC4mCKkgBz7YKxsB4h/hiWvBwtLxjxC9HA
 GLvajWPVp8rOJZ2+XzJZGhAtI5HIUQjdm21AqRHu/mj+zZWPIp5oLh+NdEL8vk401C
 EKYD1N2k/CqhA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
In-Reply-To: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
Date: Tue, 04 Aug 2020 23:35:10 +1000
Message-ID: <873652zg8h.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Cedric Le Goater <clg@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

There is a bit of history to this code, but not in a good way :)

Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> For a power9 KVM guest with XIVE enabled, running a test loop
> where we hotplug 384 vcpus and then unplug them, the following traces
> can be seen (generally within a few loops) either from the unplugged
> vcpu:
>
>   [ 1767.353447] cpu 65 (hwid 65) Ready to die...
>   [ 1767.952096] Querying DEAD? cpu 66 (66) shows 2
>   [ 1767.952311] list_del corruption. next->prev should be c00a000002470208, but was c00a000002470048
...
>
> At that point the worker thread assumes the unplugged CPU is in some
> unknown/dead state and procedes with the cleanup, causing the race with
> the XIVE cleanup code executed by the unplugged CPU.
>
> Fix this by inserting an msleep() after each RTAS call to avoid

We previously had an msleep(), but it was removed:

  b906cfa397fd ("powerpc/pseries: Fix cpu hotplug")

> pseries_cpu_die() returning prematurely, and double the number of
> attempts so we wait at least a total of 5 seconds. While this isn't an
> ideal solution, it is similar to how we dealt with a similar issue for
> cede_offline mode in the past (940ce422a3).

Thiago tried to fix this previously but there was a bit of discussion
that didn't quite resolve:

  https://lore.kernel.org/linuxppc-dev/20190423223914.3882-1-bauerman@linux.ibm.com/


Spinning forever seems like a bad idea, but as has been demonstrated at
least twice now, continuing when we don't know the state of the other
CPU can lead to straight up crashes.

So I think I'm persuaded that it's preferable to have the kernel stuck
spinning rather than oopsing.

I'm 50/50 on whether we should have a cond_resched() in the loop. My
first instinct is no, if we're stuck here for 20s a stack trace would be
good. But then we will probably hit that on some big and/or heavily
loaded machine.

So possibly we should call cond_resched() but have some custom logic in
the loop to print a warning if we are stuck for more than some
sufficiently long amount of time.


> Fixes: eac1e731b59ee ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1856588

This is not public.

I tend to trim Bugzilla links from the change log, because I'm not
convinced they will last forever, but it is good to have them in the
mail archive.

cheers

> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Cedric Le Goater <clg@kaod.org>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index c6e0d8abf75e..3cb172758052 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -111,13 +111,12 @@ static void pseries_cpu_die(unsigned int cpu)
>  	int cpu_status = 1;
>  	unsigned int pcpu = get_hard_smp_processor_id(cpu);
>  
> -	for (tries = 0; tries < 25; tries++) {
> +	for (tries = 0; tries < 50; tries++) {
>  		cpu_status = smp_query_cpu_stopped(pcpu);
>  		if (cpu_status == QCSS_STOPPED ||
>  		    cpu_status == QCSS_HARDWARE_ERROR)
>  			break;
> -		cpu_relax();
> -
> +		msleep(100);
>  	}
>  
>  	if (cpu_status != 0) {
> -- 
> 2.17.1
