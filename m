Return-Path: <linuxppc-dev+bounces-14341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0310C6DD81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 10:57:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBH2X5pdGz3bsS;
	Wed, 19 Nov 2025 20:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763546228;
	cv=none; b=BaKWU9zAYWv115lvECJ8arSvSQjQ6VnltJU24Nos2C4jXHtke5ytgsO9UifTBDyqaiDRHNRvdVVhRhYwrf5rBYZVuuMkEwvLc//ZXKm8eNFrwktDH9e8sE7wFsuUmdMegpG90wVOm2UDkZJ8857E0onROoYGrFd8tOzzGGyeNauAEDNQFtxnOHniqBESNgQkoGd0mi0hBzxAZO0wS89VGHn0x82PBO6LxQPP8aVTx+moTFFLQsnT7AGL5sLRjsXgggRrudeEL+4oHNhU0yX0L5zV7uJyQB7FMjx/o8RiiBX856dYAj52ha5nqyd9D/189+u4NLir/KESHcWmWu3I9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763546228; c=relaxed/relaxed;
	bh=q0hnTbQk4hs9hsoA4km16fAxNT3UZThDCY8d1WeOS7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auBtrGv937pic9sA4oihMufBahkvnRZWq7G9mU/EkyvAW4ouDwhpGZP5GjsjrcPCnCQoyHI7s90rbFjYWUEVJ2x9H+3kv0TDJAF55vGzCgUqLpiMO4jx4t6972MeQCXZC2lYYyIZ3q+IFv75SXdI28DguU+he4pRb/xDTZ5MN40mAaAmUwq149QDNNQdGfo14Fbd7L+0EFgP7Q8Abchuz84XKKx4q0x5jlw/dL9uyGbuo1rBkFrUpvCsyXp8ynC8rxaaf/6ipKy3gRjUbGdoU9OxNVH8h2PaoTY/kWZxVxRsIJIZ/HWo/S5wHOM+vfwkP+M3FzVF+pmcROhanBYC/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3mWgroG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3mWgroG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBH2W4Zfqz3br7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 20:57:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ5e85F011801;
	Wed, 19 Nov 2025 09:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q0hnTb
	Qk4hs9hsoA4km16fAxNT3UZThDCY8d1WeOS7c=; b=f3mWgroG9j1voEX1N5KVmq
	007yN0/M3dWbKhimmY65/vYfEcAR5ViUSb2oh87+Re0XjYIx2LYUSIFudq6+PAEM
	YvQmmHAgEfc0b0VDdCPJXrPlr7b7/vSIcNmor41XZ8in/RKrbc2CYj2lePoVsq75
	spISV+ed0CCJC0sFIeN8Lvrzzs/1eTPGd0jBAZ9mkPK5R1X5mdU6uvdEk8sYE5zA
	eV892ddo/XgJsrXp4xmvHfoLrkhPyNtOPYd6BBnYB2diVvtrmlEnqKr5C1M1s+yr
	v4pPKhLRA7RCuvVf2hBfNkflTXpXHd4WQkI4N4Rjsi8MWUu3bWFXS5l3XBa6zG5g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsq0ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:56:44 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ9hk6q015020;
	Wed, 19 Nov 2025 09:56:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsq0wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:56:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ7eReO022347;
	Wed, 19 Nov 2025 09:56:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umyx25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:56:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ9ucf130474686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 09:56:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 872A120040;
	Wed, 19 Nov 2025 09:56:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C9DB2004B;
	Wed, 19 Nov 2025 09:56:34 +0000 (GMT)
Received: from [9.39.25.220] (unknown [9.39.25.220])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 09:56:34 +0000 (GMT)
Message-ID: <fc2617a6-d6af-4347-8e6d-467396ab8a39@linux.ibm.com>
Date: Wed, 19 Nov 2025 15:26:33 +0530
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
 <dadeeb85-779e-44e8-83b7-4c53ad338493@linux.ibm.com>
 <2025111959-gumminess-rely-6f95@gregkh>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <2025111959-gumminess-rely-6f95@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y7BZTnf640WXp2RDFONFh3BAOUwxviPa
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691d945c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=v2n1ztdZ2v2dj9H04rYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4VJfPvfl_2V1nY2n1b-fcV39IzAeklGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7tbWwmpMkFN1
 eomkaz/BsfMSmL8VEDCQRy5yDVhl/6XeyIMqxBixsjGwzncy7MFmhrlvDDKbolUVI/yZYlMLHzB
 YJ0f5IzaBhtO9q4JkE4QpHEfMykF8H05jbmXXyHSYlZ9EwJ3V0zSaDaa6AU4CUBcGuRhOAgYuLa
 v8DfuHqBJmw63BWRz5CzVz2oMpaAXtyHEoOuHlbjp3v4MeBQbz92RFL0PWzJ3MrhcIt6m6JLoK0
 AwOmG4XjYS3VcQ6wUIGrgDf9wxgdr2DRPfjM6m15ZoDkIG3uOYUFalUaG8NUCSzvnEO0EiVb9iC
 qokC3CmeefKcUxu4103oL5pPMfFGRMvJ2CyUxIYaxUDROYdM9kKWM26ZJ9Q690jk/p2AoVbbWoC
 xZW6auP+dg9OgEqycsLQVOj/I7rrqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/19/25 1:53 PM, Greg KH wrote:
> On Wed, Nov 19, 2025 at 01:38:24PM +0530, Shrikanth Hegde wrote:
>> Hi Greg.
>>
>> On 11/19/25 1:12 PM, Greg KH wrote:
>>> On Wed, Nov 19, 2025 at 11:50:59AM +0530, Shrikanth Hegde wrote:
>>>> This is helper patch which could be used to set the range of CPUs as
>>>> paravirt. One could make use of this for quick testing of this infra
>>>> instead of writing arch specific code.
>>>>
>>>> This is currently not meant be merged, since paravirt sysfs file is meant
>>>> to be Read-Only.
>>>>
>>>> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
>>>> cat /sys/devices/system/cpu/paravirt
>>>> 100-200,600-700
>>>>
>>>> echo > /sys/devices/system/cpu/paravirt
>>>> cat /sys/devices/system/cpu/paravirt
>>>>
>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>> ---
>>>>    drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 46 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>>>> index 59ceae217b22..043e4f4ce1a9 100644
>>>> --- a/drivers/base/cpu.c
>>>> +++ b/drivers/base/cpu.c
>>>> @@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
>>>>    #endif
>>>>    #ifdef CONFIG_PARAVIRT
>>>> +static ssize_t store_paravirt_cpus(struct device *dev,
>>>> +				   struct device_attribute *attr,
>>>> +				   const char *buf, size_t count)
>>>> +{
>>>> +	cpumask_var_t temp_mask;
>>>> +	int retval = 0;
>>>> +
>>>> +	if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
>>>> +		return -ENOMEM;
>>>> +
>>>> +	retval = cpulist_parse(buf, temp_mask);
>>>> +	if (retval)
>>>> +		goto free_mask;
>>>> +
>>>> +	/* ALL cpus can't be marked as paravirt */
>>>> +	if (cpumask_equal(temp_mask, cpu_online_mask)) {
>>>> +		retval = -EINVAL;
>>>> +		goto free_mask;
>>>> +	}
>>>> +	if (cpumask_weight(temp_mask) > num_online_cpus()) {
>>>> +		retval = -EINVAL;
>>>> +		goto free_mask;
>>>> +	}
>>>> +
>>>> +	/* No more paravirt cpus */
>>>> +	if (cpumask_empty(temp_mask)) {
>>>> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
>>>> +	} else {
>>>> +		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
>>>> +
>>>> +		/* Enable tick on nohz_full cpu */
>>>> +		int cpu;
>>>> +		for_each_cpu(cpu, temp_mask) {
>>>> +			if (tick_nohz_full_cpu(cpu))
>>>> +				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	retval = count;
>>>> +
>>>> +free_mask:
>>>> +	free_cpumask_var(temp_mask);
>>>> +	return retval;
>>>> +}
>>>> +
>>>>    static ssize_t print_paravirt_cpus(struct device *dev,
>>>>    				   struct device_attribute *attr, char *buf)
>>>>    {
>>>>    	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
>>>>    }
>>>> -static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
>>>> +static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, store_paravirt_cpus);
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
>> https://lore.kernel.org/all/20251119062100.1112520-12-sshegde@linux.ibm.com/
> 
> So a rfc patch has the documentation for a change that you don't want to
> have applied?  This is an odd series, how are we supposed to review
> this?

I added the documentation for sysfs file as the file is read only. The last two
patch are debug patches. So i didn't update the documentation saying it can be written
too. I hope this clears the doubts.

> 
>> This is a helper patch. This helps to verify functionality of any combination
>> of CPUs being marked as paravirt which helped me to test some corner cases.
> 
> I don't think I have ever seen a "helper patch" to know what to do with
> it :(
> 

Sorry for confusion with the name.

All I wanted to say there was it is debug patch one could use.
Would [RFC PATCH 16/17][DEBUG] would have been a better name?


