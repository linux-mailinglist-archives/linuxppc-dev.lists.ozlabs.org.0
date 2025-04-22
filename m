Return-Path: <linuxppc-dev+bounces-7883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA31A95F0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 09:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhYNm2HzFz3bpp;
	Tue, 22 Apr 2025 17:13:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b8"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745305992;
	cv=none; b=oUEyjJ1Q0rPEVzaVFVTRuUPi0vYst3uVtgtGqylhSMzEMqlPKglB0p/IbKrdZ2itcWyrYBlS7oSYwouWeCIRH3zwRIt7eUXWWw91Ajdyq+6Avq70hRAkbooHtAPSKhp4rsMKQJnQcPmDfPJVyOy4R5ZGdWBZ9dvzWv8pC3RRrhW7L/Stwa/zdF1YV2YAWrIWG+NwBBuVC8T4he4panR0C00O5TSACKPlGkR4yO6WIRFnRfLRjyRBMPDoxt47LxFraFcdDrNPOYcSY88O4Eu/QsH+5BOMU88ji7nD4kYdzXbuybu/ZT6/rV9ovVWnO9wZjPwD9xF31JjGwa5xKAjyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745305992; c=relaxed/relaxed;
	bh=LbqggsXwDyUYm2uQ6epMzFGLyRuXLAMNpcV+2v8LP2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJwbmayr53EFYrOVE0bTH3fUPqSB4pVwT2JmVbUtT36CuV8yPfJHtGt/gXx7cG4jg5q7wcl4UPU/Einjf/ults+GIcXTaI/wK80qiq5BrdTV3qp4VrM/Sz943X32FcqfTqPdyPD9qZxZj4KducSGGJKF4oEpEJIsRfIkGZvxA/v7V/OBC/UU6M/0zdbN2umeS9/kQtX/SjzFtCE/sUcuT0EfiHMnSTqSPB7tPCzhi/yeoXhxXDkyGyinlAt4Eio53jhaQlb7xhFkesvOq5xlZD3KQDfpCko+MxJQ90c6pOSiJ4jxHV/34VxuZRZugOXBhL9sAuyiT+/oXmVdgYVfKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=2001:41d0:1004:224b::b8; helo=out-184.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b8; helo=out-184.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhYNl0Lm1z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 17:13:08 +1000 (AEST)
Date: Tue, 22 Apr 2025 03:12:43 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, Zhang Wei <zw@zh-kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Message-ID: <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, 
	Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ibrmx66igfcorlg4"
Content-Disposition: inline
In-Reply-To: <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ibrmx66igfcorlg4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
MIME-Version: 1.0

On Tue, Apr 22, 2025 at 08:34:55AM -0500, Arnd Bergmann wrote:
> On Tue, Apr 22, 2025, at 04:49, Ben Collins wrote:
> > On 64-bit QorIQ platforms like T4240, the CPU supports 40-bit addressing
> > and memory configurations > 64GiB. The fsldma driver is limiting itself
> > to only 64GiB in all Elo configurations.
> >
> > Setup fsldma driver to make use of the full 40-bit addressing space,
> > specifically on the e5500 and e6500 CPUs.
>
=2E..
>=20
> - The driver just writes the DMA address as a 64-bit register,
>   so most likely the DMA device can in fact do wider addressing,
>   and any limitation is either in the bus or the available
>   memory
>=20
> - SoCs that don't set a dma-ranges property in the parent bus
>   are normally still capped to 32 bit DMA. I don't see those
>   properties, so unless there is a special hack on those chips,
>   you get 32 bit DMA regardless of what DMA mask the driver
>   requests

I've yet to see a dma-ranges property in any of the Freescale PowerPC
device trees.

I'll check on this, but I think it's a seperate issue. The main thing is
just to configure the dma hw correctly.

> - If there are chips that have more than 64GB of RAM installed
>   but have a limitation in the way the DMA engine is wired
>   up to 36 bits, that should be reflected in the dma-ranges
>   property, not the device driver.
>=20
> - If the limitation is indeed specific to the version of the
>   IP block, this would normally need to be detected based on
>   the compatible string of the DMA engine itself, not a compile
>   time setting.

So a little research shows that these 3 compatible strings in
the fsldma are:

fsl,elo3-dma:		40-bit
fsl,eloplus-dma:	36-bit
fsl,elo-dma:		32-bit

I'll rework it so addressing is based on the compatible string.

--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--ibrmx66igfcorlg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHQWsACgkQXVpXxyQr
Is9OBhAApnJBeKJ4ASuaAIAefdwxjwHiccr/SM7ZbzHesQxOQmonqT6U0//RHjJu
aaHhcwOPfBnSvpdylugW67fLi5F96vE4RtVlrli55lm98XL3xnGdhJcDTGXALz2h
omEHO+NlQYcaVj73HzeT7mlrMY5akw0pryfidJii+jx17JIV8eIyR3pjCPXfaDbT
m6FB/n84fcuRhwhsCIC2NGV8sIe1jBw8gxY2Non1HG8j7tLHmOzRPblu8c31qbMC
seeDW61e9JgH7r5Pj1Y9zvNVsJkXstyA+AWGz2TAB2n3jw4DgorQSFZt924Hwh4P
rdVjqH+/AxqN8+xLDAIVvvH+JsIwC6GA8Z4E9N565ntR8knxfk+kLWoRCNiyGizK
cl4ZTU6sXcyF7tR24hI4ma1ozwaoXf5W/vN6qx1gy2v/FQCD0m2BhzbfWxcwK3Cg
QrFI3IXyzU7d1W6ZVMaCwz1AvN6ZJNxNSF4fzexMUKEDLYu5PnT8dnFDpTfJsWrB
T8gskXv868OOIkaHkj5ujOgYUtLx9EURcG8Lc56kB9p4CL/J1Rzz/org8XYqClDL
J0/aDQ8Fy8RmPaEgzbPaBtRztG5jaVc/PsDVsT0+jKOVWd1C62uxBC+9bIUlR7S+
5rcwfAnkZF9T6Q0qs5inHlRyG6QeVZa14ZKeEejSQnDVc2oJ/70=
=UA0A
-----END PGP SIGNATURE-----

--ibrmx66igfcorlg4--

