Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDB1A6153
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 03:25:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490rXq5yhZzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 11:25:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490rVS3zk6zDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 11:23:40 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 84931C6D573870651A49;
 Mon, 13 Apr 2020 09:23:34 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 13 Apr 2020 09:23:24 +0800
Subject: Re: [PATCH v5 0/6] implement KASLR for powerpc/fsl_booke/64
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
References: <20200330022023.3691-1-yanaijie@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <433bb006-aa45-524d-c57e-79657d01c685@huawei.com>
Date: Mon, 13 Apr 2020 09:23:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200330022023.3691-1-yanaijie@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: dja@axtens.net, linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ping...

ÔÚ 2020/3/30 10:20, Jason Yan Ð´µÀ:
> This is a try to implement KASLR for Freescale BookE64 which is based on
> my earlier implementation for Freescale BookE32:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718&state=*
> 
> The implementation for Freescale BookE64 is similar as BookE32. One
> difference is that Freescale BookE64 set up a TLB mapping of 1G during
> booting. Another difference is that ppc64 needs the kernel to be
> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
> it 64K-aligned. This can save some code to creat another TLB map at
> early boot. The disadvantage is that we only have about 1G/64K = 16384
> slots to put the kernel in.
> 
>      KERNELBASE
> 
>            64K                     |--> kernel <--|
>             |                      |              |
>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>          |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>          |                         |                        1G
>          |----->   offset    <-----|
> 
>                                kernstart_virt_addr
> 
> I'm not sure if the slot numbers is enough or the design has any
> defects. If you have some better ideas, I would be happy to hear that.
> 
> Thank you all.
> 
> v4->v5:
>    Fix "-Werror=maybe-uninitialized" compile error.
>    Fix typo "similar as" -> "similar to".
> v3->v4:
>    Do not define __kaslr_offset as a fixed symbol. Reference __run_at_load and
>      __kaslr_offset by symbol instead of magic offsets.
>    Use IS_ENABLED(CONFIG_PPC32) instead of #ifdef CONFIG_PPC32.
>    Change kaslr-booke32 to kaslr-booke in index.rst
>    Switch some instructions to 64-bit.
> v2->v3:
>    Fix build error when KASLR is disabled.
> v1->v2:
>    Add __kaslr_offset for the secondary cpu boot up.
> 
> Jason Yan (6):
>    powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
>      kaslr_early_init()
>    powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
>    powerpc/fsl_booke/64: implement KASLR for fsl_booke64
>    powerpc/fsl_booke/64: do not clear the BSS for the second pass
>    powerpc/fsl_booke/64: clear the original kernel if randomized
>    powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
>      and add 64bit part
> 
>   Documentation/powerpc/index.rst               |  2 +-
>   .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 ++++++-
>   arch/powerpc/Kconfig                          |  2 +-
>   arch/powerpc/kernel/exceptions-64e.S          | 23 +++++
>   arch/powerpc/kernel/head_64.S                 | 13 +++
>   arch/powerpc/kernel/setup_64.c                |  3 +
>   arch/powerpc/mm/mmu_decl.h                    | 23 +++--
>   arch/powerpc/mm/nohash/kaslr_booke.c          | 91 +++++++++++++------
>   8 files changed, 147 insertions(+), 45 deletions(-)
>   rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)
> 

