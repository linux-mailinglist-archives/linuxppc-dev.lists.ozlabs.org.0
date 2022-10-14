Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B375FE646
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:23:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRtg0XR6z3f3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:23:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lOjwKHTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lOjwKHTB;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRnZ1pCRz3drM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:18:42 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id cl1so3352596pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ht4DDfk0IlevsHoueEEzscu1HrfR9JzCfeWIl90Nsc=;
        b=lOjwKHTBEUu31/ubyikFBa93sskjUu68zqrBMv920Ul1kr2bUq3UwJmJauOunLXMQ/
         xNqya9ggQ414743TSvhzxc6wRkCyp2qr/wOTwCVVXWPwI4aOY2DDh8rpl2Wy5JFqUnB8
         3mlEpk2RrcHSClpdwsAn+IOhXlTQV5wIZFfl7HOhutwbLCrvJwz2iSDatcbjvpzqvDfk
         Mbg1zuY9jxBX4BDvJtqnZkTUb8gjIoCV7h+MQPL8ypoZ7fV0HrVOyg9yuaD2qM0l6/yn
         TER+q7vhytS8zwrJheoWq2qzSGyJWddhxhOtKqY881DmGsr96xM8jpJBVA/G1KQHCC95
         SFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ht4DDfk0IlevsHoueEEzscu1HrfR9JzCfeWIl90Nsc=;
        b=al0WdJs5bB4e6vuPEpc1jOXBm1UavpHFr0Mf18RI9UK2lTLW+Mhbc0pj2qAS/9Eobq
         eVxgn+O2Z31BVKi6tjYuUckiEYWBdzaKHEjCsXmHZkkBql8Nm3i3lQuIVXQ9BpZ6ElF2
         ZkzKz9zI+qTRsEdkgFYpzqyAMsNSxRXDC4htgY6rT9GOUcE7IqXhacA6zvEhjUwwTyGM
         SCW+qp8ns+PZ1SS48TTyZCzKgwBrKpd89aP9C6fvhunknKdWfwIVYvT5Tbcu7i0iyaWW
         5ppXhOpngIavUlhAATi74ppV4zuJNaCzJtyOVOzg6xoVorc5UwQhOxCe0VbtxrpVxx9G
         bfWQ==
X-Gm-Message-State: ACrzQf39rwSQ9Oh1n87O1zKiGvr3o1uYbjG5sqoueLgmvht2tyOKQn7w
	qliw5rxTZFr7zYM8uL0mKcU=
X-Google-Smtp-Source: AMsMyM5XMAT+0ThPLH+AynVDh7FWux96Aayw+U/jCDptAJJSthOju6CkhL2qqbkNmH4Fhb9u9q17ug==
X-Received: by 2002:a17:903:11c7:b0:178:afa2:43fd with SMTP id q7-20020a17090311c700b00178afa243fdmr2285174plh.126.1665706720097;
        Thu, 13 Oct 2022 17:18:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10-20020a170902f68a00b0017834a6966csm400431plg.176.2022.10.13.17.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:18:39 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:18:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/64s: make linear_map_hash_lock a raw spinlock
Message-ID: <20221014001838.GF412544@roeck-us.net>
References: <20221013230710.1987253-1-npiggin@gmail.com>
 <20221013230710.1987253-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013230710.1987253-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 09:07:10AM +1000, Nicholas Piggin wrote:
> This lock is taken while the raw kfence_freelist_lock is held, so it
> must also be a raw spinlock, as reported by lockdep when raw lock
> nesting checking is enabled.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index df008edf7be0..6df4c6d38b66 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1981,7 +1981,7 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
>  }
>  
>  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
> -static DEFINE_SPINLOCK(linear_map_hash_lock);
> +static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
>  
>  static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
>  {
> @@ -2005,10 +2005,10 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
>  				    mmu_linear_psize, mmu_kernel_ssize);
>  
>  	BUG_ON (ret < 0);
> -	spin_lock(&linear_map_hash_lock);
> +	raw_spin_lock(&linear_map_hash_lock);
>  	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
>  	linear_map_hash_slots[lmi] = ret | 0x80;
> -	spin_unlock(&linear_map_hash_lock);
> +	raw_spin_unlock(&linear_map_hash_lock);
>  }
>  
>  static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
> @@ -2018,14 +2018,14 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
>  	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
>  
>  	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
> -	spin_lock(&linear_map_hash_lock);
> +	raw_spin_lock(&linear_map_hash_lock);
>  	if (!(linear_map_hash_slots[lmi] & 0x80)) {
> -		spin_unlock(&linear_map_hash_lock);
> +		raw_spin_unlock(&linear_map_hash_lock);
>  		return;
>  	}
>  	hidx = linear_map_hash_slots[lmi] & 0x7f;
>  	linear_map_hash_slots[lmi] = 0;
> -	spin_unlock(&linear_map_hash_lock);
> +	raw_spin_unlock(&linear_map_hash_lock);
>  	if (hidx & _PTEIDX_SECONDARY)
>  		hash = ~hash;
>  	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
> -- 
> 2.37.2
> 
