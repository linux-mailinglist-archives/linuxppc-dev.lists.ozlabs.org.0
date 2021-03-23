Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF43458ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 08:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Nbs3hrhz30CN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 18:41:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=UE5+wbRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UE5+wbRm; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4NbQ1pBwz2xb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 18:41:19 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id h25so10830929pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 00:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gcmI11wouIpDwxdi+NStOdrVppM7cT0Mia1ThanzCd0=;
 b=UE5+wbRmZdYUdQ0G8bX362ijyRwJ9biLMH7je5sLG9tnGEthPDD8cms1zmPguoF2Vz
 PdJgmfHFxwX09TuzdZ6OiVb5rBOwbl6JvTiwYJ4ZpFQGLsCHU5fms4JjJqtMYnQ5J+h+
 0ryMxlh8oqxok6IQtckoXOeiOaGx77B4tbt11zmPUMa2vX+O9NFx7zXvpTw1HrFwBztz
 NPeXe/t0wUwM/uI0Mx8vQuL1oKQIQQhXDwlPgESgSrKwScDtQ3ErlHqczwAUiobBAjDv
 Y3WAeJwnHB3G8M+PonvwePYXgPUy82uDV+D3i6i9rRjiqTF9B7VfjIRofihNj13QksRB
 PVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gcmI11wouIpDwxdi+NStOdrVppM7cT0Mia1ThanzCd0=;
 b=Ea0sfRo3xle+DcrGCh7PuM2dCGSHQHvsBoThzx9QyVJFcEOdLldwXJ/4mn4vTP/z3b
 SDWu2xzWdJiTTjiliSVhyFmHf4iz4P85rh3Mdv+gcwm//MQ9O83bThREH6n9npEE+2Tb
 Nkt7G+Hx1YpRBJpakz9PooYm0lAr6rTVU1aeHeyokox9YFfoiVgAgXUE4smAnsf/kX4L
 xxJYXqzOLQtvB/CjVkBFITdk9/+vmkNsXfB5qecF9qiMcx0OGdxiyu+6ei38/21KTCFs
 hTrkDBZmvQRIlHN3Al9ItZ/fYsocdVGq4hiVs9w7mC0fRcbsapNjIz9VX1wePK11vNO0
 J7ow==
X-Gm-Message-State: AOAM531tOe/mSCFvstLCzNYJdXDgWkTr0bBUxziDJ74rZYHZmiF1rXBg
 k4+ca/0jLIWcqVhzmHxSSrsxsQ==
X-Google-Smtp-Source: ABdhPJwErHiyQzkdLbopxkOHcUNRxbNwmPsMCMOGUe+a7whz50kbLU6xArS7p5n4wvFkqiQmxoY6wg==
X-Received: by 2002:a62:7ed2:0:b029:21d:1806:fe30 with SMTP id
 z201-20020a627ed20000b029021d1806fe30mr731380pfc.5.1616485277056; 
 Tue, 23 Mar 2021 00:41:17 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id 4sm1593011pjl.51.2021.03.23.00.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 00:41:16 -0700 (PDT)
Message-ID: <2088f84c-08fb-fecc-f5d4-5735357dc296@ozlabs.ru>
Date: Tue, 23 Mar 2021 18:41:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Joel Stanley <joel@jms.id.au>,
 brking@linux.vnet.ibm.com
References: <20210322190943.715368-1-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210322190943.715368-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 23/03/2021 06:09, Leonardo Bras wrote:
> According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
> will let the OS know all possible pagesizes that can be used for creating a
> new DDW.
> 
> Currently Linux will only try using 3 of the 8 available options:
> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
> 128M, 256M and 16G.
> 
> Enabling bigger pages would be interesting for direct mapping systems
> with a lot of RAM, while using less TCE entries.
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/include/asm/iommu.h       |  8 ++++++++
>   arch/powerpc/platforms/pseries/iommu.c | 28 +++++++++++++++++++-------
>   2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index deef7c94d7b6..c170048b7a1b 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -19,6 +19,14 @@
>   #include <asm/pci-bridge.h>
>   #include <asm/asm-const.h>
>   
> +#define IOMMU_PAGE_SHIFT_16G	34
> +#define IOMMU_PAGE_SHIFT_256M	28
> +#define IOMMU_PAGE_SHIFT_128M	27
> +#define IOMMU_PAGE_SHIFT_64M	26
> +#define IOMMU_PAGE_SHIFT_32M	25
> +#define IOMMU_PAGE_SHIFT_16M	24
> +#define IOMMU_PAGE_SHIFT_64K	16


These are not very descriptive, these are just normal shifts, could be 
as simple as __builtin_ctz(SZ_4K) (gcc will optimize this) and so on.

OTOH the PAPR page sizes need macros as they are the ones which are 
weird and screaming for macros.

I'd steal/rework spapr_page_mask_to_query_mask() from QEMU. Thanks,




> +
>   #define IOMMU_PAGE_SHIFT_4K      12
>   #define IOMMU_PAGE_SIZE_4K       (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K)
>   #define IOMMU_PAGE_MASK_4K       (~((1 << IOMMU_PAGE_SHIFT_4K) - 1))
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 9fc5217f0c8e..02958e80aa91 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1099,6 +1099,24 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>   			 ret);
>   }
>   
> +/* Returns page shift based on "IO Page Sizes" output at ibm,query-pe-dma-window. SeeL LoPAR */
> +static int iommu_get_page_shift(u32 query_page_size)
> +{
> +	const int shift[] = {IOMMU_PAGE_SHIFT_4K,   IOMMU_PAGE_SHIFT_64K,  IOMMU_PAGE_SHIFT_16M,
> +			     IOMMU_PAGE_SHIFT_32M,  IOMMU_PAGE_SHIFT_64M,  IOMMU_PAGE_SHIFT_128M,
> +			     IOMMU_PAGE_SHIFT_256M, IOMMU_PAGE_SHIFT_16G};
> +	int i = ARRAY_SIZE(shift) - 1;
> +
> +	/* Looks for the largest page size supported */
> +	for (; i >= 0; i--) {
> +		if (query_page_size & (1 << i))
> +			return shift[i];
> +	}
> +
> +	/* No valid page size found. */
> +	return 0;
> +}
> +
>   /*
>    * If the PE supports dynamic dma windows, and there is space for a table
>    * that can map all pages in a linear offset, then setup such a table,
> @@ -1206,13 +1224,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   			goto out_failed;
>   		}
>   	}
> -	if (query.page_size & 4) {
> -		page_shift = 24; /* 16MB */
> -	} else if (query.page_size & 2) {
> -		page_shift = 16; /* 64kB */
> -	} else if (query.page_size & 1) {
> -		page_shift = 12; /* 4kB */
> -	} else {
> +
> +	page_shift = iommu_get_page_shift(query.page_size);
> +	if (!page_shift) {
>   		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
>   			  query.page_size);
>   		goto out_failed;
> 

-- 
Alexey
