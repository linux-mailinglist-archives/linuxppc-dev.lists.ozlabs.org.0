Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD62576DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:50:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg5670Xr5zDqV3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 19:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg1mw6tNVzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 17:19:58 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 22A425C3E15E;
 Mon, 31 Aug 2020 09:19:51 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 31 Aug
 2020 09:19:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048ffa53fc-3ec1-4d58-9d47-755bfa5a545f,
 2EE828B6C747801E22191638F8886DA5C8443DB5) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 5/5] powerpc: use the generic dma_ops_bypass mode
To: Christoph Hellwig <hch@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-6-hch@lst.de>
 <505bcc1d-01a7-9655-88e1-ebddd0b94d56@kaod.org>
 <20200831064038.GB27617@lst.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9492229c-c6ea-6fd2-0424-f82fd259e7d8@kaod.org>
Date: Mon, 31 Aug 2020 09:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831064038.GB27617@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cbc152a6-6b20-466e-80d8-dab2c3638054
X-Ovh-Tracer-Id: 11859948143990049665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohephhgthheslhhsthdruggv
X-Mailman-Approved-At: Mon, 31 Aug 2020 19:46:54 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Daniel Borkmann <daniel@iogearbox.net>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jesper Dangaard Brouer <brouer@redhat.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, aacraid@microsemi.com,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/31/20 8:40 AM, Christoph Hellwig wrote:
> On Sun, Aug 30, 2020 at 11:04:21AM +0200, Cédric Le Goater wrote:
>> Hello,
>>
>> On 7/8/20 5:24 PM, Christoph Hellwig wrote:
>>> Use the DMA API bypass mechanism for direct window mappings.  This uses
>>> common code and speed up the direct mapping case by avoiding indirect
>>> calls just when not using dma ops at all.  It also fixes a problem where
>>> the sync_* methods were using the bypass check for DMA allocations, but
>>> those are part of the streaming ops.
>>>
>>> Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
>>> has never been well defined, as is only used by a few drivers, which
>>> IIRC never showed up in the typical Cell blade setups that are affected
>>> by the ordering workaround.
>>>
>>> Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>  arch/powerpc/Kconfig              |  1 +
>>>  arch/powerpc/include/asm/device.h |  5 --
>>>  arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
>>>  3 files changed, 10 insertions(+), 86 deletions(-)
>>
>> I am seeing corruptions on a couple of POWER9 systems (boston) when
>> stressed with IO. stress-ng gives some results but I have first seen
>> it when compiling the kernel in a guest and this is still the best way
>> to raise the issue.
>>
>> These systems have of a SAS Adaptec controller :
>>
>>   0003:01:00.0 Serial Attached SCSI controller: Adaptec Series 8 12G SAS/PCIe 3 (rev 01)
>>
>> When the failure occurs, the POWERPC EEH interrupt fires and dumps
>> lowlevel PHB4 registers among which :
>> 					  
>>   [ 2179.251069490,3] PHB#0003[0:3]:           phbErrorStatus = 0000028000000000
>>   [ 2179.251117476,3] PHB#0003[0:3]:      phbFirstErrorStatus = 0000020000000000
>>
>> The bits raised identify a PPC 'TCE' error, which means it is related
>> to DMAs. See below for more details.
>>
>>
>> Reverting this patch "fixes" the issue but it is probably else where,
>> in some other layers or in the aacraid driver. How should I proceed 
>> to get more information ?
> 
> The aacraid DMA masks look like a mess.  Can you try the hack
> below and see it it helps?

No effect. The system crashes the same. But Alexey spotted some issue 
with swiotlb.

C. 
