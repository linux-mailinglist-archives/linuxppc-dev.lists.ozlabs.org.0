Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBB497857
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 06:22:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhyzT1rqNz3bZW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 16:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WbbnshSp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WbbnshSp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhyyl46fMz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 16:21:50 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20O2Bcal023859; 
 Mon, 24 Jan 2022 05:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=thh4x/p/WtFf0sOLJMUb0k0ZRRXnjxxVLBax1sVxfic=;
 b=WbbnshSpz81HZgEHsB0Z5yhQ941DMC7ussg3cjdDp55Nnf7YRwI82Cl/Fz+hzOd3C1E0
 wKHqD1vasjHpeilsfW88bIw9nMho+kqtp0jiyx0a4Tguk+Db457Mv9QdtGkr//OTFIkI
 ZtIkZMY866EhTXMxC5hXfzqNzNkkRoUBkQGVI8FMCUlJpMPCfi6YGj9R8gW/NpZim4du
 QLxINEmGOml2RxHoGVxkO3BF7KmfKzpHtBPxWFyagikCrslJ/5wY9l8zIfwa02n18CjP
 UAaah4HmfCrmeR9vIPkKB74s50YW0NHW5gCaIbL83wG5kX9EO06vmGR4DDE1hgBRjPSb cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsk43t82t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 05:21:40 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20O5ISvw029534;
 Mon, 24 Jan 2022 05:21:39 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsk43t7wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 05:21:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20O5HGhc014141;
 Mon, 24 Jan 2022 05:21:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3dr9j8r4ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 05:21:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20O5LVb442467744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 05:21:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0F4A42064;
 Mon, 24 Jan 2022 05:21:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF75542042;
 Mon, 24 Jan 2022 05:21:24 +0000 (GMT)
Received: from [9.211.104.169] (unknown [9.211.104.169])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 05:21:24 +0000 (GMT)
Message-ID: <8688c9ca-252c-c07d-d9e5-3e0392c0b6dc@linux.ibm.com>
Date: Mon, 24 Jan 2022 10:51:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/2] mm/cma: provide option to opt out from exposing
 pages on activation failure
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20220117075246.36072-1-hbathini@linux.ibm.com>
 <20220117075246.36072-2-hbathini@linux.ibm.com>
In-Reply-To: <20220117075246.36072-2-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OC172XjR6KsNZ3yZVKg2vR9kHSgUnUNZ
X-Proofpoint-GUID: _fsHVq3Mc8VCyFe1apsDDRWL4uz0Sak5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_01,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240033
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
Cc: osalvador@suse.de, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Could you please pick these patches via -mm tree.


On 17/01/22 1:22 pm, Hari Bathini wrote:
> Commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
> activation of an area fails") started exposing all pages to buddy
> allocator on CMA activation failure. But there can be CMA users that
> want to handle the reserved memory differently on CMA allocation
> failure. Provide an option to opt out from exposing pages to buddy
> for such cases.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Changes in v3:
> * Dropped NULL check in cma_reserve_pages_on_error().
> * Dropped explicit initialization of cma->reserve_pages_on_error to
>    'false' in cma_init_reserved_mem().
> * Added Reviewed-by tag from David.
> 
> Changes in v2:
> * Changed cma->free_pages_on_error to cma->reserve_pages_on_error and
>    cma_dont_free_pages_on_error() to cma_reserve_pages_on_error() to
>    avoid confusion.
> 
> 
>   include/linux/cma.h |  2 ++
>   mm/cma.c            | 11 +++++++++--
>   mm/cma.h            |  1 +
>   3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index bd801023504b..51d540eee18a 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -50,4 +50,6 @@ extern bool cma_pages_valid(struct cma *cma, const struct page *pages, unsigned
>   extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
>   
>   extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
> +
> +extern void cma_reserve_pages_on_error(struct cma *cma);
>   #endif
> diff --git a/mm/cma.c b/mm/cma.c
> index bc9ca8f3c487..766f1b82b532 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -131,8 +131,10 @@ static void __init cma_activate_area(struct cma *cma)
>   	bitmap_free(cma->bitmap);
>   out_error:
>   	/* Expose all pages to the buddy, they are useless for CMA. */
> -	for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
> -		free_reserved_page(pfn_to_page(pfn));
> +	if (!cma->reserve_pages_on_error) {
> +		for (pfn = base_pfn; pfn < base_pfn + cma->count; pfn++)
> +			free_reserved_page(pfn_to_page(pfn));
> +	}
>   	totalcma_pages -= cma->count;
>   	cma->count = 0;
>   	pr_err("CMA area %s could not be activated\n", cma->name);
> @@ -150,6 +152,11 @@ static int __init cma_init_reserved_areas(void)
>   }
>   core_initcall(cma_init_reserved_areas);
>   
> +void __init cma_reserve_pages_on_error(struct cma *cma)
> +{
> +	cma->reserve_pages_on_error = true;
> +}
> +
>   /**
>    * cma_init_reserved_mem() - create custom contiguous area from reserved memory
>    * @base: Base address of the reserved area
> diff --git a/mm/cma.h b/mm/cma.h
> index 2c775877eae2..88a0595670b7 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -30,6 +30,7 @@ struct cma {
>   	/* kobject requires dynamic object */
>   	struct cma_kobject *cma_kobj;
>   #endif
> +	bool reserve_pages_on_error;
>   };
>   
>   extern struct cma cma_areas[MAX_CMA_AREAS];

Thanks
Hari
