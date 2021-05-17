Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A7382AAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:15:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkGkw6XnRz2yys
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 21:15:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qtfVVryU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qtfVVryU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkGkN2rkWz2yWJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 21:14:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HB4AVp001346; Mon, 17 May 2021 07:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CUivNlSxPOBNubertg4o8t2Hi44dkf05iTEOfOjvAVo=;
 b=qtfVVryUzcR935aBM4jA8/Dh/TfBuZU5TJ+2+A6ZBG/BOhW2+uPUDcq3pVoKIZzqtCF1
 VBu6Hpwaqlcg3IPWNd5Gz+oHlniE+aRRSTWS2eNlV613T/QMU/EwMiRGFx9MOaZZVzYs
 +Nw0PXjd396HYSV2N+dP36JjVJ/uvTyU1f2qEPiESaGLRDbFtGnAkzqfPY/UerydjXxV
 YmZ1cEpGkXJ9V5iZVZJzffsSW1a5GlntRYSuOJHXxXvOo0zaIGjx7oDp6gAeOOFVVNhq
 t8UWLGWT9UCryKLcbPhysFxsXXcXFIeDM9r2QslRdqELs+bHRcsWgrRdoa84shO/oVZs Pw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38kna7kqan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 07:14:26 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HBD3Hp031553;
 Mon, 17 May 2021 11:14:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 38j5x80e0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 11:14:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14HBDs5Q21954852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 11:13:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B814E11C04A;
 Mon, 17 May 2021 11:14:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A4B011C04C;
 Mon, 17 May 2021 11:14:21 +0000 (GMT)
Received: from [9.199.40.240] (unknown [9.199.40.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 11:14:20 +0000 (GMT)
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
 <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
 <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
 <c6372bac-c8c4-6f67-45e9-4deb062d303e@arm.com>
 <e0d2093d-56ec-5c7a-6887-22eecc5142b7@linux.ibm.com>
 <18508d23-3884-af84-ce8f-65b31ac83192@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ec9f98ea-8d5e-e8eb-6ba5-e3fbb2440cd8@linux.ibm.com>
Date: Mon, 17 May 2021 16:44:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <18508d23-3884-af84-ce8f-65b31ac83192@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3DyQyS_2rp4at8BQX773AEodkeNZ7YWW
X-Proofpoint-ORIG-GUID: 3DyQyS_2rp4at8BQX773AEodkeNZ7YWW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_03:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170079
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

On 5/17/21 4:23 PM, Anshuman Khandual wrote:
> 
> 
> On 5/17/21 1:14 PM, Aneesh Kumar K.V wrote:
>> On 5/17/21 12:55 PM, Anshuman Khandual wrote:
>>>
>>>
>>> On 5/17/21 11:25 AM, Aneesh Kumar K.V wrote:
>>>> On 5/17/21 11:17 AM, Christophe Leroy wrote:
>>>>> +aneesh
>>>>> +linuxppc-dev list
>>>>>
>>>>> Le 17/05/2021 à 07:44, Anshuman Khandual a écrit :
>>>>>> Hello Christophe,
>>>>>>
>>>>>> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
>>>>>> aware about this. From the error log, it failed explicitly on 4K page
>>>>>> size hash config.
>>>>>>
>>>>>> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>>>>>> {
>>>>>>            BUG();        ------> Failed
>>>>>>            return pmd;
>>>>>> }
>>>>>>
>>>>>> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
>>>>>> {
>>>>>>            if (radix_enabled())
>>>>>>                    return radix__pmd_mkhuge(pmd);
>>>>>>            return hash__pmd_mkhuge(pmd);
>>>>>> }
>>>>>>
>>>>>> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>>>>> {
>>>>>>            unsigned long pmdv;
>>>>>>
>>>>>>            pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>>>>>>
>>>>>>            return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
>>>>>> }
>>>>>>
>>>>>> It seems like on powerpc, where pfn_pmd() makes a huge page but which
>>>>>> is not supported on 4K hash config thus triggering the BUG(). But all
>>>>>> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
>>>>>> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
>>>>>> not directly make a huge page on other platforms.
>>>>>>
>>>>>> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
>>>>>> THP helpers has BUG() or 0 which indicates THP might not be supported
>>>>>> on 4K page size hash config ?
>>>>>>
>>>>>> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
>>>>>> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
>>>>>> platforms which I assume includes 4K page size hash config as well.
>>>>>>
>>>>>> Is THP some how getting enabled on this 4K page size hash config where
>>>>>> it should not be (thus triggering the BUG) ? OR am I missing something
>>>>>> here.
>>>>>>
>>>>>
>>>>
>>>> We should put those  pfn_pmd()  and pfn_pud() after
>>>>
>>>>       if (!has_transparent_hugepage())
>>>>           return;
>>>>
>>>>
>>>> On hash with 4K page size, we can't support leaf page table entry and PMD and PUD level. Hence we don't support THP for them.
>>>
>>> But could CONFIG_TRANSPARENT_HUGEPAGE be enabled on such configs ?
>>> Otherwise, wondering how the BUG() just got triggered there.
>>>
>>
>> yes. We do support THP with radix translation and 4K page size.
> 
> I was actually wondering about whether 4K page size in hash config
> supports THP and could enable CONFIG_TRANSPARENT_HUGEPAGE ? But as
> there is a BUG() trigger on hash__pmd_mkhuge(), it seems like THP
> config should not have been enabled for such platforms but it does
> for some reason. Could not we disable it ?
> 

Hash is a translation mode which is not build time selected. Rather it 
is runtime selected. Same kernel can boot into either hash or radix 
translation. We don't support THP with 4K pagesize with hash 
translation.But the same kernel when booted in radix translation mode 
will support THP.

-aneesh
