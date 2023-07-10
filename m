Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6C74E030
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 23:24:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLJjZ4pv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0H8N4Wpkz3bvy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 07:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLJjZ4pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0H7T0NWMz30hb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 07:24:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73BD0611FD;
	Mon, 10 Jul 2023 21:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F44DC433C7;
	Mon, 10 Jul 2023 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689024239;
	bh=lDw1ExiH+Whxam+AqBrwnVVup+GCL2uKh0YhiWYOxTE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bLJjZ4pvNpX966h5Q7RJvH0NYfyJeJujdzjIm7s3Nz3q0763j95raEV0IUq5aQBZ2
	 hR/iPVxVUAr5e6U0FwG9TSiTS4s/a7EU/evzkflXyvbFolwO/vXobSKKq/H0zC+e3z
	 7WJSFkbioZZ5LbPJaZ611SlonpoQedbt3MJ53+cK1/XO0hk4J+S9nPw2lWCrLcbfs6
	 zCmajxc5K307xEtuUz7TgbAdU2l99nZY5RdVz1h+/ULGWuSKaoHJ/HJeTOqnTHlBSN
	 MVhnliEyUvvOIbY64etNHYcaemtCCqNVpy17MxAw4DKQrZYFGCedn30c6ucMMmpXLS
	 UHQq57iYBDjvQ==
Message-ID: <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big
 endian
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 11 Jul 2023 00:23:55 +0300
In-Reply-To: <20230615123703.4028156-1-mpe@ellerman.id.au>
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, peterhuewe@gmx.de, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-06-15 at 22:37 +1000, Michael Ellerman wrote:
> There's code in prom_instantiate_sml() to do a "SML handover" (Stored
> Measurement Log) from OF to Linux, before Linux shuts down Open
> Firmware.
>=20
> This involves creating a buffer to hold the SML, and creating two device
> tree properties to record its base address and size. The kernel then
> later reads those properties from the device tree to find the SML.
>=20
> When the code was initially added in commit 4a727429abec ("PPC64: Add
> support for instantiating SML from Open Firmware") the powerpc kernel
> was always built big endian, so the properties were created big endian
> by default.
>=20
> However since then little endian support was added to powerpc, and now
> the code lacks conversions to big endian when creating the properties.
>=20
> This means on little endian kernels the device tree properties are
> little endian, which is contrary to the device tree spec, and in
> contrast to all other device tree properties.
>=20
> To cope with that a workaround was added in tpm_read_log_of() to skip
> the endian conversion if the properties were created via the SML
> handover.
>=20
> A better solution is to encode the properties as big endian as they
> should be, and remove the workaround.
>=20
> Typically changing the encoding of a property like this would present
> problems for kexec. However the SML is not propagated across kexec, so
> changing the encoding of the properties is a non-issue.
>=20
> Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM =
event log")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom_init.c |  8 ++++++--
>  drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
>  2 files changed, 10 insertions(+), 21 deletions(-)

Split into two patches (producer and consumer).

BR, Jarkko

>=20
> v2: Add Stefan's reviewed-by.
>=20
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index d464ba412084..72fe306b6820 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1900,6 +1900,7 @@ static void __init prom_instantiate_sml(void)
>  	u32 entry =3D 0, size =3D 0, succ =3D 0;
>  	u64 base;
>  	__be32 val;
> +	__be64 val64;
> =20
>  	prom_debug("prom_instantiate_sml: start...\n");
> =20
> @@ -1956,10 +1957,13 @@ static void __init prom_instantiate_sml(void)
> =20
>  	reserve_mem(base, size);
> =20
> +	val64 =3D cpu_to_be64(base);
>  	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
> -		     &base, sizeof(base));
> +		     &val64, sizeof(val64));
> +
> +	val =3D cpu_to_be32(size);
>  	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
> -		     &size, sizeof(size));
> +		     &val, sizeof(val));
> =20
>  	prom_debug("sml base     =3D 0x%llx\n", base);
>  	prom_debug("sml size     =3D 0x%x\n", size);
> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/o=
f.c
> index 930fe43d5daf..0bc0cb6333c6 100644
> --- a/drivers/char/tpm/eventlog/of.c
> +++ b/drivers/char/tpm/eventlog/of.c
> @@ -51,8 +51,8 @@ static int tpm_read_log_memory_region(struct tpm_chip *=
chip)
>  int tpm_read_log_of(struct tpm_chip *chip)
>  {
>  	struct device_node *np;
> -	const u32 *sizep;
> -	const u64 *basep;
> +	const __be32 *sizep;
> +	const __be64 *basep;
>  	struct tpm_bios_log *log;
>  	u32 size;
>  	u64 base;
> @@ -73,23 +73,8 @@ int tpm_read_log_of(struct tpm_chip *chip)
>  	if (sizep =3D=3D NULL || basep =3D=3D NULL)
>  		return -EIO;
> =20
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
> -		size =3D be32_to_cpup((__force __be32 *)sizep);
> -		base =3D be64_to_cpup((__force __be64 *)basep);
> -	} else {
> -		size =3D *sizep;
> -		base =3D *basep;
> -	}
> +	size =3D be32_to_cpup(sizep);
> +	base =3D be64_to_cpup(basep);
> =20
>  	if (size =3D=3D 0) {
>  		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);

