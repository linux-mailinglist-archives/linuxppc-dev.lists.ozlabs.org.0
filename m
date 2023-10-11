Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F407C4E12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 11:04:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgZqsZCw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S56KT0bkLz3cg1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 20:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgZqsZCw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S56JW05CCz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 20:03:54 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B92PN8022956;
	Wed, 11 Oct 2023 09:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BTIoFOk/xLtJ0TdjDNsWNE6i8V3JRVQTvCgEvw0zIUE=;
 b=UgZqsZCwd62OHPCjzkWTMkGgSFSfOghxliH5w9jQIWl9LhErxTgJ9cq4QFgdQc1X5aU3
 kHSji3Ltw6kbXppekEBlo3JX1QpjrfA9047X2iHwQgwEy26tU2UHvdpuUzOydHt+WxDk
 z5F8IZ7taLQneBfIACxlYkT2XpfV8C0GVLhe4lcTrsenDuRxT3Lh6bXJr1Z/5ASoViXp
 dBBU3tdJktEMX+r5Kz4CJRD332w8LhGYu2IzrXVWSq7DqJtHqfB9962bBalF3EwjSBjy
 sTuzHNxmLGI0seuLN5hZ//hkfDie5SsWjCw4CDYE2XEHLj3UtOCsnuZiq36idtwFujul sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnrqj823x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 09:03:42 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39B92Qo4022996;
	Wed, 11 Oct 2023 09:03:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnrqj823g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 09:03:42 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B6q60x001150;
	Wed, 11 Oct 2023 09:03:41 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjxgj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 09:03:41 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B93e2s27066976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 09:03:40 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFEE558043;
	Wed, 11 Oct 2023 09:03:40 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9259658053;
	Wed, 11 Oct 2023 09:03:36 +0000 (GMT)
Received: from [9.171.24.239] (unknown [9.171.24.239])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Oct 2023 09:03:36 +0000 (GMT)
Message-ID: <1ebf2b9d-f496-565c-bc00-4fee9cb11b0b@linux.vnet.ibm.com>
Date: Wed, 11 Oct 2023 14:33:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
Content-Language: en-US
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: insH9JdICxpNfmkhspqAPkbhAKXc9VMg
X-Proofpoint-ORIG-GUID: ZTA4UbXx1i1nfm6JfGqxCVfDQ9Ux-uVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_06,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110079
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
Cc: Juergen Gross <jgross@suse.com>, shrikanth hegde <sshegde@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/9/23 10:47 AM, Srikar Dronamraju wrote:

Hi Srikar. This is an interesting patch. 

> PowerVM Hypervisor dispatches on a whole core basis. In a shared LPAR, a
s/whole/big 

Can we mention that a big core consist of two small cores. and w.r.t
linux a core is at small core. Hence there is mismatch. 
> CPU from a core that is preempted may have a larger latency. In
> such a scenario, its preferable to choose a different CPU to run.
> 
> If one of the CPUs in the core is active, i.e neither CEDED nor
> preempted, then consider this CPU as not preempted
> 
> Also if any of the CPUs in the core has yielded but OS has not requested
> CEDE or CONFER, then consider this CPU to be preempted.
> 

This is because an idle CPU cannot be preempted. Right?

This patch should help address the has_idle_core functionality and ttwu path 
in powerpc SPLPAR based on powerVM. Currently they are not correct.  

when the all the CPU's are idle, __update_idle_core will not set has_idle_core
 which is functionally not right. That is one example, there are other places where correct 
functionality of vcpu_is_preempted is crucial as well. 


> Cc: Ajay Kaher <akaher@vmware.com>
> Cc: Alexey Makhalov <amakhalov@vmware.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index e08513d73119..a980756f58df 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -121,9 +121,19 @@ static inline bool vcpu_is_preempted(int cpu)
>  	if (!is_shared_processor())
>  		return false;
> 
> +	if (!(yield_count_of(cpu) & 1))
> +		return false;
> +
> +	/*
> +	 * If CPU has yielded but OS has not requested idle then this CPU is

nit: can it be "if CPU is in hypervisor but OS has not requested ..." ?

> +	 * definitely preempted.
> +	 */
> +	if (!lppaca_of(cpu).idle)
> +		return true;
> +
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (!is_kvm_guest()) {
> -		int first_cpu;
> +		int first_cpu, i;
> 
>  		/*
>  		 * The result of vcpu_is_preempted() is used in a
> @@ -149,11 +159,28 @@ static inline bool vcpu_is_preempted(int cpu)
>  		 */
>  		if (cpu_first_thread_sibling(cpu) == first_cpu)
>  			return false;
> +
> +		/*
> +		 * If any of the threads of this core is not preempted or
> +		 * ceded, then consider this CPU to be non-preempted
> +		 */
> +		first_cpu = cpu_first_thread_sibling(cpu);
> +		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
> +			if (i == cpu)
> +				continue;
> +			if (!(yield_count_of(i) & 1))
> +				return false;
> +			if (!lppaca_of(i).idle)
> +				return true;
> +		}
>  	}
>  #endif
> 
> -	if (yield_count_of(cpu) & 1)
> -		return true;
> +	/*
> +	 * None of the threads in this thread group are running but none of
> +	 * them were preempted too. Hence assume the thread to be
> +	 * non-preempted.
> +	 */

That comment is bit confusing. instead of threads it would be better say CPUs

"None of the CPUs in this Big Core are running but none of them were preempted too. Hence assume the 
the CPU to be non-preempted."


>  	return false;
>  }
> 

Otherwise LGTM
Reviewed-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
