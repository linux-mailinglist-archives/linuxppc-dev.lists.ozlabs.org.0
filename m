Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE13437B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 05:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3gm10jCSz304X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:01:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JUNCD2Gp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JUNCD2Gp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3glW65gRz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 15:00:54 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M3X1ok075170; Mon, 22 Mar 2021 00:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YGqqlRic/6maE5ZzLjwihChU+zgQl7RjBkW207Q/pZA=;
 b=JUNCD2Gp8nSusvw5qLAJ3qSgqmClppnslO3NP/g8w8zHH4qtYXKVKWV20DR6keMSOuAx
 4DsTE2D2Wnw8LYBQ36yP3VCXXGFShU/Qeoi6D1/kpHuI986BcxLQhcz8gLOlhb3IHzNb
 SHn2/EC7bKxTIi2MELQzONA6bm5iCTKMvnxi67H6SzPpEqB17HRP6fLf3CERXcxDK31V
 AY5vwiy291FXdPgRqIzlH4qcZhghVBKlkivki9MkAm1MSTfgJ0+72EBNBfY0Hi/w4Eaq
 X+l9mDWXqPSAjBba+XGT0QV5RmVaEfPxCGkRJIJYpqqfCG0xc685kAUdXdgTUwrH78ky Zw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx49kk18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 00:00:46 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12M3vCuL005352;
 Mon, 22 Mar 2021 04:00:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmhxk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 04:00:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12M40fGr51118438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 04:00:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A570AE04D;
 Mon, 22 Mar 2021 04:00:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E72EBAE067;
 Mon, 22 Mar 2021 04:00:40 +0000 (GMT)
Received: from [9.199.62.230] (unknown [9.199.62.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 04:00:40 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE
 support on powerpc"
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
 <87lfak54lx.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <27846653-67e9-7516-3730-00651def1942@linux.ibm.com>
Date: Mon, 22 Mar 2021 09:30:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87lfak54lx.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_01:2021-03-19,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220025
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/21 6:42 AM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> This reverts commit 675bceb097e6 ("powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc")
>>
>> All the related issues are fixed by the series
>> https://lore.kernel.org/linux-mm/20200902114222.181353-1-aneesh.kumar@linux.ibm.com
> 
> Was that series merged?
> 
> If so this seems like this could be tagged as a Fix for the last commit
> in that series.

commit f14312e1ed1e ("mm/debug_vm_pgtable: avoid doing memory allocation 
with pgtable_t mapped.")


> 
> cheers
> 
>> Hence enable it back
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
>>   arch/powerpc/Kconfig                                           | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> index 7aff505af706..fa83403b4aec 100644
>> --- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> @@ -21,7 +21,7 @@
>>       |       nios2: | TODO |
>>       |    openrisc: | TODO |
>>       |      parisc: | TODO |
>> -    |     powerpc: | TODO |
>> +    |     powerpc: |  ok  |
>>       |       riscv: |  ok  |
>>       |        s390: |  ok  |
>>       |          sh: | TODO |
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 386ae12d8523..982c87d5c051 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -119,6 +119,7 @@ config PPC
>>   	#
>>   	select ARCH_32BIT_OFF_T if PPC32
>>   	select ARCH_HAS_DEBUG_VIRTUAL
>> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>>   	select ARCH_HAS_ELF_RANDOMIZE
>>   	select ARCH_HAS_FORTIFY_SOURCE
>> -- 
>> 2.30.2

