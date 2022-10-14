Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C45FE640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:21:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRrd1RyPz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LggQsV1P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LggQsV1P;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRnF4GKBz3dqp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:18:25 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id 10so3331796pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYy1BZt4adQHzOuBkWCwq4hy/uUlT7nWZZhD3FkRE6M=;
        b=LggQsV1PboO2Fc1TqhmJ9XJ1bwtHNPxn+BsJ2DCZoDQ/gO3nN/wK6M28nI6ckL19la
         13wzFIm9V6OvEwlGkJD9v43ZMZusGtYmtXwKpOBx/S8k6lk2z3Z5Exehpj51/+MQss8o
         a937L8FRO3WkyQ2dn7SY8kmYiuvqnVGfbv8MFpiZLvNOuT8fJfFBp9jmdAYRYnpIUEpe
         INzjb363Z2+ZhWeOHv9boPQZlkEk1y3aajEuuSKrFikrhnfBOeARLfVQ3qgYfCTixc70
         K2J5hSVmSkp53Z4eoUUjOowU4fp5Z4RfBU9x7Us5yKlDp9qVW6EsjW1KMYr787fHODEW
         J4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYy1BZt4adQHzOuBkWCwq4hy/uUlT7nWZZhD3FkRE6M=;
        b=2vmA31F1gyY8W4zBvY4WduAJ7ATagBKhIwW7Mt34ZupvAwJ9FH4EHcg366N+1j26rK
         0ZkUhLzKB0+wduuYaJ0CrZHuozxbgJn40xDH/1KdaY7V/RBdTTE72zlquA+g+Okyyi31
         oe2rdiN9T0I+7Ikk5RQHEOtJEfSRc2si7V5nt4EmzRTEvSlIypI24rXp08Nf3DZ3Y6s/
         YzW6Zb+COEU3SHpAMgCv3Gp83qT7k/s3b16djmxWyG8N/9OBUcah4tE0Yq+E5afxcZDx
         QWnk75FIyJEesUKBdHAQYr2MUYA3mlPyCjnKLAuu/JWKT0Ub1GwEPYS1JMz9cqsQqiS9
         vG9Q==
X-Gm-Message-State: ACrzQf37rYfEuyljhOnXgC8wEhFjNu9gJgfpIJqeS9neiGx0HLrT54sn
	OidkhFRHwJlc9LPCOcmnIKE=
X-Google-Smtp-Source: AMsMyM7JbzfzEej9gwcwqp8iSR3qIn6uNX7oy/5tC5YK1vZ6XH0ETy2xqf2BpaFjScrIRfwuwayAqA==
X-Received: by 2002:a17:903:189:b0:183:7473:57f1 with SMTP id z9-20020a170903018900b00183747357f1mr2203281plg.28.1665706698494;
        Thu, 13 Oct 2022 17:18:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b20-20020a621b14000000b00560f442e4f3sm286768pfb.62.2022.10.13.17.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:18:18 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:18:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64s: Add lockdep for HPTE lock
Message-ID: <20221014001817.GD412544@roeck-us.net>
References: <20221013230710.1987253-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013230710.1987253-1-npiggin@gmail.com>
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

On Fri, Oct 14, 2022 at 09:07:08AM +1000, Nicholas Piggin wrote:
> Add lockdep annotation for the HPTE bit-spinlock. Modern systems don't
> take the tlbie lock, so this shows up some of the same lockdep warnings
> that were being reported by the ppc970. And they're not taken in exactly
> the same places so this is nice to have in its own right.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/mm/book3s64/hash_native.c | 42 +++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
> index 623a7b7ab38b..02d0c210a1ce 100644
> --- a/arch/powerpc/mm/book3s64/hash_native.c
> +++ b/arch/powerpc/mm/book3s64/hash_native.c
> @@ -43,6 +43,29 @@
>  
>  static DEFINE_RAW_SPINLOCK(native_tlbie_lock);
>  
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map hpte_lock_map =
> +        STATIC_LOCKDEP_MAP_INIT("hpte_lock", &hpte_lock_map);
> +
> +static void acquire_hpte_lock(void)
> +{
> +	lock_map_acquire(&hpte_lock_map);
> +}
> +
> +static void release_hpte_lock(void)
> +{
> +	lock_map_release(&hpte_lock_map);
> +}
> +#else
> +static void acquire_hpte_lock(void)
> +{
> +}
> +
> +static void release_hpte_lock(void)
> +{
> +}
> +#endif
> +
>  static inline unsigned long  ___tlbie(unsigned long vpn, int psize,
>  						int apsize, int ssize)
>  {
> @@ -220,6 +243,7 @@ static inline void native_lock_hpte(struct hash_pte *hptep)
>  {
>  	unsigned long *word = (unsigned long *)&hptep->v;
>  
> +	acquire_hpte_lock();
>  	while (1) {
>  		if (!test_and_set_bit_lock(HPTE_LOCK_BIT, word))
>  			break;
> @@ -234,6 +258,7 @@ static inline void native_unlock_hpte(struct hash_pte *hptep)
>  {
>  	unsigned long *word = (unsigned long *)&hptep->v;
>  
> +	release_hpte_lock();
>  	clear_bit_unlock(HPTE_LOCK_BIT, word);
>  }
>  
> @@ -279,6 +304,7 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
>  		hpte_v = hpte_old_to_new_v(hpte_v);
>  	}
>  
> +	release_hpte_lock();
>  	hptep->r = cpu_to_be64(hpte_r);
>  	/* Guarantee the second dword is visible before the valid bit */
>  	eieio();
> @@ -327,6 +353,7 @@ static long native_hpte_remove(unsigned long hpte_group)
>  		return -1;
>  
>  	/* Invalidate the hpte. NOTE: this also unlocks it */
> +	release_hpte_lock();
>  	hptep->v = 0;
>  
>  	return i;
> @@ -517,10 +544,11 @@ static void native_hpte_invalidate(unsigned long slot, unsigned long vpn,
>  		/* recheck with locks held */
>  		hpte_v = hpte_get_old_v(hptep);
>  
> -		if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID))
> +		if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID)) {
>  			/* Invalidate the hpte. NOTE: this also unlocks it */
> +			release_hpte_lock();
>  			hptep->v = 0;
> -		else
> +		} else
>  			native_unlock_hpte(hptep);
>  	}
>  	/*
> @@ -580,10 +608,8 @@ static void native_hugepage_invalidate(unsigned long vsid,
>  			hpte_v = hpte_get_old_v(hptep);
>  
>  			if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID)) {
> -				/*
> -				 * Invalidate the hpte. NOTE: this also unlocks it
> -				 */
> -
> +				/* Invalidate the hpte. NOTE: this also unlocks it */
> +				release_hpte_lock();
>  				hptep->v = 0;
>  			} else
>  				native_unlock_hpte(hptep);
> @@ -765,8 +791,10 @@ static void native_flush_hash_range(unsigned long number, int local)
>  
>  			if (!HPTE_V_COMPARE(hpte_v, want_v) || !(hpte_v & HPTE_V_VALID))
>  				native_unlock_hpte(hptep);
> -			else
> +			else {
> +				release_hpte_lock();
>  				hptep->v = 0;
> +			}
>  
>  		} pte_iterate_hashed_end();
>  	}
> -- 
> 2.37.2
> 
