Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E727EACF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 10:24:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=chldLj7S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV18L5Lkfz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 20:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=chldLj7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV17T6KM5z2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 20:23:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE9M9NM013417;
	Tue, 14 Nov 2023 09:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CmFEJUMOahEPvRwa1JEvWcRKixAIxWh++DkUEOv6Ei8=;
 b=chldLj7SRSs3YrjxS/A7V7CagsK12R67aPugXgHvILx8WpWWczljIOVerykHbvTiH5k8
 N+5XRVY3QUe9kHc7psx3uYzAzeeSZ6GNDJAT5ntL0lYFWQwE275+JA0naXJJjqO+xAtQ
 6wf1K4NBNId57eDB06Mnxyo6gUqtUtKxNcHwp7Jcyv0VevUzi4/Pcd0X6vJwfxdoJ+3S
 btuqBnX6x45u5TbW6johMjBLORV5xIm+9KU/9qwSifz1O0W86spF023TP1WawNngVZ/v
 CxsG7NP/VOjuodctDltteiDuR0yWrMoL86zcnXYebvx6Kanu2xErFKSAe7lpxcyHeWko ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc66ng0hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:23:21 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE9NLZd016757;
	Tue, 14 Nov 2023 09:23:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc66ng0hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:23:21 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8SlGU011087;
	Tue, 14 Nov 2023 09:23:20 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1e92p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:23:20 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE9NKq242074564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 09:23:20 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF43358063;
	Tue, 14 Nov 2023 09:23:19 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 854F658056;
	Tue, 14 Nov 2023 09:23:17 +0000 (GMT)
Received: from [9.109.201.126] (unknown [9.109.201.126])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 09:23:17 +0000 (GMT)
Message-ID: <a326ce8a-431f-45dd-a225-691f6f965b6f@linux.vnet.ibm.com>
Date: Tue, 14 Nov 2023 14:53:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bt6pefcCdBXV1m4f6jPktljU8Q2Ca7Bn
X-Proofpoint-GUID: XrdEx7PEciLXRM80gWtwX4Xax962tOI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140072
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
Cc: linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/14/23 12:42 PM, Aneesh Kumar K.V wrote:
> No functional change in this patch. A helper is added to find if
> vcpu is dispatched by hypervisor. Use that instead of opencoding.
> Also clarify some of the comments.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index ac4279208d63..b78b82d66057 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -76,6 +76,17 @@ static inline bool is_vcpu_idle(int vcpu)
>  {
>  	return lppaca_of(vcpu).idle;
>  }
> +
> +static inline bool vcpu_is_dispatched(int vcpu)
> +{
> +	/*
> +	 * This is the yield_count.  An "odd" value (low bit on) means that
> +	 * the processor is yielded (either because of an OS yield or a
> +	 * hypervisor preempt).  An even value implies that the processor is
> +	 * currently executing.
> +	 */
> +	return (!(yield_count_of(vcpu) & 1));
> +}
>  #else
>  static inline bool is_shared_processor(void)
>  {
> @@ -109,6 +120,10 @@ static inline bool is_vcpu_idle(int vcpu)
>  {
>  	return false;
>  }
> +static inline bool vcpu_is_dispatched(int vcpu)
> +{
> +	return true;
> +}
>  #endif
> 

Similar code can be changed in lib/qspinlock.c and lib/locks.c as well. 


>  #define vcpu_is_preempted vcpu_is_preempted
> @@ -134,12 +149,12 @@ static inline bool vcpu_is_preempted(int cpu)
>  	 * If the hypervisor has dispatched the target CPU on a physical
>  	 * processor, then the target CPU is definitely not preempted.
>  	 */
> -	if (!(yield_count_of(cpu) & 1))
> +	if (vcpu_is_dispatched(cpu))
>  		return false;
> 
>  	/*
> -	 * If the target CPU has yielded to Hypervisor but OS has not
> -	 * requested idle then the target CPU is definitely preempted.
> +	 * if the target CPU is not dispatched and the guest OS
> +	 * has not marked the CPU idle, then it is hypervisor preempted.
>  	 */
>  	if (!is_vcpu_idle(cpu))
>  		return true;
> @@ -166,7 +181,7 @@ static inline bool vcpu_is_preempted(int cpu)
> 
>  		/*
>  		 * The PowerVM hypervisor dispatches VMs on a whole core
> -		 * basis. So we know that a thread sibling of the local CPU
> +		 * basis. So we know that a thread sibling of the executing CPU
>  		 * cannot have been preempted by the hypervisor, even if it
>  		 * has called H_CONFER, which will set the yield bit.
>  		 */
> @@ -174,15 +189,17 @@ static inline bool vcpu_is_preempted(int cpu)
>  			return false;
> 
>  		/*
> -		 * If any of the threads of the target CPU's core are not
> -		 * preempted or ceded, then consider target CPU to be
> -		 * non-preempted.
> +		 * The specific target CPU was marked by guest OS as idle, but
> +		 * then also check all other cpus in the core for PowerVM
> +		 * because it does core scheduling and one of the vcpu
> +		 * of the core getting preempted by hypervisor implies
> +		 * other vcpus can also be considered preempted.
>  		 */
>  		first_cpu = cpu_first_thread_sibling(cpu);
>  		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
>  			if (i == cpu)
>  				continue;
> -			if (!(yield_count_of(i) & 1))
> +			if (vcpu_is_dispatched(i))
>  				return false;
>  			if (!is_vcpu_idle(i))
>  				return true;
