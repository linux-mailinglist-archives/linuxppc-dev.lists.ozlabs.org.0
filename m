Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 09FD18D341D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:11:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MdUelA6T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4lk5ZLCz881f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MdUelA6T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4kz0Vblz87lS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:05:27 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-354e0cc9c5cso1631009f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977124; x=1717581924; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjBeXRP3NZPNEtnVExWiEQg1GcbJkpp6fTKGUuZKI9Y=;
        b=MdUelA6T2pILVH55xrSptqk1b/r2nO1Z7Pl7GGiO+IZBOseDW6A+dRWpC66/840QOI
         jhAbHXRjTYjlVE0TdsXDLkTcz49o/Y/H0pAozGMTrOpmh1BeY1bDFKlOt1B4NxbduJdK
         q0i9LSV+7L2GDfb+g3nhJPFfKjnDIR2v4Ha9EQpRB+dH+HPzRGDxlAXzpbz5LmSIcmyv
         MC9cMOKJOxPJfftDAEpESWMYVaHJGCQW2AVY4YZKY/MThcCuT3d/WrpAIPJiLKWtSBwJ
         +w9ANzI0/8QTBb+DNpaqfIgNhFQYzIu4dbagkoPH6KQ/ZBC/3qz5PAzkX4NHbq2OZg56
         XREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977124; x=1717581924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjBeXRP3NZPNEtnVExWiEQg1GcbJkpp6fTKGUuZKI9Y=;
        b=ZuMv+tclnoKiRAEgKzkqeQdrbKDlAf56LErWdP74Y2HAzhqBht/36jVw/4Qr8/w7pg
         QanVzjAT5ADoQls9ZAXdAXiZsmdl5G351TDJD6bygys5zC+QAvjgZdWBpIlJYuSoOPeP
         62Rte5DCZkId/Vd9PGlYA4uNsRuoKFqPEiJd9vX/TEqkxCoO8nbWTeXyYRj4+pTRyzWT
         WvY9J+D3fUr+R8zI/ParLfZs8fpU74WZMIvYEtAU3wZsiuJ28/LSMP2AgFVC4fU/dWWm
         buwev3s1h+eFuwBUlSJJzrYVW6Nlm8StUY1Tg1AFJR20pSVq7p3n3wrC5y1yEnHtu17O
         Qq7w==
X-Forwarded-Encrypted: i=1; AJvYcCWP3ULgQKhJWXwPZBeBjJ9lryPr609CTFDs/OdxPVJn7QJD5l2Pt2upWv+niStcIjxhigP8q2LSJUqxhZtpht2TgzbJf74QD3rqQgMBSQ==
X-Gm-Message-State: AOJu0YytShzclgOceTcXa2n+gSjsZKcnJ5TGiI28kRNKlVoV50AYouhE
	9beX0zP6rqq2SC8Gtt2GoSPvmMVE2Ork0F+5q5QgdxLp0C2yZAE5MikhBQF1cwE=
X-Google-Smtp-Source: AGHT+IEJ9/f6hxMe3hU/z8uaPfO55G1vDC0ZTRYQcECOhnmYBWOWQIQjQ/blRPGbEK5l+LkpPlv2TA==
X-Received: by 2002:a5d:4748:0:b0:356:a46b:7369 with SMTP id ffacd0b85a97d-356a46b766bmr8129108f8f.24.1716977123830;
        Wed, 29 May 2024 03:05:23 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7db23sm14697759f8f.23.2024.05.29.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:05:23 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:05:21 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 13/16] powerpc/e500: Use contiguous PMD instead of
 hugepd
Message-ID: <Zlb94UyBx0s-Vavj@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy@csgroup.eu>
 <ZlbsEb_T2eQYO-g4@localhost.localdomain>
 <b95f61ea-b40c-4d7c-9a39-7bf927f7b0cd@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b95f61ea-b40c-4d7c-9a39-7bf927f7b0cd@csgroup.eu>
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
Cc: Oscar Salvador <osalvador@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 09:58:35AM +0000, Christophe Leroy wrote:
 
> Yes I now have :
> 
> +#define _PAGE_HSIZE_MSK (_PAGE_U0 | _PAGE_U1 | _PAGE_U2 | _PAGE_U3)
> +#define _PAGE_HSIZE_SHIFT              14
> +#define _PAGE_HSIZE_SHIFT_OFFSET       20
> 
> and have added a helper to avoid doing the calculation at several places:
> 
> +static inline unsigned long pte_huge_size(pte_t pte)
> +{
> +       pte_basic_t val = pte_val(pte);
> +
> +       return 1UL << (((val & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 
> _PAGE_HSIZE_SHIFT_OFFSET);
> +}

Great, this looks much better.

> That's what I did before but it didn't work. The problem is that 
> pte_advance_pfn() takes a long not a long long:
> 
> static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
> {
> 	return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
> }
> 
> And when I called it with nr = PMD_SIZE / PAGE_SIZE = 2M / 4k = 512, as 
> we have PFN_PTE_SHIFT = 24, I got 512 << 24 = 0

Ah, I missed that trickery with the types.

Thanks!


-- 
Oscar Salvador
SUSE Labs
