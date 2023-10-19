Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71967CEED0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 06:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Eks/UeYw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9wJR529wz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 15:50:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Eks/UeYw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9wHc450sz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 15:49:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697690988;
	bh=rlQZx9JJxSdr3/h/TbJIqIbao0AYCeJ36JQgRbnJMws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Eks/UeYwUxWgNbjQ9pv/zgvRIDI5GwHJohg39vWxMdzp3sOO4ebFRh4gVy+Ous5y2
	 LRnucQQjKcAdZMedSuMJipgyKyux4AFVShCDjNakwujvQKMJm/lUgyaIxfaily6o+Q
	 OmdrZ0zm/U9bRind8TgK4gML5WA1sjKZYF908uz9KoaA+HyPeQlcavjZHu3j/nAV19
	 Vw6VQE/8Sb9L4Vn2qhQtjxq9Sp3vcruxlxE8w9HEawnF64di0dzoG2o7HjMD333FoN
	 QcvmexOkPKA1sysVmz1t4tn4k/FG/yVsrzPir6UF82iZlBmZcOKmJCJDrV/q4CFMgV
	 uSsFmtty8f9hQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9wHc3181z4x80;
	Thu, 19 Oct 2023 15:49:48 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 5/6] powerpc/smp: Add read_mostly attribute
In-Reply-To: <20231018163751.2423181-6-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-6-srikar@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 15:49:48 +1100
Message-ID: <87mswf5i8j.fsf@mail.lhotse>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> There are some variables that are only updated at boot time.
> So add read_mostly attribute to such variables

If they're only updated at boot time then __ro_after_init would be the
better annotation.

cheers

> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 29da9262cb17..b1eb11a66902 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -77,10 +77,10 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
>  #endif
>  
>  struct task_struct *secondary_current;
> -bool has_big_cores;
> -bool coregroup_enabled;
> -bool thread_group_shares_l2;
> -bool thread_group_shares_l3;
> +bool has_big_cores __read_mostly;
> +bool coregroup_enabled __read_mostly;
> +bool thread_group_shares_l2 __read_mostly;
> +bool thread_group_shares_l3 __read_mostly;
>  
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> @@ -987,7 +987,7 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
>  	return 0;
>  }
>  
> -static bool shared_caches;
> +static bool shared_caches __read_mostly;
>  DEFINE_STATIC_KEY_FALSE(powerpc_asym_packing);
>  
>  #ifdef CONFIG_SCHED_SMT
> -- 
> 2.31.1
