Return-Path: <linuxppc-dev+bounces-6572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806FA49B0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 14:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48pb42sPz3bsK;
	Sat,  1 Mar 2025 00:54:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740750887;
	cv=none; b=mTcImZUoeubtsAqONB/BlYje3KmJpAUkXbyDBQw6uZiR2U+Xjyn3+y3lUcdNQNy3AV9l1N4b3mRiqrB/mk0EFE4pUjG+3LOqT4Cy0H5edqsdDDg/F17wJXsFkwVWodABEwZYbSISJhKyRTna8cLWGFIJKXdsH4jtztRCq2oJezNy3kkSjEfy991DlnqwVdCmDXDmpJjJexXfWNnnC7SukARI+qcjs1xd+P9q6dXK78q+eXgSBiMyKI3148ebKJBhY8hMbTbQco99b63nP0cuB4DqAcZEONUfJ09iARwQ7o+tM11h5GJjG+atT9I0kpVo84XrZ6ZL9YwNOANsoflNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740750887; c=relaxed/relaxed;
	bh=+4sW+yDnGognoqpVpy7Utn+T6JhTFSZnyd9HvUFB7qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6Gq+ZkSdysLCI6WYrdb6P5/16bAeD7xWBQhYt8snSq4F7OiBfO40/S3AoB54tbkBEoy/J1+YzqGMT/CMXMvOyZVVk6jf9UyYdg+vW7ACnODDrojLnjoLq6Otak34d0lfUPKMDnqYUSl/ZJJYSzyoKTGzmD/V/OFuevDRg6AgiOdjgaqE7npCr+LeIfNRjGDZ4WimnbveKb5rV14eEg20EtfpkavbiGZtNlBpm5VKsCF3dBd/bi/GLt5hCqb2K1Bz+D2aGIAFmKNdbvxp+WOh0Q/ZrP70ZRtb+b5lxilhvvfZmP3UnBdbFTGrNTKK+MlSf9smvqtq+UVVN5RueQRtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48pY3f25z3brB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 00:54:43 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DCFE1515;
	Fri, 28 Feb 2025 05:54:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281E33F6A8;
	Fri, 28 Feb 2025 05:54:07 -0800 (PST)
Date: Fri, 28 Feb 2025 13:54:04 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
Message-ID: <Z8G__C7n4zwje2MW@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-2-yangyicong@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218141018.18082-2-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 10:10:15PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMT. In such case the testing CPU is already
> the 1st CPU in the SMT so it's always the primary thread.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> Pre questioned in v9 [1] whether this works on architectures not using
> CONFIG_GENERIC_ARCH_TOPOLOGY, See [2] for demonstration hacking on LoongArch
> VM and this also works. Architectures should use this on their own situation.
> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com/
> 
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/x86/include/asm/topology.h     |  2 +-
>  include/linux/topology.h            | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpu == cpu_first_thread_sibling(cpu);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  static inline bool topology_smt_thread_allowed(unsigned int cpu)
>  {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index ec134b719144..6c79ee7c0957 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -229,11 +229,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  #else /* CONFIG_SMP */
>  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>  static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>  #endif /* !CONFIG_SMP */
>  
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b3aba443c4eb 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>  }
>  #endif
>  
> +#ifndef topology_is_primary_thread
> +
> +#define topology_is_primary_thread topology_is_primary_thread
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.

I may be misunderstanding the term "SMT hotplug" above. For me it is
comparable with logical CPU hotplug, so the above statement may be
misleading. IIUC, what you mean above is if SMT is disabled, the
primary thread will always remain enabled/active. Does that make sense
or am I missing something ?

--
Regards,
Sudeep

