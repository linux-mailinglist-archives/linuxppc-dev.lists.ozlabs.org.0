Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F834207176
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 12:47:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sKbH5G7fzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 20:47:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sKY42175zDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 20:45:11 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OAXJ1g120124; Wed, 24 Jun 2020 06:45:06 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwyycn1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 06:45:06 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OAZhNP023483;
 Wed, 24 Jun 2020 10:45:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 31uursv21f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 10:45:05 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OAj4LL45875616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 10:45:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE2DBAE063;
 Wed, 24 Jun 2020 10:45:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6360DAE060;
 Wed, 24 Jun 2020 10:45:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.112.18])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 10:44:59 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
To: ego@linux.vnet.ibm.com
References: <20200624101754.169612-1-kjain@linux.ibm.com>
 <20200624101754.169612-2-kjain@linux.ibm.com>
 <20200624103609.GC31972@in.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <e50a8cfb-b105-dd82-20a9-81283f8bfcb5@linux.ibm.com>
Date: Wed, 24 Jun 2020 16:14:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624103609.GC31972@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_05:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 cotscore=-2147483648
 mlxscore=0 lowpriorityscore=0 suspectscore=1 adultscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240077
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



On 6/24/20 4:06 PM, Gautham R Shenoy wrote:
> On Wed, Jun 24, 2020 at 03:47:53PM +0530, Kajol Jain wrote:
>> Patch here adds cpu hotplug functions to hv_24x7 pmu.
>> A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
>> is added.
>>
>> The online function update the cpumask only if its NULL.
>       ^^^^^^^^^^^^^^^^^^^^^^                     ^^^^^^^^^
> 	online callback function updates	 it is empty.
> 						 
> 
>> As the primary intention for adding hotplug support
>> is to desiginate a CPU to make HCALL to collect the
>         ^^^^^^^^^^
> 	designate
> 	
Sorry My bad. Thanks for reviewing the patch. Will correct these
mistakes.

Thanks,
Kajol Jain

>> count data.
>>
>> The offline function test and clear corresponding cpu in a cpumask
>> and update cpumask to any other active cpu.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Otherwise, looks good to me.
> 
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> 
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 45 +++++++++++++++++++++++++++++++++++++
>>  include/linux/cpuhotplug.h  |  1 +
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index db213eb7cb02..ce4739e2b407 100644
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
>> +	target = cpumask_last(cpu_active_mask);
>> +
>> +	if (target < 0 || target >= nr_cpu_ids)
>> +		return -1;
>> +
>> +	/* Migrate 24x7 events to the new target */
>> +	cpumask_set_cpu(target, &hv_24x7_cpumask);
>> +	perf_pmu_migrate_context(&h_24x7_pmu, cpu, target);
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
>> index 191772d4a4d7..a2710e654b64 100644
>> --- a/include/linux/cpuhotplug.h
>> +++ b/include/linux/cpuhotplug.h
>> @@ -181,6 +181,7 @@ enum cpuhp_state {
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
