Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096C8757B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 20:58:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rgt1cBUs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrKq31JwBz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rgt1cBUs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrKpL5Z4mz3bnc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 06:57:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BDE60CE24ED;
	Thu,  7 Mar 2024 19:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4858FC433F1;
	Thu,  7 Mar 2024 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709841448;
	bh=fOsKn2f9zmPGdpFx8KnXbnRFneCgwvg7ZyYzVHMdDUQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Rgt1cBUsraDPPk+fgftIJwCdAGYpX0MO1sI2vhONF8NqS0poeL5TMd/ZfmmyC48Vu
	 KCcSkw/FZSRWxbcxLewqonJaQYViDP2xI7+SDf9GuxSJnQydNWCRIWOwGlmAylkWVY
	 QADULHnRfDANW6HA8eCzAyjhDCmYTRetwPZ0K/TGXv4907WA0b7NXb+xcp5hBh1oPt
	 vsNfmGjUmNAy558xV2ABlZkTsZqSEBtAcEbH9qF1fF6mkfEKC5BoeGlWq/lZGwZzlv
	 thYRCZY3VuEuDC4WHb7h7nBWE2BVbL/p1aaVNDlYKHUawdPCXDiTTCb38sRb0GmIDX
	 ZBkRamVC2ULYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Mar 2024 21:57:24 +0200
Message-Id: <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
In-Reply-To: <20240306155511.974517-3-stefanb@linux.ibm.com>
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
Cc: peterhuewe@gmx.de, viparash@in.ibm.com, linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

in short summary: s/Use/use/

On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
> If linux,sml-log is available use it to get the TPM log rather than the
> pointer found in linux,sml-base. This resolves an issue on PowerVM and KV=
M
> on Power where after a kexec the memory pointed to by linux,sml-base may
> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
> linux,sml-size on these two platforms.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

So shouldn't this have a fixed tag, or not?

> ---
>  drivers/char/tpm/eventlog/of.c | 36 +++++++++++-----------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/o=
f.c
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
> =20
>  	log =3D &chip->log;
>  	if (chip->dev.parent && chip->dev.parent->of_node)
> @@ -66,37 +66,23 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	if (of_property_read_bool(np, "powered-while-suspended"))
>  		chip->flags |=3D TPM_CHIP_FLAG_ALWAYS_POWERED;
> =20
> -	sizep =3D of_get_property(np, "linux,sml-size", NULL);
> -	basep =3D of_get_property(np, "linux,sml-base", NULL);
> -	if (sizep =3D=3D NULL && basep =3D=3D NULL)
> -		return tpm_read_log_memory_region(chip);
> -	if (sizep =3D=3D NULL || basep =3D=3D NULL)
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
> +	logp =3D of_get_property(np, "linux,sml-log", &size);
> +	if (logp =3D=3D NULL) {
> +		sizep =3D of_get_property(np, "linux,sml-size", NULL);
> +		basep =3D of_get_property(np, "linux,sml-base", NULL);
> +		if (sizep =3D=3D NULL && basep =3D=3D NULL)
> +			return tpm_read_log_memory_region(chip);
> +		if (sizep =3D=3D NULL || basep =3D=3D NULL)
> +			return -EIO;
> +		logp =3D __va(be64_to_cpup((__force __be64 *)basep));
>  		size =3D be32_to_cpup((__force __be32 *)sizep);
> -		base =3D be64_to_cpup((__force __be64 *)basep);
> -	} else {
> -		size =3D *sizep;
> -		base =3D *basep;
>  	}
> -
>  	if (size =3D=3D 0) {
>  		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
>  		return -EIO;
>  	}
> =20
> -	log->bios_event_log =3D devm_kmemdup(&chip->dev, __va(base), size, GFP_=
KERNEL);
> +	log->bios_event_log =3D devm_kmemdup(&chip->dev, logp, size, GFP_KERNEL=
);
>  	if (!log->bios_event_log)
>  		return -ENOMEM;
> =20

Looks pretty good other than that.

BR, Jarkko
