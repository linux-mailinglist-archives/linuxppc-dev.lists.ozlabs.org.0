Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD418B5F94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 19:05:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FDZaSnrm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSqTt0gq8z3d2c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 03:05:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FDZaSnrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSqT54M6Mz3cWg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 03:05:11 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7d9e2a5e097so175035839f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714410306; x=1715015106; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjIM1YsOHJSXus8VNmDaNi8MZ1j7PDi3kmS0uCHnMmg=;
        b=FDZaSnrmhL3AMLpYxlFC65rn3ey47L4NNNMm/L/vZMYjF+MqzsPoCyTzHNpIaZU5l0
         Bcjwou8RwRiM1Z0/ZUl3zFR1ZaK0V2XSULY4kkF1iurrowajj/8/48573Vg8SwiFAKUG
         XP0tyFun813KwB0nwX0PBAXYD0bxI87VJqEMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714410306; x=1715015106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjIM1YsOHJSXus8VNmDaNi8MZ1j7PDi3kmS0uCHnMmg=;
        b=tnafVnCK4c7MSLehpSzK6bxJRyzXfaR6oSYdeQgjXywVzkFGRA/nw2UgrPMXXmeSdU
         depL03Hve4btU2fxgLjG8oza0Efc4ILysl6Yxux8G6Z7wow1843IxH3AZ/g3P6jYcAGb
         ENYFutQPwZKDI43cCuQtwPdyXFSRgZA4QO42wzytkkuLQRnI8Z/fmPpbYRhSw5Rxm29J
         ZJcVDpGBDA2ftez1wEga9hf2mj8r6/SLPCJEUhcPTDCLg98iCPxW0624eIPR9M4bwCRK
         sawgVyYebos/uQ4CLcqs/mAKI714QnjU6D9O5BtSoYw0ySvwiJ8ltFqwW0b+f4WCLxnu
         MV1g==
X-Forwarded-Encrypted: i=1; AJvYcCUAG5ZA7LnCRJjsoJvSgLUsLnE1xl+AMK6Ij5vje58De7FXKPLvQ6EVGO2dO1NjnIq9CGpbEOCIr++JIK/JnVBydQpM54bxU94dTdIHXw==
X-Gm-Message-State: AOJu0Yx0bZGwkqPt1uMMHPkyRGyXz5p68BoATGGDjBb616qeVbJ49wio
	rGlW4Br8ccQbyBg3nP+L7cqb7cYL52u8z+T2juT33xoA8CrjXOWYvWaSCP9KaQ==
X-Google-Smtp-Source: AGHT+IHFoa7yUHDaRgqu4l/JUQo/w0VQEfcK74Y0V+lFVzAsB35zJ7rZlOdiXClJHSoCrRrlV+IkTQ==
X-Received: by 2002:a5e:9246:0:b0:7de:a753:82b3 with SMTP id z6-20020a5e9246000000b007dea75382b3mr420256iop.15.1714410306525;
        Mon, 29 Apr 2024 10:05:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x71-20020a63864a000000b00606dd49d3b8sm9250880pgd.57.2024.04.29.10.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:05:04 -0700 (PDT)
Date: Mon, 29 Apr 2024 10:05:01 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] crypto/nx: Avoid potential
 -Wflex-array-member-not-at-end warning
Message-ID: <202404290947.4A8BF6A6@keescook>
References: <ZgHmRNcR+a4EJX94@neat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgHmRNcR+a4EJX94@neat>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 03:01:56PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
> ready to enable it globally.
> 
> Use the `__struct_group()` helper to separate the flexible array
> from the rest of the members in flexible `struct nx842_crypto_header`,
> through tagged `struct nx842_crypto_header_hdr`, and avoid embedding
> the flexible-array member in the middle of `struct nx842_crypto_ctx`.
> 
> Also, use `container_of()` whenever we need to retrieve a pointer to
> the flexible structure.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://github.com/KSPP/linux/issues/202
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/crypto/nx/nx-842.c |  6 ++++--
>  drivers/crypto/nx/nx-842.h | 11 +++++++----
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
> index 2ab90ec10e61..82214cde2bcd 100644
> --- a/drivers/crypto/nx/nx-842.c
> +++ b/drivers/crypto/nx/nx-842.c
> @@ -251,7 +251,9 @@ int nx842_crypto_compress(struct crypto_tfm *tfm,
>  			  u8 *dst, unsigned int *dlen)
>  {
>  	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
> -	struct nx842_crypto_header *hdr = &ctx->header;
> +	struct nx842_crypto_header *hdr =
> +				container_of(&ctx->header,
> +					     struct nx842_crypto_header, hdr);
>  	struct nx842_crypto_param p;
>  	struct nx842_constraints c = *ctx->driver->constraints;
>  	unsigned int groups, hdrsize, h;
> @@ -490,7 +492,7 @@ int nx842_crypto_decompress(struct crypto_tfm *tfm,
>  	}
>  
>  	memcpy(&ctx->header, src, hdr_len);
> -	hdr = &ctx->header;
> +	hdr = container_of(&ctx->header, struct nx842_crypto_header, hdr);
>  
>  	for (n = 0; n < hdr->groups; n++) {
>  		/* ignore applies to last group */
> diff --git a/drivers/crypto/nx/nx-842.h b/drivers/crypto/nx/nx-842.h
> index 7590bfb24d79..1f42c83d2683 100644
> --- a/drivers/crypto/nx/nx-842.h
> +++ b/drivers/crypto/nx/nx-842.h
> @@ -157,9 +157,12 @@ struct nx842_crypto_header_group {
>  } __packed;
>  
>  struct nx842_crypto_header {
> -	__be16 magic;		/* NX842_CRYPTO_MAGIC */
> -	__be16 ignore;		/* decompressed end bytes to ignore */
> -	u8 groups;		/* total groups in this header */
> +	/* New members must be added within the __struct_group() macro below. */
> +	__struct_group(nx842_crypto_header_hdr, hdr, __packed,
> +		__be16 magic;		/* NX842_CRYPTO_MAGIC */
> +		__be16 ignore;		/* decompressed end bytes to ignore */
> +		u8 groups;		/* total groups in this header */
> +	);
>  	struct nx842_crypto_header_group group[];
>  } __packed;
>  
> @@ -171,7 +174,7 @@ struct nx842_crypto_ctx {
>  	u8 *wmem;
>  	u8 *sbounce, *dbounce;
>  
> -	struct nx842_crypto_header header;
> +	struct nx842_crypto_header_hdr header;
>  	struct nx842_crypto_header_group group[NX842_CRYPTO_GROUP_MAX];
>  
>  	struct nx842_driver *driver;

Hmm. I think commit 03952d980153 ("crypto: nx - make platform drivers
directly register with crypto") incorrectly added "struct nx842_driver
*driver" to the end of struct nx842_crypto_ctx. I think it should be
before "header".

Then I see:

#define NX842_CRYPTO_HEADER_SIZE(g)                             \
        (sizeof(struct nx842_crypto_header) +                   \
         sizeof(struct nx842_crypto_header_group) * (g))

This is just struct_size(), really. And nothing uses:

#define NX842_CRYPTO_HEADER_MAX_SIZE                            \
        NX842_CRYPTO_HEADER_SIZE(NX842_CRYPTO_GROUP_MAX)

And then looking for what uses struct nx842_crypto_ctx's "group" member,
I don't see anything except some sizeof()s:

drivers/crypto/nx/nx-common-powernv.c:1044:     .cra_ctxsize = sizeof(struct nx842_crypto_ctx),
drivers/crypto/nx/nx-common-pseries.c:1021:     .cra_ctxsize = sizeof(struct nx842_crypto_ctx),

This is just a maximally sized ctx (as if the group count were
NX842_CRYPTO_GROUP_MAX), which we could use struct_size for again:

     .cra_ctxsize = struct_size_t(struct nx842_crypto_ctx, header.group,
				  NX842_CRYPTO_GROUP_MAX),

So then "group" can be entirely removed from struct nx842_crypto_ctx.

The result means we can also add __counted_by:


diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
index 2ab90ec10e61..144972fe2e6f 100644
--- a/drivers/crypto/nx/nx-842.c
+++ b/drivers/crypto/nx/nx-842.c
@@ -62,10 +62,7 @@
  */
 #define NX842_CRYPTO_MAGIC	(0xf842)
 #define NX842_CRYPTO_HEADER_SIZE(g)				\
-	(sizeof(struct nx842_crypto_header) +			\
-	 sizeof(struct nx842_crypto_header_group) * (g))
-#define NX842_CRYPTO_HEADER_MAX_SIZE				\
-	NX842_CRYPTO_HEADER_SIZE(NX842_CRYPTO_GROUP_MAX)
+	struct_size_t(nx842_crypto_header, group, g)
 
 /* bounce buffer size */
 #define BOUNCE_BUFFER_ORDER	(2)
diff --git a/drivers/crypto/nx/nx-842.h b/drivers/crypto/nx/nx-842.h
index 7590bfb24d79..70d9f99a4595 100644
--- a/drivers/crypto/nx/nx-842.h
+++ b/drivers/crypto/nx/nx-842.h
@@ -160,7 +160,7 @@ struct nx842_crypto_header {
 	__be16 magic;		/* NX842_CRYPTO_MAGIC */
 	__be16 ignore;		/* decompressed end bytes to ignore */
 	u8 groups;		/* total groups in this header */
-	struct nx842_crypto_header_group group[];
+	struct nx842_crypto_header_group group[] __counted_by(groups);
 } __packed;
 
 #define NX842_CRYPTO_GROUP_MAX	(0x20)
@@ -171,10 +171,9 @@ struct nx842_crypto_ctx {
 	u8 *wmem;
 	u8 *sbounce, *dbounce;
 
-	struct nx842_crypto_header header;
-	struct nx842_crypto_header_group group[NX842_CRYPTO_GROUP_MAX];
-
 	struct nx842_driver *driver;
+
+	struct nx842_crypto_header header;
 };
 
 int nx842_crypto_init(struct crypto_tfm *tfm, struct nx842_driver *driver);
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 8c859872c183..22ab4a5885f2 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -1041,7 +1041,8 @@ static struct crypto_alg nx842_powernv_alg = {
 	.cra_driver_name	= "842-nx",
 	.cra_priority		= 300,
 	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct nx842_crypto_ctx),
+	.cra_ctxsize		= struct_size_t(struct nx842_crypto_ctx, header.group,
+						NX842_CRYPTO_GROUP_MAX),
 	.cra_module		= THIS_MODULE,
 	.cra_init		= nx842_powernv_crypto_init,
 	.cra_exit		= nx842_crypto_exit,
diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 35f2d0d8507e..fdf328eab6fc 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -1018,7 +1018,8 @@ static struct crypto_alg nx842_pseries_alg = {
 	.cra_driver_name	= "842-nx",
 	.cra_priority		= 300,
 	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct nx842_crypto_ctx),
+	.cra_ctxsize		= struct_size_t(struct nx842_crypto_ctx, header.group,
+						NX842_CRYPTO_GROUP_MAX),
 	.cra_module		= THIS_MODULE,
 	.cra_init		= nx842_pseries_crypto_init,
 	.cra_exit		= nx842_crypto_exit,


-- 
Kees Cook
