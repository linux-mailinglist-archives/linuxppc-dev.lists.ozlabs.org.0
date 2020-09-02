Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109825AB81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:55:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhP7H6XK0zDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 22:55:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hWQr8MzC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhP4c3PZ0zDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 22:53:18 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082CgNZl112476; Wed, 2 Sep 2020 08:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HaQXEeOyF7wqvN2uijbpakjvCp3PPYRRihGlyDTCsC0=;
 b=hWQr8MzCcneBfRwMx+bCW4UJzQ0Vc3BNmGtCp1elBOpS2k+EIKVKkgbuUZDrziIYHkrL
 aKY9f4enWhExUSmX0WaDQpK9uxBxROeljc/4xpmJFklDqSF2iVaICFh6abbG4U+3noEJ
 jNvTM3tWiQyAXQjeeyXiGReyOM3+ILiNHmMUDLiN+yr/B4Ttq4bJ8DE7ueZUstVPbAHa
 ZciKnyFegluMvXj+5DxK1CqpePRrawD94dlU+kQqAwKtwd9aLzDuTneOcuPVoyW82Ptu
 kGjAs4RuDzY7IBxoOdSTEg2OfomCazehbH01s9R3vqdj4RxxlLzvkG26cnTgrb/+XhWe BQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33abms89w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 08:53:08 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082ClDco000500;
 Wed, 2 Sep 2020 12:53:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8cqre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 12:53:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 082CpXqB35062242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 12:51:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC6C9A4051;
 Wed,  2 Sep 2020 12:53:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCD81A4040;
 Wed,  2 Sep 2020 12:53:03 +0000 (GMT)
Received: from [9.199.61.124] (unknown [9.199.61.124])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 12:53:03 +0000 (GMT)
Subject: Re: [PATCH v4 04/13] mm/debug_vm_pgtables/hugevmap: Use the arch
 helper to identify huge vmap support.
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-5-aneesh.kumar@linux.ibm.com>
 <7e88e090-e3af-b26c-ca65-3d98e8f81eb3@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <f8fda540-9380-8317-b4f0-0db255a43f39@linux.ibm.com>
Date: Wed, 2 Sep 2020 18:23:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7e88e090-e3af-b26c-ca65-3d98e8f81eb3@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020114
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/2/20 6:10 PM, Christophe Leroy wrote:
> 
> 
> Le 02/09/2020 à 13:42, Aneesh Kumar K.V a écrit :
>> ppc64 supports huge vmap only with radix translation. Hence use arch 
>> helper
>> to determine the huge vmap support.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 00649b47f6e0..4c73e63b4ceb 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -28,6 +28,7 @@
>>   #include <linux/swapops.h>
>>   #include <linux/start_kernel.h>
>>   #include <linux/sched/mm.h>
>> +#include <linux/io.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/tlbflush.h>
>> @@ -206,11 +207,12 @@ static void __init pmd_leaf_tests(unsigned long 
>> pfn, pgprot_t prot)
>>       WARN_ON(!pmd_leaf(pmd));
>>   }
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>>   static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, 
>> pgprot_t prot)
>>   {
>>       pmd_t pmd;
>> -    if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
>> +    if (!arch_ioremap_pmd_supported())
> 
> What about moving ioremap_pmd_enabled() from mm/ioremap.c to some .h, 
> and using it ?
> As ioremap_pmd_enabled() is defined at all time, no need of #ifdef
> 

yes. This was discussed earlier too. IMHO we should do that outside this 
series. I guess figuring out ioremap_pmd/pud support can definitely be 
simplified. With a generic version like

#ifndef arch_ioremap_pmd_supported
static inline bool arch_ioremap_pmd_supported(void)
{
	return false;
}
#endif


>>           return;
>>       pr_debug("Validating PMD huge\n");
>> @@ -224,6 +226,9 @@ static void __init pmd_huge_tests(pmd_t *pmdp, 
>> unsigned long pfn, pgprot_t prot)
>>       pmd = READ_ONCE(*pmdp);
>>       WARN_ON(!pmd_none(pmd));
>>   }
>> +#else /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>> +static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, 
>> pgprot_t prot) { }
>> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>   static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t 
>> prot)
>>   {
>> @@ -320,11 +325,12 @@ static void __init pud_leaf_tests(unsigned long 
>> pfn, pgprot_t prot)
>>       WARN_ON(!pud_leaf(pud));
>>   }
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>>   static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, 
>> pgprot_t prot)
>>   {
>>       pud_t pud;
>> -    if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
>> +    if (!arch_ioremap_pud_supported())
> 
> What about moving ioremap_pud_enabled() from mm/ioremap.c to some .h, 
> and using it ?
> As ioremap_pud_enabled() is defined at all time, no need of #ifdef
> 
>>           return;
>>       pr_debug("Validating PUD huge\n");
>> @@ -338,6 +344,10 @@ static void __init pud_huge_tests(pud_t *pudp, 
>> unsigned long pfn, pgprot_t prot)
>>       pud = READ_ONCE(*pudp);
>>       WARN_ON(!pud_none(pud));
>>   }
>> +#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
>> +static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, 
>> pgprot_t prot) { }
>> +#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
>> +
>>   #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>>   static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) 
>> { }
>>   static void __init pud_advanced_tests(struct mm_struct *mm,
>>
> 
> Christophe

