Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC27CF60B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 13:03:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J0q0YPl/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB4bF5JyKz3cDS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 22:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J0q0YPl/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB4ZK0qrNz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 22:03:04 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JAxaWT019521;
	Thu, 19 Oct 2023 11:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pJKMY/8E3mDP8kAbLi7x+Il6uLPnYOVA9qFZRNYZYmM=;
 b=J0q0YPl/XCkUuaZJApc0ZebTfMAcqfdVcxz9UfquECnqyn2NucOcL41hovRITm0GzTaZ
 0HSvKi00qFQ6C+7TGp2g/eZM00J/AeCjdhs7ujfRW7y6PuYft+S+cb4oS1dtcyTU3RJJ
 5lI4MMMZbfQwB1aDYK5LKRv3mp/fe/29z8qqMbKp7KJ0glJ3OKmZcPSJw1FyUW20t+nl
 5sKh4dP0Df1Nl/bzExv6D8MctMiAlJ8H7iR8smtkT1tWEW3MOPSUOXV9qqFNjy1tCX+4
 fMp+B4fhtDBp/C2QK6BpHxiA7h1S8rn5JXZ6ockLWzva9XEsUtQFSW2kqdAxIUxY8bQi iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu36jg592-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 11:02:44 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JB0AUS022046;
	Thu, 19 Oct 2023 11:02:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu36jg579-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 11:02:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39J90BfP031184;
	Thu, 19 Oct 2023 10:30:56 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr7hjysxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 10:30:56 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JAUuNW20251332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 10:30:56 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41CB35805A;
	Thu, 19 Oct 2023 10:30:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01C2558051;
	Thu, 19 Oct 2023 10:30:52 +0000 (GMT)
Received: from [9.109.201.126] (unknown [9.109.201.126])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 10:30:51 +0000 (GMT)
Message-ID: <b57962d9-93dc-4545-8d4f-37f5e071fc0b@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 16:00:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] powerpc/smp: Move shared_processor static key to
 smp.h
Content-Language: en-US
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Peq5v0YHO2hZ6VlO4bnzEHl9ORAffMi1
X-Proofpoint-GUID: jHlzS-sO4vRR1-xrqnUfQ2m-K5sqRohK
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_08,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=797 mlxscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190093
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
Cc: Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Ajay Kaher <akaher@vmware.com>, Rohan McLure <rmclure@linux.ibm.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/18/23 10:07 PM, Srikar Dronamraju wrote:
> The ability to detect if the system is running in a shared processor
> mode is helpful in few more generic cases not just in
> paravirtualization.
> For example: At boot time, different scheduler/ topology flags may be
> set based on the processor mode. Hence move it to a more generic file.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 12 ------------
>  arch/powerpc/include/asm/smp.h      | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index 0372b0093f72..cf83e837a571 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -15,13 +15,6 @@
>  #include <asm/kvm_guest.h>
>  #include <asm/cputhreads.h>
> 
> -DECLARE_STATIC_KEY_FALSE(shared_processor);
> -
> -static inline bool is_shared_processor(void)
> -{
> -	return static_branch_unlikely(&shared_processor);
> -}
> -
>  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
>  extern struct static_key paravirt_steal_enabled;
>  extern struct static_key paravirt_steal_rq_enabled;
> @@ -77,11 +70,6 @@ static inline bool is_vcpu_idle(int vcpu)
>  	return lppaca_of(vcpu).idle;
>  }

Hi Srikar, 

This patch fails to apply on tip/master as it depends on 
https://lore.kernel.org/all/20231019091452.95260-1-srikar@linux.vnet.ibm.com/ to be applied first.

>  #else
> -static inline bool is_shared_processor(void)
> -{
> -	return false;
> -}
> -
>  static inline u32 yield_count_of(int cpu)
>  {
>  	return 0;
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index aaaa576d0e15..08631b2a4528 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -34,6 +34,20 @@ extern bool coregroup_enabled;
>  extern int cpu_to_chip_id(int cpu);
>  extern int *chip_id_lookup_table;
> 
> +#ifdef CONFIG_PPC_SPLPAR
> +DECLARE_STATIC_KEY_FALSE(shared_processor);
> +
> +static inline bool is_shared_processor(void)
> +{
> +	return static_branch_unlikely(&shared_processor);
> +}
> +#else
> +static inline bool is_shared_processor(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
