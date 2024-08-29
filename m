Return-Path: <linuxppc-dev+bounces-748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD296489F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 16:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvkNz3r60z2yvy;
	Fri, 30 Aug 2024 00:36:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724938948;
	cv=none; b=m6MVyVJ3ixb0xr8jKLuVLv/nq0HY8IbW50fIGsNHAOMsXHnpfUnxiUjGYS/oYVlTficg4zTYqk16yOLWtqyPL2NyuhAkuE/2a6gEWPbFSgMjkDa/iYnEPg2A4AoEd1WcaMeqAo+SRa1XYiLyln9WyqroA+Z+BeMdyGaPpOgtWIr0YPJRZTjKbxIqLfHnd5pSu79A/wm5jqzW9HvZPik3qt/T4JaUG8oTDbyejtwzzd6Yt460vmQX7ocg+T9rK9ZKCOUwVA76pLuEdPyPpN57B5qiRpXFOJwbhhNiR+o2445MOZfUDr3A6C97dsTPOO3FK2oB0G89F5Av6RSH7y3lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724938948; c=relaxed/relaxed;
	bh=FoG6gOdHf1HP1VTDv7088giQSQCBpAPPzy76E7CMM/M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:Reply-To:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=jem5komM7SWEVnBSjIzhRnHPYjEYusR7RnWXme3/688vE7Y53Htpps/Ee/hxRltJDsDDyiKgpNLYQONDzZixyu+CkBLnybgL9FjMjeOjzpULN6QPol7UORMpnvDxpJzZnWrN5LA2Yum9ZNOco39r+MRl+oiITSpIJ8JW7VsAHD6L4StC8dJYLqdFogqHGDO/HR4dpABOO6WzpzSVtya4xVr9rnj3unf23AdpZQ0++RG3HnhA20l/rkFG1pJ5OMOALFNoAju2c2s/0oix8ZWZ8dyT9p/Xvh593lK1ge2KI0VVmTRqKpTEIt6OmK2mT177W9WDH9MXEdapT5phv7yt4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2oDK7zM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2oDK7zM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvjBq3LmXz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 23:42:25 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428163f7635so5983585e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724938937; x=1725543737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoG6gOdHf1HP1VTDv7088giQSQCBpAPPzy76E7CMM/M=;
        b=K2oDK7zMkMKSyFy6SUlyvtVVtag4c908BIprJi2GDIsZVDjU9HADzI/2dpUNA4UEZm
         aD06619vsNjP4EpmFinuuOorGJKE0m6sXVDKrnacgZPqZw1sO5CeJlyC1yOFGI60smHr
         svAAM/CjCF1rkCeOXNXa4krfmKnARG+WH22EnRGLhS3duboQP7TD19SUJ1pRWx/2f+lE
         IWM6aihhfoD7o+4pf4/kGeq1f1L7T1/2IuU1juSMzZVSPV9sNRKPhC11+B+GR8ltl+ED
         p1l748zzI6XslB2KtawSHRXYOhUQA8ROl7bhaMFSaeSf8KgGV79RS3iqkuPYMGianvAb
         BTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938937; x=1725543737;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FoG6gOdHf1HP1VTDv7088giQSQCBpAPPzy76E7CMM/M=;
        b=GUzvush3z0A2FwxY3AqOUp/+R9rjc1zuvRdTnI12r9u5hPrAPiOqSbe1jsN+d7my7r
         F/8supHr7s42jFCbfloL+VFMdqDgUvIz39lTpCergWKdAE2o3Jb7tmPEj+uLBwkga/it
         s27p3wj5VUuvXEeTVT6FEF32XsPJG72mOUVrPvGWKiZMSC0+i2CvO4t3sBK5IAiEQ7se
         bIvz7EawPZXcBhLKE4WtmLYkEqhOMo/xj30C2c4zrVQxnlrRe27eCIx3piEti9B0gIo2
         XDpQfyxMWSjEhZo9fJ+vGFA4Rs/bBZBkmAnJ1FrOo6WvtmvBmYyHv9jmohyFFyVduHDF
         kr9w==
X-Forwarded-Encrypted: i=1; AJvYcCVCmrKxUW0pPSAcicymucXVqqFyUfBZvBXMGrVK4GGYsZeRH+KVQAdgWsq9wZI6iQe8cx9bIGF2jaDTI4k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxA5CMKDy0vJmr6zBmvohHpHXRYAFBQy4Bt8Cs9MMKtfmFlr2X1
	oSRDMByghVt2Ug2/+Hw7TbD+LmY+uQuGeTtGHczr6P1d0gyt5Kf1aBtyxIORuOM=
X-Google-Smtp-Source: AGHT+IGwp2POMNuFsNOjvR1h4v001LYW5woE4Fg94qROfG+HCsBrUKihhEXJ04uGl/HbRFmrohuXlg==
X-Received: by 2002:a05:6000:1a47:b0:367:95e6:158a with SMTP id ffacd0b85a97d-3749b58e42bmr1623520f8f.63.1724938936800;
        Thu, 29 Aug 2024 06:42:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915? ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639d440sm52654195e9.13.2024.08.29.06.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:42:16 -0700 (PDT)
Message-ID: <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
Date: Thu, 29 Aug 2024 15:42:14 +0200
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
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>,
 Ramon Fried <ramon@neureality.ai>, Elad Nachman <enachman@marvell.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1723359916.git.baruch@tkos.co.il>
 <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Organization: Linaro
In-Reply-To: <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2024 09:09, Baruch Siach wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Hardware DMA limit might not be power of 2. When RAM range starts above
> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> can not encode this limit.
> 
> Use plain address for DMA zone limit.
> 
> Since DMA zone can now potentially span beyond 4GB physical limit of
> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>   arch/powerpc/mm/mem.c      |  5 ++++-
>   arch/s390/mm/init.c        |  2 +-
>   include/linux/dma-direct.h |  2 +-
>   kernel/dma/direct.c        |  6 +++---
>   kernel/dma/pool.c          |  4 ++--
>   kernel/dma/swiotlb.c       |  6 +++---
>   7 files changed, 29 insertions(+), 26 deletions(-)
> 

<snip>

This change breaks the Qualcomm SM8550-HDK boot since next-20240826.
It doesn't affect SM8550-QRD or other similar SoCs like SM8650 or SM8450.
The last CI run on next-20240828 can be found at:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/100936

SM8550-HDK boot log:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/165617

bisect log:
# bad: [b18bbfc14a38b5234e09c2adcf713e38063a7e6e] Add linux-next specific files for 20240829
# good: [5be63fc19fcaa4c236b307420483578a56986a37] Linux 6.11-rc5
git bisect start 'FETCH_HEAD' 'v6.11-rc5'
# bad: [dc09f0263a0accf41821d260f4bf7ad9a4f7b7d8] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
git bisect bad dc09f0263a0accf41821d260f4bf7ad9a4f7b7d8
# bad: [97c7e618752776e03f50311400bb73c01489fb17] Merge branch 'for-next' of git://github.com/Xilinx/linux-xlnx.git
git bisect bad 97c7e618752776e03f50311400bb73c01489fb17
# good: [27ad8eb339a5e3f96aed5f3a3b5901994ce7856d] Merge branch 'clang-format' of https://github.com/ojeda/linux.git
git bisect good 27ad8eb339a5e3f96aed5f3a3b5901994ce7856d
# bad: [fd34d49f6d8dbd157b17b675dc51a145cdad580c] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
git bisect bad fd34d49f6d8dbd157b17b675dc51a145cdad580c
# bad: [29f35e8cf8bff7c69a740edb1cf3d62d211f5a43] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
git bisect bad 29f35e8cf8bff7c69a740edb1cf3d62d211f5a43
# good: [41860d49473c0c09dc0a2a4d148047f97aaa2539] perf sched: Use perf_tool__init()
git bisect good 41860d49473c0c09dc0a2a4d148047f97aaa2539
# good: [6236ebe07131a7746d870f1d8eb3637a8df13e70] perf daemon: Fix the build on more 32-bit architectures
git bisect good 6236ebe07131a7746d870f1d8eb3637a8df13e70
# good: [92b0d033c80c882e6be26dfeeb2f24c53bdeeee6] Merge branches 'for-next/acpi', 'for-next/misc', 'for-next/perf', 'for-next/selftests' and 'for-next/timers' into for-next/core
git bisect good 92b0d033c80c882e6be26dfeeb2f24c53bdeeee6
# bad: [5db893307df81f0c1dd6b6f167dc263e88ba855a] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git
git bisect bad 5db893307df81f0c1dd6b6f167dc263e88ba855a
# bad: [f65eaf209abc5f4761623aaa1e110bdb6de124ed] Merge branch 'for-next' of git://git.infradead.org/users/hch/dma-mapping.git
git bisect bad f65eaf209abc5f4761623aaa1e110bdb6de124ed
# bad: [f69e342eec008e1bab772d3963c3dd9979293e13] dma-mapping: call ->unmap_page and ->unmap_sg unconditionally
git bisect bad f69e342eec008e1bab772d3963c3dd9979293e13
# bad: [ba0fb44aed47693cc2482427f63ba6cd19051327] dma-mapping: replace zone_dma_bits by zone_dma_limit
git bisect bad ba0fb44aed47693cc2482427f63ba6cd19051327
# good: [fa3c109a6d302b56437a6412c5f3044c3e12de03] dma-mapping: use bit masking to check VM_DMA_COHERENT
git bisect good fa3c109a6d302b56437a6412c5f3044c3e12de03
# first bad commit: [ba0fb44aed47693cc2482427f63ba6cd19051327] dma-mapping: replace zone_dma_bits by zone_dma_limit

Boot log with earlycon:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd461]
[    0.000000] Linux version 6.11.0-rc5-next-20240829-07694-gb36219e63903 (narmstrong@arrakeen.starnux.net) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.2.rel1 (Build arm-13.7)) 13.2.1 20231009, GNU ld (Arm GNU Toolchain 13.2.rel1 (Build arm-13.7)) 2.41.0.20231009) #397 SMP PREEMPT Thu Aug 29 15:25:39 CEST 2024
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Qualcomm Technologies, Inc. SM8550 HDK
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] OF: reserved mem: 0x0000000080000000..0x00000000809fffff (10240 KiB) nomap non-reusable hyp-region@80000000
[    0.000000] OF: reserved mem: 0x0000000080a00000..0x0000000080dfffff (4096 KiB) nomap non-reusable cpusys-vm-region@80a00000
[    0.000000] OF: reserved mem: 0x0000000080e00000..0x00000000811cffff (3904 KiB) nomap non-reusable hyp-tags-region@80e00000
[    0.000000] OF: reserved mem: 0x00000000811d0000..0x00000000811fffff (192 KiB) nomap non-reusable hyp-tags-reserved-region@811d0000
[    0.000000] OF: reserved mem: 0x0000000081a00000..0x0000000081c5ffff (2432 KiB) nomap non-reusable xbl-dt-log-merged-region@81a00000
[    0.000000] OF: reserved mem: 0x0000000081c60000..0x0000000081c7ffff (128 KiB) nomap non-reusable aop-cmd-db-region@81c60000
[    0.000000] OF: reserved mem: 0x0000000081c80000..0x0000000081cf3fff (464 KiB) nomap non-reusable aop-config-merged-region@81c80000
[    0.000000] OF: reserved mem: 0x0000000081d00000..0x0000000081efffff (2048 KiB) nomap non-reusable smem@81d00000
[    0.000000] OF: reserved mem: 0x0000000081f00000..0x0000000081f1ffff (128 KiB) nomap non-reusable adsp-mhi-region@81f00000
[    0.000000] OF: reserved mem: 0x0000000082600000..0x00000000826fffff (1024 KiB) nomap non-reusable global-sync-region@82600000
[    0.000000] OF: reserved mem: 0x0000000082700000..0x00000000827fffff (1024 KiB) nomap non-reusable tz-stat-region@82700000
[    0.000000] OF: reserved mem: 0x0000000082800000..0x0000000086dfffff (71680 KiB) nomap non-reusable cdsp-secure-heap-region@82800000
[    0.000000] OF: reserved mem: 0x000000008a800000..0x000000009affffff (270336 KiB) nomap non-reusable mpss-region@8a800000
[    0.000000] OF: reserved mem: 0x000000009b000000..0x000000009b07ffff (512 KiB) nomap non-reusable q6-mpss-dtb-region@9b000000
[    0.000000] OF: reserved mem: 0x000000009b080000..0x000000009b08ffff (64 KiB) nomap non-reusable ipa-fw-region@9b080000
[    0.000000] OF: reserved mem: 0x000000009b090000..0x000000009b099fff (40 KiB) nomap non-reusable ipa-gsi-region@9b090000
[    0.000000] OF: reserved mem: 0x000000009b09a000..0x000000009b09bfff (8 KiB) nomap non-reusable gpu-micro-code-region@9b09a000
[    0.000000] OF: reserved mem: 0x000000009b100000..0x000000009b27ffff (1536 KiB) nomap non-reusable spss-region@9b100000
[    0.000000] OF: reserved mem: 0x000000009b280000..0x000000009b2dffff (384 KiB) nomap non-reusable spu-tz-shared-region@9b280000
[    0.000000] OF: reserved mem: 0x000000009b2e0000..0x000000009b2fffff (128 KiB) nomap non-reusable spu-modem-shared-region@9b2e0000
[    0.000000] OF: reserved mem: 0x000000009b300000..0x000000009bafffff (8192 KiB) nomap non-reusable camera-region@9b300000
[    0.000000] OF: reserved mem: 0x000000009bb00000..0x000000009c1fffff (7168 KiB) nomap non-reusable video-region@9bb00000
[    0.000000] OF: reserved mem: 0x000000009c200000..0x000000009c8fffff (7168 KiB) nomap non-reusable cvp-region@9c200000
[    0.000000] OF: reserved mem: 0x000000009c900000..0x000000009e8fffff (32768 KiB) nomap non-reusable cdsp-region@9c900000
[    0.000000] OF: reserved mem: 0x000000009e900000..0x000000009e97ffff (512 KiB) nomap non-reusable q6-cdsp-dtb-region@9e900000
[    0.000000] OF: reserved mem: 0x000000009e980000..0x000000009e9fffff (512 KiB) nomap non-reusable q6-adsp-dtb-region@9e980000
[    0.000000] OF: reserved mem: 0x000000009ea00000..0x00000000a2a7ffff (66048 KiB) nomap non-reusable adspslpi-region@9ea00000
[    0.000000] OF: reserved mem: 0x00000000d4a80000..0x00000000d4cfffff (2560 KiB) nomap non-reusable rmtfs-region@d4a80000
[    0.000000] OF: reserved mem: 0x00000000d4d00000..0x00000000d7ffffff (52224 KiB) nomap non-reusable mpss-dsm-region@d4d00000
[    0.000000] OF: reserved mem: 0x00000000d8000000..0x00000000d80fffff (1024 KiB) nomap non-reusable tz-reserved-region@d8000000
[    0.000000] OF: reserved mem: 0x00000000d8100000..0x00000000d813ffff (256 KiB) nomap non-reusable xbl-sc-region@d8100000
[    0.000000] OF: reserved mem: 0x00000000d8140000..0x00000000d82fffff (1792 KiB) nomap non-reusable cpucp-fw-region@d8140000
[    0.000000] OF: reserved mem: 0x00000000d8300000..0x00000000d87fffff (5120 KiB) nomap non-reusable qtee-region@d8300000
[    0.000000] OF: reserved mem: 0x00000000d8800000..0x00000000e11fffff (141312 KiB) nomap non-reusable ta-region@d8800000
[    0.000000] OF: reserved mem: 0x00000000e1200000..0x00000000e393ffff (40192 KiB) nomap non-reusable tz-tags-region@e1200000
[    0.000000] OF: reserved mem: 0x00000000e6440000..0x00000000e66b8fff (2532 KiB) nomap non-reusable hwfence-shbuf-region@e6440000
[    0.000000] OF: reserved mem: 0x00000000f3600000..0x00000000f80edfff (76728 KiB) nomap non-reusable trust-ui-vm-region@f3600000
[    0.000000] OF: reserved mem: 0x00000000f80ee000..0x00000000f80eefff (4 KiB) nomap non-reusable trust-ui-vm-dump-region@f80ee000
[    0.000000] OF: reserved mem: 0x00000000f80ef000..0x00000000f80f7fff (36 KiB) nomap non-reusable trust-ui-vm-qrt-region@f80ef000
[    0.000000] OF: reserved mem: 0x00000000f80f8000..0x00000000f80fbfff (16 KiB) nomap non-reusable trust-ui-vm-vblk0-ring-region@f80f8000
[    0.000000] OF: reserved mem: 0x00000000f80fc000..0x00000000f80fffff (16 KiB) nomap non-reusable trust-ui-vm-vblk1-ring-region@f80fc000
[    0.000000] OF: reserved mem: 0x00000000f8100000..0x00000000f81fffff (1024 KiB) nomap non-reusable trust-ui-vm-swiotlb-region@f8100000
[    0.000000] OF: reserved mem: 0x00000000f8400000..0x00000000fcbfffff (73728 KiB) nomap non-reusable oem-vm-region@f8400000
[    0.000000] OF: reserved mem: 0x00000000fcc00000..0x00000000fcc03fff (16 KiB) nomap non-reusable oem-vm-vblk0-ring-region@fcc00000
[    0.000000] OF: reserved mem: 0x00000000fcc04000..0x00000000fcd03fff (1024 KiB) nomap non-reusable oem-vm-swiotlb-region@fcc04000
[    0.000000] OF: reserved mem: 0x00000000fce00000..0x00000000ff6fffff (41984 KiB) nomap non-reusable hyp-ext-tags-region@fce00000
[    0.000000] OF: reserved mem: 0x00000000ff700000..0x00000000ff7fffff (1024 KiB) nomap non-reusable hyp-ext-reserved-region@ff700000
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000a9c000 (options '115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x0000000affffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0xafe933200-0xafe93583f]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x0000000affffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000080dfffff]
[    0.000000]   node   0: [mem 0x00000000811d0000-0x00000000811fffff]
[    0.000000]   node   0: [mem 0x0000000081200000-0x00000000819fffff]
[    0.000000]   node   0: [mem 0x0000000081a00000-0x0000000081cf3fff]
[    0.000000]   node   0: [mem 0x0000000081cf4000-0x0000000081cfffff]
[    0.000000]   node   0: [mem 0x0000000081d00000-0x0000000081f1ffff]
[    0.000000]   node   0: [mem 0x0000000081f20000-0x00000000825fffff]
[    0.000000]   node   0: [mem 0x0000000082600000-0x0000000086dfffff]
[    0.000000]   node   0: [mem 0x0000000086e00000-0x000000008a7fffff]
[    0.000000]   node   0: [mem 0x000000008a800000-0x000000009b09bfff]
[    0.000000]   node   0: [mem 0x000000009b09c000-0x000000009b0fffff]
[    0.000000]   node   0: [mem 0x000000009b100000-0x00000000a2a7ffff]
[    0.000000]   node   0: [mem 0x00000000a2a80000-0x00000000d4a7ffff]
[    0.000000]   node   0: [mem 0x00000000d4a80000-0x00000000d7ffffff]
[    0.000000]   node   0: [mem 0x00000000d8140000-0x00000000d815ffff]
[    0.000000]   node   0: [mem 0x00000000e1bb0000-0x00000000e393ffff]
[    0.000000]   node   0: [mem 0x00000000e3940000-0x00000000e643ffff]
[    0.000000]   node   0: [mem 0x00000000e6440000-0x00000000e66b8fff]
[    0.000000]   node   0: [mem 0x00000000e66b9000-0x00000000f35fffff]
[    0.000000]   node   0: [mem 0x00000000f3600000-0x00000000f81fffff]
[    0.000000]   node   0: [mem 0x00000000f8200000-0x00000000f83fffff]
[    0.000000]   node   0: [mem 0x00000000f8400000-0x00000000fcd03fff]
[    0.000000]   node   0: [mem 0x00000000fcd04000-0x00000000fcdfffff]
[    0.000000]   node   0: [mem 0x00000000fce00000-0x00000000ff7fffff]
[    0.000000]   node   0: [mem 0x00000000ff800000-0x00000000ffffffff]
[    0.000000]   node   0: [mem 0x0000000880000000-0x00000008b99fffff]
[    0.000000]   node   0: [mem 0x00000008c0000000-0x0000000affffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x0000000affffffff]
[    0.000000] On node 0, zone DMA: 976 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 320 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 39504 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 26112 pages in unavailable ranges
[    0.000000] cma: Reserved 32 MiB at 0x0000000880000000 on node -1
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.3
[    0.000000] psci: OSI mode supported.
[    0.000000] percpu: Embedded 25 pages/cpu s61656 r8192 d32552 u102400
[    0.000000] pcpu-alloc: s61656 r8192 d32552 u102400 alloc=25*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Address authentication (architected QARMA5 algorithm)
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: ARM erratum 2457168
[    0.000000] CPU features: detected: ARM erratum 2658417
[    0.000000] CPU features: detected: ARM errata 2966298, 3117295
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: earlycon root= allow_mismatched_32bit_el0 clk_ignore_unused pd_ignore_unused systemd.mask=rmtfs.service ignore_loglevel -- androidboot.verifiedbootstate=orange androidboot.keymaster=1  androidboot.bootdevice=1d84000.ufshc androidboot.fstab_suffix=default androidboot.boot_devices=soc/1d84000.ufshc androidboot.serialno=2a7a254f androidboot.baseband=apq androidboot.force_normal_boot=1
[    0.000000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.000000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 3078816
[    0.000000] Policy zone: DMA
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] software IO TLB: SWIOTLB bounce buffer size adjusted to 11MB
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: SWIOTLB bounce buffer size roundup to 16MB
[    0.000000] software IO TLB: mapped [mem 0x0000000aeff38000-0x0000000af0f38000] (16MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 988 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs, DirectLPI
[    0.000000] GICv3: GICD_CTRL.DS=1, SCR_EL3.FIQ=0
[    0.000000] GICv3: Enabling SGIs without active state
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000017180000
[    0.000000] ITS [mem 0x17140000-0x1715ffff]
[    0.000000] ITS@0x0000000017140000: Devices Table too large, reduce ids 32->19
[    0.000000] ITS@0x0000000017140000: Devices too large, reduce ITS pages 1024->256
[    0.000000] ITS@0x0000000017140000: allocated 131072 Devices @81500000 (indirect, esz 8, psz 4K, shr 1)
[    0.000000] ITS@0x0000000017140000: allocated 4096 Interrupt Collections @8145b000 (flat, esz 1, psz 4K, shr 1)
[    0.000000] GICv3: using LPI property table @0x0000000081470000
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000081480000
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.008355] arm-pv: using stolen time PV
[    0.012595] Console: colour dummy device 80x25
[    0.017182] printk: legacy console [tty0] enabled
[    0.022031] printk: legacy bootconsole [qcom_geni0] disabled
<----------------->

System handler takes over, I'll analyze the system firmware logs to understand which access made the crash.

I tested the "arm64: mm: fix DMA zone when dma-ranges is missing" patch at [1], but it doesn't help.

[1] https://lore.kernel.org/all/d8e92b14181fc815773ac4f4bba70b5d48bc390e.1724838684.git.baruch@tkos.co.il/

Neil

#regzbot introduced: ba0fb44aed47693cc2482427f63ba6cd19051327



