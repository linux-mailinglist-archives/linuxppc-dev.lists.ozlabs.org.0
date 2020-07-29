Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61D231EA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 14:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGtN10NZCzDqnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 22:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGtGp4mtMzDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 22:32:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TC3seE050524
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:32:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw71b7pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:32:31 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TC40Pf050956
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:32:30 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw71b6m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 08:32:30 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TCVKZt005545;
 Wed, 29 Jul 2020 12:31:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 32gcq11rg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 12:31:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TCVXRT56623428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 12:31:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D69D9AC060;
 Wed, 29 Jul 2020 12:31:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A4A7AC05E;
 Wed, 29 Jul 2020 12:31:33 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.80.219.128])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 12:31:33 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/pci: Fix build of pci-ioda.o
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Gustavo Romero <gromero@linux.ibm.com>
References: <20200728223337.40447-1-gromero@linux.ibm.com>
 <CAOSf1CG4b_G_dzb2f2pRo-P=Ku4f7QB8VJpRmGjejHi+R2qQGg@mail.gmail.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <8ad01023-3941-b0c5-245e-ce575cfef2c3@linux.vnet.ibm.com>
Date: Wed, 29 Jul 2020 09:31:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CG4b_G_dzb2f2pRo-P=Ku4f7QB8VJpRmGjejHi+R2qQGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290080
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

Hi Oliver,

On 7/28/20 7:50 PM, Oliver O'Halloran wrote:
> On Wed, Jul 29, 2020 at 8:35 AM Gustavo Romero <gromero@linux.ibm.com> wrote:
>>
>> Currently pnv_ioda_setup_bus_dma() is outside of a CONFIG_IOMMU_API guard
>> and if CONFIG_IOMMU_API=n the build can fail if the compiler sets
>> -Werror=unused-function, because pnv_ioda_setup_bus_dma() is only used in
>> functions guarded by a CONFIG_IOMMU_API guard.
>>
>> That issue can be easily reproduced using the skiroot_defconfig. For other
>> configs, like powernv_defconfig, that issue is hidden by the fact that
>> if CONFIG_IOMMU_SUPPORT is enabled plus other common IOMMU options, like
>> CONFIG_OF_IOMMU, by default CONFIG_IOMMU_API is enabled as well. Hence, for
>> powernv_defconfig, it's necessary to set CONFIG_IOMMU_SUPPORT=n to make the
>> build fail, because CONFIG_PCI=y and pci-ioda.c is included in the build,
>> but since CONFIG_IOMMU_SUPPORT=n the CONFIG_IOMMU_API is disabled, breaking
>> the build.
>>
>> This commit fixes that build issue by moving the pnv_ioda_setup_bus_dma()
>> inside a CONFIG_IOMMU_API guard, so when CONFIG_IOMMU_API is disabled that
>> function is not defined.
> 
> I think a fix for this is already in -next.

Indeed.

For the records, it's fixed in -next by:

commit e3417faec526cbf97773dca691dcd743f5bfeb64
Author: Oliver O'Halloran <oohall@gmail.com>
Date:   Sun Jul 5 23:35:57 2020 +1000

     powerpc/powernv: Move pnv_ioda_setup_bus_dma under CONFIG_IOMMU_API
     
     pnv_ioda_setup_bus_dma() is only used when a passed through PE is
     returned to the host. If the kernel is built without IOMMU support
     this is dead code. Move it under the #ifdef with the rest of the
     IOMMU API support.
     
     Reported-by: kernel test robot <lkp@intel.com>
     Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
     Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
     Link: https://lore.kernel.org/r/20200705133557.443607-2-oohall@gmail.com


Thanks.


Cheers,
Gustavo
