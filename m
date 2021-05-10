Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD548377B6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdpzs1hWXz308M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:11:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rpayvgMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rpayvgMn; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdpzH5r5xz2yXH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 15:10:34 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so9358335pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 22:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FxTICue1UIi0l6FvFNJ5xfSFW4OZSuAmCKdc+189Vu8=;
 b=rpayvgMn/iMHyrkg9plXID9RHfmhhzy/hogrG5VatmdYKKzCr1HXTQOiQ1q5txV0pa
 Sc7N+ZdtjmPrBKIhBCjm41F25UMvHXtg+SQkeHih7heedANMJaX0jiGM0c6vcDVsnyGJ
 oUbe0N24XEX+x7niTeqFqNT1CBd14EIzPOZkwmsYfIA0YGDYtWiM8pTPwwCv7J2Kam0M
 Qf/DPs4TX1FO824RBffHYIafz5bpJuZxuOnUSF4UZS2PgE72C28Z/txWwQ64I45dOpj9
 X8KdxWzTup6+QUYEoUkzowwIAWkVuNbPplxFmIztHPtlHB0R7SmovF2WTmUdkJK3Cum6
 0iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FxTICue1UIi0l6FvFNJ5xfSFW4OZSuAmCKdc+189Vu8=;
 b=Gert/lbETYC/V9dO9tbbozlQI7fhZLn+5jejZPa8wI1/n229O2og62UMHL85ro1yqC
 4CkTBPPH6T4adB3KntWqzS2bJSjHCzkPgGL4Pie8yJYBk1dyZf6A4A8pFphD6Ypzf72/
 u7iBSKhgd+9v9FyYpyvoTw650dMePf7vRGAoOHC9+Nbc89a+T9xHEO24RV83TMwgwiCm
 XNrxFXx2fSkq+ArgZi1lsEhxEb0lSyZJ1SgoBxhnhXVh/QXuPpmauElxwiMrMv1ucPcD
 zYY9tiAsrNdgOLbyTk+ps5M/WIIulMOKO5S/jvZmkbuKDdLAnhxyd+aDvDtaxZtuxHQH
 CM2Q==
X-Gm-Message-State: AOAM531XeJwhSpFQJ3LDIlRhKaTosD863IdI4m6T2zsnX6d8LABx4Du/
 pU2hv80J9725wgonKWXWnA4=
X-Google-Smtp-Source: ABdhPJzhQ94aOySpS7UxrylGMNA4QpqH5/L0J3s6QpGxSCqgmoNNbWWG6x4yq8NgJsRrBOLzhjleZw==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id
 w15-20020a170902a70fb02900ead4a86a84mr23193876plq.42.1620623430168; 
 Sun, 09 May 2021 22:10:30 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id k14sm10046982pgl.2.2021.05.09.22.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:10:29 -0700 (PDT)
Date: Mon, 10 May 2021 15:10:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 01/16] powerpc/powernv/vas: Rename register/unregister
 functions
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <86bae80a92b8465d663f72e7fadc1fa3671e8a4f.camel@linux.ibm.com>
In-Reply-To: <86bae80a92b8465d663f72e7fadc1fa3671e8a4f.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620622742.tr9lqg4vzz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of April 18, 2021 7:00 am:
>=20
> powerNV and pseries drivers register / unregister to the corresponding
> VAS code separately. So rename powerNV VAS API register/unregister
> functions.

The pseries VAS driver will have different calls for registering a
coprocessor driver, you mean?

It certainly looks the same=20

(from patch 13)
	ret =3D vas_register_api_pseries(THIS_MODULE, VAS_COP_TYPE_GZIP,
				       "nx-gzip");

So I guess it's just a matter of the driver being different enough that=20
there is no benefit to making this call common (and branching to pseries
or powernv dynamically).

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h           |  6 +++---
>  arch/powerpc/platforms/powernv/vas-api.c | 10 +++++-----
>  drivers/crypto/nx/nx-common-powernv.c    |  6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index e33f80b0ea81..41f73fae7ab8 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -170,8 +170,8 @@ int vas_paste_crb(struct vas_window *win, int offset,=
 bool re);
>   * Only NX GZIP coprocessor type is supported now, but this API can be
>   * used for others in future.
>   */
> -int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> -				const char *name);
> -void vas_unregister_coproc_api(void);
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> +			     const char *name);
> +void vas_unregister_api_powernv(void);
> =20
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/plat=
forms/powernv/vas-api.c
> index 98ed5d8c5441..72d8ce39e56c 100644
> --- a/arch/powerpc/platforms/powernv/vas-api.c
> +++ b/arch/powerpc/platforms/powernv/vas-api.c
> @@ -207,8 +207,8 @@ static struct file_operations coproc_fops =3D {
>   * Supporting only nx-gzip coprocessor type now, but this API code
>   * extended to other coprocessor types later.
>   */
> -int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> -				const char *name)
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> +			     const char *name)
>  {
>  	int rc =3D -EINVAL;
>  	dev_t devno;
> @@ -262,9 +262,9 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  	unregister_chrdev_region(coproc_device.devt, 1);
>  	return rc;
>  }
> -EXPORT_SYMBOL_GPL(vas_register_coproc_api);
> +EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> =20
> -void vas_unregister_coproc_api(void)
> +void vas_unregister_api_powernv(void)
>  {
>  	dev_t devno;
> =20
> @@ -275,4 +275,4 @@ void vas_unregister_coproc_api(void)
>  	class_destroy(coproc_device.class);
>  	unregister_chrdev_region(coproc_device.devt, 1);
>  }
> -EXPORT_SYMBOL_GPL(vas_unregister_coproc_api);
> +EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx=
-common-powernv.c
> index 13c65deda8e9..88d728415bb2 100644
> --- a/drivers/crypto/nx/nx-common-powernv.c
> +++ b/drivers/crypto/nx/nx-common-powernv.c
> @@ -1090,8 +1090,8 @@ static __init int nx_compress_powernv_init(void)
>  		 * normal FIFO priority is assigned for userspace.
>  		 * 842 compression is supported only in kernel.
>  		 */
> -		ret =3D vas_register_coproc_api(THIS_MODULE, VAS_COP_TYPE_GZIP,
> -						"nx-gzip");
> +		ret =3D vas_register_api_powernv(THIS_MODULE, VAS_COP_TYPE_GZIP,
> +					       "nx-gzip");
> =20
>  		/*
>  		 * GZIP is not supported in kernel right now.
> @@ -1127,7 +1127,7 @@ static void __exit nx_compress_powernv_exit(void)
>  	 * use. So delete this API use for GZIP engine.
>  	 */
>  	if (!nx842_ct)
> -		vas_unregister_coproc_api();
> +		vas_unregister_api_powernv();
> =20
>  	crypto_unregister_alg(&nx842_powernv_alg);
> =20
> --=20
> 2.18.2
>=20
>=20
>=20
