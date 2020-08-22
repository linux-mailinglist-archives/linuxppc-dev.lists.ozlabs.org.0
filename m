Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773924E6ED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 12:36:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYZZ43PYrzDr73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 20:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TBWg2mT0; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYZX749PYzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 20:35:01 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id m8so2328491pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bKtdWAOA51n8HerNi8xfdxv/vYPQCWjz2Xo5yWsLtbM=;
 b=TBWg2mT0jgyGMLrSAnZM3uCuBTcY390iIr3n1YEnL5tuJiGjFr+xsKicvhkiS189Z5
 nMxthe5Mg+KVSD/7JxODqEKDz1mQ8mIVaerxJCjpH1C3sD6DSEPfK5sJ0PGOB5O4dlkb
 1Q+OScyP+wNFlbgxGJrV9dWq1rqnFOF0glyjnI0grC/aVDImqfY7B/pNEqIDxH1drre0
 L/39tqCA6yqbEcVNjN6yr+LuP2ARaBZ/YYI46JvkUd7avDLH8hpwdn77rFjJNNIHrJo+
 KmUEgRgJldNI94Yrw99HxMAHUgMhepIdU+hpyuSv5fc07dRpKQA6LBxJz/USWGnKnN0b
 UHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bKtdWAOA51n8HerNi8xfdxv/vYPQCWjz2Xo5yWsLtbM=;
 b=m6FWDHmCG5sS7B+jMgebSjZiONnZcJLucjR3Pv3Gns/t4QTKYPqLJmFcuKSkY82nZE
 54bbe2IJESYHjIaLliw8YM9XLxo3O/8Ij85lVZ2j8X+S2YSQPROV1YfrRHpRcQk0DuGU
 A7V1CiGoJ5LjhWsxSvvY8cRhEAwPYa/yP7W3kT0ctTzWMMvqzGdD3pnqyUvYDiIvSM9Z
 pt7oUiRknfNoR7iwITfNofadcMsHEaV5ChDa7pLUzbK988huGa6Hc1LLyBUrkdUCAIQT
 /lqI1JcOV/xEgXMH8q+yecULJ6T7J9NTzBgV1reQNH9iEIj9h74XJTgPtLOJpzqdEDj6
 TY8A==
X-Gm-Message-State: AOAM533gITNaLtZYtmIBNYI3hW0H/Z1j8iTI6QCgW0Oi/nwBqVxA3lVn
 rxBwXvmFsYRG7drrZD2sVtYDJA==
X-Google-Smtp-Source: ABdhPJwPyetPehyZ8mvRKYXqj4kZxlVtAxMFYNNirhtPR1y+kynDmil9YK5Wn8qswHt+PGcY8gN8Tw==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr5695337pfb.161.1598092499890; 
 Sat, 22 Aug 2020 03:34:59 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id 2sm5528245pfv.27.2020.08.22.03.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 03:34:59 -0700 (PDT)
Subject: Re: [PATCH v1 04/10] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-5-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <e7d0e85c-c4c4-ad1d-899a-72d4fbd92852@ozlabs.ru>
Date: Sat, 22 Aug 2020 20:34:53 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817234033.442511-5-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/08/2020 09:40, Leonardo Bras wrote:
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
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/include/asm/iommu.h |  1 +
>  arch/powerpc/kernel/iommu.c      | 62 ++++++++++++++++++--------------
>  2 files changed, 37 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index 5032f1593299..2913e5c8b1f8 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -154,6 +154,7 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
>   */
>  extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
>  		int nid, unsigned long res_start, unsigned long res_end);
> +bool iommu_table_in_use(struct iommu_table *tbl);
>  
>  #define IOMMU_TABLE_GROUP_MAX_TABLES	2
>  
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 7f603d4e62d4..c5d5d36ab65e 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -668,21 +668,6 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
>  		set_bit(i - tbl->it_offset, tbl->it_map);
>  }
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
>  /*
>   * Build a iommu_table structure.  This contains a bit map which
>   * is used to manage allocation of the tce space.
> @@ -743,6 +728,38 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>  	return tbl;
>  }
>  
> +bool iommu_table_in_use(struct iommu_table *tbl)
> +{
> +	bool in_use;
> +	unsigned long p1_start = 0, p1_end, p2_start, p2_end;
> +
> +	/*ignore reserved bit0*/

s/ignore reserved bit0/ ignore reserved bit0 /  (add spaces)

> +	if (tbl->it_offset == 0)
> +		p1_start = 1;
> +
> +	/* Check if reserved memory is valid*/

A missing space here.

> +	if (tbl->it_reserved_start >= tbl->it_offset &&
> +	    tbl->it_reserved_start <= (tbl->it_offset + tbl->it_size) &&
> +	    tbl->it_reserved_end   >= tbl->it_offset &&
> +	    tbl->it_reserved_end   <= (tbl->it_offset + tbl->it_size)) {


Uff. What if tbl->it_reserved_end is bigger than tbl->it_offset +
tbl->it_size?

The reserved area is to preserve MMIO32 so it is for it_offset==0 only
and the boundaries are checked in the only callsite, and it is unlikely
to change soon or ever.

Rather that bothering with fixing that, may be just add (did not test):

if (WARN_ON((
(tbl->it_reserved_start || tbl->it_reserved_end) && (it_offset != 0))
||
(tbl->it_reserved_start > it_offset && tbl->it_reserved_end < it_offset
+ it_size) && (it_offset == 0)) )
 return true;

Or simply always look for it_offset..it_reserved_start and
it_reserved_end..it_offset+it_size and if there is no reserved area,
initialize it_reserved_start=it_reserved_end=it_offset so the first
it_offset..it_reserved_start becomes a no-op.


> +		p1_end = tbl->it_reserved_start - tbl->it_offset;
> +		p2_start = tbl->it_reserved_end - tbl->it_offset + 1;
> +		p2_end = tbl->it_size;
> +	} else {
> +		p1_end = tbl->it_size;
> +		p2_start = 0;
> +		p2_end = 0;
> +	}
> +
> +	in_use = (find_next_bit(tbl->it_map, p1_end, p1_start) != p1_end);
> +	if (in_use || p2_start == 0)
> +		return in_use;
> +
> +	in_use = (find_next_bit(tbl->it_map, p2_end, p2_start) != p2_end);
> +
> +	return in_use;
> +}
> +
>  static void iommu_table_free(struct kref *kref)
>  {
>  	unsigned long bitmap_sz;
> @@ -759,10 +776,8 @@ static void iommu_table_free(struct kref *kref)
>  		return;
>  	}
>  
> -	iommu_table_release_pages(tbl);
> -
>  	/* verify that table contains no entries */
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size))
> +	if (iommu_table_in_use(tbl))
>  		pr_warn("%s: Unexpected TCEs\n", __func__);
>  
>  	/* calculate bitmap size in bytes */
> @@ -1069,18 +1084,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
>  	for (i = 0; i < tbl->nr_pools; i++)
>  		spin_lock(&tbl->pools[i].lock);
>  
> -	iommu_table_release_pages(tbl);
> -
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
> +	if (iommu_table_in_use(tbl)) {
>  		pr_err("iommu_tce: it_map is not empty");
>  		ret = -EBUSY;
> -		/* Undo iommu_table_release_pages, i.e. restore bit#0, etc */
> -		iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
> -				tbl->it_reserved_end);
> -	} else {
> -		memset(tbl->it_map, 0xff, sz);
>  	}
>  
> +	memset(tbl->it_map, 0xff, sz);
> +
>  	for (i = 0; i < tbl->nr_pools; i++)
>  		spin_unlock(&tbl->pools[i].lock);
>  	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
> 

-- 
Alexey
