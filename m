Return-Path: <linuxppc-dev+bounces-11482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2C0B3B677
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCsWm6Hh3z2yqW;
	Fri, 29 Aug 2025 18:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756457652;
	cv=none; b=m9mgnmbnc17f1gWYSrBLO2WlNDuYCm4WKzYNZdPqSQ/rWhRVJLNjTRRe/P9ZvVdiz8Asnev4qiNjBiX7aRUqSb8FG+IrhA+/tf/MoUz6PxmA6SvdTc7FJc1AfGQ4V3aLWviRwwUJ5li2brXxXIe9i0HTexZgx4x05QvovSNmdfvb6jrdMUp1c0+0k7vbwqhIG2FzWMlM+uxSthp+n2tT0ouredRVsSxa3ACZqaRjMbYDruqN2+nkJfZ3EIH8jaUPBfNmrtLFnywjEpqoVeuYyHTLS3QgNzEaq8Xr85guULecIHPQY3QnBF+N18/it9s+GvIECBTgjrDkHoFOfIjOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756457652; c=relaxed/relaxed;
	bh=sPQBY5yNOohOJ6m5DBtfCburmYLLfk3XwogGCr/a+ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH90j3SpiYYihrZZZdKcb/XjQWunIRIOeG6DtBvxMGu2D1v5A09Q8Gs3bdG3qbA8m019R6yOu6b37Eb1rps0iDivndV+ABvYeS8s4iXufTpI/EJ4NxP8O/dmERgY5TTN4srv/ULJ3wj/eN9jRUy354F0aMuc+1cjzKKj58HPFA5H2iV+41qQ2yodWfp4dKwOXEm1qaeFBxEUOhsXMlW4Jjy9DpQ6gAjsPUk7WF2t1m3zSrsTtQ8aiH2ufn5AFkDTeKO8jNZd0cj5jCRA6IhMYMWGvwUh4tpTZMeuufDxfKAGw6aWzS4spFg27MbNnp26oU4txycz4j6Bj8GW5dlKug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCglAOtK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCglAOtK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCsWm0T1Vz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:54:11 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMS08Z012568;
	Fri, 29 Aug 2025 08:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sPQBY5
	yNOohOJ6m5DBtfCburmYLLfk3XwogGCr/a+ks=; b=qCglAOtKrrxH2rCkI3URXx
	y/ZVIaiawQq+pqLKCUauEExGEZwz/Id+InjRjo3V0Qwf5RmpZ7XV+UAuNvazCDlQ
	qGmU3FVSdmLoU2R/CA9EKELC2qHfNuLg7AXWYMaKlflo4MMSZkt4ZQkOQztwgQW7
	vP2RWY4fgQpXLILaqXG2vxJQnt2pvoQ4xdr0OabSHSy/WefAHJab12tbbCvC7W9X
	kfQ3/wU0iYmyeyDnJoYwLLCM9vf9gVrK6+LGYKh095sPCaMqAk+a9FHp+jxg9HOB
	2h7m8JoA0CDLNwOsaUHDwQbKhtHNST94U7wJqBM6GtD+YzHKJsFhDoIii5ZEWfaw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqeby5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:53:22 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8mjW6024091;
	Fri, 29 Aug 2025 08:53:21 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqeby3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:53:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5hRIu020874;
	Fri, 29 Aug 2025 08:53:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrc113ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:53:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8rGMY32702992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:53:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 630D320043;
	Fri, 29 Aug 2025 08:53:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EB1120040;
	Fri, 29 Aug 2025 08:53:07 +0000 (GMT)
Received: from [9.124.216.217] (unknown [9.124.216.217])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 08:53:07 +0000 (GMT)
Message-ID: <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
Date: Fri, 29 Aug 2025 14:23:06 +0530
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
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
To: Valentin Schneider <vschneid@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, thomas.weissschuh@linutronix.de,
        Li Chen <chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>,
        Mete Durlu <meted@linux.ibm.com>,
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
        Andrea Righi <arighi@nvidia.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Vinicius Costa Gomes <vinicius.gomes@intel.com>,
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
        linux-s390@vger.kernel.org
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
 <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
 <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX4XFJU1iP5NE9
 /rHRt7UYUsEwF53m13pGclMJdE/1hNda+PR2zeJpAEsrM4rvvTbkkFZQuc8pqAkVS2IzC2PwUdm
 DveE11TF2k4ulExUJWDjML1teUaVQ/93rdq3ncChc+uoeGAnW3OqPWwkZ4STnYhUdlRmUcKxB8I
 qkr13I8T3zwx/tmMelC/48lQGoT8aJ0mYjfVOs4TtsiDu11afWZ9lLhYBolu/B1dK47QjpkPSIB
 A1aTi3s8duQLT+QMXBswuVOw6hyS7r0oB5LUhXkzQJG24hxQE49Q42RR4r8+ykKkB57sTOIBWAH
 EKdqRbtQY5AoVertvRXQRN/N/Su+csIG7xEcxMPOioJdfRJHTJ4Y/WPO3olLpJPbwXH5VK/Xdqj
 wA+R82gl
X-Proofpoint-ORIG-GUID: bMTrm6esSNj7OsbWk_XDneHXs6q24Z22
X-Proofpoint-GUID: TC8LCyPfvAZUgqE8OjDu9bhFAKHRoQFx
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b16a82 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=20KFwNOVAAAA:8 a=14KqwYnPXR21iNsEu3oA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/29/25 1:23 PM, Valentin Schneider wrote:
> On 26/08/25 12:13, Peter Zijlstra wrote:
>> Subject: sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
>> From: Peter Zijlstra <peterz@infradead.org>
>> Date: Mon, 25 Aug 2025 12:02:44 +0000
>>
>> Leon [1] and Vinicius [2] noted a topology_span_sane() warning during
>> their testing starting from v6.16-rc1. Debug that followed pointed to
>> the tl->mask() for the NODE domain being incorrectly resolved to that of
>> the highest NUMA domain.
>>
>> tl->mask() for NODE is set to the sd_numa_mask() which depends on the
>> global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
>> set to the "tl->numa_level" during tl traversal in build_sched_domains()
>> calling sd_init() but was not reset before topology_span_sane().
>>
>> Since "tl->numa_level" still reflected the old value from
>> build_sched_domains(), topology_span_sane() for the NODE domain trips
>> when the span of the last NUMA domain overlaps.
>>
>> Instead of replicating the "sched_domains_curr_level" hack, get rid of
>> it entirely and instead, pass the entire "sched_domain_topology_level"
>> object to tl->cpumask() function to prevent such mishap in the future.
>>
>> sd_numa_mask() now directly references "tl->numa_level" instead of
>> relying on the global "sched_domains_curr_level" hack to index into
>> sched_domains_numa_masks[].
>>
> 
> Eh, of course I see this *after* looking at the v6 patch.
> 
> I tested this again for good measure, but given I only test this under
> x86 and the changes with v6 are in s390/ppc, I didn't expect to see much
> change :-)
> 
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> Tested-by: Valentin Schneider <vschneid@redhat.com>
> 

I was looking at: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core

Current code doesn't allow one to enable/disable SCHED_MC on ppc since it is set always in kconfig.
Used the below patch:

I think since the config is there, it would be good to provide a option to disable. no?

---

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index fc0d1c19f5a1..da5b2f8d3686 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -170,9 +170,8 @@ config PPC
  	select ARCH_STACKWALK
  	select ARCH_SUPPORTS_ATOMIC_RMW
  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
-	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
  	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
-	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
  	select ARCH_USE_BUILTIN_BSWAP
  	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
  	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 68edb66c2964..458ec5bd859e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1706,10 +1706,12 @@ static void __init build_sched_topology(void)
  			SDTL_INIT(tl_cache_mask, powerpc_shared_cache_flags, CACHE);
  	}
  
+#ifdef CONFIG_SCHED_MC
  	if (has_coregroup_support()) {
  		powerpc_topology[i++] =
  			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
  	}
+#endif
  
  	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
  


