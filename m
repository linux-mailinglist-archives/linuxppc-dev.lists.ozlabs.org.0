Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E783227746
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 05:59:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9lGL5TsbzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9lDl1LYZzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 13:57:58 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L3W2PF088512; Mon, 20 Jul 2020 23:57:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d91us242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 23:57:47 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06L3YMmJ094633;
 Mon, 20 Jul 2020 23:57:46 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d91us23p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 23:57:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L3ojhX002974;
 Tue, 21 Jul 2020 03:57:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq83d9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 03:57:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06L3uIDm62456124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 03:56:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E37F6AE045;
 Tue, 21 Jul 2020 03:57:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84FB4AE051;
 Tue, 21 Jul 2020 03:57:38 +0000 (GMT)
Received: from [9.199.47.202] (unknown [9.199.47.202])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 03:57:38 +0000 (GMT)
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
 <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
Date: Tue, 21 Jul 2020 09:27:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_19:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210020
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/20/20 9:12 AM, Jordan Niethe wrote:
> On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
> <ravi.bangoria@linux.ibm.com> wrote:
>>
>> So far Book3S Powerpc supported only one watchpoint. Power10 is
>> introducing 2nd DAWR. Enable 2nd DAWR support for Power10.
>> Availability of 2nd DAWR will depend on CPU_FTR_DAWR1.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/cputable.h      | 4 +++-
>>   arch/powerpc/include/asm/hw_breakpoint.h | 5 +++--
>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>> index 3445c86e1f6f..36a0851a7a9b 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -633,7 +633,9 @@ enum {
>>    * Maximum number of hw breakpoint supported on powerpc. Number of
>>    * breakpoints supported by actual hw might be less than this.
>>    */
>> -#define HBP_NUM_MAX    1
>> +#define HBP_NUM_MAX    2
>> +#define HBP_NUM_ONE    1
>> +#define HBP_NUM_TWO    2
> I wonder if these defines are necessary - has it any advantage over
> just using the literal?

No, not really. Initially I had something like:

#define HBP_NUM_MAX    2
#define HBP_NUM_P8_P9  1
#define HBP_NUM_P10    2

But then I thought it's also not right. So I made it _ONE and _TWO.
Now the function that decides nr watchpoints dynamically (nr_wp_slots)
is in different file, I thought to keep it like this so it would be
easier to figure out why _MAX is 2.

>>
>>   #endif /* !__ASSEMBLY__ */
>>
>> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
>> index cb424799da0d..d4eab1694bcd 100644
>> --- a/arch/powerpc/include/asm/hw_breakpoint.h
>> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
>> @@ -5,10 +5,11 @@
>>    * Copyright 2010, IBM Corporation.
>>    * Author: K.Prasad <prasad@linux.vnet.ibm.com>
>>    */
>> -
> Was removing this line deliberate?

Nah. Will remove that hunk.

>>   #ifndef _PPC_BOOK3S_64_HW_BREAKPOINT_H
>>   #define _PPC_BOOK3S_64_HW_BREAKPOINT_H
>>
>> +#include <asm/cpu_has_feature.h>
>> +
>>   #ifdef __KERNEL__
>>   struct arch_hw_breakpoint {
>>          unsigned long   address;
>> @@ -46,7 +47,7 @@ struct arch_hw_breakpoint {
>>
>>   static inline int nr_wp_slots(void)
>>   {
>> -       return HBP_NUM_MAX;
>> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_TWO : HBP_NUM_ONE;
> So it'd be something like:
> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_MAX : 1;
> But thinking that there might be more slots added in the future, it
> may be better to make the number of slots a variable that is set
> during the init and then have this function return that.

Not sure I follow. What do you mean by setting number of slots a
variable that is set during the init?

Thanks,
Ravi
