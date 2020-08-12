Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D7A2426BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:30:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRNF90KthzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:30:37 +1000 (AEST)
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
 header.s=pp1 header.b=hc4QGi0I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRN9T6nFyzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:27:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C82ee5186387; Wed, 12 Aug 2020 04:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B1Oe1HC/0IUw4RjFbrau4oSXoEceQuy50/L4njwRMC0=;
 b=hc4QGi0IR5/i2UBfp3reo5ZnEZSCFkTFVq5CBJfv5FD5Dfj8/Ck4tT4BEiS5NYSOMcJI
 tCPsH8vEHF+JNN5yGYOC/lHoPzAAQWU/F0vL1HLkU0kNaT3h+SpYXZRGFzmMyYYRNNpd
 FI7UXxXi5K9eyIDEZGWZacLf8FfVXDUHoYjSoZx4MRlabIY+qGP6FUrS7+qBa3r/crNe
 NulQH4lgabS40GD5+xrUXMPyqPwiNi9QtRYShvMNbID4R/g68mTCFNqi4HZKmv+dzcR/
 D/Ik0FFe7z2m3AR9kvikXsPHZwBx9BWtMVatS9gnQ3Mv+r6KRcYLfsNQc+yk8sSsy1zA pA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32uytmkxvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 04:27:14 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C8PN3p014653;
 Wed, 12 Aug 2020 08:27:12 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 32skp7tkbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 08:27:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C8R9r224314198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 08:27:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 869A7A4057;
 Wed, 12 Aug 2020 08:27:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6506AA405B;
 Wed, 12 Aug 2020 08:27:08 +0000 (GMT)
Received: from [9.85.71.109] (unknown [9.85.71.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 08:27:08 +0000 (GMT)
Subject: Re: [PATCH 01/16] powerpc/mm: Add DEBUG_VM WARN for pmd_clear
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <8b951ede-d779-d18f-b2b8-d09f94af6822@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <c75f1d74-c3d6-39fa-83c7-a6b08dc469eb@linux.ibm.com>
Date: Wed, 12 Aug 2020 13:57:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b951ede-d779-d18f-b2b8-d09f94af6822@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On 8/12/20 1:16 PM, Anshuman Khandual wrote:
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> With the hash page table, the kernel should not use pmd_clear for clearing
>> huge pte entries. Add a DEBUG_VM WARN to catch the wrong usage.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
> This particular change is very much powerpc specific. Hence please drop it from
> the series which otherwise changes the page table test. Also, this series which
> is not a RFC, still lacks a proper cover letter with diff stats, tree/tag on
> which this applies, summary about the proposal etc. All those information will
> be helpful in reviewing this series better. For now, assuming that this applies
> cleanly on current master branch. But again, please do include a cover letter
> in the next version.


The patch series include all sort of fixes. There is no special theme 
for the series. So all that the cover letter would have is "fixes to 
make debug_vm_pgtable work on ppc64"

I tried to keep each patch simpler explaining why the current code is 
wrong.


> 
>> ---
>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 6de56c3b33c4..079211968987 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -868,6 +868,13 @@ static inline bool pte_ci(pte_t pte)
>>   
>>   static inline void pmd_clear(pmd_t *pmdp)
>>   {
>> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
>> +		/*
>> +		 * Don't use this if we can possibly have a hash page table
>> +		 * entry mapping this.
>> +		 */
>> +		WARN_ON((pmd_val(*pmdp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
>> +	}
>>   	*pmdp = __pmd(0);
>>   }
>>   
>> @@ -916,6 +923,13 @@ static inline int pmd_bad(pmd_t pmd)
>>   
>>   static inline void pud_clear(pud_t *pudp)
>>   {
>> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
>> +		/*
>> +		 * Don't use this if we can possibly have a hash page table
>> +		 * entry mapping this.
>> +		 */
>> +		WARN_ON((pud_val(*pudp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
>> +	}
>>   	*pudp = __pud(0);
>>   }
>>   
>>

-aneesh

