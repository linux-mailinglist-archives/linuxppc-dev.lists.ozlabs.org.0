Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB015B2D88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 06:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP2yj4bFLz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:27:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP2yK2dtnz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 14:27:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C014153B;
	Thu,  8 Sep 2022 21:26:39 -0700 (PDT)
Received: from [10.162.41.8] (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D5263F71A;
	Thu,  8 Sep 2022 21:26:23 -0700 (PDT)
Message-ID: <cc68c8c0-0db1-1678-2095-54383c1383ad@arm.com>
Date: Fri, 9 Sep 2022 09:56:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] Revert "Documentation/features: mark
 BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-2-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220822082120.8347-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, zhangshiming@oppo.com, lipeifeng@oppo.com, prime.zeng@hisilicon.com, arnd@arndb.de, corbet@lwn.net, peterz@infradead.org, realmz6@gmail.com, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, xhao@linux.alibaba.com, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/22/22 13:51, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.
> 
> I was wrong. Though ARM64 has hardware TLB flush, but it is not free
> and it is still expensive.
> We still have a good chance to enable batched and deferred TLB flush
> on ARM64 for memory reclamation. A possible way is that we only queue
> tlbi instructions in hardware's queue. When we have to broadcast TLB,
> we broadcast it by dsb. We just need to get adapted the existing
> BATCHED_UNMAP_TLB_FLUSH.
> 
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  Documentation/features/arch-support.txt        | 1 -
>  Documentation/features/vm/TLB/arch-support.txt | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
> index 118ae031840b..d22a1095e661 100644
> --- a/Documentation/features/arch-support.txt
> +++ b/Documentation/features/arch-support.txt
> @@ -8,5 +8,4 @@ The meaning of entries in the tables is:
>      | ok |  # feature supported by the architecture
>      |TODO|  # feature not yet supported by the architecture
>      | .. |  # feature cannot be supported by the hardware
> -    | N/A|  # feature doesn't apply to the architecture
>  
> diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> index 039e4e91ada3..1c009312b9c1 100644
> --- a/Documentation/features/vm/TLB/arch-support.txt
> +++ b/Documentation/features/vm/TLB/arch-support.txt
> @@ -9,7 +9,7 @@
>      |       alpha: | TODO |
>      |         arc: | TODO |
>      |         arm: | TODO |
> -    |       arm64: | N/A  |
> +    |       arm64: | TODO |
>      |        csky: | TODO |
>      |     hexagon: | TODO |
>      |        ia64: | TODO |

I believe this patch is not needed, which explicitly reverts an
older commit. Instead when ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
framework gets enabled on arm64, the same patch could just drop
'NA' as possible values for arch support for a give feature in
file Documentation/features/arch-support.txt.
