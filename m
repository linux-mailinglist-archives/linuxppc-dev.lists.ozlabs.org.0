Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71241B534
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJmqV57M9z2ynD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:35:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H6KrqZWu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H6KrqZWu; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJmpl1Vklz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:34:38 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id gs10so13892384qvb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=FgWQiTWB7VxKPQKxnIIxsQD8wu/wFUyCKRosMzimH1w=;
 b=H6KrqZWux4kwC6JsuTqWZZ4HwCdVs75tw2qdAHH4HGjnHAMUg/P0O11EFcTcZhTPep
 Zisgz4m2StHWgCcyiGmZinAtZvnxegmd4E816p97LjN1jXANZRepub8VWADwlpbGjMef
 VBb5DUhHJ1J88hyu5zIRHuh4P2xWQde/PX4a5t9+15ujIdxkF+nciFwCkgjglCtkXhuQ
 sh6AqV6u0vUjsgRLqXYTtnVygFQGzoYo+op1yGIMJwryCVxKKz/YVkbEf1MCZbvAHPSK
 fPj080YFpNo9aunCJnElmAHaZ5QSYl8/VP9XT4XqZvg+HKSnF50zC16glVxLQkLf9Y86
 GpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=FgWQiTWB7VxKPQKxnIIxsQD8wu/wFUyCKRosMzimH1w=;
 b=4P68Sc1+U5khHnyT8RphiUn5jZttYzLwEJVEFy4A/n+17thABbgOiP1m781FUXubrQ
 MwVvyDtWm9rejbKpj2ZxnkUMkXdYMWJba3ZppsDDu98hl7Sw3OkaeAnKKMtx28mlYUMe
 I4Lrz5gLcpg0SmF4XXTPC08OBnX1QDCJku9QzGsMv3ro+1q6xrIe3ICkxBzw3gXE3Lw5
 03x8c1OPLkwmqtIsZARAuCZGja1i1+Ge1e0nisBBIZw1DbCODK3z2Y2ctpVtGhpxaKsB
 mghZauXN8xNLLd7GuV60Kgi3zHqbowxKnEHKEUi665ssqeH5L4FQ3L2r0Iw0kv5RlhuP
 HiNw==
X-Gm-Message-State: AOAM5328bkwJwuzfHVj6a6QgRML8YZTXDDJcBrC6GLJriLPtrXgV3wea
 mb6pdeoeDuunqE//F1X0dSY=
X-Google-Smtp-Source: ABdhPJzvE3BmaDqW4hXmU1Ya1v/GKkU2SOg2VlINFKaq9LW1fTyTMxD5N/5IyXRffYlzwdCB2r3ZdQ==
X-Received: by 2002:ad4:4d90:: with SMTP id cv16mr7181830qvb.8.1632850473341; 
 Tue, 28 Sep 2021 10:34:33 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18?
 ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id j15sm9449369qth.3.2021.09.28.10.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 10:34:32 -0700 (PDT)
Message-ID: <0ec3b99089df9fe1954f0d7cc770ac04fa9ee2c7.camel@gmail.com>
Subject: Re: [PATCH kernel] powerps/pseries/dma: Add support for 2M IOMMU
 page size
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 28 Sep 2021 14:35:15 -0300
In-Reply-To: <20210928101521.3956331-1-aik@ozlabs.ru>
References: <20210928101521.3956331-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Murilo Vicentini <muvic@br.ibm.com>, Travis Pizel <verno@us.ibm.com>,
 Leonardo Augusto Guimaraes Garcia <lagarcia@br.ibm.com>,
 Brian J King <bjking1@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey,

On Tue, 2021-09-28 at 20:15 +1000, Alexey Kardashevskiy wrote:
> The upcoming PAPR spec adds a 2M page size, bit 23 right after the 16G
> page
> size in the "ibm,query-pe-dma-window" call.
> 
> This adds support for the new page size. Since the new page size is out
> of sorted order, this changes the loop to not assume that shift[] is
> sorted.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> This might not work if PHYP keeps rejecting new window requests for
> less
> than 32768 TCEs. This is needed:
> https://github.com/aik/linux/commit/8cc8fa5ba5b3b4a18efbc9d81d9e5b85ca7c8a95
> 
> 
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c
> index c741689a5165..237bf405b0cb 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1159,14 +1159,15 @@ static void reset_dma_window(struct pci_dev
> *dev, struct device_node *par_dn)
>  /* Return largest page shift based on "IO Page Sizes" output of
> ibm,query-pe-dma-window. */
>  static int iommu_get_page_shift(u32 query_page_size)
>  {
> -       /* Supported IO page-sizes according to LoPAR */
> +       /* Supported IO page-sizes according to LoPAR, note that 2M is
> out of order */
>         const int shift[] = {
>                 __builtin_ctzll(SZ_4K),   __builtin_ctzll(SZ_64K),
> __builtin_ctzll(SZ_16M),
>                 __builtin_ctzll(SZ_32M),  __builtin_ctzll(SZ_64M),
> __builtin_ctzll(SZ_128M),
> -               __builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G)
> +               __builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G),
> __builtin_ctzll(SZ_2M)
>         };
>  
>         int i = ARRAY_SIZE(shift) - 1;
> +       int ret = 0;
>  
>         /*
>          * On LoPAR, ibm,query-pe-dma-window outputs "IO Page Sizes"
> using a bit field:
> @@ -1176,11 +1177,10 @@ static int iommu_get_page_shift(u32
> query_page_size)
>          */
>         for (; i >= 0 ; i--) {
>                 if (query_page_size & (1 << i))
> -                       return shift[i];
> +                       ret = max(ret, shift[i]);
>         }
>  
> -       /* No valid page size found. */
> -       return 0;
> +       return ret;
>  }
>  
>  static struct property *ddw_property_create(const char *propname, u32
> liobn, u64 dma_addr,

Looks great to me.

FWIW:
Reviewed-by: Leonardo Bras <leobras.c@gmail.com>

Best regards,
Leonardo


