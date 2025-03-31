Return-Path: <linuxppc-dev+bounces-7393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B488EA75F40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 09:09:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZR2L15skJz2yZS;
	Mon, 31 Mar 2025 18:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743404937;
	cv=none; b=Rwz73IQQdZDAMwPYgqrGj+Cr6NhsJJwyMAQomLEffA4ie3Ut4QStUEeeLovMCXrF6foWHFrlpt0gm3MfVlZJYlkKinufe1bAtAu544Lke9/TnV8UykCSdAtN55YPyrFnlChBDe2hcOoDqm0ZjaxVApKUOAfBQsVm6ONGu01WkNPseCGuyDDz4Y5hZJlOMnekNH3CbELfQQi1KAn+qM3BY09R7lNjJxMdjmhD2sRRb8O4Vx8lQMYUGvj6z8DwpQqSmi51U5MozpqAHGcA0kgXWiXsYlNWIxEx+NZdxENyO4LWlMiXYKtknoDzWc3hqLqxduOwXhHL8PjAGD+nLWTiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743404937; c=relaxed/relaxed;
	bh=2ptddE/+SBlIy+ghCLNcJdMAeZZM2QTbagP73i9CGN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGlXr0I9exlyRuEzB8AtzPiKV4nljjlWdOUcAw40CbqVwUGqJHXMMGpMJjlX/x/ptfqKKFN6KiMLL/z0jn8VxNrHp8H0zOS2m8154TThIFlLz68YpAaUKxHqtmB/VWoUHCap/aEZw6KbQKrTtoC71fSsy7R6QFQwNxyCSkkbsGcTs5ChMoXhm6R1gVt5OkgVTOSKz+m4A33qXjqaWL+sr9JcR5ixmAmQSif8Y9oVfFo2Z9ZtmaGyjmeBVLySj/w0ehfrsix45p8JTOYaAo7h4npdyE2UXcgEPOQo0LOohMlnGvg04SC4MnsVxyPcVvhbdcuY7AHlopsWaRN6GJJrrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qdwbg5CK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qdwbg5CK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZR2L02pmzz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 18:08:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKZtvw019563;
	Mon, 31 Mar 2025 07:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2ptddE
	/+SBlIy+ghCLNcJdMAeZZM2QTbagP73i9CGN0=; b=qdwbg5CKcUiP/7/oFPU6pT
	ZNq7nJ0K1ac7dBENYv9pnvM0NTvQt/eRKCg6Q6y2erOsPOaPYPviPOUrxy559eGT
	EtmpGFXohABwlwado4pdpaofktoa+miupnjmAJeTkjI6/3K+lKxwaO0NqvttmSc6
	yDdUBSM/Mr/7KUbVetxluKHG921Vhnan+ACs0VuCAO1jtbg3yaIAiBaRi64np4mN
	/XWe/VmmJxNgB9h40MrhSDuYop+ayH6u4E3m1MH8SghdxOALRCdmAI5TyXW7j9pW
	rNW2nzY0zqIlRLFCW96qsTDpoMB8ETOdc/gF8WNXw8WEbmTLgFTVojs6/WmHv1Qw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qd4q1sx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:08:32 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V71Pbt004271;
	Mon, 31 Mar 2025 07:08:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qd4q1sx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:08:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5CVCq014576;
	Mon, 31 Mar 2025 07:08:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pvpkvptb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:08:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52V78RFr52560254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 07:08:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1094820043;
	Mon, 31 Mar 2025 07:08:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F29E920040;
	Mon, 31 Mar 2025 07:08:23 +0000 (GMT)
Received: from [9.39.16.8] (unknown [9.39.16.8])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Mar 2025 07:08:23 +0000 (GMT)
Message-ID: <698a3509-8bcd-4b80-870b-0473fc53f59b@linux.ibm.com>
Date: Mon, 31 Mar 2025 12:38:23 +0530
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
Subject: Re: [PATCH] powerpc/defconfigs: Set HZ=1000 on ppc64 and powernv
 defconfigs
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yosry Ahmed <yosry.ahmed@linux.dev>,
        Tamir Duberstein <tamird@gmail.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250330074734.16679-1-vineethr@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250330074734.16679-1-vineethr@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H0py6wwJnWAg03kr2fyHbe3XpE0Iw7tt
X-Proofpoint-ORIG-GUID: Wiy3Rk-KKOoT0ENuYlCSkBIf3xmUGRw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310048
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/30/25 13:17, Madadi Vineeth Reddy wrote:
> Commit 030bdc3fd080 ("powerpc/defconfigs: Set HZ=100 on pseries and ppc64
> defconfigs") lowered CONFIG_HZ from 250 to 100, citing reduced need for a
> higher tick rate due to high-resolution timers and concerns about timer
> interrupt overhead and cascading effects in the timer wheel.
> 
> However, improvements have been made to the timer wheel algorithm since
> then, particularly in eliminating cascading effects at the cost of minor
> timekeeping inaccuracies. More details are available here
> https://lwn.net/Articles/646950/. This removes the original concern about
> cascading, and the reliance on high-resolution timers is not applicable
> to the scheduler, which still depends on periodic ticks set by CONFIG_HZ.
> 
> With the introduction of the EEVDF scheduler, users can specify custom
> slices for workloads. The default base_slice is 3ms, but with CONFIG_HZ=100
> (10ms tick interval), base_slice is ineffective. Workloads like stress-ng
> that do not voluntarily yield the CPU run for ~10ms before switching out.
> Additionally, setting a custom slice below 3ms (e.g., 2ms) should lower
> task latency, but this effect is lost due to the coarse 10ms tick.
> 

It makes sense since base_slice is the only tunable available under EEVDF.
This would allow the users to make use of it.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> By increasing CONFIG_HZ to 1000 (1ms tick), base_slice is properly honored,
> and user-defined slices work as expected. Benchmark results support this
> change:
> 
> Latency improvements in schbench with EEVDF under stress-ng-induced noise:
> 
> Scheduler       CONFIG_HZ  Custom Slice  99th Percentile Latency (µs)
> --------------------------------------------------------------------
> EEVDF           1000       No            0.30x
> EEVDF           1000       2 ms          0.29x
> EEVDF (default) 100        No            1.00x
> 
> Switching to HZ=1000 reduces the 99th percentile latency in schbench by
> ~70%. This improvement occurs because, with HZ=1000, stress-ng tasks run
> for ~3ms before yielding, compared to ~10ms with HZ=100. As a result,
> schbench gets CPU time sooner, reducing its latency.
> 
> Daytrader Performance:
> 
> Daytrader results show minor variation within standard deviation,
> indicating no significant regression.
> 
> Workload (Users/Instances)  Throughput 1000HZ vs 100HZ (Std Dev%)
> --------------------------------------------------------------------------
> 30 u, 1 i                   +3.01% (1.62%)
> 60 u, 1 i                   +1.46% (2.69%)
> 90 u, 1 i                   –1.33% (3.09%)
> 30 u, 2 i                   -1.20% (1.71%)
> 30 u, 3 i                   –0.07% (1.33%)
> 
> Avg. Response Time: No Change (=)
> 
> pgbench select queries:
> 
> Metric                         1000HZ vs 100HZ (Std Dev%)
> ------------------------------------------------------------------
> Average TPS Change             +2.16% (1.27%)
> Average Latency Change         –2.21% (1.21%)
> 
> Average TPS: Higher the better
> Average Latency: Lower the better
> 
> pgbench shows both throughput and latency improvements beyond standard
> deviation.
> 
> Given these results and the improvements in timer wheel implementation,
> increasing CONFIG_HZ to 1000 ensures that powerpc benefits from EEVDF’s
> base_slice and allows fine-tuned scheduling for latency-sensitive
> workloads.
> 
> Signed-off-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
> ---
>   arch/powerpc/configs/powernv_defconfig | 2 +-
>   arch/powerpc/configs/ppc64_defconfig   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> index 6b6d7467fecf..8abf17d26b3a 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -46,7 +46,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>   CONFIG_CPU_FREQ_GOV_USERSPACE=y
>   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>   CONFIG_CPU_IDLE=y
> -CONFIG_HZ_100=y
> +CONFIG_HZ_1000=y
>   CONFIG_BINFMT_MISC=m
>   CONFIG_PPC_TRANSACTIONAL_MEM=y
>   CONFIG_PPC_UV=y
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> index 5fa154185efa..45d437e4c62e 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -57,7 +57,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>   CONFIG_CPU_FREQ_GOV_USERSPACE=y
>   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>   CONFIG_CPU_FREQ_PMAC64=y
> -CONFIG_HZ_100=y
> +CONFIG_HZ_1000=y
>   CONFIG_PPC_TRANSACTIONAL_MEM=y
>   CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y


