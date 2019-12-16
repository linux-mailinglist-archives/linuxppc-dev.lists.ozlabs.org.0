Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF1121EDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 00:26:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cHTc4t14zDqWd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 10:26:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cH4v6GFBzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 10:08:31 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBGN2NfC058700; Mon, 16 Dec 2019 18:08:15 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwdvmvubp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 18:08:15 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBGN5BFw025165;
 Mon, 16 Dec 2019 23:08:14 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2wvqc6d06j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 23:08:14 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBGN8C4940501544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Dec 2019 23:08:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E36B1C605A;
 Mon, 16 Dec 2019 23:08:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A730FC6059;
 Mon, 16 Dec 2019 23:08:05 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.177.201])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 16 Dec 2019 23:08:05 +0000 (GMT)
References: <20191216041924.42318-1-aik@ozlabs.ru>
 <20191216041924.42318-3-aik@ozlabs.ru>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 2/4] powerpc/pseries: Allow not having ibm,
 hypertas-functions::hcall-multi-tce for DDW
In-reply-to: <20191216041924.42318-3-aik@ozlabs.ru>
Date: Mon, 16 Dec 2019 20:07:35 -0300
Message-ID: <878snbuax4.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_07:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=48 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912160193
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
Cc: Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> By default a pseries guest supports a H_PUT_TCE hypercall which maps
> a single IOMMU page in a DMA window. Additionally the hypervisor may
> support H_PUT_TCE_INDIRECT/H_STUFF_TCE which update multiple TCEs at once;
> this is advertised via the device tree /rtas/ibm,hypertas-functions
> property which Linux converts to FW_FEATURE_MULTITCE.
>
> FW_FEATURE_MULTITCE is checked when dma_iommu_ops is used; however
> the code managing the huge DMA window (DDW) ignores it and calls
> H_PUT_TCE_INDIRECT even if it is explicitly disabled via
> the "multitce=off" kernel command line parameter.
>
> This adds FW_FEATURE_MULTITCE checking to the DDW code path.
>
> This changes tce_build_pSeriesLP to take liobn and page size as
> the huge window does not have iommu_table descriptor which usually
> the place to store these numbers.
>
> Fixes: 4e8b0cf46b25 ("powerpc/pseries: Add support for dynamic dma windows")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Tested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Some minor nits below. Feel free to ignore.

> @@ -146,25 +146,25 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  	int ret = 0;
>  	long tcenum_start = tcenum, npages_start = npages;
>
> -	rpn = __pa(uaddr) >> TCE_SHIFT;
> +	rpn = __pa(uaddr) >> tceshift;
>  	proto_tce = TCE_PCI_READ;
>  	if (direction != DMA_TO_DEVICE)
>  		proto_tce |= TCE_PCI_WRITE;
>
>  	while (npages--) {
> -		tce = proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT;
> -		rc = plpar_tce_put((u64)tbl->it_index, (u64)tcenum << 12, tce);
> +		tce = proto_tce | (rpn & TCE_RPN_MASK) << tceshift;
> +		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, tce);

Is it necessary to cast to u64 here? plpar_tce_put() takes unsigned long
for both arguments.

> @@ -261,16 +263,16 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  	return ret;
>  }
>
> -static void tce_free_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
> +static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long npages)
>  {
>  	u64 rc;
>
>  	while (npages--) {
> -		rc = plpar_tce_put((u64)tbl->it_index, (u64)tcenum << 12, 0);
> +		rc = plpar_tce_put((u64)liobn, (u64)tcenum << 12, 0);

Same comment regarding cast to u64.

> @@ -400,6 +402,20 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>  	u64 rc = 0;
>  	long l, limit;
>
> +	if (!firmware_has_feature(FW_FEATURE_MULTITCE)) {
> +		unsigned long tceshift = be32_to_cpu(maprange->tce_shift);
> +		unsigned long dmastart = (start_pfn << PAGE_SHIFT) +
> +				be64_to_cpu(maprange->dma_base);
> +		unsigned long tcenum = dmastart >> tceshift;
> +		unsigned long npages = num_pfn << PAGE_SHIFT >>
> +				be32_to_cpu(maprange->tce_shift);

Could use the tceshift variable here.

> +		void *uaddr = __va(start_pfn << PAGE_SHIFT);
> +
> +		return tce_build_pSeriesLP(be32_to_cpu(maprange->liobn),
> +				tcenum, tceshift, npages, (unsigned long) uaddr,
> +				DMA_BIDIRECTIONAL, 0);
> +	}
> +
>  	local_irq_disable();	/* to protect tcep and the page behind it */
>  	tcep = __this_cpu_read(tce_page);


--
Thiago Jung Bauermann
IBM Linux Technology Center
