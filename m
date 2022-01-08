Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0D488382
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 12:58:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JWJX01Hhtz3bVc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 22:58:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JWJWZ4zzCz2yZW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 22:58:16 +1100 (AEDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JWJSH4svmz8wBq;
 Sat,  8 Jan 2022 19:55:27 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 8 Jan 2022 19:58:06 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Sat, 8 Jan 2022 19:58:05 +0800
Message-ID: <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
Date: Sat, 8 Jan 2022 19:58:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, <linux-mm@kvack.org>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211225120621.13908-2-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi PPC maintainers， ping..

On 2021/12/25 20:06, Kefeng Wang wrote:
> When run ethtool eth0, the BUG occurred,
>
>    usercopy: Kernel memory exposure attempt detected from SLUB object not in SLUB page?! (offset 0, size 1048)!
>    kernel BUG at mm/usercopy.c:99
>    ...
>    usercopy_abort+0x64/0xa0 (unreliable)
>    __check_heap_object+0x168/0x190
>    __check_object_size+0x1a0/0x200
>    dev_ethtool+0x2494/0x2b20
>    dev_ioctl+0x5d0/0x770
>    sock_do_ioctl+0xf0/0x1d0
>    sock_ioctl+0x3ec/0x5a0
>    __se_sys_ioctl+0xf0/0x160
>    system_call_exception+0xfc/0x1f0
>    system_call_common+0xf8/0x200
>
> The code shows below,
>
>    data = vzalloc(array_size(gstrings.len, ETH_GSTRING_LEN));
>    copy_to_user(useraddr, data, gstrings.len * ETH_GSTRING_LEN))
>
> The data is alloced by vmalloc(), virt_addr_valid(ptr) will return true
> on PowerPC64, which leads to the panic.
>
> As commit 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va
> and __pa addresses") does, make sure the virt addr above PAGE_OFFSET in
> the virt_addr_valid().
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/powerpc/include/asm/page.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 254687258f42..300d4c105a3a 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -132,7 +132,10 @@ static inline bool pfn_valid(unsigned long pfn)
>   #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
>   #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
>   
> -#define virt_addr_valid(kaddr)	pfn_valid(virt_to_pfn(kaddr))
> +#define virt_addr_valid(vaddr)	({						\
> +	unsigned long _addr = (unsigned long)vaddr;				\
> +	(unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr));	\
> +})
>   
>   /*
>    * On Book-E parts we need __va to parse the device tree and we can't
