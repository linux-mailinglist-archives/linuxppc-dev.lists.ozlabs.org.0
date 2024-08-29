Return-Path: <linuxppc-dev+bounces-750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730A96492B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 16:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvkpC5gw0z2xMQ;
	Fri, 30 Aug 2024 00:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724943283;
	cv=none; b=hVOZIEsFRfhhm7iWtPkNLJ2aAv7LXdMrfPQWoEhvJVfo1u/xWHCML9FlAG6H8oc1jkdpAHfl7q5K+qS42IfbSidVFBsRHbsm2SizQF9h+OJRaxzVrNmptbbtaOqacnqmD/KvdmHmVr1s8VR6WGQDXElAPbLKHpnW4+QyO1MHRwiqIA8oV2vnefst/so6uoWPiDPQO+oZl0ATSsHct+Tq4xuRP9O0LeMgLr1W+04xQ9KwbW8JgOseENW/AXvI8rj5Rja8rPoiyN2t/LOHaFl777vlHS4SdtTWjcIJy2B+5NuzgKs2xvILHoE9hcX5XjCMyB9yDLc2cdUKjnNe7asjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724943283; c=relaxed/relaxed;
	bh=65MyFHHTA1PsDIlSg/rTxhPf0z2KfhQQqeQtyDirckk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Reply-To:Subject:To:Cc:References:Content-Language:Autocrypt:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=P12Axlv8B9sAvuBqyE9muDhXRjrwu+zmI+MX0hfr4ErWynd4A9KSf4PW5ltQa/E1GhOmMJEGG6R1BxhKaah5OiGF2QhZkThT02yRq5YUsfjKrOypf+cxhxY/y/6gdOtSqCI8GXqbhortd0m1T67Bjr4OqDsHx3aICJlw9CDqgGc51p5epFAb/52SPgVablwBDNgA0N0izJKMoIJQNwfwb85zdQ4R2R4P0joMiBD72fKKwFYiTqgQMhsltA9Z9bo/MvYG3iA6eimGKJiwRLH5BncojfR04gzT+oDIEbLy/U/+NlFwSF/Cg0G+mwxdFEyAuKcuhyT7Xyi6xWuBjYzapg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6OZgnfW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6OZgnfW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvkpB62N7z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 00:54:42 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so6892245e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724943269; x=1725548069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65MyFHHTA1PsDIlSg/rTxhPf0z2KfhQQqeQtyDirckk=;
        b=L6OZgnfWsWskvMIjsTN4nZAh4TDBT8XTdUlUHPEcQkeEeNfGCrWdfw4kI/EL69MjWp
         wb9mnrEu4675I8VD9k/47OKL7NCs9dM3fjFYUe/T1FGq6LYjBXOEWX9ggGB/d2xSfiOo
         3g6Gr6g7RaZWCliYOOWbkgleKcH8UUex7xVE4EuN0KeU7e5T78DtESZnjzLf9qrAo+DH
         EGYb9UaOlCWeCZNl1IEJIlcmySPWHaYsFUKOwDknj1PDk5Mus4NcFq5HQunHy1CCLa1J
         0yNBeDxSxZNwkiAhlj3LioaY7fqRW9k0cjuaUfSjZWipYYDYdMJwoySYmAzLRpxbPZJI
         0AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724943269; x=1725548069;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=65MyFHHTA1PsDIlSg/rTxhPf0z2KfhQQqeQtyDirckk=;
        b=cNhWk0EiO911sF8wWU7fCCLhcp9y+9UvdnL/m3Xrg+XV0UOuAH4qepL8A5c1/wMKsn
         sxRu70O2WT3SUkXztdBXIwwGRKTkeUNiiI6rcZIo9llgKobbmwSe46M+EJsbUCoqOVFC
         /8zqNJ2OYtitW0v0uXXD8Q3wLtO49suXo0YjjXitDe00E9NgUroZOPFVvgQ991/TuVpv
         vvOk016deCpfpfrVgUEGaRP+oPKo0GEHJ2C+zFFwWzwMrCPEs1yOgvBmAGz/G8LyXwja
         A6IZA4Z3qmn+ueZsr9IYv9qZQLL1PByHOfuAihPqUG9dotv6Gmv3uFwZzFzia8PNWCPe
         fA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2YDFhY2SpQ6k4t6ONM2B7SyjdjieLnkaCPNwSYHM7acy0M4WOhwR5hbsU6msEN4Xh1JIGOwB/msDGLWY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGI1bJVay/PL7I5axaiA4EzQsAg5KFT4Zu5Av7hD5ONaFR49UN
	7vaE2XIi5IWWJj+xorxALO9nDdeNaTGBJbaFye4f3PpqxbUuAmnIwdq+yU4YTw0=
X-Google-Smtp-Source: AGHT+IHZH6stL4551rGqzrB66QW6+0W2V+BEhTdVDMA/uaumsNpkCQJsZo6bnlAOMG7WaWFSPvBr0g==
X-Received: by 2002:a05:600c:3596:b0:426:61e8:fb35 with SMTP id 5b1f17b1804b1-42bb02812aamr25983165e9.4.1724943268906;
        Thu, 29 Aug 2024 07:54:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915? ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6a10353sm17740285e9.1.2024.08.29.07.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:54:28 -0700 (PDT)
Message-ID: <8d630ba4-8f6d-427d-bfa3-8eeba002517c@linaro.org>
Date: Thu, 29 Aug 2024 16:54:27 +0200
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
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
To: Robin Murphy <robin.murphy@arm.com>, Baruch Siach <baruch@tkos.co.il>,
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
 <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robin,

On 29/08/2024 16:38, Robin Murphy wrote:
> On 2024-08-29 2:42 pm, Neil Armstrong wrote:
>> Hi,
>>
>> On 11/08/2024 09:09, Baruch Siach wrote:
>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>
>>> Hardware DMA limit might not be power of 2. When RAM range starts above
>>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>>> can not encode this limit.
>>>
>>> Use plain address for DMA zone limit.
>>>
>>> Since DMA zone can now potentially span beyond 4GB physical limit of
>>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>>
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>>>   arch/powerpc/mm/mem.c      |  5 ++++-
>>>   arch/s390/mm/init.c        |  2 +-
>>>   include/linux/dma-direct.h |  2 +-
>>>   kernel/dma/direct.c        |  6 +++---
>>>   kernel/dma/pool.c          |  4 ++--
>>>   kernel/dma/swiotlb.c       |  6 +++---
>>>   7 files changed, 29 insertions(+), 26 deletions(-)
>>>
>>
>> <snip>
>>
>> This change breaks the Qualcomm SM8550-HDK boot since next-20240826.
>> It doesn't affect SM8550-QRD or other similar SoCs like SM8650 or SM8450.
>> The last CI run on next-20240828 can be found at:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/100936
>>
>> SM8550-HDK boot log:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/165617
>>
> [...]
> 
> Yeah, a 35-bit ZONE_DMA is sure to make stuff go wrong:
> 
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000000080000000-0x0000000affffffff]
>> [    0.000000]   DMA32    empty
>> [    0.000000]   Normal   empty
> 
> Compared to before:
> 
> [    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]
> 
> This'll be because the SoC DT is describing a general non-restrictive range:
>          dma-ranges = <0 0 0 0 0x10 0>;
> 
> Which proves we need more information than {acpi,of}_dma_get_max_cpu_address() are currently able to give us, because what zone_dma_limit actually wants to be is the *minimum* of the lowest highest CPU address of any DMA range, and the lowest CPU address of any DMA range + 2^32. I was thinking it had all ended up looking a bit too easy... :)
> 
> I think v1 of the fix[1] might actually work out for this, albeit still for the wrong reasons - if so, I concede that maybe at this point it might be safest to go back to that one as a quick short-term fix (with a big fat comment to say so) rather than try to rush the proper solution or revert everything.

Indeed v1 patches makes boot work again:
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]

Please add my:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

Thanks,
Neil

> 
> Thanks,
> Robin.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/731d204f5f556ad61bbaf004b1d984f83c90b4f5.1724748249.git.baruch@tkos.co.il/


