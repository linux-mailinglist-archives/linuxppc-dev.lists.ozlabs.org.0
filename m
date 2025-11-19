Return-Path: <linuxppc-dev+bounces-14342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E387DC6DDC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 11:01:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBH823FzSz30VL;
	Wed, 19 Nov 2025 21:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763546514;
	cv=none; b=GpF2VPgHlGvXfncc7akCQtDyR9znk2tT6rBrfvauyhE0IVsZLbVUUjHIoL6/uhsUhPFE6laKVKD5ND0KUPIMfRLX56hVfqO3asNxinB2cG88cI5k7xzXaQe95MNChQUkV9ynuJi0PXg2dzW2+hjSQCSZXxtFw4kD5Gp9LwliMF/SiY3GVK0E9t/5P2Id1QbP25o5IaQPl3a5qbaXoDae2+Vx9iX5BK2yeg8JdYCFjz3UI0TnRg7pc6xeOZk8sIh4gbdL9XIxtoKuOMCPZX0Dg8/RAj6OMxt7WTRzK6FRfikTJ96IUxcV01IiCgk0f1fXwuD9Bu4N3XwsVlmEu/f6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763546514; c=relaxed/relaxed;
	bh=SqCluWnniV2wNi5/3jkWInE/GD9Ooz9xC3ViEkTEQE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRC/n3YrOV2Xg9hvipuBH4crNfaeU9hgy0EzMz1B2xc7JEEA3VLlKclCRIgOAkHxLfYRi01sa3n+rCyYZK5iurjROMJMSZNB5XT7dRE9o49vUT6GhZpUyu+QzNrYrTevXTVcutbIDJnQ0F6B4cte4fXAoAfPd5cGp9+dh7ws2KHJzrJ8tyik83qCTIplDYKKa4DzGACE1xgzcaGSQ/w2qZ6qPXeipI0xKOkoRKoULzS4hmRSvZYeV4WS6x/rtxvLUzzCdobiVfrrnFM0GuGNFH26wo0glb2lKbtyS+QN4srs+0q9H1xx4gUgQujKao4grQCVPUcc/ETo7H8seWiZHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouZZ6Ldb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouZZ6Ldb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBH812PQ4z2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:01:53 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ5tpxd001706;
	Wed, 19 Nov 2025 10:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SqCluW
	nniV2wNi5/3jkWInE/GD9Ooz9xC3ViEkTEQE8=; b=ouZZ6Ldb6BIOwV8Z+TuXxG
	H/mpwR/lLITuqmzwMJehQfCDC/pd6fyOY4L1C5/WDaEh4hijTUXm7CnE0vpbjtTQ
	fxu7hXm3zlpGnyuVJxu6sTEdIwB+1rApCRKnmLQ+eaUN3KqrAD704NXuS+wEeyqY
	Tt2tzoIWuzTxc3ZsBcoQ/mov5p7CVHklp+aZ8Fe3qH+APieF4eN7qk3yxnp8RMte
	pgUv166UvHkC4MZiLWUtKaYefIVmoYh9ewAMYdPcnRgs5d+mPndqYRFToGVKe6Oq
	ISM2sCi58vFXyb6EKAQ4n5R+JzFLkT/iwiac7EdY1/ujnbN/l8T+bdtqxjjSHJhQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtxy9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 10:01:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ9fwkQ008485;
	Wed, 19 Nov 2025 10:01:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtxy9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 10:01:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ60Ldg010419;
	Wed, 19 Nov 2025 10:01:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us845y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 10:01:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJA1SfS52429198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 10:01:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C6722007C;
	Wed, 19 Nov 2025 10:01:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E5F72007B;
	Wed, 19 Nov 2025 10:01:24 +0000 (GMT)
Received: from [9.39.25.220] (unknown [9.39.25.220])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 10:01:23 +0000 (GMT)
Message-ID: <7b468240-f614-4a7e-983a-c264acdc1159@linux.ibm.com>
Date: Wed, 19 Nov 2025 15:31:23 +0530
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
 <417d86b5-1333-4d29-b00b-c685972a4f09@csgroup.eu>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <417d86b5-1333-4d29-b00b-c685972a4f09@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E2Woq1ASsTLbE9r4EMjqSBGcaK2GAzeO
X-Proofpoint-ORIG-GUID: sPS8fOB5vT2G-DguZf2ieC44TLEuj7OC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX3iAmuze55LI3
 23nJoCJz2Br1wS/MXaTknaYHx8LZAyZoi/cG9YvkUVs18OZHzNXZFBj4KF+IFHEUXA50NN8Som+
 tscX5iRgVUMFbV1wDzVeLatkbubLRWw/OsEmyAbSMc7ZlW8BjiK9LlWK/yuvYcpM4+XeX2CtgBE
 WVuMVNeYZ3eAc3Sv6jMutvY26Ura3w6wBW5brBdL0awJ/2cVCxS4UbZAHsjbmEMaZGJApxGVOrS
 LfGQ2cORHFPV7B0rtEVVmnT/q7FyL2fQGelGA15RMfGMLksGgRMt3wdrjgfZ2COxfpWS+F5wi9e
 jWm7eGMUjEczrcPxvBHmq+BpaWyN1NtYUSLQOWT5470LLr3QJO+dEKEz+1Uf9EAPt8MkoERyFo+
 tjzkiv8T8+GMLNNXWylgwzh9t+mg0Q==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691d957d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=uTUgWY9tJIqiBckMR3UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/19/25 1:50 PM, Christophe Leroy wrote:
> 
> 
> Le 19/11/2025 à 09:08, Shrikanth Hegde a écrit :
>> Hi Greg.
>>
>> On 11/19/25 1:12 PM, Greg KH wrote:
>>> On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
>>>> This is helper patch which could be used to set the range of CPUs as
>>>> paravirt. One could make use of this for quick testing of this infra
>>>> instead of writing arch specific code.
>>>>
>>>> This is currently not meant be merged, since paravirt sysfs file is 
>>>> meant
>>>> to be Read-Only.
>>>>
>>>> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
>>>> cat /sys/devices/system/cpu/paravirt
>>>> 100-200,600-700
>>>>
>>>> echo > /sys/devices/system/cpu/paravirt
>>>> cat /sys/devices/system/cpu/paravirt
>>>>
>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>> ---
>>>>   drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++ 
>>>> ++--
>>>>   1 file changed, 46 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>>>> index 59ceae217b22..043e4f4ce1a9 100644
>>>> --- a/drivers/base/cpu.c
>>>> +++ b/drivers/base/cpu.c
>>>> @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device 
>>>> *dev, struct kobj_uevent_env *env)
>>>>   #endif
>>>>   #ifdef CONFIG_PARAVIRT
>>>> +static ssize_t store_paravirt_cpus(struct device *dev,
>>>> +                   struct device_attribute *attr,
>>>> +                   const char *buf, size_t count)
>>>> +{
>>>> +    cpumask_var_t temp_mask;
>>>> +    int retval = 0;
>>>> +
>>>> +    if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
>>>> +        return -ENOMEM;
>>>> +
>>>> +    retval = cpulist_parse(buf, temp_mask);
>>>> +    if (retval)
>>>> +        goto free_mask;
>>>> +
>>>> +    /* ALL cpus can't be marked as paravirt */
>>>> +    if (cpumask_equal(temp_mask, cpu_online_mask)) {
>>>> +        retval = -EINVAL;
>>>> +        goto free_mask;
>>>> +    }
>>>> +    if (cpumask_weight(temp_mask) > num_online_cpus()) {
>>>> +        retval = -EINVAL;
>>>> +        goto free_mask;
>>>> +    }
>>>> +
>>>> +    /* No more paravirt cpus */
>>>> +    if (cpumask_empty(temp_mask)) {
>>>> +        cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, 
>>>> temp_mask);
>>>> +    } else {
>>>> +        cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, 
>>>> temp_mask);
>>>> +
>>>> +        /* Enable tick on nohz_full cpu */
>>>> +        int cpu;
>>>> +        for_each_cpu(cpu, temp_mask) {
>>>> +            if (tick_nohz_full_cpu(cpu))
>>>> +                tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    retval = count;
>>>> +
>>>> +free_mask:
>>>> +    free_cpumask_var(temp_mask);
>>>> +    return retval;
>>>> +}
>>>> +
>>>>   static ssize_t print_paravirt_cpus(struct device *dev,
>>>>                      struct device_attribute *attr, char *buf)
>>>>   {
>>>>       return sysfs_emit(buf, "%*pbl\n", 
>>>> cpumask_pr_args(cpu_paravirt_mask));
>>>>   }
>>>> -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
>>>> +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, 
>>>> store_paravirt_cpus);
>>>
>>> DEVICE_ATTR_RW()?
>>
>> ok.
>>
>>>
>>> And where is the documentation update for this sysfs file change?
>>>
>>
>> [RFC PATCH v4 11/17] has the documentation of this sysfs file.
> 
> There is a problem in the way you sent this patch and the other helper 
> patch. They appear in the cover letter of your series are part of it but 
> at the end the series is only sent with 15 patches over 17, and the last 
> two patches appear as independent from the series:
> 
> Series at https://patchwork.ozlabs.org/project/linuxppc-dev/list/? 
> series=482680
> 
> Other patches are on their own: https://patchwork.ozlabs.org/project/ 
> linuxppc-dev/list/?submitter=87866
> 

I edited the patch header before sending. Wanted to say they are debug patches.
Thought "helper" maybe a name. My bad.

I didn't realize that it could seen an separate patches :(
So sorry. I thought it would come up as thread of the series. Like it showed up in
https://lore.kernel.org/all/20251119062100.1112520-12-sshegde@linux.ibm.com/#r

Should I resend the series?

