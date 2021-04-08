Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A0357BE3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 07:38:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG96D1PJcz3bTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 15:38:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F3GBQPT4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F3GBQPT4; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG95p3gf1z303s
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 15:38:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FG95h3Bvjz9sWC;
 Thu,  8 Apr 2021 15:38:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617860283;
 bh=JiVj825bhXGerOdP3QAAJMvSLpKA8dLeyo8ezDkiuDg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F3GBQPT4mEx/8UkzNuegEdJ28NhDHhgsr9HJvlDE7uXSSaAw6IdFqMAYZXDWV7+Eo
 lxJ4CDT0qLPAjiMnAya9GMevNEnEFfqaAczcOBH3IRRegrMn8om4wumf8ie9Bw2ZJl
 BUw3Mql7pGCEcwwoWufvaQ6QoSIKUUw1U60PLqSmXrBn8HCgwfSlxgCFv/9tcn62po
 V3KvMBMHUe3Uio50BV5m5dJ1uos+qyNSt7kwUZruM3aRb0r+jUu+neItbrh7s2cRpX
 sBhrC2+id98VPf+zzKZXQ8kI3T0TprP5wN59SOMfZ+lEQdMWrpmsUuzMfhFpjltdow
 O+nx4sd3B6QBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leobras.c@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>,
 brking@linux.vnet.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
In-Reply-To: <20210407195613.131140-1-leobras.c@gmail.com>
References: <20210407195613.131140-1-leobras.c@gmail.com>
Date: Thu, 08 Apr 2021 15:37:59 +1000
Message-ID: <87im4xe3pk.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras <leobras.c@gmail.com> writes:
> According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
> will let the OS know all possible pagesizes that can be used for creating a
> new DDW.
>
> Currently Linux will only try using 3 of the 8 available options:
> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
> 128M, 256M and 16G.

Do we know of any hardware & hypervisor combination that will actually
give us bigger pages?

> Enabling bigger pages would be interesting for direct mapping systems
> with a lot of RAM, while using less TCE entries.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 49 ++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 9fc5217f0c8e..6cda1c92597d 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -53,6 +53,20 @@ enum {
>  	DDW_EXT_QUERY_OUT_SIZE = 2
>  };

A comment saying where the values come from would be good.

> +#define QUERY_DDW_PGSIZE_4K	0x01
> +#define QUERY_DDW_PGSIZE_64K	0x02
> +#define QUERY_DDW_PGSIZE_16M	0x04
> +#define QUERY_DDW_PGSIZE_32M	0x08
> +#define QUERY_DDW_PGSIZE_64M	0x10
> +#define QUERY_DDW_PGSIZE_128M	0x20
> +#define QUERY_DDW_PGSIZE_256M	0x40
> +#define QUERY_DDW_PGSIZE_16G	0x80

I'm not sure the #defines really gain us much vs just putting the
literal values in the array below?

> +struct iommu_ddw_pagesize {
> +	u32 mask;
> +	int shift;
> +};
> +
>  static struct iommu_table_group *iommu_pseries_alloc_group(int node)
>  {
>  	struct iommu_table_group *table_group;
> @@ -1099,6 +1113,31 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>  			 ret);
>  }
>  
> +/* Returns page shift based on "IO Page Sizes" output at ibm,query-pe-dma-window. See LoPAR */
> +static int iommu_get_page_shift(u32 query_page_size)
> +{
> +	const struct iommu_ddw_pagesize ddw_pagesize[] = {
> +		{ QUERY_DDW_PGSIZE_16G,  __builtin_ctz(SZ_16G)  },
> +		{ QUERY_DDW_PGSIZE_256M, __builtin_ctz(SZ_256M) },
> +		{ QUERY_DDW_PGSIZE_128M, __builtin_ctz(SZ_128M) },
> +		{ QUERY_DDW_PGSIZE_64M,  __builtin_ctz(SZ_64M)  },
> +		{ QUERY_DDW_PGSIZE_32M,  __builtin_ctz(SZ_32M)  },
> +		{ QUERY_DDW_PGSIZE_16M,  __builtin_ctz(SZ_16M)  },
> +		{ QUERY_DDW_PGSIZE_64K,  __builtin_ctz(SZ_64K)  },
> +		{ QUERY_DDW_PGSIZE_4K,   __builtin_ctz(SZ_4K)   }
> +	};


cheers
