Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BA186F1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:50:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h13T446mzDqDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gyVK5WngzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 00:55:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02GDpUoj104201
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 09:55:01 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrtk6mwmp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 09:55:01 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <psampat@linux.ibm.com>;
 Mon, 16 Mar 2020 13:54:59 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Mar 2020 13:54:57 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02GDsvs036896812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 13:54:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02E54AE053;
 Mon, 16 Mar 2020 13:54:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5DC2AE051;
 Mon, 16 Mar 2020 13:54:55 +0000 (GMT)
Received: from [9.85.92.169] (unknown [9.85.92.169])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Mar 2020 13:54:55 +0000 (GMT)
Subject: Re: [PATCH] Fixes: 227942809b52 ("cpufreq: powernv: Restore cpu
 frequency to policy->cur on unthrottling")
To: Daniel Axtens <dja@axtens.net>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 pratik.r.sampat@gmail.com, ego@linux.vnet.ibm.com
References: <20200306110549.25517-1-psampat@linux.ibm.com>
 <87v9n4o3fk.fsf@dja-thinkpad.axtens.net>
From: Pratik Sampat <psampat@linux.ibm.com>
Date: Mon, 16 Mar 2020 19:24:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87v9n4o3fk.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20031613-0016-0000-0000-000002F200DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031613-0017-0000-0000-000033557CD8
Message-Id: <30ee9ce2-b27b-785d-21bf-890047b4b64d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-16_03:2020-03-12,
 2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003160067
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Sure thing I'll re-send them. Rookie mistake, my bad.
Thanks for pointing it out!

Regards,
Pratik

On 16/03/20 6:35 pm, Daniel Axtens wrote:
> Hi Pratik,
>
> Please could you resend this with a more meaningful subject line and
> move the Fixes: line to immediately above your signed-off-by?
>
> Thanks!
>
> Regards,
> Daniel
>
>> The patch avoids allocating cpufreq_policy on stack hence fixing frame
>> size overflow in 'powernv_cpufreq_work_fn'
>>
>> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
>> ---
>>   drivers/cpufreq/powernv-cpufreq.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
>> index 56f4bc0d209e..20ee0661555a 100644
>> --- a/drivers/cpufreq/powernv-cpufreq.c
>> +++ b/drivers/cpufreq/powernv-cpufreq.c
>> @@ -902,6 +902,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
>>   void powernv_cpufreq_work_fn(struct work_struct *work)
>>   {
>>   	struct chip *chip = container_of(work, struct chip, throttle);
>> +	struct cpufreq_policy *policy;
>>   	unsigned int cpu;
>>   	cpumask_t mask;
>>   
>> @@ -916,12 +917,14 @@ void powernv_cpufreq_work_fn(struct work_struct *work)
>>   	chip->restore = false;
>>   	for_each_cpu(cpu, &mask) {
>>   		int index;
>> -		struct cpufreq_policy policy;
>>   
>> -		cpufreq_get_policy(&policy, cpu);
>> -		index = cpufreq_table_find_index_c(&policy, policy.cur);
>> -		powernv_cpufreq_target_index(&policy, index);
>> -		cpumask_andnot(&mask, &mask, policy.cpus);
>> +		policy = cpufreq_cpu_get(cpu);
>> +		if (!policy)
>> +			continue;
>> +		index = cpufreq_table_find_index_c(policy, policy->cur);
>> +		powernv_cpufreq_target_index(policy, index);
>> +		cpumask_andnot(&mask, &mask, policy->cpus);
>> +		cpufreq_cpu_put(policy);
>>   	}
>>   out:
>>   	put_online_cpus();
>> -- 
>> 2.17.1

