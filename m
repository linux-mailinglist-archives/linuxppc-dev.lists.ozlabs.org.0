Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED343E91D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 14:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl8jd4Lf3z3blF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 22:47:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pv79AOHO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pv79AOHO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl8hp4nndz302W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 22:46:50 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BCXveI020593; Wed, 11 Aug 2021 08:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y4hZ51Uv+Q9tIIeG033/i31F6ICBSLny+IRgHDDF4Ik=;
 b=pv79AOHOJTEDbhf58haV2G7BZi0/zQMMDB+f4BZxtIb68H1KKqKhYUrkNiYHn8wisfl7
 +ER44jBQCPEZE6g84e1NFiWBomrexDV0dQLlv1yodLljxrYNARyPK5EMzrYs3w0i1fCF
 uEMIBHo+Ns0Shjk80NPwwpNX1IMvdbLlvTWWTGQw9roDiDDXjb8XHwn+jVF3nMSxL/sH
 C199U1iZ16E8xg/qbcnjC0l0BTkZI1eyOm15TK6Vqgl+zowJwTmlH4SFDwoAhZjt7+wj
 TikWbtglEPnhAFiw+6WGt1K9wDvB6uIBfguSry357zXXAovwzb2yaoLgsKPseWEtYdpq hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abt14f94n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 08:46:47 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BCXw2l020720;
 Wed, 11 Aug 2021 08:46:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abt14f940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 08:46:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BChR9C005980;
 Wed, 11 Aug 2021 12:46:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht9020v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 12:46:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BCkgD243974992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 12:46:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A61594C06E;
 Wed, 11 Aug 2021 12:46:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 871254C066;
 Wed, 11 Aug 2021 12:46:41 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.71.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 12:46:41 +0000 (GMT)
Subject: Re: [PATCH v1 16/55] powerpc/64s: Implement PMU override command line
 option
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-17-npiggin@gmail.com>
 <e7bb1311-3b50-dcc2-7fb0-1773558e9abc@linux.ibm.com>
 <1628245966.h9u2e2m21l.astroid@bobo.none>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <c38c0802-1e59-f5bf-6d24-169db49f4427@linux.ibm.com>
Date: Wed, 11 Aug 2021 18:16:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1628245966.h9u2e2m21l.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 17IApHHt5G8d-4OWExycSnxWezf1NBgC
X-Proofpoint-GUID: N2t1KoQBOenPW2JtSo2g0cCf4ptimMH3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_04:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110085
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


On 8/6/21 4:08 PM, Nicholas Piggin wrote:
> Excerpts from Madhavan Srinivasan's message of August 6, 2021 5:33 pm:
>> On 7/26/21 9:19 AM, Nicholas Piggin wrote:
>>> It can be useful in simulators (with very constrained environments)
>>> to allow some PMCs to run from boot so they can be sampled directly
>>> by a test harness, rather than having to run perf.
>>>
>>> A previous change freezes counters at boot by default, so provide
>>> a boot time option to un-freeze (plus a bit more flexibility).
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    .../admin-guide/kernel-parameters.txt         |  7 ++++
>>>    arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
>>>    2 files changed, 42 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index bdb22006f713..96b7d0ebaa40 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -4089,6 +4089,13 @@
>>>    			Override pmtimer IOPort with a hex value.
>>>    			e.g. pmtmr=0x508
>>>
>>> +	pmu=		[PPC] Manually enable the PMU.
>>
>> This is bit confusing, IIUC, we are manually disabling the perf
>> registration
>> with this option and not pmu.
>> If this option is used, we will unfreeze the
>> MMCR0_FC (only in the HV_mode) and not register perf subsystem.
> With the previous patch, this option un-freezes the PMU
> (and disables perf).
>
>> Since this option is valid only for HV_mode, canwe call it
>> kvm_disable_perf or kvm_dis_perf.
> It's only disabled for guests because it would require a bit
> of logic to set pmcregs_in_use when we register our lppaca. We could
> add that if needed, but the intention is for use on BML, not exactly
> KVM specific.
>
> I can add HV restriction to the help text. And we could rename the
> option. free_run_pmu= or something?


yeah having it a different name will be better. I am not sure
whether we should say "[PPC] Manually enable the PMU",
because IIUC, if we dont provide this option PMU and perf is
anyway enabled, but rest looks good to me.

Maddy


>
> Thanks,
> Nick
>
>>
>>> +			Enable the PMU by setting MMCR0 to 0 (clear FC bit).
>>> +			This option is implemented for Book3S processors.
>>> +			If a number is given, then MMCR1 is set to that number,
>>> +			otherwise (e.g., 'pmu=on'), it is left 0. The perf
>>> +			subsystem is disabled if this option is used.
>>> +
>>>    	pm_debug_messages	[SUSPEND,KNL]
>>>    			Enable suspend/resume debug messages during boot up.
>>>
>>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>>> index 65795cadb475..e7cef4fe17d7 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
>>>    }
>>>
>>>    #ifdef CONFIG_PPC64
>>> +static bool pmu_override = false;
>>> +static unsigned long pmu_override_val;
>>> +static void do_pmu_override(void *data)
>>> +{
>>> +	ppc_set_pmu_inuse(1);
>>> +	if (pmu_override_val)
>>> +		mtspr(SPRN_MMCR1, pmu_override_val);
>>> +	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
>>> +}
>>> +
>>>    static int __init init_ppc64_pmu(void)
>>>    {
>>> +	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
>>> +		printk(KERN_WARNING "perf: disabling perf due to pmu= command line option.\n");
>>> +		on_each_cpu(do_pmu_override, NULL, 1);
>>> +		return 0;
>>> +	}
>>> +
>>>    	/* run through all the pmu drivers one at a time */
>>>    	if (!init_power5_pmu())
>>>    		return 0;
>>> @@ -2451,4 +2467,23 @@ static int __init init_ppc64_pmu(void)
>>>    		return init_generic_compat_pmu();
>>>    }
>>>    early_initcall(init_ppc64_pmu);
>>> +
>>> +static int __init pmu_setup(char *str)
>>> +{
>>> +	unsigned long val;
>>> +
>>> +	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
>>> +		return 0;
>>> +
>>> +	pmu_override = true;
>>> +
>>> +	if (kstrtoul(str, 0, &val))
>>> +		val = 0;
>>> +
>>> +	pmu_override_val = val;
>>> +
>>> +	return 1;
>>> +}
>>> +__setup("pmu=", pmu_setup);
>>> +
>>>    #endif
