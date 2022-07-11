Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66356D212
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 02:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh3wJ69Lfz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 10:02:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TM0tqX+W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TM0tqX+W;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh3vj40N7z3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 10:01:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 67CFDB80C6A;
	Mon, 11 Jul 2022 00:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C12FC3411E;
	Mon, 11 Jul 2022 00:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657497691;
	bh=TlKLPcBbz3RbDuAHDfDGZpSXrFAFDL26YjdPaucaCzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TM0tqX+WVO1YhtmTQj6f3/iwtJ9vXQmF/+f23nkkdRjQm/qtjCTQE5K0/ykfIyDWz
	 m462R4ubh/OY87QYnG0uWBV/1gTLLlqsQtRg2gd+80nU5nyvYYGMc1dFoahy1XtsDv
	 GomSv43YdZTK/luiQlUzKeAYIC14VaQGNT14BMhNDwDSM6dVEIFBxbXhqsZhcDFXJW
	 d+LWMuuPK7ZvTaUwyYREKLvPsN93GRqjaLwJ0q622KKFzCMTVJNHyBLc2ZpH2Sns0J
	 QGe4GQeA3z6pVIBMoavuGt9IG2lvU9YKLXCYa82ESk3AsXkbPyH87XFvs6wYXWU5yK
	 VEw30aJNXttSQ==
Date: Mon, 11 Jul 2022 03:01:25 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 3/5] tpm: of: Make of-tree specific function commonly
 available
Message-ID: <YstoVXqxE8IguTpT@kernel.org>
References: <20220701022603.31076-1-stefanb@linux.ibm.com>
 <20220701022603.31076-4-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701022603.31076-4-stefanb@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 10:26:01PM -0400, Stefan Berger wrote:
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
> 
> ---
> v4:
>  - converted to inline function
> ---
>  drivers/char/tpm/eventlog/of.c | 31 +++++--------------------------
>  include/linux/tpm.h            | 27 +++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
> index a9ce66d09a75..f9462d19632e 100644
> --- a/drivers/char/tpm/eventlog/of.c
> +++ b/drivers/char/tpm/eventlog/of.c
> @@ -12,6 +12,7 @@
>  
>  #include <linux/slab.h>
>  #include <linux/of.h>
> +#include <linux/tpm.h>
>  #include <linux/tpm_eventlog.h>
>  
>  #include "../tpm.h"
> @@ -20,11 +21,10 @@
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
> @@ -35,30 +35,9 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	if (of_property_read_bool(np, "powered-while-suspended"))
>  		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
>  
> -	sizep = of_get_property(np, "linux,sml-size", NULL);
> -	basep = of_get_property(np, "linux,sml-base", NULL);
> -	if (sizep == NULL && basep == NULL)
> -		return -ENODEV;
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
> +	ret = of_tpm_get_sml_parameters(np, &base, &size);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (size == 0) {
>  		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index dfeb25a0362d..b3dff255bc58 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -460,4 +460,31 @@ static inline struct tpm_chip *tpm_default_chip(void)
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
> 2.35.1
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
