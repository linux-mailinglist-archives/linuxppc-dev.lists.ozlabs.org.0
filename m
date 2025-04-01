Return-Path: <linuxppc-dev+bounces-7408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02BA7740F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 07:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRcPj3k2Nz2yS6;
	Tue,  1 Apr 2025 16:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743486249;
	cv=none; b=FeQVSJcNubg1XbvsmncTLSLSiKhtR3fWbbg74s922zGh2Tk92mbJ9HHvdWMUXnTKcPRDwyOXr6IeTtB11LHcD1Y0xr1UzpQy9oGTk9Fwl1nNuHixtTWdrG9HaQoa7l0KjP2wMDyt9R10skM/SZF4e24DM4ophx7wmXHsMUTRp3GBSvlqWt4sWO+cVvdEZSiCfYhL6dC4ueWf9A5XBKXSMUH86jTv0k23gnKiaQxJuvm0Lqt3C+n8JU9X6sQ1sZhTu5+pZk5j3aAppeT5QCsqhYqTjUOn1HH/ZqQbwOqImHCFV/1utOUoo1LUyVVppVg8rWG26IppbiAs8h1sUSZAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743486249; c=relaxed/relaxed;
	bh=kMZtvZOezud2uqnWwaraGLyq+u+Aw/xGjgsNmPg1nlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/b8T21tkaqVVC4xHGzbpOR3eQ1YJEOvCy9fG2bjOy1CqtPkqfAnvg7m5EX78tNmjMovahIKfA5UWBFSlB/958Ik93BndxIoYf4CZTvd8F3yol7ecazwWYvtZ7m1bFfO7pLAHyDK9TWWHK7swORNDk5jpgbIRVJnymK0s/T28pvc0qLlchxOAiTtHBTHTrZe0RlAgedsyFjRksZ2+Sd1COc7lASDUeyPUVfgZdhhVFDPstUgZQ8SezjWpLBRH+fA9kRhmcG2Lm32H5MhwAl9sAwhtcUmwO4vdAtgF21UfJeM5DIDaUjHH3De9zAAKykYLCoeCY4CXMXheTT1Hn8R1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XCEYPdul; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XCEYPdul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRcPg1cLnz2yRx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 16:44:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5310altf008067;
	Tue, 1 Apr 2025 05:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kMZtvZ
	Oezud2uqnWwaraGLyq+u+Aw/xGjgsNmPg1nlk=; b=XCEYPduly02drjKR5hmUwN
	9ltckMAP2CFuqufbXK9KeP75qgkeaHYDfp2GhUpBtpVLmt3nYomOqBUA5e4XhaMu
	bLsrlVn4EV5NGP0smekKT/mt5e2gxwTqWLwJpJxTT9boUxcVVR1LXK+xXDwbGvf5
	Wr7m7lMoIsnmZwvLZF4URuCTwKssUwN9JeS5400nMPPnbkMJ4YNKpPMDh+NCuxjb
	FWw6QO2hyDETZDV9Aq7PwZpPsuA2cqkX6j6ohQmqs5P5t2iWRmyxuTdUEd8q2/Oo
	dRHpRounnIRJq3rqZIV8yg6sJk4nERRGXDXO8djM2Kbvh1jYMimss57pdO4Jgobw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qvfpuk2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 05:43:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5315hg0d025937;
	Tue, 1 Apr 2025 05:43:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qvfpuk2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 05:43:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5314UI9P014560;
	Tue, 1 Apr 2025 05:43:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pvpm1128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 05:43:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5315hb6f40042914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 05:43:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBF272004B;
	Tue,  1 Apr 2025 05:43:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D2B720040;
	Tue,  1 Apr 2025 05:43:32 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.124.218.219])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Apr 2025 05:43:32 +0000 (GMT)
Date: Tue, 1 Apr 2025 11:13:29 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yosry Ahmed <yosry.ahmed@linux.dev>,
        Tamir Duberstein <tamird@gmail.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/defconfigs: Set HZ=1000 on ppc64 and powernv
 defconfigs
Message-ID: <rnzknkfbylwqhhjrrq7pp4hxxnj3nkdwf4vud5ut6yhjxiqrwr@422rs52bwznx>
References: <20250330074734.16679-1-vineethr@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250330074734.16679-1-vineethr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ictKPanU_LMzj6EEXwuvBjuf0K7HvfS
X-Proofpoint-GUID: nYNCtfC8o7JQ58pd5NuykjnCJQNsHEkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010035
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Mar 30, 2025 at 01:17:34PM +0530, Madadi Vineeth Reddy wrote:
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
NIT: default value on top would be a little less confusing.
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
>  arch/powerpc/configs/powernv_defconfig | 2 +-
>  arch/powerpc/configs/ppc64_defconfig   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> index 6b6d7467fecf..8abf17d26b3a 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -46,7 +46,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>  CONFIG_CPU_FREQ_GOV_USERSPACE=y
>  CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>  CONFIG_CPU_IDLE=y
> -CONFIG_HZ_100=y
> +CONFIG_HZ_1000=y
>  CONFIG_BINFMT_MISC=m
>  CONFIG_PPC_TRANSACTIONAL_MEM=y
>  CONFIG_PPC_UV=y
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> index 5fa154185efa..45d437e4c62e 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -57,7 +57,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>  CONFIG_CPU_FREQ_GOV_USERSPACE=y
>  CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>  CONFIG_CPU_FREQ_PMAC64=y
> -CONFIG_HZ_100=y
> +CONFIG_HZ_1000=y
>  CONFIG_PPC_TRANSACTIONAL_MEM=y
>  CONFIG_KEXEC=y
>  CONFIG_KEXEC_FILE=y
> -- 
> 2.47.0
>
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

