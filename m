Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 280675F9D84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmGjy0Xqzz3drq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:23:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qlkVAQny;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmGh92cgCz3drV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:21:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qlkVAQny;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MmGh84X0tz4wgr;
	Mon, 10 Oct 2022 22:21:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665400889;
	bh=lMMl/KHosRqKoaG99tWgP95ZIQ9jboImJ5ERiTEIL78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qlkVAQnyj1Lg0FWv1boZL3xZ32fpNKxBW9d8Ecbl7sj+Py6TKF8T8vEO5HA6DwBtP
	 AWuSBcPvAqRevSpDvLGsh1n2XkMW6A3Zu25tSCE9A0NQOINGrfgNJh8gCfApvAsgLb
	 g0w/IOIgxrmLB3SueVEzNXWYQovpweZolQuos++QCKFZ7tHrqeuoQTz9yEB9y4Rp5m
	 Fh6BgnMAh0UyiqcsJsLsDQ6tTpOik/sNh7QMRd2GydwTXJFC8it3bHbT/mAZs+6th7
	 99LSGmFclfJn/EDkB7NIbt6J6VB/EtzQtjaRu80xh3h8wJfp/LMh+R4U4ON4amVUBv
	 3U9t0Y+zIYRng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lance@osuosl.org, paulmck@kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH linux-next][RFC] powerpc: fix HOTPLUG error in rcutorture
In-Reply-To: <20221010023315.98396-1-zhouzhouyi@gmail.com>
References: <20221010023315.98396-1-zhouzhouyi@gmail.com>
Date: Mon, 10 Oct 2022 22:21:24 +1100
Message-ID: <87bkqjorez.fsf@mpe.ellerman.id.au>
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> I think we should avoid torture offline the cpu who do tick timer
> when nohz full is running.

Can you tell us what the bug you're fixing is?

Did you see a crash/oops/hang etc? Or are you just proposing this as
something that would be a good idea?

> Tested on PPC VM of Open Source Lab of Oregon State University.
> The test results show that after the fix, the success rate of
> rcutorture is improved.
> After:
> Successes: 40 Failures: 9
> Before:
> Successes: 38 Failures: 11
>
> I examined the console.log and Make.out files one by one, no new
> compile error or test error is introduced by above fix.
>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Dear PPC developers
>
> I found this bug when trying to do rcutorture tests in ppc VM of
> Open Source Lab of Oregon State University:
>
> ubuntu@ubuntu:~/linux-next/tools/testing/selftests/rcutorture/res/2022.09.30-01.06.22-torture$ find . -name "console.log.diags"|xargs grep HOTPLUG
> ./results-scftorture/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
> ./results-rcutorture/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
> ./results-rcutorture/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04
> ./results-scftorture-kasan/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
> ./results-rcutorture-kasan/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
> ./results-rcutorture-kasan/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04
>
> I tried to fix this bug.
>
> Thanks for your patience and guidance ;-)
>
> Thanks 
> Zhouyi
> --
>  arch/powerpc/kernel/sysfs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index ef9a61718940..be9c0e45337e 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -4,6 +4,7 @@
>  #include <linux/smp.h>
>  #include <linux/percpu.h>
>  #include <linux/init.h>
> +#include <linux/tick.h>
>  #include <linux/sched.h>
>  #include <linux/export.h>
>  #include <linux/nodemask.h>
> @@ -21,6 +22,7 @@
>  #include <asm/firmware.h>
>  #include <asm/idle.h>
>  #include <asm/svm.h>
> +#include "../../../kernel/time/tick-internal.h"
  
Needing to include this internal header is a sign that we are using the
wrong API or otherwise using time keeping internals we shouldn't be.

>  #include "cacheinfo.h"
>  #include "setup.h"
> @@ -1151,7 +1153,11 @@ static int __init topology_init(void)
>  		 * CPU.  For instance, the boot cpu might never be valid
>  		 * for hotplugging.
>  		 */
> -		if (smp_ops && smp_ops->cpu_offline_self)
> +		if (smp_ops && smp_ops->cpu_offline_self
> +#ifdef CONFIG_NO_HZ_FULL
> +		    && !(tick_nohz_full_running && tick_do_timer_cpu == cpu)
> +#endif
> +		    )

I can't see any other arches doing anything like this. I don't think
it's the arches responsibility.

If the time keeping core needs a CPU to stay online to run the timer
then it needs to organise that itself IMHO :)

cheers

>  			c->hotpluggable = 1;
>  #endif
>  
> -- 
> 2.25.1
