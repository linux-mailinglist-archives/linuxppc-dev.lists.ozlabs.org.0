Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A15377D34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 09:34:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdt9c6XkPz2ykM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 17:34:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=lcVUnde9;
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
 header.s=20150623 header.b=lcVUnde9; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdt951GDjz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 17:34:15 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id 69so4085576plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7t7mKyriyEZX6HmajXTUz0XciwB1CpKo++Vww6ZeLk4=;
 b=lcVUnde9dwDYb5DVrpPQCHlVJRpEVuRQdM+GtQJmozWIA0BbXRqoX2sSS4xizAXO7J
 s+jgZSmHLoX7r9j50L8ULBvYCblKL/dWFVtgbA0JzCiKBo41P+M0RON9X6cbU+HRnkV9
 AqA5edKB9S7yN0wOGwKTMUvpZcZqyXvAMKGOAoShTxLz5HmtdWTFrVCL4HF8pAo6T+hK
 mhoXZlV3/t5P7TZ1UkJ3f6QBP8HdQ7JGGGyUfCnB/HJzh1QOrT/YzV+K6mufYBOM/M/e
 Lta6pLxcjwTCXJKyFTvO9EtULCQ60uAaJDMZV7ReWPZWGYmBeCM9s2o5MM5YtsA33DdP
 ecIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7t7mKyriyEZX6HmajXTUz0XciwB1CpKo++Vww6ZeLk4=;
 b=aeW8EDqYMZd6XPkETQGZXz/1/Uq2K/RlYyfTkJ8BgPBsZtmHUQ0zNuA0WSSrWs7f7p
 4eVUSjUMQcCLdimNF3UWhXMR75uIxvmcgcCvomiwZXfWK2f7Y7VxtgKCHqNyAwKBxZys
 XAxN4cP4viIQRxpzS7iu2PUorLqFimgWVysYuG+7DI2cVey04n/VAXZVbt/ocl73dWio
 M5GL8zJoMlT0HsSyIWPfJVJKvc4SC9RqDX1828wpBNtbtElcWQvF0O3v2miXWoUvgZ9B
 f97+DmzLXtPmSzvKqkz/oLDfJq7SXIIXpJNTLFHzP7lWouWwlg0GM/TkOR3+P1oCdD6s
 FmrQ==
X-Gm-Message-State: AOAM533Sg3bIB9xtbs8qIBDbP+PDfpTkjxfZ10VAtOZXMocWlcnTGH8v
 jgKo7j68C/fmDFjQM0lLbq0SlA==
X-Google-Smtp-Source: ABdhPJxzBS/xvhK6qt1VxLrH0Wtjt/2uS6AvqrWZTfgOJ8o8dAKn6xFflKMjndcaQkHnxmnawn54IA==
X-Received: by 2002:a17:902:b947:b029:ec:b04d:c8a2 with SMTP id
 h7-20020a170902b947b02900ecb04dc8a2mr23768452pls.2.1620632052453; 
 Mon, 10 May 2021 00:34:12 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id w127sm7116905pfw.4.2021.05.10.00.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 00:34:12 -0700 (PDT)
Message-ID: <c596779c-7664-f860-80c0-357e5e074801@ozlabs.ru>
Date: Mon, 10 May 2021 17:34:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v4 02/11] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-3-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210430163145.146984-3-leobras.c@gmail.com>
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



On 5/1/21 02:31, Leonardo Bras wrote:
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
>   arch/powerpc/kernel/iommu.c      | 65 ++++++++++++++++----------------
>   2 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index deef7c94d7b6..bf3b84128525 100644
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
> index ad82dda81640..5e168bd91401 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -691,32 +691,24 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
>   	if (tbl->it_offset == 0)
>   		set_bit(0, tbl->it_map);
>   
> -	tbl->it_reserved_start = res_start;
> -	tbl->it_reserved_end = res_end;
> -
> -	/* Check if res_start..res_end isn't empty and overlaps the table */
> -	if (res_start && res_end &&
> -			(tbl->it_offset + tbl->it_size < res_start ||
> -			 res_end < tbl->it_offset))
> -		return;
> +	if (res_start < tbl->it_offset)
> +		res_start = tbl->it_offset;
>   
> -	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> -		set_bit(i - tbl->it_offset, tbl->it_map);
> -}
> +	if (res_end > (tbl->it_offset + tbl->it_size))
> +		res_end = tbl->it_offset + tbl->it_size;
>   
> -static void iommu_table_release_pages(struct iommu_table *tbl)
> -{
> -	int i;
> +	/* Check if res_start..res_end is a valid range in the table */
> +	if (res_start >= res_end) {
> +		tbl->it_reserved_start = tbl->it_offset;
> +		tbl->it_reserved_end = tbl->it_offset;
> +		return;
> +	}
>   
> -	/*
> -	 * In case we have reserved the first bit, we should not emit
> -	 * the warning below.
> -	 */
> -	if (tbl->it_offset == 0)
> -		clear_bit(0, tbl->it_map);
> +	tbl->it_reserved_start = res_start;
> +	tbl->it_reserved_end = res_end;
>   
>   	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> -		clear_bit(i - tbl->it_offset, tbl->it_map);
> +		set_bit(i - tbl->it_offset, tbl->it_map);


git produced a messy chunk here. The new logic is:


static void iommu_table_reserve_pages(struct iommu_table *tbl,
		unsigned long res_start, unsigned long res_end)
{
	int i;

	WARN_ON_ONCE(res_end < res_start);
	/*
	 * Reserve page 0 so it will not be used for any mappings.
	 * This avoids buggy drivers that consider page 0 to be invalid
	 * to crash the machine or even lose data.
	 */
	if (tbl->it_offset == 0)
		set_bit(0, tbl->it_map);

	if (res_start < tbl->it_offset)
		res_start = tbl->it_offset;

	if (res_end > (tbl->it_offset + tbl->it_size))
		res_end = tbl->it_offset + tbl->it_size;

	/* Check if res_start..res_end is a valid range in the table */
	if (res_start >= res_end) {
		tbl->it_reserved_start = tbl->it_offset;
		tbl->it_reserved_end = tbl->it_offset;
		return;
	}


It is just hard to read. A code reviewer would assume res_end >= 
res_start (as there is WARN_ON) but later we allow res_end to be lesser 
than res_start.

but may be it is just me :)
Otherwise looks good.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


>   }
>   
>   /*
> @@ -781,6 +773,22 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
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
> +}
> +
>   static void iommu_table_free(struct kref *kref)
>   {
>   	unsigned long bitmap_sz;
> @@ -799,10 +807,8 @@ static void iommu_table_free(struct kref *kref)
>   
>   	iommu_debugfs_del(tbl);
>   
> -	iommu_table_release_pages(tbl);
> -
>   	/* verify that table contains no entries */
> -	if (!bitmap_empty(tbl->it_map, tbl->it_size))
> +	if (iommu_table_in_use(tbl))
>   		pr_warn("%s: Unexpected TCEs\n", __func__);
>   
>   	/* calculate bitmap size in bytes */
> @@ -1108,18 +1114,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
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
Alexey
