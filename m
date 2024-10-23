Return-Path: <linuxppc-dev+bounces-2513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315C9ACF24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 17:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYYHy2lrYz2ym2;
	Thu, 24 Oct 2024 02:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729698254;
	cv=none; b=a3iCI1OMTcJ2yu1N7VvmId81+lRUOaZEvGVIn1/5Cx6upH5//+XlSTZ/SyKQuvEXrROnmXw34MPFaicHFiIJkaeOumclAIrLViCmicFCjXQVIlJyfP5TPb1T2c+kcFUmxxMY47RnlurRrTzLzJaowm4iOMONlAz3ETq/PPLqIv8FvGVdsVon2wYSgH8G55RxuPH32esTW4v/6kt+GfE3AZRw19SdT1DNr440aXMWs9sJYhhXQvJummaE3AM+Jo/AHZndZJVJUYt/uZi71b9x2H5CNpXz9wrC3IUmkq6rf/Y7v3Jtxmb5AFH13AG/55tXL50v3pRNkDbEJQbDwuohIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729698254; c=relaxed/relaxed;
	bh=3HkthJYuKJvvSJaIdFPFlD6cXoMsMOtX+9PNtSMmfJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYujK1IZEU+W1maDRk+a5Myslu4p0cyy3lseE7WUlwBvHytc93cPmvkiXIQbcksMaT2aQSxc6Lc/fsIcuzs2/uwezU8M08Vzn+th4vjeeSlJbeSt2jP/EOFZaEpt+098JfH7JH9qh2ZJ8i5Rpf2YgrtApGXwvP2ULnlTh+LMH5sAr/1VymkmV7tZAfoNE+kxTgHRQHWrkso+3G5IzrUPE6XFgnUkobWvI1VRjbOa3dvfN1PyHD4QFVdXl08PFOToO4RP2qvKp6avyVRt8ZvF8404dmafSoZYwsqUtYEXx7YLckGY6sp+bIFYBhyyTiT5+Af9sbR2BF1iEzyuUHVExA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYYHv54n9z2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 02:44:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84DA9339;
	Wed, 23 Oct 2024 08:44:06 -0700 (PDT)
Received: from [10.57.79.135] (unknown [10.57.79.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C592E3F528;
	Wed, 23 Oct 2024 08:43:31 -0700 (PDT)
Message-ID: <eb7ec4c3-5995-4040-8992-bb95f4b9f923@arm.com>
Date: Wed, 23 Oct 2024 17:43:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-3-yangyicong@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20241015021841.35713-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Yicong,

On 10/15/24 04:18, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already
> gotten the SMT thread number of each core. Update the largest
> SMT thread number and enable the SMT control by the end of
> topology parsing.
> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/base/arch_topology.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 75fcb75d5515..5eed864df5e6 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>   #include <linux/cleanup.h>
>   #include <linux/cpu.h>
>   #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>   #include <linux/device.h>
>   #include <linux/of.h>
>   #include <linux/slab.h>
> @@ -28,6 +29,7 @@
>   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>   static struct cpumask scale_freq_counters_mask;
>   static bool scale_freq_invariant;
> +static unsigned int max_smt_thread_num;
>   DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
>   EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>   
> @@ -561,6 +563,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>   		i++;
>   	} while (1);
>   
> +	if (max_smt_thread_num < i)
> +		max_smt_thread_num = i;

Shouldn't the conditions above/below be inverted ?
I.e. (max_smt_thread_num != i) should never be true if there is
   max_smt_thread_num = i;
just before

> +
> +	/*
> +	 * If max_smt_thread_num has been initialized and doesn't match
> +	 * the thread number of this entry, then the system has
> +	 * heterogeneous SMT topology.
> +	 */
> +	if (max_smt_thread_num && max_smt_thread_num != i)
> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
>   	cpu = get_cpu_for_node(core);
>   	if (cpu >= 0) {
>   		if (!leaf) {
> @@ -673,6 +686,14 @@ static int __init parse_socket(struct device_node *socket)
>   	if (!has_socket)
>   		ret = parse_cluster(socket, 0, -1, 0);
>   
> +	/*
> +	 * Notify the CPU framework of the SMT support. A thread number of 1
> +	 * can be handled by the framework so we don't need to check
> +	 * max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (max_smt_thread_num)
> +		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +
>   	return ret;
>   }
>   

