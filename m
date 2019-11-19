Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C811020CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 10:37:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HLMj6TjjzDql6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 20:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="BS2Eme0K"; 
 dkim-atps=neutral
X-Greylist: delayed 510 seconds by postgrey-1.36 at bilbo;
 Tue, 19 Nov 2019 20:35:56 AEDT
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HLKm1rj3zDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 20:35:52 +1100 (AEDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191119092714euoutp01dd79eb9caa80975fb459d033587e97b3~YhjWstsaN2028020280euoutp01Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:27:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191119092714euoutp01dd79eb9caa80975fb459d033587e97b3~YhjWstsaN2028020280euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1574155634;
 bh=alwHHp4jYSkK1iImAUhQ1CufKsrISVycPV9L4oI6Qm8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BS2Eme0KD9IC0n4ztPIn3pUCUdgpE3tDAdod71fQ29H7AfXc5fbK/jS1At/oMAYvi
 OPz2L1vSHMM2ehPVo1c95RKBcHDXSaR8QKHzGN+GgwhHBq6SyoSYDidh/EWZeJNC/i
 PGVXRpvZ1fD1vTYN9AJ/4GqB0IT0BMT0SMEoVRtA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191119092714eucas1p19ad7b245bb43cca145da3e28bcfb848f~YhjWl-t7f2420524205eucas1p1p;
 Tue, 19 Nov 2019 09:27:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.5A.04469.275B3DD5; Tue, 19
 Nov 2019 09:27:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191119092714eucas1p2e73f6c2e95a5ff2cd435dc0831971d09~YhjWUKvpY2553525535eucas1p2b;
 Tue, 19 Nov 2019 09:27:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191119092714eusmtrp1df81334099b0df6a06db370a5d5b9b51~YhjWTXl5v1502315023eusmtrp1Q;
 Tue, 19 Nov 2019 09:27:14 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-ce-5dd3b572977a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 62.02.04166.275B3DD5; Tue, 19
 Nov 2019 09:27:14 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191119092713eusmtip2bf703363fba3323736c0bc4971c416d1~YhjVzxm4L1311613116eusmtip2R;
 Tue, 19 Nov 2019 09:27:13 +0000 (GMT)
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
To: Christoph Hellwig <hch@lst.de>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, iommu@lists.linux-foundation.org, Russell King
 <linux@armlinux.org.uk>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
Date: Tue, 19 Nov 2019 10:27:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113073539.9660-2-hch@lst.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djP87pFWy/HGjRs17ZYufook8WC/dYW
 589vYLfY9Pgaq0Xnpq2MFjPO72OyODR1L6PF7+//WC22zVrO5sDpcfnaRWaPTas62Tw2L6n3
 mHxjOaPH+RkLGT1232wACp2u9vi8SS6AI4rLJiU1J7MstUjfLoEro33XGpaCxeYVK3c+Z2lg
 3KfXxcjJISFgItHUNoW5i5GLQ0hgBaPEqZbNjBDOFyDn9wxWCOczo8TLM3OZYFq6rhxlgkgs
 Z5SY9fs/O4TzllGi88MGFpAqYQE3ic39s4EGc3CICMxnlLhTDFLDLHAcqKZtE9gkNgFDia63
 XWwgNq+AncTtCSdZQWwWAVWJvzums4L0igrESnQsz4AoEZQ4OfMJ2HhOAX2J/U/2grUyC8hL
 NG8FWQVii0vcejIf7DgJgXPsEttfz2SHuNpF4sa85WwQtrDEq+NboOIyEqcn97BANDQzSjw8
 t5YdwulhlLjcNIMRospa4vDxi2AXMQtoSqzfpQ8RdpR48vgKE0hYQoBP4sZbQYgj+CQmbZvO
 DBHmlehoE4KoVpOYdXwd3NqDFy4xT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNsxL
 LdcrTswtLs1L10vOz93ECExYp/8d/7SD8eulpEOMAhyMSjy8J1QuxwqxJpYVV+YeYpTgYFYS
 4fV7dCFWiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA6Nx
 4Yc49nW/n3Yv1/jDKvasMCDO6+WLp1lWP2TuvvruMyfg8q6pYdbvz3naeTnmBOu+f3vm+am+
 pbMe7fwXez7o4bPE34nnakL1T/0KT5uY/+Fp1Qnh7VcqCqumxIpEbd3d68f47MWXHo4d085b
 XM+K+1zUen312ZK9XxZtmMssvd6a52TjNOmvSizFGYmGWsxFxYkALryqZ1QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xe7pFWy/HGuydLW6xcvVRJosF+60t
 zp/fwG6x6fE1VovOTVsZLWac38dkcWjqXkaL39//sVpsm7WczYHT4/K1i8wem1Z1snlsXlLv
 MfnGckaP8zMWMnrsvtkAFDpd7fF5k1wAR5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6h
 sXmslZGpkr6dTUpqTmZZapG+XYJeRvuuNSwFi80rVu58ztLAuE+vi5GTQ0LARKLrylGmLkYu
 DiGBpYwSC1b2MEEkZCROTmtghbCFJf5c62IDsYUEXjNKrJ3GDWILC7hJbO6fzQzSLCIwn1Fi
 zf6HYA3MAscZJa4sTYKYuhyoYc88FpAEm4ChRNdbiEm8AnYStyecBGtgEVCV+LtjOpgtKhAr
 8X3lJ0aIGkGJkzOfgPVyCuhL7H+ylw1igZnEvM0PmSFseYnmrbOhbHGJW0/mM01gFJqFpH0W
 kpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBGtx37uXkH46WNwYcYBTgY
 lXh4T6hcjhViTSwrrsw9xCjBwawkwuv36EKsEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucD
 00deSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbG3PTIhTbuZ3hP
 r+7sKWVLuborM9B888LaP7fnPtT6FfbzX0B9Un7ggcqZH9l2P7A7yVDaOP3Y/oaE1U8VhCex
 dkYfPlEkefiW7KIA3lDzcIkVRou2eT1PF354QED6XNTnTF3xxXI6hzydCudcNfu4e9Erm7jf
 kbLZU5Q5vA/eb30solzuvKFGiaU4I9FQi7moOBEAE6VifecCAAA=
X-CMS-MailID: 20191119092714eucas1p2e73f6c2e95a5ff2cd435dc0831971d09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
References: <20191113073539.9660-1-hch@lst.de>
 <CGME20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9@epcas3p2.samsung.com>
 <20191113073539.9660-2-hch@lst.de>
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
Cc: 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 13.11.2019 08:35, Christoph Hellwig wrote:
> Currently each architectures that wants to override dma_to_phys and
> phys_to_dma also has to provide dma_capable.  But there isn't really
> any good reason for that.  powerpc and mips just have copies of the
> generic one minus the latests fix, and the arm one was the inspiration
> for said fix, but misses the bus_dma_mask handling.
> Make all architectures use the generic version instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This patch breaks DMAengine PL330 driver on Samsung Exynos SoCs:

[    3.602338] dma-pl330 12690000.pdma: overflow 0x13810020+1 of DMA 
mask ffffffff bus mask 0
[    3.605113] ------------[ cut here ]------------
[    3.609719] WARNING: CPU: 2 PID: 1 at kernel/dma/direct.c:36 
report_addr+0xc0/0xfc
[    3.617226] Modules linked in:
[    3.620271] CPU: 2 PID: 1 Comm: init Not tainted 
5.4.0-rc5-00056-gb037b220e71d #6911
[    3.627986] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    3.634094] [<c01124e8>] (unwind_backtrace) from [<c010dfcc>] 
(show_stack+0x10/0x14)
[    3.641803] [<c010dfcc>] (show_stack) from [<c0ae9af8>] 
(dump_stack+0xa8/0xd4)
[    3.649002] [<c0ae9af8>] (dump_stack) from [<c012746c>] 
(__warn+0xf4/0x10c)
[    3.655940] [<c012746c>] (__warn) from [<c0127534>] 
(warn_slowpath_fmt+0xb0/0xb8)
[    3.663404] [<c0127534>] (warn_slowpath_fmt) from [<c01b4ff4>] 
(report_addr+0xc0/0xfc)
[    3.671303] [<c01b4ff4>] (report_addr) from [<c01b5264>] 
(dma_direct_map_resource+0x98/0xa0)
[    3.679739] [<c01b5264>] (dma_direct_map_resource) from [<c04fbb58>] 
(pl330_prep_slave_fifo+0xe4/0x128)
[    3.689099] [<c04fbb58>] (pl330_prep_slave_fifo) from [<c04fe2b8>] 
(pl330_prep_slave_sg+0x54/0x1cc)
[    3.698129] [<c04fe2b8>] (pl330_prep_slave_sg) from [<c053e5f0>] 
(s3c24xx_serial_start_tx_dma+0x118/0x1e8)
[    3.707764] [<c053e5f0>] (s3c24xx_serial_start_tx_dma) from 
[<c0535f70>] (uart_write+0xe4/0x1e0)
[    3.716532] [<c0535f70>] (uart_write) from [<c05186a0>] 
(n_tty_write+0x1c8/0x474)
[    3.723992] [<c05186a0>] (n_tty_write) from [<c05163c0>] 
(tty_write+0x154/0x314)
[    3.731380] [<c05163c0>] (tty_write) from [<c02a5748>] 
(__vfs_write+0x30/0x1d0)
[    3.738662] [<c02a5748>] (__vfs_write) from [<c02a851c>] 
(vfs_write+0xa4/0x180)
[    3.745949] [<c02a851c>] (vfs_write) from [<c02a8778>] 
(ksys_write+0x60/0xd8)
[    3.753069] [<c02a8778>] (ksys_write) from [<c0101000>] 
(ret_fast_syscall+0x0/0x28)
[    3.760705] Exception stack(0xee8dffa8 to 0xee8dfff0)
[    3.765739] ffa0:                   0000004a beca876c 00000002 
beca876c 0000004a 00000000
[    3.773900] ffc0: 0000004a beca876c b6f02cf0 00000004 beca876c 
0000004a 00000000 b6f99010
[    3.782056] ffe0: 0000006c beca8628 b6e1d000 b6e7a634
[    3.787092] irq event stamp: 289740
[    3.790571] hardirqs last  enabled at (289739): [<c0b0d0c4>] 
_raw_spin_unlock_irqrestore+0x6c/0x74
[    3.799503] hardirqs last disabled at (289740): [<c0b0caf8>] 
_raw_spin_lock_irqsave+0x1c/0x58
[    3.808011] softirqs last  enabled at (289576): [<c01026bc>] 
__do_softirq+0x4fc/0x5fc
[    3.815830] softirqs last disabled at (289567): [<c0130044>] 
irq_exit+0x16c/0x170
[    3.823286] ---[ end trace b1432c658797b861 ]---
[    3.827898] samsung-uart 13810000.serial: Unable to get desc for Tx
[    3.834624] samsung-uart 13810000.serial: Unable to get desc for Tx
[    3.840487] samsung-uart 13810000.serial: Unable to get desc for Tx

I'm checking now which part of it causes the issue.


> ---
>   arch/arm/include/asm/dma-direct.h     | 19 -------------------
>   arch/mips/include/asm/dma-direct.h    |  8 --------
>   arch/powerpc/include/asm/dma-direct.h |  9 ---------
>   include/linux/dma-direct.h            |  2 +-
>   4 files changed, 1 insertion(+), 37 deletions(-)
>
> diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
> index b67e5fc1fe43..7c3001a6a775 100644
> --- a/arch/arm/include/asm/dma-direct.h
> +++ b/arch/arm/include/asm/dma-direct.h
> @@ -14,23 +14,4 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>   	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
>   }
>   
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	u64 limit, mask;
> -
> -	if (!dev->dma_mask)
> -		return 0;
> -
> -	mask = *dev->dma_mask;
> -
> -	limit = (mask + 1) & ~mask;
> -	if (limit && size > limit)
> -		return 0;
> -
> -	if ((addr | (addr + size - 1)) & ~mask)
> -		return 0;
> -
> -	return 1;
> -}
> -
>   #endif /* ASM_ARM_DMA_DIRECT_H */
> diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
> index b5c240806e1b..14e352651ce9 100644
> --- a/arch/mips/include/asm/dma-direct.h
> +++ b/arch/mips/include/asm/dma-direct.h
> @@ -2,14 +2,6 @@
>   #ifndef _MIPS_DMA_DIRECT_H
>   #define _MIPS_DMA_DIRECT_H 1
>   
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	if (!dev->dma_mask)
> -		return false;
> -
> -	return addr + size - 1 <= *dev->dma_mask;
> -}
> -
>   dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
>   phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
>   
> diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
> index a2912b47102c..e29e8a236b8d 100644
> --- a/arch/powerpc/include/asm/dma-direct.h
> +++ b/arch/powerpc/include/asm/dma-direct.h
> @@ -2,15 +2,6 @@
>   #ifndef ASM_POWERPC_DMA_DIRECT_H
>   #define ASM_POWERPC_DMA_DIRECT_H 1
>   
> -static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
> -{
> -	if (!dev->dma_mask)
> -		return false;
> -
> -	return addr + size - 1 <=
> -		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
> -}
> -
>   static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	if (!dev)
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 6db863c3eb93..991f8aa2676e 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -24,6 +24,7 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>   
>   	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
>   }
> +#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>   
>   static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
>   {
> @@ -38,7 +39,6 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
>   
>   	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
>   }
> -#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>   
>   #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
>   bool force_dma_unencrypted(struct device *dev);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

