Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9E18106D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 07:10:29 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48chQR2GJMzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 17:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=209.85.214.194;
 helo=mail-pl1-f194.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=G897H7G6; dkim-atps=neutral
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48chPC4LCmzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 17:09:13 +1100 (AEDT)
Received: by mail-pl1-f194.google.com with SMTP id w12so559755pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=c3Eiiej5Gd50RgJzhEkTBuJdhTagholM7xl6YJq93Wc=;
 b=G897H7G6bgR0g37t/Ahjg9iWtOVLHQ45HUjIMfy5R86tdnfi2m+1gm0dvbZIZN3r34
 lMh6wsG9Vn59M5Axy9XIZfguX7fQQ5ycjwShWBHoC58Bvwny9Ulg6w6stDe213nVm/Hh
 Ue+3KiaQAWNLB0erF0LxuqzHWhUCe/X6DSvCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=c3Eiiej5Gd50RgJzhEkTBuJdhTagholM7xl6YJq93Wc=;
 b=HKR4bB83Yc1L8wmzcpdLQJToaHyFpvPCsoyCZVDQUf8eRxk1CN0Z4OXmavXx7ndkfD
 zQE9roSnY8O+7jwKGFpiw7RNod5/V7Fva8+kZz2kdkT3DJZJEh8jbLsKw/eetxRwe7/F
 UdZmuHSOIBQfo9yRtzYyNFvLErW4gS9fKY8YwXp1SaWMoTtBZMJM6fD57uuSwdeijC0s
 A0poNLFLtjJbxpgoojQ+nKdaOzHQmyJf8sBEFkKKdCVLgX7QiYkcQybdo7+H+USistl1
 mZtPAmI2+a6zkX++DKV/hxHv0sFCNgiqe9zfdu7m25CQX8t48i2v6oVb0FiC25W3dTF8
 CijQ==
X-Gm-Message-State: ANhLgQ3CldHUJwwWOl8EHw46POyOUlUZhEC/MabCeddCn+ZA2nUI3Oj/
 7i4jWMAMK6EHAWu+udZ79N+1Aw==
X-Google-Smtp-Source: ADFU+vuwePZ+DKPOfje510A10zOjIQNZMI/9v60ebhVo5DxHHMt3CmnKG/pLsVt0bP3YV5NxhSiCpw==
X-Received: by 2002:a17:902:8a88:: with SMTP id
 p8mr1562296plo.179.1583906951963; 
 Tue, 10 Mar 2020 23:09:11 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-05c2-72f4-ac61-bc44.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5c2:72f4:ac61:bc44])
 by smtp.gmail.com with ESMTPSA id l25sm48398041pgn.47.2020.03.10.23.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:09:11 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 6/7] powerpc/mm: implement set_memory_attr()
In-Reply-To: <20200310010338.21205-7-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
 <20200310010338.21205-7-ruscur@russell.cc>
Date: Wed, 11 Mar 2020 17:09:07 +1100
Message-ID: <87ftefpgn0.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> From: Christophe Leroy <christophe.leroy@c-s.fr>
>
> In addition to the set_memory_xx() functions which allows to change
> the memory attributes of not (yet) used memory regions, implement a
> set_memory_attr() function to:
> - set the final memory protection after init on currently used
> kernel regions.
> - enable/disable kernel memory regions in the scope of DEBUG_PAGEALLOC.
>
> Unlike the set_memory_xx() which can act in three step as the regions
> are unused, this function must modify 'on the fly' as the kernel is
> executing from them. At the moment only PPC32 will use it and changing
> page attributes on the fly is not an issue.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reported-by: kbuild test robot <lkp@intel.com>
> [ruscur: cast "data" to unsigned long instead of int]
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/include/asm/set_memory.h |  2 ++
>  arch/powerpc/mm/pageattr.c            | 33 +++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> index 64011ea444b4..b040094f7920 100644
> --- a/arch/powerpc/include/asm/set_memory.h
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -29,4 +29,6 @@ static inline int set_memory_x(unsigned long addr, int numpages)
>  	return change_memory_attr(addr, numpages, SET_MEMORY_X);
>  }
>  
> +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
> +
>  #endif
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 748fa56d9db0..60139fedc6cc 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -77,3 +77,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>  
>  	return apply_to_page_range(&init_mm, start, sz, change_page_attr, (void *)action);
>  }
> +
> +/*
> + * Set the attributes of a page:
> + *
> + * This function is used by PPC32 at the end of init to set final kernel memory
> + * protection. It includes changing the maping of the page it is executing from
> + * and data pages it is using.
> + */
> +static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	pgprot_t prot = __pgprot((unsigned long)data);
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	set_pte_at(&init_mm, addr, ptep, pte_modify(*ptep, prot));
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return 0;
> +}
> +
> +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz = numpages * PAGE_SIZE;
> +
> +	if (!numpages)
> +		return 0;
> +
> +	return apply_to_page_range(&init_mm, start, sz, set_page_attr,
> +				   (void *)pgprot_val(prot));

This should probably use apply_to_existing_page_range as well. 

Regards,
Daniel

> +}
> -- 
> 2.25.1
