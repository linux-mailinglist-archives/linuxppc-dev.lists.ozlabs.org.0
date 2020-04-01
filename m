Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3619A8C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:42:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sh6v4d2VzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:41:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgVX6Rr0zDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:13:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03194t4K110033
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 05:13:54 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304pm6tvug-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 05:13:53 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 10:13:38 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 10:13:33 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0319DkEu40173752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 09:13:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E96194204B;
 Wed,  1 Apr 2020 09:13:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C1EC42041;
 Wed,  1 Apr 2020 09:13:42 +0000 (GMT)
Received: from [9.199.48.114] (unknown [9.199.48.114])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 09:13:42 +0000 (GMT)
Subject: Re: [PATCH v2 13/16] powerpc/watchpoint: Prepare handler to handle
 more than one watcnhpoint
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-14-ravi.bangoria@linux.ibm.com>
 <6b89991b-481a-8cbd-b5b7-559e5e16cf92@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 1 Apr 2020 14:43:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6b89991b-481a-8cbd-b5b7-559e5e16cf92@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040109-4275-0000-0000-000003B77F78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040109-4276-0000-0000-000038CCD1C2
Message-Id: <cb2c250b-c963-45fe-f3b4-879076c495ab@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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



On 4/1/20 12:20 PM, Christophe Leroy wrote:
> 
> 
> Le 01/04/2020 à 08:13, Ravi Bangoria a écrit :
>> Currently we assume that we have only one watchpoint supported by hw.
>> Get rid of that assumption and use dynamic loop instead. This should
>> make supporting more watchpoints very easy.
>>
>> With more than one watchpoint, exception handler need to know which
>> DAWR caused the exception, and hw currently does not provide it. So
>> we need sw logic for the same. To figure out which DAWR caused the
>> exception, check all different combinations of user specified range,
>> dawr address range, actual access range and dawrx constrains. For ex,
>> if user specified range and actual access range overlaps but dawrx is
>> configured for readonly watchpoint and the instruction is store, this
>> DAWR must not have caused exception.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/processor.h |   2 +-
>>   arch/powerpc/include/asm/sstep.h     |   2 +
>>   arch/powerpc/kernel/hw_breakpoint.c  | 396 +++++++++++++++++++++------
>>   arch/powerpc/kernel/process.c        |   3 -
>>   4 files changed, 313 insertions(+), 90 deletions(-)
>>
> 
> [...]
> 
>> -static bool
>> -dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
>> +static bool dar_user_range_overlaps(unsigned long dar, int size,
>> +                    struct arch_hw_breakpoint *info)
>>   {
>>       return ((dar <= info->address + info->len - 1) &&
>>           (dar + size - 1 >= info->address));
>>   }
> 
> Here and several other places, I think it would be more clear if you could avoid the - 1 :
> 
>      return ((dar < info->address + info->len) &&
>          (dar + size > info->address));

Ok. see below...

> 
> 
>> +static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
>> +{
>> +    unsigned long hw_start_addr, hw_end_addr;
>> +
>> +    hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
>> +    hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE) - 1;
>> +
>> +    return ((hw_start_addr <= dar) && (hw_end_addr >= dar));
>> +}
> 
>      hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
> 
>      return ((hw_start_addr <= dar) && (hw_end_addr > dar));

I'm using -1 while calculating end address is to make it
inclusive. If I don't use -1, the end address points to a
location outside of actual range, i.e. it's not really an
end address.

Ravi

