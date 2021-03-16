Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3D33D489
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0D591dZGz30Qb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:04:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F0D4q2Y0Sz3034
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:03:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83307101E;
 Tue, 16 Mar 2021 06:03:49 -0700 (PDT)
Received: from [10.57.55.99] (unknown [10.57.55.99])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 768DC3F792;
 Tue, 16 Mar 2021 06:03:47 -0700 (PDT)
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Christoph Hellwig <hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de> <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
 <20210311082609.GA6990@lst.de> <dff8eb80-8f74-972b-17e9-496c1fc0396f@arm.com>
 <20210315083347.GA28445@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <42f5aba4-9271-d106-4a85-1bfc9fd98de1@arm.com>
Date: Tue, 16 Mar 2021 13:03:42 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315083347.GA28445@lst.de>
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-15 08:33, Christoph Hellwig wrote:
> On Fri, Mar 12, 2021 at 04:18:24PM +0000, Robin Murphy wrote:
>>> Let me know what you think of the version here:
>>>
>>> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/iommu-cleanup
>>>
>>> I'll happily switch the patch to you as the author if you're fine with
>>> that as well.
>>
>> I still have reservations about removing the attribute API entirely and
>> pretending that io_pgtable_cfg is anything other than a SoC-specific
>> private interface,
> 
> I think a private inteface would make more sense.  For now I've just
> condensed it down to a generic set of quirk bits and dropped the
> attrs structure, which seems like an ok middle ground for now.  That
> being said I wonder why that quirk isn't simply set in the device
> tree?

Because it's a software policy decision rather than any inherent 
property of the platform, and the DT certainly doesn't know *when* any 
particular device might prefer its IOMMU to use cacheable pagetables to 
minimise TLB miss latency vs. saving the cache capacity for larger data 
buffers. It really is most logical to decide this at the driver level.

In truth the overall concept *is* relatively generic (a trend towards 
larger system caches and cleverer usage is about both raw performance 
and saving power on off-SoC DRAM traffic), it's just the particular 
implementation of using io-pgtable to set an outer-cacheable walk 
attribute in an SMMU TCR that's pretty much specific to Qualcomm SoCs. 
Hence why having a common abstraction at the iommu_domain level, but 
where the exact details are free to vary across different IOMMUs and 
their respective client drivers, is in many ways an ideal fit.

>> but the reworked patch on its own looks reasonable to
>> me, thanks! (I wasn't too convinced about the iommu_cmd_line wrappers
>> either...) Just iommu_get_dma_strict() needs an export since the SMMU
>> drivers can be modular - I consciously didn't add that myself since I was
>> mistakenly thinking only iommu-dma would call it.
> 
> Fixed.  Can I get your signoff for the patch?  Then I'll switch it to
> over to being attributed to you.

Sure - I would have thought that the one I originally posted still 
stands, but for the avoidance of doubt, for the parts of commit 
8b6d45c495bd in your tree that remain from what I wrote:

Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.
