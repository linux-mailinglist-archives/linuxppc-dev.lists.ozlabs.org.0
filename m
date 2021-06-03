Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376239994D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwYKn6jYvz2yxX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ciYmpOGY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ciYmpOGY; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwYKM48t3z2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:47:18 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id j12so4174630pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5BxQCzlM1E2ndPb7NDda4MnVd7oyXumKn79J+591Mjs=;
 b=ciYmpOGYU6wkezLHGPUp1EdmFDk+UVzBngVaYTGsZdWHpyK5bVnh7uGgaWgsqyEx32
 7VLV9Ry/Z94yrhovcdZ6OizedEAfKywyqHDi8hH40z/AfKnUKRMMrlnzgwsyPYY3Mpe0
 NwzM/uDDA1UtzZ3Y6fKZ9CcSQjcw4BZnEirVv0dPHIbvk1WZTj8DIWSZGaJ0d4aIqN5c
 XiSzx/v0KI3xBg3B9juzifI9eHjWOQDaTdjDj8m/fH2MwkzcRyBecBazCFtCIgvovt2x
 GxVJoIdCxl9mu87Nv4MU8b88Z30AhqTaXW4R8S1T7m6hQIReC2YlgbxWbI5XGL5nLAzN
 fFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5BxQCzlM1E2ndPb7NDda4MnVd7oyXumKn79J+591Mjs=;
 b=qH52N92q26ftYMZzPb8/n63F2DZowqg3NTuUYn7lHLiihFWyQSfCEfUVRL882Djb+f
 gaAjV2C0qOfp4oBpPnlxEU+4RaeuIxQ0QnS21dvnGtZyi9EyhPh5Ck+NnJfFexdFDA48
 9qHo6rJc/uSN7h5SwMshlGFONz5LGcQt8g1AZm5NMMICT8fc31erRThLc/Q/Qkhh/d+m
 YlQ4tFsx7FToPK/Mgo0RZV7EMovTj/yVmXMT+FrmuiyYlV6tAOwKzUgcisFtKKZn9HXP
 I+dSry6nmt1IVkhIdGhtkHadEvQnJ5oTRw1uuDquoE7aOLudqCeB8eSyGcrYLTdCZeTQ
 GGIg==
X-Gm-Message-State: AOAM530C2iXS0MFwy462ywBUMkcyrkqS3HqdI6A/9OzageysFpxjQxIx
 IWFiyFNuX69FMIKyZtN/rSY=
X-Google-Smtp-Source: ABdhPJxRvuhsr8GUvnRhzQ/mKC8d6yh4IoLE5FRb7PJfWhuJaVfDsm2vhoq6hnVJXmIBC0ahFepX3w==
X-Received: by 2002:a63:fe53:: with SMTP id x19mr37866486pgj.372.1622695634534; 
 Wed, 02 Jun 2021 21:47:14 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id j17sm998721pff.77.2021.06.02.21.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:47:14 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:47:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 07/16] powerpc/pseries/vas: Define VAS/NXGZIP HCALLs
 and structs
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <4d1a19311883c2ac6620633721ecc81d753f26c8.camel@linux.ibm.com>
In-Reply-To: <4d1a19311883c2ac6620633721ecc81d753f26c8.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622695206.q32wg4puuh.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:34 pm:
>=20
> This patch adds HCALLs and other definitions. Also define structs
> that are used in VAS implementation on powerVM.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h    |   7 ++
>  arch/powerpc/include/asm/vas.h       |  32 ++++++++
>  arch/powerpc/platforms/pseries/vas.h | 110 +++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/vas.h
>=20
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index e3b29eda8074..7c3418d1b5e9 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -294,6 +294,13 @@
>  #define H_RESIZE_HPT_COMMIT	0x370
>  #define H_REGISTER_PROC_TBL	0x37C
>  #define H_SIGNAL_SYS_RESET	0x380
> +#define H_ALLOCATE_VAS_WINDOW	0x388
> +#define H_MODIFY_VAS_WINDOW	0x38C
> +#define H_DEALLOCATE_VAS_WINDOW	0x390
> +#define H_QUERY_VAS_WINDOW	0x394
> +#define H_QUERY_VAS_CAPABILITIES	0x398
> +#define H_QUERY_NX_CAPABILITIES	0x39C
> +#define H_GET_NX_FAULT		0x3A0
>  #define H_INT_GET_SOURCE_INFO   0x3A8
>  #define H_INT_SET_SOURCE_CONFIG 0x3AC
>  #define H_INT_GET_SOURCE_CONFIG 0x3B0
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 49bfb5be896d..371f62d99174 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -181,6 +181,7 @@ struct vas_tx_win_attr {
>  	bool rx_win_ord_mode;
>  };
> =20
> +#ifdef CONFIG_PPC_POWERNV
>  /*
>   * Helper to map a chip id to VAS id.
>   * For POWER9, this is a 1:1 mapping. In the future this maybe a 1:N
> @@ -248,6 +249,37 @@ void vas_win_paste_addr(struct vas_window *window, u=
64 *addr,
>  int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
>  			     const char *name);
>  void vas_unregister_api_powernv(void);
> +#endif
> +
> +#ifdef CONFIG_PPC_PSERIES
> +
> +/* VAS Capabilities */
> +#define VAS_GZIP_QOS_FEAT	0x1
> +#define VAS_GZIP_DEF_FEAT	0x2
> +#define VAS_GZIP_QOS_FEAT_BIT	PPC_BIT(VAS_GZIP_QOS_FEAT) /* Bit 1 */
> +#define VAS_GZIP_DEF_FEAT_BIT	PPC_BIT(VAS_GZIP_DEF_FEAT) /* Bit 2 */
> +
> +/* NX Capabilities */
> +#define VAS_NX_GZIP_FEAT	0x1
> +#define VAS_NX_GZIP_FEAT_BIT	PPC_BIT(VAS_NX_GZIP_FEAT) /* Bit 1 */
> +#define VAS_DESCR_LEN		8
> +
> +/*
> + * These structs are used to retrieve overall VAS capabilities that
> + * the hypervisor provides.
> + */
> +struct hv_vas_all_caps {

...

> +
> +/*
> + * Use to get feature specific capabilities from the
> + * hypervisor.
> + */
> +struct hv_vas_ct_caps {

...

> +/*
> + * To get window information from the hypervisor.
> + */
> +struct hv_vas_win_lpar {

Are any of these names coming from PAPR? If not, then typically we don't=20
use hv_ kind of prefixes for something we got from the hypervisor, but
rather something that's hypervisor privileged or specific information
about the hypervisor perhaps (which is not the same as what the=20
hypervisor may or may not advertise to the guest).

So if these are all capabilities and features the hypervisor advertises=20
to the LPAR, I think the hv_ should be dropped.

Otherwise seems okay. I would be careful of the "lpar" name. I think=20
it's okay in this situation where the hypervisor advertises features to=20
the partition, but in other parts of the vas code you call it pseries_
but you also have some lpar_ bits. So aside from interacting with PAPR
APIs, it would be safe to consistently use pseries for your driver and
type names.

Thanks,
Nick
