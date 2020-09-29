Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62927BBC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:07:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0m736LkGzDqKl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cvFYyYbK; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lvS1R4WzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:57:08 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id y14so2739937pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gcXZZJ1Z/ILhfOOiK82S1SqDNgGV3AdaPXXa34fw92w=;
 b=cvFYyYbKLpTQsr26uWdI41weUD9rFvHnELu+MzcUlACgloKQJWh0nbVcvV60ZT0mm/
 22oiXVPAzjtVNDfXLlemrsMg0RT+w3SOPF32OWtCjhJZ4Xl8HIJYoo2wP7Rtljc+BC+r
 8PrN97zSUufgo5aV8x7CXJidIhgJPwH75tE3J4QoyvFujjw/fSOU0gW/rgf4RTGFx4Nz
 nS9PKUxM8cx+BA5O1MkC4OZ8wKzj4CpHuUKN+avQUHh3YC/VNK6CqYxEuOp7Mmqs7EKS
 2x3tyK/NDb29afRtbJ/CGi2BwzTQeGHkq7binyVls+qR+ZNxoez1GN6A4UJWnbiQFVDz
 cJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gcXZZJ1Z/ILhfOOiK82S1SqDNgGV3AdaPXXa34fw92w=;
 b=Jwsqp63ZCGZ737x7dVcM/Uj1lGYl0xUUFJQTJrJFhd/RAporzzZTBPROGxcIhdUH6l
 ShKp29CLIwjzm+f5O6LBiIQfro/cZ1vKpqu4YvMzMOlF7eFdFURMS9LgGSN5kVoNMsWW
 OdU8Efp0gstDdqpkhFOBfvJwp1NrluGGmc7v0lt3DIuU1J3162ZcQIuIm7hvAgfFhpN7
 lfxe4jC2TF1FiJRq6xxvC3bMVqAV0NQDtVbBpBlxf7c4AlFXuKDHG1JH1Mc1KtZxw4nt
 3Uzlx9P6FyvQV+g+JlqQDnRDjdzU5YoMO04EzfB6KKpSeiZAkPY5KwLUqRpEL66BGh4O
 Qdaw==
X-Gm-Message-State: AOAM5328ocYvGVouI35VVOvAH1SCbMMCQYQSy+4MYrtmIUm2KfNNeTI0
 LDbTXc4tH/WWAbsdozEK/AqMQH0fd+i11itx
X-Google-Smtp-Source: ABdhPJwEkNKNXyzQBigu92i7rq/PMPpFBMMUTwo51Sk62WUXjbOesaKQU8gevftyt9lc8ZebTzMiVw==
X-Received: by 2002:a62:ee10:0:b029:142:2501:34e2 with SMTP id
 e16-20020a62ee100000b0290142250134e2mr2165578pfi.59.1601351825809; 
 Mon, 28 Sep 2020 20:57:05 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id m13sm2968285pjl.45.2020.09.28.20.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:57:05 -0700 (PDT)
Subject: Re: [PATCH v2 01/14] powerpc/pseries/iommu: Replace hard-coded page
 shift
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-2-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <5c23f1f9-4cb5-be24-3064-258c0f68c77c@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:56:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-2-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/09/2020 03:07, Leonardo Bras wrote:
> Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,

These normally go right before "signed-off-by".


> 
> Some functions assume IOMMU page size can only be 4K (pageshift == 12).
> Update them to accept any page size passed, so we can use 64K pages.
> 
> In the process, some defines like TCE_SHIFT were made obsolete, and then
> removed.
> 
> IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figures 3.4 and 3.5 show
> a RPN of 52-bit, and considers a 12-bit pageshift, so there should be
> no need of using TCE_RPN_MASK, which masks out any bit after 40 in rpn.
> It's usage removed from tce_build_pSeries(), tce_build_pSeriesLP(), and
> tce_buildmulti_pSeriesLP().
> 
> Most places had a tbl struct, so using tbl->it_page_shift was simple.
> tce_free_pSeriesLP() was a special case, since callers not always have a
> tbl struct, so adding a tceshift parameter seems the right thing to do.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/include/asm/tce.h         |  8 ------
>   arch/powerpc/platforms/pseries/iommu.c | 39 +++++++++++++++-----------
>   2 files changed, 23 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/tce.h b/arch/powerpc/include/asm/tce.h
> index db5fc2f2262d..0c34d2756d92 100644
> --- a/arch/powerpc/include/asm/tce.h
> +++ b/arch/powerpc/include/asm/tce.h
> @@ -19,15 +19,7 @@
>   #define TCE_VB			0
>   #define TCE_PCI			1
>   
> -/* TCE page size is 4096 bytes (1 << 12) */
> -
> -#define TCE_SHIFT	12
> -#define TCE_PAGE_SIZE	(1 << TCE_SHIFT)
> -
>   #define TCE_ENTRY_SIZE		8		/* each TCE is 64 bits */
> -
> -#define TCE_RPN_MASK		0xfffffffffful  /* 40-bit RPN (4K pages) */
> -#define TCE_RPN_SHIFT		12
>   #define TCE_VALID		0x800		/* TCE valid */
>   #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
>   #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index e4198700ed1a..9db3927607a4 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -107,6 +107,8 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
>   	u64 proto_tce;
>   	__be64 *tcep;
>   	u64 rpn;
> +	const unsigned long tceshift = tbl->it_page_shift;
> +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
>   
>   	proto_tce = TCE_PCI_READ; // Read allowed
>   
> @@ -117,10 +119,10 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
>   
>   	while (npages--) {
>   		/* can't move this out since we might cross MEMBLOCK boundary */
> -		rpn = __pa(uaddr) >> TCE_SHIFT;
> -		*tcep = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
> +		rpn = __pa(uaddr) >> tceshift;
> +		*tcep = cpu_to_be64(proto_tce | rpn << tceshift);
>   
> -		uaddr += TCE_PAGE_SIZE;
> +		uaddr += pagesize;
>   		tcep++;
>   	}
>   	return 0;
> @@ -146,7 +148,7 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
>   	return be64_to_cpu(*tcep);
>   }
>   
> -static void tce_free_pSeriesLP(unsigned long liobn, long, long);
> +static void tce_free_pSeriesLP(unsigned long liobn, long, long, long);
>   static void tce_freemulti_pSeriesLP(struct iommu_table*, long, long);
>   
>   static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
> @@ -166,12 +168,12 @@ static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
>   		proto_tce |= TCE_PCI_WRITE;
>   
>   	while (npages--) {
> -		tce = proto_tce | (rpn & TCE_RPN_MASK) << tceshift;
> +		tce = proto_tce | rpn << tceshift;
>   		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, tce);
>   
>   		if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
>   			ret = (int)rc;
> -			tce_free_pSeriesLP(liobn, tcenum_start,
> +			tce_free_pSeriesLP(liobn, tcenum_start, tceshift,
>   			                   (npages_start - (npages + 1)));
>   			break;
>   		}
> @@ -205,10 +207,11 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   	long tcenum_start = tcenum, npages_start = npages;
>   	int ret = 0;
>   	unsigned long flags;
> +	const unsigned long tceshift = tbl->it_page_shift;
>   
>   	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_PUT_TCE_IND)) {
>   		return tce_build_pSeriesLP(tbl->it_index, tcenum,
> -					   tbl->it_page_shift, npages, uaddr,
> +					   tceshift, npages, uaddr,
>   		                           direction, attrs);
>   	}
>   
> @@ -225,13 +228,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   		if (!tcep) {
>   			local_irq_restore(flags);
>   			return tce_build_pSeriesLP(tbl->it_index, tcenum,
> -					tbl->it_page_shift,
> +					tceshift,
>   					npages, uaddr, direction, attrs);
>   		}
>   		__this_cpu_write(tce_page, tcep);
>   	}
>   
> -	rpn = __pa(uaddr) >> TCE_SHIFT;
> +	rpn = __pa(uaddr) >> tceshift;
>   	proto_tce = TCE_PCI_READ;
>   	if (direction != DMA_TO_DEVICE)
>   		proto_tce |= TCE_PCI_WRITE;
> @@ -245,12 +248,12 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   		limit = min_t(long, npages, 4096/TCE_ENTRY_SIZE);
>   
>   		for (l = 0; l < limit; l++) {
> -			tcep[l] = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
> +			tcep[l] = cpu_to_be64(proto_tce | rpn << tceshift);
>   			rpn++;
>   		}
>   
>   		rc = plpar_tce_put_indirect((u64)tbl->it_index,
> -					    (u64)tcenum << 12,
> +					    (u64)tcenum << tceshift,
>   					    (u64)__pa(tcep),
>   					    limit);
>   
> @@ -277,12 +280,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   	return ret;
>   }
>   
> -static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long npages)
> +static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
> +			       long npages)
>   {
>   	u64 rc;
>   
>   	while (npages--) {
> -		rc = plpar_tce_put((u64)liobn, (u64)tcenum << 12, 0);
> +		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, 0);
>   
>   		if (rc && printk_ratelimit()) {
>   			printk("tce_free_pSeriesLP: plpar_tce_put failed. rc=%lld\n", rc);
> @@ -301,9 +305,11 @@ static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long n
>   	u64 rc;
>   
>   	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
> -		return tce_free_pSeriesLP(tbl->it_index, tcenum, npages);
> +		return tce_free_pSeriesLP(tbl->it_index, tcenum,
> +					  tbl->it_page_shift, npages);
>   
> -	rc = plpar_tce_stuff((u64)tbl->it_index, (u64)tcenum << 12, 0, npages);
> +	rc = plpar_tce_stuff((u64)tbl->it_index,
> +			     (u64)tcenum << tbl->it_page_shift, 0, npages);
>   
>   	if (rc && printk_ratelimit()) {
>   		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
> @@ -319,7 +325,8 @@ static unsigned long tce_get_pSeriesLP(struct iommu_table *tbl, long tcenum)
>   	u64 rc;
>   	unsigned long tce_ret;
>   
> -	rc = plpar_tce_get((u64)tbl->it_index, (u64)tcenum << 12, &tce_ret);
> +	rc = plpar_tce_get((u64)tbl->it_index,
> +			   (u64)tcenum << tbl->it_page_shift, &tce_ret);
>   
>   	if (rc && printk_ratelimit()) {
>   		printk("tce_get_pSeriesLP: plpar_tce_get failed. rc=%lld\n", rc);
> 

-- 
--
Alexey
