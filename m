Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C938316
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 05:19:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Knns0LTVzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 13:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Knlt0Js3zDqpJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 13:18:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x573Buwk187819
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 23:17:58 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2syfayh0hu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 23:17:58 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Fri, 7 Jun 2019 04:17:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 04:17:54 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x573HrZP43909258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 03:17:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4505AA4051;
 Fri,  7 Jun 2019 03:17:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0BCFA404D;
 Fri,  7 Jun 2019 03:17:49 +0000 (GMT)
Received: from [9.199.59.123] (unknown [9.199.59.123])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 03:17:49 +0000 (GMT)
Subject: Re: [PATCH] Powerpc/Watchpoint: Restore nvgprs while returning from
 exception
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
 <80cfc8d7327d3bb744ea1f7e2843943a998d48de.camel@neuling.org>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Fri, 7 Jun 2019 08:47:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <80cfc8d7327d3bb744ea1f7e2843943a998d48de.camel@neuling.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060703-0020-0000-0000-00000347E8B6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060703-0021-0000-0000-0000219AFFBF
Message-Id: <b6f6e2c7-f193-1721-de59-1e36127ceac1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070021
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, mahesh@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/7/19 6:20 AM, Michael Neuling wrote:
> On Thu, 2019-06-06 at 12:59 +0530, Ravi Bangoria wrote:
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
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> 
> How long has this been around? Should we be CCing stable?

"bl .save_nvgprs" was added in the commit 5aae8a5370802 ("powerpc, hw_breakpoints:
Implement hw_breakpoints for 64-bit server processors"), which was merged in
v2.6.36.

