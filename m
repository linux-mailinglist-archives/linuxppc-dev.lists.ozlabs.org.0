Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D8215435
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 10:53:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0fVq1mQXzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 18:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0fQf3TX8zDqdn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 18:50:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0668YSI8138762; Mon, 6 Jul 2020 04:49:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322pakud65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 04:49:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0668aKgK027249;
 Mon, 6 Jul 2020 08:49:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7t2u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 08:49:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0668nrap61800610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 08:49:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6DF42049;
 Mon,  6 Jul 2020 08:49:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 128264203F;
 Mon,  6 Jul 2020 08:49:52 +0000 (GMT)
Received: from [9.85.98.83] (unknown [9.85.98.83])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 08:49:51 +0000 (GMT)
Subject: Re: [PATCH v5 15/26] powerpc/book3s64/pkeys: Use execute_pkey_disable
 static key
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-16-aneesh.kumar@linux.ibm.com>
 <87mu4d5cu8.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <c0fe685c-9cd7-4c9c-ae65-da5f107938ae@linux.ibm.com>
Date: Mon, 6 Jul 2020 14:19:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87mu4d5cu8.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_04:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=2 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007060064
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/20 12:50 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Use execute_pkey_disabled static key to check for execute key support instead
>> of pkey_disabled.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/pkeys.h | 10 +---------
>>   arch/powerpc/mm/book3s64/pkeys.c |  5 ++++-
>>   2 files changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
>> index 47c81d41ea9a..09fbaa409ac4 100644
>> --- a/arch/powerpc/include/asm/pkeys.h
>> +++ b/arch/powerpc/include/asm/pkeys.h
>> @@ -126,15 +126,7 @@ static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
>>    * Try to dedicate one of the protection keys to be used as an
>>    * execute-only protection key.
>>    */
>> -extern int __execute_only_pkey(struct mm_struct *mm);
>> -static inline int execute_only_pkey(struct mm_struct *mm)
>> -{
>> -	if (static_branch_likely(&pkey_disabled))
>> -		return -1;
>> -
>> -	return __execute_only_pkey(mm);
>> -}
>> -
>> +extern int execute_only_pkey(struct mm_struct *mm);
>>   extern int __arch_override_mprotect_pkey(struct vm_area_struct *vma,
>>   					 int prot, int pkey);
>>   static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>> index bbba9c601e14..fed4f159011b 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -345,8 +345,11 @@ void thread_pkey_regs_init(struct thread_struct *thread)
>>   	write_uamor(default_uamor);
>>   }
>>   
>> -int __execute_only_pkey(struct mm_struct *mm)
>> +int execute_only_pkey(struct mm_struct *mm)
>>   {
>> +	if (static_branch_likely(&execute_pkey_disabled))
>> +		return -1;
>> +
>>   	return mm->context.execute_only_pkey;
>>   }
> 
> That adds the overhead of a function call, but then uses a static_key to
> avoid an easy to predict branch, which seems like a bad tradeoff. And
> it's not a performance critical path AFAICS.
> 
> Anyway this seems unnecessary:
> 
> pkey_early_init_devtree()
> {
> 	...
> 	if (unlikely(max_pkey <= execute_only_key)) {
> 		/*
> 		 * Insufficient number of keys to support
> 		 * execute only key. Mark it unavailable.
> 		 */
> 		execute_only_key = -1;
> 
> void pkey_mm_init(struct mm_struct *mm)
> {
> 	...
> 	mm->context.execute_only_pkey = execute_only_key;
> }
> 
> 
> ie. Can't it just be:
> 
> static inline int execute_only_pkey(struct mm_struct *mm)
> {
> 	return mm->context.execute_only_pkey;
> }
> 

ok updated with

modified   arch/powerpc/mm/book3s64/pkeys.c
@@ -151,7 +151,7 @@ void __init pkey_early_init_devtree(void)
  	max_pkey = pkeys_total;
  #endif

-	if (unlikely(max_pkey <= execute_only_key)) {
+	if (unlikely(max_pkey <= execute_only_key) || 
!pkey_execute_disable_supported) {
  		/*
  		 * Insufficient number of keys to support
  		 * execute only key. Mark it unavailable.
@@ -368,9 +368,6 @@ int __arch_set_user_pkey_access(struct task_struct 
*tsk, int pkey,

  int execute_only_pkey(struct mm_struct *mm)
  {
-	if (static_branch_likely(&execute_pkey_disabled))
-		return -1;
-
  	return mm->context.execute_only_pkey;
  }

-aneesh
