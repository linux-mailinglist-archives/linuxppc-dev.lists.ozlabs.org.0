Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124386E1150
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 17:39:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py3fy68bqz3fSn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 01:39:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ay5h63PM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ay5h63PM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py3f35yKgz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 01:39:07 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DEieek027490;
	Thu, 13 Apr 2023 15:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PPWYk+uucwev98t+P0id/pYxU8rwnYMvsZud5Tu5b8A=;
 b=Ay5h63PMJK0YyB5OWKjr44UmAnHmF4vJtSI8nAOlZvu6Q1iT2neSvKY5OQ4Q/dlKdPP9
 4VnGrG267a78GavuN/NsJQstgK+hHe9Z7edYhAsZn3cDuY3V9aZ44R1ZfmiuuXZNkgHl
 2Mm/IC8FPLX7X65UMw33ADSP19uw9oEvb9qorxa4iBLqAdQMfZRABFD5aYE3jcABxinR
 YQ4KaOHUEHNJgeyAgSnUXgLq15OaEfYsf/vBwp2Izhryp8tsaEc6zsLyh3/ejlrgwm1z
 FRLRLl3wp3sRedacREPrlDjNvvVMqGDSHNYNiMATOJIcjTAqn9KwUgPIwsYInIVW9Z1m Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxjn0efxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 15:38:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DFTvbh015603;
	Thu, 13 Apr 2023 15:38:58 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxjn0efu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 15:38:58 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D30tMM022915;
	Thu, 13 Apr 2023 15:38:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3pu0jk2kwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 15:38:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33DFcq3V19399240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Apr 2023 15:38:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A34F62004B;
	Thu, 13 Apr 2023 15:38:52 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0862420040;
	Thu, 13 Apr 2023 15:38:52 +0000 (GMT)
Received: from [9.171.52.192] (unknown [9.171.52.192])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Apr 2023 15:38:51 +0000 (GMT)
Message-ID: <0e668a82-3a3e-798a-8707-1a9b622b23b6@linux.ibm.com>
Date: Thu, 13 Apr 2023 17:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] pseries/smp: export the smt level in the SYS FS.
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230331153905.31698-1-ldufour@linux.ibm.com>
 <20230331153905.31698-2-ldufour@linux.ibm.com>
 <87ttxjaonc.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87ttxjaonc.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NuW4PTWJqgwELGpjrkxMY0oELzbUkR6m
X-Proofpoint-GUID: BQKAgfVHcZqqSq2VvbVhyO8X6QnuuuyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_10,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130139
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
Cc: nathanl@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/04/2023 15:37:59, Michael Ellerman wrote:
> Hi Laurent,
> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> There is no SMT level recorded in the kernel neither in user space.
>> Indeed there is no real constraint about that and mixed SMT levels are
>> allowed and system is working fine this way.
>>
>> However when new CPU are added, the kernel is onlining all the threads
>> which is leading to mixed SMT levels and confuse end user a bit.
>>
>> To prevent this exports a SMT level from the kernel so user space
>> application like the energy daemon, could read it to adjust their settings.
>> There is no action unless recording the value when a SMT value is written
>> into the new sysfs entry. User space applications like ppc64_cpu should
>> update the sysfs when changing the SMT level to keep the system consistent.
>>
>> Suggested-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/pseries.h |  3 ++
>>  arch/powerpc/platforms/pseries/smp.c     | 39 ++++++++++++++++++++++++
>>  2 files changed, 42 insertions(+)
> 
> There is a generic sysfs interface for smt in /sys/devices/system/cpu/smt
> 
> I think we should be enabling that on powerpc and then adapting it to
> our needs, rather than adding a pseries specific file.

Thanks Michael, I was not aware of this sysfs interface.

> Currently the generic code is only aware of SMT on/off, so it would need
> to be taught about SMT4 and 8 at least.

Do you think we should limit our support to SMT4 and SMT8 only?

> There are already hooks in the generic code to check the SMT level when
> bringing CPUs up, see cpu_smt_allowed(), they may work for the pseries
> hotplug case too, though maybe we need some additional logic.
> 
> Wiring up the basic support is pretty straight forward, something like
> the diff below.

I'll look into how to wire this up.
Thanks a lot!

> cheers
> 
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 0f123f1f62a1..a48576f1c579 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -260,6 +260,7 @@ config PPC
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_VIRT_CPU_ACCOUNTING
>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN
> +	select HOTPLUG_SMT			if HOTPLUG_CPU
>  	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>  	select IOMMU_HELPER			if PPC64
>  	select IRQ_DOMAIN
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 8a4d4f4d9749..bd23ba716d23 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -143,5 +143,8 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #endif
>  #endif
> 
> +bool topology_is_primary_thread(unsigned int cpu);
> +bool topology_smt_supported(void);
> +
>  #endif /* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_TOPOLOGY_H */
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 265801a3e94c..8619609809d5 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1769,4 +1769,20 @@ void __noreturn arch_cpu_idle_dead(void)
>  	start_secondary_resume();
>  }
> 
> +/**
> + * topology_is_primary_thread - Check whether CPU is the primary SMT thread
> + * @cpu:	CPU to check
> + */
> +bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	return cpu == cpu_first_thread_sibling(cpu);
> +}
> +
> +/**
> + * topology_smt_supported - Check whether SMT is supported by the CPUs
> + */
> +bool topology_smt_supported(void)
> +{
> +	return threads_per_core > 1;
> +}
>  #endif

