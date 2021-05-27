Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56EC392726
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 08:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrHVl5sk0z309L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 16:10:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bmEzT/Xx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bmEzT/Xx; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrHVC1mdlz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 16:10:10 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R63hNt112408; Thu, 27 May 2021 02:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VuIg4wfohSMCmKPdfyPsSc8ElPpxm9ljbUx6AdC6Gmo=;
 b=bmEzT/Xx+qG6fMie+OJovX/fF+1zqsx1YncNyoKnWLcFJd+VkXzJu/aTI0ogfN+Zf2fp
 vIryQ6eWBq+nPYTOIOzAkqcF74y/ilb9cUeZwTWUSI7ZhmIi1WpskpksyVl9dv0IcQW1
 fbaJNGVD4ia2Q5RMSTUIrdgePaf6du9Sib8Kvhtk4GYyaH/QsN9qJd0/LfGDhSPjh4zj
 bvdzQb1d2nSU5qWHIN169qPnhsSSVi/n7PLJeC1AnjH5hh54mdf+7R9A08ipEZsC5FSj
 be1cLr+aZWTuKegGh2qjN5qSPN46KEA98XSbwLNgnj0o6pxV5YO/y4/+l3ekNaOENoh8 XA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38t3be37e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 02:10:07 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14R68K7W002935;
 Thu, 27 May 2021 06:10:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38s1r490a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 06:10:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14R6A2hj22675812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 06:10:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B4514C050;
 Thu, 27 May 2021 06:10:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 153644C044;
 Thu, 27 May 2021 06:10:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.54.49])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 May 2021 06:10:02 +0000 (GMT)
Subject: Re: [PATCH] Revert "powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs"
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20210526144540.117795-1-fbarrat@linux.ibm.com>
 <82c308d5-7ef4-b756-35dc-eeb029b79601@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <bd48e061-775e-9ee9-395f-743c730c540b@linux.ibm.com>
Date: Thu, 27 May 2021 08:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <82c308d5-7ef4-b756-35dc-eeb029b79601@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ube8tYa6UlUJx4FyQdkggQv3DHJdtozz
X-Proofpoint-ORIG-GUID: Ube8tYa6UlUJx4FyQdkggQv3DHJdtozz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_02:2021-05-26,
 2021-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105270041
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
Cc: zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/05/2021 04:13, Alexey Kardashevskiy wrote:
> On 27/05/2021 00:45, Frederic Barrat wrote:
>> This reverts commit 3c0468d4451eb6b4f6604370639f163f9637a479.
>>
>> That commit was breaking alignment guarantees for the DMA address when
>> allocating coherent mappings, as described in
>> Documentation/core-api/dma-api-howto.rst
>>
>> It was also noticed by Mellanox' driver:
>> [ 1515.763621] mlx5_core c002:01:00.0: 
>> mlx5_frag_buf_alloc_node:146:(pid 13402): unexpected map alignment: 
>> 0x0800000000c61000, page_shift=16
>> [ 1515.763635] mlx5_core c002:01:00.0: mlx5_cqwq_create:181:(pid
>> 13402): mlx5_frag_buf_alloc_node() failed, -12
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> Should it be
> 
> Fixes: 3c0468d4451e ("powerpc/kernel/iommu: Align size for 
> IOMMU_PAGE_SIZE() to save TCEs")
> 
> ?


I had been wondering the same... I can see many revert commits with and 
without a "Fixes:" line. Since here the offending commit was merged in 
the latest merge window, I was thinking Fixes doesn't really bring 
anything, it will all stay internal to v5.13 development. I'd be happy 
to hear of the expected way of handling it. I'm guessing a big part of 
the answer is whether the tooling looking for a "Fixes" line is also 
looking for reverts.

   Fred



> 
> Anyway,
> 
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

