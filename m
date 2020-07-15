Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017722033C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:11:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B63pq11vHzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63mS4zP6zDqKM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:09:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F43lGF001922; Wed, 15 Jul 2020 00:09:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3276ahef37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 00:09:00 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06F48xMs017133;
 Wed, 15 Jul 2020 00:08:59 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3276ahef2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 00:08:59 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F40I7c023141;
 Wed, 15 Jul 2020 04:08:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 327527v2tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 04:08:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F48sk265536230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 04:08:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58DBF42041;
 Wed, 15 Jul 2020 04:08:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86AF742045;
 Wed, 15 Jul 2020 04:08:50 +0000 (GMT)
Received: from [9.199.44.159] (unknown [9.199.44.159])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 04:08:50 +0000 (GMT)
Subject: Re: [PATCH v3 2/9] powerpc/watchpoint: Fix DAWR exception constraint
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
 <20200708045046.135702-3-ravi.bangoria@linux.ibm.com>
 <CACzsE9qSjWKWGDQPGSk-c5f5pxUyWWtUFW+AzzB5M76qFcQ-Cw@mail.gmail.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <9c0a9b97-fcc6-9f69-5a90-1f94cae3c899@linux.ibm.com>
Date: Wed, 15 Jul 2020 09:38:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9qSjWKWGDQPGSk-c5f5pxUyWWtUFW+AzzB5M76qFcQ-Cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_02:2020-07-14,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150032
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

Hi Jordan,

>> @@ -536,7 +538,12 @@ static bool check_dawrx_constraints(struct pt_regs *regs, int type,
>>          if (OP_IS_LOAD(type) && !(info->type & HW_BRK_TYPE_READ))
>>                  return false;
>>
>> -       if (OP_IS_STORE(type) && !(info->type & HW_BRK_TYPE_WRITE))
>> +       /*
>> +        * The Cache Management instructions other than dcbz never
>> +        * cause a match. i.e. if type is CACHEOP, the instruction
>> +        * is dcbz, and dcbz is treated as Store.
>> +        */
>> +       if ((OP_IS_STORE(type) || type == CACHEOP) && !(info->type & HW_BRK_TYPE_WRITE))
>>                  return false;
> This change seems seperate to this commit?

I also thought about it but was not sure. See below ...

>>
>>          if (is_kernel_addr(regs->nip) && !(info->type & HW_BRK_TYPE_KERNEL))
>> @@ -553,7 +560,8 @@ static bool check_dawrx_constraints(struct pt_regs *regs, int type,
>>    * including extraneous exception. Otherwise return false.
>>    */
>>   static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
>> -                             int type, int size, struct arch_hw_breakpoint *info)
>> +                             unsigned long ea, int type, int size,
>> +                             struct arch_hw_breakpoint *info)
>>   {
>>          bool in_user_range = dar_in_user_range(regs->dar, info);
>>          bool dawrx_constraints;
>> @@ -569,11 +577,10 @@ static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
>>          }
>>
>>          if (unlikely(ppc_inst_equal(instr, ppc_inst(0)))) {
>> -               if (in_user_range)
>> -                       return true;
>> -
>> -               if (dar_in_hw_range(regs->dar, info)) {
>> -                       info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
>> +               if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +                       if (dar_in_hw_range(regs->dar, info))
>> +                               return true;
>> +               } else {
>>                          return true;
> I think this would be clearer as:
>          if (cpu_has_feature(CPU_FTR_ARCH_31) &&
> !(dar_in_hw_range(regs->dar, info)))
>              return false;
>          else
>              return true;

ok

> 
>>                  }
>>                  return false;
>> @@ -581,10 +588,20 @@ static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
>>
>>          dawrx_constraints = check_dawrx_constraints(regs, type, info);
>>
>> -       if (dar_user_range_overlaps(regs->dar, size, info))
>> +       if (type == UNKNOWN) {
>> +               if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +                       if (dar_in_hw_range(regs->dar, info))
>> +                               return dawrx_constraints;
>> +               } else {
>> +                       return dawrx_constraints;
>> +               }
>> +               return false;
>> +       }
> Similar thing here, it could be:
>          if ((cpu_has_feature(CPU_FTR_ARCH_31)) &&
> !(dar_in_hw_range(regs->dar, info)))
>              return false;
>          else
>              return dawrx_constraints;

ok

>> +
>> +       if (ea_user_range_overlaps(ea, size, info))
>>                  return dawrx_constraints;
>>
>> -       if (dar_hw_range_overlaps(regs->dar, size, info)) {
>> +       if (ea_hw_range_overlaps(ea, size, info)) {
>>                  if (dawrx_constraints) {
>>                          info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
>>                          return true;
>> @@ -593,8 +610,17 @@ static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
>>          return false;
>>   }
>>
>> +static int cache_op_size(void)
>> +{
>> +#ifdef __powerpc64__
>> +       return ppc64_caches.l1d.block_size;
>> +#else
>> +       return L1_CACHE_BYTES;
>> +#endif
>> +}
>> +
>>   static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
>> -                            int *type, int *size, bool *larx_stcx)
>> +                            int *type, int *size, unsigned long *ea)
>>   {
>>          struct instruction_op op;
>>
>> @@ -602,16 +628,23 @@ static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
>>                  return;
>>
>>          analyse_instr(&op, regs, *instr);
>> -
>> -       /*
>> -        * Set size = 8 if analyse_instr() fails. If it's a userspace
>> -        * watchpoint(valid or extraneous), we can notify user about it.
>> -        * If it's a kernel watchpoint, instruction  emulation will fail
>> -        * in stepping_handler() and watchpoint will be disabled.
>> -        */
>>          *type = GETTYPE(op.type);
>> -       *size = !(*type == UNKNOWN) ? GETSIZE(op.type) : 8;
>> -       *larx_stcx = (*type == LARX || *type == STCX);
>> +       *ea = op.ea;
>> +#ifdef __powerpc64__
>> +       if (!(regs->msr & MSR_64BIT))
>> +               *ea &= 0xffffffffUL;
>> +#endif
>> +
>> +       *size = GETSIZE(op.type);
>> +       if (*type == CACHEOP) {
>> +               *size = cache_op_size();
>> +               *ea &= ~(*size - 1);
>> +       }
> Again related to CACHEOP, should these changes be mentioned in the
> commit message?

For CACHEOP, ea returned by analyse_instr() needs to be aligned down to cache
block size manually. Also, for CACHEOP, size returned by analyse_instr() is 0
and thus size also needs to be calculated manually. This was missed in
27985b2a640e. So it kind of relates to other changes of the patch but needs
special treatment as well. Will see if I can split it.

Thanks for the review,
Ravi
