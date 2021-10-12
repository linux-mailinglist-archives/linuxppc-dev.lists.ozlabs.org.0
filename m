Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A15429B20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 03:44:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSz3X3NQxz2yYx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 12:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=liushixin2@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSz352jJzz2xrH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 12:43:41 +1100 (AEDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HSz1W0phzz8tZh;
 Tue, 12 Oct 2021 09:42:23 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 09:43:28 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm100009.china.huawei.com (7.185.36.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 09:43:28 +0800
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
To: Marco Elver <elver@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
Date: Tue, 12 Oct 2021 09:43:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210924063927.1341241-1-liushixin2@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100009.china.huawei.com (7.185.36.113)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kindly ping.


On 2021/9/24 14:39, Liu Shixin wrote:
> On platform PPC_FSL_BOOK3E, all lowmem is managed by tlbcam. That means
> we didn't really map the kfence pool with page granularity. Therefore,
> if KFENCE is enabled, the system will hit the following panic:
>
>     BUG: Kernel NULL pointer dereference on read at 0x00000000
>     Faulting instruction address: 0xc01de598
>     Oops: Kernel access of bad area, sig: 11 [#1]
>     BE PAGE_SIZE=4K SMP NR_CPUS=4 MPC8544 DS
>     Dumping ftrace buffer:
>        (ftrace buffer empty)
>     Modules linked in:
>     CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3+ #298
>     NIP:  c01de598 LR: c08ae9c4 CTR: 00000000
>     REGS: c0b4bea0 TRAP: 0300   Not tainted  (5.12.0-rc3+)
>     MSR:  00021000 <CE,ME>  CR: 24000228  XER: 20000000
>     DEAR: 00000000 ESR: 00000000
>     GPR00: c08ae9c4 c0b4bf60 c0ad64e0 ef720000 00021000 00000000 00000000 00000200
>     GPR08: c0ad5000 00000000 00000000 00000004 00000000 008fbb30 00000000 00000000
>     GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 00000000 00000000
>     GPR24: c08ca004 c08ca004 c0b6a0e0 c0b60000 c0b58f00 c0850000 c08ca000 ef720000
>     NIP [c01de598] kfence_protect+0x44/0x6c
>     LR [c08ae9c4] kfence_init+0xfc/0x2a4
>     Call Trace:
>     [c0b4bf60] [efffe160] 0xefffe160 (unreliable)
>     [c0b4bf70] [c08ae9c4] kfence_init+0xfc/0x2a4
>     [c0b4bfb0] [c0894d3c] start_kernel+0x3bc/0x574
>     [c0b4bff0] [c0000470] set_ivor+0x14c/0x188
>     Instruction dump:
>     7c0802a6 8109d594 546a653a 90010014 54630026 39200000 7d48502e 2c0a0000
>     41820010 554a0026 5469b53a 7d295214 <81490000> 38831000 554a003c 91490000
>     random: get_random_bytes called from print_oops_end_marker+0x40/0x78 with crng_init=0
>     ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d46db0bfb998..cffd57bcb5e4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -185,7 +185,7 @@ config PPC
>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>  	select HAVE_ARCH_KGDB
> -	select HAVE_ARCH_KFENCE			if PPC32
> +	select HAVE_ARCH_KFENCE			if PPC32 && !PPC_FSL_BOOK3E
>  	select HAVE_ARCH_MMAP_RND_BITS
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>  	select HAVE_ARCH_NVRAM_OPS

