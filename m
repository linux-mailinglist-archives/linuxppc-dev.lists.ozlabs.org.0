Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4A92FA46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:28:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V5PMfiYd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL9qT3s2Rz3dLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V5PMfiYd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL9p9181gz3dBv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:27:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720787233;
	bh=4Vofh3nmGXbIRlscqKm0va6vapnmleNLgiTWfYE/btk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V5PMfiYdHjm+q2zhG//PSDhbZxYuVaB/yWMCbKSb7YOZfB+YWffV8XUiFqmdJ+g+g
	 /c6au7q5mVyEiJqj/pof4+FidWHw+Du77hF2RZBUglRFE//ThOFJQoTQqe6IUDIms0
	 EJtVxRE/YpKncLPLY3tEkgutqHapFx9r3ZbshogxWBeGW6TCDCrXR4R0Buv6MKHije
	 KTpMYbXdOCztwkqQk6lsuRJIWQqLg3eSog71GgUac4/5NigrRoqMUh20HyBAIopkIP
	 3nRohakxnY0DT2cFAWUh7IiAjkavAFL6SZk+7SHz47UD7rpIBs0rGhqqwLOIEu+Cdo
	 m8oeN6kVZK6ZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL9p73qQHz4x1V;
	Fri, 12 Jul 2024 22:27:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, Mark Brown
 <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to
 get a channel from a phandle list
In-Reply-To: <9423930f-8cb8-4b31-927f-a93b1006fb18@cs-soprasteria.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
 <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
 <87a5ixkghq.fsf@mail.lhotse>
 <9423930f-8cb8-4b31-927f-a93b1006fb18@cs-soprasteria.com>
Date: Fri, 12 Jul 2024 22:27:11 +1000
Message-ID: <87v81a4wyo.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LEROY Christophe <christophe.leroy2@cs-soprasteria.com> writes:
> Le 04/07/2024 =C3=A0 05:01, Michael Ellerman a =C3=A9crit=C2=A0:
>> Mark Brown <broonie@kernel.org> writes:
>>> On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
>>>> qmc_chan_get_byphandle() and the resource managed version retrieve a
>>>> channel from a simple phandle.
>>>>
>>>> Extend the API and introduce qmc_chan_get_byphandles_index() and the
>>>> resource managed version in order to retrieve a channel from a phandle
>>>> list using the provided index to identify the phandle in the list.
>>>
>>> These two PowerPC patches seem trivial enough and have got no response,
>>> unless someone objects I'll go ahead and apply them.
>>=20
>> Ack.
>>=20
>> MAINTAINERS says:
>>=20
>> FREESCALE QUICC ENGINE LIBRARY
>> M:      Qiang Zhao <qiang.zhao@nxp.com>
>> L:      linuxppc-dev@lists.ozlabs.org
>> S:      Maintained
>> F:      drivers/soc/fsl/qe/
>> F:      include/soc/fsl/qe/
>>=20
>> But I see no email from that address since January 2021:
>>=20
>>    https://lore.kernel.org/all/?q=3Df%3Aqiang.zhao%40nxp.com
>>=20
>> And actually drivers/soc/fsl was marked orphan in April, maybe this
>> should be also.
>>=20
>> Or does Herve want to take over maintaining it?
>
> We had some discussion about that in April, see=20
> https://lore.kernel.org/linuxppc-dev/20240219153016.ntltc76bphwrv6hn@skbu=
f/T/#mf6d4a5eef79e8eae7ae0456a2794c01e630a6756
>
> Herv=C3=A9 has some of our hardware for a limited period of time because =
he=20
> is doing some implementation for us, but he won't keep that hardware on=20
> the long run.
>
> I will send a patch to take over maintaining drivers/soc/fsl/

Thanks.

cheers
