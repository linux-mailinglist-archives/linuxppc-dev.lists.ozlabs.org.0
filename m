Return-Path: <linuxppc-dev+bounces-2758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C849B89EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 04:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfmLH0Ggqz2yNJ;
	Fri,  1 Nov 2024 14:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730431158;
	cv=none; b=A8Sgt2Kt4fmRtlF+7vtYAEHVBz1gqjnWeD1/zHXmkzWvIYKwjwnt2So+tBQj9sle8F3pr0ORWzfRVykv/A99+nnJr2Brj/bbh4bBQuDrTrVbAMsVtcHb3Kfb6sSsq5NUndNMCFO6oCMPhVFCmS2eAnIRrvJmKtOdaUdRhtyE9sYQMp4QxYjqR2gSrcX/N25V/YyV0GDb1GM7xMwEBvteutHbrl270hkGk4VLYoVTRt8ZmM0i6sScnbzO98ESw589QldVpEeC7YMIZC/EX6Gp0ZFCthRsVpbdzogy6eG4Pshui7nF1pkoVH+L+anTnBguYrxSN9pgKo/wT7LOpIiNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730431158; c=relaxed/relaxed;
	bh=xhY/uYzTLG4/WfCreMB7N7q9+3bQtmMWHbma8qG1w0o=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AGcC670QKBdpqhZxOzTcl2ZekuuMOeWC7G/UAwnPZOg4v+pFohWVfs+0nFT//I8dOJ7IbtIMQa9oC/HcXOYbU9FsvNtiX5ce/knuEgmoFeXJbYmYzKPb5T1dLJJsThKhsx0Bg3kKnDCo34A6R0sexILtGEvgHQ+DHaQ8PVir1WkD0ODEHr9mpnrf6VoiFp6esxxoNUq1uPlYJv0/h4GanuDFuSr7vWzaHFncnzYEbdFPWlOsGzwWTTIYwBrBfMfS3dcE+SdeUCJV6/L9cKJdPgbZQrql0mIrxCZeuWYrohlFlAvqEriJO+vvv7GcWgJtIGyZnoCHejCa6hKF/7yQUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfmLD2V1Xz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 14:19:13 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XfmGt1n6Xz10P7K;
	Fri,  1 Nov 2024 11:16:22 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BAE71402D0;
	Fri,  1 Nov 2024 11:18:35 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 1 Nov 2024 11:18:34 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Thomas Gleixner <tglx@linutronix.de>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com> <87frocwg64.ffs@tglx>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5617934d-45ac-509a-510e-d96d52a2ebf9@huawei.com>
Date: Fri, 1 Nov 2024 11:18:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
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
In-Reply-To: <87frocwg64.ffs@tglx>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/10/31 21:33, Thomas Gleixner wrote:
> On Thu, Oct 31 2024 at 20:17, Yicong Yang wrote:
>> On 2024/10/30 22:55, Thomas Gleixner wrote:
>>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>>> +{
>>>> +	/*
>>>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>>>> +	 * Architectures do have a special primary thread (e.g. x86) need
>>>> +	 * to override this function. Otherwise just make the first thread
>>>> +	 * in the SMT as the primary thread.
>>>> +	 */
>>>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>>>
>>> How is that supposed to work? Assume both siblings are offline, then the
>>> sibling mask is empty and you can't boot the CPU anymore.
>>>
>>
>> For architectures' using arch_topology, topology_sibling_cpumask() will at least
>> contain the tested CPU itself. This is initialized in
>> drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be
>> empty here.
> 
> Fair enough. Can you please expand the comment and say:
> 
>      The sibling cpumask of a offline CPU contains always the CPU
>      itself.
> 

Sure, will make it clear.

>> Besides we don't need to check topology_is_primary_thread() at boot time:
>> -> cpu_up(cpu)
>>      cpu_bootable()
>>        if (cpu_smt_control == CPU_SMT_ENABLED &&
>>            cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
>>          return true; // we'll always return here and @cpu is always bootable
> 
> cpu_smt_control is not guaranteed to have CPU_SMT_ENABLED state, so this
> argument is bogus.
> 

sorry for didn't explain all the cases here.

For cpu_sm_control == {CPU_SMT_ENABLED, CPU_SMT_NOT_SUPPORTED, CPU_SMT_NOT_IMPLEMENTED},
all the cpu's bootable and we won't check topology_is_primary_thread().

static inline bool cpu_bootable(unsigned int cpu)
{
	if (cpu_smt_control == CPU_SMT_ENABLED && cpu_smt_thread_allowed(cpu))
		return true;

	/* All CPUs are bootable if controls are not configured */
	if (cpu_smt_control == CPU_SMT_NOT_IMPLEMENTED)
		return true;

	/* All CPUs are bootable if CPU is not SMT capable */
	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
		return true;

	if (topology_is_primary_thread(cpu)) // Will be true for all the CPUs when thread sibling's not built
                                             // Only true for primary thread if thread sibling's updated
                                             // thread sibling will be updated once the CPU's bootup, for arm64
                                             // in secondary_start_kernel()
		return true;

	return !cpumask_test_cpu(cpu, &cpus_booted_once_mask); // Also be updated once the CPU's bootup, in
                                                               // secondary_start_kernel() for arm64
                                                               // Will return false in the second check of
                                                               // cpu_bootable() in the call chain below
}

For cpu_smt_control == {CPUS_SMT_DISABLED, CPU_SMT_FORCE_DISABLED} if user specified the
boot option "nosmt" or "nosmt=force", it'll be a bit more complex. For a non-primary
thread CPU, cpu_bootable() will return true and it'll be boot. Then after thread sibling's
built cpu_bootable() will be checked secondly it the cpuhp callbacks, since it'll return
false then and we'll roll back and offline it.

// for a non-primary thread CPU, system boot with "nosmt" or "nosmt=force"
-> cpu_up()
     cpu_bootable() -> true, since the thread sibling mask only coutains CPU itself
     [...]
     cpuhp_bringup_ap()
       bringup_wait_for_ap_online()
         if (!cpu_bootable(cpu)) // target CPU has been bringup, thread sibling mask's updated
                                 // then this non-primay thread won't be bootable in this case
           return -ECANCELED // roll back and offline this CPU

Thanks.





