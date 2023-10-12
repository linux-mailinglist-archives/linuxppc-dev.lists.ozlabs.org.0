Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F87C64A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 07:37:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mlrUtjXn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5dgc59Dlz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 16:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mlrUtjXn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5dfk1FLwz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 16:36:29 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C5Db2q021480;
	Thu, 12 Oct 2023 05:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zTTyFiLcXXGKvFzVglfAIx31wIMbASNF7keLhqF+43c=;
 b=mlrUtjXnZPzbv/wZFrMotFPUzwwZuaaa8ABS1Gp/crkrQ6+vfJYxAeoNak8iolGDhVrf
 hAskj+DjGjV9Mx4Z+trY7gqGNQVs4UEzEJKr8VicVu2xp/6HvPZLSMSMeZD18l4/NBvZ
 BTAIGdQut3b04gu+hU8NL4uaf1fvt1nw9GUDRz9x0fRFaMjaiCc5xpUVolCQO1cixt2Y
 33YjRvnKqK6i0a7KDA3qPiU85r4PtwaUkugi5q18SdYxWhgeFSQsupFhPV0XwZVBcFyX
 TuTP4gvSrntL+lU25TDV9/+YypFz/hMLDz88YDUVVdvaQSjB4TPfelZFj/c/7p17ztV5 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpab4gpvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:36:17 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39C5Mx7f018271;
	Thu, 12 Oct 2023 05:36:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpab4gpt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:36:17 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39C4HuA8000693;
	Thu, 12 Oct 2023 05:32:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5kw6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:32:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39C5WM5X38863352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 05:32:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F576200B7;
	Thu, 12 Oct 2023 05:32:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BE7F200B8;
	Thu, 12 Oct 2023 05:32:21 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 05:32:21 +0000 (GMT)
Message-ID: <fb374fcc-487b-cb6c-6aa6-76fb49eee99a@linux.ibm.com>
Date: Thu, 12 Oct 2023 11:02:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid
 greater than nr_cpus
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-4-piliu@redhat.com>
 <8216e3e3-8475-158f-dc79-1b5ba1032150@linux.ibm.com>
 <ZSYQ9odHpQDWN5ca@piliu.users.ipa.redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <ZSYQ9odHpQDWN5ca@piliu.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 15gWf4GiB0jZEvv5BJ-Hj4Vxbv_n-AmV
X-Proofpoint-ORIG-GUID: y0ZbYGqCNdIRYEKCmNU9bTtJcOjWyHtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_02,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120046
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/10/23 8:35 am, Pingfan Liu wrote:
> On Tue, Oct 10, 2023 at 01:56:13PM +0530, Hari Bathini wrote:
>>
>>
>> On 09/10/23 5:00 pm, Pingfan Liu wrote:
>>> If the boot_cpuid is smaller than nr_cpus, it requires extra effort to
>>> ensure the boot_cpu is in cpu_present_mask. This can be achieved by
>>> reserving the last quota for the boot cpu.
>>>
>>> Note: the restriction on nr_cpus will be lifted with more effort in the
>>> successive patches
>>>
>>> Signed-off-by: Pingfan Liu <piliu@redhat.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Wen Xiong <wenxiong@linux.ibm.com>
>>> Cc: Baoquan He <bhe@redhat.com>
>>> Cc: Ming Lei <ming.lei@redhat.com>
>>> Cc: kexec@lists.infradead.org
>>> To: linuxppc-dev@lists.ozlabs.org
>>> ---
>>>    arch/powerpc/kernel/setup-common.c | 25 ++++++++++++++++++++++---
>>>    1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
>>> index 81291e13dec0..f9ef0a2666b0 100644
>>> --- a/arch/powerpc/kernel/setup-common.c
>>> +++ b/arch/powerpc/kernel/setup-common.c
>>> @@ -454,8 +454,8 @@ struct interrupt_server_node {
>>>    void __init smp_setup_cpu_maps(void)
>>>    {
>>>    	struct device_node *dn;
>>> -	int shift = 0, cpu = 0;
>>> -	int j, nthreads = 1;
>>> +	int terminate, shift = 0, cpu = 0;
>>> +	int j, bt_thread = 0, nthreads = 1;
>>>    	int len;
>>>    	struct interrupt_server_node *intserv_node, *n;
>>>    	struct list_head *bt_node, head;
>>> @@ -518,6 +518,7 @@ void __init smp_setup_cpu_maps(void)
>>>    			for (j = 0 ; j < nthreads; j++) {
>>>    				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
>>>    					bt_node = &intserv_node->node;
>>> +					bt_thread = j;
>>>    					found_boot_cpu = true;
>>>    					/*
>>>    					 * Record the round-shift between dt
>>> @@ -537,11 +538,21 @@ void __init smp_setup_cpu_maps(void)
>>>    	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
>>>    	list_add_tail(&head, bt_node);
>>>    	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
>>> +	terminate = nr_cpu_ids;
>>>    	list_for_each_entry(intserv_node, &head, node) {
>>> +		j = 0;
>>
>>> +		/* Choose a start point to cover the boot cpu */
>>> +		if (nr_cpu_ids - 1 < bt_thread) {
>>> +			/*
>>> +			 * The processor core puts assumption on the thread id,
>>> +			 * not to breach the assumption.
>>> +			 */
>>> +			terminate = nr_cpu_ids - 1;
>>
>> nthreads is anyway assumed to be same for all cores. So, enforcing
>> nr_cpu_ids to a minimum of nthreads (and multiple of nthreads) should
>> make the code much simpler without the need for above check and the
>> other complexities addressed in the subsequent patches...
>>
> 
> Indeed, this series can be splited into two partsk, [1-2/5] and [3-5/5].
> In [1-2/5], if smaller, the nr_cpu_ids is enforced to be equal to
> nthreads. I will make it align upward on nthreads in the next version.
> So [1-2/5] can be totally independent from the rest patches in this
> series.

Yup. Would prefer it that way.

>  From an engineer's perspective, [3-5/5] are added to maintain the
> nr_cpus semantics. (Finally, nr_cpus=1 can be achieved but requiring
> effort on other subsystem)

I understand it would be nice to maintain semantics but not worth the
complexity it brings, IMHO. So, my suggest would be to drop [3-5/5].

Thanks
Hari
