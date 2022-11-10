Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5462386A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73DP60M4z3cNG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WITg89Ra;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WITg89Ra;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N73434BVFz3f6D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:43:47 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 130so224244pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VadPezrQFQJzXRQcr7ujruIyHLewoq/Ce9dh+ybf5kM=;
        b=WITg89RaM3OpQK33BMWC2aMjMBzP850wIdCOemxg/GvAPvb5/JsWP+d6cutcmnenYp
         XfIoFEJR5Uzams6RgODHrv4lyElUBhLbfQhGL4y6I0YyaboBQZiD6nEfW1j/hBZfZ/rQ
         AdkJKW1n8hjN0wcbZQQzkxjJfcoxz6PWnXahwI9dhwd72ZwJpGMHhEV/2/WIiVLMqefK
         CHjy0+sl7SJ5o8yc9bvsCb7/WOAMGkCGmMQ+no1Zh24d90p/rduZQ1sAgmKLLkQHhO4i
         lnC4ouu8i2VK71iadwuirHBJMohRZk7zhyDb/RIyhWarAq2zB5ci6YTHdVfdelq6xzHP
         DMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VadPezrQFQJzXRQcr7ujruIyHLewoq/Ce9dh+ybf5kM=;
        b=AqAyQgP1Y+Cm5xkBfOvKItzU6v9TTVkuZeIAqj+bbdbjj3WRmeSELvKe/D2EBe89Pu
         O1x43zIpfrRYWdqaCINqGJq5re/HBlszsnn+KpPJL64XfchnXv12qVUvcFsga3ZLpOJk
         kWII0q2cPtAqOIsnvSrEO1vIEVUIj/S2ELBGLn/QqxFeRG7dy7H2xZIWgqOIwHWTpyGa
         mEfM6z2K0zsEtOQcllVOQ7d9X2FfxIAt4H5FOTnqcDZI53bnFnwKfmp9FSYe0IyNpRF9
         TJ7xQl2P2MMcG84oxDmoVoxXPhIKQGYrWIG+dIKgIYi0GprGvBaq2hHdSsMUGBu15G4r
         nD/Q==
X-Gm-Message-State: ACrzQf05gpv5jUq/1wkk0+A4CBWGax0j+SpUyCnkom7zyirf7Iw+SOGY
	EXZPM53ihaDXZLiH9E7oFHrhQUjFebo=
X-Google-Smtp-Source: AMsMyM7/8BXK5hN3dhO8LVjVb5h39ut55qq870XimqBOJ42+LQ5OCljlpP7pdok+Or0+kpSBZjRNEg==
X-Received: by 2002:a63:5553:0:b0:43c:5c1e:424f with SMTP id f19-20020a635553000000b0043c5c1e424fmr54046887pgm.353.1668041027009;
        Wed, 09 Nov 2022 16:43:47 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id f30-20020aa79d9e000000b0056bbd286cf4sm8823164pfq.167.2022.11.09.16.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:43:46 -0800 (PST)
Message-ID: <aee900bb3870e8daea96ae5b4aab7ef7e9e1baf4.camel@gmail.com>
Subject: Re: [PATCH 15/17] powerpc/qspinlock: reduce remote node steal spins
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:43:43 +1100
In-Reply-To: <20220728063120.2867508-17-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-17-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
[resend as utf-8, not utf-7]
> Allow for a reduction in the number of times a CPU from a different
> node than the owner can attempt to steal the lock before queueing.
> This could bias the transfer behaviour of the lock across the
> machine and reduce NUMA crossings.
> ---
>  arch/powerpc/lib/qspinlock.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index d4594c701f7d..24f68bd71e2b 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -4,6 +4,7 @@
>  #include <linux/export.h>
>  #include <linux/percpu.h>
>  #include <linux/smp.h>
> +#include <linux/topology.h>
>  #include <asm/qspinlock.h>
>  #include <asm/paravirt.h>
>  
> @@ -24,6 +25,7 @@ struct qnodes {
>  
>  /* Tuning parameters */
>  static int STEAL_SPINS __read_mostly = (1<<5);
> +static int REMOTE_STEAL_SPINS __read_mostly = (1<<2);
>  #if _Q_SPIN_TRY_LOCK_STEAL == 1
>  static const bool MAYBE_STEALERS = true;
>  #else
> @@ -39,9 +41,13 @@ static bool pv_prod_head __read_mostly = false;
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> -static __always_inline int get_steal_spins(bool paravirt)
> +static __always_inline int get_steal_spins(bool paravirt, bool remote)
>  {
> -	return STEAL_SPINS;
> +	if (remote) {
> +		return REMOTE_STEAL_SPINS;
> +	} else {
> +		return STEAL_SPINS;
> +	}
>  }
>  
>  static __always_inline int get_head_spins(bool paravirt)
> @@ -380,8 +386,13 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  
>  		iters++;
>  
> -		if (iters >= get_steal_spins(paravirt))
> +		if (iters >= get_steal_spins(paravirt, false))
>  			break;
> +		if (iters >= get_steal_spins(paravirt, true)) {

There's no indication of what true and false mean here which is hard to read.
To me it feels like two separate functions would be more clear.


> +			int cpu = get_owner_cpu(val);
> +			if (numa_node_id() != cpu_to_node(cpu))

What about using node_distance() instead?


> +				break;
> +		}
>  	}
>  	spin_end();
>  
> @@ -588,6 +599,22 @@ static int steal_spins_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
>  
> +static int remote_steal_spins_set(void *data, u64 val)
> +{
> +	REMOTE_STEAL_SPINS = val;

REMOTE_STEAL_SPINS is int not u64.

> +
> +	return 0;
> +}
> +
> +static int remote_steal_spins_get(void *data, u64 *val)
> +{
> +	*val = REMOTE_STEAL_SPINS;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_remote_steal_spins, remote_steal_spins_get, remote_steal_spins_set, "%llu\n");
> +
>  static int head_spins_set(void *data, u64 val)
>  {
>  	HEAD_SPINS = val;
> @@ -687,6 +714,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> +	debugfs_create_file("qspl_remote_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_remote_steal_spins);
>  	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
>  	if (is_shared_processor()) {
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);

