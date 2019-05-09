Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C7184AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 06:51:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4501C200gMzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 14:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45019j5rNdzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 14:50:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45019j5Gxvz8wH1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 14:50:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45019j4yGvz9s7h; Thu,  9 May 2019 14:50:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45019j10w3z9s5c
 for <linuxppc-dev@ozlabs.org>; Thu,  9 May 2019 14:50:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x494gUwT047558
 for <linuxppc-dev@ozlabs.org>; Thu, 9 May 2019 00:50:15 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2scbg54963-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 09 May 2019 00:50:14 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Thu, 9 May 2019 05:50:13 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 05:50:10 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x494o8UG47120422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 04:50:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D64B25205A;
 Thu,  9 May 2019 04:50:08 +0000 (GMT)
Received: from [9.204.131.20] (unknown [9.204.131.20])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0DDEA5204E;
 Thu,  9 May 2019 04:50:06 +0000 (GMT)
Subject: Re: [PATCH v2 15/16] powernv/fadump: consider f/w load area
To: mahesh@linux.vnet.ibm.com
References: <155541065470.812.7120798773144842076.stgit@hbathini.in.ibm.com>
 <155541097094.812.18328895014763068053.stgit@hbathini.in.ibm.com>
 <20190507171331.p5wwzc3asvpkltxb@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Thu, 9 May 2019 10:20:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507171331.p5wwzc3asvpkltxb@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050904-0020-0000-0000-0000033AC6C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050904-0021-0000-0000-0000218D6A98
Message-Id: <9adff2bf-71f8-ecec-ab33-c0983937c2d6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090030
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 07/05/19 10:43 PM, Mahesh J Salgaonkar wrote:
> On 2019-04-16 16:06:13 Tue, Hari Bathini wrote:
>> OPAL loads kernel & initrd at 512MB offset (256MB size), also exported
>> as ibm,opal/dump/fw-load-area. So, if boot memory size of FADump is
>> less than 768MB, kernel memory to be exported as '/proc/vmcore' would
>> be overwritten by f/w while loading kernel & initrd. To avoid such a
>> scenario, enforce a minimum boot memory size of 768MB on OPAL platform.
>>
>> Also, skip using FADump if a newer F/W version loads kernel & initrd
>> above 768MB.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump-common.h          |   15 +++++++++++++--
>>   arch/powerpc/kernel/fadump.c                 |    8 ++++++++
>>   arch/powerpc/platforms/powernv/opal-fadump.c |   23 +++++++++++++++++++++++
>>   3 files changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
>> index 1bd3aeb..f59fdc7 100644
>> --- a/arch/powerpc/kernel/fadump-common.h
>> +++ b/arch/powerpc/kernel/fadump-common.h
>> @@ -24,14 +24,25 @@
>>   #define RMA_END		(ppc64_rma_size)
>>   
>>   /*
>> + * With kernel & initrd loaded at 512MB (with 256MB size), enforce a minimum
>> + * boot memory size of 768MB to ensure f/w loading kernel and initrd doesn't
>> + * mess with crash'ed kernel's memory during MPIPL.
>> + */
>> +#define OPAL_MIN_BOOT_MEM	(0x30000000UL)
>> +
>> +/*
>>    * On some Power systems where RMO is 128MB, it still requires minimum of
>>    * 256MB for kernel to boot successfully. When kdump infrastructure is
>>    * configured to save vmcore over network, we run into OOM issue while
>>    * loading modules related to network setup. Hence we need additional 64M
>>    * of memory to avoid OOM issue.
>>    */
>> -#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
>> -			+ (0x1UL << 26))
>> +#define PSERIES_MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : \
>> +				 RMA_END) + (0x1UL << 26))
>> +
>> +#define MIN_BOOT_MEM	((fw_dump.fadump_platform ==			\
>> +			 FADUMP_PLATFORM_POWERNV) ? OPAL_MIN_BOOT_MEM :	\
>> +			 PSERIES_MIN_BOOT_MEM)
> Can we hide this behind fadump_ops.get_bootmem_min() instead of common code
> doing platform check ?
>
>>   
>>   /* The upper limit percentage for user specified boot memory size (25%) */
>>   #define MAX_BOOT_MEM_RATIO			4
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index ba26169..3c3adc2 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -582,6 +582,14 @@ int __init fadump_reserve_mem(void)
>>   				ALIGN(fw_dump.boot_memory_size,
>>   							FADUMP_CMA_ALIGNMENT);
>>   #endif
>> +
>> +		if ((fw_dump.fadump_platform == FADUMP_PLATFORM_POWERNV) &&
>> +		    (fw_dump.boot_memory_size < OPAL_MIN_BOOT_MEM)) {
> and here too.. fadump_ops.validate_bootmem_size() ? push platform specific
> stuff behind fadump_ops.

Actually, it would be fine to make this check for both platforms.
So, fadump_ops.get_bootmem_min() callback can be used at both places, I guess..

- Hari

