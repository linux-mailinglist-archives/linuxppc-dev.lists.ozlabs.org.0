Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6348B1FCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 15:41:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VGyT3yw4zF5GW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 23:41:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VGP55cCmzF4bL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 23:16:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DDD6Ec140722
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 09:16:22 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0awaam8v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 09:16:21 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 13 Sep 2019 14:16:19 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 14:16:15 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8DDFn9344368324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 13:15:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBD19AE059;
 Fri, 13 Sep 2019 13:16:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5878BAE051;
 Fri, 13 Sep 2019 13:16:14 +0000 (GMT)
Received: from pomme.local (unknown [9.145.181.150])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 13:16:14 +0000 (GMT)
Subject: Re: [PATCH 3/3] powerpc/mm: call H_BLOCK_REMOVE when supported
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-4-ldufour@linux.ibm.com>
 <5bcd3da7-1bc2-f3f9-3ed2-e3aa0bb540bd@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Fri, 13 Sep 2019 15:16:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5bcd3da7-1bc2-f3f9-3ed2-e3aa0bb540bd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091313-4275-0000-0000-000003654FAE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091313-4276-0000-0000-00003877ADA2
Message-Id: <cf06842a-ea37-9684-5b28-de4277e7bef3@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130130
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 12/09/2019 à 16:20, Aneesh Kumar K.V a écrit :
> On 8/30/19 5:37 PM, Laurent Dufour wrote:
>> Instead of calling H_BLOCK_REMOVE all the time when the feature is
>> exhibited, call this hcall only when the couple base page size, page size
>> is supported as reported by the TLB Invalidate Characteristics.
>>
> 
> supported is not actually what we are checking here. We are checking 
> whether the base page size actual page size remove can be done in chunks of 
> 8 blocks. If we don't support 8 block you fallback to bulk invalidate. May 
> be update the commit message accordingly?

Yes that's correct.

I think I should also put the warning message displayed when reading the 
characteristic in that commit and explicitly mentioned that we only support 
8 entries size block for this hcall.
This way the limitation is limited to this commit.

> 
>> For regular pages and hugetlb, the assumption is made that the page size is
>> equal to the base page size. For THP the page size is assumed to be 16M.
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/lpar.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c 
>> b/arch/powerpc/platforms/pseries/lpar.c
>> index 375e19b3cf53..ef3dbf108a65 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -1143,7 +1143,11 @@ static inline void 
>> __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
>>       if (lock_tlbie)
>>           spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>> -    if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
>> +    /*
>> +     * Assuming THP size is 16M, and we only support 8 bytes size buffer
>> +     * for the momment.
>> +     */
>> +    if (mmu_psize_defs[psize].hblk[MMU_PAGE_16M] == 8)
>>           hugepage_block_invalidate(slot, vpn, count, psize, ssize);
>>       else
>>           hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
> 
> 
> 
> So we don't use block invalidate if blocksize is != 8.

yes

> 
> 
>> @@ -1437,7 +1441,10 @@ static void pSeries_lpar_flush_hash_range(unsigned 
>> long number, int local)
>>       if (lock_tlbie)
>>           spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>> -    if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
>> +    /*
>> +     * Currently, we only support 8 bytes size buffer in do_block_remove().
>> +     */
>> +    if (mmu_psize_defs[batch->psize].hblk[batch->psize] == 8) {
>>           do_block_remove(number, batch, param);
>>           goto out;
>>       }
>>
> 
> -aneesh

