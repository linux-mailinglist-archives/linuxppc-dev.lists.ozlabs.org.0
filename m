Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A403CD628
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 15:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT3HM4g4Sz3bTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 23:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKZpGepe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GKZpGepe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT3Gw5WTsz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 23:53:59 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JDiN4H195829; Mon, 19 Jul 2021 09:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bG+X0zh0Xpv72GLaZ0EbCCB+IPhr2RzBO2EEM9ydBUw=;
 b=GKZpGepeYY5QsC5SEy3aYS33TZ/rwxRh+ZKJpuxs9Oa6Tqmk+w+A0ATWomkGFBnBddXJ
 hlm+gldCw/NJhECVedpgIj/lru79d95h5BNSQXNTclYTq4pAAKBJ2orC//JManFbAokx
 8y6QKrH9zxW5DEUkJgp6EbY87gbHTA487jtoG6aYDqh8Ldqt+RaoezgWCly/Zd2PDUr6
 X+x4iYVCeR7L/SEHRNsx8G/2/+eF+cHdnGW6bveyYha2IFHWrBE8KhbDUDsHeyUfk/3R
 GSRBDkKX/XkvgMls44M4GH6mecfpKdc9pCS1owqUxtiDziWm1WKpTKZElcxrrsaQ4zUY Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39w7x4e6m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 09:53:51 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JDipJs002148;
 Mon, 19 Jul 2021 09:53:50 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39w7x4e6gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 09:53:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JDCXxu018923;
 Mon, 19 Jul 2021 13:53:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu88r2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 13:53:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16JDpP1L21889350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 13:51:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37A6AAE058;
 Mon, 19 Jul 2021 13:53:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4921AE059;
 Mon, 19 Jul 2021 13:53:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.62.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 13:53:43 +0000 (GMT)
Subject: Re: [PATCH v5 02/11] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-3-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <29c199f3-63a8-3edb-b29e-de157431d89f@linux.ibm.com>
Date: Mon, 19 Jul 2021 15:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-3-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TFluKUD2HZvcl5_ntqKYotqIH5VodY1O
X-Proofpoint-GUID: RfAfaSxtRfVXmhLnVoCkiQZccTmjhGoO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190078
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



On 16/07/2021 10:27, Leonardo Bras wrote:
> @@ -1099,18 +1105,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
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
> -	} else {
> -		memset(tbl->it_map, 0xff, sz);
>   	}
>   
> +	memset(tbl->it_map, 0xff, sz);
> +


So if the table is not empty, we fail (EBUSY) but we now also completely 
overwrite the bitmap. It was in an unexpected state, but we're making it 
worse. Or am I missing something?

   Fred


>   	for (i = 0; i < tbl->nr_pools; i++)
>   		spin_unlock(&tbl->pools[i].lock);
>   	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
