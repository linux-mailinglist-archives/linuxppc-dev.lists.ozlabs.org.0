Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33A1221DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 03:08:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cM4y1tNDzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 13:08:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cM2f0QbZzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 13:06:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH23x6k046326; Mon, 16 Dec 2019 21:06:40 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwdq031vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 21:06:40 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBH25XRW002273;
 Tue, 17 Dec 2019 02:06:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 2wvqc6earp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 02:06:39 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH26bXh46596372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 02:06:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF82FC6059;
 Tue, 17 Dec 2019 02:06:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99FFFC6057;
 Tue, 17 Dec 2019 02:06:29 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.177.201])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Dec 2019 02:06:28 +0000 (GMT)
References: <20191216041924.42318-1-aik@ozlabs.ru>
 <20191216041924.42318-3-aik@ozlabs.ru> <878snbuax4.fsf@morokweng.localdomain>
 <f76a9894-579d-5477-1682-1623eaa46be8@ozlabs.ru>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 2/4] powerpc/pseries: Allow not having ibm,
 hypertas-functions::hcall-multi-tce for DDW
In-reply-to: <f76a9894-579d-5477-1682-1623eaa46be8@ozlabs.ru>
Date: Mon, 16 Dec 2019 23:06:19 -0300
Message-ID: <874kxzu2n8.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 suspectscore=18 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170017
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

> On 17/12/2019 10:07, Thiago Jung Bauermann wrote:
>>
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>
>>> By default a pseries guest supports a H_PUT_TCE hypercall which maps
>>> a single IOMMU page in a DMA window. Additionally the hypervisor may
>>> support H_PUT_TCE_INDIRECT/H_STUFF_TCE which update multiple TCEs at once;
>>> this is advertised via the device tree /rtas/ibm,hypertas-functions
>>> property which Linux converts to FW_FEATURE_MULTITCE.
>>>
>>> FW_FEATURE_MULTITCE is checked when dma_iommu_ops is used; however
>>> the code managing the huge DMA window (DDW) ignores it and calls
>>> H_PUT_TCE_INDIRECT even if it is explicitly disabled via
>>> the "multitce=off" kernel command line parameter.
>>>
>>> This adds FW_FEATURE_MULTITCE checking to the DDW code path.
>>>
>>> This changes tce_build_pSeriesLP to take liobn and page size as
>>> the huge window does not have iommu_table descriptor which usually
>>> the place to store these numbers.
>>>
>>> Fixes: 4e8b0cf46b25 ("powerpc/pseries: Add support for dynamic dma windows")
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> Tested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>
>> Some minor nits below. Feel free to ignore.
>>
>>> @@ -146,25 +146,25 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
>>>  	int ret = 0;
>>>  	long tcenum_start = tcenum, npages_start = npages;
>>>
>>> -	rpn = __pa(uaddr) >> TCE_SHIFT;
>>> +	rpn = __pa(uaddr) >> tceshift;
>>>  	proto_tce = TCE_PCI_READ;
>>>  	if (direction != DMA_TO_DEVICE)
>>>  		proto_tce |= TCE_PCI_WRITE;
>>>
>>>  	while (npages--) {
>>> -		tce = proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT;
>>> -		rc = plpar_tce_put((u64)tbl->it_index, (u64)tcenum << 12, tce);
>>> +		tce = proto_tce | (rpn & TCE_RPN_MASK) << tceshift;
>>> +		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, tce);
>>
>> Is it necessary to cast to u64 here? plpar_tce_put() takes unsigned long
>> for both arguments.
>
> Looked as an unrelated change. Small but still unrelated.

Ah, I hadn't noticed that the cast was already in the original code.

>>> @@ -400,6 +402,20 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>>>  	u64 rc = 0;
>>>  	long l, limit;
>>>
>>> +	if (!firmware_has_feature(FW_FEATURE_MULTITCE)) {
>>> +		unsigned long tceshift = be32_to_cpu(maprange->tce_shift);
>>> +		unsigned long dmastart = (start_pfn << PAGE_SHIFT) +
>>> +				be64_to_cpu(maprange->dma_base);
>>> +		unsigned long tcenum = dmastart >> tceshift;
>>> +		unsigned long npages = num_pfn << PAGE_SHIFT >>
>>> +				be32_to_cpu(maprange->tce_shift);
>>
>> Could use the tceshift variable here.
>
>
> True, overlooked.
> Thanks for the reviews!

Thank you for the patches!

--
Thiago Jung Bauermann
IBM Linux Technology Center
