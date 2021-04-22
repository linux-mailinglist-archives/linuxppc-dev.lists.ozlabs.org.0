Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD71367A33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 08:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQp3s2ywwz301q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 16:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QXom36jW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QXom36jW; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQp3P0ksvz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:50:54 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id i12so13825798qke.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=rtDdixl50dEInzVU4EDqe3HYgm+3xRTbWaZMtMKGnEc=;
 b=QXom36jWadvPIRGrs6Z2HWLbuunYIqK2QOPmciTq88qx2jsOebC974zCrnaAarbfbG
 j75FeLb+ks56iceff2Dh8PPqP6/FceRxw1neJq91ABd7OqjH9F1CWI3Tm9pdW/Igy9JF
 6duOLpbEWybYFPYgNfPPaUI6JtkGHsVRYXw8pmT4+bXPJf0hEgn3PQYNWwujW5F3YQgh
 VIIKnmQTYuOrQSwhEsr8t6WS16rBO5Nf7WXkefGe4H8frfwxKssrCMeA3h8KEhSiQrAK
 Ti8TO/VIr2ryDuJyOB7q8J/vGoefSS0gpwkGxNvPPfgM7nZdVYNNOr8YHZIOleYK3nHN
 Ojbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rtDdixl50dEInzVU4EDqe3HYgm+3xRTbWaZMtMKGnEc=;
 b=YjWHvDPWVyzM5C5OvnooweFqlUeqR4xaXMNW6mYN7IHLKgUHCHetGWKpKqGoq3NAWQ
 Kr5HO/vU33lfZLGpOmSIWYJjH/cNOg79nUx8Wgm+yUSNpgh5bbFLrB0UgZrWkxZGIJip
 CLx0YU/HoHkRyzLKs2K3d2hUxTkMyTRCnmVqwNpyA1Wv2VZYxVYhlV0XrPFD5Hdv3lZY
 WYsmz7Rx9jhc8Wf04wa7AVOTFOpkT3Tv7dgd4sYZDfxL6aSm0pyzzaDhJMs8DoTleJ6D
 FJZva5SHxdgqiuDzyhoEglBQggoMYCqliaE2XrAakyPEKoTdbF1PqMRj47oe/FGbmDdE
 sIEw==
X-Gm-Message-State: AOAM5318k3VtNPpp2bQMMWa75CFkER1OhrZd13bNKDzaayWP5AadhD02
 0AIvPYsFsx0JV9oShoHFAh4=
X-Google-Smtp-Source: ABdhPJzAFcrT+Qs+l8dTqvqGJX/aDrzfuZm1NwaJkPi+txCgsMnq4XFAgQ5Q9uiBRDrcKkbFLxwUkw==
X-Received: by 2002:a05:620a:579:: with SMTP id
 p25mr2113901qkp.95.1619074249026; 
 Wed, 21 Apr 2021 23:50:49 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id l12sm1562269qtq.34.2021.04.21.23.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 23:50:48 -0700 (PDT)
Message-ID: <d0c4a6b8cb669d9321173c4d4ce0062b6f7698d5.camel@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/kernel/iommu: Use largepool as a last
 resort when !largealloc
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Niklas Schnelle <schnelle@linux.ibm.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>
Date: Thu, 22 Apr 2021 03:50:44 -0300
In-Reply-To: <20210318174414.684630-2-leobras.c@gmail.com>
References: <20210318174414.684630-1-leobras.c@gmail.com>
 <20210318174414.684630-2-leobras.c@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

FYI: This patch was reviewed when it was part of another patchset:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200817234033.442511-4-leobras.c@gmail.com/


On Thu, 2021-03-18 at 14:44 -0300, Leonardo Bras wrote:
> As of today, doing iommu_range_alloc() only for !largealloc (npages <= 15)
> will only be able to use 3/4 of the available pages, given pages on
> largepool  not being available for !largealloc.
> 
> This could mean some drivers not being able to fully use all the available
> pages for the DMA window.
> 
> Add pages on largepool as a last resort for !largealloc, making all pages
> of the DMA window available.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kernel/iommu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 3329ef045805..ae6ad8dca605 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -255,6 +255,15 @@ static unsigned long iommu_range_alloc(struct device *dev,
>  			pass++;
>  			goto again;
>  
> 
> +		} else if (pass == tbl->nr_pools + 1) {
> +			/* Last resort: try largepool */
> +			spin_unlock(&pool->lock);
> +			pool = &tbl->large_pool;
> +			spin_lock(&pool->lock);
> +			pool->hint = pool->start;
> +			pass++;
> +			goto again;
> +
>  		} else {
>  			/* Give up */
>  			spin_unlock_irqrestore(&(pool->lock), flags);


