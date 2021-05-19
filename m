Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7F388623
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 06:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlL1t2Gygz30BR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuHRfUvU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KuHRfUvU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlL1N5nsyz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 14:46:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J4X5GU180940; Wed, 19 May 2021 00:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=uMu4Zt3VLKqG7ISF1FyL53KTvJ0ivy4Qtu+wMipQtK0=;
 b=KuHRfUvUoSrbUXKW+6yCYEjVOwfsrP+Irt2HvztYkcuRkn46nUJAUedAgJ0BUAdz+/Ks
 74zsr5blSEYkEKBpQcgB1ngseaFUppK0qE9Fx7NSfedgSxFu+V1LQVDf5gX+MhGkOtxl
 06ET2+K7TVM+fdQgHUJMupwUSc0/KzlobG6qFokAshMPex7C9au1BCicNZz+gguPUeIJ
 5JsSY/aHdqbfOEnvD8Oftj4Q/69NWCLx0whmk7bNlqnZl1VWN1fOuIMGN5b3CTTI0f53
 EsaX6//gzaaI5GdFENzAFn0NL2cOBMMQ1n0xIHw82R6//AUiTDFPcR6RD38J3BCdTdLQ BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mry3k9w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:46:14 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14J4ZTLD193638;
 Wed, 19 May 2021 00:46:13 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mry3k9w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:46:13 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J4go2G002317;
 Wed, 19 May 2021 04:46:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 38j5x9c8he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 04:46:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14J4kCGU29295040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 04:46:12 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F6A52805E;
 Wed, 19 May 2021 04:46:12 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FDCD2806E;
 Wed, 19 May 2021 04:46:09 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.75.184])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 04:46:09 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
In-Reply-To: <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
Date: Wed, 19 May 2021 10:16:07 +0530
Message-ID: <87mtsrqqk0.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BGelQXxG50I6NdXuLuxlAdFvU8MINFSg
X-Proofpoint-ORIG-GUID: 5x1SUHmSiol1fqSoUdimuK6owJNcTpd1
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_01:2021-05-18,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190033
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:

> Hi Aneesh,
>
> On Thu, Apr 22, 2021 at 11:13:17AM +0530, Aneesh Kumar K.V wrote:
>> pmd/pud_populate is the right interface to be used to set the respective
>> page table entries. Some architectures like ppc64 do assume that set_pmd/pud_at
>> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
>> PTE here, use the pmd/pud_populate interface.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  mm/mremap.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>> 
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index ec8f840399ed..574287f9bb39 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -26,6 +26,7 @@
>>  
>>  #include <asm/cacheflush.h>
>>  #include <asm/tlbflush.h>
>> +#include <asm/pgalloc.h>
>>  
>>  #include "internal.h"
>>  
>> @@ -257,9 +258,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>  	pmd_clear(old_pmd);
>>  
>>  	VM_BUG_ON(!pmd_none(*new_pmd));
>> +	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
>>  
>> -	/* Set the new pmd */
>> -	set_pmd_at(mm, new_addr, new_pmd, pmd);
>>  	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
>>  	if (new_ptl != old_ptl)
>>  		spin_unlock(new_ptl);
>> @@ -306,8 +306,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>>  
>>  	VM_BUG_ON(!pud_none(*new_pud));
>>  
>> -	/* Set the new pud */
>> -	set_pud_at(mm, new_addr, new_pud, pud);
>> +	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
>>  	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
>>  	if (new_ptl != old_ptl)
>>  		spin_unlock(new_ptl);
>> -- 
>> 2.30.2
>> 
>> 
>
> This commit causes my WSL2 VM to close when compiling something memory
> intensive, such as an x86_64_defconfig + CONFIG_LTO_CLANG_FULL=y kernel
> or LLVM/Clang. Unfortunately, I do not have much further information to
> provide since I do not see any sort of splat in dmesg right before it
> closes and I have found zero information about getting the previous
> kernel message in WSL2 (custom init so no systemd or anything).
>
> The config file is the stock one from Microsoft:
>
> https://github.com/microsoft/WSL2-Linux-Kernel/blob/a571dc8cedc8e0e56487c0dc93243e0b5db8960a/Microsoft/config-wsl
>
> I have attached my .config anyways, which includes CONFIG_DEBUG_VM,
> which does not appear to show anything out of the ordinary. I have also
> attached a dmesg just in case anything sticks out. I am happy to provide
> any additional information or perform additional debugging steps as
> needed.
>

Can you try this change?

modified   mm/mremap.c
@@ -279,7 +279,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	pmd_clear(old_pmd);
 
 	VM_BUG_ON(!pmd_none(*new_pmd));
-	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
+	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
 
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);

