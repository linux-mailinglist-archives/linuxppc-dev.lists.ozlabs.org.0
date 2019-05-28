Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A606A2C63B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:14:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ct6w0F8XzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 22:14:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ct2b1XwxzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 22:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45Ct2b0Q3Cz8wLB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 22:10:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45Ct2Z6Fbmz9s7h; Tue, 28 May 2019 22:10:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+365a05151ac8b8961682+5756+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ol5OLlcQ"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45Ct2Y6j3Nz9s5c;
 Tue, 28 May 2019 22:10:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/llYLDcfDrDF9UOsCQrC0ywgRhGU/i6nXwTNUFk18A8=; b=ol5OLlcQhjgWilPhDzrhAUrxJ
 Kzt+A9yozua/feDdo8UIBgJ6vt+KymwBFVNW8lDQEEDDvvGEEiaNBLQ+lTfdSySdy0Y1tAQO30Fhe
 N8f5DFAdltt5w+c3rOanEF/vhFejM7dn9Vweoa+NZ/ytIBXVFkpyUD+odYL1ylKYH4TC3HFJ6FsI2
 Amj0xaecxP3xsHaKQJHqaUjMms7vy9Px6nSYyDj6ZqICdensNwezXk7FaUCpZ/95d3/RJCa0Fza2G
 YoJ0/vOXO5ax+DIPwXdguD0ibUForHifRX/js9ERdOqCosSs+7m52xNNNQBqAsaFNkjGWGwz290FW
 pOQZ8MnuA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hVavi-0004La-2U; Tue, 28 May 2019 12:10:10 +0000
Date: Tue, 28 May 2019 05:10:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/configs: Rename foo_basic_defconfig to
 foo_base.config
Message-ID: <20190528121009.GA11901@infradead.org>
References: <20190528081614.26096-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528081614.26096-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 06:16:14PM +1000, Michael Ellerman wrote:
> We have several "defconfigs" that are not actually full defconfigs
> they are just a base set of options which are then merged with other
> fragments to produce a working defconfig.
> 
> The most obvious example is corenet_basic_defconfig which only
> contains one symbol CONFIG_CORENET_GENERIC=y. But there is also
> mpc85xx_base_defconfig which doesn't actually enable CONFIG_PPC_85xx.
> 
> To avoid confusion, rename these config fragments to "foo_base.config"
> to make it clearer that they are not full defconfigs.

Adding linux-kbuild, maybe we can make the handling of these fragments
generic and actually document it..

>
> Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Makefile                                | 12 ++++++------
>  .../{corenet_basic_defconfig => corenet_base.config} |  0
>  .../{mpc85xx_basic_defconfig => mpc85xx_base.config} |  0
>  .../{mpc86xx_basic_defconfig => mpc86xx_base.config} |  0
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename arch/powerpc/configs/{corenet_basic_defconfig => corenet_base.config} (100%)
>  rename arch/powerpc/configs/{mpc85xx_basic_defconfig => mpc85xx_base.config} (100%)
>  rename arch/powerpc/configs/{mpc86xx_basic_defconfig => mpc86xx_base.config} (100%)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index c345b79414a9..94f735db2229 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -333,32 +333,32 @@ PHONY += powernv_be_defconfig
>  
>  PHONY += mpc85xx_defconfig
>  mpc85xx_defconfig:
> -	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc85xx_base.config,\
>  		85xx-32bit 85xx-hw fsl-emb-nonhw)
>  
>  PHONY += mpc85xx_smp_defconfig
>  mpc85xx_smp_defconfig:
> -	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc85xx_base.config,\
>  		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
>  
>  PHONY += corenet32_smp_defconfig
>  corenet32_smp_defconfig:
> -	$(call merge_into_defconfig,corenet_basic_defconfig,\
> +	$(call merge_into_defconfig,corenet_base.config,\
>  		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw dpaa)
>  
>  PHONY += corenet64_smp_defconfig
>  corenet64_smp_defconfig:
> -	$(call merge_into_defconfig,corenet_basic_defconfig,\
> +	$(call merge_into_defconfig,corenet_base.config,\
>  		85xx-64bit 85xx-smp altivec 85xx-hw fsl-emb-nonhw dpaa)
>  
>  PHONY += mpc86xx_defconfig
>  mpc86xx_defconfig:
> -	$(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc86xx_base.config,\
>  		86xx-hw fsl-emb-nonhw)
>  
>  PHONY += mpc86xx_smp_defconfig
>  mpc86xx_smp_defconfig:
> -	$(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc86xx_base.config,\
>  		86xx-smp 86xx-hw fsl-emb-nonhw)
>  
>  PHONY += ppc32_allmodconfig
> diff --git a/arch/powerpc/configs/corenet_basic_defconfig b/arch/powerpc/configs/corenet_base.config
> similarity index 100%
> rename from arch/powerpc/configs/corenet_basic_defconfig
> rename to arch/powerpc/configs/corenet_base.config
> diff --git a/arch/powerpc/configs/mpc85xx_basic_defconfig b/arch/powerpc/configs/mpc85xx_base.config
> similarity index 100%
> rename from arch/powerpc/configs/mpc85xx_basic_defconfig
> rename to arch/powerpc/configs/mpc85xx_base.config
> diff --git a/arch/powerpc/configs/mpc86xx_basic_defconfig b/arch/powerpc/configs/mpc86xx_base.config
> similarity index 100%
> rename from arch/powerpc/configs/mpc86xx_basic_defconfig
> rename to arch/powerpc/configs/mpc86xx_base.config
> -- 
> 2.20.1
> 
---end quoted text---
