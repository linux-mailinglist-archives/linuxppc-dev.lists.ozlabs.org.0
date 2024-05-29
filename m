Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4C38D30BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 10:16:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K+5sp41+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq25r4fDvz79pt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:06:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K+5sp41+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq2555C68z79P5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:06:01 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3550134ef25so1694890f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716969958; x=1717574758; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5XpAlzs8/5dy/UfJxZhXqs4EkV35bosYx2T12GiUv4=;
        b=K+5sp41+SLKHvossPgybRo8J1spO89tcZZ9WAM+s7vMgMzVe6MAjREb4giPR/VJxkd
         NTPi03rdEnntU3rkj7SiNgJBr0uMYppHU0hTT4+2mvWkVRTSTW2atHiZpfDMkaB8I9qs
         TTcQpg1V1RLmBX8eOFjbhKzvlb9XVzSB5Gqn6VXPomwawAkrZkubE3JuyDcFhBtKBr7K
         wMVpijxZG4rnWznH3miG7mDevbqSPCgr8nj7ev41pZK5p3y1TydMvXvYk4RyyIMjKUp6
         ydm6pp5ASf9QMgwDP5AMKa2jtg0+9dM/Zhj299pNrj7tMdluRY1yQGlB4IcelNbUDk+S
         m2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969958; x=1717574758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5XpAlzs8/5dy/UfJxZhXqs4EkV35bosYx2T12GiUv4=;
        b=f5Gc//ofruPuv89EIsgdzL9xncZ3Ef+e8e+95P476NAYSl9HiBTronI7e/5CsXQsvX
         ijrS57IevT1phT4RkrzmjliCOBzaDEDw07ZD9G+36n9Rijqp6k89nxdLe3P8akK2rQtb
         ak8jd7keNI1hjhpp59SJvKxXmth593pILYQV9BUXqQTYewZbJzH59dLymYK/9SfZlKjl
         7Ev4MGqInK5To64nCTTSTzCC46QY6IEO2MD+ptm8VusbSkEyST2O2zq/WT/oYFk4tnAI
         oCOTFoBlp9Iddd/Fj7adPll5MR0BClXC7aJwnjDM9uw+Y8O1kERaYWVeFk4aV6Y6Gc6I
         66GA==
X-Forwarded-Encrypted: i=1; AJvYcCXZGki0SQ2f8DDG2T4oLBwKfSW5jzCZBKYF7MTr8XZq68yguAsXkI4/BEcxy1klOUvAPUmccXQcFQ7hWj92whGJbeHl2D61KuWuc+uPsw==
X-Gm-Message-State: AOJu0YyFvN+Xn9lK2PtOmEh18lp+gtTVladZvjT7VK+3yiaoXxAC8e1+
	paSUR+v0wgJ3VqEOcIy+fWxrirD1w8hC6ext6ZkiGL1PcuwCZ2U/xunEmKcBJqg=
X-Google-Smtp-Source: AGHT+IEWL+ZvoWTTto3nvB8MwaNuX1ufrqSVnU1SJZSJmLczqxuu5qf+e7ikQWSXZHaCbOMhNsFeCQ==
X-Received: by 2002:adf:f1c9:0:b0:351:c934:e9e6 with SMTP id ffacd0b85a97d-3552fdfa7a8mr9781890f8f.64.1716969958385;
        Wed, 29 May 2024 01:05:58 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0908e4sm14132958f8f.63.2024.05.29.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:05:58 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 10:05:56 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Message-ID: <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 03:30:10PM +0200, Christophe Leroy wrote:
> Use U0-U3 bits to encode hugepage size, more exactly page shift.
> 
> As we start using hugepages at shift 21 (2Mbytes), substract 20
> so that it fits into 4 bits. That may change in the future if
> we want to use smaller hugepages.

What other shifts we can have here on e500? PUD_SHIFT?
Could you please spell them out here?
Or even better,

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/nohash/hugetlb-e500.h | 6 ++++++
>  arch/powerpc/include/asm/nohash/pte-e500.h     | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
> index 8f04ad20e040..d8e51a3f8557 100644
> --- a/arch/powerpc/include/asm/nohash/hugetlb-e500.h
> +++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
> @@ -42,4 +42,10 @@ static inline int check_and_get_huge_psize(int shift)
>  	return shift_to_mmu_psize(shift);
>  }
>  
> +static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
> +{
> +	return __pte(pte_val(entry) | (_PAGE_U3 * (shift - 20)));
> +}
> +#define arch_make_huge_pte arch_make_huge_pte
> +
>  #endif /* _ASM_POWERPC_NOHASH_HUGETLB_E500_H */
> diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
> index 975facc7e38e..091e4bff1fba 100644
> --- a/arch/powerpc/include/asm/nohash/pte-e500.h
> +++ b/arch/powerpc/include/asm/nohash/pte-e500.h
> @@ -46,6 +46,9 @@
>  #define _PAGE_NO_CACHE	0x400000 /* I: cache inhibit */
>  #define _PAGE_WRITETHRU	0x800000 /* W: cache write-through */
> +#define _PAGE_HSIZE_MSK (_PAGE_U0 | _PAGE_U1 | _PAGE_U2 | _PAGE_U3)
> +#define _PAGE_HSIZE_SHIFT	14

Add a comment in above explaining which P*_SHIFT we need cover with these
4bits.

 

-- 
Oscar Salvador
SUSE Labs
