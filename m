Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D619A8CA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:43:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sh8t02XDzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgdc5N3wzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:20:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03193fKK130473
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 05:20:01 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g83gng-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 05:20:01 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 10:19:42 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 10:19:37 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0319Jq7S55443614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 09:19:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F59B42049;
 Wed,  1 Apr 2020 09:19:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 111AE42042;
 Wed,  1 Apr 2020 09:19:49 +0000 (GMT)
Received: from [9.199.48.114] (unknown [9.199.48.114])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 09:19:48 +0000 (GMT)
Subject: Re: [PATCH v2 07/16] powerpc/watchpoint: Get watchpoint count
 dynamically while disabling them
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-8-ravi.bangoria@linux.ibm.com>
 <3c2312bb-9689-830e-3bc8-c828eddf369c@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 1 Apr 2020 14:49:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3c2312bb-9689-830e-3bc8-c828eddf369c@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040109-0020-0000-0000-000003BF8182
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040109-0021-0000-0000-00002218265D
Message-Id: <299bf5b6-a293-aa59-b27a-04b00ef7ea2c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010078
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
Cc: apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/1/20 12:02 PM, Christophe Leroy wrote:
> 
> 
> Le 01/04/2020 à 08:13, Ravi Bangoria a écrit :
>> Instead of disabling only one watchpoint, get num of available
>> watchpoints dynamically and disable all of them.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/hw_breakpoint.h | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
>> index 4e4976c3248b..fae33c729ba9 100644
>> --- a/arch/powerpc/include/asm/hw_breakpoint.h
>> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
>> @@ -78,14 +78,13 @@ extern void ptrace_triggered(struct perf_event *bp,
>>               struct perf_sample_data *data, struct pt_regs *regs);
>>   static inline void hw_breakpoint_disable(void)
>>   {
>> -    struct arch_hw_breakpoint brk;
>> -
>> -    brk.address = 0;
>> -    brk.type = 0;
>> -    brk.len = 0;
>> -    brk.hw_len = 0;
>> -    if (ppc_breakpoint_available())
>> -        __set_breakpoint(&brk, 0);
>> +    int i;
>> +    struct arch_hw_breakpoint null_brk = {0};
> 
> Those declaration should be in the block unsigned them below.
> 
>> +
>> +    if (ppc_breakpoint_available()) {
>> +        for (i = 0; i < nr_wp_slots(); i++)
>> +            __set_breakpoint(&null_brk, i);
>> +    }
> 
> I would have had a preference to the following, but that's detail I guess:
> 
>      int i;
>      struct arch_hw_breakpoint null_brk = {0};
> 
>      if (!ppc_breakpoint_available())
>          return;
> 
>      for (i = 0; i < nr_wp_slots(); i++)
>          __set_breakpoint(&null_brk, i);

This looks more better. Will change it.

Ravi

