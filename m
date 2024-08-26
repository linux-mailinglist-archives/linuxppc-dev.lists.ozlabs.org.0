Return-Path: <linuxppc-dev+bounces-553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A445E95FBFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt44v47mtz2yDY;
	Tue, 27 Aug 2024 07:46:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724700940;
	cv=none; b=k4m4PiyjmB4FPSbdJ8QtiREChg4qvwr0uahbw/vYuVluQFBALojOCu5jPSwIXTVh4B+WopguzibJY8e1wcmy6pajgDcyVYOoq1wDoxfeFFPpM96t9GOXvsD4b6q2PsQHKC5zk0ToqUo+Bh3bz8Qhh5iifraZG95Xug9+BU5mSqVzpGgnBXz31bNMrqnHgAqWLsV/d0UerIShK6wV7c8DpVYU5dMue+0zOw+dlwcgGouI2MKtAomLPn4fCEeq+5hI175Jp9xHBvw2VUtAyUNvqklhO7Ln1OXq650OieuQowAZrNid8QhRpYDUMZLVAoROVZlgSxcgB2RbC2jbAwkoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724700940; c=relaxed/relaxed;
	bh=ZX+wrqfx1bzDDtL6WbN39xilUXlPHJNgSjW3OMn0Guo=;
	h=X-Greylist:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:X-AuditID:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:Content-Language:From:
	 In-Reply-To:Content-Transfer-Encoding:X-Brightmail-Tracker:
	 X-Brightmail-Tracker:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:CMS-TYPE:X-CMS-RootMailID:References; b=LNiZz0sW2lxR2TPgol6hrRehzhROy01EAc3FZokzoTM2K4KWtFcCYKR33Eg6dAdmI421CS06Lw3eRJ50T9L4Fl7xLn1ZuhGnlHwL1JgGwxfIGmf1cS/PpJAeVEc9Tir1p7ksesA5P6PHGJ0YHs3pWcSiKi2CsjAAlWKwPL+JC+TWYkqzZ6M+DgmXGX+TF+23aMLCjhYqs20wiua8PRJLO9DQaI8uxT8VYGWyHXk6yX8q9fJNDuWHTh8j+DETxylKlOfE37TBQsIWdtizp319QYoxhjSVHZESJvV2w2xVpxsUF53fv5YXeMMLNhWrQtAms27WihLSPT/zQ+pCi96IuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=th6AuyQW; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=th6AuyQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 410 seconds by postgrey-1.37 at boromir; Tue, 27 Aug 2024 05:35:38 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt19k6hDVz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 05:35:37 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240826192832euoutp010d51a7b5fbfccdeec0578d9e327b2514~vXfp3vkev3120831208euoutp01V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 19:28:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240826192832euoutp010d51a7b5fbfccdeec0578d9e327b2514~vXfp3vkev3120831208euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724700512;
	bh=ZX+wrqfx1bzDDtL6WbN39xilUXlPHJNgSjW3OMn0Guo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=th6AuyQWr1fYa7HUSk81KZKq4R2Z2MQf4ByQ6Ri5br/sYvWUrZYY2Sg9qVhdhw99b
	 oR1KJ/Z0nh/E7wSfU4LJALmC9Z8oMjLUO4/rYpqCp+yeGdV/6tSzt5cxP5RjohQZLV
	 ewQi7nDSh2ZH9nWaItgN6IfoP30P1E8Q1Y1yBWUo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240826192832eucas1p24e055ed94bde75c3e1c5a0d167e379da~vXfpfIxUq1201112011eucas1p21;
	Mon, 26 Aug 2024 19:28:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id F3.4B.09875.F57DCC66; Mon, 26
	Aug 2024 20:28:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240826192831eucas1p1f2dcbd72c0096370e721d2e9e87dbace~vXfpCSEeu3001030010eucas1p13;
	Mon, 26 Aug 2024 19:28:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240826192831eusmtrp19a19c57f4ef810d69982206730b58566~vXfpBnGk53088530885eusmtrp15;
	Mon, 26 Aug 2024 19:28:31 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-95-66ccd75fb9d5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.8A.08810.F57DCC66; Mon, 26
	Aug 2024 20:28:31 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240826192830eusmtip2eca04abb977e7da2df11d0adc5016ea8~vXfn5OPwj0269802698eusmtip2I;
	Mon, 26 Aug 2024 19:28:30 +0000 (GMT)
Message-ID: <53d988b1-bdce-422a-ae4e-158f305ad703@samsung.com>
Date: Mon, 26 Aug 2024 21:28:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by
 zone_dma_limit
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	=?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, Ramon Fried
	<ramon@neureality.ai>, Elad Nachman <enachman@marvell.com>,
	linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRmVeSWpSXmKPExsWy7djP87oJ18+kGSw9ymix4tobFov3y3oY
	LR4v2sZusXL1USaLX18sLDY9vsZqcXnXHDaLTw/+M1tMWNjMbPH7+z9Wi4VznrNa9L1cw2px
	8MMTVouWO6YOfB5r5q1h9Ni0qpPNY/OSeo8Xm2cyepyfsZDRY/fNBjaPyQsvMnvM+vmPxWPv
	3u2MHnMbbjF5fN4kF8AdxWWTkpqTWZZapG+XwJVx/PI99oKOiIp522azNjAe8ehi5OSQEDCR
	WLd0KnMXIxeHkMAKRompLfPYIJwvjBJnd7WwQDifGSUenjjGCNOyd/cqJhBbSGA5o8TlHj+I
	oo+MEvs6N7CBJHgF7CS+fNvAAmKzCKhKHPx+nBUiLihxcuYTsLiogLzE/Vsz2EFsYYEAiSnP
	NoH1ighMYJT4vFQNZCizwAsmiZ1THoFtYxYQl7j1ZD6YzSZgKNH1tgusgVMgQuLF7U0sEDXy
	Es1bZ4M9JCGwnVNi2qm7QA4HkOMi0XFNEOIDYYlXx7ewQ9gyEqcn97BA1LczSiz4fZ8JwgG6
	ouH5LaifrSXunPvFBjKIWUBTYv0ufYiwo8TyuS+YIObzSdx4KwhxA5/EpG3TodbySnS0CUFU
	q0nMOr4Obu3BC5eYJzAqzUIKlllIvpyF5JtZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L
	10vOz93ECEyAp/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nwyl0+mSbEm5JYWZValB9fVJqTWnyI
	UZqDRUmcVzVFPlVIID2xJDU7NbUgtQgmy8TBKdXA1Hd48uVDd5vYv7VPjFApmiH68MrD5ReF
	t/Nc9+lazmNXf6M9J2LnmvTzHHcmHNBPKWBezq/AYvNMSqbh8jt7IeX9vr9yUld7zD9yqM+L
	pf3r22gjjlfZLDcXvVELujbrcJZGx5xWBX7HtqlLcx/EqYV/Yb/sOmO+cIOwodWdIzUPzj8r
	OdDiyrfqSsprXY3SHzMvnXYrOFT3/Ldkf59q4OP5kc2PRVZa9XALsH+KuX1g1+5btmdnMBxk
	tTQ25GR98P7itZ8Pu/YLRk9+w5ura2cg87Tt5tZHPqK/dig9CuR+IMjzWkfo6ZvSav+vbupv
	7B0qVITW1Z/srJ3sXnT61vG4NY8S1TeHFa7/M2P1fyWW4oxEQy3mouJEAPIUsmXvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsVy+t/xe7rx18+kGbxqlLVYce0Ni8X7ZT2M
	Fo8XbWO3WLn6KJPFry8WFpseX2O1uLxrDpvFpwf/mS0mLGxmtvj9/R+rxcI5z1kt+l6uYbU4
	+OEJq0XLHVMHPo8189Ywemxa1cnmsXlJvceLzTMZPc7PWMjosftmA5vH5IUXmT1m/fzH4rF3
	73ZGj7kNt5g8Pm+SC+CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJ
	Sc3JLEst0rdL0Ms4fvkee0FHRMW8bbNZGxiPeHQxcnJICJhI7N29iqmLkYtDSGApo8SzaxOZ
	IBIyEienNbBC2MISf651sUEUvWeU+D/zACNIglfATuLLtw0sIDaLgKrEwe/HWSHighInZz4B
	i4sKyEvcvzWDHcQWFvCTuP92K9ggEYEJjBLLfv1nBkkwC7xgklh3pBxiwzVGiY+nO5kgEuIS
	t57MB7PZBAwlut6CnMHJwSkQIfHi9iYWiBozia6tXYwQtrxE89bZzBMYhWYhOWQWklGzkLTM
	QtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmDUbzv2c/MOxnmvPuodYmTiYDzEKMHB
	rCTCK3f5ZJoQb0piZVVqUX58UWlOavEhRlNgaExklhJNzgemnbySeEMzA1NDEzNLA1NLM2Ml
	cV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqZjV9xe1gbmRV2omCS3NmAHi8SaxQdsm3emaRlL
	JQjsOPvr6bnSHNXXHdMafjqHi0VPCnvmk+XQ/L7SdoOfenTxx1tfI/9vC7M4qLOybMltZ6b4
	dkbj+ReqlESEtE0fVs37H9rb+eRQ3MqFbN5c7nLRSz5ou15eG3NKNmrlKZ/rn7yKuvh7uk6r
	t+9RP8D+IFOTI7u7bTmL3YU9O7Tf7iv06kldI/R45/KGhkrfOKe7pSXvdNtWuWftucWj+7T1
	+7rFUzJig7deO3hSIkvATvyNvZB4eI2WrrvVytvLv1RZ2r+asf14dYLdPtXJnTMtNJUiDt4/
	eq66RWHN7uf9laf+5rWk7hTRdjze4MGYrMRSnJFoqMVcVJwIADS951qDAwAA
X-CMS-MailID: 20240826192831eucas1p1f2dcbd72c0096370e721d2e9e87dbace
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1
References: <cover.1723359916.git.baruch@tkos.co.il>
	<CGME20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1@eucas1p1.samsung.com>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>

Dear All,

On 11.08.2024 09:09, Baruch Siach wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> Hardware DMA limit might not be power of 2. When RAM range starts above
> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> can not encode this limit.
>
> Use plain address for DMA zone limit.
>
> Since DMA zone can now potentially span beyond 4GB physical limit of
> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

This patch landed recently in linux-next as commit ba0fb44aed47 
("dma-mapping: replace zone_dma_bits by zone_dma_limit"). During my 
tests I found that it introduces the following warning on ARM64/Rockchip 
based Odroid M1 board (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts):

------------[ cut here ]------------
dwmmc_rockchip fe2b0000.mmc: swiotlb addr 0x00000001faf00000+4096 
overflow (mask ffffffff, bus limit 0).
WARNING: CPU: 3 PID: 1 at kernel/dma/swiotlb.c:1594 swiotlb_map+0x2f0/0x308
Modules linked in:
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4+ #15278
Hardware name: Hardkernel ODROID-M1 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : swiotlb_map+0x2f0/0x308
lr : swiotlb_map+0x2f0/0x308
...
Call trace:
  swiotlb_map+0x2f0/0x308
  dma_direct_map_sg+0x9c/0x2e4
  __dma_map_sg_attrs+0x28/0x94
  dma_map_sg_attrs+0x10/0x24
  dw_mci_pre_dma_transfer+0xb8/0xf4
  dw_mci_pre_req+0x50/0x68
  mmc_blk_mq_issue_rq+0x3e0/0x964
  mmc_mq_queue_rq+0x118/0x2b4
  blk_mq_dispatch_rq_list+0x21c/0x714
  __blk_mq_sched_dispatch_requests+0x490/0x58c
  blk_mq_sched_dispatch_requests+0x30/0x6c
  blk_mq_run_hw_queue+0x284/0x40c
  blk_mq_flush_plug_list.part.0+0x190/0x974
  blk_mq_flush_plug_list+0x1c/0x2c
  __blk_flush_plug+0xe4/0x140
  blk_finish_plug+0x38/0x4c
  __ext4_get_inode_loc+0x22c/0x654
  __ext4_get_inode_loc_noinmem+0x40/0xa8
  __ext4_iget+0x154/0xcc0
  ext4_get_journal_inode+0x30/0x110
  ext4_load_and_init_journal+0x9c/0xaf0
  ext4_fill_super+0x1fec/0x2d90
  get_tree_bdev+0x140/0x1d8
  ext4_get_tree+0x18/0x24
  vfs_get_tree+0x28/0xe8
  path_mount+0x3e8/0xb7c
  init_mount+0x68/0xac
  do_mount_root+0x108/0x1dc
  mount_root_generic+0x100/0x330
  mount_root+0x160/0x2d0
  initrd_load+0x1f0/0x2a0
  prepare_namespace+0x4c/0x29c
  kernel_init_freeable+0x4b4/0x50c
  kernel_init+0x20/0x1d8
  ret_from_fork+0x10/0x20
irq event stamp: 1305682
hardirqs last  enabled at (1305681): [<ffff8000800e332c>] 
console_unlock+0x124/0x130
hardirqs last disabled at (1305682): [<ffff80008124e684>] el1_dbg+0x24/0x8c
softirqs last  enabled at (1305678): [<ffff80008005be1c>] 
handle_softirqs+0x4cc/0x4e4
softirqs last disabled at (1305665): [<ffff8000800105b0>] 
__do_softirq+0x14/0x20
---[ end trace 0000000000000000 ]---

This "bus limit 0" seems to be a bit suspicious to me as well as the 
fact that swiotlb is used for the MMC DMA. I will investigate this 
further tomorrow. The board boots fine though.


>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>   arch/powerpc/mm/mem.c      |  5 ++++-
>   arch/s390/mm/init.c        |  2 +-
>   include/linux/dma-direct.h |  2 +-
>   kernel/dma/direct.c        |  6 +++---
>   kernel/dma/pool.c          |  4 ++--
>   kernel/dma/swiotlb.c       |  6 +++---
>   7 files changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9b5ab6818f7f..c45e2152ca9e 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -115,35 +115,35 @@ static void __init arch_reserve_crashkernel(void)
>   }
>   
>   /*
> - * Return the maximum physical address for a zone accessible by the given bits
> - * limit. If DRAM starts above 32-bit, expand the zone to the maximum
> + * Return the maximum physical address for a zone given its limit.
> + * If DRAM starts above 32-bit, expand the zone to the maximum
>    * available memory, otherwise cap it at 32-bit.
>    */
> -static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> +static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>   {
> -	phys_addr_t zone_mask = DMA_BIT_MASK(zone_bits);
>   	phys_addr_t phys_start = memblock_start_of_DRAM();
>   
>   	if (phys_start > U32_MAX)
> -		zone_mask = PHYS_ADDR_MAX;
> -	else if (phys_start > zone_mask)
> -		zone_mask = U32_MAX;
> +		zone_limit = PHYS_ADDR_MAX;
> +	else if (phys_start > zone_limit)
> +		zone_limit = U32_MAX;
>   
> -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
> +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>   }
>   
>   static void __init zone_sizes_init(void)
>   {
>   	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
> -	unsigned int __maybe_unused acpi_zone_dma_bits;
> -	unsigned int __maybe_unused dt_zone_dma_bits;
> -	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
> +	phys_addr_t __maybe_unused acpi_zone_dma_limit;
> +	phys_addr_t __maybe_unused dt_zone_dma_limit;
> +	phys_addr_t __maybe_unused dma32_phys_limit =
> +		max_zone_phys(DMA_BIT_MASK(32));
>   
>   #ifdef CONFIG_ZONE_DMA
> -	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
> -	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
> -	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
> -	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
> +	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
> +	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
> +	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
> +	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
>   	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>   #endif
>   #ifdef CONFIG_ZONE_DMA32
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index d325217ab201..05b7f702b3f7 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -216,7 +216,7 @@ static int __init mark_nonram_nosave(void)
>    * everything else. GFP_DMA32 page allocations automatically fall back to
>    * ZONE_DMA.
>    *
> - * By using 31-bit unconditionally, we can exploit zone_dma_bits to inform the
> + * By using 31-bit unconditionally, we can exploit zone_dma_limit to inform the
>    * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
>    * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
>    * ZONE_DMA.
> @@ -230,6 +230,7 @@ void __init paging_init(void)
>   {
>   	unsigned long long total_ram = memblock_phys_mem_size();
>   	phys_addr_t top_of_ram = memblock_end_of_DRAM();
> +	int zone_dma_bits;
>   
>   #ifdef CONFIG_HIGHMEM
>   	unsigned long v = __fix_to_virt(FIX_KMAP_END);
> @@ -256,6 +257,8 @@ void __init paging_init(void)
>   	else
>   		zone_dma_bits = 31;
>   
> +	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
> +
>   #ifdef CONFIG_ZONE_DMA
>   	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
>   				      1UL << (zone_dma_bits - PAGE_SHIFT));
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index ddcd39ef4346..91fc2b91adfc 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -97,7 +97,7 @@ void __init paging_init(void)
>   
>   	vmem_map_init();
>   	sparse_init();
> -	zone_dma_bits = 31;
> +	zone_dma_limit = DMA_BIT_MASK(31);
>   	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
>   	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index edbe13d00776..d7e30d4f7503 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -12,7 +12,7 @@
>   #include <linux/mem_encrypt.h>
>   #include <linux/swiotlb.h>
>   
> -extern unsigned int zone_dma_bits;
> +extern u64 zone_dma_limit;
>   
>   /*
>    * Record the mapping of CPU physical to DMA addresses for a given region.
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4480a3cd92e0..f2ba074a6a54 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -20,7 +20,7 @@
>    * it for entirely different regions. In that case the arch code needs to
>    * override the variable below for dma-direct to work properly.
>    */
> -unsigned int zone_dma_bits __ro_after_init = 24;
> +u64 zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
>   
>   static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>   		phys_addr_t phys)
> @@ -59,7 +59,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>   	 * zones.
>   	 */
>   	*phys_limit = dma_to_phys(dev, dma_limit);
> -	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (*phys_limit <= zone_dma_limit)
>   		return GFP_DMA;
>   	if (*phys_limit <= DMA_BIT_MASK(32))
>   		return GFP_DMA32;
> @@ -580,7 +580,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
>   	 * part of the check.
>   	 */
>   	if (IS_ENABLED(CONFIG_ZONE_DMA))
> -		min_mask = min_t(u64, min_mask, DMA_BIT_MASK(zone_dma_bits));
> +		min_mask = min_t(u64, min_mask, zone_dma_limit);
>   	return mask >= phys_to_dma_unencrypted(dev, min_mask);
>   }
>   
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index d10613eb0f63..7b04f7575796 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -70,9 +70,9 @@ static bool cma_in_zone(gfp_t gfp)
>   	/* CMA can't cross zone boundaries, see cma_activate_area() */
>   	end = cma_get_base(cma) + size - 1;
>   	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> -		return end <= DMA_BIT_MASK(zone_dma_bits);
> +		return end <= zone_dma_limit;
>   	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
> -		return end <= DMA_BIT_MASK(32);
> +		return end <= max(DMA_BIT_MASK(32), zone_dma_limit);
>   	return true;
>   }
>   
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index df68d29740a0..abcf3fa63a56 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -450,9 +450,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>   	if (!remap)
>   		io_tlb_default_mem.can_grow = true;
>   	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
> -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
> +		io_tlb_default_mem.phys_limit = zone_dma_limit;
>   	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
> -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
> +		io_tlb_default_mem.phys_limit = max(DMA_BIT_MASK(32), zone_dma_limit);
>   	else
>   		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
>   #endif
> @@ -629,7 +629,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>   	}
>   
>   	gfp &= ~GFP_ZONEMASK;
> -	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (phys_limit <= zone_dma_limit)
>   		gfp |= __GFP_DMA;
>   	else if (phys_limit <= DMA_BIT_MASK(32))
>   		gfp |= __GFP_DMA32;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


