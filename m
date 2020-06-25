Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80420A051
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 15:51:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t1dK2WXNzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ctZnhPPD; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t0sB6N0PzDqsW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:16:30 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21D15206A1;
 Thu, 25 Jun 2020 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593090988;
 bh=hzVTufSqgXwAPMu2gHwPhbk4gm9XBC4oqWn21X0IZ0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctZnhPPDJHtzPcQnLaPl/EtZl6MpuCnn1PYgaWi3dOTtapIiF6TbhyNK1ocOWuY1G
 hXRLxa5J0cFLuuN1BlV+LPIHLN5IW274OeHHf7AR/iw9vE+CrPA+RAseI2FBiKMkWv
 Uu/sF2Y4eHA0lhKE885aHzMjotSnwkEezGLcmiZU=
Date: Thu, 25 Jun 2020 14:16:20 +0100
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 12/13] arm64: Remove dev->archdata.iommu pointer
Message-ID: <20200625131620.GA8161@willie-the-truck>
References: <20200625130836.1916-1-joro@8bytes.org>
 <20200625130836.1916-13-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625130836.1916-13-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 03:08:35PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> There are no users left, all drivers have been converted to use the
> per-device private pointer offered by IOMMU core.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/arm64/include/asm/device.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/device.h b/arch/arm64/include/asm/device.h
> index 12b778d55342..996498751318 100644
> --- a/arch/arm64/include/asm/device.h
> +++ b/arch/arm64/include/asm/device.h
> @@ -6,9 +6,6 @@
>  #define __ASM_DEVICE_H
>  
>  struct dev_archdata {
> -#ifdef CONFIG_IOMMU_API
> -	void *iommu;			/* private IOMMU data */
> -#endif
>  };

Acked-by: Will Deacon <will@kernel.org>

Thanks, Joerg.

Will
