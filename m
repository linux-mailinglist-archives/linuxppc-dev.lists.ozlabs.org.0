Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E373B102A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:40:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TfzF6g1MzF46m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 23:40:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tfvs3DrlzF4QS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:37:29 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CDXIuL020722; Thu, 12 Sep 2019 09:37:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyp6qt5vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 09:37:19 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8CDZHn7027303;
 Thu, 12 Sep 2019 09:37:19 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyp6qt5u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 09:37:19 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8CDYS2x024731;
 Thu, 12 Sep 2019 13:37:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2uv468xvaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 13:37:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CDbGY562128512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 13:37:16 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 856C2136059;
 Thu, 12 Sep 2019 13:37:16 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B4A8136051;
 Thu, 12 Sep 2019 13:37:14 +0000 (GMT)
Received: from [9.199.32.243] (unknown [9.199.32.243])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 13:37:13 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/mm: Initialize the HPTE encoding values
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-2-ldufour@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <527b1a15-e37f-0d76-b999-e22cf04f9f7e@linux.ibm.com>
Date: Thu, 12 Sep 2019 19:07:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830120712.22971-2-ldufour@linux.ibm.com>
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
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120143
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
> Before reading the HPTE encoding values we initialize all of them to -1 (an
> invalid value) to later being able to detect the initialized ones.
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index c3bfef08dcf8..2039bc315459 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -408,7 +408,7 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>   {
>   	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
>   	const __be32 *prop;
> -	int size = 0;
> +	int size = 0, idx, base_idx;
>   
>   	/* We are scanning "cpu" nodes only */
>   	if (type == NULL || strcmp(type, "cpu") != 0)
> @@ -418,6 +418,11 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>   	if (!prop)
>   		return 0;
>   
> +	/* Set all the penc values to invalid */
> +	for (base_idx = 0; base_idx < MMU_PAGE_COUNT; base_idx++)
> +		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
> +			mmu_psize_defs[base_idx].penc[idx] = -1;
> +
>   	pr_info("Page sizes from device-tree:\n");
>   	size /= 4;
>   	cur_cpu_spec->mmu_features &= ~(MMU_FTR_16M_PAGE);
> @@ -426,7 +431,6 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>   		unsigned int slbenc = be32_to_cpu(prop[1]);
>   		unsigned int lpnum = be32_to_cpu(prop[2]);
>   		struct mmu_psize_def *def;
> -		int idx, base_idx;
>   
>   		size -= 3; prop += 3;
>   		base_idx = get_idx_from_shift(base_shift);
> 

We already do this in mmu_psize_set_default_penc() ?

-aneesh
