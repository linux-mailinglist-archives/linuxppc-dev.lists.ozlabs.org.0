Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4AF734F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 12:42:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BTVw3ZbXzF4TJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 22:42:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BTKD5BgMzF3JP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 22:33:36 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xABBXKFC036678; Mon, 11 Nov 2019 06:33:26 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w76aq9hhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 06:33:26 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xABBXP3F037122;
 Mon, 11 Nov 2019 06:33:25 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w76aq9h51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 06:33:25 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xABBUr2o002969;
 Mon, 11 Nov 2019 11:32:56 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2w5n361psm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 11:32:56 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xABBWtD454788524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 11:32:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 871B928059;
 Mon, 11 Nov 2019 11:32:55 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 547E028058;
 Mon, 11 Nov 2019 11:32:50 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.36.163])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Nov 2019 11:32:49 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 Q)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
Subject: Re: [PATCH 1/3] powerpc/mm: Initialize the HPTE encoding values
In-Reply-To: <20190830120712.22971-2-ldufour@linux.ibm.com>
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-2-ldufour@linux.ibm.com>
Date: Thu, 12 Sep 2019 19:02:40 +0530
Message-ID: <87v9txzll3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911110109
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

Laurent Dufour <ldufour@linux.ibm.com> writes:

> Before reading the HPTE encoding values we initialize all of them to -1 (an
> invalid value) to later being able to detect the initialized ones.
>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

We already do this in mmu_psize_set_default_penc() ?

> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index c3bfef08dcf8..2039bc315459 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -408,7 +408,7 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>  {
>  	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
>  	const __be32 *prop;
> -	int size = 0;
> +	int size = 0, idx, base_idx;
>  
>  	/* We are scanning "cpu" nodes only */
>  	if (type == NULL || strcmp(type, "cpu") != 0)
> @@ -418,6 +418,11 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>  	if (!prop)
>  		return 0;
>  
> +	/* Set all the penc values to invalid */
> +	for (base_idx = 0; base_idx < MMU_PAGE_COUNT; base_idx++)
> +		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
> +			mmu_psize_defs[base_idx].penc[idx] = -1;
> +
>  	pr_info("Page sizes from device-tree:\n");
>  	size /= 4;
>  	cur_cpu_spec->mmu_features &= ~(MMU_FTR_16M_PAGE);
> @@ -426,7 +431,6 @@ static int __init htab_dt_scan_page_sizes(unsigned long node,
>  		unsigned int slbenc = be32_to_cpu(prop[1]);
>  		unsigned int lpnum = be32_to_cpu(prop[2]);
>  		struct mmu_psize_def *def;
> -		int idx, base_idx;
>  
>  		size -= 3; prop += 3;
>  		base_idx = get_idx_from_shift(base_shift);
> -- 
> 2.23.0
