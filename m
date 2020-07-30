Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F7232B21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:04:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHJHF3zJ6zDqtV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHJ9R5TqrzDqsX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 14:59:23 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U4Vfnr088857; Thu, 30 Jul 2020 00:59:18 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw723ucd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 00:59:18 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U4pH7u008487;
 Thu, 30 Jul 2020 04:59:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4nsws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 04:59:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06U4xB3E31785288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 04:59:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41EA24C050;
 Thu, 30 Jul 2020 04:59:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B317B4C04E;
 Thu, 30 Jul 2020 04:59:09 +0000 (GMT)
Received: from [9.199.42.75] (unknown [9.199.42.75])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 04:59:09 +0000 (GMT)
Subject: Re: [PATCH v2] selftests: powerpc: Fix online CPU selection
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20200609073733.997643-1-sandipan@linux.ibm.com>
 <20200729160344.GB14603@linux.vnet.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <44073a8e-96d9-6fd0-44d5-554526927226@linux.ibm.com>
Date: Thu, 30 Jul 2020 10:29:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729160344.GB14603@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_02:2020-07-29,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300029
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
Cc: shiganta@in.ibm.com, nasastry@in.ibm.com, harish@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kamalesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar, Michael,

On 29/07/20 9:33 pm, Srikar Dronamraju wrote:
> * Sandipan Das <sandipan@linux.ibm.com> [2020-06-09 13:07:33]:
> 
>> The size of the CPU affinity mask must be large enough for
>> systems with a very large number of CPUs. Otherwise, tests
>> which try to determine the first online CPU by calling
>> sched_getaffinity() will fail. This makes sure that the size
>> of the allocated affinity mask is dependent on the number of
>> CPUs as reported by get_nprocs().
>>
>> Fixes: 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs")
>> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
>> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
>> Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
>> ---
>> Previous versions can be found at:
>> v1: https://lore.kernel.org/linuxppc-dev/20200608144212.985144-1-sandipan@linux.ibm.com/
>>
>> @@ -88,28 +89,40 @@ void *get_auxv_entry(int type)
>>
>>  int pick_online_cpu(void)
>>  {
>> -	cpu_set_t mask;
>> -	int cpu;
>> +	int ncpus, cpu = -1;
>> +	cpu_set_t *mask;
>> +	size_t size;
>> +
>> +	ncpus = get_nprocs();
> 
> Please use get_nprocs_conf or sysconf(_SC_NPROCESSORS_CONF). The manpage
> seems to suggest the latter. Not sure how accurate the manpage is.
> 
> get_nprocs is returning online cpus and when smt is off, the cpu numbers
> would be sparse and hence the result from get_nprocs wouldn't be ideal for
> allocating cpumask. However get_nprocs_conf would return the max configured
> cpus and would be able to handle it. 
> 
> I think this was the same situation hit by Michael Ellerman.
> 

Yes, that seems to be the case. Thanks for testing this.
Will fix this in v3.

- Sandipan
