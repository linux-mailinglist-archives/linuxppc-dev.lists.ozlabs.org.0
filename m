Return-Path: <linuxppc-dev+bounces-749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3D9648BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 16:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvkTf2lKYz2ywS;
	Fri, 30 Aug 2024 00:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724942422;
	cv=none; b=cu5QiHx1M0JiukymkZkO/6JxvJ7vH5AbUXVBCfFXpa0pe4A8XtYyZ2uAH9ZvWsIVGKOeLopQj2Im2CMrJ+EbzVO8pZZg2JwkZK6lMCOHqbvRuTRUC2y0K2S7teFhLjCfmzEacWw+CrboLDeo61xJlzLlyGFywhc9RxoKzWoofGMxtKciGqlDdmzoArDqlr5BUasx0uR70lcV5G2vDVBDnyFDsrCv05XlyYIbAo27tvNIgJg/8tH5yJi1sYv5NIAnxAvoMEBflRk04/l3FOVO5r11PbK0HReFybFv2AASZj2DwdW0PLUjdZEfihWKcGhF2W1tO800U9zDKwLX8anB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724942422; c=relaxed/relaxed;
	bh=5h38Z3E+zlVTIdH2nLUu8uT9JIQpWzRo6U6RS2E4OlE=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=Z+NP2wDLBq0AR0gH2k1pgEPkFsLN1smm0W9T6oCghi9pVyGfPgOAeU/OcbOQnGOO63u2Z+Qwo1nP+IEikHLJqoJCL3UtjsG+sUP2JPBPOQK4sxzEPHrVy4thuJVSckTzQxw4DUVLO79bBlZkOEzGEvUBoqmacVoN3qlnhTbtLgWxi1xQAJl14HfbVHIPp4hDSZK4YbzZAwcTG4hxqF+zJvBZnBfFBExTgNFrYAepu74ovXY10+zjrTeln/GvBT+xP0giIRk+8A6fxg+dAEHBp3tlrTd/T/Joujwm2XZhN1BiLFBhF1//fCAx/cqq5dJx1bAixvKApUWE2Huo+Ty8+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvkTd6wXJz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 00:40:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F9BDA7;
	Thu, 29 Aug 2024 07:40:16 -0700 (PDT)
Received: from [10.57.16.245] (unknown [10.57.16.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A801D3F66E;
	Thu, 29 Aug 2024 07:39:13 -0700 (PDT)
Message-ID: <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
Date: Thu, 29 Aug 2024 15:38:50 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
To: neil.armstrong@linaro.org, Baruch Siach <baruch@tkos.co.il>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?=
 <petr@tesarici.cz>, Ramon Fried <ramon@neureality.ai>,
 Elad Nachman <enachman@marvell.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1723359916.git.baruch@tkos.co.il>
 <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
 <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-08-29 2:42 pm, Neil Armstrong wrote:
> Hi,
> 
> On 11/08/2024 09:09, Baruch Siach wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>>
>> Hardware DMA limit might not be power of 2. When RAM range starts above
>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>> can not encode this limit.
>>
>> Use plain address for DMA zone limit.
>>
>> Since DMA zone can now potentially span beyond 4GB physical limit of
>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>>   arch/powerpc/mm/mem.c      |  5 ++++-
>>   arch/s390/mm/init.c        |  2 +-
>>   include/linux/dma-direct.h |  2 +-
>>   kernel/dma/direct.c        |  6 +++---
>>   kernel/dma/pool.c          |  4 ++--
>>   kernel/dma/swiotlb.c       |  6 +++---
>>   7 files changed, 29 insertions(+), 26 deletions(-)
>>
> 
> <snip>
> 
> This change breaks the Qualcomm SM8550-HDK boot since next-20240826.
> It doesn't affect SM8550-QRD or other similar SoCs like SM8650 or SM8450.
> The last CI run on next-20240828 can be found at:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/100936
> 
> SM8550-HDK boot log:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/165617
> 
[...]

Yeah, a 35-bit ZONE_DMA is sure to make stuff go wrong:

> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000080000000-0x0000000affffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty

Compared to before:

[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]

This'll be because the SoC DT is describing a general non-restrictive range:
		dma-ranges = <0 0 0 0 0x10 0>;

Which proves we need more information than 
{acpi,of}_dma_get_max_cpu_address() are currently able to give us, 
because what zone_dma_limit actually wants to be is the *minimum* of the 
lowest highest CPU address of any DMA range, and the lowest CPU address 
of any DMA range + 2^32. I was thinking it had all ended up looking a 
bit too easy... :)

I think v1 of the fix[1] might actually work out for this, albeit still 
for the wrong reasons - if so, I concede that maybe at this point it 
might be safest to go back to that one as a quick short-term fix (with a 
big fat comment to say so) rather than try to rush the proper solution 
or revert everything.

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/731d204f5f556ad61bbaf004b1d984f83c90b4f5.1724748249.git.baruch@tkos.co.il/

