Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F76EA30F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 07:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2jY6578vz3fT0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 15:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZcrR2/bg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2jXF017gz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 15:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZcrR2/bg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q2jX84k4Gz4x5Q;
	Fri, 21 Apr 2023 15:20:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682054408;
	bh=qMMIN3ov7JZAgmH7R1umRdp7sW0RTy/xY8uoQpaTt5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZcrR2/bg6xc0PZPWxmB0oL8x18DaTjaSedqE3OgsFxXtbyuV6rkH8HyjumygWoFVe
	 D4ZDqqgbhuHyKA85EeXwCf9ymLR2PaFYUrecpBkZHuh/jD88xp85lE4+m2QgiultnF
	 9go7eHgOl76wNnRmgw04nW8GzkV0cu3GOTFOQ/iJy0bnDb1ZIUI7fmLl2FYXs+ZSHO
	 YuOvw/apxBOxfI7c93qPdswA3/AAQOoOdC6+3hU7Sx2ve+Zml9iQwdFVNhFWgRL74D
	 JCuaIb4V6UMFGRGWyjYGqdCzClDgoxDba4AoqDYsewbm1+WJbE0tKnHnH6ge/JsFzw
	 PpiK5Eu+/tLOA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tejun Heo <tj@kernel.org>, jiangshanlai@gmail.com
Subject: Re: [PATCH 01/22] powerpc, workqueue: Use alloc_ordered_workqueue()
 to create ordered workqueues
In-Reply-To: <20230421025046.4008499-2-tj@kernel.org>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-2-tj@kernel.org>
Date: Fri, 21 Apr 2023 15:20:08 +1000
Message-ID: <87ildpg6bb.fsf@mail.concordia>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tejun Heo <tj@kernel.org> writes:
> BACKGROUND
> ==========
>
> When multiple work items are queued to a workqueue, their execution order
> doesn't match the queueing order. They may get executed in any order and
> simultaneously. When fully serialized execution - one by one in the queueing
> order - is needed, an ordered workqueue should be used which can be created
> with alloc_ordered_workqueue().
>
> However, alloc_ordered_workqueue() was a later addition. Before it, an
> ordered workqueue could be obtained by creating an UNBOUND workqueue with
> @max_active==1. This originally was an implementation side-effect which was
> broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
> ordered"). Because there were users that depended on the ordered execution,
> 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
> made workqueue allocation path to implicitly promote UNBOUND workqueues w/
> @max_active==1 to ordered workqueues.
>
> While this has worked okay, overloading the UNBOUND allocation interface
> this way creates other issues. It's difficult to tell whether a given
> workqueue actually needs to be ordered and users that legitimately want a
> min concurrency level wq unexpectedly gets an ordered one instead. With
> planned UNBOUND workqueue updates to improve execution locality and more
> prevalence of chiplet designs which can benefit from such improvements, this
> isn't a state we wanna be in forever.
>
> This patch series audits all callsites that create an UNBOUND workqueue w/
> @max_active==1 and converts them to alloc_ordered_workqueue() as necessary.
>
> WHAT TO LOOK FOR
> ================
>
> The conversions are from
>
>   alloc_workqueue(WQ_UNBOUND | flags, 1, args..)
>
> to
>
>   alloc_ordered_workqueue(flags, args...)
>
> which don't cause any functional changes. If you know that fully ordered
> execution is not ncessary, please let me know. I'll drop the conversion and
> instead add a comment noting the fact to reduce confusion while conversion
> is in progress.
>
> If you aren't fully sure, it's completely fine to let the conversion
> through. The behavior will stay exactly the same and we can always
> reconsider later.
>
> As there are follow-up workqueue core changes, I'd really appreciate if the
> patch can be routed through the workqueue tree w/ your acks. Thanks.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/tau_6xx.c          | 2 +-
>  arch/powerpc/platforms/pseries/dlpar.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


> diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
> index 828d0f4106d2..cba6dd15de3b 100644
> --- a/arch/powerpc/kernel/tau_6xx.c
> +++ b/arch/powerpc/kernel/tau_6xx.c
> @@ -200,7 +200,7 @@ static int __init TAU_init(void)
>  	tau_int_enable = IS_ENABLED(CONFIG_TAU_INT) &&
>  			 !strcmp(cur_cpu_spec->platform, "ppc750");
>  
> -	tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1);
> +	tau_workq = alloc_ordered_workqueue("tau", 0);
>  	if (!tau_workq)
>  		return -ENOMEM;
>  
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 75ffdbcd2865..e9117b03807e 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -564,8 +564,7 @@ int __init dlpar_workqueue_init(void)
>  	if (pseries_hp_wq)
>  		return 0;
>  
> -	pseries_hp_wq = alloc_workqueue("pseries hotplug workqueue",
> -			WQ_UNBOUND, 1);
> +	pseries_hp_wq = alloc_ordered_workqueue("pseries hotplug workqueue", 0);
>  
>  	return pseries_hp_wq ? 0 : -ENOMEM;
>  }

The change log of commit 9054619ef54a ("powerpc/pseries: Add pseries
hotplug workqueue") makes it fairly clear that this code does explicitly
want an ordered queue.

cheers
