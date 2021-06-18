Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD33AC53E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5rfp0Dd5z3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 17:49:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=KWWPPg7f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=KWWPPg7f; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5rfK5xs3z2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 17:49:11 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id x22so2721293pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rRljl0lqXtQr1Tlype5mHQD3Pca3Q2hIIBpo11jL15g=;
 b=KWWPPg7foJs9lp/W8xnM6c5Lfmi+SoD5uvZu0BJxq6rrCCWH57hfP+6hNENwB1NGrC
 NsWT8IczKr5D1kdEaOBYFrA83PCm/QLzuEyyCh1B9UogPAUCKtBQp5CJkDprGPt4K+sM
 dvHrMs2y39bL1/5uCNFa5g+71zlOvREFZCSVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rRljl0lqXtQr1Tlype5mHQD3Pca3Q2hIIBpo11jL15g=;
 b=ekQVvtPrwRu/1uCVcuOPL+r3QjCh2u5x8ns2kknNxNwyxJTTOgU1lV39S6FRVr7mXM
 dkrtAvVnQYPqx2uuHCFxbseKyqm46pbHFPGo5IhLDSSYV1MRfj8H1WV1/w9OSdjaUbPq
 Kcc+INmGgYdzVz1dstgyNFJTm4/DJ7koYTM4O65hRkfhLi739DqtcR49Ri00cWIj/DTm
 BiLp7ftJtV2Eg+DbxHgYahpzuyTDXa7ydvskveJG/8rMSbT1cGXAolsdGBiqaTzoFdRQ
 3hWDMWJ4x7jrbu2QsYBWkMTV6zj8DSSoWsji/ZwGvIB5Vm64Hl4Dl6Dut2E2rukwgkmD
 Df1Q==
X-Gm-Message-State: AOAM530P9c3yoOQRm1yz0YgI0outpGXaTozc0g33ey22Bi0sU2jrmG5X
 DCeTnp5HwE3yS/1T7yMdVqmj6A==
X-Google-Smtp-Source: ABdhPJywdVaBxmdrr/j43lJUhMz7Op9k0FznBBoEZwtN0FqkIuAUo5QQsKbmWR0Me5f4JfPqlzB5fw==
X-Received: by 2002:a17:902:ce8f:b029:114:a0e5:7be1 with SMTP id
 f15-20020a170902ce8fb0290114a0e57be1mr3576110plg.10.1624002548694; 
 Fri, 18 Jun 2021 00:49:08 -0700 (PDT)
Received: from localhost ([120.17.188.88])
 by smtp.gmail.com with ESMTPSA id c207sm7198055pfb.86.2021.06.18.00.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 00:49:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH 2/4] powerpc/64s: Remove unneeded #ifdef
 CONFIG_DEBUG_PAGEALLOC in hash_utils
In-Reply-To: <20210517061658.194708-3-jniethe5@gmail.com>
References: <20210517061658.194708-1-jniethe5@gmail.com>
 <20210517061658.194708-3-jniethe5@gmail.com>
Date: Fri, 18 Jun 2021 17:49:04 +1000
Message-ID: <87eeczsjdb.fsf@dja-thinkpad.axtens.net>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jordan and Christophe,

> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -126,11 +126,8 @@ EXPORT_SYMBOL_GPL(mmu_slb_size);
>  #ifdef CONFIG_PPC_64K_PAGES
>  int mmu_ci_restrictions;
>  #endif
> -#ifdef CONFIG_DEBUG_PAGEALLOC
>  static u8 *linear_map_hash_slots;
>  static unsigned long linear_map_hash_count;
> -static DEFINE_SPINLOCK(linear_map_hash_lock);
> -#endif /* CONFIG_DEBUG_PAGEALLOC */
>  struct mmu_hash_ops mmu_hash_ops;
>  EXPORT_SYMBOL(mmu_hash_ops);
>  

> @@ -1944,6 +1937,8 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
>  }
>  
>  #ifdef CONFIG_DEBUG_PAGEALLOC
> +static DEFINE_SPINLOCK(linear_map_hash_lock);
> +

I had some trouble figuring out why the spinlock has to be in the
ifdef. A bit of investigation suggests that it's only used in functions
that are only defined under CONFIG_DEBUG_PAGEALLOC - unlike the other
variables. So that makes sense.

While I was poking around, I noticed that linear_map_hash_slots is
manipulated under linear_map_hash_lock in kernel_(un)map_linear_page but
is manipulated outside the lock in htab_bolt_mapping(). Is that OK? (I
don't know when htab_bolt_mapping is called, it's possible it's only
called at times where nothing else could be happing to that array.)

Kind regards,
Daniel

>  static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
>  {
>  	unsigned long hash;
> -- 
> 2.25.1
