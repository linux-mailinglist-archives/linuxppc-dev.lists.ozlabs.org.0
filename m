Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1ED38450
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:28:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kszt20fYzDqHv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ksxp3YCzzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:26:54 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x576Mx8V113558
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 02:26:52 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2syh6e3en2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 02:26:51 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Fri, 7 Jun 2019 07:26:49 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 07:26:45 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x576QiSS58065094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 06:26:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18689A4040;
 Fri,  7 Jun 2019 06:26:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD75DA405E;
 Fri,  7 Jun 2019 06:26:40 +0000 (GMT)
Received: from [9.199.59.123] (unknown [9.199.59.123])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 06:26:40 +0000 (GMT)
Subject: Re: [PATCH] Powerpc/Watchpoint: Restore nvgprs while returning from
 exception
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
 <87ftom0wrm.fsf@concordia.ellerman.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Fri, 7 Jun 2019 11:56:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87ftom0wrm.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060706-0012-0000-0000-00000326210D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060706-0013-0000-0000-0000215F0B48
Message-Id: <a2696037-539c-2f37-3b2f-7288a58fbfe7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070045
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 mahesh@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/7/19 11:20 AM, Michael Ellerman wrote:
> Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
> 
>> Powerpc hw triggers watchpoint before executing the instruction.
>> To make trigger-after-execute behavior, kernel emulates the
>> instruction. If the instruction is 'load something into non-
>> volatile register', exception handler should restore emulated
>> register state while returning back, otherwise there will be
>> register state corruption. Ex, Adding a watchpoint on a list
>> can corrput the list:
>>
>>   # cat /proc/kallsyms | grep kthread_create_list
>>   c00000000121c8b8 d kthread_create_list
>>
>> Add watchpoint on kthread_create_list->next:
>>
>>   # perf record -e mem:0xc00000000121c8c0
>>
>> Run some workload such that new kthread gets invoked. Ex, I
>> just logged out from console:
>>
>>   list_add corruption. next->prev should be prev (c000000001214e00), \
>> 	but was c00000000121c8b8. (next=c00000000121c8b8).
>>   WARNING: CPU: 59 PID: 309 at lib/list_debug.c:25 __list_add_valid+0xb4/0xc0
>>   CPU: 59 PID: 309 Comm: kworker/59:0 Kdump: loaded Not tainted 5.1.0-rc7+ #69
>>   ...
>>   NIP __list_add_valid+0xb4/0xc0
>>   LR __list_add_valid+0xb0/0xc0
>>   Call Trace:
>>   __list_add_valid+0xb0/0xc0 (unreliable)
>>   __kthread_create_on_node+0xe0/0x260
>>   kthread_create_on_node+0x34/0x50
>>   create_worker+0xe8/0x260
>>   worker_thread+0x444/0x560
>>   kthread+0x160/0x1a0
>>   ret_from_kernel_thread+0x5c/0x70
> 
> This all depends on what code the compiler generates for the list
> access.

True. list corruption is just an example. But any load instruction that uses
non-volatile register and hits a watchpoint, will result in register state
corruption.

> Can you include a disassembly of the relevant code in your
> kernel so we have an example of the bad case.

Register state from WARN_ON():

  GPR00: c00000000059a3a0 c000007ff23afb50 c000000001344e00 0000000000000075
  GPR04: 0000000000000000 0000000000000000 0000001852af8bc1 0000000000000000
  GPR08: 0000000000000001 0000000000000007 0000000000000006 00000000000004aa
  GPR12: 0000000000000000 c000007ffffeb080 c000000000137038 c000005ff62aaa00
  GPR16: 0000000000000000 0000000000000000 c000007fffbe7600 c000007fffbe7370
  GPR20: c000007fffbe7320 c000007fffbe7300 c000000001373a00 0000000000000000
  GPR24: fffffffffffffef7 c00000000012e320 c000007ff23afcb0 c000000000cb8628
  GPR28: c00000000121c8b8 c000000001214e00 c000007fef5b17e8 c000007fef5b17c0

Snippet from __kthread_create_on_node:

  c000000000136be8:       ed ff a2 3f     addis   r29,r2,-19
  c000000000136bec:       c0 7a bd eb     ld      r29,31424(r29)
          if (!__list_add_valid(new, prev, next))
  c000000000136bf0:       78 f3 c3 7f     mr      r3,r30
  c000000000136bf4:       78 e3 85 7f     mr      r5,r28
  c000000000136bf8:       78 eb a4 7f     mr      r4,r29
  c000000000136bfc:       fd 36 46 48     bl      c00000000059a2f8 <__list_add_valid+0x8>

Watchpoint hit at 0xc000000000136bec. 

  addis   r29,r2,-19
   => r29 = 0xc000000001344e00 + (-19 << 16)
   => r29 = 0xc000000001214e00

  ld      r29,31424(r29)
   => r29 = *(0xc000000001214e00 + 31424)
   => r29 = *(0xc00000000121c8c0)

0xc00000000121c8c0 is where we placed a watchpoint and thus this instruction was
emulated by emulate_step. But because handle_dabr_fault did not restore emulated
register state, r29 still contains stale value in above register state.

