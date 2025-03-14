Return-Path: <linuxppc-dev+bounces-7046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C6A60CC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 10:08:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDdnn4HFsz3cYb;
	Fri, 14 Mar 2025 20:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741943309;
	cv=none; b=OU3D4PhTBQrkbNSoNCX/93NZfZp2h9TUYMC9bBde8FNY8Vs5IkuMzL81XgZwpuvafaZSobEoC/qrApADpHINXO/HEr00wBGCGQlZEwM1+Qp/LwPsRsepi77xn4oGZsxHih4rqxq5ssb+r+5zJwFjX9LjYRvl6NN1Flo/YOosLU1lv9dmsPBAeSedYbiJHYTwfgS+hIt7CTSiHM3oq9Jbq3In/PmL69eg0ObpqxXtZIEri4AY1kD6o1zCyKnopxkt69x0Y94LTc8icEM1I/XYZcsNt8dE7X6LgZQI9PS5YrspK8cSTLnTM6Lwm3DMHn9cI6omyu6Hku8u0qIUpVuzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741943309; c=relaxed/relaxed;
	bh=P5Ptcoo0re4UupnZRhseH76+bGD+NG6A68s8gCEYTzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCXWBLLGf3P4glgU6b1vE8Ff8DdIRb95GlYU+rjDmb/DoUNh1AHI/1MZSc9Q0uS62QD5uyyhgkIGoDaxOjn+TknjBP5eGfTtOj9c10YWTFPyhEfqMxMLp2c+oek72+K+y87rXc0JPcU8aRHM+0RzNLHmnMoBcGGdY+byCbxhnfsrwwkfNn1gNwGaSkJzTiT0wtMKjKLXa90O0uF5As2WyKPx8H4j9fdDWUka4pq5uEgGV1FeDqCJ5QEYTUe28ecfjxU+ypSzEbi3nm7EdQdcOY8pWcnD8/67HJZlFOA6G/9j63hb7JpLbFoHYLvBxTOQtOq+J4aSSYe+F9HfqZlJWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mn/OPDYa; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mn/OPDYa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDdnm3Pj9z3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 20:08:26 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNP4Qv018322;
	Fri, 14 Mar 2025 09:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=P5Ptco
	o0re4UupnZRhseH76+bGD+NG6A68s8gCEYTzI=; b=Mn/OPDYaG0OL/6nGYnKYOY
	DeQU50X23BQlguz7qfLDTLT0HtWVvH1ff7TYmK3WwBrFIXHbxWJa6glBFk+qBDIJ
	QaeDKrcTXjGTzQFxdOcAaF/3SOBKDxs6TvW9XgRVnQ5cb+UNmqjk7Kc3a/Sb2lhK
	qoSefv4V/2Tns0D6MvLoIxRTbhndbbHnW5ZGLb6kLpGs9Hb3skW3uFZ/+qNAWxVZ
	HT1GIio5HgioUzR5b1AHVzPHV/gZUOClPGQfG37lbvNHV3msXV7ubjJ+PP+BjCmr
	tuM+8ukjrkN1lUrdRFd752D59SQi6u4Ifqa1AzsIbEtkW5Ar8yvFm7me0eSfOu5g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srcscr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:08:14 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E96Nbl017054;
	Fri, 14 Mar 2025 09:08:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srcscj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:08:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E96kuE027065;
	Fri, 14 Mar 2025 09:08:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsr644r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:08:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E988jd18415970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 09:08:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 767762004B;
	Fri, 14 Mar 2025 09:08:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F65320043;
	Fri, 14 Mar 2025 09:08:05 +0000 (GMT)
Received: from [9.39.22.126] (unknown [9.39.22.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 09:08:05 +0000 (GMT)
Message-ID: <1263bf89-a2dd-4ae9-a8f9-9c36ddd08208@linux.ibm.com>
Date: Fri, 14 Mar 2025 14:38:04 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] powerpc: fadump: use lock guard for mutex
To: Peter Zijlstra <peterz@infradead.org>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-4-sshegde@linux.ibm.com>
 <20250314082223.GT5880@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250314082223.GT5880@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2aHaGjGqb04H9xa5NdtJKF2BmYUQP55S
X-Proofpoint-GUID: 5qlFFH1qpa3l-RY29U11zq59JxMJzqO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=744 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140071
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/14/25 13:52, Peter Zijlstra wrote:

Thanks Peter for taking a look.

> On Fri, Mar 14, 2025 at 11:15:41AM +0530, Shrikanth Hegde wrote:
>> use guard(mutex) for scope based resource management of mutex.
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4b371c738213..5fd2c546fd8c 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1374,15 +1374,13 @@ static void fadump_free_elfcorehdr_buf(void)
>>   
>>   static void fadump_invalidate_release_mem(void)
>>   {
>> -	mutex_lock(&fadump_mutex);
>> +	guard(mutex)(&fadump_mutex);
>> +
>>   	if (!fw_dump.dump_active) {
>> -		mutex_unlock(&fadump_mutex);
>>   		return;
>>   	}
>>   
>>   	fadump_cleanup();
>> -	mutex_unlock(&fadump_mutex);
>> -
> 
> This will result in running the below functions with the mutex held.
> 
>>   	fadump_free_elfcorehdr_buf();
>>   	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
>>   	fadump_free_cpu_notes_buf();
> 

Ok. Got it, since the variable is still in scope unlock wont be called.
So, will use scoped_guard as you suggested below in v2.

> 
> The equivalent transformation for the above code would look like:
> 
> static void fadump_invalidate_release_mem(void)
> {
> 	scoped_guard (mutex, &fadump_mutex) {
> 		if (!fw_dump.dump_active)
> 			return;
> 
> 		fadump_cleanup();
> 	}
> 
> 	fadump_free_elfcorehdr_buf();
> 	...

ok.

