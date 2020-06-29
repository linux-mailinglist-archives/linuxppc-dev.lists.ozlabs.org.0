Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681A20CE06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 12:56:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wPYy514bzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 20:56:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wPXF1MzlzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 20:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YiHYnDoc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wPX01jWzz9s6w;
 Mon, 29 Jun 2020 20:54:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593428108;
 bh=Ikj+QFFobl8b3GOszRTI8T5Tvh6wpN/NDrkClHklAgw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YiHYnDocf/5avJ1oQV/ZaHBo/5KnMj7//ysZQFYyI4CFWIs0UV549pLr1FezSCW5R
 7XD/bwKDSUl4GAlnxg7+l0dw4qYA4xFJR/p0JjqRrWAn2c6piTAq/Kf99cWgxRb+Vr
 ch+9DPfW5GFlugwK8NDTwdtqvhOtAXApFXREB/EMHOgHMLm6ivU0YJfIMjJPJ40xpN
 kv2gGSe40lRU0VLBuIWAsbpJHfD2vQ8cVfDbiLUGCL8LADDRAfzAvbVmxjxe8KYph/
 C0DoRs93QcEpGuelY5DIvGvYXit7Ov60w25mPElZgJuSxb+KyRGJmW1byOAeC/UHQf
 AIm77bM9c7www==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Subject: Re: [PATCH 13/13] powerpc/dma: Remove dev->archdata.iommu_domain
In-Reply-To: <20200625130836.1916-14-joro@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
 <20200625130836.1916-14-joro@8bytes.org>
Date: Mon, 29 Jun 2020 20:57:07 +1000
Message-ID: <87bll287i4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joerg Roedel <joro@8bytes.org> writes:
> From: Joerg Roedel <jroedel@suse.de>
>
> There are no users left, so remove the pointer and save some memory.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/powerpc/include/asm/device.h | 3 ---
>  1 file changed, 3 deletions(-)

It's a little hard to confirm there are no users left just with grep,
but I think you've got them all, and the compiler should tell us if
you've missed any.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
> index 266542769e4b..1bc595213338 100644
> --- a/arch/powerpc/include/asm/device.h
> +++ b/arch/powerpc/include/asm/device.h
> @@ -34,9 +34,6 @@ struct dev_archdata {
>  	struct iommu_table	*iommu_table_base;
>  #endif
>  
> -#ifdef CONFIG_IOMMU_API
> -	void			*iommu_domain;
> -#endif
>  #ifdef CONFIG_PPC64
>  	struct pci_dn		*pci_data;
>  #endif
> -- 
> 2.27.0
