Return-Path: <linuxppc-dev+bounces-6573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3EA49B0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 14:55:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48pz6zvzz3btZ;
	Sat,  1 Mar 2025 00:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740750907;
	cv=none; b=Tir3uE+vBye2vMTIwA/s0PRi18wXxvhGsJUSwN+NjYD5uFIZQDCB7aPKHdyLI1PPuLTZKqLRKDM4df60VkBBEZVD9M+pflPL1m4U8+QRSu5hqaX41P45ThR8gF8ooPPsmuURru9NL/gvUecYmFfFYiMNjoIZg8Ra+dWabvBxyP/OdPVvmOairnKandxSj4sNnKnXD/6VGcKJjacfzj7er83HLO5Ha2rwh42btQFbVv+QkQZl9V9CYdydpC8eexUHkNYnTzmlQD6wPRpPx5i5rtgYNszTVS5lBiOAuVSxfbZYIpeaCMyS+K818X/o4YWz1kin3niyvWWaym6dIP1oow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740750907; c=relaxed/relaxed;
	bh=KXYQggls7iQ/CGxbgV/nuZrfJBX6N+DsglBC9T4cwg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY+g/zW1aB8/NtjqOao740eNTcVqNb1O50uxJB7yLIiJDP7k7SObTVhaP1kauWFb87YxVdsu+tK5lOJHKBeM++QL2mZPzKAjbLgBTe0SNeDzBfz0GXvxfGUAlrhwhBTVnazRei9Nb8Bw+5SE8qG+8G8zH2UAiBF3ct4lhf26Nd0ZcajGY9mdEFXMO9LoHtWPQzKm0w8bAb3iapKYoo3YEE0z8moGkR6jrweT55y74KECAVbuhOUaJ8w9dXZwmP0IqVVG1TfSH24EsN4Lwpe7Qf9IDBs2jwPBT0MDupWWpMK+qr29AOpRTFn792Hh0k0ikNce1f1tNS/UlN28R5pBHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48pz17prz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 00:55:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DACD1688;
	Fri, 28 Feb 2025 05:54:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF7283F6A8;
	Fri, 28 Feb 2025 05:54:31 -0800 (PST)
Date: Fri, 28 Feb 2025 13:54:29 +0000
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
Subject: Re: [PATCH v11 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <Z8HAFftf7rAdc_MC@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-3-yangyicong@huawei.com>
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
In-Reply-To: <20250218141018.18082-3-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 10:10:16PM +0800, Yicong Yang wrote:
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
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/base/arch_topology.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 3ebe77566788..23f425a9d77a 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
> @@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
>  #endif
>  
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +
> +/* Maximum SMT thread number detected used to enable the SMT control */
> +static unsigned int max_smt_thread_num;
> +
>  /*
>   * This function returns the logic cpu number of the node.
>   * There are basically three kinds of return values:
> @@ -565,6 +570,16 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		i++;
>  	} while (1);
>  
> +	/*
> +	 * If max_smt_thread_num has been initialized and doesn't match
> +	 * the thread number of this entry, then the system has
> +	 * heterogeneous SMT topology.
> +	 */
> +	if (max_smt_thread_num && max_smt_thread_num != i)
> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +

May be we need to make it more conditional as we may have to support
systems with few cores that are single threaded ? I think Dietmar's
comment is about that.

> +	max_smt_thread_num = max_t(unsigned int, max_smt_thread_num, i);
> +
>  	cpu = get_cpu_for_node(core);
>  	if (cpu >= 0) {
>  		if (!leaf) {
> @@ -677,6 +692,18 @@ static int __init parse_socket(struct device_node *socket)
>  	if (!has_socket)
>  		ret = parse_cluster(socket, 0, -1, 0);
>  
> +	/*
> +	 * Notify the CPU framework of the SMT support. Initialize the
> +	 * max_smt_thread_num to 1 if no SMT support detected or failed
> +	 * to parse the topology. A thread number of 1 can be handled by
> +	 * the framework so we don't need to check max_smt_thread_num to
> +	 * see we support SMT or not.
> +	 */
> +	if (!max_smt_thread_num || ret)
> +		max_smt_thread_num = 1;
> +

For the failed parsing of topology, reset_cpu_topology() gets called.
I suggest resetting max_smt_thread_num to 1 belongs there.

And if you start with max_smt_thread_num, we don't need to update it to
1 explicitly here. So I would like to get rid of above check completely.

--
Regards,
Sudeep

