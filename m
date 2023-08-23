Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30978620C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 23:16:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJyy1mue;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWJtY0lBmz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 07:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJyy1mue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=4e/e=ei=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWJsc0l1hz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 07:15:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94786615C8;
	Wed, 23 Aug 2023 21:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D360CC433C7;
	Wed, 23 Aug 2023 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692825343;
	bh=83cGWpzHR0LN7okDD8huiRI2qWgS27/vhv1D1BC7qU0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AJyy1mueW4a+L9lGMDYgLeIxe5ylHp6p41op4lb2gWTT1mhu1wOM6bETXOxQN0HdX
	 Key/Cdo1Jy1gWAcgO8MjifnsACPnmEh+6aXXIr5oLw0o5Wlz9nm1vFFlDPpyfD96YN
	 3vUo3QfsMs6esK1RSk1ufMcUguWSvDP6RdfYVBcqeuJRNCrJ3tgl4/ok00xZgzYfX7
	 Xpv2AvZJdOYbObYwfrsYH5EVjf9PDNErQoIjylM8JRd2LNS9M3qwAmqpK9UvxL1VdS
	 BhENVI71JK1FsXv4gYyueaKbskbz/I3bX+cvDesc4kXZZMDntrjs/66kUEcAL+oP/R
	 fx3uCbaiTLv9w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 64C68CE02EE; Wed, 23 Aug 2023 14:15:43 -0700 (PDT)
Date: Wed, 23 Aug 2023 14:15:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Subject: Re: [PATCH RFC] rcu: torture: shorten the time between
 forward-progress tests
Message-ID: <795ab1ed-de92-4f31-9483-b1800b597405@paulmck-laptop>
References: <1683039962-15751-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683039962-15751-1-git-send-email-zhouzhouyi@gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 02, 2023 at 11:06:02PM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Currently, default time between rcu torture forward-progress tests is 60HZ,
> Under this configuration, false positive caused by __stack_chk_fail [1] is
> difficult to reproduce (needs average 5*420 seconds for SRCU-P),
> which means one has to invoke [2] 5 times in average to make [1] appear.
> 
> With time between rcu torture forward-progress tests be 1 HZ, above
> phenomenon will be reproduced within 3 minutes, which means we can
> reproduce [1] everytime we invoke [2].
> 
> Although [1] is a false positive, this change will make possible future
> true bugs easier to be discovered.            
>                    
> [1] Link: https://lore.kernel.org/lkml/CAABZP2yS5=ZUwEZQ7iHkV0wDm_HgO8K-TeAhyJrZhavzKDa44Q@mail.gmail.com/T/
> [2] tools/testing/selftests/rcutorture/bin/torture.sh
> 
> Tested in PPC VM of Opensource Lab of Oregon State Univerisity.
>         
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>        

Please accept my apologies for being ridiculously slow to reply!

In recent -rcu, module parameters such as this one that simply set a
value can be overridden on the command line.  So you could get the effect
(again, in recent kernels) in your testing by adding:

	--bootargs "rcutorture.fwd_progress_holdoff=1"

The reason that I am reluctant to accept this patch is that we sometimes
have trouble with this forward-progress testing exhausting memory, and
making in happen could therefore cause trouble with generic rcutorture
testing.

Or am I missing the point of this change?

							Thanx, Paul

> ---
>  tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot  | 1 +
>  tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot  | 1 +
>  tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot | 1 +
>  tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot  | 1 +
>  tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot  | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> index ce0694fd9b92..982582bff041 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> @@ -1,2 +1,3 @@
>  rcutorture.torture_type=srcu
>  rcutorture.fwd_progress=3
> +rcutorture.fwd_progress_holdoff=1
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> index 2db39f298d18..18f5d7361d8a 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> @@ -1,4 +1,5 @@
>  rcutorture.torture_type=srcud
>  rcupdate.rcu_self_test=1
>  rcutorture.fwd_progress=3
> +rcutorture.fwd_progress_holdoff=1
>  srcutree.big_cpu_lim=5
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> index c70b5db6c2ae..b86bc7df7603 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> @@ -1,2 +1,3 @@
>  rcutorture.torture_type=tasks-tracing
>  rcutorture.fwd_progress=2
> +rcutorture.fwd_progress_holdoff=1
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> index dd914fa8f690..933302f885df 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> @@ -1 +1,2 @@
>  rcutorture.fwd_progress=2
> +rcutorture.fwd_progress_holdoff=1
> diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> index dd914fa8f690..933302f885df 100644
> --- a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> +++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> @@ -1 +1,2 @@
>  rcutorture.fwd_progress=2
> +rcutorture.fwd_progress_holdoff=1
> -- 
> 2.34.1
> 
