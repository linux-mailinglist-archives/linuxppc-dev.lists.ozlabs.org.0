Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC202426B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:28:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRNBS5gT6zDqbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:28:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cldNR2Vi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRN7k2jC4zDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:25:53 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C878TX113530; Wed, 12 Aug 2020 04:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XXl4uESg4yZpGjEtRQm+BKa6av55p6yglVNuYhf/pVk=;
 b=cldNR2ViKu32vYQoPYzYhi1ukktQMElLED7GpHmzxKtGrQgLlkl5drE60o0A70AyeLA0
 gazR8wTfybo276NIqi2c9jv8/4XkDhTqMnSepCKp+gUPRVNkOiOrm7/c+swu+HnGVsoM
 0nS2g9U+lwVXzxmUARXsiTHcmt6BFZOvFPG2F6DIETpAY7Y2ATN7TvOqkWaU/YtdS9w2
 esbXLvuZiqfGDf41c8ap9UJBhX0LwolHYwskp0LMa5BWd4JYkeonofXVzbSRQyvJJ9jN
 9NO7Z1W1maFvII8aBw060EoiAn7a+mwnCgBeO4gexpp6aoRMNm/Hxtm9eUsphOG+BHpP AA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32uya7krdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 04:25:42 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C8GXSZ028134;
 Wed, 12 Aug 2020 08:25:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp846jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 08:25:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C8PbPb28311982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 08:25:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60DF7A4053;
 Wed, 12 Aug 2020 08:25:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D53AA404D;
 Wed, 12 Aug 2020 08:25:36 +0000 (GMT)
Received: from [9.85.71.109] (unknown [9.85.71.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 08:25:36 +0000 (GMT)
Subject: Re: [PATCH 02/16] debug_vm_pgtable/ppc64: Avoid setting top bits in
 radom value
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-2-aneesh.kumar@linux.ibm.com>
 <fcb44f1d-4131-9135-512e-11a5c00abcd9@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <b92fea41-ce31-4915-fdc6-56631222df18@linux.ibm.com>
Date: Wed, 12 Aug 2020 13:55:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fcb44f1d-4131-9135-512e-11a5c00abcd9@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_01:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120058
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/20 1:42 PM, Anshuman Khandual wrote:
> 
> 
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
>> random value.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 086309fb9b6f..4c32063a8acf 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -45,9 +45,12 @@
>>    * pxx_clear() because of how dynamic page table folding works on s390. So
>>    * while loading up the entries do not change the lower 4 bits. It does not
>>    * have affect any other platform.
>> + *
>> + * Also avoid the 62nd bit on ppc64 that is used to mark a pte entry.
>>    */
> 
> Please move and fold the above line with the existing paragraph.
> 
>>   #define S390_MASK_BITS	4
>> -#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
>> +#define PPC_MASK_BITS	2
> 
> s/PPC/PPC64/
> 
>> +#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1 - PPC_MASK_BITS, S390_MASK_BITS)
>>   #define RANDOM_NZVALUE	GENMASK(7, 0)
>>   
>>   static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
>>
> 
> With this change, RANDOM_ORVALUE will be (0x3ffffffffffffff0) which discards
> both bit 63 and 62. If only bit 62 is to be avoided for ppc64 the mask should
> be (0xbffffffffffffff0) instead. The following change on this patch should do
> the trick.
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index eb059fef89c2..1499181fb0e9 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -45,13 +45,13 @@
>    * entry type. But these bits might affect the ability to clear entries with
>    * pxx_clear() because of how dynamic page table folding works on s390. So
>    * while loading up the entries do not change the lower 4 bits. It does not
> - * have affect any other platform.
> - *
> - * Also avoid the 62nd bit on ppc64 that is used to mark a pte entry.
> + * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
> + * used to mark a pte entry.
>    */
> -#define S390_MASK_BITS 4
> -#define PPC_MASK_BITS  2
> -#define RANDOM_ORVALUE GENMASK(BITS_PER_LONG - 1 - PPC_MASK_BITS, S390_MASK_BITS)
> +#define S390_SKIP_MASK GENMASK(3, 0)
> +#define PPC64_SKIP_MASK        GENMASK(62, 62)
> +#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
> +#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
>   #define RANDOM_NZVALUE GENMASK(7, 0)
>   
>   static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
> 

I will switch to this.

-aneesh
