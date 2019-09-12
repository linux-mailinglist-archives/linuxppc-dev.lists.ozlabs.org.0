Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C2B110C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 16:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tgwq1g0mzF4Yq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 00:23:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tgsd1TNpzF3pW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 00:20:36 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CE7djK042946; Thu, 12 Sep 2019 10:20:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyp3fc98r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:20:26 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8CE7uG7043532;
 Thu, 12 Sep 2019 10:20:25 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyp3fc97w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:20:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8CEKDHg003456;
 Thu, 12 Sep 2019 14:20:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2uv467y990-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 14:20:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CEKIb855771578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 14:20:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D1C2136055;
 Thu, 12 Sep 2019 14:20:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77FC9136063;
 Thu, 12 Sep 2019 14:20:15 +0000 (GMT)
Received: from [9.199.32.243] (unknown [9.199.32.243])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 14:20:15 +0000 (GMT)
Subject: Re: [PATCH 3/3] powerpc/mm: call H_BLOCK_REMOVE when supported
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-4-ldufour@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <5bcd3da7-1bc2-f3f9-3ed2-e3aa0bb540bd@linux.ibm.com>
Date: Thu, 12 Sep 2019 19:50:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830120712.22971-4-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120149
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

On 8/30/19 5:37 PM, Laurent Dufour wrote:
> Instead of calling H_BLOCK_REMOVE all the time when the feature is
> exhibited, call this hcall only when the couple base page size, page size
> is supported as reported by the TLB Invalidate Characteristics.
> 

supported is not actually what we are checking here. We are checking 
whether the base page size actual page size remove can be done in chunks 
of 8 blocks. If we don't support 8 block you fallback to bulk 
invalidate. May be update the commit message accordingly?


> For regular pages and hugetlb, the assumption is made that the page size is
> equal to the base page size. For THP the page size is assumed to be 16M.
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/lpar.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 375e19b3cf53..ef3dbf108a65 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -1143,7 +1143,11 @@ static inline void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
>   	if (lock_tlbie)
>   		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>   
> -	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
> +	/*
> +	 * Assuming THP size is 16M, and we only support 8 bytes size buffer
> +	 * for the momment.
> +	 */
> +	if (mmu_psize_defs[psize].hblk[MMU_PAGE_16M] == 8)
>   		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
>   	else
>   		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);



So we don't use block invalidate if blocksize is != 8.


> @@ -1437,7 +1441,10 @@ static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
>   	if (lock_tlbie)
>   		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
>   
> -	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
> +	/*
> +	 * Currently, we only support 8 bytes size buffer in do_block_remove().
> +	 */
> +	if (mmu_psize_defs[batch->psize].hblk[batch->psize] == 8) {
>   		do_block_remove(number, batch, param);
>   		goto out;
>   	}
> 

-aneesh
