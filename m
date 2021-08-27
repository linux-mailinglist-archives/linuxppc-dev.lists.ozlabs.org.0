Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7B3F9CEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5QX3NvQz305c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:53:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mR+Q8J5D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mR+Q8J5D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5Pj46bjz2xlD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:53:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RGX4DK081644; Fri, 27 Aug 2021 12:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ABrXeDwX9L9goAbNY31KRXH0SflMOTwVbieMWTEOvq8=;
 b=mR+Q8J5Dns5ZME38/kkl1q6+hju7LN61Jy0h/0AJzVMSFEMgFaXlKAmTylgxSsjNMGo3
 CGnV8VroE7S+De/pYxdCLp6fP5XDxFhEgAeLbT6c5VmNDCa7px4+AnKWKqG3V+H9FVb/
 x0RWoPFgR8TTV3qPziaFRe7Ibp9P0L6lemKCpWu+x3P3pF2iFWYfIpB8Co9CW2QM2vWm
 15pOrws1cn/SZu6eD0KhAZGLgpDwXFfcawnPH7W/8EJFiPdzcVnbeo2RcA2Tawo+5X7O
 S1Z/HXz0HTugFRfkDdlhNVndsX+wm4ZHNJTOCTDdb9iq69tb+YT8eFdZ9qcpCraisbIZ YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq3039sgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:53:04 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17RGaOaC098429;
 Fri, 27 Aug 2021 12:53:03 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aq3039seh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:53:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RGlg2R012737;
 Fri, 27 Aug 2021 16:53:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrhkvt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 16:53:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17RGnATV57213276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 16:49:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A93E75204E;
 Fri, 27 Aug 2021 16:52:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.153.220])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 53E8252050;
 Fri, 27 Aug 2021 16:52:58 +0000 (GMT)
Subject: Re: [PATCH v6 02/11] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <20210817063929.38701-3-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <39063d3f-82c6-3253-2483-249b0ec0ed9a@linux.ibm.com>
Date: Fri, 27 Aug 2021 18:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817063929.38701-3-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: frjvUDEIAaOlsyNiqrIu9sjKN2jdOrpz
X-Proofpoint-ORIG-GUID: uZuoa9jPZseUR0dlafozL9z9xcRyucsI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_04:2021-08-26,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270098
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/08/2021 08:39, Leonardo Bras wrote:
> Having a function to check if the iommu table has any allocation helps
> deciding if a tbl can be reset for using a new DMA window.
> 
> It should be enough to replace all instances of !bitmap_empty(tbl...).
> 
> iommu_table_in_use() skips reserved memory, so we don't need to worry about
> releasing it before testing. This causes iommu_table_release_pages() to
> become unnecessary, given it is only used to remove reserved memory for
> testing.
> 
> Also, only allow storing reserved memory values in tbl if they are valid
> in the table, so there is no need to check it in the new helper.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Looks ok to me now, thanks!
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   arch/powerpc/include/asm/iommu.h |  1 +
>   arch/powerpc/kernel/iommu.c      | 61 ++++++++++++++++----------------
>   2 files changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index deef7c94d7b6..bf3b84128525 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -154,6 +154,7 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
>    */
>   extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
>   		int nid, unsigned long res_start, unsigned long res_end);
> +bool iommu_table_in_use(struct iommu_table *tbl);
>   
>   #define IOMMU_TABLE_GROUP_MAX_TABLES	2
>   
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 2af89a5e379f..ed98ad63633e 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -690,32 +690,24 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
>   	if (tbl->it_offset == 0)
>   		set_bit(0, tbl->it_map);
>   
> -	tbl->it_reserved_start = res_start;
> -	tbl->it_reserved_end = res_end;
> -
> -	/* Check if res_start..res_end isn't empty and overlaps the table */
> -	if (res_start && res_end &&
> -			(tbl->it_offset + tbl->it_size < res_start ||
> -			 res_end < tbl->it_offset))
> -		return;
> +	if (res_start < tbl->it_offset)
> +		res_start = tbl->it_offset;
>   
> -	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> -		set_bit(i - tbl->it_offset, tbl->it_map);
> -}
> +	if (res_end > (tbl->it_offset + tbl->it_size))
> +		res_end = tbl->it_offset + tbl->it_size;
>   
> -static void iommu_table_release_pages(struct iommu_table *tbl)
> -{
> -	int i;
> +	/* Check if res_start..res_end is a valid range in the table */
> +	if (res_start >= res_end) {
> +		tbl->it_reserved_start = tbl->it_offset;
> +		tbl->it_reserved_end = tbl->it_offset;
> +		return;
> +	}
>   
> -	/*
> -	 * In case we have reserved the first bit, we should not emit
> -	 * the warning below.
> -	 */
> -	if (tbl->it_offset == 0)
> -		clear_bit(0, tbl->it_map);
> +	tbl->it_reserved_start = res_start;
> +	tbl->it_reserved_end = res_end;
>   
>   	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> -		clear_bit(i - tbl->it_offset, tbl->it_map);
> +		set_bit(i - tbl->it_offset, tbl->it_map);
>   }
>   
>   /*
> @@ -779,6 +771,22 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>   	return tbl;
>   }
>   
> +bool iommu_table_in_use(struct iommu_table *tbl)
> +{
> +	unsigned long start = 0, end;
> +
> +	/* ignore reserved bit0 */
> +	if (tbl->it_offset == 0)
> +		start = 1;
> +	end = tbl->it_reserved_start - tbl->it_offset;
> +	if (find_next_bit(tbl->it_map, end, start) != end)
> +		return true;
> +
> +	start = tbl->it_reserved_end - tbl->it_offset;
> +	end = tbl->it_size;
> +	return find_next_bit(tbl->it_map, end, start) != end;
> +}
> +
>   static void iommu_table_free(struct kref *kref)
>   {
>   	struct iommu_table *tbl;
> @@ -795,10 +803,8 @@ static void iommu_table_free(struct kref *kref)
>   
>   	iommu_debugfs_del(tbl);
>   
> -	iommu_table_release_pages(tbl);
> -
>   	/* verify that table contains no entries */
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size))
> +	if (iommu_table_in_use(tbl))
>   		pr_warn("%s: Unexpected TCEs\n", __func__);
>   
>   	/* free bitmap */
> @@ -1099,14 +1105,9 @@ int iommu_take_ownership(struct iommu_table *tbl)
>   	for (i = 0; i < tbl->nr_pools; i++)
>   		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
>   
> -	iommu_table_release_pages(tbl);
> -
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
> +	if (iommu_table_in_use(tbl)) {
>   		pr_err("iommu_tce: it_map is not empty");
>   		ret = -EBUSY;
> -		/* Undo iommu_table_release_pages, i.e. restore bit#0, etc */
> -		iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
> -				tbl->it_reserved_end);
>   	} else {
>   		memset(tbl->it_map, 0xff, sz);
>   	}
> 
