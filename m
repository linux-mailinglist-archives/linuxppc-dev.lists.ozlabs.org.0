Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA006C8BE6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk8wv41H0z3fWB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk8vn4Wm0z3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:54:44 +1100 (AEDT)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Pk8Pk2w5BzSny7;
	Sat, 25 Mar 2023 14:32:10 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 14:35:38 +0800
Message-ID: <e2333d87-6442-0ddc-ee3d-5fb917600577@huawei.com>
Date: Sat, 25 Mar 2023 14:35:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 03/14] arm64: reword ARCH_FORCE_MAX_ORDER prompt and
 help text
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
 <20230325060828.2662773-4-rppt@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230325060828.2662773-4-rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
> 
> Update both to actually describe what this option does.
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> ---
>   arch/arm64/Kconfig | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7324032af859..cc11cdcf5a00 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1487,24 +1487,24 @@ config XEN
>   # 16K |       27          |      14      |       13        |         11         |
>   # 64K |       29          |      16      |       13        |         13         |
>   config ARCH_FORCE_MAX_ORDER
> -	int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
> +	int "Order of maximal physically contiguous allocations" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
>   	default "13" if ARM64_64K_PAGES
>   	default "11" if ARM64_16K_PAGES
>   	default "10"
>   	help
> -	  The kernel memory allocator divides physically contiguous memory
> -	  blocks into "zones", where each zone is a power of two number of
> -	  pages.  This option selects the largest power of two that the kernel
> -	  keeps in the memory allocator.  If you need to allocate very large
> -	  blocks of physically contiguous memory, then you may need to
> -	  increase this value.
> +	  The kernel page allocator limits the size of maximal physically
> +	  contiguous allocations. The limit is called MAX_ORDER and it
> +	  defines the maximal power of two of number of pages that can be
> +	  allocated as a single contiguous block. This option allows
> +	  overriding the default setting when ability to allocate very
> +	  large blocks of physically contiguous memory is required.
>   
> -	  We make sure that we can allocate up to a HugePage size for each configuration.
> -	  Hence we have :
> -		MAX_ORDER = PMD_SHIFT - PAGE_SHIFT  => PAGE_SHIFT - 3
> +	  The maximal size of allocation cannot exceed the size of the
> +	  section, so the value of MAX_ORDER should satisfy
>   
> -	  However for 4K, we choose a higher default value, 10 as opposed to 9, giving us
> -	  4M allocations matching the default size used by generic code.
> +	    MAX_ORDER + PAGE_SHIFT <= SECTION_SIZE_BITS
> +
> +	  Don't change if unsure.
>   
>   config UNMAP_KERNEL_AT_EL0
>   	bool "Unmap kernel when running in userspace (aka \"KAISER\")" if EXPERT
