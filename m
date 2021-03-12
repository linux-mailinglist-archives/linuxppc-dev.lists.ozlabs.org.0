Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B69893392EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 17:18:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxrbh5Rv0z3dNC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 03:18:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DxrbM6rL0z30M3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 03:18:37 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B392E1FB;
 Fri, 12 Mar 2021 08:18:33 -0800 (PST)
Received: from [10.57.52.136] (unknown [10.57.52.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A040A3F7D7;
 Fri, 12 Mar 2021 08:18:30 -0800 (PST)
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Christoph Hellwig <hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de> <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
 <20210311082609.GA6990@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <dff8eb80-8f74-972b-17e9-496c1fc0396f@arm.com>
Date: Fri, 12 Mar 2021 16:18:24 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311082609.GA6990@lst.de>
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-msm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-11 08:26, Christoph Hellwig wrote:
> On Wed, Mar 10, 2021 at 06:39:57PM +0000, Robin Murphy wrote:
>>> Actually... Just mirroring the iommu_dma_strict value into
>>> struct iommu_domain should solve all of that with very little
>>> boilerplate code.
>>
>> Yes, my initial thought was to directly replace the attribute with a
>> common flag at iommu_domain level, but since in all cases the behaviour
>> is effectively global rather than actually per-domain, it seemed
>> reasonable to take it a step further. This passes compile-testing for
>> arm64 and x86, what do you think?
> 
> It seems to miss a few bits, and also generally seems to be not actually
> apply to recent mainline or something like it due to different empty
> lines in a few places.

Yeah, that was sketched out on top of some other development patches, 
and in being so focused on not breaking any of the x86 behaviours I did 
indeed overlook fully converting the SMMU drivers... oops!

(my thought was to do the conversion for its own sake, then clean up the 
redundant attribute separately, but I guess it's fine either way)

> Let me know what you think of the version here:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/iommu-cleanup
> 
> I'll happily switch the patch to you as the author if you're fine with
> that as well.

I still have reservations about removing the attribute API entirely and 
pretending that io_pgtable_cfg is anything other than a SoC-specific 
private interface, but the reworked patch on its own looks reasonable to 
me, thanks! (I wasn't too convinced about the iommu_cmd_line wrappers 
either...) Just iommu_get_dma_strict() needs an export since the SMMU 
drivers can be modular - I consciously didn't add that myself since I 
was mistakenly thinking only iommu-dma would call it.

Robin.
