Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9B6C8BE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk8wH2CkGz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk8vh6Cz8z3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:54:37 +1100 (AEDT)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Pk8Pj2Yl7z17Nsw;
	Sat, 25 Mar 2023 14:32:09 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 14:35:18 +0800
Message-ID: <c4a228ea-a438-a442-b2be-ee46510124e2@huawei.com>
Date: Sat, 25 Mar 2023 14:35:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
 <20230325060828.2662773-3-rppt@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230325060828.2662773-3-rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/3/25 14:08, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> It is not a good idea to change fundamental parameters of core memory
> management. Having predefined ranges suggests that the values within
> those ranges are sensible, but one has to *really* understand
> implications of changing MAX_ORDER before actually amending it and
> ranges don't help here.
> 
> Drop ranges in definition of ARCH_FORCE_MAX_ORDER and make its prompt
> visible only if EXPERT=y
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> ---
>   arch/arm64/Kconfig | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e60baf7859d1..7324032af859 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1487,11 +1487,9 @@ config XEN
>   # 16K |       27          |      14      |       13        |         11         |
>   # 64K |       29          |      16      |       13        |         13         |
>   config ARCH_FORCE_MAX_ORDER
> -	int "Maximum zone order" if ARM64_4K_PAGES || ARM64_16K_PAGES
> +	int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
>   	default "13" if ARM64_64K_PAGES
> -	range 11 13 if ARM64_16K_PAGES
>   	default "11" if ARM64_16K_PAGES
> -	range 10 15 if ARM64_4K_PAGES
>   	default "10"
>   	help
>   	  The kernel memory allocator divides physically contiguous memory
