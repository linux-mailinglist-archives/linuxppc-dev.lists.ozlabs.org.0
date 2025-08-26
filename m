Return-Path: <linuxppc-dev+bounces-11309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE002B358E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 11:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB2Qy2JvSz3dLd;
	Tue, 26 Aug 2025 19:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756200522;
	cv=none; b=MSpvU/+gvWZ27abuTYOsrjTcDyUcROSaYIr8608OF1J2qry5mx/kAX+u/fOTBLDax8RUI24kbIx7IdS/OYcyefx6ALuL8zZNnFQaHGlfbyWa6T0464Vzyt/3KvFirEXh/1A6HmB5gge4ZyaIs57QCionTZQxDerv4DhkPLfqQ8OMhhj8B7HOYecBIlJ9B3t/dZ/UNx4J3iSdTjSDCyA/LAY7J1COIy1b3g7KcT7lskm1z3meyK1qcpfr89aHXZkuN//+8bobwkJspy65H9keJawA8Exdh/7BC82r9sfsLN4E1IfJYXu50IMsOOejnZWCRJOdDnWG116Zo5wrIm2T/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756200522; c=relaxed/relaxed;
	bh=/li5voBFOk8y8WhPScKDKHem83+F9vyXBJjMmaZ041o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXHXbQe0fWuBkLk6OFzF1HlU2jmQRoYh4HBt0tqcfHkSFu297Tltho9Dr/Pctkejf3u7Cs+RJEO0NDAld5mlwvQxNAQiseQfL1V3OSpoAb2RnZMhZuqROQfu+2iJzTrrB4/OBQMq7E+mPda7mijkX8N9R09LxG6xRTcTpr54Dlv8Xbkb8iuSEMxnPm5FGeSYvcAe7GlC+qzxFMx+rbB8AnEkIS+9cr6dTp1lPEtRWKEB7xkpnglOyzj3F31Gkf4FGKqQ7Gd91DtNxDhdNLOgfPJ6CYeTIrxF43iNwewvjvwUVapEtDTOa3uUu8qrIOdPAUXpg4wzddft8l9k+AfjHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYsajpfn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYsajpfn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB2Qw6xrZz3dLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 19:28:40 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q6Dcbh031678;
	Tue, 26 Aug 2025 09:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/li5vo
	BFOk8y8WhPScKDKHem83+F9vyXBJjMmaZ041o=; b=SYsajpfn1k2gmbDI6+49Al
	221fkrxda43lSYG5dpv2737JhyXDPCjLCuwCxyQSJ63ONvEZZi/Q3nGSbYZ7rqir
	0sQewioGXSvtvFgbbywpr4yv0schQe8enHiaaKAoN98D6W+sOAPR/fxQcPPm18vd
	c2h4WZ84ixTPDP8QLh/mdqUYWSq6H56yR0YtdgpfUVvXK6oLrNFsj5yFjGbhpVvC
	jizyKM5aq1W7AoDxu6KH5gXdGS2ShgdNnBGXHVGUV+jqgQgqwxiD1uPq77vPABJl
	axwDdu0mSLnJXcZvNwoIHfvfcVxP62STi07172Nqi3oEvMVsgpiKSz6m6v8UbYFQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avdn20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 09:27:49 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57Q90rKS023609;
	Tue, 26 Aug 2025 09:27:48 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avdn1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 09:27:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8ZanK017989;
	Tue, 26 Aug 2025 09:27:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp39rpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 09:27:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57Q9RhGG35259098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 09:27:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6690920040;
	Tue, 26 Aug 2025 09:27:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F2CD20043;
	Tue, 26 Aug 2025 09:27:34 +0000 (GMT)
Received: from [9.39.23.183] (unknown [9.39.23.183])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Aug 2025 09:27:33 +0000 (GMT)
Message-ID: <5f1a9ed6-b551-48b9-8c62-8ef0f2bd2fca@linux.ibm.com>
Date: Tue, 26 Aug 2025 14:57:33 +0530
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
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC
 scheduling bits
To: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi <arighi@nvidia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
        Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
        Guo Weikang <guoweikang.kernel@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Brian Gerst <brgerst@gmail.com>,
        Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Vinicius Costa Gomes <vinicius.gomes@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20250826041319.1284-5-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -2--Cp9qI1VVivKGyFqxE41rZ7zdojJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXxjL/DSgAnx2D
 zxziEiBmpLPb7T373sPDIP5FphKINAVdX6nVXXoRC7zeod0LNE53DAQ+yyL0I+8WLvU7kd3n6rp
 C18zs+ZnzyV/v6/bNOEY2yd6mWPvEys6pfNGeOAgqXNmtqAcZFSuSjFKyTvmxtEhWvwVPtlnKx7
 dPw+P2/4fZTaD0VKlQqGfhdFHWt2sIOMPbR3RPae+IyEUtF57BoBo11fl6ezMIOmniti8Bo0wFa
 VmfngxIWnk5NbiO45DBbAXujxvjC3Nkd+/RzFiqOs3aAIuXbw7Mf2Ddp+DONQ9ux+9ycLNDbtRN
 EkmOw7cjGB2kCMSsPLD/5rYyQiMstj2vRxjjhNz3+v7R5zgT8Np6BXAmpn+lv+3zPzDTfmGdXhh
 IY3l+zSe
X-Proofpoint-ORIG-GUID: lHjetDSyZoG3vF1_c2MO9HTQV_cMoToA
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68ad7e15 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zd2uoN0lAAAA:8 a=v6YubWqPPbTyhgY4940A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/26/25 9:43 AM, K Prateek Nayak wrote:
> PowerPC enables the MC scheduling domain by default on systems with
> coregroup support without having a SCHED_MC config in Kconfig.
> 
> The scheduler uses CONFIG_SCHED_MC to introduce the MC domain in the
> default topology (core) and to optimize the default CPU selection
> routine (sched-ext).

Curious to know if sched_ext usage. i see below code.

if (static_branch_maybe(CONFIG_SCHED_MC, &scx_selcpu_topo_llc))

scx_selcpu_topo_llc = true if there is sd_llc. One can have llc domain without MC domain.
I am wondering whats the reason behind the clubbing.

> 
> Introduce CONFIG_SCHED_MC for powerpc and note that it should be
> preferably enabled given the current default behavior. This also ensures
> PowerPC is tested during future developments that come to depend on
> CONFIG_SCHED_MC.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   arch/powerpc/Kconfig           | 9 +++++++++
>   arch/powerpc/include/asm/smp.h | 2 ++
>   arch/powerpc/kernel/smp.c      | 4 ++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 93402a1d9c9f..e954ab3f635f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -971,6 +971,15 @@ config SCHED_SMT
>   	  when dealing with POWER5 cpus at a cost of slightly increased
>   	  overhead in some places. If unsure say N here.
>   
> +config SCHED_MC
> +	bool "Multi-Core Cache (MC) scheduler support"
> +	depends on PPC64 && SMP
> +	default y
> +	help
> +	  MC scheduler support improves the CPU scheduler's decision making
> +	  when dealing with POWER systems that contain multiple Last Level
> +	  Cache instances on the same socket. If unsure say Y here.
> +
>   config PPC_DENORMALISATION
>   	bool "PowerPC denormalisation exception handling"
>   	depends on PPC_BOOK3S_64
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 86de4d0dd0aa..9a320d96e891 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -148,7 +148,9 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif /* CONFIG_SCHED_SMT */
>   
> +#ifdef CONFIG_SCHED_MC
>   extern const struct cpumask *cpu_coregroup_mask(int cpu);
> +#endif
>   

Is ifdef necessary here?

>   /* Since OpenPIC has only 4 IPIs, we use slightly different message numbers.
>    *
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index e623f2864dc4..7f79b853b221 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1059,6 +1059,7 @@ static bool has_coregroup_support(void)
>   	return coregroup_enabled;
>   }
>   
> +#ifdef CONFIG_SCHED_MC
>   const struct cpumask *cpu_coregroup_mask(int cpu)
>   {
>   	if (has_coregroup_support())
> @@ -1071,6 +1072,7 @@ static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl,
>   {
>   	return cpu_corgrp_mask(cpu);
>   }
> +#endif
>   

Previous patch says cpu_coregroup_mask is exported. Is it exported in any way to user or modules?

Also i don't see similar gating in other archs. It maybe unnecessary.

>   static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
>   {
> @@ -1729,10 +1731,12 @@ static void __init build_sched_topology(void)
>   			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
>   	}
>   
> +#ifdef CONFIG_SCHED_MC
>   	if (has_coregroup_support()) {
>   		powerpc_topology[i++] =
>   			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
>   	}
> +#endif

Just this gating should suffice IMO.>   
>   	powerpc_topology[i++] = SDTL_INIT(cpu_pkg_mask, powerpc_shared_proc_flags, PKG);
>   


