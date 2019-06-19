Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38674B09A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 06:15:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBSJ357bzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TBQ75pVSzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 14:13:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J4C2uZ134761
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:13:16 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7d891a4g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:13:15 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Wed, 19 Jun 2019 05:13:15 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 05:13:13 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J4DCep34341278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 04:13:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5496DBE04F;
 Wed, 19 Jun 2019 04:13:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E335BE051;
 Wed, 19 Jun 2019 04:13:10 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.80.212.11])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Jun 2019 04:13:10 +0000 (GMT)
References: <20190507062559.20295-1-aik@ozlabs.ru>
 <20190507062559.20295-2-aik@ozlabs.ru> <871s162az1.fsf@morokweng.localdomain>
 <bf9f80d8-0179-5330-531a-a243d5c358d4@ozlabs.ru>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 1/2] powerpc/pseries/dma: Allow swiotlb
In-reply-to: <bf9f80d8-0179-5330-531a-a243d5c358d4@ozlabs.ru>
Date: Wed, 19 Jun 2019 01:13:06 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19061904-0016-0000-0000-000009C39218
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011288; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01220047; UDB=6.00641782; IPR=6.01001189; 
 MB=3.00027370; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-19 04:13:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061904-0017-0000-0000-000043B2FF0A
Message-Id: <87v9x26wml.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190033
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 11/05/2019 08:36, Thiago Jung Bauermann wrote:
>>
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>
>>> The commit 8617a5c5bc00 ("powerpc/dma: handle iommu bypass in
>>> dma_iommu_ops") merged direct DMA ops into the IOMMU DMA ops allowing
>>> SWIOTLB as well but only for mapping; the unmapping and bouncing parts
>>> were left unmodified.
>>>
>>> This adds missing direct unmapping calls to .unmap_page() and .unmap_sg().
>>>
>>> This adds missing sync callbacks and directs them to the direct DMA hooks.
>>>
>>> Fixes: 8617a5c5bc00 (powerpc/dma: handle iommu bypass in dma_iommu_ops)
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> Nice! Thanks for working on this. I have the patch at the end of this
>> email to get virtio-scsi-pci and virtio-blk-pci working in a secure
>> guest.
>
> I saw the set_pci_dma_ops(NULL) patch but could not figure out how pass
> NULL there sets the DMA ops to direct.

That causes pcibios_setup_device() to call set_dma_ops(&dev->dev, NULL),
which in turn causes dma_is_direct(get_dma_ops(dev)) to return true.

>> I applied your patch and reverted my patch and unfortunately the guest
>> hangs right after mounting the disk:
>
> Have you applied it on upstream kernel? I cannot see how it affects
> current guests as it is...

I applied it on a branch containing both Claudio Carvalho's "kvmppc:
Paravirtualize KVM to support ultravisor" series as well as my "Secure
Virtual Machine Enablement" patch series.

https://lore.kernel.org/linuxppc-dev/20190518142524.28528-1-cclaudio@linux.ibm.com/
https://lore.kernel.org/linuxppc-dev/20190521044912.1375-1-bauerman@linux.ibm.com/

--
Thiago Jung Bauermann
IBM Linux Technology Center

