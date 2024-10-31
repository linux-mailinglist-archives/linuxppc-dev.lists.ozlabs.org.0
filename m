Return-Path: <linuxppc-dev+bounces-2745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A79B7A66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 13:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfNLZ1216z2yVG;
	Thu, 31 Oct 2024 23:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730377094;
	cv=none; b=TwClKM40yK1nfDsIvmyJdgrjGCUL6oQUnQl5qA2MUrNLDTleS+OpbAF/cp5kTp9sMp1nuXI0gZLYd2DGFjpq5Ud/6huhl3abTaLdLKrqoc/KooHC98yXN2xYEkBtn0h7r/oSlgf3fTEcmqER797zrk1qOtnCSwtagZOkvUYx3MtFT69Gnr1hA4kBfoYoXV2aXfw5TQ+f/Ais71UOfFIBi7Zx6/GRSFR+zpfr71ezMb6yC6hh5tcoko+CySl+Plq+Bn7tEk+suXMnK/P6wx7YoXfiJrPcNXoBWooiAAV/oA08sFSxiLWCwzsu15YkXH1P7qSAaiHqneu4JWXl+vFltw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730377094; c=relaxed/relaxed;
	bh=PZFHYS3RLQVBCEyFhBjpblkzuBhfsjCvMeSCBEdE1Kg=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fjaD+wElpt75fUKOg4CZ6rY3s97ZMXKRkdUG4hJ4laLO8ubTeq1QYANnoPi9MUK3CK5Zsej/ZO3hLTAFYURZhzACQujnwE+LoftKpY94nMC7m1QtP2FZKoiXOerFdANWqDkcU5LzaePquplje/ltbefkPkdOm3tqbz1vTbUIlMvNnX4aXcfTQ/nNyZAI5HJQm11gtYbn13LoHdI7/6vXZYAT5Y0bkAEHQ7PQNExfUej/Ywns4BnuOe92HRa7BZLMIIwMY9aAZkQVNA0oy/E2hCeSTnAsry6fWXDtODKLaUmoOmZMsHxrkHHWd7FbkDGw3ySIHoXKYPiwroR3aw5rDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfNLX2q1fz2yRP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 23:18:08 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XfNHJ4SqXzdkPl;
	Thu, 31 Oct 2024 20:15:24 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id B2FC918009B;
	Thu, 31 Oct 2024 20:17:58 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 31 Oct 2024 20:17:57 +0800
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
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Date: Thu, 31 Oct 2024 20:17:57 +0800
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
In-Reply-To: <87ttcty71m.ffs@tglx>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/10/30 22:55, Thomas Gleixner wrote:
> On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>>  
>> +#ifndef topology_is_primary_thread
>> +#define topology_is_primary_thread topology_is_primary_thread
> 
> Please do not glue defines and functions together w/o a newline in between.
> 

sure, will add a newline here.

>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>> +{
>> +	/*
>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>> +	 * Architectures do have a special primary thread (e.g. x86) need
>> +	 * to override this function. Otherwise just make the first thread
>> +	 * in the SMT as the primary thread.
>> +	 */
>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> 
> How is that supposed to work? Assume both siblings are offline, then the
> sibling mask is empty and you can't boot the CPU anymore.
> 

For architectures' using arch_topology, topology_sibling_cpumask() will at least
contain the tested CPU itself. This is initialized in
drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be empty here.

Besides we don't need to check topology_is_primary_thread() at boot time:
-> cpu_up(cpu)
     cpu_bootable()
       if (cpu_smt_control == CPU_SMT_ENABLED &&
           cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
         return true; // we'll always return here and @cpu is always bootable

Also tested fine in practice.

Thanks.



