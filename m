Return-Path: <linuxppc-dev+bounces-9815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C9AE9F1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 15:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSftj0vFBz30PF;
	Thu, 26 Jun 2025 23:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750945181;
	cv=none; b=DthwOycx8lFZrVuiq/r8hJb3RipsdbYS6zMMa/jHJ6Qea+YnVCMkeHxYbnexi4LmeAJV7RfyJy75pva7Iwp5ry7LV7/FR8+HD0VedUamFLTTKXmJ9KfjyGjlpMpPL9+vu2/UGm1t30cUJnBT27bJu1pGzDdoUkteY6I1Ux31PPpIUIXVGFZT7v1MrllD2NQh2Ka+ndzY9rjVP/ZQb+Kn/HdTKEhwusUHL9eqzrvITTVgnKArREHsw17kfW257TlyiJfYLMWpDrZgn7u2S5EMU/2K2IMvGpRAr6V+cnIjiPbvSUucV9mgAui4Zy6D2gSSP8HBpOKT3KhtSekLRY1QFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750945181; c=relaxed/relaxed;
	bh=q5jNi/g6640BeMFTzbuVYGtnlBOaFXWhE/mPz6/s6QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6ji+MySZCzWyZ7W14Mp8+vpBokyUOz/J89vby2wV7fYKaKH3XeVIZeQUhzm5siyc9HwVkQ7OqohcynH3eTEwi5ZPIXHbk2va2bACo9Jq5NoL/YzsCDuJKG7SsZbukhGBQKoRNlxQD2cE9EscoCMKcr20HUg/jfRFhn/WdyBMk2MtyTM+VcydhvoByp8bHXuC0oFdhSqTDeaoh3o0d19WXfQMdBHRWDOgkxP96CoeniMjZD6KvVHwsoH1SSwAaJRL5h4nM5FZDYz0+CL3miXyBA3S5F4rSjP3eEQYT5nV2yHI4xmNUVVDdqDg75ROEZAV7PfgOGCWEkbea+vBnnlgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d/mBDFid; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d/mBDFid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSfth09kDz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 23:39:39 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QDVTgT000847;
	Thu, 26 Jun 2025 13:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q5jNi/
	g6640BeMFTzbuVYGtnlBOaFXWhE/mPz6/s6QM=; b=d/mBDFidI/p9Is/ahgBSBS
	HtqTpLusGt9o6+PLVqdZpM/GSAxNk2jPL6V0Cve9/NkRQCfJnl69kysgdnT47qo8
	3MIlxfjdv5d+T3VXT4hncYXKXOYG6jrqvBFAj1eTKY8gdKlA+1mIR0arPV7lDRCq
	wBj5mPMJK0AuRPd0OoT94siUcVBYRddIEkpvGu5TBcGWd2ejraemIXyU8TN2FGgm
	EX5RcIM5gGHphQ11eAkFN3CrwVX4OFB/Qg450BaOa8IhCX3WdmCNgO64WPKRvyGa
	dUFYJgwuzEBpkpHBAOzxz2yoJKkgyAxav5jNXIHjo9nLBoEG7ULsk+USwT+SimNw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5u6sxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:39:23 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55QDbQsk006893;
	Thu, 26 Jun 2025 13:39:22 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5u6sxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:39:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QBTDbS014951;
	Thu, 26 Jun 2025 13:39:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72tyb0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:39:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55QDdHRS39977268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 13:39:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0BBE2004B;
	Thu, 26 Jun 2025 13:39:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A639220040;
	Thu, 26 Jun 2025 13:39:14 +0000 (GMT)
Received: from [9.39.23.153] (unknown [9.39.23.153])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jun 2025 13:39:14 +0000 (GMT)
Message-ID: <760e230c-5699-485c-910b-ebeaa9f9bd09@linux.ibm.com>
Date: Thu, 26 Jun 2025 19:09:13 +0530
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
Subject: Re: [RFC v2 9/9] [DEBUG] powerpc: add debug file for set/unset cpu
 avoid
To: Yury Norov <yury.norov@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-10-sshegde@linux.ibm.com> <aFx94BDKk_WJ48pK@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aFx94BDKk_WJ48pK@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q3Pkjo1OFsX5i0Y-PcFsvXIlG1JylwbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExMiBTYWx0ZWRfX6paYNYC3u8vf afsHzV/XN88ftqchITg6B3cPoaDMvSEU0D5S77UJqTXnZBjTMz3Qpc7KV9vHWsXEywuSpH/vkoR bFOC7Wrsj/6Hf7oUe9Trkx5XKe+GkDGI3WZNRBuH/UAX51GgjXlO4ni8JjZNMmfmosmFYjb+Z/g
 Ir7Gn+OX+VXRX6GRcCOiVoS65ny3XQlsu4S/LHzUs0ITsenFiSGypqX2nDcrXncF/KUFe7xUBJX YiLyjSx3assEmUgQsT2WyG7HgAHMQBx1X55M9YHVXqhRgXXpj72lt9ro6UFbDGjVXWYBfU2VVUZ DcTFVCzIiqu7DwjeF791QXmBE/jU0g6YtZbj/wAs/N71Qmrtwur+bB2wUNDOW9OF5eOJIKAK8ZG
 YGubg8zBPJFUByYBQaGknZATrN6CAoO1z9MuQTHtwvPguwRR/0+ovQosL3oabVsZg7eGCtD8
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685d4d8b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=llwzAoz1qmXTQtL4rQUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3CwLmQllbHFcgz9X1juKvx_G2acL9eam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260112
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Yury, Thanks for taking a look at this.

> On Thu, Jun 26, 2025 at 12:41:08AM +0530, Shrikanth Hegde wrote:
>> Reference patch for how an architecture can make use of this infra.
>>
>> This is not meant to be merged. Instead the vp_manual_hint should either
>> come from hardware or could be derived using steal time.
> 
> If you don't add any code that manages the 'avoid' mask on the host
> side, all this becomes a dead code.

Ok.

Maybe I can keep this debug file, until we get the infra where
the hint derivation would be done by hardware by means of hcall or gets 
calculated based on steal time.

I think i will have polish this a bit and move it to appropriate place 
if this is to be kept.

>   
>> When the provided hint is less than the total CPUs in the system, it
>> will enable the cpu avoid static key and set those CPUs as avoid.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/paravirt.h |  2 ++
>>   arch/powerpc/kernel/smp.c           | 50 +++++++++++++++++++++++++++++
>>   2 files changed, 52 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
>> index b78b82d66057..b6497e0b60d8 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -10,6 +10,8 @@
>>   #include <asm/hvcall.h>
>>   #endif
>>   
>> +DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
>> +
>>   #ifdef CONFIG_PPC_SPLPAR
>>   #include <linux/smp.h>
>>   #include <asm/kvm_guest.h>
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index 5ac7084eebc0..e00cdc4de441 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -64,6 +64,7 @@
>>   #include <asm/systemcfg.h>
>>   
>>   #include <trace/events/ipi.h>
>> +#include <linux/debugfs.h>
>>   
>>   #ifdef DEBUG
>>   #include <asm/udbg.h>
>> @@ -82,6 +83,7 @@ bool has_big_cores __ro_after_init;
>>   bool coregroup_enabled __ro_after_init;
>>   bool thread_group_shares_l2 __ro_after_init;
>>   bool thread_group_shares_l3 __ro_after_init;
>> +static int vp_manual_hint = NR_CPUS;
>>   
>>   DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>>   DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
>> @@ -1727,6 +1729,7 @@ static void __init build_sched_topology(void)
>>   	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
>>   
>>   	set_sched_topology(powerpc_topology);
>> +	vp_manual_hint = num_present_cpus();
>>   }
>>   
>>   void __init smp_cpus_done(unsigned int max_cpus)
>> @@ -1807,4 +1810,51 @@ void __noreturn arch_cpu_idle_dead(void)
>>   	start_secondary_resume();
>>   }
>>   
>> +/*
>> + * sysfs hint to mark CPUs as Avoid. This will help in restricting
>> + * the workload to specified number of CPUs.
>> + * For example 40 > vp_manual_hint means, workload will run on
>> + * 0-39 CPUs.
>> + */
>> +
>> +static int pv_vp_manual_hint_set(void *data, u64 val)
>> +{
>> +	int cpu;
>> +
>> +	if (val == 0 || vp_manual_hint > num_present_cpus())

This should be
	if (val == 0 || val > num_present_cpus())

>> +		vp_manual_hint = num_present_cpus();
>> +
>> +	if (val != vp_manual_hint)
>> +		vp_manual_hint = val;
> 
> This all is effectively just:
> 
> 	vp_manual_hint = val;
> 
> Isn't?

Yes, With some checks for sane values.

> 
>> +	if (vp_manual_hint < num_present_cpus())
>> +		static_branch_enable(&paravirt_cpu_avoid_enabled);
>> +	else
>> +		static_branch_disable(&paravirt_cpu_avoid_enabled);
>> +
>> +	for_each_present_cpu(cpu) {
>> +		if (cpu >= vp_manual_hint)
>> +			set_cpu_avoid(cpu, true);
>> +		else
>> +			set_cpu_avoid(cpu, false);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int pv_vp_manual_hint_get(void *data, u64 *val)
>> +{
>> +	*val = vp_manual_hint;
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
>> +
>> +static __init int paravirt_debugfs_init(void)
>> +{
>> +	if (is_shared_processor())
>> +		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
>> +	return 0;
>> +}
>> +
>> +device_initcall(paravirt_debugfs_init)
>>   #endif
>> -- 
>> 2.43.0


