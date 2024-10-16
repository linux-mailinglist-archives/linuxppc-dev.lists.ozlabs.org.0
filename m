Return-Path: <linuxppc-dev+bounces-2307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD059A0944
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 14:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT99k0X79z2xqc;
	Wed, 16 Oct 2024 23:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729080893;
	cv=none; b=J+PKwIO26UZNxkNJBAS6V5YPJ1aNYKHwUhJirz784Mq9EoAT8qUhM7wBcnvEEwc2j0GkNfHYAPJu/n5cZ2GbmFFBk/5E0WpknF5Nsa6eXgzdcegvmIPVoRvHOeuU9AYtiiQuwpieDtdhZRfyRIx2GeEto2+Nj0wE7ihxIeA3UpOyBu5TRsG1PqJB9Sm7WPONSxg00EhZl4tCp/UjXKufwaAUgGB3q807N/lHIRtl6NiGHjFWQkmryYE0ylo/qLq7oOUV/Eeu8UAIO9ydTaYvCPYodWc2M/t4NH8yRGw1xQ6XGKlKfXqjMR7gYcxX6m5fK5By8xucrhbwBR34bigE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729080893; c=relaxed/relaxed;
	bh=l0eI5lAUbdT2xgG8Sg5gfm2pTZ0+zaLZVdb9X/94txA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjkupHRyshhb0zRvONEFPIjKhPiMyT09dShrwhmAfyR0IqXUPgfol9dEfJbtM0H6mpABZcJ4SnnwF/7h/WyafI6AbMqmnxKiTRvm5bvZ7eMkwAp277FzZ8Y35ErI8BH1ydIABzT0snLPI8O7cLKGheoxnBmLncPf5oSGzZ5WbHhIb022IwZM+pvLpNz4XjpahVEG8q7mCidKjxAScCiFKFvmTsRoPz6+fyh/7l8Of/8JQZMq/uxnmDpUVAvohLanEhqdAczT3D4fZ1cw+y/zaciL03CQm3w46xTZ79UihEzIzpM9Btv55Ng8JHNzh5CnvFzWsAwqkYxiThKaDsSwHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hS8UrQ1n; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hS8UrQ1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT8zZ5RkQz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 23:14:50 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so24416601fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729080884; x=1729685684; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0eI5lAUbdT2xgG8Sg5gfm2pTZ0+zaLZVdb9X/94txA=;
        b=hS8UrQ1n10a86q5cZHnScDa3hnOX67dVUSLEEkBWjWLfxtbayKLwhTy6gg1gJj1SLn
         WiZAd/lU/H9gum1Th4F6AKb+p1dBy6BNOWRzzmvj4Gx55h2mMqJXmlkkSDZ9sUcLKaiJ
         MfvPL0MGIHIciDXOc60LTRdP3LGXCeLqkY2BhM1tLQS0oqJF1Xasi/MYcpo300u6Wbxa
         z2P8bAZ6c4zdP7QrquylKATTSWqJm50OOYBE56sGb4LcC9e4AJkqRHcbpUV35BytIzFG
         WOsoePFnxL+94o2DAMsYVC5i/j67kCMiyOnlCbAj2bFgflVQ8STNKa6V0SD42dXsEN+j
         zMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729080884; x=1729685684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0eI5lAUbdT2xgG8Sg5gfm2pTZ0+zaLZVdb9X/94txA=;
        b=FObHPdyR9H2r22uyfSHMUc92S3KA0NP5EDFzxnPPmEP2yce7n9RDZ0tQ4A/pwkOu+0
         AwpArtKy3ETelMqDhBCsT6m9J1Q+SPxms3bUMFKPvf425wmit8Hfc83B86ZWHZOdNIPC
         6JdGzNMeoQQatojUXaYzgT3UqoZS74Lo+YazFw7Ykmk/7VigvS/F7ud2urauP/xQKurw
         Y0TlRl3jJsaIh5FHrSpDdN+IpiNesTXRbGY0rRPgHmoco8+A7nePfHKcKPpydY9LB96B
         p3mVXque5c1YCQSJ2fpIlqnjkzY5oJ5G8KhA+IlE9Ub62Go5PZ1aI+9mDSM5KzAva8P/
         qhCg==
X-Forwarded-Encrypted: i=1; AJvYcCXOI1vcTVMZ8MLxWnLW0FfwB/RmfkE3i/voFu1eUbiF5OJzSjA8X/y5Jh17II6c6DzzwdtK/LsuuJodlKg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuBvYEJMxIFtvrGm6SElvSg01EC2bsNoJ2cquP2qT7ckmZlQVn
	9HRlUyCYtGBGYQ+PsgtOFJtwFcg9pKMaz/lPib2gihiv2yGSEECt
X-Google-Smtp-Source: AGHT+IFISaLoEL1v0HSzO0EUOZSFeeQBuVf/qhinkQvpqUzk15fW+vJulRLe5xE0klVquRlwEnymMA==
X-Received: by 2002:a05:651c:1990:b0:2fb:4f0c:e3d8 with SMTP id 38308e7fff4ca-2fb4f0cea31mr54327131fa.27.1729080883239;
        Wed, 16 Oct 2024 05:14:43 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d194034sm3994531fa.78.2024.10.16.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:14:42 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 14:14:40 +0200
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, kernel-janitors@vger.kernel.org,
	vbabka@suse.cz, paulmck@kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/17] KVM: PPC: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zw-uMDwxBvl0R0mL@pc636>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
 <20241013201704.49576-14-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-14-Julia.Lawall@inria.fr>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 10:17:00PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were made using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/powerpc/kvm/book3s_mmu_hpte.c |    8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_mmu_hpte.c b/arch/powerpc/kvm/book3s_mmu_hpte.c
> index ce79ac33e8d3..d904e13e069b 100644
> --- a/arch/powerpc/kvm/book3s_mmu_hpte.c
> +++ b/arch/powerpc/kvm/book3s_mmu_hpte.c
> @@ -92,12 +92,6 @@ void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
>  	spin_unlock(&vcpu3s->mmu_lock);
>  }
>  
> -static void free_pte_rcu(struct rcu_head *head)
> -{
> -	struct hpte_cache *pte = container_of(head, struct hpte_cache, rcu_head);
> -	kmem_cache_free(hpte_cache, pte);
> -}
> -
>  static void invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
>  {
>  	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
> @@ -126,7 +120,7 @@ static void invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
>  
>  	spin_unlock(&vcpu3s->mmu_lock);
>  
> -	call_rcu(&pte->rcu_head, free_pte_rcu);
> +	kfree_rcu(pte, rcu_head);
>  }
>  
>  static void kvmppc_mmu_pte_flush_all(struct kvm_vcpu *vcpu)
> 
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

