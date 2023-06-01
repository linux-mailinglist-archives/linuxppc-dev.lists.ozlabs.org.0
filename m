Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C071F348
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 21:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXH0X4y5jz3dxV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 05:54:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXH043Jxwz3cdQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 05:54:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2051063;
	Thu,  1 Jun 2023 12:54:40 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2A163F7BD;
	Thu,  1 Jun 2023 12:53:48 -0700 (PDT)
Message-ID: <ef78fd49-4609-b947-b26d-f3f5ac66178f@arm.com>
Date: Thu, 1 Jun 2023 20:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 09/25] iommu/fsl_pamu: Implement an IDENTITY domain
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
References: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <84aa0f5e-f13d-40f5-abe6-e8ac231e2d95@arm.com> <ZHj1kXMMf5iqxXOV@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZHj1kXMMf5iqxXOV@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-06-01 20:46, Jason Gunthorpe wrote:
> On Thu, Jun 01, 2023 at 08:37:45PM +0100, Robin Murphy wrote:
>> On 2023-05-16 01:00, Jason Gunthorpe wrote:
>>> Robin was able to check the documentation and what fsl_pamu has
>>> historically called detach_dev() is really putting the IOMMU into an
>>> IDENTITY mode.
>>
>> Unfortunately it was the other way around - it's the call to
>> fsl_setup_liodns() from fsl_pamu_probe() which leaves everything in bypass
>> by default (the PAACE_ATM_NO_XLATE part, IIRC), whereas the detach_device()
>> call here ends up disabling the given device's LIODN altogether
> 
> Er, I see.. Let me think about it, you convinced me to change it from
> PLATFORM, so maybe we should go back to that if it is all wonky.

FWIW I was thinking more along the lines of a token nominal identity 
domain where attach does nothing at all...

>> There doesn't appear to have ever been any code anywhere for putting
>> things *back* into bypass after using a VFIO domain, so as-is these
>> default domains would probably break all DMA :(
> 
> Sounds like it just never worked right.
> 
> ie going to VFIO mode was always a one way trip and you can't go back
> to a kernel driver.

...on the assumption that doing so wouldn't really be any less broken 
than it always has been :)

Thanks,
Robin.

> I don't think this patch makes it worse because we call the identity
> attach_dev in all the same places we called detach_dev in the first
> place.
> 
> We add an extra call at the start of time, but that call is NOP'd
> by this:
> 
>>> 	if (domain == platform_domain || !domain)
>>> +		return 0;
>>> +
> 
> (bah, and the variable name needs updating too)
> 
> Honestly, I don't really want to fix FSL since it seems abandoned, so
> either this patch or going back to PLATFORM seems like the best option.
> 
> Jason
