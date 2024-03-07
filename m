Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BBD874C98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 11:43:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j3d6lXvV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr5WD2nGqz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:43:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j3d6lXvV;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr5VW4sFGz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 21:42:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709808179;
	bh=n2ytiXy/cOBqbalFRjKMCH5OjNyLPK7yYYtLR63RUQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j3d6lXvVCjSk1BbL2xjlLEbggHGj43NU059UJm8xatyxJ2936ae3iw+QQ2kQk6O22
	 X6LIAH8VDkCiOxRLL89effirAyJRaajMXYo+SVTPHWSTE7jKsACiPPCfOjO6/4T094
	 tiNwuRRIomeAFeQahRrJt8byYUrtAFGURio6OM9op33K8jEnstPmhAt/0EIwQ8eFbi
	 k5GEOAYqA3Zl3aWkY65zyAH8x915ikrFpymnvOWLvpJtlI7qLyWLflAsL2Uqfcz0wR
	 lErQQ/bTEUmn5DUV38f11sRmPZay1WZPp3JKS63aGsb4R6P+CWXUMd6/3OfyOcYLk4
	 hjKUL6+bfeqHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr5VW28Wcz4wc7;
	Thu,  7 Mar 2024 21:42:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stefan Berger <stefanb@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
In-Reply-To: <20240306155511.974517-3-stefanb@linux.ibm.com>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
Date: Thu, 07 Mar 2024 21:42:59 +1100
Message-ID: <87h6hinwzw.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> If linux,sml-log is available use it to get the TPM log rather than the
> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
> on Power where after a kexec the memory pointed to by linux,sml-base may
> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
> linux,sml-size on these two platforms.

It would be good to mention that powernv platforms (sometimes called
Open Power or bare metal) still use linux,sml-base/size, via skiboot.

cheers

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/eventlog/of.c | 36 +++++++++++-----------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
> index 930fe43d5daf..e37196e64ef1 100644
> --- a/drivers/char/tpm/eventlog/of.c
> +++ b/drivers/char/tpm/eventlog/of.c
> @@ -54,8 +54,8 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	const u32 *sizep;
>  	const u64 *basep;
>  	struct tpm_bios_log *log;
> +	const void *logp;
>  	u32 size;
> -	u64 base;
>  
>  	log = &chip->log;
>  	if (chip->dev.parent && chip->dev.parent->of_node)
> @@ -66,37 +66,23 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	if (of_property_read_bool(np, "powered-while-suspended"))
>  		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
>  
> -	sizep = of_get_property(np, "linux,sml-size", NULL);
> -	basep = of_get_property(np, "linux,sml-base", NULL);
> -	if (sizep == NULL && basep == NULL)
> -		return tpm_read_log_memory_region(chip);
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
> +	logp = of_get_property(np, "linux,sml-log", &size);
> +	if (logp == NULL) {
> +		sizep = of_get_property(np, "linux,sml-size", NULL);
> +		basep = of_get_property(np, "linux,sml-base", NULL);
> +		if (sizep == NULL && basep == NULL)
> +			return tpm_read_log_memory_region(chip);
> +		if (sizep == NULL || basep == NULL)
> +			return -EIO;
> +		logp = __va(be64_to_cpup((__force __be64 *)basep));
>  		size = be32_to_cpup((__force __be32 *)sizep);
> -		base = be64_to_cpup((__force __be64 *)basep);
> -	} else {
> -		size = *sizep;
> -		base = *basep;
>  	}
> -
>  	if (size == 0) {
>  		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
>  		return -EIO;
>  	}
>  
> -	log->bios_event_log = devm_kmemdup(&chip->dev, __va(base), size, GFP_KERNEL);
> +	log->bios_event_log = devm_kmemdup(&chip->dev, logp, size, GFP_KERNEL);
>  	if (!log->bios_event_log)
>  		return -ENOMEM;
>  
> -- 
> 2.43.0
