Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E62165ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 07:38:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1B724yfczDqbC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:38:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1B5R4Cg9zDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 15:36:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0675WJ6b145359; Tue, 7 Jul 2020 01:36:53 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324bfgj46d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 01:36:53 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0675C4Ql016961;
 Tue, 7 Jul 2020 05:36:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 322h1g9g9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 05:36:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0675amfr459082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 05:36:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27CBCAE051;
 Tue,  7 Jul 2020 05:36:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C3AAE045;
 Tue,  7 Jul 2020 05:36:46 +0000 (GMT)
Received: from [9.199.49.227] (unknown [9.199.49.227])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 05:36:46 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
To: Michael Ellerman <mpe@ellerman.id.au>, Kajol Jain <kjain@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200626102824.270923-1-kjain@linux.ibm.com>
 <20200626102824.270923-2-kjain@linux.ibm.com>
 <87zh8d5oab.fsf@mpe.ellerman.id.au>
 <3b45d050-c27a-e5e7-8649-924910f5b01b@linux.ibm.com>
 <87o8or53fh.fsf@mpe.ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <2fdf823e-a13e-d9b2-ad03-38bd9917c644@linux.ibm.com>
Date: Tue, 7 Jul 2020 11:06:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87o8or53fh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_02:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 cotscore=-2147483648 suspectscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070038
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, suka@us.ibm.com,
 maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/7/20 10:26 AM, Michael Ellerman wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>> On 7/6/20 8:43 AM, Michael Ellerman wrote:
>>> Kajol Jain <kjain@linux.ibm.com> writes:
>>>> Patch here adds cpu hotplug functions to hv_24x7 pmu.
>>>> A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
>>>> is added.
>>>>
>>>> The online callback function updates the cpumask only if its
>>>> empty. As the primary intention of adding hotplug support
>>>> is to designate a CPU to make HCALL to collect the
>>>> counter data.
>>>>
>>>> The offline function test and clear corresponding cpu in a cpumask
>>>> and update cpumask to any other active cpu.
>>>>
>>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>>> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>>>> ---
>>>>    arch/powerpc/perf/hv-24x7.c | 45 +++++++++++++++++++++++++++++++++++++
>>>>    include/linux/cpuhotplug.h  |  1 +
>>>>    2 files changed, 46 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>>>> index db213eb7cb02..ce4739e2b407 100644
>>>> --- a/arch/powerpc/perf/hv-24x7.c
>>>> +++ b/arch/powerpc/perf/hv-24x7.c
>>>> @@ -31,6 +31,8 @@ static int interface_version;
>>>>    /* Whether we have to aggregate result data for some domains. */
>>>>    static bool aggregate_result_elements;
>>>>    
>>>> +static cpumask_t hv_24x7_cpumask;
>>>> +
>>>>    static bool domain_is_valid(unsigned domain)
>>>>    {
>>>>    	switch (domain) {
>>>> @@ -1641,6 +1643,44 @@ static struct pmu h_24x7_pmu = {
>>>>    	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
>>>>    };
>>>>    
>>>> +static int ppc_hv_24x7_cpu_online(unsigned int cpu)
>>>> +{
>>>> +	/* Make this CPU the designated target for counter collection */
>>> The comment implies every newly onlined CPU will become the target, but
>>> actually it's only the first onlined CPU.
>>>
>>> So I think the comment needs updating, or you could just drop the
>>> comment, I think the code is fairly clear by itself.
>>>
>>>> +	if (cpumask_empty(&hv_24x7_cpumask))
>>>> +		cpumask_set_cpu(cpu, &hv_24x7_cpumask);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int ppc_hv_24x7_cpu_offline(unsigned int cpu)
>>>> +{
>>>> +	int target = -1;
>>> No need to initialise target, you assign to it unconditionally below.
>>>
>>>> +	/* Check if exiting cpu is used for collecting 24x7 events */
>>>> +	if (!cpumask_test_and_clear_cpu(cpu, &hv_24x7_cpumask))
>>>> +		return 0;
>>>> +
>>>> +	/* Find a new cpu to collect 24x7 events */
>>>> +	target = cpumask_last(cpu_active_mask);
>>> Any reason to use cpumask_last() vs cpumask_first(), or a randomly
>>> chosen CPU?
>>>
>>>> +	if (target < 0 || target >= nr_cpu_ids)
>>>> +		return -1;
>>>> +
>>>> +	/* Migrate 24x7 events to the new target */
>>>> +	cpumask_set_cpu(target, &hv_24x7_cpumask);
>>>> +	perf_pmu_migrate_context(&h_24x7_pmu, cpu, target);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int hv_24x7_cpu_hotplug_init(void)
>>>> +{
>>>> +	return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
>>>> +			  "perf/powerpc/hv_24x7:online",
>>>> +			  ppc_hv_24x7_cpu_online,
>>>> +			  ppc_hv_24x7_cpu_offline);
>>>> +}
>>>> +
>>>>    static int hv_24x7_init(void)
>>>>    {
>>>>    	int r;
>>>> @@ -1685,6 +1725,11 @@ static int hv_24x7_init(void)
>>>>    	if (r)
>>>>    		return r;
>>>>    
>>>> +	/* init cpuhotplug */
>>>> +	r = hv_24x7_cpu_hotplug_init();
>>>> +	if (r)
>>>> +		pr_err("hv_24x7: CPU hotplug init failed\n");
>>>> +
>>> The hotplug initialisation shouldn't fail unless something is badly
>>> wrong. I think you should just fail initialisation of the entire PMU if
>>> that happens, which will make the error handling in the next patch much
>>> simpler.
>> We  did fail the PMU registration on failure of the hotplug
>> code (and yes error handling is much simpler), but on internal
>> review/discussion,
>> what came up was that, hv_24x7 PMU will still be usable without
>> the hotplug code (with "-C" option to perf tool command line).
> In theory yes.
>
> But in reality no one will ever test that case, so the code will easily
> bit rot.
>
> Even if it doesn't bit rot, you've now created another state the system
> can legally be in (hotplug init failed but PMU still probed), which you
> have to test, document & support.
>
> If the hotplug init fails then something is badly wrong, the best thing
> we can do is bail on the PMU initialisation and hope the rest of the
> system boots OK.

Yep agreed. Thanks for the comments mpe

Maddy

>
> cheers

