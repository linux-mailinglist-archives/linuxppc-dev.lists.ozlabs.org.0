Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id B99568D3FEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 22:56:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=THt8q/L/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqM3D6xLJz7BBv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 06:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=THt8q/L/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqM2V2lz9z79vT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 06:49:52 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-354f51ac110so186311f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717015783; x=1717620583; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jn8GixokyynrojPzWlSDYGpdxGemGL68O+dT+8a9CnA=;
        b=THt8q/L/8F+TrxsSvjjs3fXYvMsSSTuvwfx06Rndmw0SUETJvPExB1ZwXhs7bQpzpv
         BPjvVDLfYPc6y1LgkNT4A24dQKBBaLFHr852UnkVG3KgLWT4i7kbhc3NEzNnpyRICK8i
         PLvbpKwmvmcaBis4ERYJ48CSlCxffkca2UdA8sWcJc2Uavo3D1EPgYH08DhFppC0/v3p
         Ipr4sz0cCF8QwRDPbJgPsKx+fV1s/P+JM0OSOog7Ox9zfH+mFPjmVYA2vhAt0ZK0tGgV
         7Q+B7CdrqxL8nerhwfMQK385Q0XSoWqg12KIcRSgN/KHy1W1HE43Tddrv30/Po+NN/P3
         cRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717015783; x=1717620583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jn8GixokyynrojPzWlSDYGpdxGemGL68O+dT+8a9CnA=;
        b=ct9DfYJhJb/ORCF7qAbfPq+4/u6c2TcEd2AvboMCyhc6DtNTwjZRnaaQVyVpvYG0X9
         w0atZjGsIu1D5VQZxWzISX9EOtkPdE2xgRYXgr901keJqGhvU5/T95UP3EZs87Ryoc5N
         cenvT8xW4jk2xv0ROA7o0YJMSL0WOXh3zTxyMGK8raujiuTuQSXsDJw58RJwhxhnlzaC
         0diWs1hqmeSQArTJSo4gaj7ANg3N7yFHEwLq5eU3vMjxrYDHKfydeP+plaQxlDXPy37x
         bGPXJpUJON7zcNjIUsMIKjBPityCNyHD2ZVlFu4rhI0UJrmYqBcdE5qPgZz4pW7mtpad
         iFaw==
X-Forwarded-Encrypted: i=1; AJvYcCU60DMyr3tyAfS5Xo+e0VOhRqY45ywt/QUHd0MbrlddkWdg+deQWSEvJgvRwCNrh5vCeeNLmBJS49vhzhuRjvdalQdugumRIf6H3ie9jA==
X-Gm-Message-State: AOJu0Yys3CjBVPcK4FvwAwOz1SXu15QcQaW8mNPQLasBdhH4B/4YVPwN
	CCssdojdCGfyMuYH5TT5zzzN5jMdLdzCzCDlAw4rm5OrAsfNCZgansQvhacJ5Uc=
X-Google-Smtp-Source: AGHT+IENMwv9QoM9UqE02MAyheYmszVS5H9UUthK4Eu3nO+XUYm5m3RAvFfJ037Ub0kS/amMiPZnTw==
X-Received: by 2002:a05:6000:1f8f:b0:358:149c:eeca with SMTP id ffacd0b85a97d-35dc00c69c2mr261576f8f.67.1717015782708;
        Wed, 29 May 2024 13:49:42 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a090805sm15479283f8f.48.2024.05.29.13.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:49:42 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 22:49:40 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 16/16] mm: Remove CONFIG_ARCH_HAS_HUGEPD
Message-ID: <ZleU5I6iJq5VmPWI@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <98d6ff5bc9395785e268b9f8eff08fb742c045c6.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d6ff5bc9395785e268b9f8eff08fb742c045c6.1716815901.git.christophe.leroy@csgroup.eu>
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

On Mon, May 27, 2024 at 03:30:14PM +0200, Christophe Leroy wrote:
> powerpc was the only user of CONFIG_ARCH_HAS_HUGEPD and doesn't
> use it anymore, so remove all related code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v4: Rebased on v6.10-rc1
> ---
>  arch/powerpc/mm/hugetlbpage.c |   1 -
>  include/linux/hugetlb.h       |   6 --
>  mm/Kconfig                    |  10 --
>  mm/gup.c                      | 183 +---------------------------------
>  mm/pagewalk.c                 |  57 +----------
>  5 files changed, 9 insertions(+), 248 deletions(-)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 76846c6014e4..6b043180220a 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -78,7 +78,6 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  
>  	return pte_alloc_huge(mm, pmd, addr);
>  }
> -#endif

Did not notice this before.
This belongs to the previous patch.


-- 
Oscar Salvador
SUSE Labs
