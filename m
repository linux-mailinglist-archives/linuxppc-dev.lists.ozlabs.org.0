Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B75981A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 12:48:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7hSX1d5qz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 20:48:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAdesbg7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAdesbg7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7hR82vSQz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 20:47:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAKagT016592;
	Thu, 18 Aug 2022 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sh3nHt6+Q3MAdAbTG427vB3BkMLH+7nhF4Uq/9+KoIs=;
 b=JAdesbg7w42fBl8NF/JexM3MV85woI/2Vs7QKab44o+vzJDvbN07pQsHoHPPt/VlG+c1
 oAYJIh8Ckk9MnAlAg5Auii3UXvqoFRz33enlq7jAv8QdMteywK3UxOzsdwOrI4Sj6o4r
 a2O6TakG7u/VD4m0R572qHpvdJqsrjQgDm6SuLFP7v8Hv+1hWZX7h7uZpmDRPGS1ge/0
 Qh+Ha8Fu1yiuOG2gzDkqJzF3izP9dizSqJ2NxBAYcWidYFxnctCQc77x/ZJfod7AxZcp
 Lxd70i9hbyPSo1lmkrFP6YgneB4eWmShb5BEwTrrk44K4n7wsHW8E0xB9mqSDIh0B6ln zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1kk5gsj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:56 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27IALZSE024150;
	Thu, 18 Aug 2022 10:46:55 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1kk5gsgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IAbEG8022884;
	Thu, 18 Aug 2022 10:46:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8wr1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IAkpqt22872514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 10:46:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28DAF11C04C;
	Thu, 18 Aug 2022 10:46:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F0EC11C04A;
	Thu, 18 Aug 2022 10:46:48 +0000 (GMT)
Received: from [9.109.198.207] (unknown [9.109.198.207])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 10:46:47 +0000 (GMT)
Message-ID: <6a0cf3a8-2153-1bed-314e-f9ba2bc74400@linux.vnet.ibm.com>
Date: Thu, 18 Aug 2022 16:16:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-3-sv@linux.ibm.com>
 <0d2438e6-9aaa-a9c9-9613-b833771c9362@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <0d2438e6-9aaa-a9c9-9613-b833771c9362@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A_Y7W3m5I6hDVsHvhdTm86i73LgN9WCX
X-Proofpoint-GUID: 1UlT2cZHRzl3S-l-n24Y2mEN7gjyHi1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_11,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180036
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 10/08/22 14:01, Christophe Leroy wrote:
>
> Le 08/08/2022 à 13:48, Sathvika Vasireddy a écrit :
>> Since we need an alignment of 4 bytes, override
>> __ALIGN() and __ALIGN_STR() accordingly.
> Why/When do we now need an alignment of 4 bytes ? Please explain the
> reason in the commit message.
Powerpc instructions must be word-aligned. Currently, there is an 
alignment of 16 bytes (by default),
and it is much more than what is required for powerpc (4 bytes).

The default expansion of these macros are:
#define __ALIGN        .align 4,0x90
#define __ALIGN_STR    ".align 4,0x90"

Since Powerpc Linux does not require a 16 byte alignment, override 
_ALIGN() and __ALIGN_STR() macros
to use required 4 byte alignment.

Sure, I'll explain the reason in commit message.
>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/linkage.h | 4 ++++
>>    1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
>> index b71b9582e754..8df88fe61438 100644
>> --- a/arch/powerpc/include/asm/linkage.h
>> +++ b/arch/powerpc/include/asm/linkage.h
>> @@ -2,8 +2,12 @@
>>    #ifndef _ASM_POWERPC_LINKAGE_H
>>    #define _ASM_POWERPC_LINKAGE_H
>>    
>> +#include <linux/stringify.h>
>>    #include <asm/types.h>
>>    
>> +#define __ALIGN			.align 2
>> +#define __ALIGN_STR		__stringify(__ALIGN)
> Why do you need to use __stringify ?
>
> ARM64 does:
>
> #define __ALIGN		.align 2
> #define __ALIGN_STR	".align 2"
We could use either __stringify() or quotes, both do the same thing.
While arm64 does ".align 2",

x86 does:
#define __ALIGN         .p2align 4, 0x90
#define __ALIGN_STR     __stringify(__ALIGN)
>
>
>
>
>> +
>>    #ifdef CONFIG_PPC64_ELF_ABI_V1
>>    #define cond_syscall(x) \
>>    	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\

Thanks for reviewing!

- Sathvika

