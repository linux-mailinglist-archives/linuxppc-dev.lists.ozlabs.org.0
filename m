Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B56122938
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 11:51:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cZgV5DKMzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 21:51:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cZd741pfzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 21:48:59 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBHAldWZ145136; Tue, 17 Dec 2019 05:48:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwdvndmjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 05:48:46 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBHAmj1j004044;
 Tue, 17 Dec 2019 05:48:45 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwdvndmhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 05:48:45 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBHAe7Df006118;
 Tue, 17 Dec 2019 10:48:44 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 2wvqc6bj7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 10:48:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBHAmiY115073728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 10:48:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0690AE06A;
 Tue, 17 Dec 2019 10:48:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D85AAE05F;
 Tue, 17 Dec 2019 10:48:41 +0000 (GMT)
Received: from [9.204.201.20] (unknown [9.204.201.20])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 10:48:41 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] mm/mmu_gather: Invalidate TLB correctly on batch
 allocation failure and flush
To: Peter Zijlstra <peterz@infradead.org>
References: <20191217071713.93399-1-aneesh.kumar@linux.ibm.com>
 <20191217090914.GX2844@hirez.programming.kicks-ass.net>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3d250b04-a78d-20a7-d41e-50e48e08d1cb@linux.ibm.com>
Date: Tue, 17 Dec 2019 16:18:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217090914.GX2844@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_02:2019-12-16,2019-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=2 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170093
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/17/19 2:39 PM, Peter Zijlstra wrote:
> On Tue, Dec 17, 2019 at 12:47:12PM +0530, Aneesh Kumar K.V wrote:
>> Architectures for which we have hardware walkers of Linux page table should
>> flush TLB on mmu gather batch allocation failures and batch flush. Some
>> architectures like POWER supports multiple translation modes (hash and radix)
>> and in the case of POWER only radix translation mode needs the above TLBI.
>> This is because for hash translation mode kernel wants to avoid this extra
>> flush since there are no hardware walkers of linux page table. With radix
>> translation, the hardware also walks linux page table and with that, kernel
>> needs to make sure to TLB invalidate page walk cache before page table pages are
>> freed.
> 
>> Based on changes from Peter Zijlstra <peterz@infradead.org>
> 
> AFAICT it is all my patch ;-)

Yes. I moved the changes you had to upstream. I can update the From: in 
the next version if you are ok with that?

> 
> Anyway, this commit:
> 
>> More details in
>> commit: d86564a2f085 ("mm/tlb, x86/mm: Support invalidating TLB caches for RCU_TABLE_FREE")
> 
> states that you do an explicit invalidate in __p*_free_tlb(), which, if
> I'm not mistaken is still there:
> 
>    arch/powerpc/include/asm/nohash/pgalloc.h:      tlb_flush_pgtable(tlb, address);
> 

nohash is not really radix. So we still do the tlb flush from the 
pte_free_tlb for nohash and for PPC-radix, we let tlb_table_invalidate 
to flush that.


> Or am I reading this wrong? I'm thinking you can remove that now.
> 
>> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
>> index b2c0be93929d..feea1a09bbce 100644
>> --- a/arch/powerpc/include/asm/tlb.h
>> +++ b/arch/powerpc/include/asm/tlb.h
>> @@ -27,6 +27,10 @@
>>   #define tlb_flush tlb_flush
>>   extern void tlb_flush(struct mmu_gather *tlb);
>>   
>> +#ifdef CONFIG_HAVE_RCU_TABLE_FREE
> /*
>   * PPC-Hash does not use the linux page-tables, so we can avoid
>   * the TLBI for page-table freeing, PPC-Radix otoh does use the
>   * page-tables and needs the TLBI.
>   */
>> +#define tlb_needs_table_invalidate()	radix_enabled()
>> +#endif
> 
> Also, are you really sure about the !SMP case? Esp. on Radix I'm
> thinking that the PWC (page-walk-cache) can give trouble even on UP,
> when we get preempted in the middle of mmu_gather. Hmm?
> 

Yes, looking at !SMP I guess we do have issue there. we do free the 
pagetable pages directly in __p*_free_tlb() with the current code. That 
will definitely not work. Are you suggesting we enable 
HAVE_RCU_TABLE_FREE even for !SMP?

>>   /* Get the generic bits... */
>>   #include <asm-generic/tlb.h>
> 
> 

-aneesh
