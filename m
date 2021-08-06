Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE83E242E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 09:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggxzr371Lz3dL1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 17:33:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nmAN6QK6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nmAN6QK6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgxzL0qxlz3dCZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 17:33:17 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1767ObsM054933; Fri, 6 Aug 2021 03:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gp2q4WHoNMzOUwiwaKLPIij34wEo3uVZvMp56XdSJdM=;
 b=nmAN6QK6eIimJ774dKvmmPc0+j8dz9BHhScPLzop37w7CTSqJZF2CUCrZQ+XadB7kYw+
 XNQUb/XPxRisAZIn0j2ImXyIc68qB/EPm6ex/Hdq+Mev0IEfp8HzU8DqPPbOmyAt8qce
 WetV2WSfzbDCJovc8WyISHhhuzfobxWCybjLfRWIAdMGMxVCGwFT7Xj5OZwpMleYj4p4
 E71O60eHpKvU7UkyN5ZLv6uWVZzGByR5P5kjy1EnVPldOPQA6dmo9H4HFRilw4+sZ/N2
 PYuj22AhFEcdaXI2hxI82k5NJfO/nGMQo/KvQGpDChqk65Z9ijHNOjob9TkmmmAxn+rR uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89prj4g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 03:33:14 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1767UHNP069460;
 Fri, 6 Aug 2021 03:33:13 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89prj4fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 03:33:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1767ViHT032008;
 Fri, 6 Aug 2021 07:33:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x594ry2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 07:33:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1767UApl56623582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 07:30:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95DABA4065;
 Fri,  6 Aug 2021 07:33:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DE43A4059;
 Fri,  6 Aug 2021 07:33:08 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.73.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Aug 2021 07:33:08 +0000 (GMT)
Subject: Re: [PATCH v1 16/55] powerpc/64s: Implement PMU override command line
 option
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-17-npiggin@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <e7bb1311-3b50-dcc2-7fb0-1773558e9abc@linux.ibm.com>
Date: Fri, 6 Aug 2021 13:03:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726035036.739609-17-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _ri4bES6uZ-tSNt0mJkOyA4N1b72bMrw
X-Proofpoint-ORIG-GUID: mXlU7quKVHSUp6ADn5cYniSzEiFX0gp5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_02:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060048
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/26/21 9:19 AM, Nicholas Piggin wrote:
> It can be useful in simulators (with very constrained environments)
> to allow some PMCs to run from boot so they can be sampled directly
> by a test harness, rather than having to run perf.
>
> A previous change freezes counters at boot by default, so provide
> a boot time option to un-freeze (plus a bit more flexibility).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  7 ++++
>   arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index bdb22006f713..96b7d0ebaa40 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4089,6 +4089,13 @@
>   			Override pmtimer IOPort with a hex value.
>   			e.g. pmtmr=0x508
>
> +	pmu=		[PPC] Manually enable the PMU.


This is bit confusing, IIUC, we are manually disabling the perf 
registration
with this option and not pmu. If this option is used, we will unfreeze the
MMCR0_FC (only in the HV_mode) and not register perf subsystem.
Since this option is valid only for HV_mode, canwe call it
kvm_disable_perf or kvm_dis_perf.


> +			Enable the PMU by setting MMCR0 to 0 (clear FC bit).
> +			This option is implemented for Book3S processors.
> +			If a number is given, then MMCR1 is set to that number,
> +			otherwise (e.g., 'pmu=on'), it is left 0. The perf
> +			subsystem is disabled if this option is used.
> +
>   	pm_debug_messages	[SUSPEND,KNL]
>   			Enable suspend/resume debug messages during boot up.
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 65795cadb475..e7cef4fe17d7 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
>   }
>
>   #ifdef CONFIG_PPC64
> +static bool pmu_override = false;
> +static unsigned long pmu_override_val;
> +static void do_pmu_override(void *data)
> +{
> +	ppc_set_pmu_inuse(1);
> +	if (pmu_override_val)
> +		mtspr(SPRN_MMCR1, pmu_override_val);
> +	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
> +}
> +
>   static int __init init_ppc64_pmu(void)
>   {
> +	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
> +		printk(KERN_WARNING "perf: disabling perf due to pmu= command line option.\n");
> +		on_each_cpu(do_pmu_override, NULL, 1);
> +		return 0;
> +	}
> +
>   	/* run through all the pmu drivers one at a time */
>   	if (!init_power5_pmu())
>   		return 0;
> @@ -2451,4 +2467,23 @@ static int __init init_ppc64_pmu(void)
>   		return init_generic_compat_pmu();
>   }
>   early_initcall(init_ppc64_pmu);
> +
> +static int __init pmu_setup(char *str)
> +{
> +	unsigned long val;
> +
> +	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
> +		return 0;
> +
> +	pmu_override = true;
> +
> +	if (kstrtoul(str, 0, &val))
> +		val = 0;
> +
> +	pmu_override_val = val;
> +
> +	return 1;
> +}
> +__setup("pmu=", pmu_setup);
> +
>   #endif
