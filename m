Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65121D0A12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 10:44:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p7714rtfzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 19:44:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p74h71mRzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 19:42:11 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2430E4051D3B32D1B745;
 Wed,  9 Oct 2019 16:42:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 16:42:00 +0800
Subject: Re: [PATCH v7 00/12] implement KASLR for powerpc/fsl_booke/32
To: Scott Wood <oss@buserror.net>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <christophe.leroy@c-s.fr>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <keescook@chromium.org>,
 <kernel-hardening@lists.openwall.com>
References: <20190920094546.44948-1-yanaijie@huawei.com>
 <9c2dd2a8-83f2-983c-383e-956e19a7803a@huawei.com>
 <c4769b34-95f6-81b9-4856-50459630aa0d@huawei.com>
 <38141b946f3376ce471e46eaf065e357ac540354.camel@buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <90bb659a-bde4-3b8e-8f01-bf22d7534f44@huawei.com>
Date: Wed, 9 Oct 2019 16:41:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <38141b946f3376ce471e46eaf065e357ac540354.camel@buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.96.203]
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

On 2019/10/9 15:13, Scott Wood wrote:
> On Wed, 2019-10-09 at 14:10 +0800, Jason Yan wrote:
>> Hi Scott,
>>
>> Would you please take sometime to test this?
>>
>> Thank you so much.
>>
>> On 2019/9/24 13:52, Jason Yan wrote:
>>> Hi Scott,
>>>
>>> Can you test v7 to see if it works to load a kernel at a non-zero address?
>>>
>>> Thanks,
> 
> Sorry for the delay.  Here's the output:
> 

Thanks for the test.

> ## Booting kernel from Legacy Image at 10000000 ...
>     Image Name:   Linux-5.4.0-rc2-00050-g8ac2cf5b4
>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>     Data Size:    7521134 Bytes = 7.2 MiB
>     Load Address: 04000000
>     Entry Point:  04000000
>     Verifying Checksum ... OK
> ## Flattened Device Tree blob at 1fc00000
>     Booting using the fdt blob at 0x1fc00000
>     Uncompressing Kernel Image ... OK
>     Loading Device Tree to 07fe0000, end 07fff65c ... OK
> KASLR: No safe seed for randomizing the kernel base.
> OF: reserved mem: initialized node qman-fqd, compatible id fsl,qman-fqd
> OF: reserved mem: initialized node qman-pfdr, compatible id fsl,qman-pfdr
> OF: reserved mem: initialized node bman-fbpr, compatible id fsl,bman-fbpr
> Memory CAM mapping: 64/64/64 Mb, residual: 12032Mb

When boot from 04000000, the max CAM value is 64M. And
you have a board with 12G memory, CONFIG_LOWMEM_CAM_NUM=3 means only
192M memory is mapped and when kernel is randomized at the middle of 
this 192M memory, we will not have enough continuous memory for node map.

Can you set CONFIG_LOWMEM_CAM_NUM=8 and see if it works?

Thanks.

> Linux version 5.4.0-rc2-00050-g8ac2cf5b4e4a-dirty (scott@snotra) (gcc version 8.
> 1.0 (GCC)) #26 SMP Wed Oct 9 01:50:40 CDT 2019
> Using CoreNet Generic machine description
> printk: bootconsole [udbg0] enabled
> CPU maps initialized for 1 thread per core
> -----------------------------------------------------
> phys_mem_size     = 0x2fc000000
> dcache_bsize      = 0x40
> icache_bsize      = 0x40
> cpu_features      = 0x00000000000003b4
>    possible        = 0x00000000010103bc
>    always          = 0x0000000000000020
> cpu_user_features = 0x8c008000 0x08000000
> mmu_features      = 0x000a0010
> physical_start    = 0xc7c4000
> -----------------------------------------------------
> CoreNet Generic board
> mpc85xx_qe_init: Could not find Quicc Engine node
> barrier-nospec: using isync; sync as speculation barrier
> Zone ranges:
>    Normal   [mem 0x0000000004000000-0x000000000fffffff]
>    HighMem  [mem 0x0000000010000000-0x00000002ffffffff]
> Movable zone start for each node
> Early memory node ranges
>    node   0: [mem 0x0000000004000000-0x00000002ffffffff]
> Initmem setup node 0 [mem 0x0000000004000000-0x00000002ffffffff]
> Kernel panic - not syncing: Failed to allocate 125173760 bytes for node 0 memory
>   map
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.0-rc2-00050-g8ac2cf5b4e4a-dirty #26
> Call Trace:
> [c989fe10] [c924bfb0] dump_stack+0x84/0xb4 (unreliable)
> [c989fe30] [c880badc] panic+0x140/0x334
> [c989fe90] [c89a1144] alloc_node_mem_map.constprop.117+0xa0/0x11c
> [c989feb0] [c95481c4] free_area_init_node+0x314/0x5b8
> [c989ff30] [c9548b34] free_area_init_nodes+0x57c/0x5c0
> [c989ff80] [c952cbb4] setup_arch+0x250/0x270
> [c989ffa0] [c95278e0] start_kernel+0x74/0x4e8
> [c989fff0] [c87c4478] set_ivor+0x150/0x18c
> Kernel Offset: 0x87c4000 from 0xc0000000
> Rebooting in 180 seconds..
> 
> -Scott
> 
> 
> 
> .
> 

