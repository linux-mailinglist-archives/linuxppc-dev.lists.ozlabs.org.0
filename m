Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D81193717
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 04:34:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nrF12blVzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 14:33:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nrC90WVMzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 14:32:20 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q35l5h101318
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 23:32:18 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0qupra-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 23:32:18 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 26 Mar 2020 03:32:10 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 03:32:07 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02Q3V8iu30278096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 03:31:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A216A4C052;
 Thu, 26 Mar 2020 03:32:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 431FE4C046;
 Thu, 26 Mar 2020 03:32:07 +0000 (GMT)
Received: from [9.199.59.209] (unknown [9.199.59.209])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 03:32:07 +0000 (GMT)
Subject: Re: [PATCH 07/15] powerpc/watchpoint: Get watchpoint count
 dynamically while disabling them
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-8-ravi.bangoria@linux.ibm.com>
 <c73b77fd-b983-2c5c-75bb-4b2f47a94d92@c-s.fr>
 <cca28aeb-d1f8-5668-0743-2269f621e926@linux.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Thu, 26 Mar 2020 09:02:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cca28aeb-d1f8-5668-0743-2269f621e926@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032603-0020-0000-0000-000003BB82B9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032603-0021-0000-0000-000022140B34
Message-Id: <a7cde9ea-02d6-a5f9-3124-6047b4e1c622@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_13:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260013
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



On 3/18/20 12:27 PM, Ravi Bangoria wrote:
> 
> 
> On 3/17/20 4:02 PM, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2020 à 09:57, Ravi Bangoria a écrit :
>>> Instead of disabling only one watchpooint, get num of available
>>> watchpoints dynamically and disable all of them.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/hw_breakpoint.h | 15 +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
>>> index 980ac7d9f267..ec61e2b7195c 100644
>>> --- a/arch/powerpc/include/asm/hw_breakpoint.h
>>> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
>>> @@ -75,14 +75,13 @@ extern void ptrace_triggered(struct perf_event *bp,
>>>               struct perf_sample_data *data, struct pt_regs *regs);
>>>   static inline void hw_breakpoint_disable(void)
>>>   {
>>> -    struct arch_hw_breakpoint brk;
>>> -
>>> -    brk.address = 0;
>>> -    brk.type = 0;
>>> -    brk.len = 0;
>>> -    brk.hw_len = 0;
>>> -    if (ppc_breakpoint_available())
>>> -        __set_breakpoint(&brk, 0);
>>> +    int i;
>>> +    struct arch_hw_breakpoint null_brk = {0};
>>> +
>>> +    if (ppc_breakpoint_available()) {
>>
>> I think this test should go into nr_wp_slots() which should return zero when no breakpoint is available.
> 
> Seems possible. Will change it in next version.

Once we move ppc_breakpoint_available() logic into nr_wp_slots(),
'dawr_force_enable' variable is checked in nr_wp_slots() before
it gets initialized in dawr_force_setup():

     start_kernel()
     |-> perf_event_init()
     |     init_hw_breakpoint()
     |       hw_breakpoint_slots()
     |         nr_wp_slots()
     |           /* Check dawr_force_enable variable */
     |
     |-> arch_call_rest_init()
           rest_init()
             kernel_thread(kernel_init, ...)
               ...
                 kernel_init()
                   kernel_init_freeable()
                     ...
                     do_one_initcall()
                       dawr_force_setup()
                         /* Set dawr_force_enable = true */

Because of this, hw-breakpoint infrastructure is initialized with
no DAWRs. So I'm thinking to keep the code as it is i.e. not moving
ppc_breakpoint_available() test inside nr_wp_slots().

Ravi

