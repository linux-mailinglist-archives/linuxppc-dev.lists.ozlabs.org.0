Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 250A921658
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 11:35:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45536x4brdzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 19:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45535g6LZGzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 19:34:15 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4H9WmJJ137931
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 05:34:12 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2shr2yppnk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 05:34:11 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 17 May 2019 10:34:11 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 10:34:08 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4H9WqoO19267836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 09:32:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20704AC062;
 Fri, 17 May 2019 09:32:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DECD1AC059;
 Fri, 17 May 2019 09:32:50 +0000 (GMT)
Received: from [9.199.59.156] (unknown [9.199.59.156])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 09:32:50 +0000 (GMT)
Subject: Re: [RFC PATCH 3/3] powerpc/mm/hugetlb: Don't enable HugeTLB if we
 don't have a page table cache
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com, paulus@samba.org
References: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
 <20190514145041.7836-3-aneesh.kumar@linux.ibm.com>
 <87imuaihi3.fsf@concordia.ellerman.id.au>
 <04403623-d4ae-1d91-d3f4-16bd09e94d34@linux.ibm.com>
Date: Fri, 17 May 2019 15:02:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <04403623-d4ae-1d91-d3f4-16bd09e94d34@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051709-0040-0000-0000-000004F0E65E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011111; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01204549; UDB=6.00632356; IPR=6.00985485; 
 MB=3.00026930; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 09:34:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051709-0041-0000-0000-000008FCF6AC
Message-Id: <9df261b2-033a-c30a-1d0d-08bfac6c12bc@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170064
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

On 5/17/19 9:29 AM, Aneesh Kumar K.V wrote:
> On 5/16/19 8:17 PM, Michael Ellerman wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> This makes sure we don't enable HugeTLB if the cache is not configured.
>>> I am still not sure about this. IMHO hugetlb support should be a 
>>> hardware
>>> support derivative and any cache allocation failure should be handled 
>>> as I did
>>> in the earlier patch. But then if we were not able to create hugetlb 
>>> page table
>>> cache, we can as well declare hugetlb support disabled thereby 
>>> avoiding calling
>>> into allocation routines.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/mm/hugetlbpage.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/hugetlbpage.c 
>>> b/arch/powerpc/mm/hugetlbpage.c
>>> index ee16a3fb788a..4bf8bc659cc7 100644
>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>> @@ -602,6 +602,7 @@ __setup("hugepagesz=", hugepage_setup_sz);
>>>   static int __init hugetlbpage_init(void)
>>>   {
>>>       int psize;
>>> +    bool configured = false;
>>
>> Where's my reverse Christmas tree! :)
> 
> Will fix that :)
> 
>>
>>>       if (hugetlb_disabled) {
>>>           pr_info("HugeTLB support is disabled!\n");
>>> @@ -651,10 +652,16 @@ static int __init hugetlbpage_init(void)
>>>               pgtable_cache_add(pdshift - shift);
>>>           else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) || 
>>> IS_ENABLED(CONFIG_PPC_8xx))
>>>               pgtable_cache_add(PTE_T_ORDER);
>>> +
>>> +        if (!configured)
>>> +            configured = true;
>>
>> I'd just not worry about the if.
>>
>>>       }
>>> -    if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
>>> -        hugetlbpage_init_default();
>>> +    if (configured) {
>>> +        if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
>>> +            hugetlbpage_init_default();
>>> +    } else
>>> +        pr_info("Disabling HugeTLB");
>>
>> We're not actually doing anything to disable it in the
>> CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=n case, but I guess the print is still
>> correct because we didn't enable a size in the for loop above?
>>
>> Can we make it a bit more explicit? Maybe like:
>>
>>    "Disabling HugeTLB, no usable page sizes found."
>>
> 
> That would confuse when they find in the dmesg
> 
> [    0.000000] hash-mmu: Page sizes from device-tree:
> [    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=0
> [    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=7
> [    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=56
> [    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, 
> avpnm=0x00000000, tlbiel=1, penc=1
> [    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, 
> avpnm=0x00000000, tlbiel=1, penc=8
> [    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, 
> avpnm=0x00000001, tlbiel=0, penc=0
> [    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, 
> avpnm=0x000007ff, tlbiel=0, penc=3

There is another failure condition which i am not sure how to handle 
with the pagetable cache creation failures. With above, if we had kernel 
command line hugepagesz=x hugepages=y, and if that x is a gigantic 
hugepage, we will allocate those pages early even if we don't support 
hugetlb because we failed to create page table cache.

I am not sure whether we should handle that error gracefully?

-aneesh

