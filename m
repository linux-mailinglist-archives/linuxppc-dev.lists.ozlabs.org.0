Return-Path: <linuxppc-dev+bounces-333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B516195AEE7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqF3P4RGfz2yR5;
	Thu, 22 Aug 2024 17:20:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqF3N6PV8z2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:20:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF97ADA7;
	Thu, 22 Aug 2024 00:20:23 -0700 (PDT)
Received: from [10.29.19.105] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6521E3F58B;
	Thu, 22 Aug 2024 00:19:53 -0700 (PDT)
Message-ID: <6580b2f6-ef95-4cd9-a573-ded7c8a4ef7d@arm.com>
Date: Thu, 22 Aug 2024 09:19:30 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
 tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, yangyicong@hisilicon.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <ec8c46f2-d819-43d7-a866-d272169178d3@arm.com>
 <04ed0569-5026-9c4f-b09f-3e8798d5b551@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <04ed0569-5026-9c4f-b09f-3e8798d5b551@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2024 09:03, Yicong Yang wrote:
> On 2024/8/16 23:55, Dietmar Eggemann wrote:
>> On 06/08/2024 10:53, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>> So the xarray contains one element for each core_id with the information
>> how often the core_id occurs? I assume you have to iterate over all
>> possible CPUs since you don't know which logical CPUs belong to the same
>> core_id.
>>
> 
> Each xarray element counts the thread number of a certain core id. so the logic is like below:
> 1. if the "core id" entry doesn't exists, then we're accessing this core for the 1st time. create
>    one and make the thread number to 1
> 2. otherwise increment the thread number of "core id" this cpu belongs (PPTT already
>    told us which core this CPU belongs to). Update the max_smt_thread_num if necessary.
> 
> Then we can know max_smt_thread_num by meanwhile iterating the PPTT table and
> build the topology for all the possible CPUs.
> 
> Otherwise we need to do a second scan for the max thread number after built the
> topology. This way is implemented in v1 and it's complained about the overhead on large
> scale systems since we need to loop the CPUs twice.

OK.

[...]

>> Tested on ThunderX2:
>>
>> $ cat /proc/schedstat | head -6 | tail -4 | awk '{ print $1, $2 }'
>> cpu0 0
>> domain0 00000000,00000000,00000000,00000000,00000001,00000001,00000001,00000001
>>                                                    ^        ^        ^        ^
>> domain1 00000000,00000000,00000000,00000000,ffffffff,ffffffff,ffffffff,ffffffff
>> domain2 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
>>
>> detecting 'max_smt_thread_num = 4' correctly.
>>
> 
> Thanks for the testing. ok for a tag?

Yes, please go ahead.

[...]

