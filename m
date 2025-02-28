Return-Path: <linuxppc-dev+bounces-6568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98446A49818
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 12:11:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z459Y3jCbz3bsM;
	Fri, 28 Feb 2025 22:10:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740741057;
	cv=none; b=U8c+7ewvYpFx4VpnnLIxCcnQk2rH2Xqmkx9bTXkKB/Ai7Wm/E4VWvcpELDpPkXm77OvHHsfVH0+g/2ZGwkm25vG4p+qPtpHqWaPtMKVQZoaiPaKBPrOLdZ9YWhg7ynrmMz663BU6vtWtKeddthu1HDINgaBj1b534g7A9A+pnr4kyT/FfJPFD3svEshJ5tN4Wro56h7DlvgPd9yQdLA57+RwqjACTGsFK/Qksgdya9Tlwm7yplVzT2as5G+Q5mF1NS22okrt5shSVuQoiCUdZknzMiQ4LPkrtTjzB+8LwILVvZiAfPsPVFgmlSkjv+SlF33gdL8NCnyrJ27WnMRxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740741057; c=relaxed/relaxed;
	bh=mDWeQaG9rJh2JrE6qV5LxMVIQNQDr5nSAyBbP6trtbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlJxlo+tbnEQIrA01jBXIMvNF3QMEXI6zUgvHLM2iMnQ5PheMnFAYTp045pPDyr8mTyKdspTTmeoHiD0RHwRPT5R8WCvvDdFcGOq/ldH6cxx+WbW1/+0ecIt4/j6zICgAmpy/DhKL6a/+s/r++bmZP7mI60ByexwkHhvaohFOeTc601NBWeWp83XfdziKqEnAk/L9v9dqehUYAcIPkqNz+3xiYkxL+eACc0Z70gc1NkF/Xszf7TZpNmIT9BA4+Lartt8EMiih9mKYJr499+rqaK1nWnbUVVhM42aPTLvyeQ/kHqNtEJSTyk7wSBfHVM1XTfD5MnZsxJ6wTOh7sstng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z459X4CNRz3brB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 22:10:54 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E20E1063;
	Fri, 28 Feb 2025 03:10:37 -0800 (PST)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CC1F3F673;
	Fri, 28 Feb 2025 03:10:17 -0800 (PST)
Message-ID: <e3607ed0-bdf5-4fef-8731-b81fae649312@arm.com>
Date: Fri, 28 Feb 2025 12:10:15 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-2-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250218141018.18082-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/02/2025 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

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
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 *
> +	 * The sibling cpumask of an offline CPU contains always the CPU
> +	 * itself for architectures using CONFIG_GENERIC_ARCH_TOPOLOGY.
> +	 * Other architectures should use this depend on their own
> +	 * situation.

This sentence is hard to get. Do you want to say that other
architectures (CONFIG_GENERIC_ARCH_TOPOLOGY or
!CONFIG_GENERIC_ARCH_TOPOLOGY) have to check whether they can use this
default implementation or have to override it?

[...]

