Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E17B7E04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 17:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z0tS0KvnzF54F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 01:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0pM1ZHYzF4ZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 01:17:46 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JFG7Ac141001
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 11:17:43 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4bjk21d4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 11:17:42 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Thu, 19 Sep 2019 16:17:40 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Sep 2019 16:17:36 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JFHZAW52559994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 15:17:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B54C6A4055;
 Thu, 19 Sep 2019 15:17:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 638CFA4070;
 Thu, 19 Sep 2019 15:17:35 +0000 (GMT)
Received: from pomme.tls.ibm.com (unknown [9.101.4.33])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 15:17:35 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/mm: call H_BLOCK_REMOVE when supported
To: Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20190916095543.17496-1-ldufour@linux.ibm.com>
 <20190916095543.17496-3-ldufour@linux.ibm.com>
 <87y2ylvhyo.fsf@mpe.ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Thu, 19 Sep 2019 17:17:35 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87y2ylvhyo.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091915-0012-0000-0000-0000034E1E3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091915-0013-0000-0000-00002188A0CF
Message-Id: <bd973652-5dc2-a359-fcd5-4a61243721bb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190143
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

Le 18/09/2019 à 15:42, Michael Ellerman a écrit :
> Hi Laurent,
> 
> Few comments ...

Hi Michael,

Thanks for the review and the nitpicking ;)
> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> Now we do not call _BLOCK_REMOVE all the time when the feature is
>> exhibited.
> 
> This isn't true until after the patch is applied, ie. the tense is
> wrong. The rest of the change log explains things fine, so just drop
> that sentence I think.
> 
> Can you include the info about the oops in here.
> 
>> Depending on the hardware and the hypervisor, the hcall H_BLOCK_REMOVE may
>> not be able to process all the page size for a segment base page size, as
>                                        ^
>                                        sizes
>> reported by the TLB Invalidate Characteristics.o
>                                                   ^
>                                                   stray "o"
>>
>> For each couple base segment page size and actual page size, this
>             ^
>             "pair of"
>> characteristic is telling the size of the block the hcall is supporting.
>                   ^                                          ^
>                   "tells us"                                 supports
>>
>> Due to the involve complexity in do_block_remove() and call_block_remove(),
>               ^
>               "required" is better I think
>> and the fact currently a 8 size block is returned by the hypervisor,  we
>                ^          ^
>                that       "block of size 8"
>> are only supporting 8 size block to the H_BLOCK_REMOVE hcall.
>>
>> Furthermore a warning message is displayed at boot time in the case of an
>> unsupported block size.
> 
> I'm not sure we should be doing that? It could be unnecessarily spammy.
> 
>> In order to identify this limitation easily in the code,a local define
>> HBLKR_SUPPORTED_SIZE defining the currently supported block size, and a
>> dedicated checking helper is_supported_hlbkr() are introduced.
>>
>> For regular pages and hugetlb, the assumption is made that the page size is
>> equal to the base page size. For THP the page size is assumed to be 16M.
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/lpar.c | 35 +++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>> index 98a5c2ff9a0b..e2ad9b3b1097 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -65,6 +65,13 @@ EXPORT_SYMBOL(plpar_hcall_norets);
>>    */
>>   static int hblkr_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT];
>>   
>> +/*
>> + * Due to the involved complexity, and that the current hypervisor is only
>> + * returning this value or 0, we are limiting the support of the H_BLOCK_REMOVE
>> + * buffer size to 8 size block.
>> + */
>> +#define HBLKR_SUPPORTED_BLOCK_SIZE 8
>> +
>>   #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
>>   static u8 dtl_mask = DTL_LOG_PREEMPT;
>>   #else
>> @@ -993,6 +1000,15 @@ static void pSeries_lpar_hpte_invalidate(unsigned long slot, unsigned long vpn,
>>   #define HBLKR_CTRL_ERRNOTFOUND	0x8800000000000000UL
>>   #define HBLKR_CTRL_ERRBUSY	0xa000000000000000UL
>>   
>> +/*
>> + * Returned true if we are supporting this block size for the specified segment
>> + * base page size and actual page size.
>> + */
>> +static inline bool is_supported_hlbkr(int bpsize, int psize)
>> +{
>> +	return (hblkr_size[bpsize][psize] == HBLKR_SUPPORTED_BLOCK_SIZE);
>> +}
>> +
>>   /**
>>    * H_BLOCK_REMOVE caller.
>>    * @idx should point to the latest @param entry set with a PTEX.
>> @@ -1152,7 +1168,11 @@ static inline void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
>>   	if (lock_tlbie)
>>   		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>>   
>> -	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
>> +	/*
>> +	 * Assuming THP size is 16M, and we only support 8 bytes size buffer
>> +	 * for the momment.
>> +	 */
>> +	if (is_supported_hlbkr(psize, MMU_PAGE_16M))
> 
> It's not very clear that this is correct in all cases. ie. how do we
> know we're being called for THP and not regular huge page?
> 
> I think we're only called via:
>    flush_hash_hugepage()
>    -> mmu_hash_ops.hugepage_invalidate()
>       pSeries_lpar_hugepage_invalidate()
>       -> __pSeries_lpar_hugepage_invalidate()
> 
> And flush_hash_hugepage() is called via:
>    __hash_page_thp()
>    and
>    hpte_do_hugepage_flush()
> 
> The first is presumably fine, the 2nd is called in a few places:
>    __flush_hash_table_range() under if (is_thp)
>    hash__pmd_hugepage_update()
> 
> 
> But it's a little bit fragile if the code ever evolves. Not sure if
> there's a better solution, other than just documenting it.

Indeed __pSeries_lpar_hugepage_invalidate() can only be called for THP.
flush_hash_hugepage() and hpte_do_hugepage_flush() are only defined (or 
valid) with CONFIG_TRANSPARENT_HUGEPAGE.

As Aneesh remind me, "hugepage" stands for THP.

> 
>>   		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
>>   	else
>>   		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
>> @@ -1437,6 +1457,14 @@ void __init pseries_lpar_read_hblkr_characteristics(void)
>>   
>>   		block_size = 1 << block_size;
>>   
>> +		/*
>> +		 * If the block size is not supported by the kernel, report it,
>> +		 * but continue reading the values, and the following blocks.
>> +		 */
>> +		if (block_size != HBLKR_SUPPORTED_BLOCK_SIZE)
>> +			pr_warn("Unsupported H_BLOCK_REMOVE block size : %d\n",
>> +				block_size);
> 
> Does this need a printk? I'm worried it could end up triggering and
> scaring people unnecessarily.

I agree, will remove.

> 
>> +
>>   		for (npsize = local_buffer[idx++];  npsize > 0; npsize--)
>>   			check_lp_set_hblk((unsigned int) local_buffer[idx++],
>>   					  block_size);
>> @@ -1468,7 +1496,10 @@ static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
>>   	if (lock_tlbie)
>>   		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>>   
>> -	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
>> +	/*
>> +	 * Currently, we only support 8 bytes size buffer in do_block_remove().
>> +	 */
>> +	if (is_supported_hlbkr(batch->psize, batch->psize)) {
>>   		do_block_remove(number, batch, param);
>>   		goto out;
>>   	}
>> -- 
>> 2.23.0
> 
> cheers
> 

