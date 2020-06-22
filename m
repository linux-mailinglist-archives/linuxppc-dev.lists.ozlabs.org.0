Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB74202F94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 07:49:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qz583RNBzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 15:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qz3K4v3FzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 15:48:13 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M5Xm74152919; Mon, 22 Jun 2020 01:48:07 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31submdq1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 01:48:07 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M5jb9n022118;
 Mon, 22 Jun 2020 05:48:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 31t35bf8wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 05:48:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05M5m5ES16318926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 05:48:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A582BAC060;
 Mon, 22 Jun 2020 05:48:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E6EEAC05F;
 Mon, 22 Jun 2020 05:48:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.77.205.185])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 05:48:03 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
To: ego@linux.vnet.ibm.com
References: <20200618122713.9030-1-kjain@linux.ibm.com>
 <20200618122713.9030-2-kjain@linux.ibm.com>
 <20200619045801.GA13981@in.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <16fe1d85-6e9b-809d-0f90-e2018f8ea88e@linux.ibm.com>
Date: Mon, 22 Jun 2020 11:18:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619045801.GA13981@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_01:2020-06-19,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=1 mlxlogscore=999 cotscore=-2147483648 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220041
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
Cc: nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com, suka@us.ibm.com,
 anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/19/20 10:28 AM, Gautham R Shenoy wrote:
> Hello Kajol,
> 
> On Thu, Jun 18, 2020 at 05:57:12PM +0530, Kajol Jain wrote:
>> Patch here adds cpu hotplug functions to hv_24x7 pmu.
>> A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
>> is added.
>>
>> The online function update the cpumask only if its NULL.
>> As the primary intention for adding hotplug support
>> is to desiginate a CPU to make HCALL to collect the
>> count data.
>>
>> The offline function test and clear corresponding cpu in a cpumask
>> and update cpumask to any other active cpu.
>>
>> With this patchset, perf tool side does not need "-C <cpu>"
>> to be added.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 45 +++++++++++++++++++++++++++++++++++++
>>  include/linux/cpuhotplug.h  |  1 +
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index db213eb7cb02..fdc4ae155d60 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -31,6 +31,8 @@ static int interface_version;
>>  /* Whether we have to aggregate result data for some domains. */
>>  static bool aggregate_result_elements;
>>
>> +static cpumask_t hv_24x7_cpumask;
>> +
>>  static bool domain_is_valid(unsigned domain)
>>  {
>>  	switch (domain) {
>> @@ -1641,6 +1643,44 @@ static struct pmu h_24x7_pmu = {
>>  	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
>>  };
>>
>> +static int ppc_hv_24x7_cpu_online(unsigned int cpu)
>> +{
>> +	/* Make this CPU the designated target for counter collection */
>> +	if (cpumask_empty(&hv_24x7_cpumask))
>> +		cpumask_set_cpu(cpu, &hv_24x7_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ppc_hv_24x7_cpu_offline(unsigned int cpu)
>> +{
>> +	int target = -1;
>> +
>> +	/* Check if exiting cpu is used for collecting 24x7 events */
>> +	if (!cpumask_test_and_clear_cpu(cpu, &hv_24x7_cpumask))
>> +		return 0;
>> +
>> +	/* Find a new cpu to collect 24x7 events */
>> +	target = cpumask_any_but(cpu_active_mask, cpu);
> 
> cpumask_any_but() typically picks the first CPU in cpu_active_mask
> that is not @cpu.
> 
> 
>> +
>> +	if (target < 0 || target >= nr_cpu_ids)
>> +		return -1;
>> +
>> +	/* Migrate 24x7 events to the new target */
>> +	cpumask_set_cpu(target, &hv_24x7_cpumask);
>> +	perf_pmu_migrate_context(&h_24x7_pmu, cpu, target);
> 
> 
> On a system with N CPUs numbered [O..N-1], can you please verify if
> the time required to sequentially offline CPUs [0..N-2] ,in that
> order, increase with this patch ?
> 
> I am asking this because we have encountered this problem once before
> at a customer site and the commit 9c9f8fb71fee ("powerpc/perf: Use
> cpumask_last() to determine the designated cpu for nest/core units.")
> was introduced to fix that problem.
> 

Hi Gautham,
     Thanks for reviewing the patch. So, cpu_active_mask has bit 'cpu' set
only if that cpu is available. Even if we offline cpu non-sequentially
it will update "cpu_acive_mask" accordingly.

This is some of test I tried:

command:# cat /sys/devices/hv_24x7/cpumask
0
command:# echo 0 > /sys/devices/system/cpu/cpu0/online
command:# echo 0 > /sys/devices/system/cpu/cpu2/online
command:# cat /sys/devices/hv_24x7/cpumask
1
command:# echo 0 > /sys/devices/system/cpu/cpu1/online
command:# cat /sys/devices/hv_24x7/cpumask
3

Please let me know if my understanding is fine.

Thanks,
Kajol Jain

>> +
>> +	return 0;
>> +}
>> +
>> +static int hv_24x7_cpu_hotplug_init(void)
>> +{
>> +	return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
>> +			  "perf/powerpc/hv_24x7:online",
>> +			  ppc_hv_24x7_cpu_online,
>> +			  ppc_hv_24x7_cpu_offline);
>> +}
>> +
>>  static int hv_24x7_init(void)
>>  {
>>  	int r;
>> @@ -1685,6 +1725,11 @@ static int hv_24x7_init(void)
>>  	if (r)
>>  		return r;
>>
>> +	/* init cpuhotplug */
>> +	r = hv_24x7_cpu_hotplug_init();
>> +	if (r)
>> +		pr_err("hv_24x7: CPU hotplug init failed\n");
>> +
>>  	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>>  	if (r)
>>  		return r;
>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
>> index 8377afef8806..16ed8f6f8774 100644
>> --- a/include/linux/cpuhotplug.h
>> +++ b/include/linux/cpuhotplug.h
>> @@ -180,6 +180,7 @@ enum cpuhp_state {
>>  	CPUHP_AP_PERF_POWERPC_CORE_IMC_ONLINE,
>>  	CPUHP_AP_PERF_POWERPC_THREAD_IMC_ONLINE,
>>  	CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
>> +	CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
>>  	CPUHP_AP_WATCHDOG_ONLINE,
>>  	CPUHP_AP_WORKQUEUE_ONLINE,
>>  	CPUHP_AP_RCUTREE_ONLINE,
>> -- 
>> 2.18.2
>>
