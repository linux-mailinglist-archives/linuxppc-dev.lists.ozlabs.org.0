Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C466527BBCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:08:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0m8m6pKjzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:08:40 +1000 (AEST)
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
 header.s=20150623 header.b=oxW6Wcoo; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lvf4PGRzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:57:18 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o25so2787840pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y/oZRFlkRHBU+pNV5TjEXdg5WQmsIjV/R/ZG/OBZ9l0=;
 b=oxW6WcooJDDGCiu7bsvWdO4IRgTOGAe2nJShHCAS6RsPL/3wKU5gdWdU25GlSqh+h4
 2IBsXXo/2ge4g0JkUQltmuMMyr1KDO0/7yczUFIDGWgWKiEagVklXUjU4AvDnYdSO6DF
 eHyvoHdDy51xscD90rI91O2axzrTQosN0UdPmtqe60YxX9Y9y7YYK9fI0hM7T7RzJHUS
 QOt74NEV1tChGuxl1F3eqoJQ9S+xoj/jwqW5MPH7H8wWncQMtVsXiOsuZqeqEwNBqZXd
 pPMK89tZ10JfzTIgNBEP3VCs5uHGBdhPe4Qwhi4Lc7wSP4s1w3f7+Eimb6nwXCFfN0CN
 nrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/oZRFlkRHBU+pNV5TjEXdg5WQmsIjV/R/ZG/OBZ9l0=;
 b=gdcd1Gg0OfF4h6nepoBv+W4fwX4Od2qYbMAuAaiq5Ppef7nHL9/+8Uc99wSbLQW5R3
 PcnCyyWEVmLGclpdhZXDodYp9WU41kkYunVag4Ond/qkRF0N1G24y0oAUEEbBvK2ECv2
 PYGSqL3hx455bl8M3et7muSxcLwTk8Jhwf/xd4b+oPsxpWkmnzAkrmFJmkeU7LQEoPRZ
 Y7qldKE7WuD7T+HKwH95EgIxpn9n4CejwTzKjEQVRo4iRrfuylVVZOPJesALnkXIa4pk
 a2qTteI+4hW3KYGmv9HaTRaowNc5rhnHBOL5s8OmtiCnBpawxKr6ylfA7hmSH6ZKrjzH
 mOXA==
X-Gm-Message-State: AOAM5326oslMs94b8jrB+yKHX8C5IXVtFNvClNGJoGtbxU/ajzI5HY+b
 iNZWFtzDg7B0xCXoMeCUGaH0zpZwQJfcme/7
X-Google-Smtp-Source: ABdhPJzeEWTyzmjbOPkrnUkoO3cUxChhcG0tbyrIpmQcQpPv1hiLPbGPrFSawldveiozOJertRWvFA==
X-Received: by 2002:aa7:8397:0:b029:13e:d13d:a07c with SMTP id
 u23-20020aa783970000b029013ed13da07cmr2248835pfm.19.1601351836427; 
 Mon, 28 Sep 2020 20:57:16 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id e1sm3517693pfl.162.2020.09.28.20.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:57:15 -0700 (PDT)
Subject: Re: [PATCH v2 05/14] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-6-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <7af21a72-507b-42ce-77ad-d7fc377590d1@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:57:10 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-6-leobras.c@gmail.com>
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
> 
> Having a function to check if the iommu table has any allocation helps
> deciding if a tbl can be reset for using a new DMA window.
> 
> It should be enough to replace all instances of !bitmap_empty(tbl...).
> 
> iommu_table_in_use() skips reserved memory, so we don't need to worry about
> releasing it before testing. This causes iommu_table_release_pages() to
> become unnecessary, given it is only used to remove reserved memory for
> testing.
> 
> Also, only allow storing reserved memory values in tbl if they are valid
> in the table, so there is no need to check it in the new helper.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/include/asm/iommu.h |  1 +
>   arch/powerpc/kernel/iommu.c      | 61 +++++++++++++++-----------------
>   2 files changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index 5032f1593299..2913e5c8b1f8 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -154,6 +154,7 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
>    */
>   extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
>   		int nid, unsigned long res_start, unsigned long res_end);
> +bool iommu_table_in_use(struct iommu_table *tbl);
>   
>   #define IOMMU_TABLE_GROUP_MAX_TABLES	2
>   
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ffb2637dc82b..c838da3d8f32 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -655,34 +655,21 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
>   	if (tbl->it_offset == 0)
>   		set_bit(0, tbl->it_map);
>   
> +	/* Check if res_start..res_end is a valid range in the table */
> +	if (res_start >= res_end || res_start < tbl->it_offset ||
> +	    res_end > (tbl->it_offset + tbl->it_size)) {
> +		tbl->it_reserved_start = tbl->it_offset;
> +		tbl->it_reserved_end = tbl->it_offset;


This silently ignores overlapped range of the reserved area and the 
window which does not seem right.



> +		return;
> +	}
> +
>   	tbl->it_reserved_start = res_start;
>   	tbl->it_reserved_end = res_end;
>   
> -	/* Check if res_start..res_end isn't empty and overlaps the table */
> -	if (res_start && res_end &&
> -			(tbl->it_offset + tbl->it_size < res_start ||
> -			 res_end < tbl->it_offset))
> -		return;
> -
>   	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
>   		set_bit(i - tbl->it_offset, tbl->it_map);
>   }
>   
> -static void iommu_table_release_pages(struct iommu_table *tbl)
> -{
> -	int i;
> -
> -	/*
> -	 * In case we have reserved the first bit, we should not emit
> -	 * the warning below.
> -	 */
> -	if (tbl->it_offset == 0)
> -		clear_bit(0, tbl->it_map);
> -
> -	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> -		clear_bit(i - tbl->it_offset, tbl->it_map);
> -}
> -
>   /*
>    * Build a iommu_table structure.  This contains a bit map which
>    * is used to manage allocation of the tce space.
> @@ -743,6 +730,23 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>   	return tbl;
>   }
>   
> +bool iommu_table_in_use(struct iommu_table *tbl)
> +{
> +	unsigned long start = 0, end;
> +
> +	/* ignore reserved bit0 */
> +	if (tbl->it_offset == 0)
> +		start = 1;
> +	end = tbl->it_reserved_start - tbl->it_offset;
> +	if (find_next_bit(tbl->it_map, end, start) != end)
> +		return true;
> +
> +	start = tbl->it_reserved_end - tbl->it_offset;
> +	end = tbl->it_size;
> +	return find_next_bit(tbl->it_map, end, start) != end;
> +

Unnecessary empty line.

> +}
> +
>   static void iommu_table_free(struct kref *kref)
>   {
>   	unsigned long bitmap_sz;
> @@ -759,10 +763,8 @@ static void iommu_table_free(struct kref *kref)
>   		return;
>   	}
>   
> -	iommu_table_release_pages(tbl);
> -
>   	/* verify that table contains no entries */
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size))
> +	if (iommu_table_in_use(tbl))
>   		pr_warn("%s: Unexpected TCEs\n", __func__);
>   
>   	/* calculate bitmap size in bytes */
> @@ -1068,18 +1070,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
>   	for (i = 0; i < tbl->nr_pools; i++)
>   		spin_lock(&tbl->pools[i].lock);
>   
> -	iommu_table_release_pages(tbl);
> -
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
> +	if (iommu_table_in_use(tbl)) {
>   		pr_err("iommu_tce: it_map is not empty");
>   		ret = -EBUSY;
> -		/* Undo iommu_table_release_pages, i.e. restore bit#0, etc */
> -		iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
> -				tbl->it_reserved_end);
> -	} else {
> -		memset(tbl->it_map, 0xff, sz);
>   	}
>   
> +	memset(tbl->it_map, 0xff, sz);
> +
>   	for (i = 0; i < tbl->nr_pools; i++)
>   		spin_unlock(&tbl->pools[i].lock);
>   	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
> 

-- 
--
Alexey
