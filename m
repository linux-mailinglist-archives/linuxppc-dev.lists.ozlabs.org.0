Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FCA3072B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 10:34:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRFff4SRgzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 20:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Oz/hC8P0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRFWh67ztzDrh8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 20:28:16 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10S93RLT066492; Thu, 28 Jan 2021 04:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=viwW/T4T2KsoiZ1TKJqm8+soc8R9DXGKTHTvbVhwUmA=;
 b=Oz/hC8P0ym/RZne+yoG2nnyxpjL+1nhSc/nrb21xv0hxuLIr7Mn72sBMFCy2K7RTeeSe
 YN0WZpB/svHNG3VXdp3qBx10R/NvccHOjT2GtkSUW1rC1uhQR0RMupv/xHpxVn2/bLgq
 915F2CUhhQzwVphDuvKabBc8TweUTgAe1mzKN4KnU6mCRcZZFR0E9XT70FZ4EKqZdmse
 GNMwkDzBzJT+XMtnV3AfFx8duB+a7s+cNTfInJWevmDUDH3b+dXqXEHXaZ06S/iQZGjH
 NAKpMkqIWHqbGvVDA+nPMiKIJbkHV2X+Zn5Qcl0dYx4Md9Pvp46bCmzKazlF5QDyP6+i fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqkx5kd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 04:28:01 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10S965vG077721;
 Thu, 28 Jan 2021 04:28:01 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqkx5kbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 04:28:01 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10S9HOhE024673;
 Thu, 28 Jan 2021 09:27:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 368b2h4nk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 09:27:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10S9Ruwn23593372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 09:27:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 166F311C052;
 Thu, 28 Jan 2021 09:27:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4F7B11C050;
 Thu, 28 Jan 2021 09:27:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.68.86])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 09:27:54 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] powerpc/mce: Remove per cpu variables from MCE
 handlers
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210122123244.34033-1-ganeshgr@linux.ibm.com>
 <20210122123244.34033-2-ganeshgr@linux.ibm.com>
 <90f24b44-1747-21f4-3829-7af20cf95e46@csgroup.eu>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <044b07c3-a122-ac66-7158-0e09f4cd023f@linux.ibm.com>
Date: Thu, 28 Jan 2021 14:57:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <90f24b44-1747-21f4-3829-7af20cf95e46@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_05:2021-01-27,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280046
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/25/21 2:54 PM, Christophe Leroy wrote:

>
>
> Le 22/01/2021 à 13:32, Ganesh Goudar a écrit :
>> Access to per-cpu variables requires translation to be enabled on
>> pseries machine running in hash mmu mode, Since part of MCE handler
>> runs in realmode and part of MCE handling code is shared between ppc
>> architectures pseries and powernv, it becomes difficult to manage
>> these variables differently on different architectures, So have
>> these variables in paca instead of having them as per-cpu variables
>> to avoid complications.
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> v2: Dynamically allocate memory for machine check event info
>>
>> v3: Remove check for hash mmu lpar, use memblock_alloc_try_nid
>>      to allocate memory.
>>
>> v4: Spliting the patch into two.
>> ---
>>   arch/powerpc/include/asm/mce.h     | 18 +++++++
>>   arch/powerpc/include/asm/paca.h    |  4 ++
>>   arch/powerpc/kernel/mce.c          | 79 ++++++++++++++++++------------
>>   arch/powerpc/kernel/setup-common.c |  2 +-
>>   4 files changed, 70 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup-common.c 
>> b/arch/powerpc/kernel/setup-common.c
>> index 71f38e9248be..17dc451f0e45 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -916,7 +916,6 @@ void __init setup_arch(char **cmdline_p)
>>       /* On BookE, setup per-core TLB data structures. */
>>       setup_tlb_core_data();
>>   #endif
>> -
>
> This line removal is really required for this patch ?
I will correct it, Thanks for catching.
>
>>       /* Print various info about the machine that has been gathered 
>> so far. */
>>       print_system_info();
>>   @@ -938,6 +937,7 @@ void __init setup_arch(char **cmdline_p)
>>       exc_lvl_early_init();
>>       emergency_stack_init();
>>   +    mce_init();
>
> You have to include mce.h to avoid build failure on PPC32.
Sure, thanks
>>       smp_release_cpus();
>>         initmem_init();
>>
