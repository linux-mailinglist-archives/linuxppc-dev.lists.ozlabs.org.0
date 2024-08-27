Return-Path: <linuxppc-dev+bounces-561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F469600D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 07:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtFrs5Phdz2yLr;
	Tue, 27 Aug 2024 15:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=84.110.109.230
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724734357;
	cv=none; b=Fy++4QObbU7D70e4p1ktDVGzyltof1IreQAyOOPmfTQBtAU6gG5zmImEKei6/fmCw0ZYTp5vClOBwcm/CniLoVVhmtI4STciZuq3sWPtPx+Utp95EWX8ucVOFHli4jAHKpZoVHj+eMcm5lz7m4AKuEvIlr3CaM3WZW+5psimUlyQkKaLzK398hTscZYrMLivtG8GwE+v0Tr7oXdkzKXnqKGmRqFZipTPgKpHf8KMNOuknWfwyWIHk8uZRCml76hIZYn48KCRqoUbuWddDUnDhILesRlFL4BTuVE+0KLjCsfkjujC+oqw6wKn90HE/7GMu3AJnpg50Iww03MTa86k3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724734357; c=relaxed/relaxed;
	bh=0SwBykNyJPRe5aoCf0Ksgdn/5qy8ut9K45QkYjfEJZY=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=bZdj+mRlbgKIO19yX9NNrVwP+z0uyMpzQ+5PKeMJteaWha8K07h3f+6oU1kTB5JxDAVzopbqGq7HV2/fPyegRLmgJmpGnMqD3AFRwJxYsob6b5XCkyVu6FwToVToECP1cHHT0bPN9E+rriAYy6aF2Kk+HlOoOBl3Zflj1lETFoB1Q2Kjaf1VYx9KxnVPi/FsvM+Pqz3dXOzGnr9s/fVIAmgXBwIxzEEX8YMPVt864UBr5QrL/I+xgru6cqeGRvnkV3++N+r2C2J9uPQUJPCIItOfByHM3U9/O4j5rlqgUPC0jKbBWPb0Biu5aaDr51+tnwEXyDzJBshHWso9EpKxCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=FI98ZrqF; dkim-atps=neutral; spf=pass (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=tkos.co.il
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=FI98ZrqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtFXM1c3Gz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 14:52:35 +1000 (AEST)
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id 07138440FD1;
	Tue, 27 Aug 2024 07:50:36 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1724734236;
	bh=9WyFB9yd3fDx1n71EKn0NOUDm0SNyy+ugmA5x2v2FE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FI98ZrqFrkaPZNYHWGvjN821TTsf1l9dasleqTNzWX5CifjFUlZGK/dlYU1Wg2dKf
	 zRPa8u5HMNs78KaGG3T69/cRMOh8AbRIqBtbFb3o9kWQdLXtIxh+AyFBL9vy+LZ+/2
	 2A5ycZJPBluf1fAsJ7U7stKNjxdl7nh8+4glxt8l6+kVK+26bXB09aUJzdJQ0wJofQ
	 gnN4m4CuzwTE9jSfMsVg7bbJ0GKQOD/VJYGVjg+tr6El5tiuQfHN7bV32r06+TDz3a
	 xv6DGTSn4e5mJ0VZcCom/Wil+aWl44XUvX7OoV66JMhYKIWNnpfMYZ4dGlfc2G5n5a
	 2DSR3UzHlCrFA==
From: Baruch Siach <baruch@tkos.co.il>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Robin Murphy
 <robin.murphy@arm.com>,  iommu@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-s390@vger.kernel.org,  Petr
 =?utf-8?B?VGVzYcWZw61r?=
 <petr@tesarici.cz>,  Ramon Fried <ramon@neureality.ai>,  Elad Nachman
 <enachman@marvell.com>,  linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
In-Reply-To: <53d988b1-bdce-422a-ae4e-158f305ad703@samsung.com> (Marek
	Szyprowski's message of "Mon, 26 Aug 2024 21:28:29 +0200")
References: <cover.1723359916.git.baruch@tkos.co.il>
	<CGME20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1@eucas1p1.samsung.com>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
	<53d988b1-bdce-422a-ae4e-158f305ad703@samsung.com>
Date: Tue, 27 Aug 2024 07:52:27 +0300
Message-ID: <87mskyva7o.fsf@tarshish>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Thanks for your report.

On Mon, Aug 26 2024, Marek Szyprowski wrote:
> On 11.08.2024 09:09, Baruch Siach wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>>
>> Hardware DMA limit might not be power of 2. When RAM range starts above
>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>> can not encode this limit.
>>
>> Use plain address for DMA zone limit.
>>
>> Since DMA zone can now potentially span beyond 4GB physical limit of
>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>
> This patch landed recently in linux-next as commit ba0fb44aed47=20
> ("dma-mapping: replace zone_dma_bits by zone_dma_limit"). During my=20
> tests I found that it introduces the following warning on ARM64/Rockchip=
=20
> based Odroid M1 board (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts):

Does this warning go away if you revert both 3be9b846896d and ba0fb44aed47?

Upstream rockchip DTs have no dma-ranges property. Is that the case for
your platform as well?

Can you share kernel report of DMA zones and swiotlb? On my platform I get:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000840000000-0x0000000fffffffff]
...
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x000000083be38000-0x000000083f=
e38000] (64MB)

What do you get at your end?

> ------------[ cut here ]------------
> dwmmc_rockchip fe2b0000.mmc: swiotlb addr 0x00000001faf00000+4096=20
> overflow (mask ffffffff, bus limit 0).
> WARNING: CPU: 3 PID: 1 at kernel/dma/swiotlb.c:1594 swiotlb_map+0x2f0/0x3=
08
> Modules linked in:
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4+ #15278
> Hardware name: Hardkernel ODROID-M1 (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : swiotlb_map+0x2f0/0x308
> lr : swiotlb_map+0x2f0/0x308
> ...
> Call trace:
>  =C2=A0swiotlb_map+0x2f0/0x308
>  =C2=A0dma_direct_map_sg+0x9c/0x2e4
>  =C2=A0__dma_map_sg_attrs+0x28/0x94
>  =C2=A0dma_map_sg_attrs+0x10/0x24
>  =C2=A0dw_mci_pre_dma_transfer+0xb8/0xf4
>  =C2=A0dw_mci_pre_req+0x50/0x68
>  =C2=A0mmc_blk_mq_issue_rq+0x3e0/0x964
>  =C2=A0mmc_mq_queue_rq+0x118/0x2b4
>  =C2=A0blk_mq_dispatch_rq_list+0x21c/0x714
>  =C2=A0__blk_mq_sched_dispatch_requests+0x490/0x58c
>  =C2=A0blk_mq_sched_dispatch_requests+0x30/0x6c
>  =C2=A0blk_mq_run_hw_queue+0x284/0x40c
>  =C2=A0blk_mq_flush_plug_list.part.0+0x190/0x974
>  =C2=A0blk_mq_flush_plug_list+0x1c/0x2c
>  =C2=A0__blk_flush_plug+0xe4/0x140
>  =C2=A0blk_finish_plug+0x38/0x4c
>  =C2=A0__ext4_get_inode_loc+0x22c/0x654
>  =C2=A0__ext4_get_inode_loc_noinmem+0x40/0xa8
>  =C2=A0__ext4_iget+0x154/0xcc0
>  =C2=A0ext4_get_journal_inode+0x30/0x110
>  =C2=A0ext4_load_and_init_journal+0x9c/0xaf0
>  =C2=A0ext4_fill_super+0x1fec/0x2d90
>  =C2=A0get_tree_bdev+0x140/0x1d8
>  =C2=A0ext4_get_tree+0x18/0x24
>  =C2=A0vfs_get_tree+0x28/0xe8
>  =C2=A0path_mount+0x3e8/0xb7c
>  =C2=A0init_mount+0x68/0xac
>  =C2=A0do_mount_root+0x108/0x1dc
>  =C2=A0mount_root_generic+0x100/0x330
>  =C2=A0mount_root+0x160/0x2d0
>  =C2=A0initrd_load+0x1f0/0x2a0
>  =C2=A0prepare_namespace+0x4c/0x29c
>  =C2=A0kernel_init_freeable+0x4b4/0x50c
>  =C2=A0kernel_init+0x20/0x1d8
>  =C2=A0ret_from_fork+0x10/0x20
> irq event stamp: 1305682
> hardirqs last=C2=A0 enabled at (1305681): [<ffff8000800e332c>]=20
> console_unlock+0x124/0x130
> hardirqs last disabled at (1305682): [<ffff80008124e684>] el1_dbg+0x24/0x=
8c
> softirqs last=C2=A0 enabled at (1305678): [<ffff80008005be1c>]=20
> handle_softirqs+0x4cc/0x4e4
> softirqs last disabled at (1305665): [<ffff8000800105b0>]=20
> __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
>
> This "bus limit 0" seems to be a bit suspicious to me as well as the=20
> fact that swiotlb is used for the MMC DMA. I will investigate this=20
> further tomorrow. The board boots fine though.

Looking at the code I guess that bus_dma_limit set to 0 means no bus
limit. But dma_mask for your device indicates 32-bit device limit. This
can't work with address above 4GB. For some reason DMA code tries to
allocate from higher address. This is most likely the reason
dma_capable() returns false.

Thanks,
baruch

>>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>>   arch/powerpc/mm/mem.c      |  5 ++++-
>>   arch/s390/mm/init.c        |  2 +-
>>   include/linux/dma-direct.h |  2 +-
>>   kernel/dma/direct.c        |  6 +++---
>>   kernel/dma/pool.c          |  4 ++--
>>   kernel/dma/swiotlb.c       |  6 +++---
>>   7 files changed, 29 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index 9b5ab6818f7f..c45e2152ca9e 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -115,35 +115,35 @@ static void __init arch_reserve_crashkernel(void)
>>   }
>>=20=20=20
>>   /*
>> - * Return the maximum physical address for a zone accessible by the giv=
en bits
>> - * limit. If DRAM starts above 32-bit, expand the zone to the maximum
>> + * Return the maximum physical address for a zone given its limit.
>> + * If DRAM starts above 32-bit, expand the zone to the maximum
>>    * available memory, otherwise cap it at 32-bit.
>>    */
>> -static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
>> +static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>>   {
>> -	phys_addr_t zone_mask =3D DMA_BIT_MASK(zone_bits);
>>   	phys_addr_t phys_start =3D memblock_start_of_DRAM();
>>=20=20=20
>>   	if (phys_start > U32_MAX)
>> -		zone_mask =3D PHYS_ADDR_MAX;
>> -	else if (phys_start > zone_mask)
>> -		zone_mask =3D U32_MAX;
>> +		zone_limit =3D PHYS_ADDR_MAX;
>> +	else if (phys_start > zone_limit)
>> +		zone_limit =3D U32_MAX;
>>=20=20=20
>> -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
>> +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>>   }
>>=20=20=20
>>   static void __init zone_sizes_init(void)
>>   {
>>   	unsigned long max_zone_pfns[MAX_NR_ZONES]  =3D {0};
>> -	unsigned int __maybe_unused acpi_zone_dma_bits;
>> -	unsigned int __maybe_unused dt_zone_dma_bits;
>> -	phys_addr_t __maybe_unused dma32_phys_limit =3D max_zone_phys(32);
>> +	phys_addr_t __maybe_unused acpi_zone_dma_limit;
>> +	phys_addr_t __maybe_unused dt_zone_dma_limit;
>> +	phys_addr_t __maybe_unused dma32_phys_limit =3D
>> +		max_zone_phys(DMA_BIT_MASK(32));
>>=20=20=20
>>   #ifdef CONFIG_ZONE_DMA
>> -	acpi_zone_dma_bits =3D fls64(acpi_iort_dma_get_max_cpu_address());
>> -	dt_zone_dma_bits =3D fls64(of_dma_get_max_cpu_address(NULL));
>> -	zone_dma_bits =3D min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
>> -	arm64_dma_phys_limit =3D max_zone_phys(zone_dma_bits);
>> +	acpi_zone_dma_limit =3D acpi_iort_dma_get_max_cpu_address();
>> +	dt_zone_dma_limit =3D of_dma_get_max_cpu_address(NULL);
>> +	zone_dma_limit =3D min(dt_zone_dma_limit, acpi_zone_dma_limit);
>> +	arm64_dma_phys_limit =3D max_zone_phys(zone_dma_limit);
>>   	max_zone_pfns[ZONE_DMA] =3D PFN_DOWN(arm64_dma_phys_limit);
>>   #endif
>>   #ifdef CONFIG_ZONE_DMA32
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index d325217ab201..05b7f702b3f7 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -216,7 +216,7 @@ static int __init mark_nonram_nosave(void)
>>    * everything else. GFP_DMA32 page allocations automatically fall back=
 to
>>    * ZONE_DMA.
>>    *
>> - * By using 31-bit unconditionally, we can exploit zone_dma_bits to inf=
orm the
>> + * By using 31-bit unconditionally, we can exploit zone_dma_limit to in=
form the
>>    * generic DMA mapping code.  32-bit only devices (if not handled by a=
n IOMMU
>>    * anyway) will take a first dip into ZONE_NORMAL and get otherwise se=
rved by
>>    * ZONE_DMA.
>> @@ -230,6 +230,7 @@ void __init paging_init(void)
>>   {
>>   	unsigned long long total_ram =3D memblock_phys_mem_size();
>>   	phys_addr_t top_of_ram =3D memblock_end_of_DRAM();
>> +	int zone_dma_bits;
>>=20=20=20
>>   #ifdef CONFIG_HIGHMEM
>>   	unsigned long v =3D __fix_to_virt(FIX_KMAP_END);
>> @@ -256,6 +257,8 @@ void __init paging_init(void)
>>   	else
>>   		zone_dma_bits =3D 31;
>>=20=20=20
>> +	zone_dma_limit =3D DMA_BIT_MASK(zone_dma_bits);
>> +
>>   #ifdef CONFIG_ZONE_DMA
>>   	max_zone_pfns[ZONE_DMA]	=3D min(max_low_pfn,
>>   				      1UL << (zone_dma_bits - PAGE_SHIFT));
>> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
>> index ddcd39ef4346..91fc2b91adfc 100644
>> --- a/arch/s390/mm/init.c
>> +++ b/arch/s390/mm/init.c
>> @@ -97,7 +97,7 @@ void __init paging_init(void)
>>=20=20=20
>>   	vmem_map_init();
>>   	sparse_init();
>> -	zone_dma_bits =3D 31;
>> +	zone_dma_limit =3D DMA_BIT_MASK(31);
>>   	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
>>   	max_zone_pfns[ZONE_DMA] =3D virt_to_pfn(MAX_DMA_ADDRESS);
>>   	max_zone_pfns[ZONE_NORMAL] =3D max_low_pfn;
>> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
>> index edbe13d00776..d7e30d4f7503 100644
>> --- a/include/linux/dma-direct.h
>> +++ b/include/linux/dma-direct.h
>> @@ -12,7 +12,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/swiotlb.h>
>>=20=20=20
>> -extern unsigned int zone_dma_bits;
>> +extern u64 zone_dma_limit;
>>=20=20=20
>>   /*
>>    * Record the mapping of CPU physical to DMA addresses for a given reg=
ion.
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index 4480a3cd92e0..f2ba074a6a54 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -20,7 +20,7 @@
>>    * it for entirely different regions. In that case the arch code needs=
 to
>>    * override the variable below for dma-direct to work properly.
>>    */
>> -unsigned int zone_dma_bits __ro_after_init =3D 24;
>> +u64 zone_dma_limit __ro_after_init =3D DMA_BIT_MASK(24);
>>=20=20=20
>>   static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>>   		phys_addr_t phys)
>> @@ -59,7 +59,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device=
 *dev, u64 *phys_limit)
>>   	 * zones.
>>   	 */
>>   	*phys_limit =3D dma_to_phys(dev, dma_limit);
>> -	if (*phys_limit <=3D DMA_BIT_MASK(zone_dma_bits))
>> +	if (*phys_limit <=3D zone_dma_limit)
>>   		return GFP_DMA;
>>   	if (*phys_limit <=3D DMA_BIT_MASK(32))
>>   		return GFP_DMA32;
>> @@ -580,7 +580,7 @@ int dma_direct_supported(struct device *dev, u64 mas=
k)
>>   	 * part of the check.
>>   	 */
>>   	if (IS_ENABLED(CONFIG_ZONE_DMA))
>> -		min_mask =3D min_t(u64, min_mask, DMA_BIT_MASK(zone_dma_bits));
>> +		min_mask =3D min_t(u64, min_mask, zone_dma_limit);
>>   	return mask >=3D phys_to_dma_unencrypted(dev, min_mask);
>>   }
>>=20=20=20
>> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
>> index d10613eb0f63..7b04f7575796 100644
>> --- a/kernel/dma/pool.c
>> +++ b/kernel/dma/pool.c
>> @@ -70,9 +70,9 @@ static bool cma_in_zone(gfp_t gfp)
>>   	/* CMA can't cross zone boundaries, see cma_activate_area() */
>>   	end =3D cma_get_base(cma) + size - 1;
>>   	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
>> -		return end <=3D DMA_BIT_MASK(zone_dma_bits);
>> +		return end <=3D zone_dma_limit;
>>   	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
>> -		return end <=3D DMA_BIT_MASK(32);
>> +		return end <=3D max(DMA_BIT_MASK(32), zone_dma_limit);
>>   	return true;
>>   }
>>=20=20=20
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index df68d29740a0..abcf3fa63a56 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -450,9 +450,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>>   	if (!remap)
>>   		io_tlb_default_mem.can_grow =3D true;
>>   	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
>> -		io_tlb_default_mem.phys_limit =3D DMA_BIT_MASK(zone_dma_bits);
>> +		io_tlb_default_mem.phys_limit =3D zone_dma_limit;
>>   	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
>> -		io_tlb_default_mem.phys_limit =3D DMA_BIT_MASK(32);
>> +		io_tlb_default_mem.phys_limit =3D max(DMA_BIT_MASK(32), zone_dma_limi=
t);
>>   	else
>>   		io_tlb_default_mem.phys_limit =3D virt_to_phys(high_memory - 1);
>>   #endif
>> @@ -629,7 +629,7 @@ static struct page *swiotlb_alloc_tlb(struct device =
*dev, size_t bytes,
>>   	}
>>=20=20=20
>>   	gfp &=3D ~GFP_ZONEMASK;
>> -	if (phys_limit <=3D DMA_BIT_MASK(zone_dma_bits))
>> +	if (phys_limit <=3D zone_dma_limit)
>>   		gfp |=3D __GFP_DMA;
>>   	else if (phys_limit <=3D DMA_BIT_MASK(32))
>>   		gfp |=3D __GFP_DMA32;
>
> Best regards

--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

