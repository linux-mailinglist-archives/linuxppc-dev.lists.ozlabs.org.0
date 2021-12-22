Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA547D955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 23:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK7Tb4Qc2z3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 09:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ddZKfL8F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=julian.calaby@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ddZKfL8F; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK7Sr5RPrz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 09:35:38 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id x21so8387998lfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=509cil0OJ5qdfWw2ojcCOYSwHBJ9P8vwyQkD+G8mLLA=;
 b=ddZKfL8FvoJ0XwnKMMmKWLGJ3VqFSFGglRVDb0+PqM2DxuwldMzReXdg0Ebtk9Yobi
 AVztMug/XvayfxM3v8GOeWIfRsrkU3pfCylaBXUmoqsMO81lth0cxfRUKMa/jua7By8h
 fSZ6R/sGKPh5nSmA0ASRGeLeb6wdCjfYNft0YG0y8ivi5U/BpBfokB9hcGa9coBwNOMN
 Gg+cjCxIPhQ2b7TcbEc1gjiCTijvdkgEF9rXZGv3s6zgXp/f1hq5bp68059Gc1Z9wTvm
 bIqvGf1ZD6DqjfSFh05rCeUC0528fcV+nKXNDyihLdVmnm+p0/XORPV26mvKGpvGa4Zb
 OjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=509cil0OJ5qdfWw2ojcCOYSwHBJ9P8vwyQkD+G8mLLA=;
 b=0R2TInv8O58xDwrXZNjbZLajdItHrVckNZdp/ccvjkpTpDnGYNg+Gk1wzCeYSoximD
 ie6umXHV4OGnE02q6NArlMK3xX+mtDk9ifYI0s2U9c6SF0RMa4ZyZXUt1c+LY7QrApPy
 yxCsabip0DJttxuH5rLtNVaOrNPr5LWpfb+mXpdX9NvMWnOq0rMTCRCWrXiJ1YaupLRQ
 boYLEDXOvg6gerUIlNo9/0XuAePk/PCdTNKoZAAH8TzJ4en7c+D3bmFZUrSLgzNpAkjn
 PhtutcxqdBYXrfCfd+QNG9U66L23QHYDTSn+6juCSRXXKPqdN54ArOEzw4CtY/McI/ez
 /h6A==
X-Gm-Message-State: AOAM530W67+jxk0Fvh5PAhsdMsgDTXcu0pJxx/uNOREqnJaRNncN846U
 +4uDIrplb0TGKHD3kO/G2vdH9/oya6Hp4ycIN10=
X-Google-Smtp-Source: ABdhPJyfufBHYdDFQz+ah/Iw/iZGRxjmctUcUf2op+2vKNZiQPXrZB6SUilBWwF8JJMaI1eDbZeGr+HUSlFNJ5XDS4Q=
X-Received: by 2002:a05:6512:3486:: with SMTP id
 v6mr3634731lfr.483.1640212533273; 
 Wed, 22 Dec 2021 14:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20211220092318.5793-1-tianjia.zhang@linux.alibaba.com>
 <20211220092318.5793-2-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20211220092318.5793-2-tianjia.zhang@linux.alibaba.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 23 Dec 2021 09:35:21 +1100
Message-ID: <CAGRGNgXE_5H20K+e9oejqybOGh8JezMpi2yrDJKqaZ4rWJkZdA@mail.gmail.com>
Subject: Re: [PATCH 1/5] crypto: sha256 - remove duplicate generic hash init
 function
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mips@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Tianjia,

On Mon, Dec 20, 2021 at 8:25 PM Tianjia Zhang
<tianjia.zhang@linux.alibaba.com> wrote:
>
> crypto_sha256_init() and sha256_base_init() are the same repeated
> implementations, remove the crypto_sha256_init() in generic
> implementation, sha224 is the same process.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  crypto/sha256_generic.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/crypto/sha256_generic.c b/crypto/sha256_generic.c
> index 3b377197236e..bf147b01e313 100644
> --- a/crypto/sha256_generic.c
> +++ b/crypto/sha256_generic.c
> @@ -72,7 +60,7 @@ EXPORT_SYMBOL(crypto_sha256_finup);
>
>  static struct shash_alg sha256_algs[2] = { {
>         .digestsize     =       SHA256_DIGEST_SIZE,
> -       .init           =       crypto_sha256_init,
> +       .init           =       sha256_base_init,
>         .update         =       crypto_sha256_update,
>         .final          =       crypto_sha256_final,
>         .finup          =       crypto_sha256_finup,
> @@ -86,7 +74,7 @@ static struct shash_alg sha256_algs[2] = { {
>         }
>  }, {
>         .digestsize     =       SHA224_DIGEST_SIZE,
> -       .init           =       crypto_sha224_init,
> +       .init           =       sha224_base_init,
>         .update         =       crypto_sha256_update,
>         .final          =       crypto_sha256_final,
>         .finup          =       crypto_sha256_finup,

Aren't these two functions defined as static inline functions? It
appears that these crypto_ wrappers were added so there's "actual"
referenceable functions for these structs.

Did this actually compile?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
