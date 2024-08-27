Return-Path: <linuxppc-dev+bounces-572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49C9602A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJRL6Y5vz2y34;
	Tue, 27 Aug 2024 17:03:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=84.110.109.230
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742206;
	cv=none; b=LSVwXVy0KisghQuvEw0DUyAin9Ar/Rq4upOIIeofv3PpAl32nwlvj/A5aCD9TTZ0TsR9IsBEKX6BXPZUCTY+sUjED2Bu5h8h5D5VSILd0UMJWIOBk+23mDNRwj8mqu0KFo/hoEbcrVTxVtjM28FKhkKRO1Zgkbd5+7CjV2ESe/4vdJ3jruThS0ivvq2eqjci8HoRaFlr4FP8Xji4cM/HHDKOfIaDRv/JZrKds0/fR/3lbfQjZ6Z1kAoZ8ofPmeahhORk4BweUoMzhXJzftw+IdtgLbCdZjhKtGeHZvDSHiYR+Nh0xIUb5ArhOT5bxX3L8XSGNgKOUiLUctNA11EpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742206; c=relaxed/relaxed;
	bh=uqQYv4b44hT/CkvJbY8Ry7Mx702lOpQ2r5lKftYwTw0=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=BUUAdR38lFik9LvDUYiRcDXGBPiH4uD9hUwG9uhsummkgxAX1NcjSwinDREwkKdMVg6DXCMjrnLbIB+N5bYLaRACGPfDvWR/m/ektaUnZ70bSGYtsE/n8rAtscvOPfEVcj1G1OHQJmQ9pxUaU4g9dpCDLmhvnPJyxZ5LH94cQwDCzqvbQbXR1T4RlmNq0RQvXHr3i3BEZRoa5H9kaRofXcCyciXz6dHh1TSTyTTRYEkVbglffN0y4LRiMaii4jDnVliX1SLhzoqOl8xMwCNXlGIhYCgZPA1XcURDJgqqSZKolwfy2gdWaUFF3YAjrL9gDmJaE293GHYZETwTwjm+ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=mC8RkKPD; dkim-atps=neutral; spf=pass (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=tkos.co.il
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=mC8RkKPD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJRL2404z2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:03:25 +1000 (AEST)
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id 4385F440F60;
	Tue, 27 Aug 2024 10:01:30 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1724742090;
	bh=rPGBSZ1Nu4oGte5lWpykwFS7VqD7s8DLfHaTrjWVjYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mC8RkKPDlTDMdLg8O5LjBN7xg7+HIINo6Tc0jbi6128/xF1edkc82jSUISPuUlv29
	 3GqwSaxrrN87uFR+qSqiBIcQeV7Y6ruXOdEHdT+2zHw+5CZJbxsu2doa6bTWDTT9n0
	 5LucHaxgKPdt2p1HGotyICNCP8Av2kGH54uBlDq8LWLgg2k8DLgBbDIKuDmHMMZEoE
	 gBoPeiNZAPLGi4ei0Yh70fn6+DXUfubBPbm/9wo7A1L1gsxd8W+51TnS6LdUMZbSTt
	 aQRuxk66+dE+nmekRRWQb6Vmi0SSYOZKyIzNoJ8IZIM7Tdm0YfvlvDfV0QYvAUoOxS
	 YyZmgm0PxEzPA==
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
In-Reply-To: <f206f46c-0e2a-47a3-84b3-30bb53499f75@samsung.com> (Marek
	Szyprowski's message of "Tue, 27 Aug 2024 08:14:03 +0200")
References: <cover.1723359916.git.baruch@tkos.co.il>
	<CGME20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1@eucas1p1.samsung.com>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
	<53d988b1-bdce-422a-ae4e-158f305ad703@samsung.com>
	<87mskyva7o.fsf@tarshish>
	<f206f46c-0e2a-47a3-84b3-30bb53499f75@samsung.com>
Date: Tue, 27 Aug 2024 10:03:21 +0300
Message-ID: <87ikvmv45i.fsf@tarshish>
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

On Tue, Aug 27 2024, Marek Szyprowski wrote:
> On 27.08.2024 06:52, Baruch Siach wrote:
>> Hi Marek,
>>
>> Thanks for your report.
>>
>> On Mon, Aug 26 2024, Marek Szyprowski wrote:
>>> On 11.08.2024 09:09, Baruch Siach wrote:
>>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>>
>>>> Hardware DMA limit might not be power of 2. When RAM range starts above
>>>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>>>> can not encode this limit.
>>>>
>>>> Use plain address for DMA zone limit.
>>>>
>>>> Since DMA zone can now potentially span beyond 4GB physical limit of
>>>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that cas=
e.
>>>>
>>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>>> ---
>>> This patch landed recently in linux-next as commit ba0fb44aed47
>>> ("dma-mapping: replace zone_dma_bits by zone_dma_limit"). During my
>>> tests I found that it introduces the following warning on ARM64/Rockchip
>>> based Odroid M1 board (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dt=
s):
>> Does this warning go away if you revert both 3be9b846896d and ba0fb44aed=
47?
>
> Yes, linux-next with above mentioned commits reverted works fine.
>
>
>> Upstream rockchip DTs have no dma-ranges property. Is that the case for
>> your platform as well?
>>
>> Can you share kernel report of DMA zones and swiotlb? On my platform I g=
et:
>>
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
>> [    0.000000]   DMA32    empty
>> [    0.000000]   Normal   [mem 0x0000000840000000-0x0000000fffffffff]
>> ...
>> [    0.000000] software IO TLB: area num 8.
>> [    0.000000] software IO TLB: mapped [mem 0x000000083be38000-0x0000000=
83fe38000] (64MB)
>>
>> What do you get at your end?
>
> On ba0fb44aed47 I got:
>
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: No NUMA configuration found
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: Faking a node at [mem=20
> 0x0000000000200000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: NODE_DATA [mem 0x1ff7a0600-0x1ff7a2ff=
f]
> [ =C2=A0=C2=A0=C2=A00.000000] Zone ranges:
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0[mem 0x0000000000200000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0empty
> [ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
> [ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
000000200000-0x00000000083fffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
000009400000-0x00000000efffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
0001f0000000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem=20
> 0x0000000000200000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] On node 0, zone DMA: 512 pages in unavailab=
le ranges
> [ =C2=A0=C2=A0=C2=A00.000000] On node 0, zone DMA: 4096 pages in unavaila=
ble ranges
> [ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 96 MiB at 0x00000001f0000000 =
on node -1
>
> ...
>
> [ =C2=A0=C2=A0=C2=A00.000000] software IO TLB: SWIOTLB bounce buffer size=
 adjusted to 3MB
> [ =C2=A0=C2=A0=C2=A00.000000] software IO TLB: area num 4.
> [ =C2=A0=C2=A0=C2=A00.000000] software IO TLB: mapped [mem=20
> 0x00000001fac00000-0x00000001fb000000] (4MB)
>
> On the fa3c109a6d30 (parent commit of the $subject) I got:
>
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: No NUMA configuration found
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: Faking a node at [mem=20
> 0x0000000000200000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] NUMA: NODE_DATA [mem 0x1ff7a0600-0x1ff7a2ff=
f]
> [ =C2=A0=C2=A0=C2=A00.000000] Zone ranges:
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0[mem 0x0000000000200000-0x00000000ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0[mem 0x00000=
00100000000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
> [ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
000000200000-0x00000000083fffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
000009400000-0x00000000efffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x0000=
0001f0000000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem=20
> 0x0000000000200000-0x00000001ffffffff]
> [ =C2=A0=C2=A0=C2=A00.000000] On node 0, zone DMA: 512 pages in unavailab=
le ranges
> [ =C2=A0=C2=A0=C2=A00.000000] On node 0, zone DMA: 4096 pages in unavaila=
ble ranges
> [ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 96 MiB at 0x00000000ea000000 =
on node -1
>
> ...
>
> [ =C2=A0=C2=A0=C2=A00.000000] software IO TLB: area num 4.
> [ =C2=A0=C2=A0=C2=A00.000000] software IO TLB: mapped [mem=20
> 0x00000000e6000000-0x00000000ea000000] (64MB)
>
> It looks that for some reasons $subject patch changes the default zone=20
> and swiotlb configuration.

Does this fix the issue?

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index bfb10969cbf0..7fcd0aaa9bb6 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -116,6 +116,9 @@ static void __init arch_reserve_crashkernel(void)
=20
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
 {
+	if (memblock_start_of_DRAM() < U32_MAX)
+		zone_limit =3D min(zone_limit, U32_MAX);
+
 	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
 }
=20

Thanks,
baruch

>>> ------------[ cut here ]------------
>>> dwmmc_rockchip fe2b0000.mmc: swiotlb addr 0x00000001faf00000+4096
>>> overflow (mask ffffffff, bus limit 0).
>>> WARNING: CPU: 3 PID: 1 at kernel/dma/swiotlb.c:1594 swiotlb_map+0x2f0/0=
x308
>>> Modules linked in:
>>> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4+ #15278
>>> Hardware name: Hardkernel ODROID-M1 (DT)
>>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>>> pc : swiotlb_map+0x2f0/0x308
>>> lr : swiotlb_map+0x2f0/0x308
>>> ...
>>> Call trace:
>>>   =C2=A0swiotlb_map+0x2f0/0x308
>>>   =C2=A0dma_direct_map_sg+0x9c/0x2e4
>>>   =C2=A0__dma_map_sg_attrs+0x28/0x94
>>>   =C2=A0dma_map_sg_attrs+0x10/0x24
>>>   =C2=A0dw_mci_pre_dma_transfer+0xb8/0xf4
>>>   =C2=A0dw_mci_pre_req+0x50/0x68
>>>   =C2=A0mmc_blk_mq_issue_rq+0x3e0/0x964
>>>   =C2=A0mmc_mq_queue_rq+0x118/0x2b4
>>>   =C2=A0blk_mq_dispatch_rq_list+0x21c/0x714
>>>   =C2=A0__blk_mq_sched_dispatch_requests+0x490/0x58c
>>>   =C2=A0blk_mq_sched_dispatch_requests+0x30/0x6c
>>>   =C2=A0blk_mq_run_hw_queue+0x284/0x40c
>>>   =C2=A0blk_mq_flush_plug_list.part.0+0x190/0x974
>>>   =C2=A0blk_mq_flush_plug_list+0x1c/0x2c
>>>   =C2=A0__blk_flush_plug+0xe4/0x140
>>>   =C2=A0blk_finish_plug+0x38/0x4c
>>>   =C2=A0__ext4_get_inode_loc+0x22c/0x654
>>>   =C2=A0__ext4_get_inode_loc_noinmem+0x40/0xa8
>>>   =C2=A0__ext4_iget+0x154/0xcc0
>>>   =C2=A0ext4_get_journal_inode+0x30/0x110
>>>   =C2=A0ext4_load_and_init_journal+0x9c/0xaf0
>>>   =C2=A0ext4_fill_super+0x1fec/0x2d90
>>>   =C2=A0get_tree_bdev+0x140/0x1d8
>>>   =C2=A0ext4_get_tree+0x18/0x24
>>>   =C2=A0vfs_get_tree+0x28/0xe8
>>>   =C2=A0path_mount+0x3e8/0xb7c
>>>   =C2=A0init_mount+0x68/0xac
>>>   =C2=A0do_mount_root+0x108/0x1dc
>>>   =C2=A0mount_root_generic+0x100/0x330
>>>   =C2=A0mount_root+0x160/0x2d0
>>>   =C2=A0initrd_load+0x1f0/0x2a0
>>>   =C2=A0prepare_namespace+0x4c/0x29c
>>>   =C2=A0kernel_init_freeable+0x4b4/0x50c
>>>   =C2=A0kernel_init+0x20/0x1d8
>>>   =C2=A0ret_from_fork+0x10/0x20
>>> irq event stamp: 1305682
>>> hardirqs last=C2=A0 enabled at (1305681): [<ffff8000800e332c>]
>>> console_unlock+0x124/0x130
>>> hardirqs last disabled at (1305682): [<ffff80008124e684>] el1_dbg+0x24/=
0x8c
>>> softirqs last=C2=A0 enabled at (1305678): [<ffff80008005be1c>]
>>> handle_softirqs+0x4cc/0x4e4
>>> softirqs last disabled at (1305665): [<ffff8000800105b0>]
>>> __do_softirq+0x14/0x20
>>> ---[ end trace 0000000000000000 ]---
>>>
>>> This "bus limit 0" seems to be a bit suspicious to me as well as the
>>> fact that swiotlb is used for the MMC DMA. I will investigate this
>>> further tomorrow. The board boots fine though.
>> Looking at the code I guess that bus_dma_limit set to 0 means no bus
>> limit. But dma_mask for your device indicates 32-bit device limit. This
>> can't work with address above 4GB. For some reason DMA code tries to
>> allocate from higher address. This is most likely the reason
>> dma_capable() returns false.
>
> Indeed this looks like a source of the problem:
>
> [ =C2=A0=C2=A0=C2=A03.123618] Synopsys Designware Multimedia Card Interfa=
ce Driver
> [ =C2=A0=C2=A0=C2=A03.139653] dwmmc_rockchip fe2b0000.mmc: IDMAC supports=
 32-bit=20
> address mode.
> [ =C2=A0=C2=A0=C2=A03.147739] dwmmc_rockchip fe2b0000.mmc: Using internal=
 DMA controller.
> [ =C2=A0=C2=A0=C2=A03.161659] dwmmc_rockchip fe2b0000.mmc: Version ID is =
270a
> [ =C2=A0=C2=A0=C2=A03.168455] dwmmc_rockchip fe2b0000.mmc: DW MMC control=
ler at irq=20
> 56,32 bit host data width,256 deep fifo
> [ =C2=A0=C2=A0=C2=A03.182651] dwmmc_rockchip fe2b0000.mmc: Got CD GPIO
>
> ...
>
> [ =C2=A0=C2=A011.009258] ------------[ cut here ]------------
> [ =C2=A0=C2=A011.014762] dwmmc_rockchip fe2b0000.mmc: swiotlb addr=20
> 0x00000001faf00000+4096 overflow (mask ffffffff, bus limit 0).
>
>
>> ...
>
> Best regards

--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

