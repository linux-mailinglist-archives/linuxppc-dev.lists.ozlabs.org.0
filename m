Return-Path: <linuxppc-dev+bounces-7962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF597A9B32A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 17:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk0xr2vF6z3bsT;
	Fri, 25 Apr 2025 01:58:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745510304;
	cv=none; b=g7kDFuqlHne+PCs0WnwInUNK4zv66IvlJg//6Whf53n/+vLaNaBfu9zB2dsoqSHKE22ENKJKJxi/UJclWlhANRWy9NHiikHNlNzBjruQFTSECCvV0aiiWZ9PHXT9EJMALBeZXgq/IOlPXRO05Cts8YvS8RZK9LdNb0GlCzpHejzyf6IgvA6/t45y6Se061kHWIA6GQlnnT8jAWaI+Aalb7L/6TmCzGWyVbbI2T5kD0hu8gAL/2o76gylBJ4k54djxbjbMOs2OtKxc7seyzpf3u9r15regejh/iOUcnWbeA1zORyd/MEgNVXfnDzEba68ximOtcLKqgdAFGEjfeZHww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745510304; c=relaxed/relaxed;
	bh=R30PE/pVh5sh9qCfJc7TEhJ9R4WvOk+j2vyXVmxXjVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHkqfvI+CmT2tMXlY6x8ZCGTTRnEMHST21KJQp7a/VLlm6PxOP8nwKHAv7/Wk54XgU2BQiSMYuA9pB06szo3UENp/roMEl05z+jdX3QgTBMOXVS7VQbeUafHyVQrPuyf4j9Cv/yyw6WWVVkt3VwhDbsy6Jq3oZIcL0AFkmWuzAGOOn0xUZmsYGRuA775+tgBE2msADEPnN9prxqsGphulYFPQGe8BPsPcie1vt3Dto32H0n4rIeX1UZyngrBD3PfLI6emGoTSI0JBtl0NZwl/o9e25Q13nBraLO7u0t+YVk62apujroJPFOliEK+fE8iURLRZe741GbJWhbfl7a5AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IyOZRVbE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IyOZRVbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk0xq29LQz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 01:58:22 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9EZeA014502;
	Thu, 24 Apr 2025 15:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R30PE/
	pVh5sh9qCfJc7TEhJ9R4WvOk+j2vyXVmxXjVc=; b=IyOZRVbEGP3EeKVESk9joo
	jm3E+m4rseCttspJbkYvKgXyDjchLcjKNAnvbw7998GS2xNZnuEMO3uZOATnxMqb
	IcBNtc+b+j6MF5dD+kSWOgMbgLzjWAsZdkn9mljinnUIpACuZSPz4Zt9SR9VxKCj
	hmzliHqJZkbu/rs/2C1MW1pIu4J0ffu3S7EUIldWymdqo7IaAbIVnDelxP77ZZb1
	EfJQ6AfZ7hZh8NRVA0LdU0/Oo59LiMQCWE9SVaDOJJx9WmnjTUAO96Mhn+6s1fLZ
	B3sCKjWbFesANK99MIUw+M/NXfc2l0yffk8vIDkxald7dPIHXdT/KUMrGlsUMP3A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4678bwcedk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53OFq6t8010040;
	Thu, 24 Apr 2025 15:58:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4678bwcedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFTqJ9022281;
	Thu, 24 Apr 2025 15:58:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfxgwbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53OFw3N643909608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 15:58:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1889B20043;
	Thu, 24 Apr 2025 15:58:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E57D20040;
	Thu, 24 Apr 2025 15:58:01 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Apr 2025 15:58:01 +0000 (GMT)
Message-ID: <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
Date: Thu, 24 Apr 2025 21:27:59 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
        vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250424144215._ooDjDz9@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNiBTYWx0ZWRfX4dggBOUBP4Fo htQ/BokLdhbpY+X0AdK+/tH2C+X3swTgmk1M2mzFNu6K1i2ouwdPHnvfl2jOOAp7FuNLTFG9Xuy uKqfhQcXt+IXxJIo78NHdMiieZKhJ4y2clYf9/d/KhI0LIo13SxV7+BAmh3wAZ6Adp+Rh7HhdcH
 Lo6h6cZx92qh/bIHKrvUwA9VWscYAxJM9bqS4jL7z0r7XopDzMpRffY/ih5eUn6nM5YM40i3OiN C8xsjkscwJ0GAYA1YHakaS8Way1OSgDd+kfeegLRHz/3z6A+UaBQ4sT2sqoeYLnT55NjgqnVnwm n1CoN9xl9xGp7rC98TsgPwwAKeDQvO+1/gIjVVNTbvGjbash6QL6HpKQG3euJQtb3RPe9FzVMYE
 N3su4q2fcRD8z3amEkKa1+dk/61v15Yxif1Ge0kJLMGbiFBb8zvJbwHnY1zyLbOah143M4Rj
X-Proofpoint-ORIG-GUID: yLCGgi62YEacsIUiGMg_GRfHcyoIlg2J
X-Authority-Analysis: v=2.4 cv=KZzSsRYD c=1 sm=1 tr=0 ts=680a5f90 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=aRSudAjuEQCHUFqpYEwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4jsIiudgz4lPelbXPqhO5DiJGVp0_3Wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240106
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/24/25 20:12, Sebastian Andrzej Siewior wrote:

Thanks Sebastian for taking a look.

> On 2025-04-21 15:58:36 [+0530], Shrikanth Hegde wrote:
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 19f4d298d..123539642 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -80,8 +80,8 @@
>>   #include <asm/ultravisor.h>
>>   #include <asm/dtl.h>
>>   #include <asm/plpar_wrappers.h>
>> -
>>   #include <trace/events/ipi.h>
>> +#include <linux/entry-kvm.h>
>>   
>>   #include "book3s.h"
>>   #include "book3s_hv.h"
>> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>   	}
>>   
>>   	if (need_resched())
>> -		cond_resched();
>> +		schedule();
> 


> This looks unrelated and odd. I don't why but this should be a
> cond_resched() so it can be optimized away on PREEMPT kernels.

This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.

> 
>>   	kvmppc_update_vpas(vcpu);
>>   
>> @@ -5097,10 +5097,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>>   		return -EINVAL;
>>   	}
>>   
>> -	/* No need to go into the guest when all we'll do is come back out */
>> -	if (signal_pending(current)) {
>> -		run->exit_reason = KVM_EXIT_INTR;
>> -		return -EINTR;
>> +	/* use generic frameworks to handle signals, need_resched  */
>> +	if (__xfer_to_guest_mode_work_pending()) {
>> +		r = xfer_to_guest_mode_handle_work(vcpu);
> This could be unconditional.
> 
>> +		if (r)
>> +			return r;
>>   	}
>>   
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 153587741..4ff334532 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -34,6 +34,7 @@
>>   #endif
>>   #include <asm/ultravisor.h>
>>   #include <asm/setup.h>
>> +#include <linux/entry-kvm.h>
>>   
>>   #include "timing.h"
>>   #include "../mm/mmu_decl.h"
>> @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>   {
>>   	int r;
>>   
>> +	/* use generic framework to handle need resched and signals */
>> +	if (__xfer_to_guest_mode_work_pending()) {
>> +		r = xfer_to_guest_mode_handle_work(vcpu);
> 
> there is nothing special you do checking and handling the work. Couldn't
> you invoke xfer_to_guest_mode_handle_work() unconditionally?
> 

I followed what was in arch/x86/kvm/x86.c. Since xfer_to_guest_mode_handle_work does the same check
it makes sense to call it without checks too.

Will update in v2.

>> +		if (r)
>> +			return r;
>> +	}
>> +
>>   	WARN_ON(irqs_disabled());
>>   	hard_irq_disable();
>>   
>>   	while (true) {
>> -		if (need_resched()) {
>> -			local_irq_enable();
>> -			cond_resched();
>> -			hard_irq_disable();
>> -			continue;
>> -		}
>> -
>> -		if (signal_pending(current)) {
>> -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
>> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
>> -			r = -EINTR;
>> -			break;
> 
> I don't how this works but couldn't SIGNAL_EXITS vanish now that it
> isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
> to a different counter so it is not lost. The reader just needs to look
> somewhere else for it.

ok. thanks for pointing out.

AFAIU it is updating the stats mostly. But below could keep the stats happy.
I will update that in v2.

         if (__xfer_to_guest_mode_work_pending()) {
                 r = xfer_to_guest_mode_handle_work(vcpu);
+               /* generic framework doesn't update ppc specific stats*/
+               if (r == -EINTR)
+                       kvmppc_account_exit(vcpu, SIGNAL_EXITS);
                 if (r)
                         return r;

> 
>> -		}
>> -
>>   		vcpu->mode = IN_GUEST_MODE;
>>   
>>   		/*
> 
> Sebastian


