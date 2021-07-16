Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A73CB733
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 14:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR98r1pmlz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 22:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GR98P2Rt2z2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 22:11:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03A52D6E;
 Fri, 16 Jul 2021 05:11:43 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A2A3F774;
 Fri, 16 Jul 2021 05:11:39 -0700 (PDT)
Subject: Re: [PATCH v1 14/16] x86/amd_gart: return error code from
 gart_map_sg()
To: Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-15-logang@deltatee.com> <20210716063241.GC13345@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <98c09e65-35d0-dde5-75fc-e3d99864d078@arm.com>
Date: Fri, 16 Jul 2021 13:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716063241.GC13345@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 Niklas Schnelle <schnelle@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Bates <sbates@raithlin.com>,
 linuxppc-dev@lists.ozlabs.org, Martin Oliveira <martin.oliveira@eideticom.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-07-16 07:32, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 10:45:42AM -0600, Logan Gunthorpe wrote:
>> @@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>>   	iommu_full(dev, pages << PAGE_SHIFT, dir);
>>   	for_each_sg(sg, s, nents, i)
>>   		s->dma_address = DMA_MAPPING_ERROR;
>> -	return 0;
>> +	return ret;
> 
> While we're at it - setting the ->dma_address to DMA_MAPPING_ERROR is
> not part of the ->map_sg calling convention.  Might be worth to fix
> up while we're at it.

Especially since it's not even zeroing dma_length, which at least is a 
documented indicator of validity (even if it's not strictly defined for 
failure cases either).

Robin.
