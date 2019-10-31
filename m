Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA945EAA27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 06:22:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473YbY5cvNzF4sq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:22:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="rF+/ZRGY"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YYC0j3jzF3GG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 16:19:58 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba6f000000>; Wed, 30 Oct 2019 22:20:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 22:19:55 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 22:19:55 -0700
Received: from [10.2.172.9] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 05:19:53 +0000
Subject: Re: [PATCH v2] cpufreq: powernv: fix stack bloat and NR_CPUS
 limitation
To: Michael Ellerman <mpe@ellerman.id.au>, Viresh Kumar
 <viresh.kumar@linaro.org>, Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
References: <20191018045539.3765565-1-jhubbard@nvidia.com>
 <87pnidbptw.fsf@mpe.ellerman.id.au>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <405c2ac2-a61c-e7e6-3487-c55bcdf1e839@nvidia.com>
Date: Wed, 30 Oct 2019 22:17:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87pnidbptw.fsf@mpe.ellerman.id.au>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572499201; bh=Lgg3WPBQcbXMUHYh4dycG3/ll1LXNGzsuqWxnAt4TKM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rF+/ZRGYrkR9VRln6J5ePJeOIpT6GvsoLVg88ufoOYIY7pXltVb3YHDWZvgJCIyWo
 ihWk8+KEWdwR3jW6DpWyPcYl3rvT8NwfjaE6bShuYysDPGs/TFM01m1ogW/jmf7mVM
 aUjXhy83XPqTOu1Uo/PUt+js7RvguT0tAloLNdtPDAcbljqkBLqrXuPrcbczL+SNN2
 gMsxDUxVw+GiXXRLQMnK9Zi36ntanv+qzJFK0Zf7oTyR8RRHghv1IAl1qrfxumvDJv
 q4kljYJqN8tNueKEaIQZUXvW2SJcAsE7X6ojukF9AXR1DBJlobRAl3j+zSwFbNCLyT
 DWiZAxhoLJKwg==
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
Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/19 7:39 PM, Michael Ellerman wrote:
> Hi John,
> 
> Sorry I didn't reply to this sooner, too many patches :/
> 
> John Hubbard <jhubbard@nvidia.com> writes:
>> The following build warning occurred on powerpc 64-bit builds:
>>
>> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
>> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Oddly I don't see that warning in my builds, eg with GCC9:
> 
>    https://travis-ci.org/linuxppc/linux/jobs/604870722

This is with a cross-compiler based on gcc 8.1.0, which I got from:
   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/

I'll put that in the v3 commit description.

> 
>> This is due to putting 1024 bytes on the stack:
>>
>>      unsigned int chip[256];
>>
>> ...and while looking at this, it also has a bug: it fails with a stack
>> overrun, if CONFIG_NR_CPUS > 256.
> 
> It _probably_ doesn't, because it only increments the index when the
> chip_id of the CPU changes, ie. it doesn't create a chip for every CPU.
> But I agree it's flaky the way it's written.

I'll soften up the wording accordingly.

> 
>> Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.
> 
> Shouldn't it use num_possible_cpus() ?
> 
> Given the for loop is over possible CPUs that seems like the upper
> bound. In practice it should be lower because some CPUs will share a
> chip.
> 

OK, I see, that's more consistent with the code, I'll change to that.


thanks,
-- 
John Hubbard
NVIDIA

> 
> 
>> Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
>> Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
>> Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
>> Cc: linux-pm@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>
>> Changes since v1: includes Viresh's review commit fixes.
>>
>>   drivers/cpufreq/powernv-cpufreq.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
>> index 6061850e59c9..5b2e968cb5ea 100644
>> --- a/drivers/cpufreq/powernv-cpufreq.c
>> +++ b/drivers/cpufreq/powernv-cpufreq.c
>> @@ -1041,9 +1041,14 @@ static struct cpufreq_driver powernv_cpufreq_driver = {
>>   
>>   static int init_chip_info(void)
>>   {
>> -	unsigned int chip[256];
>> +	unsigned int *chip;
>>   	unsigned int cpu, i;
>>   	unsigned int prev_chip_id = UINT_MAX;
>> +	int ret = 0;
>> +
>> +	chip = kcalloc(CONFIG_NR_CPUS, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>>   
>>   	for_each_possible_cpu(cpu) {
>>   		unsigned int id = cpu_to_chip_id(cpu);
>> @@ -1055,8 +1060,10 @@ static int init_chip_info(void)
>>   	}
>>   
>>   	chips = kcalloc(nr_chips, sizeof(struct chip), GFP_KERNEL);
>> -	if (!chips)
>> -		return -ENOMEM;
>> +	if (!chips) {
>> +		ret = -ENOMEM;
>> +		goto free_and_return;
>> +	}
>>   
>>   	for (i = 0; i < nr_chips; i++) {
>>   		chips[i].id = chip[i];
>> @@ -1066,7 +1073,9 @@ static int init_chip_info(void)
>>   			per_cpu(chip_info, cpu) =  &chips[i];
>>   	}
>>   
>> -	return 0;
>> +free_and_return:
>> +	kfree(chip);
>> +	return ret;
>>   }
>>   
>>   static inline void clean_chip_info(void)
>> -- 
>> 2.23.0
