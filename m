Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46662FFC70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 07:07:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMTLj46rvzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 17:07:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GmN0+LOG; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMTK42Xf8zDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 17:05:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10M64B0P139304; Fri, 22 Jan 2021 01:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cXLkfam0tmkyPKeqC0NPluxiPQatdNL9xY4teNfloBs=;
 b=GmN0+LOGfQCvH5Sgc9IAx8VfV2+d9awWcYrkF3ghCYnJdJhBFqDIc9tp1BeHKLljOkPC
 QBL2g8dgWaxIKXy7dFmQb3XMdh/7fZdMu3YRmchXIzWOf2z/N9WGX3GNZsXDP4bIhxTK
 6NLcKRP4QtgXmwCx6EC78RL076t37Px+ur841j3fLH/yK1FUmi+/KZXuYr/u2pr++Wzx
 XKXh/BkruSaeMc8d9yWA88oAGNmtqxZz7Xc6WYBghs68Zj1MCfxhpOMVJgOtHD6D56RZ
 5g/JpRD3WmVsFEst75QnJcFosTOec/QyQStxLp+4/PD8oG5RBI1bPGRZf4atnWysTZWN 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367qx79ngh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 01:05:53 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10M65INF143557;
 Fri, 22 Jan 2021 01:05:51 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367qx79nef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 01:05:50 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10M5w42V011868;
 Fri, 22 Jan 2021 06:05:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 367k12g8us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 06:05:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10M65hV731719826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 06:05:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374F4A4051;
 Fri, 22 Jan 2021 06:05:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 099ECA4057;
 Fri, 22 Jan 2021 06:05:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.56.167])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jan 2021 06:05:41 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/mce: Remove per cpu variables from MCE handlers
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210115125845.28224-1-ganeshgr@linux.ibm.com>
 <1611028087.3uko7j7l9g.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <7fbb91f3-557e-4400-3182-4e98b0881b1d@linux.ibm.com>
Date: Fri, 22 Jan 2021 11:35:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611028087.3uko7j7l9g.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_02:2021-01-21,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220032
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/19/21 9:28 AM, Nicholas Piggin wrote:

> Excerpts from Ganesh Goudar's message of January 15, 2021 10:58 pm:
>> Access to per-cpu variables requires translation to be enabled on
>> pseries machine running in hash mmu mode, Since part of MCE handler
>> runs in realmode and part of MCE handling code is shared between ppc
>> architectures pseries and powernv, it becomes difficult to manage
>> these variables differently on different architectures, So have
>> these variables in paca instead of having them as per-cpu variables
>> to avoid complications.
> Seems okay.
>
>> Maximum recursive depth of MCE is 4, Considering the maximum depth
>> allowed reduce the size of event to 10 from 100.
> Could you make this a separate patch, with memory saving numbers?
> "Delayed" MCEs are not necessarily the same as recursive (several
> sequential MCEs can occur before the first event is processed).
> But I agree 100 is pretty overboard (as is 4 recursive MCEs really).

Sure.

>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> v2: Dynamically allocate memory for machine check event info
>>
>> v3: Remove check for hash mmu lpar, use memblock_alloc_try_nid
>>      to allocate memory.
>> ---
>>   arch/powerpc/include/asm/mce.h     | 21 ++++++++-
>>   arch/powerpc/include/asm/paca.h    |  4 ++
>>   arch/powerpc/kernel/mce.c          | 76 +++++++++++++++++-------------
>>   arch/powerpc/kernel/setup-common.c |  2 +-
>>   4 files changed, 69 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index e6c27ae843dc..8d6e3a7a9f37 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -204,7 +204,18 @@ struct mce_error_info {
>>   	bool			ignore_event;
>>   };
>>   
>> -#define MAX_MC_EVT	100
>> +#define MAX_MC_EVT	10
>> +
>> +struct mce_info {
>> +	int mce_nest_count;
>> +	struct machine_check_event mce_event[MAX_MC_EVT];
>> +	/* Queue for delayed MCE events. */
>> +	int mce_queue_count;
>> +	struct machine_check_event mce_event_queue[MAX_MC_EVT];
>> +	/* Queue for delayed MCE UE events. */
>> +	int mce_ue_count;
>> +	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
>> +};
>>   
>>   /* Release flags for get_mce_event() */
>>   #define MCE_EVENT_RELEASE	true
>> @@ -233,5 +244,13 @@ long __machine_check_early_realmode_p7(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p8(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p9(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p10(struct pt_regs *regs);
>> +#define get_mce_info() local_paca->mce_info
> I don't think this adds anything. Could you open code it?

ok

> Thanks,
> Nick
