Return-Path: <linuxppc-dev+bounces-11377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC2B38263
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 14:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBkNV2GcHz30HB;
	Wed, 27 Aug 2025 22:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756285994;
	cv=none; b=DcFBZBHJ/mCm2Kkd30qR7HDAkOMrV6jUFnesOtDzCxKPRNCNH2QP7CMpbhH4y+1V7u5pIGR1KJ20QLtrc53mq2HGa618L1j1+93lt/XbcTloWTWODgVpdzBsVtHiv2qhbc9nXcjmtQO9wadkSYp8X5ZOgFEiyFGVQK/mleHAXsdNANzabZqAgz3fRPmKrKBZdBPeR/SXrjhCwFDIlpeN30dPysfnsb1X/4TQV8IcrdF+V9aD4GeW80jc1Dl+1HzA3Z+r98ZjkLz+TpJdzSkOXBqw7o+24DC+SWkfjY0ZA5l4Eh7Yo/gQCQ+CLWJUEwsZmDi2R6/E/dxIPYqZUTJyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756285994; c=relaxed/relaxed;
	bh=C/GiYtVT6cqX6QUZSaJsKPKD/rdfU281D1XLmmUxVLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEkWVX5sLPs9ktxo39Ellk+NAkFA/NoFJwalgut3zL1CgcyB38is/lZemau5OlCAp7IOX7LT9uhMaAiB06Oe8vrt/1aCVTGNmQqvUjjUsKqafPjyioVPPv7bxLKCQWZPjoG9qRO4f5Qw75y9AVmKvs0yLV3O2+OZeEZ55IZikxgrNR8rR6y2QZ2R+uwqPYEpCaX/aDlFftkP+1LqEP4DF8xfsvdi6juHo22syU9S+vzpkVlV/C5RKnP06NmsGq+7Q0fA32Igkb+eB39Cklv6r9gFva4zVknGtxyzIXjT+MgkXW4dhWIwGulYOKALKT3HHTFz8kLce/fGcVh4oADCIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ben.horgan@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ben.horgan@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBf2d3tRZz2xK1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 19:13:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27EF4153B;
	Wed, 27 Aug 2025 02:12:31 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C3023F738;
	Wed, 27 Aug 2025 02:12:30 -0700 (PDT)
Message-ID: <e7e9d8f5-9a4b-4efa-9634-7443ca7af2a6@arm.com>
Date: Wed, 27 Aug 2025 10:12:28 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: topology: Use __free(put_cpufreq_policy)
 for policy reference
To: Zihuan Zhang <zhangzihuan@kylinos.cn>,
 "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer
 <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
 <57016487-0fee-4821-9cd5-d6e5fe80a65d@kylinos.cn>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <57016487-0fee-4821-9cd5-d6e5fe80a65d@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Zihuan,

On 8/27/25 09:55, Zihuan Zhang wrote:
> Hi,
> 
> 在 2025/8/27 16:30, Ben Horgan 写道:
>> Hi Zihuan,
>>
>> On 8/27/25 03:31, Zihuan Zhang wrote:
>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>> annotation for policy references. This reduces the risk of reference
>>> counting mistakes and aligns the code with the latest kernel style.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>> ---
>>>   arch/arm64/kernel/topology.c | 9 +++------
>>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>> index 5d07ee85bdae..e3cb6d54f35b 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>>            */
>>>           if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>>               time_is_before_jiffies(last_update +
>>> msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
>>> -            struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
>>> +            struct cpufreq_policy *policy __free(put_cpufreq_policy);
>> Based on the guidance, in include/linux/cleanup.h, I would expect the
>> assignment to be done on this line.
>>
>> "...the recommendation is to always define and assign variables in one
>>   * statement and not group variable definitions at the top of the
>>   * function when __free() is used."
> 
> 
> The reason I split the assignment into multiple lines is because
> scripts/checkpatch.pl gave a warning about the line being too long.
> 
> But if you think a single-line assignment is better, I will modify it
> accordingly.

My preference, for what it's worth, would be to keep it one statement
and split the line after the =.

> 
>>>               int ref_cpu;
>>>   +            policy = cpufreq_cpu_get(cpu);
>>>               if (!policy)
>>>                   return -EINVAL;
>>>                 if (!cpumask_intersects(policy->related_cpus,
>>> -                        housekeeping_cpumask(HK_TYPE_TICK))) {
>>> -                cpufreq_cpu_put(policy);
>>> +                        housekeeping_cpumask(HK_TYPE_TICK)))
>>>                   return -EOPNOTSUPP;
>>> -            }
>>>                 for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>>>                   if (ref_cpu == start_cpu) {
>>> @@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
>>>                       break;
>>>               }
>>>   -            cpufreq_cpu_put(policy);
>>> -
>>>               if (ref_cpu >= nr_cpu_ids)
>>>                   /* No alternative to pull info from */
>>>                   return -EAGAIN;
>> Thanks,
>>
>> Ben
>>

Thanks,

Ben


