Return-Path: <linuxppc-dev+bounces-14331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA2C6D4E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:09:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBDdk37bVz30gC;
	Wed, 19 Nov 2025 19:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763539738;
	cv=none; b=m0cK1MYDuHapfH5kplEuKWLX3yn5JkWGr6OPeGDfSeEyiTnA4XwgGo3kSVQ3TlU59r7vadbBcGhDUv8+2/0aRR3Sl0azpZXGUS5uekod83u+XBYWc88Es+sPQdQkSHO/miJrqW5HzDuO1FCiVkq4wtNAKgGXBpQ0bB5ZdhxelIAE/Pl27KoLNauCAu4MKnZK30zMh8Q69OqLTUpo135wuHVHxHT5QJszvp5lrX4AtfGIND5v1VBbU5CUI9b16ROveUiF43YtrmXnV15TgkxucJ3IzHoWcqpapZlWGgM6+HdiFMAoUgR4bFbn8QPqg/9Y4J03TvVXgA0YPJ2jiQgDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763539738; c=relaxed/relaxed;
	bh=1vpZo3ZXDXzbu/KeNqxJ80LxFBL7BMxFuXZmxOx7+6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVnEmlsWS+YBVVsXw5jbnkiqm2MlP5A1Tv9Zv1GxEK3M+COQzYA7wmtBXJ5AJQ4eCdj46sHCAvMCuxO0CjrExTjHUNVC1Ppd+d/AaUYjmQVlqalajhE78ipDlPQhrq5kLyu3X5wtM5iX5HWPzjJ8i8eAtsHlthIad3kg15Z2E68VhRFdao2/A0RBDDEJOy73tYdXeAX1amb37JztnDXkNrOC1abNQfyOWdgBP+pOYNuVP0uDsYuUbXoxm6TErkcdpcZ+jOhUh/YexRoINccKKh9oIZjt4mZby4By6hzylL7PzRtxnOdfVG6JwU4r/8pJq8+aqY6oGyl/bgRjTICIrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gu9riINc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gu9riINc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBDdj14R9z30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:08:56 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIH95g3007244;
	Wed, 19 Nov 2025 08:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1vpZo3
	ZXDXzbu/KeNqxJ80LxFBL7BMxFuXZmxOx7+6o=; b=Gu9riINczu1x92czBDXudR
	5uAMz7yd0HSaDqc45st4IyhuoXUcZ5BMseuOuty6JR40cx+KDWb15vUPX8YSOi5M
	8obcQIdZvjk+t4oacVT/++ytf7DqnHm3xuSmukgzT2Ky0HJDf07zrvmr6Grw0M0Q
	kftwSB5I5lGwv+hCE6cQlJ0Reh9jexmcrgN8Cf2DSp2Z+THnNNo73bVLf7Tq0Kbs
	VMgLT6ELsdNYwRGHYfYEEFqq0nZx3QVCpO6Lr5hGvBWVK9o69ZtfTPTQtwSnwYcV
	E5OjEFRNV3OQMLzILfIs7zmow94KdZixpzEZcW6Ofys+29iR+LQHUOMFa6DdXUsw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmspjy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 08:08:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ7vqHs025049;
	Wed, 19 Nov 2025 08:08:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmspjy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 08:08:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ4kedB007037;
	Wed, 19 Nov 2025 08:08:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jfb1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 08:08:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ88Tv630278136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 08:08:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D50C2004F;
	Wed, 19 Nov 2025 08:08:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A22D20043;
	Wed, 19 Nov 2025 08:08:25 +0000 (GMT)
Received: from [9.39.25.220] (unknown [9.39.25.220])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 08:08:24 +0000 (GMT)
Message-ID: <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
Date: Wed, 19 Nov 2025 13:38:24 +0530
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
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
 <20251119062100.1112520-17-sshegde@linux.ibm.com>
 <2025111922-rearrange-manned-8a47@gregkh>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <2025111922-rearrange-manned-8a47@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tWce1SLEIMSg6xjuhCBa4YYKhX3UVnZp
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691d7b02 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=L9AEKlwG4kL6xNUABP0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Tl2pV58yjwCezWqLaulQBFKNWAxCJUav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwt1kKJadwdY9
 UUmo+BJYGZmyae1Y+d8TLsTL3b3hJDculni6SUavRmXZBgJo9yty7CtM7fdnuWOyUdEhugBdtZr
 jNawbsAFpAxJdp2UVygtZO7C27dM1699eid7SrodpOy9P/69tSPz2eEJeORab9NUEhX3PMT7tGa
 FljBbkVY9KN4hWO4vueN5QQUUh2GSYM7IJuuVw4rp3mc0OJvVnpvtirDV8foVfij1UHDJy/Ej7A
 5Pq3O5OiWBUOr8zrLYbWhuiWoJ4WegFGINNAfY7OmAJ3LGWqIJfS/Oe5yzfHwq0WIgJhDWhwSA+
 KTnVgoPXCx2n/K+LsAQ4N3KJPtYX5stCaMPrtFwD+zcWMp2pVuE9T5cGPDmV5u/cDWWFmUZKLk1
 gXWuxoJKPxHlA5hTzvfzsiOexooEAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Greg.

On 11/19/25 1:12 PM, Greg KH wrote:
> On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
>> This is helper patch which could be used to set the range of CPUs as
>> paravirt. One could make use of this for quick testing of this infra
>> instead of writing arch specific code.
>>
>> This is currently not meant be merged, since paravirt sysfs file is meant
>> to be Read-Only.
>>
>> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
>> cat /sys/devices/system/cpu/paravirt
>> 100-200,600-700
>>
>> echo > /sys/devices/system/cpu/paravirt
>> cat /sys/devices/system/cpu/paravirt
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>> index 59ceae217b22..043e4f4ce1a9 100644
>> --- a/drivers/base/cpu.c
>> +++ b/drivers/base/cpu.c
>> @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
>>   #endif
>>   
>>   #ifdef CONFIG_PARAVIRT
>> +static ssize_t store_paravirt_cpus(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	cpumask_var_t temp_mask;
>> +	int retval = 0;
>> +
>> +	if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +
>> +	retval = cpulist_parse(buf, temp_mask);
>> +	if (retval)
>> +		goto free_mask;
>> +
>> +	/* ALL cpus can't be marked as paravirt */
>> +	if (cpumask_equal(temp_mask, cpu_online_mask)) {
>> +		retval = -EINVAL;
>> +		goto free_mask;
>> +	}
>> +	if (cpumask_weight(temp_mask) > num_online_cpus()) {
>> +		retval = -EINVAL;
>> +		goto free_mask;
>> +	}
>> +
>> +	/* No more paravirt cpus */
>> +	if (cpumask_empty(temp_mask)) {
>> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
>> +	} else {
>> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
>> +
>> +		/* Enable tick on nohz_full cpu */
>> +		int cpu;
>> +		for_each_cpu(cpu, temp_mask) {
>> +			if (tick_nohz_full_cpu(cpu))
>> +				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
>> +		}
>> +	}
>> +
>> +	retval = count;
>> +
>> +free_mask:
>> +	free_cpumask_var(temp_mask);
>> +	return retval;
>> +}
>> +
>>   static ssize_t print_paravirt_cpus(struct device *dev,
>>   				   struct device_attribute *attr, char *buf)
>>   {
>>   	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
>>   }
>> -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
>> +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, store_paravirt_cpus);
> 
> DEVICE_ATTR_RW()?

ok.

> 
> And where is the documentation update for this sysfs file change?
> 

[RFC PATCH v4 11/17] has the documentation of this sysfs file.
https://lore.kernel.org/all/20251119062100.1112520-12-sshegde@linux.ibm.com/

>>   #endif
>>   
>>   const struct bus_type cpu_subsys = {
>> @@ -675,7 +720,6 @@ static void __init cpu_register_vulnerabilities(void)
>>   		put_device(dev);
>>   	}
>>   }
>> -
>>   #else
> 
> Why is this change needed?
> 
> thanks,
> 
> greg k-h

This is a helper patch. This helps to verify functionality of any combination
of CPUs being marked as paravirt which helped me to test some corner cases.

This is also helpful until the arch specific hint becomes better.

This is also useful for other archs which haven't implemented archs specific handling of
steal time, but want to play around with series for their usecase (ex: S390)

Once arch specific hint becomes better, we could decide to remove it or keep in more appropriate
place. It really is debugfs for infra which says I don't want to use these CPUs for now.

