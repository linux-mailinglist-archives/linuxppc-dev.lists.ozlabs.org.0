Return-Path: <linuxppc-dev+bounces-14334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A48C6D84B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFYm2SFhz3bbm;
	Wed, 19 Nov 2025 19:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763542236;
	cv=none; b=lqYhIGYcAwnt1N29UsxCHLXdkuFvRlG7fLKJEilEC9b7eKylpJ9suhq26PfI5efVNODmUro6e2USpqW8aTp7p9wYpjKgXM9wETxvwnN6mlhe+56i0UQYJVZ02AlU74DyGaKYKJZ4CVsYgunXxTdEWQU2jSPC30fjyQSLl4Sn5iO1UyIjjy3HifC2f/w5xK+SC4nKaf1VdQTUsTcuSebljGv9MYsTo9CMY9tJZnOPpAyqMgHhN/zCvXpDDlv2RFS9ILa66MyG227DF7K6TppyiF6NlHo27HZLhTNYceVJZlenvYINx9VEUg74YBRj9oe8IU+3Sh+l7I/QlEdzIvL63g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763542236; c=relaxed/relaxed;
	bh=DuQ8KBPtycqYoi/ZaFnmVgdGT/TvwCwP1zu//yZFbk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnPAUttbF+vc+bFpKCkLP3TJXLHvE4m/mzs8gZ6B/tACXo1tfpse5qV0l4HiO+OEs02El0BiaoJ6QnVxO7NWRKqQvSMCHMvePXPhJEbzmgKs2+pDowL82Ga3JXFtK/XAXxUsLy/ythYL+1I5IHbh3Lry8XhtlCQWVavqVQarzEDfByc1iyKR2YY2TtltL0Fifw7y37Q8vyGXRhOtsvkmEAFvpYFVTfu2zc0iwU6LlXCIzTSzZuLFXG1LXbZONldTr0FlXWQeyBE/rOQgMsg6bWlhhwsIa7sSZ5tPgkoOt08ra4P8ccESKFRdSEuaGblhOTZrPi7pTAVHSVCTDFSv2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFYl2bw5z3bZf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4dBDvY46Mxz9sSX;
	Wed, 19 Nov 2025 09:20:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsZ2Vq8hKC3F; Wed, 19 Nov 2025 09:20:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4dBDvX4BlQz9sTL;
	Wed, 19 Nov 2025 09:20:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 767948B76D;
	Wed, 19 Nov 2025 09:20:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Xp3vlthDMAtQ; Wed, 19 Nov 2025 09:20:56 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F3EB8B763;
	Wed, 19 Nov 2025 09:20:55 +0100 (CET)
Message-ID: <417d86b5-1333-4d29-b00b-c685972a4f09@csgroup.eu>
Date: Wed, 19 Nov 2025 09:20:55 +0100
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
Subject: Re: [HELPER PATCH 1] sysfs: Provide write method for paravirt
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
 maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
 seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
 iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
 dietmar.eggemann@arm.com
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
 <20251119062100.1112520-17-sshegde@linux.ibm.com>
 <2025111922-rearrange-manned-8a47@gregkh>
 <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/11/2025 à 09:08, Shrikanth Hegde a écrit :
> Hi Greg.
> 
> On 11/19/25 1:12 PM, Greg KH wrote:
>> On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
>>> This is helper patch which could be used to set the range of CPUs as
>>> paravirt. One could make use of this for quick testing of this infra
>>> instead of writing arch specific code.
>>>
>>> This is currently not meant be merged, since paravirt sysfs file is 
>>> meant
>>> to be Read-Only.
>>>
>>> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
>>> cat /sys/devices/system/cpu/paravirt
>>> 100-200,600-700
>>>
>>> echo > /sys/devices/system/cpu/paravirt
>>> cat /sys/devices/system/cpu/paravirt
>>>
>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>> ---
>>>   drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 46 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>>> index 59ceae217b22..043e4f4ce1a9 100644
>>> --- a/drivers/base/cpu.c
>>> +++ b/drivers/base/cpu.c
>>> @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, 
>>> struct kobj_uevent_env *env)
>>>   #endif
>>>   #ifdef CONFIG_PARAVIRT
>>> +static ssize_t store_paravirt_cpus(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf, size_t count)
>>> +{
>>> +    cpumask_var_t temp_mask;
>>> +    int retval = 0;
>>> +
>>> +    if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
>>> +        return -ENOMEM;
>>> +
>>> +    retval = cpulist_parse(buf, temp_mask);
>>> +    if (retval)
>>> +        goto free_mask;
>>> +
>>> +    /* ALL cpus can't be marked as paravirt */
>>> +    if (cpumask_equal(temp_mask, cpu_online_mask)) {
>>> +        retval = -EINVAL;
>>> +        goto free_mask;
>>> +    }
>>> +    if (cpumask_weight(temp_mask) > num_online_cpus()) {
>>> +        retval = -EINVAL;
>>> +        goto free_mask;
>>> +    }
>>> +
>>> +    /* No more paravirt cpus */
>>> +    if (cpumask_empty(temp_mask)) {
>>> +        cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, 
>>> temp_mask);
>>> +    } else {
>>> +        cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, 
>>> temp_mask);
>>> +
>>> +        /* Enable tick on nohz_full cpu */
>>> +        int cpu;
>>> +        for_each_cpu(cpu, temp_mask) {
>>> +            if (tick_nohz_full_cpu(cpu))
>>> +                tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
>>> +        }
>>> +    }
>>> +
>>> +    retval = count;
>>> +
>>> +free_mask:
>>> +    free_cpumask_var(temp_mask);
>>> +    return retval;
>>> +}
>>> +
>>>   static ssize_t print_paravirt_cpus(struct device *dev,
>>>                      struct device_attribute *attr, char *buf)
>>>   {
>>>       return sysfs_emit(buf, "%*pbl\n", 
>>> cpumask_pr_args(cpu_paravirt_mask));
>>>   }
>>> -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
>>> +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, 
>>> store_paravirt_cpus);
>>
>> DEVICE_ATTR_RW()?
> 
> ok.
> 
>>
>> And where is the documentation update for this sysfs file change?
>>
> 
> [RFC PATCH v4 11/17] has the documentation of this sysfs file.

There is a problem in the way you sent this patch and the other helper 
patch. They appear in the cover letter of your series are part of it but 
at the end the series is only sent with 15 patches over 17, and the last 
two patches appear as independent from the series:

Series at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=482680

Other patches are on their own: 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=87866

> https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fall%2F20251119062100.1112520-12- 
> sshegde%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce78250c7fb3647ca116608de2742daa2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638991365240852443%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=RxgUm4gnzXXVnTq0cGQ41Zf1wj83PBEfZm3k%2FPC9Abw%3D&reserved=0
> 
>>>   #endif
>>>   const struct bus_type cpu_subsys = {
>>> @@ -675,7 +720,6 @@ static void __init 
>>> cpu_register_vulnerabilities(void)
>>>           put_device(dev);
>>>       }
>>>   }
>>> -
>>>   #else
>>
>> Why is this change needed?
>>
>> thanks,
>>
>> greg k-h
> 
> This is a helper patch. This helps to verify functionality of any 
> combination
> of CPUs being marked as paravirt which helped me to test some corner cases.
> 
> This is also helpful until the arch specific hint becomes better.
> 
> This is also useful for other archs which haven't implemented archs 
> specific handling of
> steal time, but want to play around with series for their usecase (ex: 
> S390)
> 
> Once arch specific hint becomes better, we could decide to remove it or 
> keep in more appropriate
> place. It really is debugfs for infra which says I don't want to use 
> these CPUs for now.


