Return-Path: <linuxppc-dev+bounces-1326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FD9780CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 15:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4vtq3MV2z2y8k;
	Fri, 13 Sep 2024 23:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726233331;
	cv=none; b=d0G4FnPlTs96p6OgpLVMpdBL1Vl5+T+jCXiebyT5KXQW8j8xWYXOS0+YLkRjfe71b8mXH66H8Sa3SQOszwB6X2jCdN+3egsqMPS5WUcbZtqO0Negh3/OTPEISJIGHJUcxH0WbOnQVjnJRZfNPKMnNnVmfJYdIKqwi1Jf9VfdmeEGQkjmwLl6OEDwDgesRVZ25fODh0V2W+773HGzcoGiMpeP7+QCloQWwDATMxpMQqaT0vfHYeZV90N0TRgyjr02JGp+/DB+jiQLdNg+2ITxajEC/42TQFDLx8Wj9vnMWjim1fjfH7WmTDoBDnYBQt4Brhk90GRpWbVtgITRkhsjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726233331; c=relaxed/relaxed;
	bh=nt0wBmAol6tMoem7ESVcPxXpXMmwnfJWNcB17dRflFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P3krV0m2AUYAqDfrLsQTpI8qAQP8+vLMWMAdn/W9H0S5u00ipQVwayreKbKlqgTyPXSHv1e0WclQYDomAOffmuQwmoVM6OLz78CZ6FS1e3wtk0nL2u0wh1TPYflscB9FLRaP5Zs25phRRMpXiPHeOxzjD7cLWF7ou968PxArNoWvUT5da1Mvq7q/d1eiNRUzTfVqrh63ArlOysDY/SuAqOkaMHQaQ3ipczrK9qpm1sSCxSqfS/OY+/igBmcZiaU/WmDTtJAramsjwlkJL9+G996S+c4U9gWEVK05wG5GSzLXPIrmjRhtFxt5S4OyoB6AuLGjhk4aGXyf87fohipUdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VMCMGf41; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VMCMGf41;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4vtn5hKnz2y8h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 23:15:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726233322;
	bh=nt0wBmAol6tMoem7ESVcPxXpXMmwnfJWNcB17dRflFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VMCMGf41drt8ib6eRyj4uH8cl/ZAhfszPYZyDAS80NNABs68YSgq60CPzWBpXCba4
	 pGhU3rm4oEIwEiLdnuUd43wCR5eFEtTjfpK8jsdJoDIPv+/39w7LvJ2yQYbcaDrYVi
	 LJogoDLPZdXy0dBXH+wXaneam8oozMzR3Qt0fGS69b3wFvHv1ZOOVr0kL9qDNUhTK3
	 EBt336Qp4naTEoHuXKa8EsvHiruDagdr8fctEsCLYgQEOrilMbP8ov/RDO7Cjy6Clx
	 Q7p6I0bNEJbGdgv4axsga6uFoxh3ob/8iZTdWiI9oRX00cIdo+uouwHll/iclnRAi+
	 +g0aiwiHv1cag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4vtf1ylTz4xQV;
	Fri, 13 Sep 2024 23:15:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Rob
 Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 <linuxppc-dev@lists.ozlabs.org> 
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
In-Reply-To: <20240906-of-address-overflow-v1-1-19567aaa61da@linutronix.de>
References: <20240906-of-address-overflow-v1-1-19567aaa61da@linutronix.de>
Date: Fri, 13 Sep 2024 23:15:21 +1000
Message-ID: <87plp7r8ye.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
> The members "start" and "end" of struct resource are of type
> "resource_size_t" which can be 32bit wide.
> Values read from OF however are always 64bit wide.
>
> Refactor the diff overflow checks into a helper function.
> Also extend the checks to validate each calculation step.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/of/address.c | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 7e59283a4472..df854bb427ce 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const __be32=
 *range, int na, int ns,
>=20=20
>  #endif /* CONFIG_PCI */
>=20=20
> +static int __of_address_resource_bounds(struct resource *r, u64 start, u=
64 size)
> +{
> +	u64 end =3D start;
> +
> +	if (overflows_type(start, r->start))
> +		return -EOVERFLOW;
> +	if (size =3D=3D 0)
> +		return -EOVERFLOW;
> +	if (check_add_overflow(end, size - 1, &end))
> +		return -EOVERFLOW;
> +	if (overflows_type(end, r->end))
> +		return -EOVERFLOW;
=20
This breaks PCI on powerpc qemu. Part of the PCI probe reads a resource
that's zero sized, which used to succeed but now fails due to the size
check above.

The diff below fixes it for me.

It leaves r.end =3D=3D r.start, which is fine in my case, because the code
only uses r.start.

And it seems more sane than the old code which would return
end =3D start - 1, for zero sized resources.

cheers


diff --git a/drivers/of/address.c b/drivers/of/address.c
index df854bb427ce..a001e789a6c4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -204,9 +204,7 @@ static int __of_address_resource_bounds(struct resource=
 *r, u64 start, u64 size)
=20
 	if (overflows_type(start, r->start))
 		return -EOVERFLOW;
-	if (size =3D=3D 0)
-		return -EOVERFLOW;
-	if (check_add_overflow(end, size - 1, &end))
+	if (size > 0 && check_add_overflow(end, size - 1, &end))
 		return -EOVERFLOW;
 	if (overflows_type(end, r->end))
 		return -EOVERFLOW;

