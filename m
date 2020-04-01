Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11A19A8BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:36:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sh070pTczDqT2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:36:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgLL62t6zDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:06:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03194cDL051139
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 05:06:48 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303vfj5msb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 05:06:48 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 10:06:20 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 10:06:16 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03196Qud46858552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 09:06:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD68542041;
 Wed,  1 Apr 2020 09:06:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 881914203F;
 Wed,  1 Apr 2020 09:06:22 +0000 (GMT)
Received: from [9.199.48.114] (unknown [9.199.48.114])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 09:06:22 +0000 (GMT)
Subject: Re: [PATCH v2 09/16] powerpc/watchpoint: Convert
 thread_struct->hw_brk to an array
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-10-ravi.bangoria@linux.ibm.com>
 <e5af5ed7-b9df-e334-1bdb-e7f82ae32697@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 1 Apr 2020 14:36:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e5af5ed7-b9df-e334-1bdb-e7f82ae32697@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040109-0008-0000-0000-000003685CC0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040109-0009-0000-0000-00004A89E462
Message-Id: <a1bd4536-9313-120e-b747-1a4a31b8da73@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


>>   static void set_debug_reg_defaults(struct thread_struct *thread)
>>   {
>> -    thread->hw_brk.address = 0;
>> -    thread->hw_brk.type = 0;
>> -    thread->hw_brk.len = 0;
>> -    thread->hw_brk.hw_len = 0;
>> -    if (ppc_breakpoint_available())
>> -        set_breakpoint(&thread->hw_brk);
>> +    int i;
>> +
>> +    for (i = 0; i < nr_wp_slots(); i++) {
> 
> Maybe you could add the following that you added other places:
> 
>      struct arch_hw_breakpoint null_brk = {0};
> 
> Then do
> 
>      thread->hw_brk[i] = null_brk;

Yes that's better.

[...]

>> +static void switch_hw_breakpoint(struct task_struct *new)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < nr_wp_slots(); i++) {
>> +        if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[i]),
>> +                       &new->thread.hw_brk[i]))) {
>> +            __set_breakpoint(&new->thread.hw_brk[i], i);
>> +        }
> 
> Or could be:
> 
>          if (likely(hw_brk_match(this_cpu_ptr(&current_brk[i]),
>                      &new->thread.hw_brk[i])))
>              continue;
>          __set_breakpoint(&new->thread.hw_brk[i], i);
> 

Sure.

[...]

>> @@ -128,8 +131,10 @@ static void do_signal(struct task_struct *tsk)
>>        * user space. The DABR will have been cleared if it
>>        * triggered inside the kernel.
>>        */
>> -    if (tsk->thread.hw_brk.address && tsk->thread.hw_brk.type)
>> -        __set_breakpoint(&tsk->thread.hw_brk, 0);
>> +    for (i = 0; i < nr_wp_slots(); i++) {
>> +        if (tsk->thread.hw_brk[i].address && tsk->thread.hw_brk[i].type)
>> +            __set_breakpoint(&tsk->thread.hw_brk[i], i);
>> +    }
> 
> thread.hwbrk also exists when CONFIG_PPC_ADV_DEBUG_REGS is selected.
> 
> You could replace the #ifndef CONFIG_PPC_ADV_DEBUG_REGS by an if (!IS_ENABLED(CONFIG_PPC_ADV_DEBUG_REGS)) and then no need of an ifdef when declaring the int i;

Makes sense. Will change it.

Ravi

