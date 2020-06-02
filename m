Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C061EBA44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 13:22:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bqPp0HVKzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 21:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bqMj4vKZzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 21:20:17 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052B6uW1024989; Tue, 2 Jun 2020 07:20:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31c540a8gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 07:20:02 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052AXfi5026220;
 Tue, 2 Jun 2020 07:20:02 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31c540a8f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 07:20:01 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052BEuq6017287;
 Tue, 2 Jun 2020 11:20:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 31bf482ct7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 11:20:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 052BIgfi64749898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 11:18:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FB4C42041;
 Tue,  2 Jun 2020 11:19:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81A8B4204F;
 Tue,  2 Jun 2020 11:19:54 +0000 (GMT)
Received: from [9.199.62.173] (unknown [9.199.62.173])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 11:19:54 +0000 (GMT)
Subject: Re: [PATCH] hw_breakpoint: Fix build warnings with clang
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
 <0217bbaf-a831-8aea-3ecd-fa217fca1669@csgroup.eu>
 <87d06hivfs.fsf@mpe.ellerman.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <99295a0b-cda7-4570-e68c-b78510b2771d@linux.ibm.com>
Date: Tue, 2 Jun 2020 16:49:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87d06hivfs.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_11:2020-06-01,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxlogscore=999 cotscore=-2147483648 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020072
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/2/20 4:30 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 02/06/2020 à 06:12, Ravi Bangoria a écrit :
>>> kbuild test robot reported few build warnings with hw_breakpoint code
>>> when compiled with clang[1]. Fix those.
>>>
>>> [1]: https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.com/
>>>
> 
> This should have mentioned that some of the errors were recently
> introduced by your commit.

Sure, will take care next time.

> 
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>> Note: Prepared on top of powerpc/next.
>>>
>>>    arch/powerpc/include/asm/hw_breakpoint.h | 3 ---
>>>    include/linux/hw_breakpoint.h            | 4 ++++
>>>    2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
>>> index f42a55eb77d2..cb424799da0d 100644
>>> --- a/arch/powerpc/include/asm/hw_breakpoint.h
>>> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
>>> @@ -70,9 +70,6 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
>>>    						unsigned long val, void *data);
>>>    int arch_install_hw_breakpoint(struct perf_event *bp);
>>>    void arch_uninstall_hw_breakpoint(struct perf_event *bp);
>>> -int arch_reserve_bp_slot(struct perf_event *bp);
>>> -void arch_release_bp_slot(struct perf_event *bp);
>>> -void arch_unregister_hw_breakpoint(struct perf_event *bp);
>>>    void hw_breakpoint_pmu_read(struct perf_event *bp);
>>>    extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
>>>    
>>> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
>>> index 6058c3844a76..521481f0d320 100644
>>> --- a/include/linux/hw_breakpoint.h
>>> +++ b/include/linux/hw_breakpoint.h
>>> @@ -80,6 +80,10 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
>>>    extern int dbg_release_bp_slot(struct perf_event *bp);
>>>    extern int reserve_bp_slot(struct perf_event *bp);
>>>    extern void release_bp_slot(struct perf_event *bp);
>>> +extern int hw_breakpoint_weight(struct perf_event *bp);
>>> +extern int arch_reserve_bp_slot(struct perf_event *bp);
>>> +extern void arch_release_bp_slot(struct perf_event *bp);
>>> +extern void arch_unregister_hw_breakpoint(struct perf_event *bp);
>>
>> Please no new 'extern'. In the old days 'extern' keyword was used, but
>> new code shall not introduce new unnecessary usage of 'extern' keyword.
>> See report from Checkpatch below:
>>
>> WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description
>> (prefer a maximum 75 chars per line)
>> #9:
>> [1]:
>> https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.com/
>>
>> CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
>> #40: FILE: include/linux/hw_breakpoint.h:83:
>> +extern int hw_breakpoint_weight(struct perf_event *bp);
> 
> I fixed it up when applying.

Thanks Michael.

Ravi
