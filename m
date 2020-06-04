Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DB1EEA15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 20:06:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dDHs6ppwzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 04:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fMbfz5xt; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dDFP64S0zDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 04:04:41 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m7so2510683plt.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rD8xuTgnZ6MvQvEnMb+rcASld4ronehkugR1bak9iF4=;
 b=fMbfz5xtWwcFx1lkzWMOzCVDlzqu2GYk/fZ0yKlBIL/eJw7AQlXPM2ornec0YYgVg7
 UYGQJ4ce7zktK+/93Nyb3PS/m2PGda6kaaZjjKvMBFSQC+5ryhUsnt7DThlQNA+R0LYy
 XCOeVDZckgIwHBWGyTdygX0wfKPfra4o7dlq1L9ooD+CeRgcbkE7Twjb7pCQfjzeXoLG
 DzwVK0l56ba8mx/b0odQND6lKJArXIcdxw8cT5vRrUzCKY2EeI60IrU3p/lzvHw2cDjL
 z61/A872SA93qHPX+YEF1qSZkUOOlTvrcJT4nP7tq+k2Mbmg+QKA2emmCuXl+HTOtxOF
 iTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rD8xuTgnZ6MvQvEnMb+rcASld4ronehkugR1bak9iF4=;
 b=fcg4Vq+kX821AW7/hfpr8UJmZssPxauZe2xqLuIrWoU2wP/1oXH6t3rtVLo1n5sQM/
 MZM1T0/T/8mSu6Qp1Hd7g2A/dIWPPU0HkfD86QT94OglYKSJzw1XQMoGWdaCmkcdp+jA
 q0em5wHGVjjtr7Wf7hHyBOxtkcE9usf/XY/xI74htLZAnySDj9IqiRsgfkTnQbeBMrmN
 /70fkhFyP9X1LFIUGNMISyv4lCL9b5RWXLEJntqEdnawD7OTJoG/W5ZEDzUc1KXnV2Tl
 f9p7ONhXi7Xt/C7J9XF6LZLaJNFWSyzWAPUaXQVSJxtFuPtVhttMOBKnDMl76hWiTXkq
 26mg==
X-Gm-Message-State: AOAM530Rb2dG5v46BAVBSDcute5Y5L/5lcY00cjaoajeZnHinds0WXAe
 ozo3Ajt3XhE58RPg9ACWcTY=
X-Google-Smtp-Source: ABdhPJz0+8tBh768mrEJ585mQCjvZcm0WkxiKChW8xM5bO8f66+aggOYu3pZxcjJ7Ue5X/xjt/lBfg==
X-Received: by 2002:a17:90a:b013:: with SMTP id
 x19mr7609215pjq.229.1591293878091; 
 Thu, 04 Jun 2020 11:04:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g9sm3932309pfm.151.2020.06.04.11.04.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Jun 2020 11:04:37 -0700 (PDT)
Date: Thu, 4 Jun 2020 11:04:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] mm: Fix pud_alloc_track()
Message-ID: <20200604180435.GA219656@roeck-us.net>
References: <20200604074446.23944-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604074446.23944-1-joro@8bytes.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 jroedel@suse.de, linux-mm@kvack.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 manvanth@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 09:44:46AM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The pud_alloc_track() needs to do different checks based on whether
> __ARCH_HAS_5LEVEL_HACK is defined, like it already does in
> pud_alloc(). Otherwise it causes boot failures on PowerPC.
> 
> Provide the correct implementations for both possible settings of
> __ARCH_HAS_5LEVEL_HACK to fix the boot problems.
> 
> Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Fixes: d8626138009b ("mm: add functions to track page directory modifications")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/asm-generic/5level-fixup.h |  5 +++++
>  include/linux/mm.h                 | 26 +++++++++++++-------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index 58046ddc08d0..afbab31fbd7e 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -17,6 +17,11 @@
>  	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
>  		NULL : pud_offset(p4d, address))
>  
> +#define pud_alloc_track(mm, p4d, address, mask)					\
> +	((unlikely(pgd_none(*(p4d))) &&						\
> +	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
> +	  NULL : pud_offset(p4d, address))
> +
>  #define p4d_alloc(mm, pgd, address)		(pgd)
>  #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
>  #define p4d_offset(pgd, start)			(pgd)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 66e0977f970a..ad3b31c5bcc3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		NULL : pud_offset(p4d, address);
>  }
>  
> -static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> +static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> -
>  {
> -	if (unlikely(pgd_none(*pgd))) {
> -		if (__p4d_alloc(mm, pgd, address))
> +	if (unlikely(p4d_none(*p4d))) {
> +		if (__pud_alloc(mm, p4d, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_PGD_MODIFIED;
> +		*mod_mask |= PGTBL_P4D_MODIFIED;
>  	}
>  
> -	return p4d_offset(pgd, address);
> +	return pud_offset(p4d, address);
>  }
>  
> -#endif /* !__ARCH_HAS_5LEVEL_HACK */
> -
> -static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> +static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> +
>  {
> -	if (unlikely(p4d_none(*p4d))) {
> -		if (__pud_alloc(mm, p4d, address))
> +	if (unlikely(pgd_none(*pgd))) {
> +		if (__p4d_alloc(mm, pgd, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_P4D_MODIFIED;
> +		*mod_mask |= PGTBL_PGD_MODIFIED;
>  	}
>  
> -	return pud_offset(p4d, address);
> +	return p4d_offset(pgd, address);
>  }
>  
> +#endif /* !__ARCH_HAS_5LEVEL_HACK */
> +
>  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>  {
>  	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
> -- 
> 2.26.2
> 
