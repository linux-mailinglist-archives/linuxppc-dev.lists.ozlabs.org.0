Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D50710135
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 00:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRRRd3JXfz3fBp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 08:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9yOyh8O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9yOyh8O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9yOyh8O;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9yOyh8O;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRRQ36pllz3fCD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 08:56:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684969001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2n57YKfPVwMrQwNDuZqoWvbyKlduQB03Z0HHDFLgso=;
	b=J9yOyh8Opr6L1J4tV2jo2VaKMXyscnFjP16sQNV6B1i8VH/zicUZ6QcRf+Q2BmANj6yAel
	792TS7oCQTtFGOCDF2Rjvnm09vHnvtxNoYMq7wv/w3JDI7apX1fHZH7iOAIgZ7rwNMstaE
	sKkQkMuwHO2mRllAGjA6EwcxJ9ZQ7Wo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684969001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2n57YKfPVwMrQwNDuZqoWvbyKlduQB03Z0HHDFLgso=;
	b=J9yOyh8Opr6L1J4tV2jo2VaKMXyscnFjP16sQNV6B1i8VH/zicUZ6QcRf+Q2BmANj6yAel
	792TS7oCQTtFGOCDF2Rjvnm09vHnvtxNoYMq7wv/w3JDI7apX1fHZH7iOAIgZ7rwNMstaE
	sKkQkMuwHO2mRllAGjA6EwcxJ9ZQ7Wo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-B2jMmOnWMzGrkcPGTQ642w-1; Wed, 24 May 2023 18:56:39 -0400
X-MC-Unique: B2jMmOnWMzGrkcPGTQ642w-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f39c562996so3469521cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 15:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684968999; x=1687560999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2n57YKfPVwMrQwNDuZqoWvbyKlduQB03Z0HHDFLgso=;
        b=AdJvrnPRGCE/JySZmMxFpq8t3eDI5kpe2ZgPFaBdVYYiSQiy1WAL4R1XcOyOSdQVIo
         er1DNUGpTxbH8+mm+Lsd2WhMCQ7UHrY7WO9m85qT2x5Rm1UEbTqFNjs1/8t8gVxkhdzJ
         ejIxA+fjDCOxSRM6G8BE3Ds1thiDttAst9eLRS2i6RmuMcIsLMlCbBnIcNeP02CuTeKs
         rKeQWML2u9F2/iQcXevOMOtZlqdiMAMiHKjPJmmi5AcPp7LHor6nwAh4eDvPlR++GLSy
         7x0Y+ZQ3qCWDNdfrt7hchMa+dHVIse17M/WQiLj2rFeM6LlySo2vxyGu/u0LpZ4V5Zrd
         xRUg==
X-Gm-Message-State: AC+VfDxBqKsU27o1ka1bL1BRxW3D6La7EGVycDaTJuxSGgPEZcREDajB
	27NofsefyfYrFLBbBZNyfby91Jb5Dy4PnB7IuyNAZJDiCv6jigFsjEZNFoQE+EXLz2BD4WYIAFm
	tvrqcQebqKs+sSmadBVjPaW0OVA==
X-Received: by 2002:a05:622a:1812:b0:3f7:f9c6:d33a with SMTP id t18-20020a05622a181200b003f7f9c6d33amr656001qtc.51.1684968999140;
        Wed, 24 May 2023 15:56:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CObucFQQ/UXbQ4sJujExv1d1biF4QFEW+6FEL2jpcT2X+WZhsbL2VOihUuYm6dAlnu94vPg==
X-Received: by 2002:a05:622a:1812:b0:3f7:f9c6:d33a with SMTP id t18-20020a05622a181200b003f7f9c6d33amr655981qtc.51.1684968998843;
        Wed, 24 May 2023 15:56:38 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id w1-20020ac84d01000000b003f6b58b986fsm2303178qtv.41.2023.05.24.15.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 15:56:38 -0700 (PDT)
Date: Wed, 24 May 2023 15:56:37 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 2/4] tpm: of: Make of-tree specific function commonly
 available
Message-ID: <e4dcxwp63uisirxwanjwrhzrnve45wqnxhijfp4oq274r4neco@v2btoy43ue5h>
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
 <20230418134409.177485-3-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230418134409.177485-3-stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: devicetree@vger.kernel.org, Coiby Xu <coxu@redhat.com>, Frank Rowand <frowand.list@gmail.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 18, 2023 at 09:44:07AM -0400, Stefan Berger wrote:
> Simplify tpm_read_log_of() by moving reusable parts of the code into
> an inline function that makes it commonly available so it can be
> used also for kexec support. Call the new of_tpm_get_sml_parameters()
> function from the TPM Open Firmware driver.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Tested-by: Coiby Xu <coxu@redhat.com>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> ---
> v9:
>  - Rebased on 6.3-rc7; call tpm_read_log_memory_region if -ENODEV returned
> 
> v7:
>  - Added original comment back into inlined function
> 
> v4:
>  - converted to inline function
> ---
>  drivers/char/tpm/eventlog/of.c | 30 +++++-----------------------
>  include/linux/tpm.h            | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
> index 930fe43d5daf..41688d9cbd3b 100644
> --- a/drivers/char/tpm/eventlog/of.c
> +++ b/drivers/char/tpm/eventlog/of.c
> @@ -51,11 +51,10 @@ static int tpm_read_log_memory_region(struct tpm_chip *chip)
>  int tpm_read_log_of(struct tpm_chip *chip)
>  {
>  	struct device_node *np;
> -	const u32 *sizep;
> -	const u64 *basep;
>  	struct tpm_bios_log *log;
>  	u32 size;
>  	u64 base;
> +	int ret;
>  
>  	log = &chip->log;
>  	if (chip->dev.parent && chip->dev.parent->of_node)
> @@ -66,30 +65,11 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	if (of_property_read_bool(np, "powered-while-suspended"))
>  		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
>  
> -	sizep = of_get_property(np, "linux,sml-size", NULL);
> -	basep = of_get_property(np, "linux,sml-base", NULL);
> -	if (sizep == NULL && basep == NULL)
> +	ret = of_tpm_get_sml_parameters(np, &base, &size);
> +	if (ret == -ENODEV)
>  		return tpm_read_log_memory_region(chip);
> -	if (sizep == NULL || basep == NULL)
> -		return -EIO;
> -
> -	/*
> -	 * For both vtpm/tpm, firmware has log addr and log size in big
> -	 * endian format. But in case of vtpm, there is a method called
> -	 * sml-handover which is run during kernel init even before
> -	 * device tree is setup. This sml-handover function takes care
> -	 * of endianness and writes to sml-base and sml-size in little
> -	 * endian format. For this reason, vtpm doesn't need conversion
> -	 * but physical tpm needs the conversion.
> -	 */
> -	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
> -	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
> -		size = be32_to_cpup((__force __be32 *)sizep);
> -		base = be64_to_cpup((__force __be64 *)basep);
> -	} else {
> -		size = *sizep;
> -		base = *basep;
> -	}
> +	if (ret < 0)
> +		return ret;
>  
>  	if (size == 0) {
>  		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 4dc97b9f65fb..dd9a376a1dbb 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -461,4 +461,40 @@ static inline struct tpm_chip *tpm_default_chip(void)
>  	return NULL;
>  }
>  #endif
> +
> +#ifdef CONFIG_OF
> +static inline int of_tpm_get_sml_parameters(struct device_node *np,
> +					    u64 *base, u32 *size)
> +{
> +	const u32 *sizep;
> +	const u64 *basep;
> +
> +	sizep = of_get_property(np, "linux,sml-size", NULL);
> +	basep = of_get_property(np, "linux,sml-base", NULL);
> +	if (sizep == NULL && basep == NULL)
> +		return -ENODEV;
> +	if (sizep == NULL || basep == NULL)
> +		return -EIO;
> +
> +	/*
> +	 * For both vtpm/tpm, firmware has log addr and log size in big
> +	 * endian format. But in case of vtpm, there is a method called
> +	 * sml-handover which is run during kernel init even before
> +	 * device tree is setup. This sml-handover function takes care
> +	 * of endianness and writes to sml-base and sml-size in little
> +	 * endian format. For this reason, vtpm doesn't need conversion
> +	 * but physical tpm needs the conversion.
> +	 */
> +	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
> +	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
> +		*size = be32_to_cpup((__force __be32 *)sizep);
> +		*base = be64_to_cpup((__force __be64 *)basep);
> +	} else {
> +		*size = *sizep;
> +		*base = *basep;
> +	}
> +	return 0;
> +}
> +#endif
> +
>  #endif
> -- 
> 2.38.1
> 

