Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94724A0AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:54:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWq5961myzDqjh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mT2WQqDy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWpbb4WF6zDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:31:55 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JDVeaC147050
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 09:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m6bW5R2v00PN1Jy45HH/vljHEGP3SNiFDZ5gbCGiKIs=;
 b=mT2WQqDycYxV5+sONuIo5p4rOjCbfwAo6bArTI9SEdWPjvdEYBUsHUWxRMWYhG8Unh0o
 ohhIu9FrUuuT6dNBOtUplyn8qzzNjwJn2K1ZdTSFqY5QOxiUhNCqgcLfhDyEmahURMam
 phVmWBh3TYqkM1Mt9yCn/k92qyRMMXG1n6F1NgT48pYCN0F8Odhq/V7qCzuaCrRy3GQ8
 KJLhwTxZluJX95X6Rd+ItbVifRUBmK77powypDdeD2ZsRkIc+0rfBK1FhxkLxiaMP/G8
 FOFsn0FGrxpuwcqOliZGN6mWyf/Zcu0iKbnfMtEiJuZnGd9s4IVwcj5RcsmRHWa1+Lcw Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304rua6pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 09:31:52 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JDVoTC147422
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 09:31:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304rua6g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:31:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JDVHea001388;
 Wed, 19 Aug 2020 13:31:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3304um1w9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:31:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JDVTsC32113120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:31:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D8511C050;
 Wed, 19 Aug 2020 13:31:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354D411C04C;
 Wed, 19 Aug 2020 13:31:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.92.169])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:31:29 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/pci: Fix typo when releasing DMA resources
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20200819130741.16769-1-fbarrat@linux.ibm.com>
 <CAOSf1CG=ecx53ySsmX-7pK_zUJsd9LRMX5V1HBhYZBcOT2z89w@mail.gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <75d99821-ee3d-137e-4e56-b2427f8721da@linux.ibm.com>
Date: Wed, 19 Aug 2020 15:31:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CG=ecx53ySsmX-7pK_zUJsd9LRMX5V1HBhYZBcOT2z89w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190115
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2020 à 15:15, Oliver O'Halloran a écrit :
> On Wed, Aug 19, 2020 at 11:07 PM Frederic Barrat <fbarrat@linux.ibm.com> wrote:
>>
>> Fix typo introduced during recent code cleanup, which could lead to
>> silently not freeing resources or oops message (on PCI hotplug or CAPI
>> reset).
> 
> oof
> 
> Did you actually hit that oops on CAPI reset? Including the stack
> trace is helpful for avoiding this sort of problem in the future.
> Anyway,

yeah, I found it with capi reset. It's actually not a oops, we hit the 
WARN_ON in iommu_tce_table_put(), when we try to release the DMA 
resource for a PE where it was never configured to start with. So that 
was easy to track.

   Fred


> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> 
>> Only impacts ioda2, the code path for ioda1 is correct.
> 
> yeah but no ones uses ioda1
> 
>> Fixes: 01e12629af4e ("powerpc/powernv/pci: Add explicit tracking of the DMA setup state")
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
>> index c9c25fb0783c..023a4f987bb2 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -2705,7 +2705,7 @@ void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
>>          struct iommu_table *tbl = pe->table_group.tables[0];
>>          int64_t rc;
>>
>> -       if (pe->dma_setup_done)
>> +       if (!pe->dma_setup_done)
>>                  return;
>>
>>          rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
>> --
>> 2.26.2
>>
