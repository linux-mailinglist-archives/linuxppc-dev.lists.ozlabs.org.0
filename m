Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC04B24CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 12:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwBnt6Ntvz3cRF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 22:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=biFL3k/x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=biFL3k/x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwBnB70gsz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 22:52:30 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B9TK68006200; 
 Fri, 11 Feb 2022 11:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r39KjGFYeZYwVJPkXzwSRLfqzvNS7gYWMV9ipUzI6Fw=;
 b=biFL3k/xmqzF53ra3qMpHdLlXXgrWfJGL6HuIXICGHrl95In0Qh/2lO+az7mbT/FGhVP
 3CTvVXG/pRUaGefIcamMcdKGAtw259EMAqlaS03S0Ou1N+Ar80AtieNBtl22J+JC1xzo
 uobcjPtPIH6F2K+/alMIqkTOOxEKNcQP4PDdwHx3rNFGbqL7EVdAgFrtIKBhOXBnRH64
 4qYLRRVEmwtB7TMpGKQOAhOeJatkOgkDmg4/3S/zJnSjoFeK4bvo/LoZ4QXOK71yLhiU
 fq/NKl7FMTCzBb+jN55fgT30X3Z77o9kmiI+BYZQR04kDWzJdtGpc3NsZxtjdI4r9iPz WQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e5n6xany8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:52:21 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BBh3h8014897;
 Fri, 11 Feb 2022 11:52:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3e1gva99r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:52:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BBqHWl40567128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 11:52:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75F0E5204F;
 Fri, 11 Feb 2022 11:52:17 +0000 (GMT)
Received: from [9.43.112.9] (unknown [9.43.112.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 148A252051;
 Fri, 11 Feb 2022 11:52:14 +0000 (GMT)
Message-ID: <27a71056-489a-4099-b094-64766bea84db@linux.ibm.com>
Date: Fri, 11 Feb 2022 17:22:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
References: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
 <YgY7lDToiQ0pM6U6@kernel.org>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <YgY7lDToiQ0pM6U6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uP_lgHUcSyk14ev7v3z0Qc0YmgeID5j8
X-Proofpoint-GUID: uP_lgHUcSyk14ev7v3z0Qc0YmgeID5j8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110066
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
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/22 16:03, Mike Rapoport wrote:
> On Fri, Feb 11, 2022 at 12:03:28PM +0530, Aneesh Kumar K.V wrote:
>> Keep it simple by using a #define and limiting hugepage size to 2M.
>> This keeps the test simpler instead of dynamically finding the page size
>> and huge page size.
>>
>> Without this tests are broken w.r.t reading /proc/self/pagemap
>>
>> 	if (pread(pagemap_fd, ent, sizeof(ent),
>> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>> 		err(2, "read pagemap");
>>
>> Cc: Shuah Khan <shuah@kernel.org>
>> Cc: linux-kselftest@vger.kernel.org
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   tools/testing/selftests/vm/ksm_tests.c        | 9 ++++++++-
>>   tools/testing/selftests/vm/transhuge-stress.c | 9 ++++++++-
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
>> index 1436e1a9a3d3..cae72872152b 100644
>> --- a/tools/testing/selftests/vm/ksm_tests.c
>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>> @@ -22,7 +22,14 @@
>>   #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>   #define MB (1ul << 20)
>>   
>> -#define PAGE_SHIFT 12
>> +#ifdef __powerpc64__
>> +#define PAGE_SHIFT	16
>> +#else
>> +#define PAGE_SHIFT	12
>> +#endif
> 
> Page size can be other than 4096 for other configurations as well. And even
> on ppc64 it's not necessarily 64k.
> 

But most common test config is with 64K page size.

> Ideally page size in selftests/vm should be sysconf(_SC_PAGESIZE)


yes. As explained in commit message, the idea was to keep it simpler.

"Keep it simple by using a #define and limiting hugepage size to 2M.
This keeps the test simpler instead of dynamically finding the page size
and huge page size.

Without this tests are broken w.r.t reading /proc/self/pagemap"

We can definitely look at updating multiple tests in selftest/vm to work 
with dynamic value of pagesize and huagepage size. But that can be 
outside this patch?

> 
>> +/*
>> + * On ppc64 this will only work with radix 2M hugepage size
>> + */
>>   #define HPAGE_SHIFT 21
>>   
>>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
>> index 5e4c036f6ad3..b1f8d98355c5 100644
>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>> @@ -16,7 +16,14 @@
>>   #include <string.h>
>>   #include <sys/mman.h>
>>   
>> -#define PAGE_SHIFT 12
>> +#ifdef __powerpc64__
>> +#define PAGE_SHIFT	16
>> +#else
>> +#define PAGE_SHIFT	12
>> +#endif
>> +/*
>> + * On ppc64 this will only work with radix 2M hugepage size
>> + */
>>   #define HPAGE_SHIFT 21
>>   
>>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>> -- 
>> 2.34.1
>>
>>
> 

