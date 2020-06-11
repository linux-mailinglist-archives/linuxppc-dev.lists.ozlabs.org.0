Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBAA1F6408
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 10:54:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jHj86MvXzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 18:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jHgM02gLzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 18:52:46 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05B8YaWn154938; Thu, 11 Jun 2020 04:52:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k7s4e6e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 04:52:38 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05B8aL98161224;
 Thu, 11 Jun 2020 04:52:37 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k7s4e6dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 04:52:37 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05B8pN6E004026;
 Thu, 11 Jun 2020 08:52:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31g2s7uu30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 08:52:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05B8qX8e62390780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jun 2020 08:52:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC1E011C058;
 Thu, 11 Jun 2020 08:52:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDA2D11C04A;
 Thu, 11 Jun 2020 08:52:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.60.164])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jun 2020 08:52:31 +0000 (GMT)
Subject: Re: [PATCH? v2] powerpc: Hard wire PT_SOFTE value to 1 in gpr_get()
 too
To: Oleg Nesterov <oleg@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <20190917121256.GA8659@redhat.com>
 <20190917143753.GA12300@redhat.com> <20200610150224.GA6793@redhat.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <321e6865-1762-c459-56c4-0cc89c7c2a7e@linux.ibm.com>
Date: Thu, 11 Jun 2020 14:22:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610150224.GA6793@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_07:2020-06-10,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1011 cotscore=-2147483648
 adultscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110067
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
Cc: linuxppc-dev@lists.ozlabs.org, Jan Kratochvil <jan.kratochvil@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/10/20 8:37 PM, Oleg Nesterov wrote:
> Hi,
>
> looks like this patch was forgotten.

yep, I missed this. But mpe did have comments for the patch.

https://lkml.org/lkml/2019/9/19/107

Maddy
>
> Do you think this should be fixed or should we document that
> PTRACE_GETREGS is not consistent with PTRACE_PEEKUSER on ppc64?
>
>
> On 09/17, Oleg Nesterov wrote:
>> I don't have a ppc machine, this patch wasn't even compile tested,
>> could you please review?
>>
>> The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
>> ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
>> but PTRACE_GETREGS still copies pt_regs->softe as is.
>>
>> This is not consistent and this breaks
>> http://sourceware.org/systemtap/wiki/utrace/tests/user-regs-peekpoke
>>
>> Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
>> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
>> ---
>>   arch/powerpc/kernel/ptrace.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
>> index 8c92feb..291acfb 100644
>> --- a/arch/powerpc/kernel/ptrace.c
>> +++ b/arch/powerpc/kernel/ptrace.c
>> @@ -363,11 +363,36 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
>>   	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
>>   		     offsetof(struct pt_regs, msr) + sizeof(long));
>>   
>> +#ifdef CONFIG_PPC64
>> +	if (!ret)
>> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>> +					  &target->thread.regs->orig_gpr3,
>> +					  offsetof(struct pt_regs, orig_gpr3),
>> +					  offsetof(struct pt_regs, softe));
>> +
>> +	if (!ret) {
>> +		unsigned long softe = 0x1;
>> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &softe,
>> +					  offsetof(struct pt_regs, softe),
>> +					  offsetof(struct pt_regs, softe) +
>> +					  sizeof(softe));
>> +	}
>> +
>> +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
>> +		     offsetof(struct pt_regs, softe) + sizeof(long));
>> +
>> +	if (!ret)
>> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>> +					  &target->thread.regs->trap,
>> +					  offsetof(struct pt_regs, trap),
>> +					  sizeof(struct user_pt_regs));
>> +#else
>>   	if (!ret)
>>   		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>>   					  &target->thread.regs->orig_gpr3,
>>   					  offsetof(struct pt_regs, orig_gpr3),
>>   					  sizeof(struct user_pt_regs));
>> +#endif
>>   	if (!ret)
>>   		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
>>   					       sizeof(struct user_pt_regs), -1);
>> -- 
>> 2.5.0
>>

