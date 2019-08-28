Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFA9FA00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 07:49:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JFF931HczDr2s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:49:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="H7d56jgp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JFC344t0zDr1j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 15:47:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46JFBv58jFz9tyjN;
 Wed, 28 Aug 2019 07:47:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=H7d56jgp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZYfzIFezkxn8; Wed, 28 Aug 2019 07:47:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46JFBv3rNBz9tyjM;
 Wed, 28 Aug 2019 07:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566971271; bh=AmYiAtB5pIcz/P08jhfTvi4CrbWmoulSdtRcuEa5sPo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H7d56jgpyX5Kf4QbM6cOYjGTtGYEwWLMazu8whUO3pJSpS7PdHbz4EGeBXDBEe9Xg
 y9UEbe15Q5czkyEHzO6+CdBmqGkICEFK2lKF64ns1NY/fMeiERw4Zg9l5vu7t1geOs
 +LfAGJuFdSBnpaaHCG3qCgdFe19/Lc9CcmNrX6Mw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CC868B861;
 Wed, 28 Aug 2019 07:47:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2f9EqKj2cyvq; Wed, 28 Aug 2019 07:47:52 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CB818B860;
 Wed, 28 Aug 2019 07:47:52 +0200 (CEST)
Subject: Re: [PATCH v6 06/12] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Scott Wood <oss@buserror.net>, Jason Yan <yanaijie@huawei.com>
References: <20190809100800.5426-1-yanaijie@huawei.com>
 <20190809100800.5426-7-yanaijie@huawei.com>
 <20190828045454.GB17757@home.buserror.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2db76c55-df5f-5ca8-f0a6-bcee75b8edaa@c-s.fr>
Date: Wed, 28 Aug 2019 07:47:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828045454.GB17757@home.buserror.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com, thunder.leizhen@huawei.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, jingxiangfeng@huawei.com,
 diana.craciun@nxp.com, paulus@samba.org, zhaohongjiang@huawei.com,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/08/2019 à 06:54, Scott Wood a écrit :
> On Fri, Aug 09, 2019 at 06:07:54PM +0800, Jason Yan wrote:
>> This patch add support to boot kernel from places other than KERNELBASE.
>> Since CONFIG_RELOCATABLE has already supported, what we need to do is
>> map or copy kernel to a proper place and relocate. Freescale Book-E
>> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
>> entries are not suitable to map the kernel directly in a randomized
>> region, so we chose to copy the kernel to a proper place and restart to
>> relocate.
>>
>> The offset of the kernel was not randomized yet(a fixed 64M is set). We
>> will randomize it in the next patch.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Tested-by: Diana Craciun <diana.craciun@nxp.com>
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/Kconfig                          | 11 ++++
>>   arch/powerpc/kernel/Makefile                  |  1 +
>>   arch/powerpc/kernel/early_32.c                |  2 +-
>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 17 +++--
>>   arch/powerpc/kernel/head_fsl_booke.S          | 13 +++-
>>   arch/powerpc/kernel/kaslr_booke.c             | 62 +++++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h                    |  7 +++
>>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 ++-
>>   8 files changed, 105 insertions(+), 15 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
>>

[...]

>> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
>> new file mode 100644
>> index 000000000000..f8dc60534ac1
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
> 
> Shouldn't this go under arch/powerpc/mm/nohash?
> 
>> +/*
>> + * To see if we need to relocate the kernel to a random offset
>> + * void *dt_ptr - address of the device tree
>> + * phys_addr_t size - size of the first memory block
>> + */
>> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>> +{
>> +	unsigned long tlb_virt;
>> +	phys_addr_t tlb_phys;
>> +	unsigned long offset;
>> +	unsigned long kernel_sz;
>> +
>> +	kernel_sz = (unsigned long)_end - KERNELBASE;
> 
> Why KERNELBASE and not kernstart_addr?
> 
>> +
>> +	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>> +
>> +	if (offset == 0)
>> +		return;
>> +
>> +	kernstart_virt_addr += offset;
>> +	kernstart_addr += offset;
>> +
>> +	is_second_reloc = 1;
>> +
>> +	if (offset >= SZ_64M) {
>> +		tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
>> +		tlb_phys = round_down(kernstart_addr, SZ_64M);
> 
> If kernstart_addr wasn't 64M-aligned before adding offset, then "offset
>> = SZ_64M" is not necessarily going to detect when you've crossed a
> mapping boundary.
> 
>> +
>> +		/* Create kernel map to relocate in */
>> +		create_tlb_entry(tlb_phys, tlb_virt, 1);
>> +	}
>> +
>> +	/* Copy the kernel to it's new location and run */
>> +	memcpy((void *)kernstart_virt_addr, (void *)KERNELBASE, kernel_sz);
>> +
>> +	reloc_kernel_entry(dt_ptr, kernstart_virt_addr);
>> +}
> 
> After copying, call flush_icache_range() on the destination.

Function copy_and_flush() does the copy and the flush. I think it should 
be used instead of memcpy() + flush_icache_range()

Christophe
