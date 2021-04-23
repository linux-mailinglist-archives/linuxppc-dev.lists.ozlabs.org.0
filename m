Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB947368DE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 09:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRQqS73rYz30D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 17:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=ydCpWvop;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ydCpWvop; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRQq040pmz2xZy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 17:27:21 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id p16so20850659plf.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bf8XMS3q7qHp98r6O1wqMq+9yKwqUsu4CYn3uOvQmYc=;
 b=ydCpWvopw9Lk7qZ2HRluIsTaAGrAe8HR4OMWDL1CKuxdI9y4l9tejX/UKpXlodSBog
 WxckIsMNYplypAGADIqxuLtT9JoO0qlvaLJruE0GDlPAvcjCAlSSYIl5IbX9gerPcC8Z
 YTiyKViV+F8yugnAphFFyb5x5l0FIRpQTW3FyfxhuGPiZz+iROdHTHcthg7gVI05TDvT
 eke5lHnvPwvoGRK6lIMhdnDHwe4r6nrUAqke1tiF6USnlhtOu3QnytMPuWsMhGG/R2HC
 pKr8yf+gIwwqBg+/k0ZBekkjlqIzp34nMgn8FF/gZnBojBZCmpqYpYDbdydl3cGrJr92
 KRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bf8XMS3q7qHp98r6O1wqMq+9yKwqUsu4CYn3uOvQmYc=;
 b=gjdpGbvCGlEyOGB6MzZWR9Hi7LxvzFV/Ius0tgMiY7tarhjzcrOK1HxVTzCWMdNH8i
 k9/5rmBAkF5ceFuqFZA7uQu6Ov6By2DikrM6yjj9i8KpxWJq8Quny/Bh3CYumFl/gwXq
 4/C5jdSbvJLAjMKqziiJFqtkmwnEo5jJ/hCnrorZMb3gSOTlPXPpGWU7RRwTTJvbChjj
 WyYVrmKHU745yyRA8cP6iEKG6vosC1B17yuRcQ4Sq7YF/8V3U7MWLXNbP8//8XrxX+ua
 BwfRth/YjX0luGv6RsQQzdCp00VesIeyBaj0rmEF5vjlDqgvQOEnAZm7uXIvZiRb8vfu
 lCzg==
X-Gm-Message-State: AOAM5324gQbSr5vA+GeoGAXLFOnt0jMqR57yXNst1+ZjC94r/cuoHFdy
 yWjiSMJziMbYZfhfbPOlDdIWOQ==
X-Google-Smtp-Source: ABdhPJyOUYCnGYT9dzhCEEikOKwsNfRLyB2bXudUyTdEw0+CdqKyaHjnhi+DUHaW8++t+uOrDA+aUg==
X-Received: by 2002:a17:90b:2314:: with SMTP id
 mt20mr4269535pjb.99.1619162836833; 
 Fri, 23 Apr 2021 00:27:16 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id h6sm3965789pfb.157.2021.04.23.00.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 00:27:16 -0700 (PDT)
Message-ID: <7d0fec07-a663-f683-8d09-39e952cba418@ozlabs.ru>
Date: Fri, 23 Apr 2021 17:27:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v3 01/11] powerpc/pseries/iommu: Replace hard-coded page
 shift
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20210422070721.463912-1-leobras.c@gmail.com>
 <20210422070721.463912-2-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210422070721.463912-2-leobras.c@gmail.com>
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



On 22/04/2021 17:07, Leonardo Bras wrote:
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


After rereading the patch, I wonder why we had this TCE_RPN_MASK at all 
but what is certain is that this has nothing to do with IODA3 as these 
TCEs are guest phys addresses in pseries and IODA3 is bare metal. Except...


> Most places had a tbl struct, so using tbl->it_page_shift was simple.
> tce_free_pSeriesLP() was a special case, since callers not always have a
> tbl struct, so adding a tceshift parameter seems the right thing to do.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
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
> index 67c9953a6503..796ab356341c 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -107,6 +107,8 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
>   	u64 proto_tce;
>   	__be64 *tcep;
>   	u64 rpn;
> +	const unsigned long tceshift = tbl->it_page_shift;
> +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);

(nit: only used once)

>   
>   	proto_tce = TCE_PCI_READ; // Read allowed
>   
> @@ -117,10 +119,10 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,


... this pseries which is not pseriesLP, i.e. no LPAR == bare metal 
pseries such as ancient power5 or cellbe (I guess) and for those 
TCE_RPN_MASK may actually make sense, keep it.

The rest of the patch looks good. Thanks,


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
Alexey
