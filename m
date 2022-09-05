Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AB5AD0EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 13:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlyY65G4z3c6k
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 21:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qz7YOdoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qz7YOdoR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlxV6M41z3bc3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 21:03:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285AgjQf000480;
	Mon, 5 Sep 2022 11:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=jPUTA1sjFk5Qua0mKUp7vBqpeV9RlgMsBbWUAkEGzjA=;
 b=qz7YOdoRoZFytApz8EMZFLbV6UszrgTfeXz0MUNv+ZOpWuSKbuw20OSsUzLF/wwHHpGI
 KreE1D+oMqxEtLPKHESM0b+LfEGMSQe0aoeL2+j2NVQTbMTLeqSA5VU3fG0/xIp0sTnt
 srFiSO5IMdXSlOse5NJCN2p42BJqR4Mtdi5L6kG7jUtyAk5vDaUA2SnjD9Yb7W6q1VmY
 FAvx1qeaHap9py+qooD6C/6kJWSPj6tYdBvdqsDhdLQwTC5ZxGp/sNPDPVii0SUyJDRO
 PIFANK0We2sCdcxKM2tEvBOgYHLHRStSBhgbdXOKeZ/8BZCaPzpre5aDpoeUUtTHKuhA oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdfkerg80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 11:03:19 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285AjaU0011652;
	Mon, 5 Sep 2022 11:03:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdfkerf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 11:03:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285Aq00F014234;
	Mon, 5 Sep 2022 11:01:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hjbkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 11:01:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 285B1aHj39387556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 11:01:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91FF24205F;
	Mon,  5 Sep 2022 11:01:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDDE242059;
	Mon,  5 Sep 2022 11:01:34 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.39.18])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 11:01:34 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] tools/perf: Fix out of bound access to affinity
 "sched_cpus"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YxXIvno0W1UeiH8K@krava>
Date: Mon, 5 Sep 2022 16:31:32 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <F14D7769-52B0-4B0E-A30C-9282A31035D9@linux.vnet.ibm.com>
References: <20220905045441.1643-1-atrajeev@linux.vnet.ibm.com>
 <YxXIvno0W1UeiH8K@krava>
To: Jiri Olsa <olsajiri@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dxToyjVPiwqOyLj3M1L_Gw_kdo3tTcgP
X-Proofpoint-ORIG-GUID: SyKYqfVVmivwvYRHhoUX_qTtVEYdvN69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_08,2022-09-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050053
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Sep-2022, at 3:30 PM, Jiri Olsa <olsajiri@gmail.com> wrote:
> 
> On Mon, Sep 05, 2022 at 10:24:40AM +0530, Athira Rajeev wrote:
>> The affinity code in "affinity_set" function access array
>> named "sched_cpus". The size for this array is allocated in
>> affinity_setup function which is nothing but value from
>> get_cpu_set_size. This is used to contain the cpumask value
>> for each cpu. While setting bit for each cpu, it calls
>> "set_bit" function which access index in sched_cpus array.
>> If we provide a command-line option to -C which is more than
>> the number of CPU's present in the system, the set_bit could
>> access an array member which is out-of the array size. This
>> is because currently, there is no boundary check for the CPU.
>> This will result in seg fault:
>> 
>> <<>>
>> ./perf stat -C 12323431 ls
>> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
>> Segmentation fault (core dumped)
>> <<>>
>> 
>> Fix this by adding boundary check for the array.
>> 
>> After the fix from powerpc system:
>> 
>> <<>>
>> ./perf stat -C 12323431 ls 1>out
>> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
>> 
>> Performance counter stats for 'CPU(s) 12323431':
>> 
>>   <not supported> msec cpu-clock
>>   <not supported>      context-switches
>>   <not supported>      cpu-migrations
>>   <not supported>      page-faults
>>   <not supported>      cycles
>>   <not supported>      instructions
>>   <not supported>      branches
>>   <not supported>      branch-misses
>> 
>>       0.001192373 seconds time elapsed
>> <<>>
>> 
>> Reported-by: Nageswara Sastry <rnsastry@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/affinity.c | 8 +++++++-
>> 1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/tools/perf/util/affinity.c b/tools/perf/util/affinity.c
>> index 4d216c0dc425..a1dd37347abc 100644
>> --- a/tools/perf/util/affinity.c
>> +++ b/tools/perf/util/affinity.c
>> @@ -49,8 +49,14 @@ void affinity__set(struct affinity *a, int cpu)
>> {
>> 	int cpu_set_size = get_cpu_set_size();
>> 
>> -	if (cpu == -1)
>> +	/*
>> +	 * Return:
>> +	 * - if cpu is -1
>> +	 * - restrict out of bound access to sched_cpus
>> +	 */
>> +	if (cpu == -1 || ((cpu / __BITS_PER_LONG) >= (cpu_set_size / 8)))
> 
> hm, there's __BITS_PER_LONG in one case, but then there's hardcoded 8
> 
> would this be simpler:
> 
> 	if (cpu == -1 || ((cpu >= (cpu_set_size * 8))))
> 		return;
> 
> jirka

Hi Jiri,

Thanks for the review. I will post a V2 with this change

Athira

> 
>> 		return;
>> +
>> 	a->changed = true;
>> 	set_bit(cpu, a->sched_cpus);
>> 	/*
>> -- 
>> 2.35.1

